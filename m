Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1One6D-0006zW-0w
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Aug 2010 22:58:45 +0200
Received: by ywa8 with SMTP id 8so1403621ywa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 13:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=g1VAYU4ksg+7g6lXpg7zbzk3XKz0dCZLIn1FhLhk7Hg=;
	b=pEouQTk28lX3TfXEr0m0B0WQl/zp3uHduYK5g57BW3Xa1J1G9N87Ww4gGfqOoLTSeZ
	CoMuy8hf0rnbFG/4rKIqLfjQupPHeMA6TEMzYI8hb7IoOJBG2ComruRYFhpUDtg9jRbp
	CTDJZbIHl/uUBtM/dJlVOF8oKq2W/GlBsAUfo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=g6K0+lpuO4wJbmbVcj1uyJ4AFCY1T/E2YpjNzUb0f+nlSHs+US92d4peOgNT/HDVF7
	Dj8iD1ggJC6wG5buQN7x3T5gTrKPYcCOCuwKYZp4Rm96BAGvitvmIMVL9x3s/RC1TjmO
	esD4w11hE/2fP6CiaY2jTdOTYvOf+KkNfmQXk=
MIME-Version: 1.0
Received: by 10.90.103.17 with SMTP id a17mr3923818agc.28.1282597087131; Mon,
	23 Aug 2010 13:58:07 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Mon, 23 Aug 2010 13:58:07 -0700 (PDT)
In-Reply-To: <4C72C920.7080709@tycoelectronics.com>
References: <4C72C920.7080709@tycoelectronics.com>
Date: Mon, 23 Aug 2010 22:58:07 +0200
Message-ID: <AANLkTi=kCVt_+xBF+r400Nm6AXuApGk1ceuHVEim=K1c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: several recipes give a link error: libc.so, needed by libgcc_s.so, not found
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
X-List-Received-Date: Mon, 23 Aug 2010 20:58:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/23 Jay Snyder <jay.snyder@tycoelectronics.com>:
> I am getting the following warning (I assume it is a warning, because they
> all seem to produce working executables) for several recipes (rxvt-unicode
> shown):
>
> ./rxvt-unicode-7.9-r1/temp/log.do_compile.9530:44:/home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/bin/ld:
> warning: libc.so, needed by
> /home/oe/build-2010-07-29/tmp/sysroots/x86_64-linux/usr/lib/gcc/i686-angstrom-linux/4.3.3/../../../../i686-angstrom-linux/lib/libgcc_s.so,
> not found (try using -rpath or -rpath-link)
>
> The following recipes all exhibit this error:
>
> qt4-x11-free-4.6.3-r19.2
> gs-8.64-r2
> schroedinger-1.0.9-r0
> gtk+-2.20.1-r8.1
> libsndfile1-1.0.21-r1
> mysql-4.1.22-r6
> libmusicbrainz-3.0.2-r1
> cups-1.4.3-r2
> rxvt-unicode-7.9-r1
> gnutls-2.8.6-r10.0
>
> Also, anything I attempt to build with the above mentioned qt4-x11-free also
> produce the same warning.
>
> There is a file, libc.so in the
> /home/oe/build-2010-07-29/tmp/sysroots/i686-angstrom-linux/usr/lib path,
> which IS in an -Wl,rpath= argument being passed to gcc (or g++) (and
> subsequently to the linker).
>
> This problem didn't occur on a git-pull from December 4, 2009, but does on a
> July 29,2010 pull.
>
I have seen the same message for libusb both with gcc 4.4.4 and 4.3.3
Note that libc.so is in usr/lib while the lib.so.6 file is in lib.
No idea if that is relevant.

libc.so contains:
frans@linux-suse:~/oe/tmp_angstrom/sysroots> cat
./armv7a-angstrom-linux-gnueabi/usr/lib/libc.so
/* GNU ld script
   Use the shared library, but some functions are only in
   the static library, so try that secondarily.  */
OUTPUT_FORMAT(elf32-littlearm)
GROUP ( /lib/libc.so.6 /usr/lib/libc_nonshared.a  AS_NEEDED (
/lib/ld-linux.so.3 ) )

No idea if these should be paths in sysroots (I'm not a dynamic linking expert).

Frans


