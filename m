Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web12.1893.1586021370660649852
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.179, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id w2so9225244oic.5
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kuzaq6ir4Ycm8J7hAzdqtxl/Z2QNQSX9mW4/Worvqc0=;
        b=JVERnZYwZPzeHb+q2+NpY7xGqC04IJW401Jc5seMgen8uqpkoYuSHm6UO+HQSw66ZU
         ezSj7ddXkCPcaFr1C0mXCAZ2g5Sn8w4KMFP09OCYW+k78L53LY2pwbRBsscbVxy2XR+d
         mn2S1xERieF1s0EiA0cVxuhSP5Y1d7uPEtQnAYMkxlv8OmWzseoBSoTA3M6c5ejbtD8y
         KwxMPAeJpAOBWmnnF7SzmfgyHJdXttpG/Gp99oLsehwlkTtUrh2BDvAgNEwIx5v1EdS0
         Tx+UE2eA+sCtq4wkz4DrPIsKn4W9NKduidr09FrbapLQl5Wt3S95aIhK9WBqeQ1nsTlR
         YD2Q==
X-Gm-Message-State: AGi0PuZH4uDCGnnR6GMemj24iaaWawu5vfIrQ9KRDwrag4+i0PkC50Zr
	bbXkv1sel9bmDrqFHhfOCTNNiH+71EM=
X-Google-Smtp-Source: APiQypKNVQHhpgYJdaw3tIJxHCLurXDdcl3/cThHYgo/cXY0Nesu2k7lm2PkTwQvKFWdzd2iVy4WYQ==
X-Received: by 2002:aca:4991:: with SMTP id w139mr7408731oia.145.1586021369705;
        Sat, 04 Apr 2020 10:29:29 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id e22sm3068964ote.32.2020.04.04.10.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:29:29 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 1/7] python-robotframework-seriallibrary: Remove unused inc file
Date: Sat,  4 Apr 2020 13:29:05 -0400
Message-Id: <20200404172911.26978-1-derek@asterius.io>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python-robotframework-seriallibrary.inc       | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc

diff --git a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc b/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
deleted file mode 100644
index bfcb023a2f..0000000000
--- a/meta-python/recipes-devtools/python/python-robotframework-seriallibrary.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY = "Robot Framework test library for serial connection"
-HOMEPAGE = "https://github.com/whosaysni/robotframework-seriallibrary"
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=7145f7cdd263359b62d342a02f005515"
-
-SRC_URI[md5sum] = "b7c9565d54c30df7cd3f3c0e29adffa3"
-SRC_URI[sha256sum] = "256ad60fc0b7df4be44d82c302f5ed8fad4935cda99e4b45942e3c88179d1e19"
-
-SRC_URI = "https://files.pythonhosted.org/packages/ce/e1/1e337dc84a20b9d92d7b243d16bb9f6fc0084967eca7454228bb546efec7/robotframework-seriallibrary-0.3.1.tar.gz"
-RDEPENDS_${PN} += " \
-    ${PYTHON_PN}-pyserial \
-    ${PYTHON_PN}-robotframework \
-"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

