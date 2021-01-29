Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8929.1611925839905780276
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 05:10:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56034 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l5TXp-0007LC-9P; Fri, 29 Jan 2021 15:10:38 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/4] python3-cantools: Upgrade 36.1.0 -> 36.2.0
Date: Fri, 29 Jan 2021 15:10:27 +0200
Message-Id: <20210129131029.2163-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210129131029.2163-1-leon.anavi@konsulko.com>
References: <20210129131029.2163-1-leon.anavi@konsulko.com>
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

Upgrade to release 36.2.0:

- Make matplotlib optional
- Only run release job for tagged commits

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-cantools_36.1.0.bb => python3-cantools_36.2.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cantools_36.1.0.bb => python3-cantools_36.2.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb b/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
rename to meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
index b2f3fd6d8..632175cc4 100644
--- a/meta-python/recipes-devtools/python/python3-cantools_36.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-cantools_36.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/eerimoq/cantools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d9aa4ec07de78abae21c490c9ffe61bd"
 
-SRC_URI[sha256sum] = "3c4c2652907c48e7013f825cc3068b5d47a38b62f01bd04aaab1d9f69a8f53f5"
+SRC_URI[sha256sum] = "31bcdd56cbb5e26decab42f0624c8cead9b94991f6ee922512b0acd6ae7d6da2"
 
 PYPI_PACKAGE = "cantools"
 
-- 
2.17.1

