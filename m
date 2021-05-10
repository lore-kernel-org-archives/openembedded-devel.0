Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.32336.1620655657536049599
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 07:07:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57184 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lg6ZK-000657-Hv; Mon, 10 May 2021 17:07:36 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 03/10] python3-elementpath: Upgrade 2.2.1 -> 2.2.2
Date: Mon, 10 May 2021 17:07:15 +0300
Message-Id: <20210510140722.27201-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510140722.27201-1-leon.anavi@konsulko.com>
References: <20210510140722.27201-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.2:

- Fix issue sissaschool/xmlschema#243 (assert with xsi:nil usage)
- First implementation of XPath 3.0 fn:format-integer

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-elementpath_2.2.1.bb => python3-elementpath_2.2.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.2.1.bb => python3-elementpath_2.2.2.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.2.1.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.2.2.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.2.1.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.2.2.bb
index b0a7339687..c793592bea 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.2.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "c7b996c5624926f329f4379fbcffd5787629e08b2f8d7159d23525e9243ba637"
+SRC_URI[sha256sum] = "68de07c1aec3b1d33126111252cc699600dd1e45802625344aa6eb9e680ef157"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.17.1

