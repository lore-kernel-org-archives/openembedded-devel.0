Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA0E7ECC2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:13:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GEDWAG015356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:13:32 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:13:32 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:23 -0400
Message-ID: <20190716141231.77957-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 07/15] xfwm4: 4.13.2 -> 4.13.3
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
X-List-Received-Date: Tue, 16 Jul 2019 14:13:31 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* clean DEPENDS
  - remove dbus-glib which is replaced by gdbus
  - libxfce4util and xfconf are required by libxfce4ui

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.13.2.bb => xfwm4_4.13.3.bb} (82%)

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
similarity index 82%
rename from meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
rename to meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
index 6075977f2..f4ebb45e0 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.2.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.13.3.bb
@@ -2,14 +2,14 @@ DESCRIPTION="Xfce4 Window Manager"
 SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d791728a073bc009b4ffaf00b7599855"
-DEPENDS = "virtual/libx11 libxfce4util libxfce4ui xfconf libwnck3 dbus-glib libxinerama exo-native"
+DEPENDS = "virtual/libx11 libxfce4ui libwnck3 libxinerama exo-native"
 
 inherit xfce update-alternatives distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "aee4a8375beeae09715e77479610ff02"
-SRC_URI[sha256sum] = "7be8a63e92077e42e6cc064a1dfdae608ab99fdc730adbd5200802dbdd86d5a9"
+SRC_URI[md5sum] = "e53081e5928d401604d158429716e699"
+SRC_URI[sha256sum] = "12ad274f6662c8afee35fd9b9310e73bd462c423578d448b2d7353e3c8eda6c1"
 
 PACKAGECONFIG ?= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'epoxy', '', d)} \
-- 
2.20.0


