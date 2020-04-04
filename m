Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web12.1894.1586021374374916039
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id k9so9207142oia.8
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=y3IsU4mAMUQ2Zr/mKtF942Dx+IKd6HSg7BWNawsb5pw=;
        b=lsSUcA2oQQ6UePmJXUk6faSWaAPCHabse1dIOJ1cFQYiqyEckmboaiCZj8C81md2tj
         Jj4Og01WtkLlJ0MH5PMKgRQCU8u6ET9Wt3I3YCOcCufkLegeALYMQYNviCVV5T7Rx5Y8
         xKs/oJibzP2Uee3YoAPIjbwFLdljiVko3EKi6YXFsj1xajHbBJxXm6TQTQIhPloUWuC3
         +UlsubWVWVpLA5EhDrxxfMwwGRGFkzSyEY8dci5Lbk5yvIxsB/48mzlV90arETfIFHDw
         DaBKn9fTVcO9A/oTLkKvMRA74YUtg+/Clb2P4wF7qOEvmwKVcj+LdD2EX+s/amwFCeJN
         RTlA==
X-Gm-Message-State: AGi0PuaUrLPIwMSJj2mwsYZTuDmq5jREKlsFU4YuyP+3nWUWg/tgKbpE
	RYtuoRuMFwD5A8UQWlN/qejhV+6Q5KM=
X-Google-Smtp-Source: APiQypI/Hdc90Z5N0n0xvTkJsRNPhLGdN/CIP5RQdPpLDJwstZX96nVMhI37bWYjddrBXvQYagWIog==
X-Received: by 2002:aca:4c12:: with SMTP id z18mr7125465oia.43.1586021373453;
        Sat, 04 Apr 2020 10:29:33 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:32 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 5/7] python-rfc3339-validator: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:29:09 -0400
Message-Id: <20200404172911.26978-5-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404172911.26978-1-derek@asterius.io>
References: <20200404172911.26978-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-rfc3339-validator.inc       | 25 -----------------
 .../python/python3-rfc3339-validator_0.1.1.bb | 27 +++++++++++++++++--
 2 files changed, 25 insertions(+), 27 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-rfc3339-validator.inc

diff --git a/meta-python/recipes-devtools/python/python-rfc3339-validator.inc b/meta-python/recipes-devtools/python/python-rfc3339-validator.inc
deleted file mode 100644
index 3da082984d..0000000000
--- a/meta-python/recipes-devtools/python/python-rfc3339-validator.inc
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "A pure python RFC3339 validator"
-HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
-
-SRC_URI[md5sum] = "9d8899041d83f98180bddd8b62ee7e99"
-SRC_URI[sha256sum] = "20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08"
-
-PYPI_PACKAGE = "rfc3339_validator"
-
-inherit pypi
-
-SRC_URI_append = " \
-    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
-"
-
-RDEPENDS_${PN} += "\
-    ${PYTHON_PN}-core \
-    ${PYTHON_PN}-datetime \
-    ${PYTHON_PN}-six \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
index f4ee8fedaa..1f5d91d3b2 100644
--- a/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-rfc3339-validator_0.1.1.bb
@@ -1,2 +1,25 @@
-inherit setuptools3
-require python-rfc3339-validator.inc
\ No newline at end of file
+SUMMARY = "A pure python RFC3339 validator"
+HOMEPAGE = "https://github.com/naimetti/rfc3339-validator"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a21b13b5a996f08f7e0b088aa38ce9c6"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/python-rfc3339-validator:"
+
+SRC_URI[md5sum] = "9d8899041d83f98180bddd8b62ee7e99"
+SRC_URI[sha256sum] = "20a600d01fbb1f793cbb6f4ec4ebb2104f4c9e80d74d5f78350b63ecc6cccd08"
+
+PYPI_PACKAGE = "rfc3339_validator"
+
+inherit pypi setuptools3
+
+SRC_URI_append = " \
+    file://0001-setup.py-move-pytest-runner-to-test_requirements.patch \
+"
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-core \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

