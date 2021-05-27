Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.6800.1622121611327524168
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 May 2021 06:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=56734 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lmFvi-0003sv-3F; Thu, 27 May 2021 16:20:10 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/6] python3-aenum: Upgrade 3.0.0 -> 3.1.0
Date: Thu, 27 May 2021 16:19:49 +0300
Message-Id: <20210527131952.20082-3-leon.anavi@konsulko.com>
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

Upgrade to release 3.1.0:

- AddValue is similar to the old AutoNumber: it will always
  activate, but uses _generate_next_value_ to get the next value
  (so the user has some control over the return data type instead
  of always getting an int).

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-aenum_3.0.0.bb => python3-aenum_3.1.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aenum_3.0.0.bb => python3-aenum_3.1.0.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb b/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
rename to meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
index cb8462d24..cb5eab15a 100644
--- a/meta-python/recipes-devtools/python/python3-aenum_3.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-aenum_3.1.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/aenum/"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://aenum/LICENSE;md5=c6a85477543f8b8591b9c1f82abebbe9"
 
-SRC_URI[sha256sum] = "17cd8cfed1ee4b617198c9fabbabd70ebd8f01e54ac29cd6c3a92df14bd86656"
+SRC_URI[sha256sum] = "87f0e9ef4f828578ab06af30e4d7944043bf4ecd3f4b7bd1cbe37e2173cde94a"
 
 inherit pypi setuptools3
 
-- 
2.17.1

