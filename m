Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13092.1597146283025550209
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Aug 2020 04:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=37052 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1k5Shq-0004It-PP; Tue, 11 Aug 2020 14:44:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-luma-core: Upgrade 1.14.1 -> 1.15.0
Date: Tue, 11 Aug 2020 14:44:21 +0300
Message-Id: <20200811114430.27916-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.15.0:

- Parallel bus and I2C backpack support

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.14.1.bb => python3-luma-core_1.15.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.14.1.bb => python3-luma-core_1.15.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
index d532405cc..17445e727 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.14.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.15.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "a738326f46c860acf6a4a9b2ec36ba73"
-SRC_URI[sha256sum] = "972dc312b2831fe4c6b51943cc36903a9508cab8d9f2631a7ee485695924d34b"
+SRC_URI[md5sum] = "9c890fa8e387a035ff0d1ae96a0715f1"
+SRC_URI[sha256sum] = "e0e14c762695fb8758e8b15cfd28cd4c1618bf2fd93157c8770a2e8e0e254ae5"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

