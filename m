Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 58E687E668
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Jul 2019 14:14:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6GEERxr013663
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Jul 2019 07:14:27 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 16 Jul 2019 07:14:26 -0700
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Tue, 16 Jul 2019 10:12:28 -0400
Message-ID: <20190716141231.77957-13-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20190716141231.77957-1-kai.kang@windriver.com>
References: <20190716141231.77957-1-kai.kang@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 12/15] thunar-volman: 0.9.2 -> 0.9.3
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
X-List-Received-Date: Tue, 16 Jul 2019 14:14:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

* clean DEPENDS that removed items are required by exo:
  exo --> libxfce4ui --> libxfce4util --> glib-2.0
                     --> xfconf

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb}      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-xfce/thunar-volman/{thunar-volman_0.9.2.bb => thunar-volman_0.9.3.bb} (63%)

diff --git a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
similarity index 63%
rename from meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
rename to meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
index 3139625ac..93489d881 100644
--- a/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.2.bb
+++ b/meta-xfce/recipes-xfce/thunar-volman/thunar-volman_0.9.3.bb
@@ -2,14 +2,14 @@ SUMMARY = "Automatic management of removable drives and media for thunar"
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-DEPENDS = "exo glib-2.0 libxfce4ui libxfce4util xfconf libnotify libgudev"
+DEPENDS = "exo libnotify libgudev"
 
 inherit xfce distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "af216d5b60820e7cd39aae1b5ad869a3"
-SRC_URI[sha256sum] = "b944b4299b73d2ca79184922dfea49782e4849f5960e209def71ac700a92ff27"
+SRC_URI[md5sum] = "699a0534a0899e31366018a9e9e2aeb0"
+SRC_URI[sha256sum] = "29309091db8b0f08c5a727625cc470673134977d7966cae0392f131300f9d5e9"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[notify] = "--enable-notifications,--disable-notifications,libnotify"
-- 
2.20.0


