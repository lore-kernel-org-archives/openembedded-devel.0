Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web12.23526.1586111994575409898
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2020 11:39:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id w2so11152074oic.5
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2020 11:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yBF0krlPKBuwhXUDnCtspfqu87fdoEvGs9DSVx85g/g=;
        b=M0yBeu3w5UoAYjKDKTqpuQrtiTZyVsqthpWY+tOUJHYj8TpNie6dXKM0GJV8PIrL23
         5M5F75cySUko4IKD/v5QWwXq2qay3aScnHm4X3Lz/Gp075kddj00K0Ssj5yFDznYs+SJ
         aJVhYLVp9bC0tyBFhDLq+GsRA3pZbN3s4zLkGus+mi2P7f/3Lioc8DAogq/O7cMGQwHW
         PUkrENJblPVpeyRKqW/8SATMihm5B2KSzYL6alagWU06uV4DO6jGJG4dFu+0Lr2du3Ah
         vn9wo8qRQj8z1c9JF2RqYzK0nxPNLIKk05q9NZptxe091uuavNbgzZLVTdPfTsEfd3jo
         5pRQ==
X-Gm-Message-State: AGi0PubHUM29b0bYorQ6Lek9Xc8E78kHvVfD0TV3MFaEgmiYQ55L13cR
	Qj25reJWWaHEMMKUxbR7j1C4YJQyRkI=
X-Google-Smtp-Source: APiQypLEy84fGNENWjNLNqiokpfhVjiPCZv8OAe1mbD5BykDZ8l+jWDb2GIxxd+i+/lyttOjdgWu3A==
X-Received: by 2002:aca:4858:: with SMTP id v85mr9921207oia.51.1586111993658;
        Sun, 05 Apr 2020 11:39:53 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q22sm3833927oic.22.2020.04.05.11.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2020 11:39:53 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 12/15] python-pyfirmata: consolidate inc and bb files into a single bb file
Date: Sun,  5 Apr 2020 14:39:26 -0400
Message-Id: <20200405183929.28266-12-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200405183929.28266-1-derek@asterius.io>
References: <20200405183929.28266-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../recipes-devtools/python/python-pyfirmata.inc   | 13 -------------
 .../python/python3-pyfirmata_1.1.0.bb              | 14 ++++++++++++--
 2 files changed, 12 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-pyfirmata.inc

diff --git a/meta-python/recipes-devtools/python/python-pyfirmata.inc b/meta-python/recipes-devtools/python/python-pyfirmata.inc
deleted file mode 100644
index 2a53574e20..0000000000
--- a/meta-python/recipes-devtools/python/python-pyfirmata.inc
+++ /dev/null
@@ -1,13 +0,0 @@
-SUMMARY = "A Python interface for the Firmata protocol"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=84ddcef430b7c44caa22b2ff4b37a3df"
-PYPI_PACKAGE = "pyFirmata"
-
-RDEPENDS_${PN} = "\
-    ${PYTHON_PN}-pyserial \
-"
-
-SRC_URI[md5sum] = "159673cfb56c72ceafc30fe91eedd847"
-SRC_URI[sha256sum] = "cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd3ff08e"
-
-inherit pypi
diff --git a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
index 25af1b5c0a..c6e95eb525 100644
--- a/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyfirmata_1.1.0.bb
@@ -1,3 +1,13 @@
-inherit setuptools3
-require python-pyfirmata.inc
+SUMMARY = "A Python interface for the Firmata protocol"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=84ddcef430b7c44caa22b2ff4b37a3df"
+PYPI_PACKAGE = "pyFirmata"
 
+RDEPENDS_${PN} = "\
+    ${PYTHON_PN}-pyserial \
+"
+
+SRC_URI[md5sum] = "159673cfb56c72ceafc30fe91eedd847"
+SRC_URI[sha256sum] = "cc180d1b30c85a2bbca62c15fef1b871db048cdcfa80959968356d97bd3ff08e"
+
+inherit pypi setuptools3
-- 
2.17.1

