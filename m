Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1Stx89-0003IB-6d
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jul 2012 10:39:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=5877; q=dns/txt;
	s=iport; t=1343204894; x=1344414494;
	h=from:to:cc:subject:date:message-id;
	bh=5QPqh+i+ClF2wa8PH/uwhAFvPir1TrlCJ7tptevXvS4=;
	b=EmgkSDiJpbieODQgyQXQag3amcUZrFlDLt8U/jvxnXTEJu2tTUfiiPWE
	Dd8blnY2uKcKKxWG16/bw49P6sGzguIXf6M1WQKwdJjPQziWWu5mcF8u+
	sPbdMQHqb8pb8LKTeQyXS1KFs9xITk1Mp80LRevnZTsC3NUWF+MtY7AJB 0=;
X-IronPort-AV: E=Sophos;i="4.77,652,1336348800"; d="scan'208";a="75538424"
Received: from ams-core-1.cisco.com ([144.254.72.81])
	by ams-iport-2.cisco.com with ESMTP; 25 Jul 2012 08:27:07 +0000
Received: from Lan.cisco.com (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-1.cisco.com (8.14.5/8.14.5) with ESMTP id q6P8R72j029251;
	Wed, 25 Jul 2012 08:27:07 GMT
From: Martin Ertsaas <mertsas@cisco.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jul 2012 10:27:07 +0200
Message-Id: <1343204827-12239-1-git-send-email-mertsas@cisco.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH v2] cpufrequtils: Use CC, LD etc. that comes frmo OE.
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
X-List-Received-Date: Wed, 25 Jul 2012 08:39:41 -0000

Problem with just setting CROSS, is that it will unset all the flags that
OE sets in CC, like float-abi=hard.

Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
---
 .../0001-Use-CC-LD-etc-that-comes-from-OE.patch    |   65 ++++++++++++++++++++
 .../cpufrequtils/0001-dont-unset-cflags.patch      |   30 +++++++++
 .../cpufrequtils/cpufrequtils_008.bb               |    1 +
 3 files changed, 96 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
 create mode 100644 meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch

diff --git a/meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch b/meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
new file mode 100644
index 0000000..52b7c7e
--- /dev/null
+++ b/meta-oe/recipes-support/cpufrequtils/0001-Use-CC-LD-etc-that-comes-from-OE.patch
@@ -0,0 +1,65 @@
+From 214157f76d144fe77fe878f4f8ccb2fab116af1d Mon Sep 17 00:00:00 2001
+From: Martin Ertsaas <mertsas@cisco.com>
+Date: Wed, 25 Jul 2012 09:35:24 +0200
+Subject: [PATCH] Use CC, LD etc that comes from OE.
+
+Problem with just setting CROSS, is that it will unset all the flags that OE sets in CC, like float-abi=hard.
+
+Signed-off-by: Martin Ertsaas <mertsas@cisco.com>
+---
+ .../cpufrequtils/0001-dont-unset-cflags.patch      |   30 ++++++++++++++++++++
+ .../cpufrequtils/cpufrequtils_008.bb               |    1 +
+ 2 files changed, 31 insertions(+), 0 deletions(-)
+ create mode 100644 meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
+
+diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
+new file mode 100644
+index 0000000..fb2f07f
+--- /dev/null
++++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
+@@ -0,0 +1,30 @@
++--- git.old/Makefile	2012-04-17 13:29:46.280435340 +0200
+++++ git/Makefile	2012-04-17 13:31:13.664433470 +0200
++@@ -77,17 +77,7 @@ INSTALL_PROGRAM = ${INSTALL}
++ INSTALL_DATA  = ${INSTALL} -m 644
++ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
++ 
++-# If you are running a cross compiler, you may want to set this
++-# to something more interesting, like "arm-linux-".  If you want
++-# to compile vs uClibc, that can be done here as well.
++-CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
++-CC = $(CROSS)gcc
++-LD = $(CROSS)gcc
++-AR = $(CROSS)ar
++-STRIP = $(CROSS)strip
++-RANLIB = $(CROSS)ranlib
++-HOSTCC = gcc
++-
+++HOSTCC = $(BUILD_CC)
++ 
++ # Now we set up the build system
++ #
++@@ -95,7 +85,7 @@ HOSTCC = gcc
++ # set up PWD so that older versions of make will work with our build.
++ PWD = $(shell pwd)
++ 
++-export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS
+++export CFLAGS LDFLAGS LIB_OBJS
++ 
++ # check if compiler option is supported
++ cc-supports = ${shell if $(CC) ${1} -S -o /dev/null -xc /dev/null > /dev/null 2>&1; then echo "$(1)"; fi;}
+diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+index 0cc3725..a7a48a8 100644
+--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
++++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+@@ -9,6 +9,7 @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
+ # SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
+ 
+ SRC_URI = "git://github.com/emagii/cpufrequtils.git \
++           file://0001-dont-unset-cflags.patch \
+           "
+ 
+ CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' == 'no']} "
+-- 
+1.7.8.6
+
diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
new file mode 100644
index 0000000..fb2f07f
--- /dev/null
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils/0001-dont-unset-cflags.patch
@@ -0,0 +1,30 @@
+--- git.old/Makefile	2012-04-17 13:29:46.280435340 +0200
++++ git/Makefile	2012-04-17 13:31:13.664433470 +0200
+@@ -77,17 +77,7 @@ INSTALL_PROGRAM = ${INSTALL}
+ INSTALL_DATA  = ${INSTALL} -m 644
+ INSTALL_SCRIPT = ${INSTALL_PROGRAM}
+ 
+-# If you are running a cross compiler, you may want to set this
+-# to something more interesting, like "arm-linux-".  If you want
+-# to compile vs uClibc, that can be done here as well.
+-CROSS = #/usr/i386-linux-uclibc/usr/bin/i386-uclibc-
+-CC = $(CROSS)gcc
+-LD = $(CROSS)gcc
+-AR = $(CROSS)ar
+-STRIP = $(CROSS)strip
+-RANLIB = $(CROSS)ranlib
+-HOSTCC = gcc
+-
++HOSTCC = $(BUILD_CC)
+ 
+ # Now we set up the build system
+ #
+@@ -95,7 +85,7 @@ HOSTCC = gcc
+ # set up PWD so that older versions of make will work with our build.
+ PWD = $(shell pwd)
+ 
+-export CROSS CC AR STRIP RANLIB CFLAGS LDFLAGS LIB_OBJS
++export CFLAGS LDFLAGS LIB_OBJS
+ 
+ # check if compiler option is supported
+ cc-supports = ${shell if $(CC) ${1} -S -o /dev/null -xc /dev/null > /dev/null 2>&1; then echo "$(1)"; fi;}
diff --git a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
index 0cc3725..a7a48a8 100644
--- a/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
+++ b/meta-oe/recipes-support/cpufrequtils/cpufrequtils_008.bb
@@ -9,6 +9,7 @@ SRCREV = "a2f0c39d5f21596bb9f5223e895c0ff210b265d0"
 # SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/cpufreq/cpufrequtils.git \
 
 SRC_URI = "git://github.com/emagii/cpufrequtils.git \
+           file://0001-dont-unset-cflags.patch \
           "
 
 CFLAGS_append_libc-uclibc = " ${@['-DNLS', '-UNLS']['${USE_NLS}' == 'no']} "
-- 
1.7.8.6



