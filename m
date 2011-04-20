Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QCTGN-0005vU-OS
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Apr 2011 10:59:55 +0200
Received: by eye27 with SMTP id 27so147590eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Apr 2011 01:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=N7iIpGhRbe6tiffdD1Z39A1lId6YvaO885c0hTykrWo=;
	b=QoobpkF1cnWDK/wRuzuDKTMAgI3ZLxVGtjfSFPhtLNAHgVqVVs0wbmAazID7wNwdLV
	S/X666ai3egN3QaqULVJQKtqMPuQp6EGDMMHVk833w3LJILh4NfRgRMzn/xFVj0N22Bu
	2F0+WkmmyQE63jmpCJNV2OWFCBTpGxif3zM5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=fn8l+2aPYNBN31W/UxUGbK/WbR+LxYmBGAqN9VdCGDQX+gDqpInHPeoK0gAvIOvljG
	aPrRrh6pIL/eXVXtb5antpLMFSFrOHndb7TW+XD7LKnrw7x4ongmoAU/QSRFH3IMLUvf
	PNy7qTp8w/mA2TvRxBtWfeF7f9drednlFYS8I=
Received: by 10.14.131.203 with SMTP id m51mr2522001eei.234.1303289853473;
	Wed, 20 Apr 2011 01:57:33 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id q53sm500641eeh.11.2011.04.20.01.57.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Apr 2011 01:57:32 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Apr 2011 10:57:29 +0200
Message-Id: <c7f3c39da393b9259fb84c14d99f54b734869b86.1303289630.git.michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1303289630.git.michael.lippautz@gmail.com>
References: <cover.1303289630.git.michael.lippautz@gmail.com>
Subject: [oe-meta][PATCHv2] 1/3] libnet: Clean and upgrade (see below)
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
X-List-Received-Date: Wed, 20 Apr 2011 08:59:55 -0000

* libbnet upstream on packetfactor is dead
  using https://github.com/sam-github/libnet instead
* Move to version 1.1.5
* Dropped patches (not needed): support-uclibc, new-autotools
* Added LIC_FILES_CHKSUM
* Removed useless do_install_append, works automatically
* Not building statically anymore
* Should be compatible with old v1.1 versions

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 .../libnet/libnet-1.1.5/fix-endianess-test.patch   |   38 ++++++++++++++++++++
 .../recipes-connectivity/libnet/libnet_1.1.5.bb    |   24 ++++++++++++
 2 files changed, 62 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
 create mode 100644 meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb

diff --git a/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch b/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
new file mode 100644
index 0000000..4d8697d
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet-1.1.5/fix-endianess-test.patch
@@ -0,0 +1,38 @@
+Use autoconf's endian check instead of the locally defined check
+so that we can determine the endianess without having to compile
+a program.
+
+Idea from http://www.security-lists.org/lists/libnet/2003/03/00001.html
+
+Also remove the old test from aclocal.m4.
+
+Rebased for libnet-1.1.5 on 2011/04/19.
+
+--- a/configure.in	2010-11-03 00:59:21.000000000 +0100
++++ b/configure.in	2011-04-19 17:08:47.087712604 +0200
+@@ -6,6 +6,7 @@
+ dnl
+ dnl Process this file with autoconf to produce a configure script.
+ 
++AC_PREREQ(2.52)
+ AC_INIT(libnet, 1.1.5)
+ AC_MSG_RESULT(beginning autoconfiguration process for libnet-${PACKAGE_VERSION} ...)
+ AC_CANONICAL_SYSTEM
+@@ -39,7 +40,16 @@
+ dnl And some custom things
+ dnl
+ 
+-AC_LIBNET_ENDIAN_CHECK
++AC_C_BIGENDIAN([
++ AC_DEFINE(LIBNET_BIG_ENDIAN)
++ ENDIANESS="LIBNET_BIG_ENDIAN"
++ LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_BIG_ENDIAN"
++],[
++ AC_DEFINE(LIBNET_LIL_ENDIAN)
++ ENDIANESS="LIBNET_LIL_ENDIAN"
++ LIBNET_CONFIG_DEFINES="$LIBNET_CONFIG_DEFINES -DLIBNET_LIL_ENDIAN"
++], AC_MSG_WARN(cannot detect endianess. try setting ac_cv_c_bigendian to yes or no)) 
++
+ dnl AC_LBL_LIBRARY_NET
+ 
+ AC_SUBST(ENDIANESS)
diff --git a/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
new file mode 100644
index 0000000..ec426a5
--- /dev/null
+++ b/meta-oe/recipes-connectivity/libnet/libnet_1.1.5.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "A packet dissection and creation library"
+# libnet at packetfactory.net is dead
+HOMEPAGE = "https://github.com/sam-github/libnet"
+SECTION = "libs"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://README;md5=533bea47338d490e86744c6a0c5692e7"
+DEPENDS = "libpcap"
+# There are major API changes beween libnet v1.0 and libnet v1.1
+PROVIDES = "libnet-1.1"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/libnet-dev/${PN}-${PV}.tar.gz \
+           file://fix-endianess-test.patch"
+
+SRC_URI[md5sum] = "a9bc1d75a610efcfee200d3e28d8eb8f"
+SRC_URI[sha256sum] = "75588f8d1232e1df34eccf2dba5e66be197b345a07fae80d8275db994496a20d"
+
+S = "${WORKDIR}/${PN}-${PV}"
+
+inherit autotools binconfig
+
+do_configure_prepend() {
+        rm -f aclocal.m4 Makefile.am ltmain.sh
+}
-- 
1.7.3.4



