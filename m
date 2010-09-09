Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Otdep-0004IZ-4I
	for openembedded-devel@openembedded.org; Thu, 09 Sep 2010 11:43:04 +0200
Received: by gya6 with SMTP id 6so560107gya.6
	for <openembedded-devel@openembedded.org>;
	Thu, 09 Sep 2010 02:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=k/KIQU2IZVRJ4NwQlw8SHR21TNOYZrdicHbm/fuuJYk=;
	b=Yk9Ox7bRKaEUWB1c2qpqUJbGmEN4uqhlRv2MnJx7Hhk2rl7huPYwCHsCOfPri2tqF2
	IN0MsYTV51aiGrT/S+VOl4Lk6yoiq+RCMl1FmCPmJyv8gtvhfSBL+ninkmb8lQj2TCi5
	HBqTB4cATFTHES4ygcG7N1nLfluAl96xdCa4g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=TIdwQ88tm1chuMlJZ3Nks3XaCdFiUXBtHTT1yENQ4jkRRjkq4AoIaFP+7P9WZ+FIrX
	nV6iUu0xaERNOhsX74QUtyE/OUFGLSMu9Zg7vjZCrFmZnp0aa6kOnaOdkIvU1a8aoGbo
	x2+H8dnG1EpC/rkP/Rt8nOVKJPy7D+bb8buJI=
MIME-Version: 1.0
Received: by 10.150.190.10 with SMTP id n10mr219168ybf.286.1284025340209; Thu,
	09 Sep 2010 02:42:20 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Thu, 9 Sep 2010 02:42:20 -0700 (PDT)
Date: Thu, 9 Sep 2010 11:42:20 +0200
Message-ID: <AANLkTikamPAk9W64hf3HYX4effDwOovU=rvs=CiwccgS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: slugos/nslu2le/binutils build: fail
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
X-List-Received-Date: Thu, 09 Sep 2010 09:43:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was asked to give slugos as spin on the autobuilder, and as slugos
still occupies a sweet spot in me I gave it a spin.
Unfoprtunately things did not build:

distro: slugos
machine: nslu2le
bitbake target: binutils
libc: glibc.

Failure is in building glibc.c:

| /home/hudson/jobs/FM_test/workspace/tmp/work/armv5te-linux-gnueabi/glibc-2.10.1-r36.1/build-arm-linux-gnueabi/libc_pic.os:
In function `faccessat':
| find_exidx.c:(.text+0x900e8): undefined reference to `fstatat64'
| collect2: ld returned 1 exit status
| make[1]: *** [/home/hudson/jobs/FM_test/workspace/tmp/work/armv5te-linux-gnueabi/glibc-2.10.1-r36.1/build-arm-linux-gnueabi/libc.so]
Error 1
| make[1]: Leaving directory
`/home/hudson/jobs/FM_test/workspace/tmp/work/armv5te-linux-gnueabi/glibc-2.10.1-r36.1/glibc-2.10.1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: package glibc-2.10.1-r36.1: task do_compile: Failed

I can imagine this has something to do with kernel headers, but didn't
investigate.

Frans


