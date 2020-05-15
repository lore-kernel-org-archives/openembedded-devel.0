Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web11.880.1589577098801813511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 May 2020 14:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20150623.gappssmtp.com header.s=20150623 header.b=SkSgoy8v;
 spf=pass (domain: ossystems.com.br, ip: 209.85.219.47, mailfrom: domarys.correa@ossystems.com.br)
Received: by mail-qv1-f47.google.com with SMTP id d1so1822173qvl.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 May 2020 14:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=Mk+d+lKo8/baBinrTPqRJnYaRDm5mWsneZvKySL+wEM=;
        b=SkSgoy8vZIyOqy/iyx5iWKgGAuCTK/mtWyJFDza0wSC7Sm6Tcw54LBofn/KezVfG4e
         WBgHvfYtShB0gcLaLebesNQVIfkDXyuHi+zC1uNMpDvkpBxNa0CeZ1T3da3gM8theCru
         EjexMBYI32/Up/gVAjPWeZUYVN5Fb785JnpF87wccRJ3EXjnyTN01gze/TCZU7Fniago
         V3mLthJrmNuVy4bZIb8rx7PG2hmlk687kTuziEj9Gr0nusiBhxpvrmHXqdUbME9VgGRl
         Pr9TdN3EiSQKEidSUqVR4nhZ47n9OivXxKCVAzca+apo6hi3z+jeZc/61fZOcTYVkSJ5
         4m4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Mk+d+lKo8/baBinrTPqRJnYaRDm5mWsneZvKySL+wEM=;
        b=c0sz88gN4YGQThDRek/jW8at99tKm/BgrYwxv4S55+4t6TMWx8qU9dqtY1SMe1NjVu
         /bBcObadoI+0E8Aw+dfMUFm1rtLriW32y5jPIT3zhqAMi8GalCORhqBACLr3Y8Oz1kIT
         at6HL4AJ+NPGUlyM5hmXZ2pvTbPCK4Z50TI1+t0yFLRwnIp1qbZQVOE5Wd5Xz9oanuYZ
         zdglBnRuejy7gxiGLCxQxkMqADHdojIPQLGvaynkofUfHzX6rAcnQmlV1+nwu/tNKluu
         RsZk5OPYCAo7RPfAfv9x4hxkzdYuvgsKQ9t3Rw5ck0D57AHO/vioBaCoRwLMuAR8FEwX
         JehQ==
X-Gm-Message-State: AOAM532ONeKBFTs/UqHqCw6LyjaOZl7LROOqPOlRCaRPyq8zX1pOI0tn
	ks7pKwUR4heLIV6jAVijMA8lVHzerC4=
X-Google-Smtp-Source: ABdhPJzJ/c9dGWogg7BenWa/qVWYBvW3SPavGHIbnhoOjaD8MZz4DiOrb2fq1YZeu82NZbFrmQioUQ==
X-Received: by 2002:a05:6214:526:: with SMTP id x6mr5548981qvw.15.1589577097674;
        Fri, 15 May 2020 14:11:37 -0700 (PDT)
Return-Path: <domarys.correa@ossystems.com.br>
Received: from Monster.domain.name ([2804:7f4:c195:1db7:b83f:ce2d:1156:b223])
        by smtp.gmail.com with ESMTPSA id h134sm2483276qke.6.2020.05.15.14.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2020 14:11:37 -0700 (PDT)
From: "Domarys Correa" <domarys.correa@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: Domarys Correa <domarys.correa@ossystems.com.br>
Subject: [PATCH 1/3] python3-autobahn: Add recipe version 20.4.3
Date: Fri, 15 May 2020 18:10:41 -0300
Message-Id: <20200515211043.10347-1-domarys.correa@ossystems.com.br>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Domarys Correa <domarys.correa@ossystems.com.br>
---
 .../python/python3-autobahn_20.4.3.bb         | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb b/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
new file mode 100644
index 000000000..60ef57d04
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-autobahn_20.4.3.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "WebSocket client & server library, WAMP real-time framework"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=97c0bda20ad1d845c6369c0e47a1cd98"
+
+SRC_URI[sha256sum] = "c6fe745d52ba9f9eecf791cd31f558df42aebfc4f9ee558a8f1d18c707e1ae1f"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-twisted \
+    ${PYTHON_PN}-zopeinterface \
+    ${PYTHON_PN}-py-ubjson \
+    ${PYTHON_PN}-cbor2 \
+    ${PYTHON_PN}-u-msgpack-python \
+    ${PYTHON_PN}-lz4 \
+    ${PYTHON_PN}-snappy \
+    ${PYTHON_PN}-pyopenssl \
+    ${PYTHON_PN}-txaio \
+    ${PYTHON_PN}-six \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

