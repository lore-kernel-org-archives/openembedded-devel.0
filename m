Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E9F9E71DEC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:04:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v1DA4X2E004023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Feb 2017 02:04:33 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Feb 2017 02:04:32 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <martin.jansa@gmail.com>
Date: Mon, 13 Feb 2017 02:04:19 -0800
Message-ID: <4f72efd3af1a9cee95eb56b86e91571da22d7b0f.1486980187.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1486980186.git.liezhi.yang@windriver.com>
References: <cover.1486980186.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 05/13] xfdesktop: add dbus-glib-native to DEPENDS
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
X-List-Received-Date: Mon, 13 Feb 2017 10:04:33 -0000
Content-Type: text/plain

Fixed:
configure:15214: checking for dbus-binding-tool
configure:15245: result: no
configure:15254: error: could not find dbus-binding-tool in $PATH. You can run
  ./configure DBUS_BINDING_TOOL=/path/to/dbus-binding-tool to define
  a custom location for it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
index e951343..8b8c400 100644
--- a/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
+++ b/meta-xfce/recipes-xfce/xfdesktop/xfdesktop_4.12.3.bb
@@ -2,7 +2,9 @@ SUMMARY = "Xfce4 Desktop Manager"
 SECTION = "x11/base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib thunar garcon exo"
+DEPENDS = "glib-2.0 gtk+ libxfce4util libxfce4ui libwnck xfconf dbus-glib \
+    thunar garcon exo dbus-glib-native \
+"
 
 inherit xfce distro_features_check
 
-- 
2.9.0


