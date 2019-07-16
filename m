Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F52A7ECBF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:13:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6GEClQO019593
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:12:58 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:12:37 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:18 -0400
Message-ID: <20190716141231.77957-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 02/15] libxfce4ui: 4.13.5 -> 4.13.6
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
X-List-Received-Date: Tue, 16 Jul 2019 14:13:22 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* dependency glib-2.0 is required by libxfce4util, so remove it from
  DEPENDS to make it more clean. And sort DEPENDS at same time.
* not inherit autotools and gettext which have been inherited in
  xfce.bbclass already

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{libxfce4ui_4.13.5.bb => libxfce4ui_4.13.6.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.13.5.bb => libxfce4ui_4.13.6.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.5.bb b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.6.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.5.bb
rename to meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.6.bb
index 2bea5f0f6..5c4ccda26 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.5.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.13.6.bb
@@ -2,17 +2,17 @@ SUMMARY = "Xfce4 Widget library and X Window System interaction"
 SECTION = "x11/libs"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "perl-native glib-2.0 gtk+ gtk+3 intltool-native libxfce4util xfconf xfce4-dev-tools virtual/libx11 libsm libice"
+DEPENDS = "intltool-native perl-native gtk+ gtk+3 libice libsm libxfce4util xfce4-dev-tools xfconf virtual/libx11"
 
-inherit xfce autotools gettext gtk-doc gobject-introspection distro_features_check
+inherit xfce gtk-doc gobject-introspection distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += " \
     file://0001-libxfce4kbd-private-xfce4-keyboard-shortcuts.xml-fix.patch \
 "
-SRC_URI[md5sum] = "692520f2a2cccaaafb0357c3dcbb015b"
-SRC_URI[sha256sum] = "3c38b065796a1cb2c2f2e9a28edaa6b37a3728c1c0b7a4297af9ecd82a8ab66d"
+SRC_URI[md5sum] = "9e5a805d2d557df79e571468978a2766"
+SRC_URI[sha256sum] = "3c5e505ce56a5993db473efed9962705dd255ffaee17009ed1b3e9f40b543969"
 
 EXTRA_OECONF += "--with-vendor-info=${DISTRO}"
 
-- 
2.20.0


