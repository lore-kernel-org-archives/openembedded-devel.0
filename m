Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.57253.1600074273058443838
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Sep 2020 02:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52584 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kHkPX-0007z1-PA; Mon, 14 Sep 2020 12:04:32 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 07/10] python3-trafaret: Upgrade 2.0.2 -> 2.1.0
Date: Mon, 14 Sep 2020 12:04:16 +0300
Message-Id: <20200914090419.19171-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914090419.19171-1-leon.anavi@konsulko.com>
References: <20200914090419.19171-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.1.0:

- fix for `Dict` merge
- new `is_valid` method

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-trafaret_2.0.2.bb => python3-trafaret_2.1.0.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trafaret_2.0.2.bb => python3-trafaret_2.1.0.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb b/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
index 4e814073b..96602016e 100644
--- a/meta-python/recipes-devtools/python/python3-trafaret_2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-trafaret_2.1.0.bb
@@ -3,7 +3,8 @@ SUMMARY = "Ultimate transformation library that supports validation, contexts an
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=21ecc7aa8f699874e706fc1354903437"
 
-SRC_URI[sha256sum] = "61dfc25b574f70bfdf7ee3a808ec423061811c13a10b8d3c9e11ab539b96ab65"
+SRC_URI[sha256sum] = "72c342ede27fb34cd219b62855119380ae1c87006b6106be163c01159eb955ff"
+SRC_URI[md5sum] = "228675376012fb27dd7f70ab685e7766"
 
 inherit pypi setuptools3
 
-- 
2.17.1

