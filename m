Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OlxxS-0001bE-9n
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:46:34 +0200
Received: by iwn38 with SMTP id 38so1436536iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=o+c958KCj8F66PIufCZRifCokBdHmkeHBahhVwI3Uz4=;
	b=bPS63r9ycYgSlu75oePdXijeTlB7lqtpRxTxUKfFlPQH/Zxubt6oU6z/y7h7hwa0rZ
	Dt8pOQtJdAklR4nZ1Nd6Go6xmsR2ll+TtaWPS5Ic8adQEaczB0EacnH3lbYazGNvwLt4
	sWpWgWFzVLrd2jPTE/wMSh6OobOkUtVSw5lZ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=AUqn4JBqchECTBJSxHlTwxkEAiDqcsQK7ElUqH5X7nPLUQBLUKsrkTELIiE89AMJ9c
	VhE11gOQBGMifrO85UbTGNZVbRwa2UryRcjgICzuO5LHONUKe8L/gBNsN3X6nlvUrppn
	tVmIVL/o0mIVFinJLFjO2BPd45phCUPFEl/uc=
MIME-Version: 1.0
Received: by 10.231.173.144 with SMTP id p16mr10611240ibz.108.1282196776007;
	Wed, 18 Aug 2010 22:46:16 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 22:46:15 -0700 (PDT)
Date: Thu, 19 Aug 2010 07:46:15 +0200
Message-ID: <AANLkTi=WhXyczDLG0_Lt66RxTKfQswu4dNfGAyRHyKja@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: cmake-native dependency
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
X-List-Received-Date: Thu, 19 Aug 2010 05:46:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Yesterday I noticed a cmake error due to pstaging on boost and
usbmuxd. I noticed cmake-native was not in the dependency list, so I
added it. However after doing so Koen told me that this dependency is
automatically added by
inherit cmake.

Questions:
- what to do next (options: leave as is, revert commit (probably not a
good idea as that would decrease PR), or undo change with a separate
edit (no PR bump needed).
- should we note somewhere what dependencies are included by inherits
(e.g. I was unaware that inherit cmake would drag in cmake-native, so
I guess this will at least for some others be the case)
E.g. we could do something like
inherit cmake # adds dependency to cmake-native
in the bb files that inherit cmake.

Your suggestions are appreciated.

Frans


