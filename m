Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.7877.1617284410702937792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 06:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=33924 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lRxYP-0006Ea-7d; Thu, 01 Apr 2021 16:40:09 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-tqdm: Upgrade 4.58.0 -> 4.59.0
Date: Thu,  1 Apr 2021 16:40:00 +0300
Message-Id: <20210401134000.7628-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210401134000.7628-1-leon.anavi@konsulko.com>
References: <20210401134000.7628-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.59.0:

- add tqdm.dask.TqdmCallback
- add asyncio.gather()
- add basic support for length_hint
- add & update tests
- misc documentation updates
- update contributing guide
- update URLs
- bash completion: add missing --delay
- misc code tidy
- add [notebook] extra

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.58.0.bb => python3-tqdm_4.59.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.58.0.bb => python3-tqdm_4.59.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
index 771016962..32e5cf053 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.59.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "c23ac707e8e8aabb825e4d91f8e17247f9cc14b0d64dd9e97be0781e9e525bba"
+SRC_URI[sha256sum] = "d666ae29164da3e517fcf125e41d4fe96e5bb375cd87ff9763f6b38b5592fe33"
 
 inherit pypi setuptools3
 
-- 
2.17.1

