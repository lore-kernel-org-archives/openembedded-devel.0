Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1StxB5-0003OB-19 for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 10:42:43 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Stwzz-0008Tp-IF for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 10:31:15 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 10:31:15 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jul 2012 10:31:15 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 25 Jul 2012 10:30:55 +0200
Message-ID: <juoaru$dge$1@dough.gmane.org>
References: <1343204827-12239-1-git-send-email-mertsas@cisco.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:13.0) Gecko/20120614 Thunderbird/13.0.1
In-Reply-To: <1343204827-12239-1-git-send-email-mertsas@cisco.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [PATCH v2] cpufrequtils: Use CC, LD etc. that comes frmo OE.
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
X-List-Received-Date: Wed, 25 Jul 2012 08:42:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 25-07-12 10:27, Martin Ertsaas schreef:
> Problem with just setting CROSS, is that it will unset all the flags
> that OE sets in CC, like float-abi=hard.
> 

You're patch is missing the [meta-oe] tag, please read the README in the
meta-oe layer

> Signed-off-by: Martin Ertsaas <mertsas@cisco.com> --- 
> .../0001-Use-CC-LD-etc-that-comes-from-OE.patch    |   65
> ++++++++++++++++++++ .../cpufrequtils/0001-dont-unset-cflags.patch      |
> 30 +++++++++ .../cpufrequtils/cpufrequtils_008.bb               |    1 + 
> 3 files changed, 96 insertions(+), 0 deletions(-) create mode 100644
> meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
>
> 
create mode 100644
meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
> 
> diff --git
> a/meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
> b/meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
>
> 
new file mode 100644
> index 0000000..52b7c7e --- /dev/null +++
> b/meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
>
> 
@@ -0,0 +1,65 @@
> +From 214157f76d144fe77fe878f4f8ccb2fab116af1d Mon Sep 17 00:00:00 2001 
> +From: Martin Ertsaas <mertsas@cisco.com> +Date: Wed, 25 Jul 2012
> 09:35:24 +0200 +Subject: [PATCH] Use CC, LD etc that comes from OE. + 
> +Problem with just setting CROSS, is that it will unset all the flags
> that OE sets in CC, like float-abi=hard. + +Signed-off-by: Martin Ertsaas
> <mertsas@cisco.com> +--- + .../cpufrequtils/0001-dont-unset-cflags.patch
> |   30 ++++++++++++++++++++ + .../cpufrequtils/cpufrequtils_008.bb
> |    1 + + 2 files changed, 31 insertions(+), 0 deletions(-) + create
> mode 100644
> meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
>
> 
+
> +diff --git
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
>
> 
+new file mode 100644
> +index 0000000..fb2f07f +--- /dev/null ++++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
>
> 
+@@ -0,0 +1,30 @@
> ++--- git.old/Makefile	2012-04-17 13:29:46.280435340 +0200 +++++
> git/Makefile	2012-04-17 13:31:13.664433470 +0200 ++@@ -77,17 +77,7 @@
> INSTALL_PROGRAM = ${INSTALL} ++ INSTALL_DATA  = ${INSTALL} -m 644 ++
> INSTALL_SCRIPT = ${INSTALL_PROGRAM} ++ ++-# If you are running a cross
> compiler, you may want to set this ++-# to something more interesting,
> like "arm-linux-".  If you want ++-# to compile vs uClibc, that can be
> done here as well. ++-CROSS =
> #/usr/i386-linux-uclibc/usr/bin/i386-uclibc- ++-CC = $(CROSS)gcc ++-LD =
> $(CROSS)gcc ++-AR = $(CROSS)ar ++-STRIP = $(CROSS)strip ++-RANLIB =
> $(CROSS)ranlib ++-HOSTCC = gcc ++- +++HOSTCC = $(BUILD_CC) ++ ++ # Now we
> set up the build system ++ # ++@@ -95,7 +85,7 @@ HOSTCC = gcc ++ # set up
> PWD so that older versions of make will work with our build. ++ PWD =
> $(shell pwd) ++ ++-export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS
> LIB_OBJS +++export CFLAGS LDFLAGS LIB_OBJS ++ ++ # check if compiler
> option is supported ++ cc-supports = ${shell if $(CC) ${1} -S -o
> /dev/null -xc /dev/null > /dev/null 2>&1; then echo "$(1)"; fi;} +diff
> --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb +index
> 0cc3725..a7a48a8 100644 +---
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb ++++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb +@@ -9,6 +9,7
> @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0" + # SRC_URI =
> "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \ + +
> SRC_URI = "git://github.com/emagii/cpufrequtils.git \ ++
> file://0001-dont-unset-cflags.patch \ +           " + +
> CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' ==
> 'no']} " +-- +1.7.8.6 + diff --git
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
>
> 
new file mode 100644
> index 0000000..fb2f07f --- /dev/null +++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
>
> 
@@ -0,0 +1,30 @@
> +--- git.old/Makefile	2012-04-17 13:29:46.280435340 +0200 ++++
> git/Makefile	2012-04-17 13:31:13.664433470 +0200 +@@ -77,17 +77,7 @@
> INSTALL_PROGRAM = ${INSTALL} + INSTALL_DATA  = ${INSTALL} -m 644 +
> INSTALL_SCRIPT = ${INSTALL_PROGRAM} + +-# If you are running a cross
> compiler, you may want to set this +-# to something more interesting,
> like "arm-linux-".  If you want +-# to compile vs uClibc, that can be
> done here as well. +-CROSS =
> #/usr/i386-linux-uclibc/usr/bin/i386-uclibc- +-CC = $(CROSS)gcc +-LD =
> $(CROSS)gcc +-AR = $(CROSS)ar +-STRIP = $(CROSS)strip +-RANLIB =
> $(CROSS)ranlib +-HOSTCC = gcc +- ++HOSTCC = $(BUILD_CC) + + # Now we set
> up the build system + # +@@ -95,7 +85,7 @@ HOSTCC = gcc + # set up PWD so
> that older versions of make will work with our build. + PWD = $(shell
> pwd) + +-export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS ++export
> CFLAGS LDFLAGS LIB_OBJS + + # check if compiler option is supported +
> cc-supports = ${shell if $(CC) ${1} -S -o /dev/null -xc /dev/null >
> /dev/null 2>&1; then echo "$(1)"; fi;} diff --git
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb index
> 0cc3725..a7a48a8 100644 ---
> a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb +++
> b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb @@ -9,6 +9,7
> @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0" # SRC_URI =
> "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
> 
> SRC_URI = "git://github.com/emagii/cpufrequtils.git \ +
> file://0001-dont-unset-cflags.patch \ "
> 
> CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' ==
> 'no']} "
> 


MIssing PR bump

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQD66/MkyGM64RGpERAmmWAKCCokCeztDwerBWw24b3ACWQTI9aQCfcIEc
vWZLl3e6LgiOhMFx19vYqwg=
=g8tF
-----END PGP SIGNATURE-----



