Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.26250.1611141038772589958
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 03:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=45624 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1l2BNk-0007qB-2j; Wed, 20 Jan 2021 13:10:36 +0200
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-google-api-python-client: Upgrade 1.12.5 -> 1.12.8
Date: Wed, 20 Jan 2021 13:10:24 +0200
Message-Id: <20210120111027.12947-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210120111027.12947-1-leon.anavi@konsulko.com>
References: <20210120111027.12947-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.8:

- add httplib2 authorization to thread_safety

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...nt_1.12.5.bb => python3-google-api-python-client_1.12.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.5.bb => python3-google-api-python-client_1.12.8.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
index 87c221241..1774f962e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.8.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "4aee3820666e80944f38c39176193d5c"
-SRC_URI[sha256sum] = "1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829"
+SRC_URI[sha256sum] = "f3b9684442eec2cfe9f9bb48e796ef919456b82142c7528c5fd527e5224f08bb"
 
 inherit pypi setuptools3
-- 
2.17.1

