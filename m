Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.5443.1628584275329084030
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 01:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53578 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDNAE-0005EL-R4; Tue, 10 Aug 2021 11:31:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-aiohue: Upgrade 2.5.1 -> 2.6.1
Date: Tue, 10 Aug 2021 11:30:55 +0300
Message-Id: <20210810083058.29524-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210810083058.29524-1-leon.anavi@konsulko.com>
References: <20210810083058.29524-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.6.1:

- Fix temperature event
- Store last event on devices

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aiohue_2.5.1.bb => python3-aiohue_2.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohue_2.5.1.bb => python3-aiohue_2.6.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohue_2.5.1.bb b/meta-python/recipes-devtools/python/python3-aiohue_2.6.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-aiohue_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-aiohue_2.6.1.bb
index 6ea4da3eae..c79a922a29 100644
--- a/meta-python/recipes-devtools/python/python3-aiohue_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohue_2.6.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=dab31a1d28183826937f4b152143a33f"
 
-SRC_URI[sha256sum] = "3ee8e857b07364516f8b9f0e5c52d4cd775036f3ace37c2769de1e8579f4dc07"
+SRC_URI[sha256sum] = "1374f7fc50bac46375e18ce7d511515265ce83c9180f312e60a36d63055f0104"
 
 inherit pypi setuptools3
 
-- 
2.17.1

