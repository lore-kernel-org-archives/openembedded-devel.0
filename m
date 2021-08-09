Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.22819.1628516559256260920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Aug 2021 06:42:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49496 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mD5Y6-0007HK-0l; Mon, 09 Aug 2021 16:42:38 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/5] python3-send2trash: Upgrade 1.7.1 -> 1.8.0
Date: Mon,  9 Aug 2021 16:42:27 +0300
Message-Id: <20210809134227.27647-5-leon.anavi@konsulko.com>
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

Upgrade to release 1.8.0:

- Add compatibility with pathlib paths
- Fix thread compatibility of modern windows implementation
- Fix handling of UNC names in legacy windows implementation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...{python3-send2trash_1.7.1.bb => python3-send2trash_1.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/send2trash/{python3-send2trash_1.7.1.bb => python3-send2trash_1.8.0.bb} (71%)

diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
similarity index 71%
rename from meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb
rename to meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
index d3554c8031..76f59e2853 100644
--- a/meta-python/recipes-extended/send2trash/python3-send2trash_1.7.1.bb
+++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.8.0.bb
@@ -4,6 +4,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a02659c2d5f4cc626e4dcf6504b865eb"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "17730aa0a33ab82ed6ca76be3bb25f0433d0014f1ccf63c979bab13a5b9db2b2"
+SRC_URI[sha256sum] = "d2c24762fd3759860a0aff155e45871447ea58d2be6bdd39b5c8f966a0c99c2d"
 
 PYPI_PACKAGE = "Send2Trash"
-- 
2.17.1

