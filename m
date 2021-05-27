Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.6804.1622121620771446353
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:20:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56734 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmFvv-0003sv-U9; Thu, 27 May 2021 16:20:20 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-tqdm: Upgrade 4.60.0 -> 4.61.0
Date: Thu, 27 May 2021 16:19:52 +0300
Message-Id: <20210527131952.20082-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210527131952.20082-1-leon.anavi@konsulko.com>
References: <20210527131952.20082-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.61.0:

- keras support for initial_epoch
- misc documentation updates
- fix & update tests
- minor framework updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.60.0.bb => python3-tqdm_4.61.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.60.0.bb => python3-tqdm_4.61.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.61.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.61.0.bb
index e20ba779a..0c04b676a 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.60.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.61.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "ebdebdb95e3477ceea267decfc0784859aa3df3e27e22d23b83e9b272bf157ae"
+SRC_URI[sha256sum] = "cd5791b5d7c3f2f1819efc81d36eb719a38e0906a7380365c556779f585ea042"
 
 inherit pypi setuptools3
 
-- 
2.17.1

