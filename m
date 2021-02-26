Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.7809.1614337779963347501
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Feb 2021 03:09:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=54444 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lFb04-0007VN-Eh; Fri, 26 Feb 2021 13:09:37 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-tqdm: Upgrade 4.57.0 -> 4.58.0
Date: Fri, 26 Feb 2021 13:09:29 +0200
Message-Id: <20210226110931.6287-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.58.0:

- add start delay in seconds
- add tests
- misc code tidy
- misc documentation updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.57.0.bb => python3-tqdm_4.58.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.57.0.bb => python3-tqdm_4.58.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
index 50133bdadf..771016962d 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.57.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.58.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "65185676e9fdf20d154cffd1c5de8e39ef9696ff7e59fe0156b1b08e468736af"
+SRC_URI[sha256sum] = "c23ac707e8e8aabb825e4d91f8e17247f9cc14b0d64dd9e97be0781e9e525bba"
 
 inherit pypi setuptools3
 
-- 
2.17.1

