Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264F8C36016
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 21:01:17 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.3826.1743454875757754382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 14:01:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lg/v1bBG;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso8883168a12.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 14:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743454874; x=1744059674; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrNRGIfMeCGcX1KhN174b5b8kysH04YKGMUgsQ0Qu48=;
        b=Lg/v1bBG1CPZQrJFDB6IPYmrBAKGpZiYAUJLPxDgyyKkQzMPixcXDItDuI2v2TLzNA
         9zHIEth6I9F2Nh4QIAc8hUSY06WGL0vyUNvW9CFxgQRLB+v8/iJ4IxXeEhRWH5vbN9AB
         EurzHmOTZHrW8HmsU4v668VnWoJ0YZv2T7VYdxg7VVBShUWlgqQeTTQtKy6KrAtgefor
         CWHocLQ1DK0HgS9hINkZLvYSld3Zr3rR/f/WFwLmxdeeZI/WkPHKVWlIvi+trQceLadz
         OPiuK/wlq3WyWQKU4LVE7tApmw0sTYLQTXJqTINuKYW57B5VnamJZKrkk0AgPeIcSme1
         +yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743454874; x=1744059674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrNRGIfMeCGcX1KhN174b5b8kysH04YKGMUgsQ0Qu48=;
        b=tWhl2xsqBJI48LnY9iRuEYu5wD7PvVRD4xzLHmynpYQtV/MawiHM0LaqTGheKPiY4b
         233iMqDd6O/ApAYccvKc9T4yaxZVfw/pNM6EI0fPEMy/0uPlZ6BMgMgxo7EWiKvcHjLw
         UDrFm+zMkJouwpOfoFKp0xcGNXUH/ymiEcO3SqXlbqnxfXdrsFmjxCrTxAsxfcjhjjYW
         avS74iCTEzHR3qCd63dCbzctcDzEeyV+mew542/cUtpMiBv+H7vh8ZFSQ7GVAAd+HX4C
         nrCmqmSy6acBP/wVsfTiVqkNPkORNIgKjWrwkOCsvnD3Xs7O1pFmm7vt3Y4U/ioMp6Kw
         roTA==
X-Gm-Message-State: AOJu0Yw/jVqzRN6rMtpoCevc+K5t7479D23zdHPGbfPKA+J1u752AWb6
	jKEiI/LpJWHn5sIrYapHeg2KymhdRqiGciEgsyMERMTjxfqTte9BTEtuld73
X-Gm-Gg: ASbGncvVVkkHL7b3CJilMwaaiCCmpiDYaOfNlr6eSpcVjH59bR3ib58tg8oosDneNSp
	hO7+sG6v4K++14WEfteRm2Fw9/p+KpHJNTnCqP3iyua6mXBuNVQ+fJp0xSg+S+S1g0CEX6wbrQo
	tvTWkBvBZDsCvqZn1xJ+Co8qb0hdGdbMVpST7IoimW8o0vCFtAlq55GKe1j0tLDxByzOyd1gI/U
	hhOItSnWMACgi3lP8v6avk3QeXKLOoBylm6KNc+WT2O5LY6+Z4GQngqpf4UEzE+RcdD2xPzHqKE
	MfsOoUqtA4akEn73Exth/hk7EpZ9W1kKW4YvCx3r7nN2U7OXwegrIggXDskRveKsa1yDeGtDiIc
	fPw==
X-Google-Smtp-Source: AGHT+IFVVMeKQo8OBnPqwSUSe7uun2AnzQjuIA2zAh3KDIlVs8JarNAb5V/iFI1yCRo0eSVW+q/q/A==
X-Received: by 2002:a05:6402:42c2:b0:5e6:44d9:57f7 with SMTP id 4fb4d7f45d1cf-5edfd6fd6f3mr8681641a12.26.1743454873897;
        Mon, 31 Mar 2025 14:01:13 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5edc16d5f15sm6053654a12.31.2025.03.31.14.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:01:13 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Armin Kuster <akuster808@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][scarthgap][PATCH 02/21] blueman: Fix buildpathe issue with cython generated code
Date: Mon, 31 Mar 2025 23:00:42 +0200
Message-ID: <20250331210101.3460858-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331210101.3460858-1-martin.jansa@gmail.com>
References: <20250331210101.3460858-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 21:01:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116438

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>
---
 ...n-DO-not-emit-absolute-path-when-S-B.patch | 38 +++++++++++++++++++
 .../blueman/blueman_2.3.5.bb                  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch

diff --git a/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
new file mode 100644
index 0000000000..10f89a124c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/blueman/blueman/0001-meson-DO-not-emit-absolute-path-when-S-B.patch
@@ -0,0 +1,38 @@
+From 18af739fd96960bbc8c5db5dd290d2f9134cd347 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Aug 2024 21:26:24 -0700
+Subject: [PATCH] meson: DO not emit absolute path when S != B
+
+build systems like OE build outside sourcetree in such cases it works
+ok but cython resolves the input file to absolute path and that gets
+emitted into genetate _blueman.c as module name, renders the build
+non-reproducible, wish cython had a better way to handle this but there
+is not, therefore tweak the meson build rule to account for specifying
+workdir to cython which will search the inputs correctly, and use
+meson's build_root to emit the output into build dir. This ensures that
+it becomes independent of source or build directories and cython does
+not generate the absolute paths into generate C code.
+
+See cython discussion on [1]
+
+[1] https://github.com/cython/cython/issues/5949
+
+Upstream-Status: Submitted [https://github.com/blueman-project/blueman/pull/2461]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ module/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/module/meson.build b/module/meson.build
+index 096ad7c8..e3d96f17 100644
+--- a/module/meson.build
++++ b/module/meson.build
+@@ -4,7 +4,7 @@ blueman_c = custom_target(
+     'blueman_c',
+     output: '_blueman.c',
+     input: '_blueman.pyx',
+-    command: [cython, '--output-file', '@OUTPUT@', '@INPUT@'])
++    command: [cython, '-w', meson.source_root(), '--output-file', meson.build_root() + '/' + '@OUTPUT@', '@INPUT@'])
+ 
+ sources = [
+     blueman_c,
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
index 0374d23f0c..4174da721d 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.3.5.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-Search-for-cython3.patch \
     file://0002-fix-fail-to-enable-bluetooth.patch \
     file://0001-meson-add-pythoninstalldir-option.patch \
+    file://0001-meson-DO-not-emit-absolute-path-when-S-B.patch \
 "
 S = "${WORKDIR}/git"
 SRCREV = "c85e7afb8d6547d4c35b7b639124de8e999c3650"

