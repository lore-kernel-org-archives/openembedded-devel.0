Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web08.9769.1603463562075974218
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Oct 2020 07:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34070 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kVy7T-0002Kz-EI; Fri, 23 Oct 2020 17:32:40 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-google-api-python-client: Upgrade 1.12.3 -> 1.12.5
Date: Fri, 23 Oct 2020 17:32:33 +0300
Message-Id: <20201023143233.6911-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201023143233.6911-1-leon.anavi@konsulko.com>
References: <20201023143233.6911-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.5:

- Don't raise when downloading zero byte files

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t_1.12.3.bb => python3-google-api-python-client_1.12.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.3.bb => python3-google-api-python-client_1.12.5.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
index cf65044627..87c2212416 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.5.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "24e87dbe11fbbe3d97f23c230f518531"
-SRC_URI[sha256sum] = "844ef76bda585ea0ea2d5e7f8f9a0eb10d6e2eba66c4fea0210ec7843941cb1a"
+SRC_URI[md5sum] = "4aee3820666e80944f38c39176193d5c"
+SRC_URI[sha256sum] = "1892cd490d164e5ec2f2168dc3b4fa0af68f36ca15a88b91bca1826b3d4f2829"
 
 inherit pypi setuptools3
-- 
2.17.1

