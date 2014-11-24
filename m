Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id AE0F3721A1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 06:48:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43872921"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Nov 2014 14:45:05 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAO6m36x003491
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 14:48:03 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 24 Nov 2014 14:48:20 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 24 Nov 2014 14:45:25 +0800
Message-ID: <1416811526-54855-6-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [PATCH 5/6] [meta-oe] libxp: Port libxp from openembedded.
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
X-List-Received-Date: Mon, 24 Nov 2014 06:48:21 -0000
Content-Type: text/plain

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../xorg-lib/libxp/fix-cast-error.patch            | 42 ++++++++++++++++++++++
 meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb   | 22 ++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
 create mode 100644 meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch b/meta-oe/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
new file mode 100644
index 0000000..fea18cf
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxp/fix-cast-error.patch
@@ -0,0 +1,42 @@
+This patch fixes these new errors:
+
+| XpNotifyPdm.c:234:10: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+| XpNotifyPdm.c:271:10: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+| XpNotifyPdm.c:286:10: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
+
+
+Upstream-Status: Pending
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+Index: libXp-1.0.1/src/XpNotifyPdm.c
+===================================================================
+--- libXp-1.0.1.orig/src/XpNotifyPdm.c
++++ libXp-1.0.1/src/XpNotifyPdm.c
+@@ -231,7 +231,7 @@ XpGetPdmStartParams (
+ 	/*
+ 	 * Error - cannot determine or establish a selection_display.
+ 	 */
+-	return( (Status) NULL );
++	return( (Status) 0 );
+     }
+ 
+     /*
+@@ -268,7 +268,7 @@ XpGetPdmStartParams (
+ 	    XCloseDisplay( *selection_display );
+ 	    *selection_display = (Display *) NULL;
+ 	}
+-	return( (Status) NULL );
++	return( (Status) 0 );
+     }
+ 
+     status = XmbTextListToTextProperty( *selection_display, list, 6,
+@@ -283,7 +283,7 @@ XpGetPdmStartParams (
+ 	    XCloseDisplay( *selection_display );
+ 	    *selection_display = (Display *) NULL;
+ 	}
+-	return( (Status) NULL );
++	return( (Status) 0 );
+     }
+ 
+     *type              = text_prop.encoding;
diff --git a/meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb b/meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb
new file mode 100644
index 0000000..748c3ea
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-lib/libxp_1.0.1.bb
@@ -0,0 +1,22 @@
+require recipes-graphics/xorg-lib/xorg-lib-common.inc
+
+SUMMARY = "XP: X Printing extension library"
+
+DESCRIPTION = "libXp provides public APIs to allow client applications \
+to render to non-display devices, making use of the X Print Service."
+
+LICENSE = "MIT & MIT-style"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9504a1264f5ddd4949254a57c0f8d6bb \
+                    file://src/XpPage.c;beginline=2;endline=35;md5=2b7d3d2ba5505b19271cf31b6918997e"
+
+DEPENDS += "libxext libxau printproto"
+PE = "1"
+
+XORG_PN = "libXp"
+
+CFLAGS_append = " -I ${S}/include/X11/XprintUtil -I ${S}/include/X11/extensions"
+
+SRC_URI += "file://fix-cast-error.patch"
+
+SRC_URI[md5sum] = "7ae1d63748e79086bd51a633da1ff1a9"
+SRC_URI[sha256sum] = "71d1f260005616d646b8c8788365f2b7d93911dac57bb53b65753d9f9e6443d2"
-- 
1.9.1


