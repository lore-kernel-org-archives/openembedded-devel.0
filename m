Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.6473.1602660786291403514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 00:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=36146 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kSbHU-00067Q-Sy; Wed, 14 Oct 2020 10:33:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-luma-core: Upgrade 1.17.1 -> 1.17.2
Date: Wed, 14 Oct 2020 10:32:55 +0300
Message-Id: <20201014073256.9605-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014073256.9605-1-leon.anavi@konsulko.com>
References: <20201014073256.9605-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.17.2:

- Remove SPI cs_high capability (causing SystemException in latest
  version of spidev on 5.4 kernel line)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-luma-core_1.17.1.bb => python3-luma-core_1.17.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-luma-core_1.17.1.bb => python3-luma-core_1.17.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb b/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
rename to meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
index 9246d1b3a6..97786ff456 100644
--- a/meta-python/recipes-devtools/python/python3-luma-core_1.17.1.bb
+++ b/meta-python/recipes-devtools/python/python3-luma-core_1.17.2.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=eda804060ba2312e41fe96b6fa334fd7"
 
 inherit pypi setuptools3
 
-SRC_URI[md5sum] = "dea76a83c7130f59b7e807c3b2f1b3b5"
-SRC_URI[sha256sum] = "b4a9f934f4dbf9b1d5c74259f871b4187aaa754b139964153f7702badaaccffd"
+SRC_URI[md5sum] = "4e4a5e85ccf19eba001d11d95b33b174"
+SRC_URI[sha256sum] = "d66b98e23470f023a6423273e9632180a1a941849f1417c69a708ca51861c993"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

