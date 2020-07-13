Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web10.14856.1594627122552645381
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 00:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: mingli.yu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 06D7we3a019230
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 00:58:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Mon, 13 Jul 2020 00:58:40 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freeradius: fix the existed certificate error
Date: Mon, 13 Jul 2020 15:55:32 +0800
Message-ID: <20200713075532.3633338-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes the occasional error:
 # cd /etc/raddb/certs
 # ./bootstrap
[snip]
openssl ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key 'whatever' -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
Using configuration from ./client.cnf
Check that the request matches the signature
Signature ok
ERROR:There is already a certificate for /C=FR/ST=Radius/O=Example Inc./CN=user@example.org/emailAddress=user@example.org
The matching entry has the following details
Type          :Valid
Expires on    :200908024833Z
Serial Number :02
File name     :unknown
Subject Name  :/C=FR/ST=Radius/O=Example Inc./CN=user@example.org/emailAddress=user@example.org
make: *** [Makefile:128: client.crt] Error 1

Add the check to fix the above error and it does the same for server.crt.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...file-fix-the-existed-certificate-err.patch | 55 +++++++++++++++++++
 .../freeradius/freeradius_3.0.20.bb           |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
new file mode 100644
index 000000000..669f363e7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
@@ -0,0 +1,55 @@
+From 084f5467672f2ae37003b77e8f8706772f3da3ec Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Mon, 13 Jul 2020 07:01:45 +0000
+Subject: [PATCH] raddb/certs/Makefile: fix the existed certificate error
+
+Fixes:
+ # ./bootstrap
+ [snip]
+openssl ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key 'whatever' -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
+Using configuration from ./client.cnf
+Check that the request matches the signature
+Signature ok
+ERROR:There is already a certificate for /C=FR/ST=Radius/O=Example Inc./CN=user@example.org/emailAddress=user@example.org
+The matching entry has the following details
+Type          :Valid
+Expires on    :200908024833Z
+Serial Number :02
+File name     :unknown
+Subject Name  :/C=FR/ST=Radius/O=Example Inc./CN=user@example.org/emailAddress=user@example.org
+make: *** [Makefile:128: client.crt] Error 1
+
+Add the check to fix the above error and it does the same for server.crt.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ raddb/certs/Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
+index 5cbfd467ce..77eec9baa1 100644
+--- a/raddb/certs/Makefile
++++ b/raddb/certs/Makefile
+@@ -92,7 +92,7 @@ server.csr server.key: server.cnf
+ 	chmod g+r server.key
+ 
+ server.crt: server.csr ca.key ca.pem
+-	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
++	@[ -f server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
+ 
+ server.p12: server.crt
+ 	$(OPENSSL) pkcs12 -export -in server.crt -inkey server.key -out server.p12  -passin pass:$(PASSWORD_SERVER) -passout pass:$(PASSWORD_SERVER)
+@@ -117,7 +117,7 @@ client.csr client.key: client.cnf
+ 	chmod g+r client.key
+ 
+ client.crt: client.csr ca.pem ca.key
+-	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
++	@[ -f client.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
+ 
+ client.p12: client.crt
+ 	$(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
index 005ca47da..d2046d72e 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
@@ -27,6 +27,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://freeradius-fix-error-for-expansion-of-macro.patch \
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
     file://0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch \
+    file://0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
-- 
2.26.2

