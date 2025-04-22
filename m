Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D80C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 17:57:58 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.46954.1745344671811350674
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 10:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ed0NGrIX;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so1040695e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745344670; x=1745949470; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dF4kCXFHQR9ScWFm54rj+h+OEyLOuqgGfkWEfGeIApA=;
        b=Ed0NGrIXzZp+x8LQ969LY8tpQ2ny8NVMP86HWjsFAcqgNprnU/lAj+bBwoVDjpCtOG
         QNYVmBmPfxcJiJGhO3FLA5zuTs2FbQ4Eq1afv2r1uRhtrkVWnvM4fOlGN+kcuLaiLDeD
         jh0/0d84VX2mSJBBY/oR6BXW/XOYfCJRZRI2+u0S66WRwrAA29FCxjW/jgw1JiBfse9x
         88AJQCZJV820d4RvmESfTeGcIc5oyimO2fVTvkV/6fwvNV+teaE7dH+yyb19Nqo75yIE
         m6pb8rMLc50560wzRdoLVDXL3k9pI3j86VCh5dEKno99gPQ9zaketQCQcUpCy/krb+02
         XpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745344670; x=1745949470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dF4kCXFHQR9ScWFm54rj+h+OEyLOuqgGfkWEfGeIApA=;
        b=QecuUEeHcOY3jWzQJfBxx7KjVrIm+VxAjN5Z95inaerQ4l82xt0RKhKiG4oxBaB0py
         PyR3Plvw0yDJCDdWD9JpskbXKPZx/w5IEmBxv8HX901NSFbhQQ78Awb9aH90S4+EBRHs
         wUH7qo4TLXa6aSnJ/SMaAru+4VXHauKvPKZLgrWu3AKJ8Ui/356llPKDspg/efhpOa+A
         I+pRSkmLMjs6GU/Y8xMunMFel5hUTomxItyaqQwB7qss0cj7ql/N2T1kQpPv/ClwDE6g
         LUMpaGTdziApIjdiJtqeQOwxZZOFbcLybFTPTrGJWP9nCeyx3YwS+08C2xQ7suELvg5h
         miZA==
X-Gm-Message-State: AOJu0YyM3pTXgWrdOMgZvSFMv11FpejQqqToyPxlJ4jBgRia5RWQqQt3
	v7FIBy0Z47GvD33WPe5iERmfFOcbL1mWsX7O9TH79+LJ/VE/1HbZIfI1+Kzv
X-Gm-Gg: ASbGncsLVQatgg1j269/dvxAn8VFxu3qBIIhxtwFnFiFA7OFh5+2ziMg69MyoFYHm8/
	BARYoNfRf4YDEW2qsqJKK1IOfgLs25HG9KVz37sWI7ayzofQ5e5RvS7FIQIF3EZVySMklZXyyH0
	GH3Bc76wqECHhk9K9iLUE+zCpr5t0maIxSPKSCRWBJyg5XV7Zir/mUdVZP3yIMKo/Lv51Bb4Fl9
	UOsdB78MDargG2b8l0UBBVIiNo4liboMAqhfIso680eVQ+3cXUzaerUqgP32BUbZyEEiuL/hvoA
	u+JALmdJzZvLviNVOJPArd4cUy1p/uPFPmrvWbOi+cmab0cFj0HpiUdxZqW06UkjKFgFeNBb7g=
	=
X-Google-Smtp-Source: AGHT+IGcj5oryTFfg4y/cPD//p4JlgehA/wnFgG/r1gVCaIt7ImpdmFZkUoRy5Y4/BLoF6V4G2kxxw==
X-Received: by 2002:a05:600c:8710:b0:439:8490:d1e5 with SMTP id 5b1f17b1804b1-44069710444mr163004465e9.4.1745344669959;
        Tue, 22 Apr 2025 10:57:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4408c80174dsm18736825e9.0.2025.04.22.10.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 10:57:49 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH 3/6] yasm: fix build with gcc-15
Date: Tue, 22 Apr 2025 19:57:39 +0200
Message-ID: <20250422175742.786560-3-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422175742.786560-1-martin.jansa@gmail.com>
References: <20250422175742.786560-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:57:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117063

From: Martin Jansa <martin.jansa@gmail.com>

* fixes:
libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
      |                                ^~~~~
libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards

as suggested in:
https://github.com/yasm/yasm/issues/283#issuecomment-2661108816

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../0001-bitvect-fix-build-with-gcc-15.patch  | 38 +++++++++++++++++++
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch

diff --git a/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch b/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..f3f2c431d5
--- /dev/null
+++ b/meta-oe/recipes-devtools/yasm/yasm/0001-bitvect-fix-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 22 Apr 2025 19:06:24 +0200
+Subject: [PATCH] bitvect: fix build with gcc-15
+
+* fixes:
+libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
+   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
+      |                                ^~~~~
+../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
+
+as suggested in:
+https://github.com/yasm/yasm/issues/283#issuecomment-2661108816
+
+Upstream-Status: Submitted [https://github.com/yasm/yasm/pull/287]
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ libyasm/bitvect.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h
+index 3aee3a53..a13470ad 100644
+--- a/libyasm/bitvect.h
++++ b/libyasm/bitvect.h
+@@ -83,7 +83,11 @@ typedef  Z_longword         *Z_longwordptr;
+     #ifdef MACOS_TRADITIONAL
+         #define boolean Boolean
+     #else
+-        typedef enum boolean { false = FALSE, true = TRUE } boolean;
++        #if __STDC_VERSION__ < 202311L
++             typedef enum boolean { false = FALSE, true = TRUE } boolean;
++        #else
++             typedef bool boolean;
++        #endif
+     #endif
+ #endif
+ 
diff --git a/meta-oe/recipes-devtools/yasm/yasm_git.bb b/meta-oe/recipes-devtools/yasm/yasm_git.bb
index e2c1a3c02b..de7eb45c1d 100644
--- a/meta-oe/recipes-devtools/yasm/yasm_git.bb
+++ b/meta-oe/recipes-devtools/yasm/yasm_git.bb
@@ -13,6 +13,7 @@ SRCREV = "121ab150b3577b666c79a79f4a511798d7ad2432"
 SRC_URI = "git://github.com/yasm/yasm.git;branch=master;protocol=https \
            file://0001-yasm-Set-build-date-to-SOURCE_DATE_EPOCH.patch \
            file://0002-yasm-Use-BUILD_DATE-for-reproducibility.patch \
+           file://0001-bitvect-fix-build-with-gcc-15.patch \
 "
 
 S = "${WORKDIR}/git"

