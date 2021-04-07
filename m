Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web09.7997.1617805962339262995
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 07:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=41274 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lU9ET-0007iS-VJ; Wed, 07 Apr 2021 17:32:41 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-xmlschema: Upgrade 1.5.3 -> 1.6.0
Date: Wed,  7 Apr 2021 17:32:09 +0300
Message-Id: <20210407143209.21813-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210407143209.21813-1-leon.anavi@konsulko.com>
References: <20210407143209.21813-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.6.0:

- XML data bindings and code generators are now considered stable
- Add arguments 'max_depth' and 'extra_validator' to validation
  methods
- Enhance decoding with 'value_hook' argument

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-xmlschema_1.5.3.bb => python3-xmlschema_1.6.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_1.5.3.bb => python3-xmlschema_1.6.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
index 3f9c06365..2d207fb24 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_1.6.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=47489cb18c469474afeb259ed1d4832f"
 
-SRC_URI[sha256sum] = "a7db4c8ae2afa28654d15fcbf5d7f22f0441b5611e50426426e5418f369b5c79"
+SRC_URI[sha256sum] = "e951efc5ab3f251973f92cba7a7026adb32a4cd844d3425133d23eb269de4f8f"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.17.1

