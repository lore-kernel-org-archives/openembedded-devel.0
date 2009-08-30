Received: from [209.85.223.195] (helo=mail-iw0-f195.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mhaty-0005yn-Up
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 05:16:23 +0200
Received: by iwn33 with SMTP id 33so1312492iwn.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 19:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=U0BHdK/bTx/udmHZpI0SfwYElS6plTiC0IOYcRkFPW0=;
	b=wKNNWNHpMIDNmACDOEJwbh0eN/4yJypCUP2d8/McZ3XgV2ixihXylaSx3KXkEC9rXf
	tdaLpP3AWy8SOM73fxtCvUI3+p7fh5s4/JEIXedCuoId0uaAG56T1YaNvihG6q1jVE2M
	kdNzmTthSVLO997LgMdZK/jzZ6zjYDCN34/Ao=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=cFM7NsaM8Hh6HXHSWVgkZ8ur25PJizpn73y564rcat/EE0yGQBrSeq1SZhXTLl/fbp
	/y2IhNTZB3G7qztWr+su26SXDP9ja80KnJ/iaE2YK8e4Dk4RZ+JsTwVA3/yEXSI4eS9E
	lcbo0jxy982YuwCLi1svoSrZ/5F2EdPIRahC0=
Received: by 10.231.42.81 with SMTP id r17mr3660984ibe.50.1251601079996;
	Sat, 29 Aug 2009 19:57:59 -0700 (PDT)
Received: from localhost (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id 20sm246999pzk.13.2009.08.29.19.57.58
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 29 Aug 2009 19:57:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 29 Aug 2009 19:57:55 -0700
Message-Id: <1251601075-13228-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.6.3.3
Subject: [PATCH] uclibc: Pass ARCH=<TARGET_ARCH>" on make commandline.
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
X-List-Received-Date: Sun, 30 Aug 2009 03:16:23 -0000

Like linux kernel Git version of uclibc mandates that ARCH is passed
down from make instead of being computed magically. This will be
there in next release 0.9.31 of uclibc. Defining it on make
invocation for older releases is no harm.

Also move uclibc to use INC_PR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 recipes/uclibc/bfin-uclibc_svn.bb |    3 +--
 recipes/uclibc/uclibc.inc         |    4 +++-
 recipes/uclibc/uclibc_0.9.28.bb   |    3 +--
 recipes/uclibc/uclibc_0.9.29.bb   |    2 +-
 recipes/uclibc/uclibc_0.9.30.1.bb |    2 +-
 recipes/uclibc/uclibc_0.9.30.bb   |    2 +-
 recipes/uclibc/uclibc_git.bb      |    3 +--
 recipes/uclibc/uclibc_nptl.bb     |    2 +-
 8 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/recipes/uclibc/bfin-uclibc_svn.bb b/recipes/uclibc/bfin-uclibc_svn.bb
index 9305245..e5123ad 100644
--- a/recipes/uclibc/bfin-uclibc_svn.bb
+++ b/recipes/uclibc/bfin-uclibc_svn.bb
@@ -7,11 +7,10 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r5"
 PV = "${UCLIBC_BASE}+svnr${SRCREV}"
 
 require uclibc.inc
-
+PR = "${INC_PR}.0"
 PROVIDES_append_bfin = " virtual/${TARGET_PREFIX}libc-for-gcc "
 
 #recent versions uclibc require real kernel headers
diff --git a/recipes/uclibc/uclibc.inc b/recipes/uclibc/uclibc.inc
index 3c72366..2ed7d82 100644
--- a/recipes/uclibc/uclibc.inc
+++ b/recipes/uclibc/uclibc.inc
@@ -2,6 +2,7 @@ DESCRIPTION = "C library for embedded systems"
 LICENSE = "LGPL"
 SECTION = "libs"
 PRIORITY = "required"
+INC_PR = "r32"
 #
 # For now, we will skip building of a gcc package if it is a uclibc one
 # and our build is not a uclibc one, and we skip a glibc one if our build
@@ -79,7 +80,8 @@ UCLIBC_STAGE_PREFIX = "${STAGING_DIR_HOST}${layout_prefix}"
 OEMAKE_NO_CC = "'STRIPTOOL=true' 'LD=${LD}' \
 		'LOCALE_DATA_FILENAME=${UCLIBC_LOCALE_FILE}'"
 EXTRA_OEMAKE = "${OEMAKE_NO_CC} 'CC=${CC}' \
-		'HOSTCFLAGS=-I${STAGING_INCDIR_NATIVE}'"
+		'HOSTCFLAGS=-I${STAGING_INCDIR_NATIVE}' \
+		ARCH=`grep TARGET_ARCH ${S}/.config|sed -e 's/TARGET_ARCH=//g'`"
 EXTRA_OEMAKE_task_do_package = "${OEMAKE_NO_CC}"
 
 KERNEL_SOURCE = "${STAGING_INCDIR}"
diff --git a/recipes/uclibc/uclibc_0.9.28.bb b/recipes/uclibc/uclibc_0.9.28.bb
index aef0cd8..2e90939 100644
--- a/recipes/uclibc/uclibc_0.9.28.bb
+++ b/recipes/uclibc/uclibc_0.9.28.bb
@@ -1,6 +1,5 @@
-PR = "r18"
-
 require uclibc.inc
+PR = "${INC_PR}.0"
 
 # This is the correct KERNEL_SOURCE location, if the uClibc
 # fix_includes.sh script is run (see nokernelheader.patch below)
diff --git a/recipes/uclibc/uclibc_0.9.29.bb b/recipes/uclibc/uclibc_0.9.29.bb
index de98a63..1679ada 100644
--- a/recipes/uclibc/uclibc_0.9.29.bb
+++ b/recipes/uclibc/uclibc_0.9.29.bb
@@ -7,9 +7,9 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.29"
-PR = "r31"
 
 require uclibc.inc
+PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
diff --git a/recipes/uclibc/uclibc_0.9.30.1.bb b/recipes/uclibc/uclibc_0.9.30.1.bb
index 972b957..821e06e 100644
--- a/recipes/uclibc/uclibc_0.9.30.1.bb
+++ b/recipes/uclibc/uclibc_0.9.30.1.bb
@@ -7,9 +7,9 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.30.1"
-PR = "r4"
 
 require uclibc.inc
+PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
diff --git a/recipes/uclibc/uclibc_0.9.30.bb b/recipes/uclibc/uclibc_0.9.30.bb
index 4d58b89..2e18ab9 100644
--- a/recipes/uclibc/uclibc_0.9.30.bb
+++ b/recipes/uclibc/uclibc_0.9.30.bb
@@ -7,9 +7,9 @@
 # on whether the base patches apply to the selected (SRCDATE) svn release.
 #
 UCLIBC_BASE ?= "0.9.30"
-PR = "r7"
 
 require uclibc.inc
+PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
diff --git a/recipes/uclibc/uclibc_git.bb b/recipes/uclibc/uclibc_git.bb
index 0fac211..cdc5ae1 100644
--- a/recipes/uclibc/uclibc_git.bb
+++ b/recipes/uclibc/uclibc_git.bb
@@ -9,13 +9,12 @@
 UCLIBC_BASE ?= "0.9.30"
 SRCREV="6625518cd6894338937a74ca6b9187b7b8167b03"
 PV = "${UCLIBC_BASE}+gitr${SRCREV}"
-PR = "r1"
 DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
 require uclibc.inc
-
+PR = "${INC_PR}.0"
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
 #recent versions uclibc require real kernel headers
diff --git a/recipes/uclibc/uclibc_nptl.bb b/recipes/uclibc/uclibc_nptl.bb
index bdf7d9c..afb6347 100644
--- a/recipes/uclibc/uclibc_nptl.bb
+++ b/recipes/uclibc/uclibc_nptl.bb
@@ -9,12 +9,12 @@
 UCLIBC_BASE ?= "0.9.30"
 SRCREV="d57e6548d253a9efed91d72498aeda092fa265d2"
 PV = "${UCLIBC_BASE}+gitr${SRCREV}"
-PR = "r1"
 DEFAULT_PREFERENCE = "-1"
 #DEFAULT_PREFERENCE is 0 (empty), releases have a preference of 1 so take
 # precedence.
 
 require uclibc.inc
+PR = "${INC_PR}.0"
 
 PROVIDES += "virtual/${TARGET_PREFIX}libc-for-gcc"
 
-- 
1.6.3.3



