Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 751D478D36
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 01:23:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w721NZ6h005622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 1 Aug 2018 18:23:35 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Wed, 1 Aug 2018 18:23:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Thu, 2 Aug 2018 09:33:54 +0800
Message-ID: <9a069016854770553fe4c55ba473dbdbb7cc7fd6.1533173392.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1533173392.git.hongxu.jia@windriver.com>
References: <cover.1533173392.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH 04/16] network-manager-applet: 1.8.10 -> 1.8.14
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
X-List-Received-Date: Thu, 02 Aug 2018 01:23:35 -0000
Content-Type: text/plain

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...rk-manager-applet_1.8.10.bb => network-manager-applet_1.8.14.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-gnome/recipes-connectivity/network-manager-applet/{network-manager-applet_1.8.10.bb => network-manager-applet_1.8.14.bb} (86%)

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
similarity index 86%
rename from meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
rename to meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
index 91ae8b7..957516e 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.10.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.8.14.bb
@@ -11,8 +11,8 @@ inherit distro_features_check gnomebase gsettings gtk-icon-cache gobject-introsp
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "eae3be75e77ff1a7ea3174be25e62d03"
-SRC_URI[archive.sha256sum] = "0adc4bfae8b49f7a1d929c22ef20933bd41fb4a8b458280f44c65f9e45b4c9c3"
+SRC_URI[archive.md5sum] = "bcdd92645d36fc5778f27aeb2773509b"
+SRC_URI[archive.sha256sum] = "ca9b1233721f700a7190b98eea69ce6d0ccf74fbfde173ac868a4ec7a78840cb"
 
 PACKAGECONFIG[modemmanager] = "--with-wwan,--without-wwan,modemmanager"
 PACKAGECONFIG ??= ""
@@ -38,10 +38,10 @@ do_compile_prepend() {
 RDEPENDS_${PN} =+ "networkmanager"
 
 FILES_${PN} += " \
-    ${datadir}/appdata \
     ${datadir}/nm-applet/ \
     ${datadir}/libnm-gtk/wifi.ui \
     ${datadir}/libnma/wifi.ui \
+    ${datadir}/metainfo \
 "
 
 # musl builds generate gir files which otherwise go un-packaged
-- 
2.7.4


