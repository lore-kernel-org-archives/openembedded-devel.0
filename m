Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38CBED3B9AA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 22:54:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.857.1765320892885388207
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 14:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D0B3bznp;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso7087745b3a.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 14:54:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765320892; x=1765925692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ws/jzgenymaenbl6NAt1uAdVbJ70vibq/zywzFRyGJQ=;
        b=D0B3bznpnXrEiYT2fTOB2T68bWcD3d10eAgJDfA7hXHvs+yNl1kE4rrtKtCQJqnsIX
         g5ffiZ2QOkgJnVi8oreLcEwkBJ5pXuRq8/as7tJCofBbXn+9NQjxiNV30cL1O+Ek42mR
         flQI0JUab4f5BLyxnergCdktiiziWeQrStnkrra2WOfCvrQvxGWNVsGlmtdUhpIw1LkG
         oGHA5VQGzjvQCULMVJBvWOLGYHO7xm/po8IThUI/K6i4sK5ICgsmLgqB3ozfzUI9QRUa
         5vbBDysQyDDbzjVTc82mUU69ysDZFWTOh7Uz1Il9GZRySXh9/i/LDKt1eWO9znrdUsFP
         Fs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765320892; x=1765925692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ws/jzgenymaenbl6NAt1uAdVbJ70vibq/zywzFRyGJQ=;
        b=KwtavSOH6bPw79rPT1fmicm5J/VMdTy71c6zgt9oiowlXErJwyT0vIM+mlOPXDfd7b
         GxNAJhMNQ3mVkZq+RwBcmq91cbe7mFGSV2pt/+gFIr755AiIpDqVWL70Q84AVP+x7SPB
         XxaqvnoiBpAp1MNLMFhwcCzOQYNq2ZWjpaYTl6zn3OC+jcfLykh3UYIQ5FEqPfP4BxFH
         4leJOLNrwU+bjdbNTarzi9hMkS/5XkhThfIvKeKo9Lsth304XxIrCjIMbgTb1UBKmzhj
         YJH+XZgifthV5waRM/gr7PbcZab+HhTqODUOUg3MDijI4QR/a29UiK4qfqNw548qxH5l
         XPjQ==
X-Gm-Message-State: AOJu0YzKu1Dbvt9JJG0XSj8EgtJrrziJMgvCeXceISaZ9tjVidbL/AQE
	wmBYh2au6XeW3A0VPF8P+SDp4z0YrF+TOxy0IDlc824O/C+mT6u4QUzldFO59p4vq2g=
X-Gm-Gg: ASbGncvdVGi5ixMbh7qnd8/AV5NKTsBpMhQ9qqneGSqLu9dYqUCu5bQRaVas3hO1Tlg
	NtWPpuCgQs6QRq2kvmVWcVbC4tA1CXo/rBFNrcMefg3lpZGklRPoiWNU/OF9fm+QLRHMdfhdKMu
	pApUkqXkSt+yvmplxaJ1UEyQpDpNpJJcREIZ/e0pJB9K3Q0dZG909vHaAb3Xxy/ozrZI6PyNTY4
	ZcC01OdMSEzsQmFde571AJg22FNk+QQTdMqzuDvnkvkqHyRelpZDjwr5Z2DVti951Fao6u/4Y1r
	wMupmoB9ZXqq8rCuWm+OvNkuXdawSS9l5apQSnje8H6ocZsMUVomRpeB6+VA1+8Xh3UX50GLmQe
	wvCe85jaFHihZjAfRWPTSCp+KtQa7/KGbS1dJdsnSyPbZzip5p8XhcAaEl0Dct6MmwJm/NUGz3j
	NUqIyvLqBr9WKqajsbukuxBBnd63y5qM9wgSr0QpcgrK86LFuHvj28L5a1LBjm2fjijLvIjMkwK
	+lmCXE2LJ6Kz4Sd8SaL4zugxJbgwTvD
X-Google-Smtp-Source: AGHT+IH01SVDQjoNl0Ka5RHjbsjenlXschv7ay5sO34NttwtZQF7daIXEZ/7h/bHirpTSwFdbEvHfw==
X-Received: by 2002:a05:7022:4190:b0:11f:1e59:4c2d with SMTP id a92af1059eb24-11f2966bd24mr242567c88.7.1765320891839;
        Tue, 09 Dec 2025 14:54:51 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::69b8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2f3csm70404942c88.5.2025.12.09.14.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 14:54:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-backports-zstd: Add recipe
Date: Tue,  9 Dec 2025 14:54:48 -0800
Message-ID: <20251209225449.846352-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 22:54:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122477

This is required by python3-pyzstd >= 0.19.0
tests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/ptest-packagelists-meta-python.inc    |  1 +
 .../python/python3-backports-zstd_1.2.0.bb        | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index c72b4cb5d0..e17d5ef46d 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -12,6 +12,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-ansicolors \
     python3-asgiref \
     python3-aspectlib \
+    python3-backports-zstd \
     python3-betamax \
     python3-bleak \
     python3-blinker \
diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb b/meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb
new file mode 100644
index 0000000000..2a07c36c40
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backports-zstd_1.2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Backport of compression.zstd"
+HOMEPAGE = "https://github.com/rogdham/backports.zstd"
+LICENSE = "0BSD & PSF-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=224f30639105a6ab845e068c2d0903ff \
+                    file://LICENSE_zstd.txt;md5=85fffd6822a26cd7d2a6eeb939ada0da \
+                    file://src/c/pythoncapi-compat/COPYING;md5=f74f54822fab8814a50330e4e4578b88 \
+                    file://src/c/zstd/LICENSE;md5=0822a32f7acdbe013606746641746ee8"
+
+SRC_URI[sha256sum] = "6c3fc19342db750b52fde793e4440a93575761b1493bb4a1d3b26033d2bd3452"
+
+inherit pypi python_setuptools_build_meta ptest-python-pytest
+
+PYPI_PACKAGE = "backports_zstd"
+
+RDEPENDS:${PN}-ptest += "bash python3-compile python3-codecs python3-mypy"

