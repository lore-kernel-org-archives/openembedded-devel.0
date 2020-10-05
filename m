Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web11.32915.1601898915874442994
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 04:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=44266 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kPP5F-0004NT-8z; Mon, 05 Oct 2020 14:55:14 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/5] python3-google-api-python-client: Upgrade 1.12.2 -> 1.12.3
Date: Mon,  5 Oct 2020 14:55:04 +0300
Message-Id: <20201005115507.11563-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201005115507.11563-1-leon.anavi@konsulko.com>
References: <20201005115507.11563-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.12.3:

- deps: update setup.py to install httplib2>=0.15.0

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t_1.12.2.bb => python3-google-api-python-client_1.12.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.12.2.bb => python3-google-api-python-client_1.12.3.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
index 4fcdb66b0d..cf65044627 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.2.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.12.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "94d58d98a32b85cf455d8b4f0737b4b5"
-SRC_URI[sha256sum] = "54a7d330833a2e7b0587446d7e4ae6d0244925a9a8e1dfe878f3f7e06cdedb62"
+SRC_URI[md5sum] = "24e87dbe11fbbe3d97f23c230f518531"
+SRC_URI[sha256sum] = "844ef76bda585ea0ea2d5e7f8f9a0eb10d6e2eba66c4fea0210ec7843941cb1a"
 
 inherit pypi setuptools3
-- 
2.17.1

