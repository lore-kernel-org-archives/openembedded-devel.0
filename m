Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2B7957ED25
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:14:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GEESd2015365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:14:28 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:14:27 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:29 -0400
Message-ID: <20190716141231.77957-14-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 13/15] garcon: 0.6.2 -> 0.6.3
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
X-List-Received-Date: Tue, 16 Jul 2019 14:14:27 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* remove libxfce4util from DEPENDS which is required by libxfce4ui

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../garcon/{garcon_0.6.2.bb => garcon_0.6.3.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_0.6.2.bb => garcon_0.6.3.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_0.6.2.bb b/meta-xfce/recipes-xfce/garcon/garcon_0.6.3.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/garcon/garcon_0.6.2.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_0.6.3.bb
index 27096da60..dc44eae03 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_0.6.2.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_0.6.3.bb
@@ -2,15 +2,15 @@ DESCRIPTION="Xfce Menu Library"
 SECTION = "x11/libs"
 LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=04a01abcbdabffae1ca26335a293276b"
-DEPENDS = "xfce4-dev-tools-native libxfce4util libxfce4ui intltool-native"
+DEPENDS = "xfce4-dev-tools-native libxfce4ui intltool-native"
 
 inherit xfce gtk-doc distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI += "file://0001-xfce-applications.menu-don-t-bloat-settings-menu-by-.patch"
-SRC_URI[md5sum] = "a4b6332ff6f090575d534d6a9d2761d8"
-SRC_URI[sha256sum] = "a87f09648ff10d45c524b3bfe618f18622bdd8b205589d35fed2f12d9c79c47c"
+SRC_URI[md5sum] = "3b54d210adec3b6be781a1da26b53da2"
+SRC_URI[sha256sum] = "76b1fea531363e9c5e767f1899039b4fe854edf23f6c0f260807e5551f798401"
 
 EXTRA_OECONF = "--disable-gtk-doc"
 
-- 
2.20.0


