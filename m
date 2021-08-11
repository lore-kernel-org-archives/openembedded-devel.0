Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.5259.1628673345216246024
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Aug 2021 02:15:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=50486 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1mDkKs-0001XG-OB; Wed, 11 Aug 2021 12:15:44 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-google-auth: Upgrade 1.32.0 -> 1.34.0
Date: Wed, 11 Aug 2021 12:15:27 +0300
Message-Id: <20210811091530.26594-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210811091530.26594-1-leon.anavi@konsulko.com>
References: <20210811091530.26594-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.34.0:

- support refresh callable on google.oauth2.credentials.Credentials
- do not use the GAE APIs on gen2+ runtimes

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-google-auth_1.32.0.bb => python3-google-auth_1.34.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_1.32.0.bb => python3-google-auth_1.34.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_1.34.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_1.34.0.bb
index 72dd24dedb..92ad24800f 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_1.32.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_1.34.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e34e5f5de5610b202f9b40ebd9f8b27571d5c5537db9afed3a72b2db5a345039"
+SRC_URI[sha256sum] = "f1094088bae046fb06f3d1a3d7df14717e8d959e9105b79c57725bd4e17597a2"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.17.1

