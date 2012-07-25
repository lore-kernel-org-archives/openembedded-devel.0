Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Su0Eb-0006Z2-Sf
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 13:58:34 +0200
Received: by yhjj56 with SMTP id j56so542716yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 04:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=npPadXMJeGQjILO0ziNNpw7J1PE7uuY7pSWnHKASw+Q=;
	b=X1wXBPaw9W6zGhpw07vKtaKn+MIUL/Ms6M+XBCLoEPdRskcBp9K6xhfwj9z3MG8koE
	ki2KABIE6IfwByJDQpqyTZ0v8COpCBQp8aU2IM7vRiRWxjopPKo8nDp5zvoLwa7txjVU
	yRsEM+kHtVSgBpkmRfWwrCCaCZFUbQkIR/GNNucYUI9IsmnBySEp3wMkM/UyTS1RCklF
	AJYA/Kx+bTtXn3RlU2KLRfw+Vvgb3oeel8cLdHH3hprYgDcHAxlm5ZwkAHFlG/N6ByUt
	2GcjlDI2eefmOQuQnM7tF+Geu8ziTix/y3xNTS2BBSVG9N4qAgtMm/Gfru0CG5gDDhpf
	mSEw==
MIME-Version: 1.0
Received: by 10.42.70.136 with SMTP id f8mr24141344icj.28.1343216823786; Wed,
	25 Jul 2012 04:47:03 -0700 (PDT)
Received: by 10.64.9.165 with HTTP; Wed, 25 Jul 2012 04:47:03 -0700 (PDT)
Date: Wed, 25 Jul 2012 13:47:03 +0200
Message-ID: <CALbNGRT3ti_0SnBZ5AbKUPkhQQkHtUh=nOCGQRg1H741b_8KfA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: gtk+-native configure fails
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
X-List-Received-Date: Wed, 25 Jul 2012 11:58:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Ciao,

with the latest sources gtk+-nataive (and maybe also gtk+ - but I
don't get that far) configure fails with

| configure.in:1587: warning: PKG_PROG_PKG_CONFIG is m4_require'd but
not m4_defun'd
| aclocal.m4:1818: GTK_DOC_CHECK is expanded from...
| configure.in:1587: the top level
| configure.in:151: error: possibly undefined macro: dnl
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoconf
failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (see
/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/gtk+-native-2.24.8-r5/temp/log.do_configure.22156
for further information)

Supporting hints welcome :-)

Andreas


