Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.8793.1624547036415997030
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Jun 2021 08:03:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=60152 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwQtW-00022Q-DC; Thu, 24 Jun 2021 18:03:54 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-tqdm: Upgrade 4.61.0 -> 4.61.1
Date: Thu, 24 Jun 2021 18:03:47 +0300
Message-Id: <20210624150347.5849-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624150347.5849-1-leon.anavi@konsulko.com>
References: <20210624150347.5849-1-leon.anavi@konsulko.com>
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

Upgrade to release 4.61.1:

- fix utils._screen_shape_linux() sometimes raising ValueError
- minor build/CI framework updates
- minor documentation updates

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tqdm_4.61.0.bb => python3-tqdm_4.61.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.61.0.bb => python3-tqdm_4.61.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.61.0.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.61.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.61.0.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.61.1.bb
index 0c04b676a6..7fa30e7f9c 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.61.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.61.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT & MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=59e4271a933d33edfe60237db377a14b"
 
-SRC_URI[sha256sum] = "cd5791b5d7c3f2f1819efc81d36eb719a38e0906a7380365c556779f585ea042"
+SRC_URI[sha256sum] = "24be966933e942be5f074c29755a95b315c69a91f839a29139bf26ffffe2d3fd"
 
 inherit pypi setuptools3
 
-- 
2.17.1

