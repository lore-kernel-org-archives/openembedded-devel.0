Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.60117.1600089349684683487
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 06:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52716 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHoKi-0000ED-3z; Mon, 14 Sep 2020 16:15:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 02/10] python3-haversine: Upgrade 2.2.0 -> 2.3.0
Date: Mon, 14 Sep 2020 16:15:28 +0300
Message-Id: <20200914131536.6072-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914131536.6072-1-leon.anavi@konsulko.com>
References: <20200914131536.6072-1-leon.anavi@konsulko.com>
X-OutGoing-Spam-Status: No, score=-0.5
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - voyager.icnhost.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - konsulko.com
X-Get-Message-Sender-Via: voyager.icnhost.net: authenticated_id: leon@anavi.org
X-Authenticated-Sender: voyager.icnhost.net: leon@anavi.org
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Upgrade to release 2.3.0:

- Added the comb parameter for haversine_vector

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-haversine_2.2.0.bb => python3-haversine_2.3.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-haversine_2.2.0.bb => python3-haversine_2.3.0.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
index fc2cc7d6f..6e02fcf71 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.3.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Calculate the distance between 2 points on Earth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
-SRC_URI[md5sum] = "6b1badeb63aac6214c978d07a4ecd171"
-SRC_URI[sha256sum] = "b710aaf32c442a6d04aa89678be55e3f6c11f9752fc01c216e89b13120b36269"
+SRC_URI[md5sum] = "ff2d43a74195ec00c42ccd5da2a3f3de"
+SRC_URI[sha256sum] = "72c76855ac25e6ad054c7ed380e95c1a96803185f005dd11f40ccaa9620b551f"
 
 inherit pypi setuptools3
 
-- 
2.17.1

