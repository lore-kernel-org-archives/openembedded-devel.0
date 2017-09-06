Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1738077E7E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 19:29:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v86JTtfR027120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 6 Sep 2017 12:29:55 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 6 Sep 2017 12:29:55 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 6 Sep 2017 14:23:25 -0500
Message-ID: <1504725809-12825-28-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 27/31] recipes-multimedia: Add LICENSE_FLAGS
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
X-List-Received-Date: Wed, 06 Sep 2017 19:29:54 -0000
Content-Type: text/plain

Multiple recipes require other recipes which all are defined to have a
LICENSE_FLAGS = "commercial".  Set these referring packages to the same
license flag so they are only enabled when their dependency is also enabled.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 .../recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb  | 4 ++++
 .../recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb     | 3 +++
 meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb                     | 3 +++
 3 files changed, 10 insertions(+)

diff --git a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
index 72a96f3..d3e31fe 100644
--- a/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
+++ b/meta-xfce/recipes-multimedia/packagegroups/packagegroup-xfce-multimedia.bb
@@ -4,6 +4,10 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d
 
 inherit packagegroup
 
+# While this item does not require it, it depends on xfmpc and xfc4-mpc-plugin
+# that wants mpd which does
+LICENSE_FLAGS = "commercial"
+
 RDEPENDS_${PN} = " \
     parole \
     xfmpc \
diff --git a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
index f709e4d..9f501f7 100644
--- a/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
+++ b/meta-xfce/recipes-multimedia/xfce4-mpc-plugin/xfce4-mpc-plugin_0.5.0.bb
@@ -8,6 +8,9 @@ inherit xfce-panel-plugin
 
 DEPENDS += "libmpd"
 
+# While this item does not require it, it depends on mpd which does
+LICENSE_FLAGS = "commercial"
+
 # for now we recommend our own mpd-server
 RRECOMMENDS_${PN} = "mpd"
 
diff --git a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
index 3d902a1..869435d 100644
--- a/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
+++ b/meta-xfce/recipes-multimedia/xfmpc/xfmpc_0.2.3.bb
@@ -4,6 +4,9 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "gtk+ libxfce4util libxfce4ui libmpd vala-native"
 
+# While this item does not require it, it depends on mpd which does
+LICENSE_FLAGS = "commercial"
+
 # for now we recommend our own mpd-server
 RRECOMMENDS_${PN} = "mpd"
 
-- 
1.8.3.1


