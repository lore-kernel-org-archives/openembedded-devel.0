Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
 by mx.groups.io with SMTP id smtpd.web11.20829.1586104949561776247
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 09:42:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.51, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f51.google.com with SMTP id x11so12804916otp.6
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 09:42:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=zm0XZauBACIQRn/IokxJn9x+yKniXtLnFXoMkavYzqc=;
        b=HLFnnbdfYTmHYY55cGgTOhVjxWRg72KmkrF9ihZYZe6KjgiKLPo5M8FIqxUIbcy/aP
         KxQcGTyE2R/HG7IZWIdRYcByL5q8/LSbqa6cTC2hWtep9l/YmiGn9owCwJwgB8dcrTIk
         UyRlKaBAdtQB7dhAw6CjQ4/V8sWss8jjnQgTxKKXf8i94Lh340dxCnHUg8ZleM2L/Vno
         Rf0E2UL1hzfaIm9Wpfv8XxUmiK8c7LnbcD3+fkL3eoy5P+WnuhgUeECCjI4CWL/Tcgiu
         T0BZDa3NKL/6lm1USyj+LiHRaY0SjTnOVMNDC9XyIfJ3eR4us+p0rImDli6RKirWz+Ci
         PunQ==
X-Gm-Message-State: AGi0Puaw7InQyvFvMTxagPQLRgIZiFdBsomxsxe1idQu/9cFRbZyfekZ
	oOjNByJfbNX9kgKQ23weLbp6Yb7b9mQ=
X-Google-Smtp-Source: APiQypIYMkMz3UtPya+qVpunS8WZ0UUPPXUSw1GfUyHMWxgu1gRpwDUTXjv9zzfmwyoorVrxvVsZBw==
X-Received: by 2002:a4a:4505:: with SMTP id y5mr14519359ooa.29.1586104948404;
        Sun, 05 Apr 2020 09:42:28 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id r15sm3866573oie.18.2020.04.05.09.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 09:42:28 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 2/6] python-pyrsistent: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 12:41:56 -0400
Message-Id: <20200405164200.31599-2-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405164200.31599-1-derek@asterius.io>
References: <20200405164200.31599-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyrsistent.inc | 13 -------------
 .../python/python3-pyrsistent_0.15.7.bb           | 15 ++++++++++++++-
 2 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyrsistent.inc

diff --git a/meta-python/recipes-devtools/python/python-pyrsistent.inc b/meta-python/recipes-devtools/python/python-pyrsistent.inc
deleted file mode 100644
index ae4f21af48..0000000000
--- a/meta-python/recipes-devtools/python/python-pyrsistent.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "Persistent/Immutable/Functional data structures for Python"
-HOMEPAGE = "https://github.com/tobgu/pyrsistent"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
-
-SRC_URI[md5sum] = "da9486d00ef5b213f40d5cf3c5bca82d"
-SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade307280"
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
index 2e567e9f9c..5ef7140283 100644
--- a/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrsistent_0.15.7.bb
@@ -1,2 +1,15 @@
+SUMMARY = "Persistent/Immutable/Functional data structures for Python"
+HOMEPAGE = "https://github.com/tobgu/pyrsistent"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENCE.mit;md5=ca574f2891cf528b3e7a2ee570337e7c"
+
+SRC_URI[md5sum] = "da9486d00ef5b213f40d5cf3c5bca82d"
+SRC_URI[sha256sum] = "cdc7b5e3ed77bed61270a47d35434a30617b9becdf2478af76ad2c6ade307280"
+
 inherit pypi setuptools3
-require python-pyrsistent.inc
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

