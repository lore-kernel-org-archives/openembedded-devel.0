Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web11.1863.1586021373449612035
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: straka.derek@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id m2so10861427otr.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=A5Da0f8YE/Hok0jro5hqYBzqAUw3HKOM9E58RnCnsuQ=;
        b=Rl/AIpuirs4/mzg0dr0Fz7owdncRi2ENNVZj7pspSGSf5Ru/WNXnbaoQa7qN5OGl72
         eZwQpOxtzVk6dWlGFF5DBmka5ovGb4gZkBd7GRnSpY2GPwZEkppEml7xHV8kkp8UQmrM
         OPdDGz60sBcWTfof/IgsXxFMKGjMmxneEQMFSZoyj/5BKZOgLiKe9JJ7NNV5l8G7qyga
         OBkf/Cky/9zqBHsHShI8Z8K1sJABzRKFJ3X5KcaGTHNjfirtuEr/ggy9P8huzhB/LXxL
         J+UAc61k8WXun0Ldj09qsZt5yHeuAIy+3bLZlwZ7geSIEFiVnMYfZUpfOkN9ejQDx83D
         opcg==
X-Gm-Message-State: AGi0Puab2tNXpmwbINaTdtpfH7rMErHOMG7zKzEH86wQJHZ56zzrKglg
	x3GpVY8w8UJl3XwQsXbFCPTXNl3JKDU=
X-Google-Smtp-Source: APiQypKbGslujBTzuRlGgWUfDUJP/Rxtw32uyxgZkdlGRDOykBMfIL6jfqVho2u1L0TWY9WqeRqITw==
X-Received: by 2002:a05:6830:20d5:: with SMTP id z21mr10859201otq.237.1586021372423;
        Sat, 04 Apr 2020 10:29:32 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:31 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 4/7] python-rfc3986-validator: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:29:08 -0400
Message-Id: <20200404172911.26978-4-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404172911.26978-1-derek@asterius.io>
References: <20200404172911.26978-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-rfc3986-validator.inc       | 23 -----------------
 .../python/python3-rfc3986-validator_0.1.1.bb | 25 +++++++++++++++++--
 2 files changed, 23 insertions(+), 25 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3986-validator.inc

diff --git a/meta-python/recipes-devtools/python/python-rfc3986-validator.inc b/meta-python/recipes-devtools/python/python-rfc3986-validator.inc
deleted file mode 100644
index 71f7a7904f..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3986-validator.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Pure python rfc3986 validator"
-HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3986-validator:"
-
-SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
-SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
-
-PYPI_PACKAGE = "rfc3986_validator"
-
-inherit pypi
-
-SRC_URI_append = " \
-    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
-"
-
-RDEPENDS_${PN} += "\
-    python3-core \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
index 6491308cbb..ed668fba98 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
@@ -1,2 +1,23 @@
-inherit setuptools3
-require python-rfc3986-validator.inc
\ No newline at end of file
+SUMMARY = "Pure python rfc3986 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3986-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3986-validator:"
+
+SRC_URI[md5sum] = "47f7657b790aaf6011a1ab3d86c6be95"
+SRC_URI[sha256sum] = "3d44bde7921b3b9ec3ae4e3adca370438eccebc676456449b145d533b240d055"
+
+PYPI_PACKAGE = "rfc3986_validator"
+
+inherit pypi setuptools3
+
+SRC_URI_append = " \
+    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
+"
+
+RDEPENDS_${PN} += "\
+    python3-core \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

