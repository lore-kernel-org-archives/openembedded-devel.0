Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7340DD44141
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 08:02:22 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8288.1765526534809442772
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Dec 2025 00:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ar84SicT;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so987894b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 00:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765526534; x=1766131334; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcS8vIpzqT0gWRCFoZ/q9LmCjpfHT4A6gJnC4XDhXy4=;
        b=Ar84SicTGvd5yzCHdSGzFZnU//Bmvo4lua7WZzCHW6Xt2wUl5OtqFGa/oDA+a3/B5g
         UuMLfppCto7dIZettXw7IEktxKa+clmhYxRG2A9oOAfGlEmdEqNHMojFuyGaiSNlXNqM
         PvHaXir5LnfMV/zPObFdMuD2oaJE0oxeNGLQZe4n1z6KkOIAVyPjGbMMsr4aoYpTxbsz
         xAEimphpssEcPU4Rr3+SaupwUwlQW4aJ3fA8frYS1yb4OFsi2RFfBj+w9loYsCyCmqVN
         RbirXdVhxqhPQOJyFyy9qq9zYbEAuTlulRfMqXpu0hNHvaKqxy+hDSOKSt0EhVNhVmij
         v9Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765526534; x=1766131334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcS8vIpzqT0gWRCFoZ/q9LmCjpfHT4A6gJnC4XDhXy4=;
        b=oiJRMMphJFAdPwcqPKbdvg9VmTxLtWA0u9m1Hsk+kKtsWsveug0itACqJvXgP6ByFm
         Og84unbi2GxOIho7mHW4iXhmQqAw7zJT7d+peFvuNqUGJxD2i3i+JLLH5+6joCwlOJPj
         zGOq12SChahhgVkyRicTfB2FaEvMxYHTe6/gDLUWtBKUCM4XSIK9GDBF1mgDMz91RHAs
         0/JQfsUPUUsNNOZUGdbrnlGZy4CmCZjZAO9yNpUHMCHvxYqKKgCfyyX0mp2bIxzhbUQv
         jaqqYMLB3CLitCVN7/3hFq2DOtjCZqfstBH16p6fYsRoC0lZ+/aBOBL5ONTcVwFWbzKX
         k25A==
X-Gm-Message-State: AOJu0Yxyu3K78ZSUPvRlpvxKMp3qkKGW0VHSsO8luC/GFGjbIX9i/s+e
	AvlFC5aVtKIbbIgS7PhARnfbsEqRZ3G4BWgqwhPUX3FHXb19KqTYyn5zHhlE4g==
X-Gm-Gg: AY/fxX676J6oMa56tnp7IaqPIDx5+vfe2SAskgm1nTVPI9F3ZtYUFrbczyLztKFiCoC
	YBGa2+5HtWlrZyqzLq5g51HoxcLs+x2mff5QrTNXXcZ1s9AfPsl43Crbcs82q1aYkjA+CkvG1V8
	McakgfUzLH2xDGnnz5Nb8AJj0oCYXLF28k8vm/6Kfjv/uM5zyBl+CGIhcUUU2ZKbXm8RBfcdZi0
	Py7OZfBlfSiicVSgSjBe6L+QhT0C4T4n+TObHSjQ9Z4k9LQXj3dYgImfssAwfFK1r8AseYJbaif
	6iTKJTeAW0fg1P1KlmrxPpMEWRLMfo/X6bQersy6ehI6RshNW8Qpzp1Fi0n+TA1FHJenrb+4NFc
	hCPI775usmqoeJA3AROtc66zrSkkIsiuasqiLpMlGDT8IBN+x+3Udq/tFPksJkE4ZBS5OjVd23I
	A1ckYguqy04ogygeX0puaN/fA=
X-Google-Smtp-Source: AGHT+IH9h+KbeJ+1Z4WfUBIo/qnoPdtY9kanrJZO8ExaxmpGduJcz0PdvkBiHkyQZ2I/oKzXGoiKtg==
X-Received: by 2002:aa7:81c5:0:b0:7e8:450c:61b8 with SMTP id d2e1a72fcca58-7f67156b7ffmr885291b3a.40.1765526533900;
        Fri, 12 Dec 2025 00:02:13 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093c4bsm4494882b3a.48.2025.12.12.00.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:02:13 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Gyorgy Sarvari <skandigraun@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][whinlatter][PATCH 4/8] gupnp: add ptest support
Date: Fri, 12 Dec 2025 13:31:47 +0530
Message-ID: <20251212080151.3711461-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
References: <20251212080151.3711461-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Dec 2025 08:02:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122592

From: Gyorgy Sarvari <skandigraun@gmail.com>

It takes almost 50 seconds on my machine to execute.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e7878d69abd4d1cfaad3f5e5ba9cf7ad00f136bd)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../include/ptest-packagelists-meta-multimedia.inc |  1 +
 .../recipes-connectivity/gupnp/gupnp/run-ptest     | 12 ++++++++++++
 .../recipes-connectivity/gupnp/gupnp_1.6.9.bb      | 14 +++++++++++++-
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest

diff --git a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
index 7eb06f98ba..081ace6d22 100644
--- a/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
+++ b/meta-multimedia/conf/include/ptest-packagelists-meta-multimedia.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_MULTIMEDIA = "\
 "
 
 PTESTS_SLOW_META_MULTIMEDIA = "\
+    gupnp \
 "
 
 PTESTS_PROBLEMS_META_MULTIMEDIA = "\
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest b/meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest
new file mode 100644
index 0000000000..2efcbcb773
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp/run-ptest
@@ -0,0 +1,12 @@
+#!/bin/sh
+RET=0
+cd tests
+for t in $(find . -type f -executable -maxdepth 1); do
+    if ./$t; then
+        echo PASS: $t
+    else
+        echo FAIL: $t
+        RET=1
+    fi
+done
+exit $RET
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
index ee980cd382..e2bfcb5ed7 100644
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp_1.6.9.bb
@@ -5,7 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "e2fsprogs gssdp libsoup-3.0 libxml2"
 
-inherit gnomebase pkgconfig vala gobject-introspection
+inherit gnomebase pkgconfig vala gobject-introspection ptest
+SRC_URI += "file://run-ptest"
 SRC_URI[archive.sha256sum] = "2edb6ee3613558e62f538735368aee27151b7e09d4e2e2c51606833da801869b"
 
 SYSROOT_PREPROCESS_FUNCS += "gupnp_sysroot_preprocess"
@@ -18,3 +19,14 @@ gupnp_sysroot_preprocess () {
 FILES:${PN}-dev += "${bindir}/gupnp-binding-tool*"
 
 RDEPENDS:${PN}-dev += "python3-core python3-xml"
+
+do_configure:prepend(){
+    # change the test-datadir from source-folder to ptest-folder
+    sed -i "s!\(-DDATA_PATH=\"\).*!\1${PTEST_PATH}/tests/data\"',!" ${S}/tests/meson.build
+}
+
+do_install_ptest(){
+    install -d ${D}${PTEST_PATH}/tests
+    find ${B}/tests -type f -executable -exec install {} ${D}${PTEST_PATH}/tests/ \;
+    cp -r ${S}/tests/data ${D}${PTEST_PATH}/tests/
+}

