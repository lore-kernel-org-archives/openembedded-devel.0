Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.17956.1615095818773689323
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Mar 2021 21:43:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L9UlYFlp;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id mz6-20020a17090b3786b02900c16cb41d63so1343333pjb.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Mar 2021 21:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSTObxbNm1/cd0PX733/GRjZhn+4Y9u1zEmqiKWpw5s=;
        b=L9UlYFlpfVXnD0OPMA0ZWsHAg0Uyu1xdzd7t9HsMQkiyQGWduVIc3bZ0mduk3my3KO
         PuaOkQFnOaS1+GGKZjdGxKzutmAVHN9z0JuFh/zFUuFfUTcPGfSK83vZIWDl7TDOmifA
         MqRtP+gNPb/fM5YsSHwLPvZLUKdg08OWmYhLONJCCLC3t3XMwv0qTb7/mSUoh/m8hwmh
         qfBROlH6Qm3kmkiN5/t5HnwlzH3YWCHw0GUxF8dmnlA//WKm5CdeVlMBZEoS1nXsmm27
         OeO/+yFXIFw3NvebCHIpO9Y6V7aiHy3lpNbch2Zp4coHu6AcgIufTG4UrQDuXkiEscNm
         bNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GSTObxbNm1/cd0PX733/GRjZhn+4Y9u1zEmqiKWpw5s=;
        b=N7nRzltXeketcoTadN5JkS4HSTddTqjX3RqssJqKi9exjWmBm64lMcWsho5il9c4+2
         8H054Mn3rRoBWn70DgCQsqlyMAfYMW/RfqpSXNWqUsfhhsRzZ2tQ7K8vCn1HkCKv0Qnz
         SJG2sDu5tpeBqDEmKgaIsiI2ZFNv2DvxHuShpmGLlrFhAlHtUwEh+8zA5XtloLvTA4Lv
         wWGWlRRgxlEvbFlv3odmvpAzn6mrksUolPdoIpxkxTcvhBN07FGfOQJAJmezYxSWNHtA
         bauPBxgVx4nSsVQDznn/DvUgHqU10Lhei2LH49VV0/c0Cm20+dI4HHec7fnA8o0Xz0UX
         57Gw==
X-Gm-Message-State: AOAM533gY28wmFvRXCRMbt5AW00izEcgpZ0dzqY1kNxXaYfowBxo8sMv
	Qo+f2MHxa5XM0Y1kqKe/puuM8mlWnVXm6w==
X-Google-Smtp-Source: ABdhPJwzHa4QiJD3Gwl2Tq+XspdredUE3H4OGo1x7BnyP5EtHMn52ZGnJb75S8RC28fbnSQMfLQnDg==
X-Received: by 2002:a17:90a:c201:: with SMTP id e1mr18246629pjt.30.1615095817929;
        Sat, 06 Mar 2021 21:43:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::e641])
        by smtp.gmail.com with ESMTPSA id e185sm6796810pfe.117.2021.03.06.21.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Mar 2021 21:43:37 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/3] libbacktrace: Add recipe
Date: Sat,  6 Mar 2021 21:43:32 -0800
Message-Id: <20210307054335.2332899-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Compile with -fPIC and exclude for riscv since it needs libunwind

 .../libbacktrace/libbacktrace_git.bb          | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb

diff --git a/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
new file mode 100644
index 0000000000..1f3cb97c13
--- /dev/null
+++ b/meta-oe/recipes-extended/libbacktrace/libbacktrace_git.bb
@@ -0,0 +1,30 @@
+# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "A C library that may be linked into a C/C++ program to produce symbolic backtraces"
+HOMEPAGE = "https://github.com/ianlancetaylor/libbacktrace"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=24b5b3feec63c4be0975e1fea5100440"
+
+DEPENDS += "libunwind"
+
+SRC_URI = "git://github.com/ianlancetaylor/libbacktrace;protocol=https"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "4f57c999716847e45505b3df170150876b545088"
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTR_OECONF += "--with-system-libunwind"
+
+CFLAGS += "-fPIC"
+
+do_configure() {
+    oe_runconf
+}
+
+# libunwind does not support RISCV yet
+COMPATIBLE_HOST_riscv64 = "null"
+COMPATIBLE_HOST_riscv32 = "null"
-- 
2.30.1

