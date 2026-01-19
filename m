Return-Path: <frederikbraendstrup@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85040CCF2F6
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 12:30:20 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34216.1768825818255051146
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 04:30:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k0BYvMzE;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: frederikbraendstrup@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b870cbd1e52so621411166b.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 04:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768825817; x=1769430617; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PuQgCjypCM5iapq0H7HNp68svd/zuCyOqM/c2YZNc6M=;
        b=k0BYvMzENVqJKcblDTPMs9+nfTeq160IQ4Q9g3XmyDs6AUutmb6iGhIljaBQRrqWe+
         8ezp0lQMbVP6gbdrke3eBy/zMFKMu0NGBHS3s5324hHHJr4YjAQZBW2WKxESbCJr/+82
         fiGRzRWXAiy9WJ2yuaADOEx0jqiZ1pQ0FERUsmNDfmkr3yZdY+ousWXBbjwhiw62Szl6
         F6lfxgVgCB/OL1voMbTvHPAvfIZWXjCOY8jc5wfKbN4LCNklBiuZsSXlyYE+916Je/Yb
         Y0iFylxNMR0dJ1Q1cQpstwI3uZ2Dv6Ms8mavv28wzxNA+ISuigGz1ovAVMf4ftL8xUE6
         3Peg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768825817; x=1769430617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PuQgCjypCM5iapq0H7HNp68svd/zuCyOqM/c2YZNc6M=;
        b=tX1IF05UnJxSlWipVrcxrATB6vhtZ3Fm3ziUBZWB/lVZw8DgmpKuWW/cZ4NT66Wvwm
         HBEYR/uXc/YNtfvFjxefVqR8z5nxNby7mLP3VjhRGFkAeBni/jBC8H90a1gS8S8XmgwS
         +NgSwFLtfPEHaQfYY3mzCWEG0FRtBHMtbuo8qFPcSCmqjBgCMflDTdSua9vRlt8WeQOq
         xfsHsB04qimKnWZd3AFYIlfvpIDcq2EjUP0xaQTf4XZ9ynNDrylqdxqD7jWgdRTCAWcW
         WhdSa62/l5fnBZKarlpU6rBQs7Ey2+XhsoGFbpnuDX4OyVUhQZEl65BBy07tx13cO3ln
         ICJQ==
X-Gm-Message-State: AOJu0Yz3xEkhSPtGClI3g/gofsWJtVBmNAIEaGHNXDIN17dVvBke9I91
	42m6m2ZipH1FZ9dxKQE24qmw+Vmn+nXnO4kaabA/6guok6bjQwEC9orWB6gGsf14
X-Gm-Gg: AY/fxX6CKAzU4XrY78RK7ogN46gTIzAaKqyJlv5lDy36tBMV6U24+qy6EVJfQzEkS7j
	kGsAjRVW0g+Fae0oYbtxv+08T+U2HdbKoC3PXCfSnKoTXa7nkprSgzl/mPYrOE5N4D8v1fb+wlb
	W9KtYhHrwSJn0KOQzHjsXlwBUXymD8AqD3ItsI+8P5B2UKYomP4DRK4QKLFYtNxfeR+fFOEd8E4
	eosAWdLik6W6wOfzplfVYGBsNLOHCeoxMKniNZQIVfxKvVC4oU0uQ2hBqnMHAkqLKmVufZc6Inf
	LIGQ2kT1XMDvuTTysmV13vxXJahAU8ahDPZWTt71vPaFFg7pKd1Nx+k6lCdsls4KrXEhB9hqIth
	qbUJUM5PpJEaqkZCaaNqibfXC80jHSjNgK/qGAM/8xgNc67HiPizNyK7Dn0GD1hkD7t70ibZYBJ
	IWIstYNzLHsjjG9m+g6ZUPppud7EMqki5tb1V+7hqVdrcHYLBH7zAtaIbMYxv/I5AIJm5i4w==
X-Received: by 2002:a17:906:730c:b0:b87:72f0:3baf with SMTP id a640c23a62f3a-b8792e18ec7mr1010459266b.22.1768825816384;
        Mon, 19 Jan 2026 04:30:16 -0800 (PST)
Received: from ws.taila4487.ts.net (77.241.128.65.mobile.3.dk. [77.241.128.65])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9bc9sm1072502566b.33.2026.01.19.04.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 04:30:16 -0800 (PST)
From: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Frede Hoey Braendstrup <frederikbraendstrup@gmail.com>
Subject: [PATCH v3] glaze: add recipe
Date: Mon, 19 Jan 2026 13:29:45 +0100
Message-ID: <20260119122944.1111081-2-frederikbraendstrup@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119113844.289290-5-frederikbraendstrup@gmail.com>
References: <20260119113844.289290-5-frederikbraendstrup@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 12:30:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123638

---
 meta-oe/recipes-support/glaze/glaze_7.0.1.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-support/glaze/glaze_7.0.1.bb

diff --git a/meta-oe/recipes-support/glaze/glaze_7.0.1.bb b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
new file mode 100644
index 0000000000..6526b1d8a3
--- /dev/null
+++ b/meta-oe/recipes-support/glaze/glaze_7.0.1.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Extremely fast, in memory, JSON and reflection library for modern C++. BEVE, CBOR, CSV, MessagePack, TOML, EETF "
+HOMEPAGE = "https://stephenberry.github.io/glaze/"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ea4d29875d83fbbf50485c846dbbbed8"
+
+SRC_URI = "git://github.com/stephenberry/glaze;protocol=https;branch=main;tag=v${PV}"
+
+SRCREV = "a4af950700b8af2659f0d4a37a18a1b9c5300593"
+
+inherit cmake
+
+EXTRA_OECMAKE = "-Dglaze_BUILD_EXAMPLES=OFF -DBUILD_TESTING=OFF -Dglaze_ENABLE_FUZZING=OFF"
+
-- 


