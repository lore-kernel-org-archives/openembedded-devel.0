Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.7141.1611310304192562351
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jan 2021 02:11:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=52170 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2tPn-0000CW-Js; Fri, 22 Jan 2021 12:11:43 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-smbus2: Upgrade 0.4.0 -> 0.4.1
Date: Fri, 22 Jan 2021 12:11:23 +0200
Message-Id: <20210122101126.25982-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210122101126.25982-1-leon.anavi@konsulko.com>
References: <20210122101126.25982-1-leon.anavi@konsulko.com>
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

Upgrade to release 0.4.1:

- SonarCloud quality checks.
- Tests added to the dist package.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-smbus2_0.4.0.bb => python3-smbus2_0.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.4.0.bb => python3-smbus2_0.4.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
index 1f6f61137..fe0b8d1ef 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.4.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1b5c690715e1efab39e41038147dfba75afc72a10f76b3f0310d783e9f8a83a6"
+SRC_URI[sha256sum] = "6276eb599b76c4e74372f2582d2282f03b4398f0da16bc996608e4f21557ca9b"
 
 CLEANBROKEN = "1"
 
-- 
2.17.1

