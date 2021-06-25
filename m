Received: from anavi.org (anavi.org [91.215.217.29])
 by mx.groups.io with SMTP id smtpd.web12.5554.1624616163294275838
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Jun 2021 03:16:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 spf.securedserverspace.com}: parse error for token &{10 18 _netblocks4.securedserverspace.com}: limit exceeded (domain: konsulko.com, ip: 91.215.217.29, mailfrom: leon.anavi@konsulko.com)
Received: from [78.130.197.211] (port=34510 helo=localhost.localdomain)
	by voyager.icnhost.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <leon.anavi@konsulko.com>)
	id 1lwisN-0005zp-Ui; Fri, 25 Jun 2021 13:15:56 +0300
From: "Leon Anavi" <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 6/6] python3-google-api-python-client: Upgrade 2.6.0 -> 2.10.0
Date: Fri, 25 Jun 2021 13:15:45 +0300
Message-Id: <20210625101545.30040-6-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625101545.30040-1-leon.anavi@konsulko.com>
References: <20210625101545.30040-1-leon.anavi@konsulko.com>
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

Upgrade to release 2.10.0:

analyticsadmin: update the api
androidmanagement: update the api
bigqueryreservation: update the api
dialogflow: update the api
firebaserules: update the api
iap: update the api
keep: update the api
managedidentities: update the api

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...python3-google-api-python-client_2.10.0.bb | 20 +++++++++++++++++++
 .../python3-google-api-python-client_2.6.0.bb |  9 ---------
 2 files changed, 20 insertions(+), 9 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb
 delete mode 100644 meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb
new file mode 100644
index 0000000000..b406f677d8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.10.0.bb
@@ -0,0 +1,20 @@
+SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, \
+Moderator, and many other Google APIs."
+HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
+
+SRC_URI[sha256sum] = "58424d263344625dcf4dc08e7639a6714737102ab4ae83e5f043e3db08d9965f"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-json \
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-httplib2 \
+    ${PYTHON_PN}-uritemplate \
+    ${PYTHON_PN}-google-api-core \
+"
diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb
deleted file mode 100644
index c6ae6e8475..0000000000
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.6.0.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-SUMMARY = "The Google API Client for Python is a client library for accessing the Plus, \
-Moderator, and many other Google APIs."
-HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
-
-SRC_URI[sha256sum] = "6a87f324334247bf7ba24406da586424b09e715d04336fb7cf45a402b80d38e8"
-
-inherit pypi setuptools3
-- 
2.17.1

