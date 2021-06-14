Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.29883.1623677091326152525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jun 2021 06:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=38640 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lsma5-0004QX-86; Mon, 14 Jun 2021 16:24:50 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-coloredlogs: Upgrade 15.0 -> 15.0.1
Date: Mon, 14 Jun 2021 16:24:34 +0300
Message-Id: <20210614132437.20878-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210614132437.20878-1-leon.anavi@konsulko.com>
References: <20210614132437.20878-1-leon.anavi@konsulko.com>
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

Upgrade to release 15.0.1:

- Bug fix: Restore StandardErrorHandler functionality

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-coloredlogs_15.0.bb => python3-coloredlogs_15.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coloredlogs_15.0.bb => python3-coloredlogs_15.0.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
rename to meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
index daeda6b2ee..5de59d5b45 100644
--- a/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coloredlogs_15.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=764e737b117a38d773609885e8d04f0b"
 
-SRC_URI[sha256sum] = "5e78691e2673a8e294499e1832bb13efcfb44a86b92e18109fa18951093218ab"
+SRC_URI[sha256sum] = "7c991aa71a4577af2f82600d8f8f3a89f936baeaf9b50a9c197da014e5bf16b0"
 
 inherit pypi setuptools3
 
-- 
2.17.1

