Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web11.2895.1594437576664537285
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 20:19:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=K6jEVEfP;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id x11so3017453plo.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 20:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=7LleU4sWeu564++VCkLdR/zxuvcCRRkUpi0w6y1NMLE=;
        b=K6jEVEfPFQAl2vKQiXK//qgjwG6ee3yIztPyQgmcUT2iOj8x9wTD1K8nW7Kc4J4/Rk
         CF1vE3j4PXRkW9hxYtDr+8g5NKfinaNjruJbUDqpabgVdh9NR1i51RZlxho+0mcPOs26
         eoulQ87mxy/hujau3pJvomLWx0/JI3zpLzfKZnkK0CPuQQCu1pE4lZUk9EvpdNKRdsSx
         5yI3ecmnRLv4wRxw1iEdAhv2mJHR6UtSt+Br9a2B/0mmPdDsNwFL4sWgMH8PitJ/H/LW
         0UW2Q7trXwe7FW8Iu2pjKMLt10thpoQ7/CTVLsGp7KnplBWdvN5IKLBP/C3yR/a+MVi/
         LdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=7LleU4sWeu564++VCkLdR/zxuvcCRRkUpi0w6y1NMLE=;
        b=Pr754nzyOvTqetc0SDjc4x6yiK1rmcyjnms/sx05csBYpHt1RMZBGKt5IUqEhvdZ34
         RvIQIZ4xn399AAjoEXNrY3X3/DI1GNIIdCRtioPM5Qerewm4lEyWf/9YbUoMpyYb2jXa
         JbRgME7poft/bCoVZKXPICEV8zOA/DGZ47C5X9MyeFJqZPUwwAlbS06woT4/rHCwJhzB
         xLEpLoy5jSZACMkEdsW47UTx4VI9QcloN+RoIaeM/amFBSWqeThr+T+Qd9JF3QtP0qL2
         K1P6+lf3S/bixVXeANRiRF27niHrG+/7avdT7hFdXFqqE9jXWhLe5vyTbfDifuSw+hI2
         NYMA==
X-Gm-Message-State: AOAM530EMl8XmGYsDbSgkiVwGPlttOom+jHxpRC4BSVI6IcgpOKSYLvW
	vcp1vPRgCQkGIB418hGBdZbEN3AzXZs=
X-Google-Smtp-Source: ABdhPJwAL6xAqdNQ4OPF8RvyScSQ2YoqNtUDXO8SYmEunFoNDbGqYKh/GG3Vlvn0DUK4KyTvkgzlyw==
X-Received: by 2002:a17:902:d203:: with SMTP id t3mr64005889ply.168.1594437576034;
        Fri, 10 Jul 2020 20:19:36 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:94e8:27ac:fdd9:c160])
        by smtp.gmail.com with ESMTPSA id f3sm6925461pju.54.2020.07.10.20.19.35
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 20:19:35 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/5] python3-ecdsa: add package
Date: Fri, 10 Jul 2020 20:19:29 -0700
Message-Id: <20200711031932.5883-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200711031932.5883-1-akuster808@gmail.com>
References: <20200711031932.5883-1-akuster808@gmail.com>

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/python/python3-ecdsa_0.15.bb   | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb

diff --git a/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb b/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
new file mode 100644
index 0000000000..aba62f3ef9
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-ecdsa_0.15.bb
@@ -0,0 +1,13 @@
+SUMMARY = "ECDSA cryptographic signature library (pure python)"
+SECTION = "devel/python"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=66ffc5e30f76cbb5358fe54b645e5a1d"
+
+DEPENDS += "python3-pip python3-pbr"
+
+PYPI_PACKAGE = "ecdsa"
+SRC_URI[sha256sum] = "8f12ac317f8a1318efa75757ef0a651abe12e51fc1af8838fb91079445227277"
+
+inherit pypi setuptools3
+
+RDEPENDS_${PN} += "python3-six python3-gmpy2 python3-pbr"
-- 
2.17.1

