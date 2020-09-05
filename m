Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web12.3130.1599324969053880719
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AhAW8KuL;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id c196so849767pfc.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=m8boweDCVmq+i2VOqwS+OQhhmq5G4mS5/AmtxVy0JZI=;
        b=AhAW8KuLbrOsh5PsIDakrgE6URuk7hD57AKN5P573Ry6ZiHD/mCk3ny7jY8ZNMNDZq
         ONG+3aubKw1ca5dpTI959R4Y4GChM6q5fENVR0Qmz507JTkZQoTWpjPxYIaLorDP5gQ3
         rdo1bgs0Lpcwkg+tDm+Xw8hdKbWEeR6DTNoBw+N34i5Go8CLlNk9B2j319TtpJ2yScnv
         G5OVpAdXlqSOielOmgWw5goWn0lgrYwwn7ccwbsxPMmJXBEGMC+srl8mIpxIHbzbAbaI
         HjlXZm7f+kjNshdcxenTarwyIzc/Rr1neOipduiA56eluczMkIkmNKt5z/2QQ9bP9nxV
         WP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=m8boweDCVmq+i2VOqwS+OQhhmq5G4mS5/AmtxVy0JZI=;
        b=qpMytl2napAwJKePpa+e9WmqItfoIuEyIsItAlji7dIIW5BIZejVYp2z2ad6qAt0am
         As3UBpcKV61mkefjTWUhKWfIq8KBUusDYQfvVtfOLbMYQ/ugHbUN2HC4tQQWiqj4Ahfd
         WU2fHCp/tPWgM3AW4T8+YOMSr0sCWBRgxe+ck3O/Fzyti0xYGo+Us76VHp0764CC/ZY5
         1pjNsDz0UFxZkV/+QPJ8sJdefEqDB29Hy38CCRuNHj9JHNAqKagp5AUgG3/3WhYPsKQJ
         8WIw5bQ2XsLat1uxsWNmAURojcFx2ig1NMYe8j9cIRUVKha/JYRr83khgIMWiEp6mI0/
         VNQg==
X-Gm-Message-State: AOAM533Vp5pJw7AeX7Zw+kHwLDxiVb+6NDAlgLwFY9SlN9hcOS5W8ZQc
	7oxIziQ8t1dEHBBVOcvv3p4VtfL9vcw=
X-Google-Smtp-Source: ABdhPJxc/ZtgY4y9KRk6fxPN2YkajqnCgML/d6fNPg2Wugk9vN52H8GdX4yvsxKDCmEENgG4oOiizg==
X-Received: by 2002:a63:2f02:: with SMTP id v2mr11216238pgv.369.1599324968240;
        Sat, 05 Sep 2020 09:56:08 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:07 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 02/20] freeradius: fix the existed certificate error
Date: Sat,  5 Sep 2020 09:55:45 -0700
Message-Id: <fd0d398fe70f8ea109f7a9efa5b13bfff1a70bd0.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>

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
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0d7522b7df80e45c379ad76addfddd51d0e56e9d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...file-fix-the-existed-certificate-err.patch | 55 +++++++++++++++++++
 .../freeradius/freeradius_3.0.20.bb           |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-raddb-certs-Makefile-fix-the-existed-certificate-err.patch
new file mode 100644
index 0000000000..669f363e72
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
index 005ca47da8..d2046d72eb 100644
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
2.17.1

