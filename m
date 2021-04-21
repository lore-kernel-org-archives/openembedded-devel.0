Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.9023.1618991947636141453
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 00:59:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41746 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lZ7lJ-0002oU-W6; Wed, 21 Apr 2021 10:59:06 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-huey: Upgrade 2.3.1 -> 2.3.2
Date: Wed, 21 Apr 2021 10:58:43 +0300
Message-Id: <20210421075843.17725-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421075843.17725-1-leon.anavi@konsulko.com>
References: <20210421075843.17725-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.3.2:

- Add hook (Huey.build_error_result) for customizing the error
  result metadata.
- Avoid crashing if another module already modified/set the
  multiprocessing start method.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-huey_2.3.1.bb => python3-huey_2.3.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.3.1.bb => python3-huey_2.3.2.bb} (70%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb b/meta-python/recipes-devtools/python/python3-huey_2.3.2.bb
similarity index 70%
rename from meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.3.2.bb
index d8141c8e81..4ef80c4a85 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.3.2.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "de9b6d0fd59794378fe05813d302be68038044ef3b68274b84ca8d285e20f803"
+SRC_URI[sha256sum] = "7176acb113850824490da5a31f328cc48a2002a59bfb396efbab8ecbd3573910"
 
 inherit pypi setuptools3
 
-- 
2.17.1

