Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.21613.1600965931963080127
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 09:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: stacy.gaikovaia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08OGj0Yw002786
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 24 Sep 2020 09:45:01 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 09:44:42 -0700
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <msisov@igalia.com>
Subject: [meta-browser][PATCH] conf/layer.conf: Add meta-python2 to LAYERDEPENDS
Date: Thu, 24 Sep 2020 12:44:41 -0400
Message-ID: <20200924164441.25467-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The recipes-browser/chromium/chromium.inc requires pythonnative which is in meta-python2.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 2572211..5fb9beb 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -112,4 +112,4 @@ BBFILE_PRIORITY_browser-layer = "7"
 LAYERVERSION_browser-layer = "1"
 LAYERSERIES_COMPAT_browser-layer = "warrior zeus dunfell gatesgarth"
 
-LAYERDEPENDS_browser-layer = "clang-layer core openembedded-layer"
+LAYERDEPENDS_browser-layer = "clang-layer core openembedded-layer meta-python2"
-- 
2.27.0

