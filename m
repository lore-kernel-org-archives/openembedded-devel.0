Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.20833.1586104952559189848
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 09:42:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id g23so12823125otq.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 09:42:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Jq3s/Rhqz3hPAOlo1Zolbzm3IiB0hivzrjH801VcKd8=;
        b=LpH4inFeOzLLi+ueZPNmDz2D9zo2Tm2xNHPhXtQ8qisj3sb8mWcKSeBPCM9hNVyyYR
         Hs5/faHis11LZAIMI9pjEJR1scfdXYPInS5aT51fa3jAaJ6PurntczM12QHf0Wn0J4TD
         TI/4F67LjuU1rGPC1Z4Y42YiCQyZi4QV5VeEH9uhkDPEhTzjkV982vs7ZeiRiT3fWBMx
         LL+YydZVFljdIl4HJ+DBUFM62MQ5Mn8uUsolrjjuFeAOOjYLmf+YruuiRJ/8Z1hqxf5Y
         MezckIOp0kB04qdM7//lmLjEVye33j9ZqLAJbjMuT9lWOqlw8fKBFk/YtouUPbqD8taT
         xcdg==
X-Gm-Message-State: AGi0Pua8u2BDX1f73hwiGNKQdlwTUJtXjbppcmQ23llMZcCWw3krhvuT
	nCrDXO8u6g1upWDYT736mNf0xLcStDk=
X-Google-Smtp-Source: APiQypKih1W0feWkU/yEhNtDLS0l3dNHmaHJf5jDn7oROLVuYKE+2dkgxBaBHEaan02qF9XAqxzugg==
X-Received: by 2002:a4a:e78b:: with SMTP id x11mr14465062oov.45.1586104951616;
        Sun, 05 Apr 2020 09:42:31 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id r15sm3866573oie.18.2020.04.05.09.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 09:42:30 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 6/6] python-pyopenssl: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 12:42:00 -0400
Message-Id: <20200405164200.31599-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405164200.31599-1-derek@asterius.io>
References: <20200405164200.31599-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-pyopenssl.inc               | 23 ------------------
 .../python/python3-pyopenssl_19.1.0.bb        | 24 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 24 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyopenssl.inc

diff --git a/meta-python/recipes-devtools/python/python-pyopenssl.inc b/meta-python/recipes-devtools/python/python-pyopenssl.inc
deleted file mode 100644
index c6a4005563..0000000000
--- a/meta-python/recipes-devtools/python/python-pyopenssl.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Simple Python wrapper around the OpenSSL library"
-HOMEPAGE = "https://pyopenssl.org/"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-DEPENDS += "openssl ${PYTHON_PN}-cryptography"
-
-SRC_URI[md5sum] = "d9804fedbd1eb0c7d9243397b1fbf972"
-SRC_URI[sha256sum] = "9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507"
-
-PYPI_PACKAGE = "pyOpenSSL"
-
-PACKAGES =+ "${PN}-tests"
-FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
-
-RDEPENDS_${PN}_class-target = " \
-    ${PYTHON_PN}-cryptography \
-    ${PYTHON_PN}-six \
-    ${PYTHON_PN}-threading \
-"
-RDEPENDS_${PN}-tests = "${PN}"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb b/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
index 0f0f83e3a2..da783ea298 100644
--- a/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyopenssl_19.1.0.bb
@@ -1,2 +1,24 @@
+SUMMARY = "Simple Python wrapper around the OpenSSL library"
+HOMEPAGE = "https://pyopenssl.org/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "openssl ${PYTHON_PN}-cryptography"
+
+SRC_URI[md5sum] = "d9804fedbd1eb0c7d9243397b1fbf972"
+SRC_URI[sha256sum] = "9a24494b2602aaf402be5c9e30a0b82d4a5c67528fe8fb475e3f3bc00dd69507"
+
+PYPI_PACKAGE = "pyOpenSSL"
 inherit pypi setuptools3
-require python-pyopenssl.inc
+
+PACKAGES =+ "${PN}-tests"
+FILES_${PN}-tests = "${libdir}/${PYTHON_DIR}/site-packages/OpenSSL/test"
+
+RDEPENDS_${PN}_class-target = " \
+    ${PYTHON_PN}-cryptography \
+    ${PYTHON_PN}-six \
+    ${PYTHON_PN}-threading \
+"
+RDEPENDS_${PN}-tests = "${PN}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

