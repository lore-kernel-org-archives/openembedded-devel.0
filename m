Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 93D4B7829B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jul 2017 09:24:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v6P9ObkL026101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 25 Jul 2017 02:24:38 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Jul 2017 02:24:36 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 25 Jul 2017 05:24:35 -0400
Message-ID: <1500974675-113993-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] glade: fix contamination on centos7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jul 2017 09:24:40 -0000
Content-Type: text/plain

Since gobject-introspection convert to python3 in oe-core,
incorrectly assigning PYTHON_PN with python caused host python3
loaded.

On centos7, built with qemuarm failed:
...
arm-poky-linux-gnueabi-gcc: error: unrecognized argument in option
'-mtune=generic'
..
arm-poky-linux-gnueabi-gcc: error: unrecognized command line option
'-m64'
Traceback (most recent call last):
  File "/usr/lib64/python3.4/distutils/unixccompiler.py", line 126, in
_compile
...

The native python3 should be loaded.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-oe/recipes-devtools/glade/glade_3.20.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb b/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
index 8b35a9c..f33b6e3 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.20.0.bb
@@ -9,7 +9,7 @@ DEPENDS = "gtk+ gtk+3 glib-2.0 libxml2 intltool-native \
 "
 
 
-inherit autotools pkgconfig pythonnative gnomebase gobject-introspection
+inherit autotools pkgconfig gnomebase gobject-introspection
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.20/glade-${PV}.tar.xz \
            file://remove-yelp-help-rules-var.patch \
@@ -23,5 +23,3 @@ FILES_${PN} += "${datadir}/* ${libdir}/glade/modules/libgladegtk.so"
 FILES_${PN}-dev += "${libdir}/glade/modules/libgladegtk.la"
 FILES_${PN}-dbg += "${libdir}/glade/modules/.debug/libgladegtk.so"
 
-PYTHON_PN = "python"
-
-- 
2.8.1


