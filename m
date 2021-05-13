Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.13242.1620912223111695883
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 May 2021 06:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44224 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lhBJS-0004kU-DG; Thu, 13 May 2021 16:23:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/10] python3-aiohue: Upgrade 2.3.0 -> 2.3.1
Date: Thu, 13 May 2021 16:23:23 +0300
Message-Id: <20210513132332.3745-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.1:

- Handle all client errors when detecting the protocol
- Bump black from 21.5b0 to 21.5b1
- Bump flake8 from 3.9.1 to 3.9.2

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_2.3.0.bb => python3-aiohue_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_2.3.0.bb => python3-aiohue_2.3.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.3.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_2.3.1.bb
index 02f698532e..bb6b951b87 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.3.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "d36fa57747191b92e77c89c453c792f13b9af8f7ca9610bb4bb46f2636a536f6"
+SRC_URI[sha256sum] = "d592a9055b56462312fcfccf46601ed4092698db1be5f3fc30c232ea34c6bbe3"
 
 inherit pypi setuptools3
 
-- 
2.17.1

