Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.3868.1615866205796421256
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3hHXq005001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:43:19 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:44 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:43 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 7/7] xfce4-taskmanager: 1.4.2 -> 1.5.2
Date: Tue, 16 Mar 2021 11:42:02 +0800
Message-ID: <20210316034202.21134-8-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Update xfce4-taskmanager from 1.4.2 to 1.5.2:
* add dependency libxfce4ui

Release notes for 1.5.2
=======================
- Fix restoring the window size (Fixes #39)
- Improve wording of systray option (Fixes #19)
- Translation Updates:
  Italian

Release notes for 1.5.1
=======================
- Fix erroneous binding of settings (Fixes #37)
- Store column positions again
- Store sort-column-id and sort-type (Fixes #36)
- Also include swap in the memory graph
- Reduce drawing code
- Reduce borders of graphs
- Replace GtkImageMenuItem with GtkMenuItem

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...{xfce4-taskmanager_1.4.2.bb => xfce4-taskmanager_1.5.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-taskmanager/{xfce4-taskmanager_1.4.2.bb => xfce4-taskmanager_1.5.2.bb} (47%)

diff --git a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.2.bb b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
similarity index 47%
rename from meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.2.bb
rename to meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
index 8deea105c..e0da70dd0 100644
--- a/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.4.2.bb
+++ b/meta-xfce/recipes-apps/xfce4-taskmanager/xfce4-taskmanager_1.5.2.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 inherit xfce-app
 
-DEPENDS += "gtk+3 cairo libwnck libxmu xfce4-dev-tools-native"
+DEPENDS += "gtk+3 cairo libwnck libxfce4ui libxmu xfce4-dev-tools-native"
 
-SRC_URI[sha256sum] = "cd122240e1c195e4e6f159da1bb86b38c41ba27892399ad85a18c37ea20e48f9"
+SRC_URI[sha256sum] = "bd25143f47a29000b4148874863dffa521b1a37cb01dbc026f423ea3160f9a35"
-- 
2.17.1

