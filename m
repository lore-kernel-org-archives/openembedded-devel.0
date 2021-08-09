Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.22817.1628516556329679931
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mD5Y1-0007HK-4R; Mon, 09 Aug 2021 16:42:34 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-gast: Upgrade 0.5.1 -> 0.5.2
Date: Mon,  9 Aug 2021 16:42:24 +0300
Message-Id: <20210809134227.27647-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809134227.27647-1-leon.anavi@konsulko.com>
References: <20210809134227.27647-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.5.2:

- Test field count more accurately

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-gast_0.5.1.bb => python3-gast_0.5.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gast_0.5.1.bb => python3-gast_0.5.2.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-gast_0.5.1.bb b/meta-python/recipes-devtools/python/python3-gast_0.5.2.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-gast_0.5.1.bb
rename to meta-python/recipes-devtools/python/python3-gast_0.5.2.bb
index eda18602fb..d318973a17 100644
--- a/meta-python/recipes-devtools/python/python3-gast_0.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-gast_0.5.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3ad9b6802e713fc5e307e1230f1ea90"
 
-SRC_URI[sha256sum] = "b00e63584db482ffe6107b5832042bbe5c5bf856e3c7279b6e93201b3dcfcb46"
+SRC_URI[sha256sum] = "f81fcefa8b982624a31c9e4ec7761325a88a0eba60d36d1da90e47f8fe3c67f7"
 
 inherit pypi setuptools3
 
-- 
2.17.1

