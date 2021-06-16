Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.5251.1623836058675133842
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 02:34:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=47840 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1ltRw8-0004CE-W2; Wed, 16 Jun 2021 12:34:17 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-humanize: Upgrade 3.7.1 -> 3.9.0
Date: Wed, 16 Jun 2021 12:34:07 +0300
Message-Id: <20210616093408.19873-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210616093408.19873-1-leon.anavi@konsulko.com>
References: <20210616093408.19873-1-leon.anavi@konsulko.com>
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

Upgrade to release 3.9.0:

- Move vi_VI to vi_VN and update some translations
- Add Slovenian translation

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-humanize_3.7.1.bb => python3-humanize_3.9.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.7.1.bb => python3-humanize_3.9.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.7.1.bb b/meta-python/recipes-devtools/python/python3-humanize_3.9.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.9.0.bb
index 977b6ebfec..f3a11745e1 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.9.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "b8e7878f3063174b212bb82b9e5bee3b24bc47931e44df0bd34bcb1d8e0acf2f"
+SRC_URI[sha256sum] = "892a5b7b87763c4c6997a58382c2b1f4614048a2e01c23ef1bb0456e6f9d4d5d"
 
 inherit pypi setuptools3
 
-- 
2.17.1

