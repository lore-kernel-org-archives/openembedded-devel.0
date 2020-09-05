Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.3142.1599324978625851532
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WQTg7rpQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id u13so5950056pgh.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=HW/r8MMshm3JaEe2d4O5r+OgX+ppZAwNyiHpFBxSne8=;
        b=WQTg7rpQgzlsioVt86+wHTCFdHDn1workFfZkaSaI3RnTBeWpvwn7Tx7AtJV74WsfR
         nN8VY1pAjCNEKUkBsNjZXu7/jZ6hhmC+zf7z1NMqvoyvN/n+wnKPuU7paU7TxJ+sIwHb
         rrD189QBd/t8tjn3c/Qr4kAKSSTBxyIb1S9gf3ziF9vXv0ULp75W+NRzYFj1hoHZJ7kT
         1vwix5Urm5MHVrbgUbIe40R8EKB9rHKfrV1o9PPgUS31i5nVSsINhgwiJsUxZolFGVow
         /xB7C/eB3AQF1tlYwNwgGZfy9Xo8m3LQfQHPaW+FulOLSYZmum2Ac9fCLY8z4E5vzwkc
         SdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=HW/r8MMshm3JaEe2d4O5r+OgX+ppZAwNyiHpFBxSne8=;
        b=NOJuYEgNwhJ8Fgyt6k0T/Wg4l1pdi8rsasXN6mKl44N+RQUBkHiSVGu5ieaC1YftwP
         Ash42Hxil1WM3CK1+OzujJBqPEXImvwwrBv/9fX8RmOfWP8ngH9sHop1D742GEZmbopY
         qKNVyIKbUGQvu3Wz5i/2/9grG3sPftC4Hsx9CEmFbgMMnnL8789WsK+KPtM2gPTOcKyb
         JJiecapnY6J2sOFE7JLWzxOcnCOdCpA9Ut29MrORBj9Zv4Tf9SFn7qCDjgmC5nlYVmWZ
         6tqRD68Q7ARCjiaQjg++jGJfWUKgcJzzznCD4XdeSygSHzdWg/PJARm5j2LPDGq1Lnlw
         4saA==
X-Gm-Message-State: AOAM530vYkg05UP+tICiFK5l0p7beubpXJngRcHuLo4GjpDhfZX+m8XB
	A5NHHwRjwfDw0b2RjOyIPCkjLnBT2ho=
X-Google-Smtp-Source: ABdhPJw3XR1bZFvS8fEtI1gnqpjE48R0bHhSNilBSISLxeDMt8HxD3Y0012lf0grfWKQNOernSYW4A==
X-Received: by 2002:a63:f56:: with SMTP id 22mr4614327pgp.438.1599324977767;
        Sat, 05 Sep 2020 09:56:17 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:17 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 13/20] freeradius: fix the occasional verification failure
Date: Sat,  5 Sep 2020 09:55:56 -0700
Message-Id: <5aa6849a907c1827df256773dc8c0c739dfa183c.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  # cd /etc/raddb/certs
  # ./bootstrap
[snip]
chmod g+r ca.key
openssl pkcs12 -in server.p12 -out server.pem -passin pass:'whatever' -passout pass:'whatever'
chmod g+r server.pem
C = FR, ST = Radius, O = Example Inc., CN = Example Server Certificate, emailAddress = admin@example.org
error 7 at 0 depth lookup: certificate signature failure
140066667427072:error:04067084:rsa routines:rsa_ossl_public_decrypt:data too large for modulus:../openssl-1.1.1g/crypto/rsa/rsa_ossl.c:553:
140066667427072:error:0D0C5006:asn1 encoding routines:ASN1_item_verify:EVP lib:../openssl-1.1.1g/crypto/asn1/a_verify.c:170:
error server.pem: verification failed
make: *** [Makefile:107: server.vrfy] Error 2

It seems the ca.pem mismatchs server.pem which results in failing to
execute "openssl verify -CAfile ca.pem server.pem", so add the logic
to check the file to avoid inconsistency.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 52f5141109fae5f49c5a7334e9ded2b028e16cf6)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...file-fix-the-occasional-verification.patch | 135 ++++++++++++++++++
 .../freeradius/freeradius_3.0.20.bb           |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
