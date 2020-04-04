Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.8641.1586006955582323778
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 06:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id m14so8856846oic.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 06:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=PYF/Wq6oOzAsgQgVnJCssEiPDdumJbiagDRSbIl2ajU=;
        b=K+FeXhmGxrPPOH7Ex7+XzQ71dtm1Ma2sRLaWmWcFxMiCQSFcciYjQyGLr9Xb5rlHRM
         OIG9VGPCDmcByo/FdxDFzVHc9e5POXh6J/H7R7Qdw+UV96BB/sfn7CzlNukS31F8QZzg
         BGAfhe9MLV7zoFGENZbR7AFEedHEgTY0vaLgi+HWoI8oI1372jCkeFH5rOhXGG2XXGdS
         OUBVubt+EgBCY+E98ukGEeNXa4ZznokcpwlGiA6N1S5GD9/3EPXlYqxBJwXW92AbuaaM
         ccjrR5/sGLTyN/F9AJVfl1FasM8P5o3Xnib/XC3yF/gpPpeRhf8ifkwaefPL86kj9XuU
         IcKw==
X-Gm-Message-State: AGi0PuYbXmwhJKlDrc6Ns6SwHTg72hyE4j2eQDK77EJbGrHqaZznTcAR
	9YlOM0W2KxXOmEQJRBBnvVuoHOcYChU=
X-Google-Smtp-Source: APiQypLh+lcay+eC2GuwHdDZPQCvjsf+isS+wrV+CjWAUOYAqGl+YjFuy3tt3drbjEB0cj7ptKLFDw==
X-Received: by 2002:aca:5057:: with SMTP id e84mr6905116oib.120.1586006954500;
        Sat, 04 Apr 2020 06:29:14 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id t17sm2813013oof.43.2020.04.04.06.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 06:29:13 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 06/11] python-unidiff: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 09:28:41 -0400
Message-Id: <20200404132846.16832-6-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404132846.16832-1-derek@asterius.io>
References: <20200404132846.16832-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-unidiff.inc   | 14 --------------
 .../python/python3-unidiff_0.5.5.bb              | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-unidiff.inc

diff --git a/meta-python/recipes-devtools/python/python-unidiff.inc b/meta-python/recipes-devtools/python/python-unidiff.inc
deleted file mode 100644
index fc1206201b..0000000000
--- a/meta-python/recipes-devtools/python/python-unidiff.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "Unified diff parsing/metadata extraction library"
-HOMEPAGE = "http://github.com/matiasb/python-unidiff"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
-
-SRC_URI[md5sum] = "47f669d7273541fec45e4cc0fba8d8e9"
-SRC_URI[sha256sum] = "9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa6373105780025bc"
-
-inherit pypi
-
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-codecs \
-    ${PYTHON_PN}-io \
-"
diff --git a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb b/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
index 0ddc7e2f20..ded66f06f6 100644
--- a/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
+++ b/meta-python/recipes-devtools/python/python3-unidiff_0.5.5.bb
@@ -1,2 +1,14 @@
-require python-unidiff.inc
-inherit setuptools3
+SUMMARY = "Unified diff parsing/metadata extraction library"
+HOMEPAGE = "http://github.com/matiasb/python-unidiff"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4c434b08ef42fea235bb019b5e5a97b3"
+
+SRC_URI[md5sum] = "47f669d7273541fec45e4cc0fba8d8e9"
+SRC_URI[sha256sum] = "9c9ab5fb96b6988b4cd5def6b275492442c04a570900d33aa6373105780025bc"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-codecs \
+    ${PYTHON_PN}-io \
+"
-- 
2.17.1

