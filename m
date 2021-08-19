Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.67664.1629367265231000516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 03:01:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=35534 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGer3-00066X-Rw; Thu, 19 Aug 2021 13:01:04 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-unidiff: Upgrade 0.6.0 -> 0.7.0
Date: Thu, 19 Aug 2021 13:00:46 +0300
Message-Id: <20210819100046.24493-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210819100046.24493-1-leon.anavi@konsulko.com>
References: <20210819100046.24493-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.7.0:

- Fixed issues handling multiple git renames.
- Renamed files return target filename as PatchedFile.path.
- Fixed error when first change is a binary file.
- Added source code type hints.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-unidiff_0.6.0.bb => python3-unidiff_0.7.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-unidiff_0.6.0.bb => python3-unidiff_0.7.0.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.7.0.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-unidiff_0.7.0.bb
index 93e9ae012b..b3013180d1 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.7.0.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "http://github.com/matiasb/python-unidiff"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
 
-SRC_URI[md5sum] = "ae9524079753df7b1239f0378ed326b7"
-SRC_URI[sha256sum] = "90c5214e9a357ff4b2fee19d91e77706638e3e00592a732d9405ea4e93da981f"
+SRC_URI[sha256sum] = "91bb13b4969514a400679d9ae5e29a6ffad85346087677f8b5e2e036af817447"
 
 inherit pypi setuptools3 ptest
 
-- 
2.17.1