new file mode 100644
index 0000000000..dce0427e1a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-occasional-verification.patch
@@ -0,0 +1,135 @@
+From 3eda5d35fbaf66ed6bdc86ada4320a0a18681b7e Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 5 Aug 2020 07:23:11 +0000
+Subject: [PATCH] raddb/certs/Makefile: fix the occasional verification failure
+
+Fixes:
+  # cd /etc/raddb/certs
+  # ./bootstrap
+[snip]
+chmod g+r ca.key
+openssl pkcs12 -in server.p12 -out server.pem -passin pass:'whatever' -passout pass:'whatever'
+chmod g+r server.pem
+C = FR, ST = Radius, O = Example Inc., CN = Example Server Certificate, emailAddress = admin@example.org
+error 7 at 0 depth lookup: certificate signature failure
+140066667427072:error:04067084:rsa routines:rsa_ossl_public_decrypt:data too large for modulus:../openssl-1.1.1g/crypto/rsa/rsa_ossl.c:553:
+140066667427072:error:0D0C5006:asn1 encoding routines:ASN1_item_verify:EVP lib:../openssl-1.1.1g/crypto/asn1/a_verify.c:170:
+error server.pem: verification failed
+make: *** [Makefile:107: server.vrfy] Error 2
+
+It seems the ca.pem mismatchs server.pem which results in failing to
+execute "openssl verify -CAfile ca.pem server.pem", so add to check
+the file to avoid inconsistency.
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ raddb/certs/Makefile | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/raddb/certs/Makefile b/raddb/certs/Makefile
+index 77eec9baa1..3dcb63fe71 100644
+--- a/raddb/certs/Makefile
++++ b/raddb/certs/Makefile
+@@ -59,7 +59,7 @@ passwords.mk: server.cnf ca.cnf client.cnf inner-server.cnf
+ #
+ ######################################################################
+ dh:
+-	$(OPENSSL) dhparam -out dh -2 $(DH_KEY_SIZE)
++	@[ -f dh ] || $(OPENSSL) dhparam -out dh -2 $(DH_KEY_SIZE)
+ 
+ ######################################################################
+ #
+@@ -69,17 +69,17 @@ dh:
+ ca.key ca.pem: ca.cnf
+ 	@[ -f index.txt ] || $(MAKE) index.txt
+ 	@[ -f serial ] || $(MAKE) serial
+-	$(OPENSSL) req -new -x509 -keyout ca.key -out ca.pem \
++	@[ -f ca.pem ] || $(OPENSSL) req -new -x509 -keyout ca.key -out ca.pem \
+ 		-days $(CA_DEFAULT_DAYS) -config ./ca.cnf \
+ 		-passin pass:$(PASSWORD_CA) -passout pass:$(PASSWORD_CA)
+ 	chmod g+r ca.key
+ 
+ ca.der: ca.pem
+-	$(OPENSSL) x509 -inform PEM -outform DER -in ca.pem -out ca.der
++	@[ -f ca.der ] || $(OPENSSL) x509 -inform PEM -outform DER -in ca.pem -out ca.der
+ 
+ ca.crl: ca.pem
+-	$(OPENSSL) ca -gencrl -keyfile ca.key -cert ca.pem -config ./ca.cnf -out ca-crl.pem -key $(PASSWORD_CA)
+-	$(OPENSSL) crl -in ca-crl.pem -outform der -out ca.crl
++	@[ -f ca-crl.pem ] || $(OPENSSL) ca -gencrl -keyfile ca.key -cert ca.pem -config ./ca.cnf -out ca-crl.pem -key $(PASSWORD_CA)
++	@[ -f ca.crl ] || $(OPENSSL) crl -in ca-crl.pem -outform der -out ca.crl
+ 	rm ca-crl.pem
+ 
+ ######################################################################
+@@ -88,18 +88,18 @@ ca.crl: ca.pem
+ #
+ ######################################################################
+ server.csr server.key: server.cnf
+-	$(OPENSSL) req -new  -out server.csr -keyout server.key -config ./server.cnf
++	@[ -f server.csr ] || $(OPENSSL) req -new  -out server.csr -keyout server.key -config ./server.cnf
+ 	chmod g+r server.key
+ 
+ server.crt: server.csr ca.key ca.pem
+ 	@[ -f server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in server.csr  -key $(PASSWORD_CA) -out server.crt -extensions xpserver_ext -extfile xpextensions -config ./server.cnf
+ 
+ server.p12: server.crt
+-	$(OPENSSL) pkcs12 -export -in server.crt -inkey server.key -out server.p12  -passin pass:$(PASSWORD_SERVER) -passout pass:$(PASSWORD_SERVER)
++	@[ -f server.p12 ] || $(OPENSSL) pkcs12 -export -in server.crt -inkey server.key -out server.p12  -passin pass:$(PASSWORD_SERVER) -passout pass:$(PASSWORD_SERVER)
+ 	chmod g+r server.p12
+ 
+ server.pem: server.p12
+-	$(OPENSSL) pkcs12 -in server.p12 -out server.pem -passin pass:$(PASSWORD_SERVER) -passout pass:$(PASSWORD_SERVER)
++	@[ -f server.pem ] || $(OPENSSL) pkcs12 -in server.p12 -out server.pem -passin pass:$(PASSWORD_SERVER) -passout pass:$(PASSWORD_SERVER)
+ 	chmod g+r server.pem
+ 
+ .PHONY: server.vrfy
+@@ -113,18 +113,18 @@ server.vrfy: ca.pem
+ #
+ ######################################################################
+ client.csr client.key: client.cnf
+-	$(OPENSSL) req -new  -out client.csr -keyout client.key -config ./client.cnf
++	@[ -f client.csr ] || $(OPENSSL) req -new  -out client.csr -keyout client.key -config ./client.cnf
+ 	chmod g+r client.key
+ 
+ client.crt: client.csr ca.pem ca.key
+ 	@[ -f client.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in client.csr  -key $(PASSWORD_CA) -out client.crt -extensions xpclient_ext -extfile xpextensions -config ./client.cnf
+ 
+ client.p12: client.crt
+-	$(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
++	@[ -f client.p12 ] || $(OPENSSL) pkcs12 -export -in client.crt -inkey client.key -out client.p12  -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
+ 	chmod g+r client.p12
+ 
+ client.pem: client.p12
+-	$(OPENSSL) pkcs12 -in client.p12 -out client.pem -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
++	@[ -f client.pem ] || $(OPENSSL) pkcs12 -in client.p12 -out client.pem -passin pass:$(PASSWORD_CLIENT) -passout pass:$(PASSWORD_CLIENT)
+ 	chmod g+r client.pem
+ 	cp client.pem $(USER_NAME).pem
+ 
+@@ -139,18 +139,18 @@ client.vrfy: ca.pem client.pem
+ #
+ ######################################################################
+ inner-server.csr inner-server.key: inner-server.cnf
+-	$(OPENSSL) req -new  -out inner-server.csr -keyout inner-server.key -config ./inner-server.cnf
++	@[ -f inner-server.csr] || $(OPENSSL) req -new  -out inner-server.csr -keyout inner-server.key -config ./inner-server.cnf
+ 	chmod g+r inner-server.key
+ 
+ inner-server.crt: inner-server.csr ca.key ca.pem
+-	$(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in inner-server.csr  -key $(PASSWORD_CA) -out inner-server.crt -extensions xpserver_ext -extfile xpextensions -config ./inner-server.cnf
++	@[ -f inner-server.crt ] || $(OPENSSL) ca -batch -keyfile ca.key -cert ca.pem -in inner-server.csr  -key $(PASSWORD_CA) -out inner-server.crt -extensions xpserver_ext -extfile xpextensions -config ./inner-server.cnf
+ 
+ inner-server.p12: inner-server.crt
+-	$(OPENSSL) pkcs12 -export -in inner-server.crt -inkey inner-server.key -out inner-server.p12  -passin pass:$(PASSWORD_INNER) -passout pass:$(PASSWORD_INNER)
++	@[ -f inner-server.p12 ] || $(OPENSSL) pkcs12 -export -in inner-server.crt -inkey inner-server.key -out inner-server.p12  -passin pass:$(PASSWORD_INNER) -passout pass:$(PASSWORD_INNER)
+ 	chmod g+r inner-server.p12
+ 
+ inner-server.pem: inner-server.p12
+-	$(OPENSSL) pkcs12 -in inner-server.p12 -out inner-server.pem -passin pass:$(PASSWORD_INNER) -passout pass:$(PASSWORD_INNER)
++	@[ -f inner-server.pem ] || $(OPENSSL) pkcs12 -in inner-server.p12 -out inner-server.pem -passin pass:$(PASSWORD_INNER) -passout pass:$(PASSWORD_INNER)
+ 	chmod g+r inner-server.pem
+ 
+ .PHONY: inner-server.vrfy
+-- 
+2.26.2
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
index d2046d72eb..2c39c4c443 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.20.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
     file://0001-rlm_python3-add-PY_INC_DIR-in-search-dir.patch \
     file://0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch \
+    file://0001-raddb-certs-Makefile-fix-the-occasional-verification.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
-- 
2.17.1

