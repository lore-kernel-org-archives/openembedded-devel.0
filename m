Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED13CC77B7F
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 14:13:17 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.14794.1751033590261682078
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Jun 2025 07:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UpZtOE2b;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so3595345a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 07:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751033589; x=1751638389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vACLBlz2g8F12heX1lNhuc3fDRBkkh71fEt393nZ0MY=;
        b=UpZtOE2be5NEFtdMznmvrQcQ9Yf0IYGU2zqVam6jU5npPOnoE38tT3VHR4jdR3yX+/
         g0Ll7xzZIb/eYWbEDwpyT5C9q426DABp4KkxFrwqy3tzc7hk8V9FRYCoGhuEp6KXfyWC
         SxUwYOGFJ/If59XVsp74Y4S4V3qH+n0hHwUPTXQYnIp8Lho9mZy6Y91Its3VoBHzmLsm
         sl+ere2a/0cb/JBlo889wx57a8vi3YDnTV9tB6NMZlYQMStYZYwzd5y7cNH7Kmq+ckz3
         1pOQkBwwn5HdQzulfrAKBiUB0+NcwGWcWXxsI8lhe2YcCe+umIoSGM3GtHl7qLdnFoQs
         qfew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751033589; x=1751638389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vACLBlz2g8F12heX1lNhuc3fDRBkkh71fEt393nZ0MY=;
        b=hO5J7KJ3sK8j6asl3f8uwCsAmGLdWhl/2XkxhpQq6r/5OQaUz+wX4J99sQNEM/dNPY
         m4yY1B3w4en7za9vJujzRJBxe+H1GQr/pbQ078WzHVyDTYBckWV0HDNEkXHH2PUi+9S2
         91f82nvqaVo0VGXTSD/idXb8Dck71bhCalt6Z6HiSl4L23fviItWYMUdShlK4VVlnNCQ
         nIy3x/pn0E9Advr/ryKp3+hSS06G6XFnf5GGL0th6fDOVBye1HZMPKDQn/5Zjk+Nt8b6
         KsfRVAJ/YyzAQBV0/XAoxT0DiQvOL5tWGTSdrEpTcwjH5dKkgQbjIKv9Qd0/8WzVQwIp
         8Vbw==
X-Gm-Message-State: AOJu0Yx/12xrFZkyw71vzYS/IuJ1VxwyDQLRv81LaThUQDDG8rNQyqOY
	BBI1u2G+dXyoAuAj954Tq1lnIhDU8y3SSlEyKGKBBM0Zrnv2HMvpbjj/yyJ5JQ==
X-Gm-Gg: ASbGncuDupK4eTY/CKL8AALsTfcPI7WSnfrPvlWt4OlsPtQGzzv97JntSToRwNAbsci
	dQRG9SY/YjYCXEwhiWAByujzZ+QjcLNGiLt9ytQ5fsjQsbiWO61RLaSsaZAVStVNub5sM8K8eV1
	rU5BiAJmcDqNviPlNR71Woecc8DzJeuXiJCgSPaFS/VFCUyrYykWfVKQtWsnePcbxRd7Jm8jjij
	JG9SIUHpZeIBQYz0KPQsIXVBEdBBbZLOxcOzFGxG4Q1qWFkjsRRPQaeLRdvk9RPUdRY1i3kM+j/
	+fH44IOO0FpKnz3V/gL65ik9xwWEHh/cpSBNg72QvpYXX+6wcaxVT9XcKok=
X-Google-Smtp-Source: AGHT+IHwUsa2jjBN7r62PXV+xVTj2NmHn2czLBr5cdB3aWBL0rKsmre6iGN4/HDDOA5LVJ55S72m/Q==
X-Received: by 2002:a05:6402:234f:b0:607:f558:e328 with SMTP id 4fb4d7f45d1cf-60c88d94602mr2731869a12.5.1751033588285;
        Fri, 27 Jun 2025 07:13:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831aa9basm1521764a12.45.2025.06.27.07.13.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:13:07 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] nodejs: inherit qemu class conditionally
Date: Fri, 27 Jun 2025 16:13:06 +0200
Message-ID: <20250627141306.354886-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250627141306.354886-1-skandigraun@gmail.com>
References: <20250627141306.354886-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Jun 2025 14:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118157

The recipe unconditionally inherits the qemu class, because it executes
some target binaries when it is cross-compiled and the bit-width of the
build host and the target host are different.

Since it is unconditional, it also means that it is inherited for native
and nativesdk builds also. The qemu class uses some qemu options that are
always derived from the target machine's configuration, even when the
recipe is built for class-native. This means that some of the variables
used by the recipe changes (e.g. QEMU_OPTIONS), and the shared state cache
is invalidated when the target machine changes, even when nodejs-native is
being built - and it triggers a full rebuild of nodejs-native unnecessarily.

To avoid this, inherit the qemu class conditionally, only in case it is
used (when the target and build arch's bit-widths are different).

Also, inherit qemu-native based on the same condition, and move around the
qemu-dependent code a bit, so it will be only executed when the qemu class
is inherited.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 4bc829f140..679acafabf 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -6,10 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b4f41dcacabc8f07b9ca7dee2f188a00"
 CVE_PRODUCT = "nodejs node.js"
 
 DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-native"
-DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native qemu ptest siteinfo
+inherit pkgconfig python3native ptest siteinfo
+inherit_defer ${@bb.utils.contains('HOST_AND_TARGET_SAME_WIDTH', '0', 'qemu', '', d)}
+
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -108,11 +109,11 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                    qemu_libdirs)
+    qemu_cmd = ""
 
-    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
-        qemu_cmd = ""
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "0":
+        qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                        qemu_libdirs)
 
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
@@ -209,6 +210,7 @@ python __anonymous () {
     # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
     if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
+        d.appendVar("DEPENDS:class-target", " qemu-native")
     else:
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
 }

