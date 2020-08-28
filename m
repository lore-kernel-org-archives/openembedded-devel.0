Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web10.43306.1598622709197864213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2020 06:51:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=49752 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(Exim 4.92)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1kBenD-0004K0-Kb; Fri, 28 Aug 2020 16:51:48 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-google-api-python-client: Upgrade 1.10.1 -> 1.11.0
Date: Fri, 28 Aug 2020 16:51:30 +0300
Message-Id: <20200828135131.26321-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200828135131.26321-1-leon.anavi@konsulko.com>
References: <20200828135131.26321-1-leon.anavi@konsulko.com>
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

Upgrade to release 1.11.0:

- Add support for mtls env variables

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...t_1.10.1.bb => python3-google-api-python-client_1.11.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_1.10.1.bb => python3-google-api-python-client_1.11.0.bb} (69%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
similarity index 69%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
index b52dd467b..c14b17254 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_1.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_1.11.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
 
-SRC_URI[md5sum] = "016caa49075275f02f9b8f199dc96a75"
-SRC_URI[sha256sum] = "aa8740103774c2b7859f73ba6f55211e794ed7a374c5c427b583869b6bfe9e6c"
+SRC_URI[md5sum] = "b9a09d60cffda35887a8e09b600a73b0"
+SRC_URI[sha256sum] = "caf4015800ef1a18d06d117f47f0219c0c0641f21978f6b1bb5ede7912fab97b"
 
 inherit pypi setuptools3
-- 
2.17.1

