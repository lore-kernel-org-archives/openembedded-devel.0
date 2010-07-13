Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYTFd-0006kF-LP
	for Openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 02:21:34 +0200
Received: by iwn34 with SMTP id 34so5324477iwn.6
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 17:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=ASR7PIMmpo7ZKKHR9zHhl2J0BHpu3x6QaouBjCYWK04=;
	b=e8WqsmUirkGLoYAPj+tlvz8LGbrgcZxjFyJ/owaKYKgHDjwzcKk3FYWYu9K2NsfMp5
	l+ykq3bcrupjKjtGHEk/874UerFipTBAsnzGY164hZfuL6/bxXDt7Q4OXYz11FCRcMI7
	bKi8U3iWQsnUDvAwiYcm5uhH5tYGOHrbm4LtY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=vj45J5TlX2kUByGrgbE3W4YOIpa88z6YXDwqF8Wk04nZpXVzdaj98MVU4BC7l5LbCd
	qzGaGR7NS0W2bNUPcmU3QxFlOvStra8dkaBzZVKU/vMWXAiRnF/NHoqtWgbggGPzXYHH
	5SpptFGFiXuElDqSzhgi9XWS3NwdssScyU7DY=
Received: by 10.231.39.134 with SMTP id g6mr15044557ibe.8.1278980198123; Mon, 
	12 Jul 2010 17:16:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.11.12 with HTTP; Mon, 12 Jul 2010 17:16:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jul 2010 17:16:18 -0700
Message-ID: <AANLkTikKXHiMfG0M0xe6VsLIrvD4ZaO-jlQ1vqTPrV90@mail.gmail.com>
To: openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gettext-native dependency and attr
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Jul 2010 00:21:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

While building from scratch I noticed that do_compile of attr failed
with below error

| make -C man2
| make[2]: Entering directory
`/scratch/oe/work/armv5te-oe-linux-uclibceabi/attr-2.4.44-r4/attr-2.4.44/po'
| /scratch/oe/sysroots/i686-linux/usr/bin/msgfmt -o cs.mo cs.po
| make[2]: /scratch/oe/sysroots/i686-linux/usr/bin/msgfmt: Command not found
| make[2]: *** [cs.mo] Error 127


msgfmt should come from gettext-native which is in the DEPENDS list
and it being compiled at same time.
and it has not yet been staged as can be seen

ERROR: TaskFailed event exception, aborting
ERROR: Task 1825
(/home/kraj/work/oe/openembedded/recipes/udev/attr_2.4.44.bb,
do_compile) failed with 256
Waiting for 1 active tasks to finish:
1: gettext-native-0.18-r1 do_populate_sysroot (pid 11943)

Why would do_compile of libattr start executing when a package in its
DEPENDS is still not staged in sysroot ?
I think it should wait until all the recipes in DEPENDS list are built
and staged. Ofcourse now if I restart
the build then it works fine because do_populate_sysroot finished for
gettext-native and the binary will be
found next time.

I am using .dev and bitbake from git master and
PARALLEL_MAKE="-j2"
BB_NUMBER_THREADS = "2"

Thanks
-Khem


