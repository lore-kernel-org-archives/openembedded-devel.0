Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.19127.1617009638770142372
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Mar 2021 02:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=43130 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lQo4a-0002Gp-DB; Mon, 29 Mar 2021 12:20:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-djangorestframework: Upgrade 3.12.3 -> 3.12.4
Date: Mon, 29 Mar 2021 12:20:22 +0300
Message-Id: <20210329092024.11922-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210329092024.11922-1-leon.anavi@konsulko.com>
References: <20210329092024.11922-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.12.4:

- Revert use of deque instead of list for tracking throttling
  .history. Due to incompatibility with DjangoRedis cache backend.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ramework_3.12.3.bb => python3-djangorestframework_3.12.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.12.3.bb => python3-djangorestframework_3.12.4.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.3.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.4.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.12.3.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.12.4.bb
index a75d3f18c..417e36721 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.12.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "2fbbd5c28a1aaa1ad0b721b29e916797fc9aba9f9b3e7619da11c674880fc7aa"
+SRC_URI[sha256sum] = "f747949a8ddac876e879190df194b925c177cdeb725a099db1460872f7c0a7f2"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.17.1

