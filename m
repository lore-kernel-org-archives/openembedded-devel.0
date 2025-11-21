Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF014CFA754
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 08:39:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7600.1763714375569499577
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Nov 2025 00:39:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JxaA5EoZ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1457703b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 00:39:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714375; x=1764319175; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8cD83bgp1nLLbG/DZ+KVX9WXdOEV1cdMgOpxbiOrVE=;
        b=JxaA5EoZCvjwiS6UkiyaCzUhGApxqL3xl8cQdc+altPSMau2nDIrBKJD+qEib2RmGz
         3k3sOC07CqsPbcTr5Z1sUFTMtpfz/7zlpi2UU9G4uYf3t8u1geJi+wRkjAck4tDHSZVO
         QSyoBZmkeJNw1b8nEjEvlouAGUAqmsFYJPCUU2qlKZ1Nr40L5EwEaFWM1rrC2tQgxzGO
         OmJU0263dHdkR1Gvdb2zfDB/pqqASc9SAmO9IzAiV09Nh46EMz4GNqsFx5+p/+w3qfMz
         uuxi97QKE4ipS7MutHnBc5yrZqmg/7JzJTqwCzBWZe/LEYjzy9b9k58CPS8Wtf2Ny7m6
         CVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714375; x=1764319175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q8cD83bgp1nLLbG/DZ+KVX9WXdOEV1cdMgOpxbiOrVE=;
        b=LOhqMLoRci8ejN16Kcszec341dQFxf6wNkktglZfCYlqAnlXPTv9jTinx8DV2dbtEg
         Ir1L6tQMmo2ZGehfKJziuS4S9bApTCSnmollHPptKxN8OMc66Jkk3fpv/jUM3K7wL46L
         EAQ0eqxD8cOOIyTTUtESFEArXQIdTY29UHgMHFNTWUazkwX7wqvzYWe4BniUfyJYyZzq
         xP/mI4bibYbnv+/p6HBW6arSxKHa6OCJulGiaGE4MBKjMVJjoJOuqcZnjCnkfAWacqxS
         REmOURoLafV5uSH2G9J0e5XjOnAib1zbpthBVjlHAosiLzutUDqgXT8Vppy+LXZv+AyN
         0GRg==
X-Gm-Message-State: AOJu0YzAB1rW2Wn+W8wvNRWnzu2RWLlbHbqb92/VI6ViFK9m83wtxSy5
	h+wSzRE54mIc2MFBp1GFoDCGHbRd+YsFNTTugY1D19UA2sy9HTyzBdZsYHZl8mbiBMk=
X-Gm-Gg: ASbGnctfCwCPUth2pkDz8TvRJhpWLqCwh1i/nSkUstv/1rXVvvIX3IHtD6TTlJOaNvB
	/iEXg3vSdE+g6UCGv7aq5H9UBVQq5fBns2+85PeXDmd7G2eCv7dogBoBJ0m5+Gp4yFx5g2NIKC6
	BLcfit1d6ePQCnlqbgWEOIMpfWa/8nneeVrrWEUOpbkT4Igu6IniVOgsQjlTwrkx2KnI/xrMsBr
	gcLDgwFYESZohLj8VifJOLhTTbTq5ycK4tIuwktw0HLIcNgdvwkSlekybu5NPZUg7/m0VxLHrId
	ULiAC1QBMpNFCuSQbg61Rli9Od0ehQe32XvGE1Txx7c5QtGCrldC2y+mv2t7ZCK03C3i8u9zru6
	UY7AbNNJ2nrlwqHjAdnWGAlv2gFxWyAUC0GFo0gF9Ai5oZHaqmYrTfoL8nyog4lKpaylHoI7R5N
	XSTC5n2lbjgODY95Mz++li7se+YB7uihhzygKVFHse+T5VNHp4xRSKpFXRbJdmTwVzDw7oj8pN2
	r5Hu0T3+AgM8lrAFTd2tnjLvGu2D1r3
X-Google-Smtp-Source: AGHT+IHyvpD9EYAWN1i62C2qTpiwzYpmBQbi4y4a+brm/IRxh/vpmYRK2CiS9kTQSIyJF8qgVBw/xg==
X-Received: by 2002:a05:7022:7f19:b0:119:e55a:9c00 with SMTP id a92af1059eb24-11c9d855016mr249573c88.28.1763714374450;
        Fri, 21 Nov 2025 00:39:34 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e55af3sm21232527c88.7.2025.11.21.00.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:39:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] open-vm-tools: Avoid GLib g_free macro redefinition error
Date: Fri, 21 Nov 2025 00:39:31 -0800
Message-ID: <20251121083931.3195925-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Nov 2025 08:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121960

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-GLib-g_free-macro-redefinition-erro.patch | 31 +++++++++++++++++++
 .../open-vm-tools/open-vm-tools_13.0.5.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch

diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
new file mode 100644
index 0000000000..b5142fa23a
--- /dev/null
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools/0001-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch
@@ -0,0 +1,31 @@
+From c21c9a7c1ef89c63c1b124a0f49d95ed6ae8f19d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 21 Nov 2025 00:29:10 -0800
+Subject: [PATCH] glib_stubs: avoid GLib g_free macro redefinition error
+
+glib 2.78+ defines g_free as an object-size checking macro.
+open-vm-tools overrides g_free(), leading to preprocessor expansion
+inside the function signature and breaking the build.
+
+Undefine the macro before defining the stub.
+
+Upstream-Status: Submitted [https://github.com/vmware/open-vm-tools/pull/779]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ open-vm-tools/lib/rpcChannel/glib_stubs.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/open-vm-tools/lib/rpcChannel/glib_stubs.c b/open-vm-tools/lib/rpcChannel/glib_stubs.c
+index c32deb073..cb89c6a87 100644
+--- a/open-vm-tools/lib/rpcChannel/glib_stubs.c
++++ b/open-vm-tools/lib/rpcChannel/glib_stubs.c
+@@ -35,6 +35,9 @@
+
+ void *g_malloc0(size_t s) { return Util_SafeCalloc(1, s); }
+ void *g_malloc0_n(size_t n, size_t s) { return Util_SafeCalloc(n, s); }
++/* GLib defines g_free as a macro, so undefine it before providing
++ * our own stub implementation. */
++#undef g_free
+ void g_free(void *p) { free(p); }
+
+ void g_mutex_init(GMutex *mutex) { }
diff --git a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
index 304d910940..ac641e0327 100644
--- a/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
+++ b/meta-networking/recipes-support/open-vm-tools/open-vm-tools_13.0.5.bb
@@ -43,6 +43,7 @@ SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https;branch=stabl
            file://0012-hgfsServerLinux-Consider-64bit-time_t-possibility.patch;patchdir=.. \
            file://0013-open-vm-tools-Correct-include-path-for-poll.h.patch;patchdir=.. \
            file://0014-timeSync-Portable-way-to-print-64bit-time_t.patch;patchdir=.. \
+           file://0001-glib_stubs-avoid-GLib-g_free-macro-redefinition-erro.patch;patchdir=.. \
            "

 UPSTREAM_CHECK_GITTAGREGEX = "stable-(?P<pver>\d+(\.\d+)+)"

