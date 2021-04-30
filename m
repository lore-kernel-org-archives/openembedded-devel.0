Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.2500.1619812047033559547
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Apr 2021 12:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20161025 header.b=W2Ttv7wO;
 spf=pass (domain: googlemail.com, ip: 209.85.218.52, mailfrom: m.glembo@googlemail.com)
Received: by mail-ej1-f52.google.com with SMTP id a4so13589748ejk.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Apr 2021 12:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oE3xC7mZ5RFNJ9UoPtaohvESDbOtYlBSqi+T8YYhcr4=;
        b=W2Ttv7wOXePF4Jk7/UjYUlGfFzXhc7d2L0AjWY9/VEdpCgIJqsq5xZ1JABTEMRx2Xv
         BTLKjMEBx6whuel1bF94v8hQtTjlAFWAkyz1GFRjnir9PooMeXf8tgTBJcVsVcrJCB4c
         lnJlbYC9x5pE9moLRt9HJTzh1JF3kazYBJpYSGz7LxxZ+47DYiLsf8FsLLrmHVuWowWd
         1HfQRfjU89WsSZzhPLPYXKAJxNL2Gb+11B1CxVDwIpTZrfa8SWkDXq6IhJWJPVWOGleQ
         wDnG1XhsToEUHwt5DM/6h0wO+T/raC5u0oKCwpF3V1Fyqpa77gvunA1MZpil0Jx6pqIf
         CxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oE3xC7mZ5RFNJ9UoPtaohvESDbOtYlBSqi+T8YYhcr4=;
        b=tQfE/0c/DxmqOVfb19LweopZvQHAzKMxXXk3vINcpL+lXDjdxA/GW3yTGE+vKFAL78
         7S+4Joc2BnQaDGe3aFn2gn4KyOco4S9X208LQPuY4v7mbJRhERwP0HR/mnR0OTm9eYBo
         G8gEIGmFIOGhIUYiMx6MAZS5xwfbieuxSGuYuDLQpTlMMLACt4venZL4eLbWIyfWAjUA
         LnoRnrP2Rk5OKkbksb+OkCC98PYWXeGPOmI9LziBY/AN5yJoskpVy/JYbn14LOe2yFFi
         qzxqdCfziNqOGoySZuHxIBU2vcASRKjnTY15eHmEaYPTPGrmBDQ7d7KAUv+AytlvhCCo
         eg0Q==
X-Gm-Message-State: AOAM531xaJrnFa5tv89RdTtfQ1prRvv1ELpFAp1L4OBHTRmBnIMZA3Xi
	YLjZ5TSrGFuN6Nlb339kY21+11ELmTUrdA==
X-Google-Smtp-Source: ABdhPJyTIwaHQk+maPcjkRIcMxJm1d7Qq3DNkGRPd5B0IDskosohnk6nV1w0lleOx6FIsuZMa55A/A==
X-Received: by 2002:a17:906:1185:: with SMTP id n5mr6274991eja.468.1619812044933;
        Fri, 30 Apr 2021 12:47:24 -0700 (PDT)
Return-Path: <m.glembo@googlemail.com>
Received: from bang.irisgmbh.local (p200300ef2f0068003391a83a1d487f4c.dip0.t-ipconnect.de. [2003:ef:2f00:6800:3391:a83a:1d48:7f4c])
        by smtp.gmail.com with ESMTPSA id mp36sm2624639ejc.48.2021.04.30.12.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:47:24 -0700 (PDT)
From: "m g" <m.glembo@googlemail.com>
X-Google-Original-From: Michael Glembotzki <m.glembo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Glembotzki <m.glembo@gmail.com>
Subject: [meta-oe][PATCH] yaml-cpp: Add a new recipe for yaml-cpp 0.6.3
Date: Fri, 30 Apr 2021 21:45:05 +0200
Message-Id: <20210430194505.69750-1-m.glembo@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Glembotzki <m.glembo@gmail.com>
---
 .../yaml-cpp/yaml-cpp_0.6.3.bb                | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb

diff --git a/meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb
new file mode 100644
index 000000000..cee2ea55b
--- /dev/null
+++ b/meta-oe/recipes-devtools/yaml-cpp/yaml-cpp_0.6.3.bb
@@ -0,0 +1,20 @@
+SUMMARY = "YAML C++ lib used to read and write yaml file."
+DESCRIPTION = "yaml-cpp is a YAML parser and emitter in C++ matching the YAML 1.2 spec"
+
+HOMEPAGE = "https://github.com/jbeder/yaml-cpp/"
+
+SECTION = "libs"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6a8aaf0595c2efc1a9c2e0913e9c1a2c"
+
+SRC_URI = "git://github.com/jbeder/${BPN}.git"
+SRCREV = "9a3624205e8774953ef18f57067b3426c1c5ada6"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-DYAML_BUILD_SHARED_LIBS=ON -DYAML_CPP_BUILD_TESTS=OFF"
+
+BBCLASSEXTEND = "native"
-- 
2.31.1

