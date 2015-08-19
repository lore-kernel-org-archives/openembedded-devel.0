Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 2FD3D737F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 08:25:48 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99801623"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Aug 2015 16:29:00 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t7J8PdtN025904
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Aug 2015 16:25:40 +0800
Received: from localhost.localdomain (10.167.226.26) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 19 Aug 2015 16:25:42 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Aug 2015 16:26:00 +0800
Message-ID: <1439972760-25118-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.26]
Subject: [meta-oe][PATCH] rrdtool: 1.4.8->1.5.4
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
X-List-Received-Date: Wed, 19 Aug 2015 08:25:52 -0000
Content-Type: text/plain

-deleted the patched that have been merged to 1.5.4

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../rrdtool/0001-removing-testing-leftovers.patch  | 39 ----------------------
 .../rrdtool/remove_hardcoded_xml_include.patch     | 11 ------
 .../rrdtool/{rrdtool_1.4.8.bb => rrdtool_1.5.4.bb} | 12 +++----
 3 files changed, 5 insertions(+), 57 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/0001-removing-testing-leftovers.patch
 delete mode 100644 meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch
 rename meta-oe/recipes-extended/rrdtool/{rrdtool_1.4.8.bb => rrdtool_1.5.4.bb} (92%)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/0001-removing-testing-leftovers.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/0001-removing-testing-leftovers.patch
deleted file mode 100644
index cf5d775..0000000
--- a/meta-oe/recipes-extended/rrdtool/rrdtool/0001-removing-testing-leftovers.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From c581b02d074f5a109074bc190f373f5ba4320468 Mon Sep 17 00:00:00 2001
-From: Tobias Oetiker <tobi@oetiker.ch>
-Date: Thu, 3 Oct 2013 15:51:00 +0200
-Subject: [PATCH] removing testing leftovers
-
-Upstream-Status: Backport
-
-Signed-off-by: Peter A. Bigot <pab@pabigot.com>
-
----
- bindings/perl-piped/leaktest.pl | 16 ----------------
- 1 file changed, 16 deletions(-)
- delete mode 100644 bindings/perl-piped/leaktest.pl
-
-diff --git a/bindings/perl-piped/leaktest.pl b/bindings/perl-piped/leaktest.pl
-deleted file mode 100644
-index cebf1c7..0000000
---- a/bindings/perl-piped/leaktest.pl
-+++ /dev/null
-@@ -1,16 +0,0 @@
--#!/bin/perl -w
--$ENV{PATH}="/usr/ucb";
--use strict;   
--use RRDp;     
--my $rrdfile='/tmp/test.rrd';
--RRDp::start '/home/oetiker/data/projects/AABN-rrdtool/src/rrdtool';
--print grep /rrdtool/,`ps au`;
--print grep /rrdtool/,`ps au`;
--my $i=0;
--while ($i<1000) {
-- RRDp::cmd 'info /tmp/test.rrd';
-- $_ = RRDp::read;
-- $i++;
--}
--$_ = RRDp::end;
--print grep /rrdtool/,`ps au`;
--- 
-1.8.5.5
-
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch b/meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch
deleted file mode 100644
index 321a842..0000000
--- a/meta-oe/recipes-extended/rrdtool/rrdtool/remove_hardcoded_xml_include.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure.ac	2012-11-06 11:20:54.099021892 -0500
-+++ b/configure.ac~	2012-11-06 11:19:57.255023857 -0500
-@@ -548,7 +548,7 @@
- 
- fi
- EX_CHECK_ALL(glib-2.0,   glib_check_version,            glib.h,                 glib-2.0,    2.28.7, ftp://ftp.gtk.org/pub/glib/2.28/, "")
--EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, /usr/include/libxml2)
-+EX_CHECK_ALL(xml2,       xmlParseFile,                  libxml/parser.h,        libxml-2.0,        2.7.8,  http://xmlsoft.org/downloads.html, "")
- 
- if test "$EX_CHECK_ALL_ERR" = "YES"; then
-   AC_MSG_ERROR([Please fix the library issues listed above and try again.])
diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
similarity index 92%
rename from meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
rename to meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
index 6bc5e98..f252df5 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.8.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.5.4.bb
@@ -2,18 +2,16 @@ SUMMARY = "High performance data logging and graphing system for time series dat
 HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 
 LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
 
 DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
 
-SRCREV = "1850e00a17e25e93c39e608f4e2da50f29c5c712"
-PV = "1.4.8"
+SRCREV = "04f70058cc894c0a3ee5d555ea1bb5a8d4bb8a0e"
+PV = "1.5.4"
 
 SRC_URI = "\
-    git://github.com/oetiker/rrdtool-1.x.git;branch=1.4 \
-    file://remove_hardcoded_xml_include.patch \
-    file://0001-removing-testing-leftovers.patch \
-"
+           git://github.com/oetiker/rrdtool-1.x.git;branch=1.5 \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
1.8.4.2


