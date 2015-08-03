Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 9153975794
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Aug 2015 04:14:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99183319"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Aug 2015 12:18:20 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t734CupP003841
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 3 Aug 2015 12:12:57 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 3 Aug 2015 12:14:49 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 3 Aug 2015 12:14:33 +0800
Message-ID: <1438575274-1636-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-oe][PATCH 1/2] tk: upgrade 8.6.0 -> 8.6.4
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
X-List-Received-Date: Mon, 03 Aug 2015 04:14:53 -0000
Content-Type: text/plain

update content of non-linux.diff

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../configure.use.fontconfig.with.xft.patch        |  0
 .../tcltk/{tk-8.6.0 => tk}/confsearch.diff         |  0
 .../tcltk/{tk-8.6.0 => tk}/fix-xft.diff            |  0
 .../tcltk/{tk-8.6.0 => tk}/non-linux.diff          | 22 ++--------------------
 .../tcltk/{tk-8.6.0 => tk}/tklibrary.diff          |  0
 .../tcltk/{tk-8.6.0 => tk}/tkprivate.diff          |  0
 .../tcltk/{tk_8.6.0.bb => tk_8.6.4.bb}             |  4 ++--
 7 files changed, 4 insertions(+), 22 deletions(-)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.6.0 => tk}/configure.use.fontconfig.with.xft.patch (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.6.0 => tk}/confsearch.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.6.0 => tk}/fix-xft.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.6.0 => tk}/non-linux.diff (67%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.6.0 => tk}/tklibrary.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk-8.6.0 => tk}/tkprivate.diff (100%)
 rename meta-oe/recipes-devtools/tcltk/{tk_8.6.0.bb => tk_8.6.4.bb} (94%)

diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch b/meta-oe/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.6.0/configure.use.fontconfig.with.xft.patch
rename to meta-oe/recipes-devtools/tcltk/tk/configure.use.fontconfig.with.xft.patch
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff b/meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.6.0/confsearch.diff
rename to meta-oe/recipes-devtools/tcltk/tk/confsearch.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff b/meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.6.0/fix-xft.diff
rename to meta-oe/recipes-devtools/tcltk/tk/fix-xft.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff b/meta-oe/recipes-devtools/tcltk/tk/non-linux.diff
similarity index 67%
rename from meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
rename to meta-oe/recipes-devtools/tcltk/tk/non-linux.diff
index 9309fc4..7d31f9f 100644
--- a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/non-linux.diff
+++ b/meta-oe/recipes-devtools/tcltk/tk/non-linux.diff
@@ -3,7 +3,7 @@ building on non-linux Debian architectures.
 
 --- tk8.5-8.5.8.orig/unix/configure
 +++ tk8.5-8.5.8/unix/configure
-@@ -4742,6 +4742,9 @@
+@@ -4447,6 +4447,9 @@
  		if test "`uname -s`" = "AIX" ; then
  		    tcl_cv_sys_version=AIX-`uname -v`.`uname -r`
  		fi
@@ -12,16 +12,7 @@ building on non-linux Debian architectures.
 +		fi
  	    fi
  	fi
- 
-@@ -5546,7 +5549,7 @@
- fi
- 
- 	    ;;
--	Linux*)
-+	Linux*|GNU*|NetBSD-Debian)
- 	    SHLIB_CFLAGS="-fPIC"
- 	    SHLIB_LD_LIBS='${LIBS}'
- 	    SHLIB_SUFFIX=".so"
+
 --- tk8.5-8.5.8.orig/unix/tcl.m4
 +++ tk8.5-8.5.8/unix/tcl.m4
 @@ -962,6 +962,9 @@
@@ -34,12 +25,3 @@ building on non-linux Debian architectures.
  	    fi
  	fi
      ])
-@@ -1422,7 +1425,7 @@
- 	        ])
- 	    ])
- 	    ;;
--	Linux*)
-+	Linux*|GNU*|NetBSD-Debian)
- 	    SHLIB_CFLAGS="-fPIC"
- 	    SHLIB_LD_LIBS='${LIBS}'
- 	    SHLIB_SUFFIX=".so"
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff b/meta-oe/recipes-devtools/tcltk/tk/tklibrary.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.6.0/tklibrary.diff
rename to meta-oe/recipes-devtools/tcltk/tk/tklibrary.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff b/meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
similarity index 100%
rename from meta-oe/recipes-devtools/tcltk/tk-8.6.0/tkprivate.diff
rename to meta-oe/recipes-devtools/tcltk/tk/tkprivate.diff
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.4.bb
similarity index 94%
rename from meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
rename to meta-oe/recipes-devtools/tcltk/tk_8.6.4.bb
index 14c6ce5..d8eca50 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.4.bb
@@ -26,8 +26,8 @@ SRC_URI = "\
     file://fix-xft.diff \
     file://configure.use.fontconfig.with.xft.patch \
 "
-SRC_URI[md5sum] = "b883a1a3c489c17413fb602a94bf54e8"
-SRC_URI[sha256sum] = "5c708b2b6f658916df59190b27750fa1ea2bc10992108e10f961c0700f058de6"
+SRC_URI[md5sum] = "261754d7dc2a582f00e35547777e1fea"
+SRC_URI[sha256sum] = "08f99df85e5dc9c4271762163c6aabb962c8b297dc5c4c1af8bdd05fc2dd26c1"
 
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
-- 
1.8.4.2


