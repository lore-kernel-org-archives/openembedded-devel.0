Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 33EFC6B25F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 13:16:31 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,772,1389740400"; d="scan'208";a="43654884"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 01 Apr 2014 15:16:31 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Tue, 1 Apr 2014 15:16:31 +0200
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Tue, 1 Apr 2014 15:16:30 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 1 Apr 2014 15:14:52 +0200
Message-ID: <1396358092-9738-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
References: <1395326878-6726-1-git-send-email-Matthieu.Crapet@ingenico.com>
MIME-Version: 1.0
Subject: [OE-core][PATCH v2] open-vcdiff: add new recipe for version 0.8.3
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
X-List-Received-Date: Tue, 01 Apr 2014 13:16:34 -0000
Content-Type: text/plain

From: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>

This is Google's implementation of VCDIFF (RFC 3284) delta compression.
It's more flexible than Xdelta3 (as a developer point of view).

v2 patch:
State of bitbake world, Failed tasks 2014-03-29
reported a do_configure error:

| aclocal: error: non-option arguments are not accepted: '\'.

configure.ac file is quite out of date. Submitted patch upstream:
http://code.google.com/p/open-vcdiff/issues/detail?id=43
Note: autoupdate could be considered later...

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 .../open-vcdiff/files/aclocal-amflags-fix.patch    | 33 ++++++++++++++++++++++
 .../open-vcdiff/open-vcdiff_0.8.3.bb               | 19 +++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
 create mode 100644 meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb

diff --git a/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
new file mode 100644
index 0000000..cd1efd7
--- /dev/null
+++ b/meta-oe/recipes-support/open-vcdiff/files/aclocal-amflags-fix.patch
@@ -0,0 +1,33 @@
+Fix this error:
+
+| aclocal: error: non-option arguments are not accepted: '\'.
+
+Starting from commit v1.11-662-g52246cc, when given non-option arguments, aclocal rejects them, instead of silently ignoring them.
+
+Declare ACLOCAL_AMFLAGS as a single line because autoreconf can't handle multiline.
+
+Notice that ACLOCAL_AMFLAGS is deprecated.
+In configure.ac, AC_CONFIG_MACRO_DIRS should be used (instead of AC_CONFIG_MACRO_DIR) but requires automake 1.13+.
+
+Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 5c765c7..f4295a6 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,7 @@
+ ## Process this file with automake to produce Makefile.in
+ 
+ # Make sure that when we re-make ./configure, we get the macros we need
+-ACLOCAL_AMFLAGS = -I m4 \
+-                  -I gflags/m4
++ACLOCAL_AMFLAGS = -I m4 -I gflags/m4
+ 
+ # This is so we can #include <google/vcencoder.h> or <gtest/gtest.h>
+ AM_CPPFLAGS = -I$(top_srcdir)/src \
+-- 
+1.8.5.4
+
diff --git a/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
new file mode 100644
index 0000000..c6af25d
--- /dev/null
+++ b/meta-oe/recipes-support/open-vcdiff/open-vcdiff_0.8.3.bb
@@ -0,0 +1,19 @@
+SUMMARY = "An encoder/decoder for the VCDIFF (RFC3284) format"
+DESCRIPTION = "A library with a simple API is included, as well as a \
+               command-line executable that can apply the encoder and \
+               decoder to source, target, and delta files. \
+               A slight variation from the draft standard is defined \
+               to allow chunk-by-chunk decoding when only a partial \
+               delta file window is available."
+HOMEPAGE = "http://code.google.com/p/open-vcdiff/"
+SECTION = "console/utils"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b2c8309843bc5297cfb4dc84f43f3ccc"
+
+SRC_URI = "http://open-vcdiff.googlecode.com/files/${BPN}-${PV}.tar.gz \
+           file://aclocal-amflags-fix.patch"
+SRC_URI[md5sum] = "5f848e4916b407879f55e0ca74c3f6af"
+SRC_URI[sha256sum] = "b7e47db78866082e9e8b5782f5491092c8414f0acc0440aea03b14c7d1d3c371"
+
+inherit autotools
-- 
1.8.5.4


