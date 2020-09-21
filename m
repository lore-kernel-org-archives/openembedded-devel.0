Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.42615.1600695858057717902
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Sep 2020 06:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37232 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kKM75-0004UL-98; Mon, 21 Sep 2020 16:44:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-luma-core: Upgrade 1.16.1 -> 1.16.2
Date: Mon, 21 Sep 2020 16:44:02 +0300
Message-Id: <20200921134405.676-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921134405.676-1-leon.anavi@konsulko.com>
References: <20200921134405.676-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.16.2:
- Added new parallel interface module
- Renamed parallel class to bitbang_6800; moved to parallel module

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.16.1.bb => python3-luma-core_1.16.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.16.1.bb => python3-luma-core_1.16.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
index 3428dbe9f8..e8a61ad062 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.16.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.16.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "de7bda49c4146ba242923a88c587cd7a"
-SRC_URI[sha256sum] = "2181a60906fea3104dcfa3923f9654928502cd7541ff9b4d76c6ae29c6a9d9fc"
+SRC_URI[md5sum] = "8889ee9eb95c3441ee65b4b5f4a022eb"
+SRC_URI[sha256sum] = "518fe4e3286a4e2a75788713a58de403e6bba6d4c909fa5ce0fe14aceb05b85e"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

