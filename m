Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D187477E8F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTva9022168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:57 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:56 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:27 -0500
Message-ID: <1504725809-12825-30-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 29/31] xfce4-mixer: Remove, gstreamer-0.10 is obsolete
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:56 -0000
Content-Type: text/plain

There is no upstream revision to the mixer to make it work w/o gstreamer-0.10

also remove from packagegroup-xfce-extended

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb   | 14 --------------
 .../packagegroups/packagegroup-xfce-extended.bb            |  1 -
 2 files changed, 15 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb

diff --git a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb b/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
deleted file mode 100644
index bdbec45..0000000
--- a/meta-xfce/recipes-apps/xfce4-mixer/xfce4-mixer_4.11.0.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "A volume control application based on GStreamer"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "glib-2.0 gst-plugins-base gtk+ xfconf libunique"
-
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/${@xfce_verdir("${PV}")}/${BPN}-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "1b3753b91224867a3a2dfddda239c28d"
-SRC_URI[sha256sum] = "fb0c1df201ed1130f54f15b914cbe5a59286e994a137acda5609570c57112de2"
-
-RDEPENDS_${PN} = "gst-meta-audio"
diff --git a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
index c07188f..ff024b3 100644
--- a/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
+++ b/meta-xfce/recipes-xfce/packagegroups/packagegroup-xfce-extended.bb
@@ -61,7 +61,6 @@ RRECOMMENDS_${PN} = " \
     xfce4-appfinder \
     xfce4-screenshooter \
     xfce4-power-manager \
-    xfce4-mixer \
     ristretto \
     xfce4-taskmanager \
     gigolo \
-- 
1.8.3.1


