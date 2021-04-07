Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8039.1617805958475715811
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:32:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lU9ET-0007iS-Ef; Wed, 07 Apr 2021 17:32:37 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/7] python3-tqdm: Upgrade 4.59.0 -> 4.60.0
Date: Wed,  7 Apr 2021 17:32:08 +0300
Message-Id: <20210407143209.21813-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407143209.21813-1-leon.anavi@konsulko.com>
References: <20210407143209.21813-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.60.0:

- add contrib.logging helpers for redirecting to tqdm.write()
- support delay in notebook
- fix contrib.tmap, tzip not using tqdm_class
- add notebook tests
- updates & misc minor fixes for documentation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.59.0.bb => python3-tqdm_4.60.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.59.0.bb => python3-tqdm_4.60.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
index 32e5cf053..e20ba779a 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "d666ae29164da3e517fcf125e41d4fe96e5bb375cd87ff9763f6b38b5592fe33"
+SRC_URI[sha256sum] = "ebdebdb95e3477ceea267decfc0784859aa3df3e27e22d23b83e9b272bf157ae"
 
 inherit pypi setuptools3
 
-- 
2.17.1

