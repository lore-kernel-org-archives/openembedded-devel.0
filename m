Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F031571DD9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1DA4XC6000373
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 13 Feb 2017 02:04:33 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:33 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:20 -0800
Message-ID: <85e0a3d4abc4c1866a1081f57da4a1a584e5911c.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/13] xfce4-notifyd: add dbus-glib-native to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:34 -0000
Content-Type: text/plain

Fixed:
configure:16468: checking for dbus-binding-tool
configure:16501: result: no

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
index 6310a17..9602ac8 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.3.4.bb
@@ -2,7 +2,9 @@ SUMMARY = "Easily themable notification daemon with transparency effects"
 HOMEPAGE = "http://goodies.xfce.org/projects/applications/xfce4-notifyd"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify"
+DEPENDS = "libxfce4util libxfce4ui xfconf gtk+ dbus dbus-glib libnotify \
+    dbus-glib-native \
+"
 
 inherit xfce-app
 
-- 
2.9.0


