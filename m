Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0248C7EABC
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Jul 2019 08:19:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x628IYs8001928
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Jul 2019 01:18:44 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Tue, 2 Jul 2019 01:18:23 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 2 Jul 2019 16:16:20 +0800
Message-ID: <aade199a0a1f84d27af8cf05f60d0155ab4c6440.1562055251.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1562055251.git.hongxu.jia@windriver.com>
References: <cover.1562055251.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 6/8] network-manager-applet: 1.8.20 -> 1.8.22
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
X-List-Received-Date: Tue, 02 Jul 2019 08:19:09 -0000
Content-Type: text/plain

Fix QA Issue: AM_GNU_GETTEXT used but no inherit gettext

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rk-manager-applet_1.8.20.bb => network-manager-applet_1.8.22.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.20.bb => network-manager-applet_1.8.22.bb} (87%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
similarity index 87%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
index 80aafc8..1f3f611 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.20.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.22.bb
@@ -8,12 +8,12 @@ DEPENDS = "gtk+3 libnotify libsecret networkmanager \
 "
 
 GNOMEBASEBUILDCLASS = "autotools-brokensep"
-inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introspection
+inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introspection gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "06aafa851762146034351aa72ebb23d4"
-SRC_URI[archive.sha256sum] = "050dbb155566c715239dc0378844d8beed10954e64e71014ecef8ca912df34ec"
+SRC_URI[archive.md5sum] = "e0373f4c0d0637716e6e385799a9080f"
+SRC_URI[archive.sha256sum] = "ebef1c1050ff6d94cad060e8d259f2a88ae159cf83ca75cb71d9f76867877eed"
 
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG[mobile-provider-info] = "--enable-mobile-broadband-provider-info,--disable-mobile-broadband-provider-info,mobile-broadband-provider-info,mobile-broadband-provider-info"
-- 
2.7.4


