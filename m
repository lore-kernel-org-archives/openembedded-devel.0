Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.4292.1589851881149357217
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 18:31:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04J1Unbw031778
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 18:31:09 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 18 May 2020 18:30:39 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 3/4] thunar: 1.8.12 -> 1.8.14
Date: Tue, 19 May 2020 09:30:33 +0800
Message-ID: <20200519013034.37855-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200519013034.37855-1-kai.kang@windriver.com>
References: <20200519013034.37855-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

1.8.14
======
   - Revert "Allow opening of multiple file selections (bug #2487)",
   because it introduced a regression (Not possible any more to DnD
   multiple files in icon/compact view)
   - Translation Updates:
     Portuguese,

1.8.13
======
   - Use tre-view toplevel path of the cursor, if available, in order to
   prevent jumping (Bug #16024)
   - Increase vertical gap between icon and its label slightly (Bug #16041)
   - Fix crash when inserting USB device in tree-view  mode. (Bug #15172)
   - Fix jump to Home when ejecting a currently viewed device (Bug #16504)
   - Allow context menu when editing location in pathbar (Bug #16483)
   - Sort device entries in tree view (Bug #16471)
   - Allow to open multiple files at once (Bug #2487)
   - Fix incorrect pathbar autocomplete (Bug #16267)
   - Avoid unreadable names in detailed view (Bug #16391)
   - Prevent crash when renaming files (Bug #10805)
   - Translation Updates:
     Belarusian, Croatian, Finnish, French, Hebrew, Indonesian, Kazakh,
     Malay, Portuguese, Portuguese (Brazil),

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../thunar/{thunar_1.8.12.bb => thunar_1.8.14.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.8.12.bb => thunar_1.8.14.bb} (84%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
similarity index 84%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
index 0d2befd02..499c83152 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.8.12.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.8.14.bb
@@ -8,8 +8,8 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[md5sum] = "bebd2d83ad2ed111b906c99b65fb32ed"
-SRC_URI[sha256sum] = "29295bee0b1f5bfd525e37405e5d32b497ae539b15183dd14e6ca49e252225f8"
+SRC_URI[md5sum] = "24218474191ac4c7e907d5b6fd6f1831"
+SRC_URI[sha256sum] = "8ac57b1f5842d5bd348bbb6dac4714f5ad1f22de651d8ec6a7099ceb19fa219f"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.17.1

