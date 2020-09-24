Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.21694.1600966125355836376
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Sep 2020 09:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: stacy.gaikovaia@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 08OGmKaT002827
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 24 Sep 2020 09:48:20 -0700 (PDT)
Received: from yow-lpggp3.wrs.com (128.224.137.13) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Thu, 24 Sep 2020
 09:48:08 -0700
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <raj.khem@gmail.com>, <msisov@igalia.com>
Subject: [meta-browser][PATCH] conf/layer.conf: Short LAYERSERIES_COMPAT
Date: Thu, 24 Sep 2020 12:48:08 -0400
Message-ID: <20200924164808.27860-1-stacy.gaikovaia@windriver.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Layerindex only support at most 25 characters, so make LAYERSERIES_COMPAT less
than 25.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 5fb9beb..4970092 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -110,6 +110,6 @@ BBFILE_PATTERN_browser-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_browser-layer = "7"
 
 LAYERVERSION_browser-layer = "1"
-LAYERSERIES_COMPAT_browser-layer = "warrior zeus dunfell gatesgarth"
+LAYERSERIES_COMPAT_browser-layer = "dunfell gatesgarth"
 
 LAYERDEPENDS_browser-layer = "clang-layer core openembedded-layer meta-python2"
-- 
2.27.0

