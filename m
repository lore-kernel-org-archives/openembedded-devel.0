Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web10.7925.1603263675929811736
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 00:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: pascal.bach@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09L71CQ8015917
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:01:13 +0200
Received: from md2m476c.ad001.siemens.net ([167.87.35.142])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 09L71CJh019156;
	Wed, 21 Oct 2020 09:01:12 +0200
From: "Pascal Bach" <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pascal Bach <pascal.bach@siemens.com>
Subject: [meta-oe][PATCH] fmt: make available as native and nativesdk
Date: Wed, 21 Oct 2020 09:01:09 +0200
Message-Id: <20201021070109.2113388-1-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta-oe/recipes-support/fmt/fmt_7.0.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/fmt/fmt_7.0.3.bb b/meta-oe/recipes-support/fmt/fmt_7.0.3.bb
index ed3de0b50..d52731161 100644
--- a/meta-oe/recipes-support/fmt/fmt_7.0.3.bb
+++ b/meta-oe/recipes-support/fmt/fmt_7.0.3.bb
@@ -13,3 +13,5 @@ inherit cmake
 inherit ptest
 
 EXTRA_OECMAKE += "-DBUILD_SHARED_LIBS=ON"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.28.0

