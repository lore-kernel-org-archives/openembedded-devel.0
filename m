Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.51777.1629279663418745697
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Aug 2021 02:41:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=57436 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mGI4A-00018Q-68; Wed, 18 Aug 2021 12:41:02 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-tzlocal: Upgrade 2.1 -> 3.0
Date: Wed, 18 Aug 2021 12:40:37 +0300
Message-Id: <20210818094038.21474-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818094038.21474-1-leon.anavi@konsulko.com>
References: <20210818094038.21474-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.0:

- Modernized the packaging, moving to setup.cfg etc.
- Handles if the text config files incorrectly is a TZ file.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-tzlocal_2.1.bb => python3-tzlocal_3.0.bb}  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tzlocal_2.1.bb => python3-tzlocal_3.0.bb} (62%)

diff --git a/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb b/meta-python/recipes-devtools/python/python3-tzlocal_3.0.bb
similarity index 62%
rename from meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
rename to meta-python/recipes-devtools/python/python3-tzlocal_3.0.bb
index 56a8fc06f8..a9d372ee98 100644
--- a/meta-python/recipes-devtools/python/python3-tzlocal_2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzlocal_3.0.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://pypi.org/project/tzlocal/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=57e0bd61643d81d05683cdce65b11d10"
 
-SRC_URI[md5sum] = "c0877603ff9de71cd8ca6ee2b50d2ebd"
-SRC_URI[sha256sum] = "643c97c5294aedc737780a49d9df30889321cbe1204eac2c2ec6134035a92e44"
+SRC_URI[sha256sum] = "f4e6e36db50499e0d92f79b67361041f048e2609d166e93456b50746dc4aef12"
 
 inherit pypi setuptools3
-- 
2.17.1

