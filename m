Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.8114.1627557928624693098
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 04:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41638 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1m94AI-0000JQ-Q2; Thu, 29 Jul 2021 14:25:27 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-zeroconf: Upgrade 0.33.1 -> 0.33.2
Date: Thu, 29 Jul 2021 14:25:18 +0300
Message-Id: <20210729112518.26031-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210729112518.26031-1-leon.anavi@konsulko.com>
References: <20210729112518.26031-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.33.2:

- Handle duplicate goodbye answers in the same packet
- Skip ipv6 interfaces that return ENODEV

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-zeroconf_0.33.1.bb => python3-zeroconf_0.33.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.33.1.bb => python3-zeroconf_0.33.2.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.33.1.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.33.2.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.33.1.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.33.2.bb
index a0af8420f4..8861378b56 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.33.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "ac88738639669f924859a4e01d9742f3783e619e710103f4a0d321a47f260fd2"
+SRC_URI[sha256sum] = "5a59425d225a1f5fba0196766fccf856d4686f653037108cbc643a76c1a884fd"
 
 inherit pypi setuptools3
 
-- 
2.17.1

