Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.2580.1605178601188903632
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2020 02:56:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39606 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kdAHP-0006p6-AY; Thu, 12 Nov 2020 12:56:40 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/5] python3-colorlog: Upgrade 4.4.0 -> 4.6.2
Date: Thu, 12 Nov 2020 12:56:16 +0200
Message-Id: <20201112105618.23773-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201112105618.23773-1-leon.anavi@konsulko.com>
References: <20201112105618.23773-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.6.2:

- Include tests using MANIFEST.in instead of setup.py
- Switch to GitHub Actions
- Don't publish to test pypi - we'd have to bump the version
  every commit

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-colorlog_4.4.0.bb => python3-colorlog_4.6.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-colorlog_4.4.0.bb => python3-colorlog_4.6.2.bb} (65%)

diff --git a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb b/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
similarity index 65%
rename from meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
index 4a40ef38cf..e98d276f06 100644
--- a/meta-python/recipes-devtools/python/python3-colorlog_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-colorlog_4.6.2.bb
@@ -7,5 +7,5 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE = "colorlog"
 
-SRC_URI[md5sum] = "0997566a87c6fdec0baa88055adc06c3"
-SRC_URI[sha256sum] = "0272c537469ab1e63b9915535874d15b671963c9325db0c4891a2aeff97ce3d1"
+SRC_URI[md5sum] = "72441753be8ec437af9e5bb89db344e7"
+SRC_URI[sha256sum] = "54e5f153419c22afc283c130c4201db19a3dbd83221a0f4657d5ee66234a2ea4"
-- 
2.17.1

