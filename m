Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.3930.1615866161308305668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Mar 2021 20:42:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12G3gMBQ004916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Mar 2021 20:42:29 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 15 Mar 2021 20:42:13 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 15 Mar 2021 20:42:12 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <schnitzeltony@gmail.com>
Subject: [meta-xfce][PATCH 2/7] exo: 4.16.0 -> 4.16.1
Date: Tue, 16 Mar 2021 11:41:57 +0800
Message-ID: <20210316034202.21134-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210316034202.21134-1-kai.kang@windriver.com>
References: <20210316034202.21134-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Release notes for exo 4.16.1
============================
- Revamp the documentation to modernize and uniformize accross
  components
- Fix keyboard navigation when only one item is present (#53)

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-xfce/recipes-xfce/exo/{exo_4.16.0.bb => exo_4.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/exo/{exo_4.16.0.bb => exo_4.16.1.bb} (88%)

diff --git a/meta-xfce/recipes-xfce/exo/exo_4.16.0.bb b/meta-xfce/recipes-xfce/exo/exo_4.16.1.bb
similarity index 88%
rename from meta-xfce/recipes-xfce/exo/exo_4.16.0.bb
rename to meta-xfce/recipes-xfce/exo/exo_4.16.1.bb
index 5b91b8b7e..a49b18c72 100644
--- a/meta-xfce/recipes-xfce/exo/exo_4.16.0.bb
+++ b/meta-xfce/recipes-xfce/exo/exo_4.16.1.bb
@@ -14,7 +14,7 @@ SRC_URI += " \
     file://configure.patch \
 "
 
-SRC_URI[sha256sum] = "1975b00eed9a8aa1f899eab2efaea593731c19138b83fdff2f13bdca5275bacc"
+SRC_URI[sha256sum] = "528dac256315ffc2a4a53b3b421979327962121989886e3cf920aeff9912b53b"
 
 # Note: python bindings did not work in oe-dev and are about to be moved to
 # pyxfce see http://comments.gmane.org/gmane.comp.desktop.xfce.devel.version4/19560
-- 
2.17.1

