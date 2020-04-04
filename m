Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.1534.1586020407949064973
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 10:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: straka.derek@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id u20so9201588oic.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Apr 2020 10:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=l+/gW1wVHuNRF534svCJqYqYoQWTFd6RwWBIEhQ+mP8=;
        b=g/0iBAx1iRl7Hhk5QDGGJeweTe0gTqluBw0b5AA3rv+4rUdos3wyAIKJ6b75UTSsRe
         DNVAXGr5CcYKLIoSsytF+DyIGzItaNyvc8hsBb48FS38eN2syuCZ7INkU0zbiB5wHY81
         8SU9g1hhPx7BEIG5Xb1AWrmcwAEPPlR8V5Kk6oXV5tmLynujSPQB/Ts7dOLIWjJmlDIs
         fvfxm58Sx6sucZGnFWsfxprCEoD+/MBuEHKkhofCxkYesColyS240Pi1U7dL/ThqZq3L
         9Co5eZ5cSHgrDb6G0NK2E210tOopBh9sXuYhdYQnzT3Vozes35D1o1j0DdIKLFmWaT9n
         GI0g==
X-Gm-Message-State: AGi0PuaWpNCgatky+BUPGTJEbLtwC5DeYYnSy2Wfw0AqBWMOxvnWCzFh
	0Ws3ewQdGeWfE8ZgJ8NDR79rvhWArPs=
X-Google-Smtp-Source: APiQypLXleDUTt8Q6rCqriUpFhCefeKh9kUgu3p5Nq2f6IHvKDiJFhtBeFzpTydr37q73C9WonhLTA==
X-Received: by 2002:aca:3c82:: with SMTP id j124mr7526995oia.89.1586020406956;
        Sat, 04 Apr 2020 10:13:26 -0700 (PDT)
Return-Path: <straka.derek@gmail.com>
Received: from sparta.internal.asterius.io (cpe-24-28-77-115.austin.res.rr.com. [24.28.77.115])
        by smtp.gmail.com with ESMTPSA id q12sm3054551otn.43.2020.04.04.10.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2020 10:13:26 -0700 (PDT)
From: "Derek Straka" <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Cc: Derek Straka <derek@asterius.io>
Subject: [oe][meta-python][PATCH 22/27] python-setuptools-scm: consolidate inc and bb files into a single bb file
Date: Sat,  4 Apr 2020 13:12:46 -0400
Message-Id: <20200404171251.19823-22-derek@asterius.io>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200404171251.19823-1-derek@asterius.io>
References: <20200404171251.19823-1-derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
---
 .../python/python-setuptools-scm.inc             | 14 --------------
 .../python/python3-setuptools-scm_3.3.3.bb       | 16 ++++++++++++++--
 2 files changed, 14 insertions(+), 16 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python-setuptools-scm.inc

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm.inc b/meta-python/recipes-devtools/python/python-setuptools-scm.inc
deleted file mode 100644
index a7e1bf6add..0000000000
--- a/meta-python/recipes-devtools/python/python-setuptools-scm.inc
+++ /dev/null
@@ -1,14 +0,0 @@
-SUMMARY = "the blessed package to manage your versions by scm tags"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
-
-SRC_URI[md5sum] = "50b2199082fe808d032ec1710c9d7415"
-SRC_URI[sha256sum] = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
-
-PYPI_PACKAGE = "setuptools_scm"
-inherit pypi
-
-RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
-RDEPENDS_${PN}_class-native = "${PYTHON_PN}-setuptools-native"
-
-BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
index 5bf5983874..f8d28b33af 100644
--- a/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-setuptools-scm_3.3.3.bb
@@ -1,2 +1,14 @@
-inherit setuptools3
-require python-setuptools-scm.inc
+SUMMARY = "the blessed package to manage your versions by scm tags"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=8227180126797a0148f94f483f3e1489"
+
+SRC_URI[md5sum] = "50b2199082fe808d032ec1710c9d7415"
+SRC_URI[sha256sum] = "bd25e1fb5e4d603dcf490f1fde40fb4c595b357795674c3e5cb7f6217ab39ea5"
+
+PYPI_PACKAGE = "setuptools_scm"
+inherit pypi setuptools3
+
+RDEPENDS_${PN}_class-target = "${PYTHON_PN}-py ${PYTHON_PN}-setuptools ${PYTHON_PN}-debugger ${PYTHON_PN}-json"
+RDEPENDS_${PN}_class-native = "${PYTHON_PN}-setuptools-native"
+
+BBCLASSEXTEND = "native"
-- 
2.17.1

