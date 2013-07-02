Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 060606AE77
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2013 06:46:30 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id p58so4038417wes.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Jul 2013 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=1P8z4n5Wmb5b4h1HTibuandpda8Y5YD+0RadwFi7eOg=;
	b=u80cdzfa4MQYYCsn6hnnafU0w6+zBquRQHNduJ+/juxiTzVvtumy1zK5TU+/Tf6jfZ
	tDhPdCDw+gWb5vdOvKFLBhX2LTFT6VZGxUVj5+gZkA6iD1I4mfkXrAdMQdv7UEIvoeBm
	Ep1IOoDpm2znwgUdnDFVPn9N7E+oJ33Myavxo73XTXrsjc40INZjBpQaOj13GBUu8Jr3
	V/zLLvb7RDJJRG1+olw2LdVAFKEIkmPg3RovwggE++oyPvL6s/c+qPxIbpzCAEqTPAtJ
	TiiHXw5CytsuCd0+G7lEyTNpyIJMxXwxSToWuvjl5TIkgBn6TZtMZCK2ephaEDSfajYL
	myLw==
X-Received: by 10.180.74.197 with SMTP id w5mr14439277wiv.20.1372747591535;
	Mon, 01 Jul 2013 23:46:31 -0700 (PDT)
Received: from localhost.localdomain (ip-178-202-232-2.unitymediagroup.de.
	[178.202.232.2])
	by mx.google.com with ESMTPSA id o10sm18527218wiz.5.2013.07.01.23.46.28
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 23:46:29 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  2 Jul 2013 08:46:36 +0200
Message-Id: <1372747597-26346-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 1/2] abiword: remove abiword.inc - it is of no use
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2013 06:46:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/abiword/abiword.inc |   64 --------------------------
 1 files changed, 0 insertions(+), 64 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/abiword/abiword.inc

diff --git a/meta-gnome/recipes-gnome/abiword/abiword.inc b/meta-gnome/recipes-gnome/abiword/abiword.inc
deleted file mode 100644
index 39c590c..0000000
--- a/meta-gnome/recipes-gnome/abiword/abiword.inc
+++ /dev/null
@@ -1,64 +0,0 @@
-DESCRIPTION = "AbiWord is free word processing program similar to Microsoft(r) Word"
-SECTION = "gnome/office"
-HOMEPAGE = "http://www.abiword.org""
-LICENSE = "GPLv2"
-
-DEPENDS     = "libgsf libglade libfribidi libxml2 wv"
-RRECOMMENDS_${PN}    = "glibc-gconv-ibm850 glibc-gconv-cp1252 \
-               glibc-gconv-iso8859-15 glibc-gconv-iso8859-1"
-
-# Share this file between recipes that use cvs and that pull tarballs
-# (one day change this to differentiate automatically based on PV and set the
-# SRC_URI and S var directly)
-RELURI = "http://www.abiword.org/downloads/abiword/${PV}/source/abiword-${PV}.tar.gz"
-RELSRC = "${WORKDIR}/abiword-${PV}/abi"
-
-CVSURI = "cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=abi"
-CVSSRC = "${WORKDIR}/abi"
-
-#want 2.x from 2.x.y for the installation directory
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
-
-FILES_${PN} += " \
-    ${datadir}/icons/* \
-    ${datadir}/mime-info \
-    ${datadir}/abiword-${SHRT_VER}/glade \
-    ${datadir}/abiword-${SHRT_VER}/system.profile-en \
-    ${datadir}/abiword-${SHRT_VER}/system.profile-en-GB \
-"
-
-#    ${datadir}/abiword-${SHRT_VER}/templates/normal.awt \
-#    ${datadir}/abiword-${SHRT_VER}/templates/normal.awt-en_GB \
-
-inherit autotools pkgconfig
-
-PARALLEL_MAKE = ""
-
-# This is a minimalistic AbiWord build
-#
-# if you are planning to build plugins, make sure to comment out the
-# --disable-exports options
-
-EXTRA_OECONF = " --enable-embedded=poky    \
-    --disable-printing \
-    --with-sys-wv \
-    --disable-exports \
-    --disable-spellcheck"
-
-# TODO -- refactor this, so that instead of two strings and profiles
-# packages we have lots of locale packages, each with a set of strings and
-# a profile
-#
-PACKAGES += " abiword-strings abiword-systemprofiles"
-
-FILES_abiword-strings += "${datadir}/abiword-${SHRT_VER}/strings"
-FILES_abiword-systemprofiles += "${datadir}/abiword-${SHRT_VER}/system.profile*"
-
-# AbiWord configure.ac does not play nicely with autoreconf
-# so use the autogen.sh script that comes with AbiWord
-#
-do_configure() {
-    cd ${S}
-    export NOCONFIGURE="no"; ./autogen.sh
-    oe_runconf
-}
-- 
1.7.6.5


