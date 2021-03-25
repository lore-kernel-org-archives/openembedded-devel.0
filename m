Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.8133.1616679289198667895
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 06:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38494 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lPQ8N-0007lW-8Z; Thu, 25 Mar 2021 15:34:48 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 04/11] python3-elementpath: Upgrade 2.2.0 -> 2.2.1
Date: Thu, 25 Mar 2021 15:34:29 +0200
Message-Id: <20210325133436.18328-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210325133436.18328-1-leon.anavi@konsulko.com>
References: <20210325133436.18328-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.2.1:

- Add function signatures at token registration
- Some fixes to XPath tokens and more XPath 3.0 implementations

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-elementpath_2.2.0.bb => python3-elementpath_2.2.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_2.2.0.bb => python3-elementpath_2.2.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb b/meta-python/recipes-devtools/python/python3-elementpath_2.2.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_2.2.1.bb
index d1383c049..b0a733968 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_2.2.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "3bbd0e9dcaf9ab7b2080fd4b457d67f166f7c4d1ece7348425195729059b427c"
+SRC_URI[sha256sum] = "c7b996c5624926f329f4379fbcffd5787629e08b2f8d7159d23525e9243ba637"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.17.1

