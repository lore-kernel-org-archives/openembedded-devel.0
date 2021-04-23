Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.45.1619208272126142336
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Apr 2021 13:04:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NyPYU+vW;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id e9so8781684plj.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Apr 2021 13:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NnM3gtrjtvega5JqUpY5pmWKlWHxf4F+dDqggssYTfE=;
        b=NyPYU+vW1Wr/26Sy4DXw7FCZLdzZ2XZiOhJ64Vn09l+EY25KjgOpGyKdDUZWwmNswK
         URh2J6TfnXkoAUKBd6nCzltDtkqZfS9PThvGXxE7+1fyHTwWcdlVGtEKQ2y6EF8I/fO/
         kkkpfBgktRLvreaJf3tnPEdkRR7O3WYi/1e82DTyZ4dKj7dQATl6rPXKgzimV2eDoJDA
         R/cGjbOQJuoh8+TZIvrQBumgo4J3THrSBPbzQGFlWgRsGaHeIv/urcjvAs5kXsHNa0yU
         q9tDTF+C1isMHtd/pQURE7i8JmsFkwyEZHT2psvRlXBlW6hy0g6YymVuwkwKUI7UxJye
         fCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NnM3gtrjtvega5JqUpY5pmWKlWHxf4F+dDqggssYTfE=;
        b=piMUEKPjgviych3Ri8cAiozNFJKCHtxjLHf7kYZON6Ww8svd3dylV/19EXp8ekJj4g
         5+yojiRPUQetpULJLIdU1CXfw7ILQ02UiQOI5ngOapPiJvab/1iEvCpv4PUyLa3a9Mqd
         R8E/fOvrF+2lBy1RzyY/chzr/LUNJLEf8FSXUP5lIu8/SLGoHcA5U2++T4fVGL7Qa5b0
         5QrodigMEX4bNi2cAsXSnnxVeujVimxZ6Fy/ZmzTQJGrFkiHIdlxeIC2uXAnKG5RNPbJ
         itnty7YyPbU78bbO0V9kJRXu4YctrncvfU3OaESKxnJOzwEBm4OgzI6yX3ajXnZ3AaJH
         bEWg==
X-Gm-Message-State: AOAM532mah4HOvW4US1wG/lvTeyhp0UBgjsxeAHWLT1cpp52mLL/+Dud
	wR1/YanAbmMjmEqk8DVD/xOm/ySriSpCqg==
X-Google-Smtp-Source: ABdhPJwngR5lhjo2dctXJAh3NABZ8KCQj3sz/PJ/BvZ8H1n6i3c8aIjHKgz6vEtCVLzfMGDsMaCgyg==
X-Received: by 2002:a17:90a:f2ca:: with SMTP id gt10mr6423251pjb.231.1619208271482;
        Fri, 23 Apr 2021 13:04:31 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bc1b])
        by smtp.gmail.com with ESMTPSA id s22sm5653008pjs.42.2021.04.23.13.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 13:04:31 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][ 1/4] python3-jinja2_2.%.bbappend: Delete
Date: Fri, 23 Apr 2021 13:04:26 -0700
Message-Id: <20210423200429.1109991-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes are moved to OE-Core

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-jinja2_2.%.bbappend              | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend

diff --git a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend b/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
deleted file mode 100644
index 9fe358427a..0000000000
--- a/meta-python/recipes-devtools/python/python3-jinja2_2.%.bbappend
+++ /dev/null
@@ -1,13 +0,0 @@
-# Main recipe was moved to oe-core, but with ptest disabled
-inherit ${@bb.utils.filter('DISTRO_FEATURES', 'ptest', d)}
-
-do_install_ptest() {
-    install -d ${D}${PTEST_PATH}/tests
-    cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
-}
-
-RDEPENDS_${PN}-ptest += " \
-    ${PYTHON_PN}-pytest \
-    ${PYTHON_PN}-toml \
-    ${PYTHON_PN}-unixadmin \
-"
-- 
2.31.1

