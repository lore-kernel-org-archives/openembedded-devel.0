Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.16001.1593011824309056139
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2020 08:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=53538 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1jo796-00035d-O8; Wed, 24 Jun 2020 18:17:05 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 09/10] python3-license-expression: Upgrade 1.0 -> 1.2
Date: Wed, 24 Jun 2020 18:16:27 +0300
Message-Id: <20200624151628.547-9-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200624151628.547-1-leon.anavi@konsulko.com>
References: <20200624151628.547-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.2:

- Add ability to render WITH expression wrapped in parenthesis
- Fix anomalous backslashes in strings
- Update the thirdparty directory structure

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...se-expression_1.0.bb => python3-license-expression_1.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-license-expression_1.0.bb => python3-license-expression_1.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
rename to meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
index b1c38e95d..c033bd352 100644
--- a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-license-expression_1.2.bb
@@ -4,8 +4,8 @@ HOMEPAGE = "https://github.com/nexB/license-expression"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
-SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
+SRC_URI[md5sum] = "fd4cb295cc345be1071274cdbd81c969"
+SRC_URI[sha256sum] = "7960e1dfdf20d127e75ead931476f2b5c7556df05b117a73880b22ade17d1abc"
 
 inherit pypi ptest setuptools3
 
-- 
2.17.1

