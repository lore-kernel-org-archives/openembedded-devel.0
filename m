Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.196532.1598280616033038075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 07:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=39680 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kADnY-0006gX-GA; Mon, 24 Aug 2020 17:50:15 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/7] python3-dominate: Upgrade 2.5.1 -> 2.5.2
Date: Mon, 24 Aug 2020 17:49:59 +0300
Message-Id: <20200824145004.12568-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824145004.12568-1-leon.anavi@konsulko.com>
References: <20200824145004.12568-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.5.2:

- Removed 'input' keyword reassignment
- Bug fix: underscores not working in aria attributes
- Adding some missing attrs to DASHED_ATTRIBUTES

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-dominate_2.5.1.bb => python3-dominate_2.5.2.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dominate_2.5.1.bb => python3-dominate_2.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb b/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
index 75dd4ef9f..204433894 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_2.5.2.bb
@@ -2,8 +2,8 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[md5sum] = "35eeb6b5587c8c9a51cd22c83e07ac49"
-SRC_URI[sha256sum] = "9b05481605ea8c0afd0a98c0156a9fb78d9c406368d66b3e6fedf36920fb9d78"
+SRC_URI[md5sum] = "4a249c71cb009815923e9a47fa03ca08"
+SRC_URI[sha256sum] = "456facce7a7ccfd9363948109cf1e978d48c58e46a46b01c71b4c0adc73b1928"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

