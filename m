Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 762FE7E3AA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Aug 2019 09:22:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7D9MAOJ027674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2019 02:22:20 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 13 Aug 2019 02:21:59 -0700
From: <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>, <raj.khem@gmail.com>
Date: Tue, 13 Aug 2019 05:21:06 -0400
Message-ID: <20190813092118.113213-5-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190813092118.113213-1-kai.kang@windriver.com>
References: <20190813092118.113213-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][Patch 04/16] exo: 0.12.6 -> 0.12.8
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
X-List-Received-Date: Tue, 13 Aug 2019 09:22:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update exo from 0.12.6 to 0.12.8.

* add gtk+3 to DEPENDS
* make gtk+ as a PACKAGECONFIG. Remove it when no application needs exo
  gtk+2 support

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../exo/{exo_0.12.6.bb => exo_0.12.8.bb}             | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)
 rename meta-xfce/recipes-xfce/exo/{exo_0.12.6.bb => exo_0.12.8.bb} (68%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_0.12.6.bb b/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/exo/exo_0.12.6.bb
rename to meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
index e09b4ff8b..fdd50d435 100644
--- a/meta-xfce/recipes-xfce/exo/exo_0.12.6.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_0.12.8.bb
@@ -1,8 +1,8 @@
-DESCRIPTION="Application library for the Xfce desktop environment"
+DESCRIPTION = "Application library for the Xfce desktop environment"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gtk+ libxfce4ui virtual/libx11 liburi-perl-native cairo"
+DEPENDS = "gtk+3 libxfce4ui virtual/libx11 liburi-perl-native cairo"
 DEPENDS_class-native = "glib-2.0-native xfce4-dev-tools-native intltool-native"
 
 inherit xfce pythonnative perlnative gtk-doc distro_features_check
@@ -20,8 +20,12 @@ SRC_URI_append_class-native = " \
     file://reduce-build-to-exo-csource-only.patch \
 "
 
-SRC_URI[md5sum] = "e97267e5d5a41bf5b95e9bfdaa62e47a"
-SRC_URI[sha256sum] = "1417fffc593225d61ba57b050ae2ce66ef37615c9ec66944db32019761441003"
+SRC_URI[md5sum] = "e618ce760a12ac7427a48a44c69f3d31"
+SRC_URI[sha256sum] = "3400a2e64aa41ede25bedaca4909bde7ea4f8698d9598d1b80f02a40ac89fcde"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG_class-target ??= "gtk"
+PACKAGECONFIG[gtk] = "--enable-gtk2,--disable-gtk2,gtk+"
 
 PACKAGES =+ "exo-csource"
 
-- 
2.20.0


