Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.15155.1598520602707849820
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2020 02:30:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=58710 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBEEJ-0005Nx-24; Thu, 27 Aug 2020 12:30:00 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/3] python3-google-api-python-client: Upgrade 1.10.0 -> 1.10.1
Date: Thu, 27 Aug 2020 12:29:49 +0300
Message-Id: <20200827092951.15749-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
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

Upgrade to release 1.10.1:

- Bug fix: discovery uses V2 when version is None
- Fix deprecation warnings due to invalid escape sequences
- Fix link to service accounts documentation
- Update generated docs

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t_1.10.0.bb => python3-google-api-python-client_1.10.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.10.0.bb => python3-google-api-python-client_1.10.1.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
index 37b6fc621..b52dd467b 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "a0064953388af9f9c61d8347f1e2ae0c"
-SRC_URI[sha256sum] = "fa24f07f6124ff2e91ee9b7550e240481bcb31b8f77a75e8d481be1c44a6ff07"
+SRC_URI[md5sum] = "016caa49075275f02f9b8f199dc96a75"
+SRC_URI[sha256sum] = "aa8740103774c2b7859f73ba6f55211e794ed7a374c5c427b583869b6bfe9e6c"
 
 inherit pypi setuptools3
-- 
2.17.1

