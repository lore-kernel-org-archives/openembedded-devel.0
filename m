Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CA7BE60269
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Nov 2016 10:05:45 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA7A5ken003106
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 7 Nov 2016 02:05:46 -0800 (PST)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Mon, 7 Nov 2016 02:05:45 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 7 Nov 2016 18:05:02 +0800
Message-ID: <20161107100502.1128-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Subject: [meta-oe][PATCH V3] gnuplot: upgrade to 5.0.5
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
X-List-Received-Date: Mon, 07 Nov 2016 10:05:45 -0000
Content-Type: text/plain

Add PACKAGECONFIG for 'qt4' and default to not enable it as there's
do_compile failure when qt4 is enabled.

The obsolete '--without-lisp-files' option is removed.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/recipes-extended/gnuplot/gnuplot.inc                          | 3 ++-
 .../{gnuplot-4.6.5 => gnuplot}/lua-loadlibs-configure-in-fix.patch    | 0
 .../recipes-extended/gnuplot/{gnuplot-4.6.5 => gnuplot}/subdirs.patch | 0
 .../recipes-extended/gnuplot/{gnuplot_4.6.5.bb => gnuplot_5.0.5.bb}   | 4 ++--
 4 files changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot-4.6.5 => gnuplot}/lua-loadlibs-configure-in-fix.patch (100%)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot-4.6.5 => gnuplot}/subdirs.patch (100%)
 rename meta-oe/recipes-extended/gnuplot/{gnuplot_4.6.5.bb => gnuplot_5.0.5.bb} (74%)

diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot.inc b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
index 69bc74b..19ee874 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot.inc
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot.inc
@@ -15,9 +15,10 @@ acpaths = ""
 PACKAGECONFIG ??= "cairo"
 PACKAGECONFIG[cairo] = "--with-cairo,--without-cairo,cairo pango"
 PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
+# there's compilation failure if qt4 is enabled
+PACKAGECONFIG[qt4] = "--with-qt,--without-qt,qt4-x11-free"
 
 EXTRA_OECONF = "--with-readline=${STAGING_LIBDIR}/.. \
-                --without-lisp-files \
                 --without-tutorial \
                 --disable-wxwidgets"
 
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
similarity index 100%
rename from meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/lua-loadlibs-configure-in-fix.patch
rename to meta-oe/recipes-extended/gnuplot/gnuplot/lua-loadlibs-configure-in-fix.patch
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch b/meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
similarity index 100%
rename from meta-oe/recipes-extended/gnuplot/gnuplot-4.6.5/subdirs.patch
rename to meta-oe/recipes-extended/gnuplot/gnuplot/subdirs.patch
diff --git a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
similarity index 74%
rename from meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
rename to meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
index 3f694a0..42308ba 100644
--- a/meta-oe/recipes-extended/gnuplot/gnuplot_4.6.5.bb
+++ b/meta-oe/recipes-extended/gnuplot/gnuplot_5.0.5.bb
@@ -8,7 +8,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/gnuplot/${BP}.tar.gz;name=archive \
     file://gnuplot.png \
 "
 
-SRC_URI[archive.md5sum] = "9a476b21f74bd99c876f1509d731a0f9"
-SRC_URI[archive.sha256sum] = "e550f030c7d04570e89c3d4e3f6e82296816508419c86ab46c4dd73156519a2d"
+SRC_URI[archive.md5sum] = "c5e96fca73afbee4f57cbc1bfce6b3b8"
+SRC_URI[archive.sha256sum] = "25f3e0bf192e01115c580f278c3725d7a569eb848786e12b455a3fda70312053"
 SRC_URI[qtplot.md5sum] = "0a481885a496092c77eb4017540b5cf6"
 SRC_URI[qtplot.sha256sum] = "6df317183ff62cc82f3dcf88207a267cd6478cb5147f55d7530c94f1ad5f4132"
-- 
2.8.3


