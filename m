Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C759C7EE39
	for <webhook@archiver.kernel.org>; Mon, 30 Jun 2025 09:56:49 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.35830.1751277405400689877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Jun 2025 02:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlsCslE3;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso11354825e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 02:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751277404; x=1751882204; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CqzQgvfG9FTzj7z4F5nkW8afCjLnePwvyqBeo7AbXm8=;
        b=KlsCslE3ElIHX0YeTbzp9gK3NMESJEn81nZ/m1U1RCVyUYI69ZvNHrmfSTrlBh6laR
         AJD8DNkZ6Y7dAVMcCxCRKRv5qkIjK2lIRQiugQ2uFxYa7mH6r7VdHr79+1Kd360vYxQv
         /dLi0wHwmAe1JyC6bSQIlZdtNqZGwnirTc0aYqzFkYKWlVLJEOI1ukHab8gPHKDQrZoW
         ezsNEe+tZof0wP5Qb+mAHdx5Cgj5v1nDvccavPEyBuKq0agKR8Ikz2BmSgJoOZB/jmwK
         sYJFlsD74Mla9g+fuYkxa2Aee8NUaA0Q6/E6gStr1e9ZY54MjQSrJ6CmNa/0h6ldB+Vc
         ohUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751277404; x=1751882204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CqzQgvfG9FTzj7z4F5nkW8afCjLnePwvyqBeo7AbXm8=;
        b=h1sqLZT0BSvis3j5PUAUChVScD6iVvRvZ0PIFkAHnzvhPHI8DBD47o1Y9Ne5IeiKTu
         5EiiYszufg5E8NYWAP7XkWQ8wcbGY3v++s90dEjHTowUXNbzBBFoEBZzaaYz2S52Kfwx
         GgcUZqmqBf+M3v28KBtrVY+qy7jpK3BftS3rsvrVfexN8YrObMV8BnjpuseuNoDcRcg+
         qHNcA+L/0Ml8iB3kLV2wc3kpoGrqWOLW7nCO9DquJFqW2jA3ubO/EiVzmIAGQkOHF4Ni
         RldDs/DW49SNPtXpY88aYcV+6pT5iCe0jHeLEMjGyuWwPP3VvqxkdLR2ETuIjCyiXkus
         TAsA==
X-Gm-Message-State: AOJu0YxUyZiALraNlQnB06ZvSjzzpYZMgdmUvZZQRUSTvoJOBI+b8+4T
	b6DDD8sEIxybcZIgvZaFZo/22R3akV0n6NY8vJe8vBIZn+hIbMcSetWroLqQ3A==
X-Gm-Gg: ASbGnct3ew9LNzk12xXmuGz3H8aQdPD10f4OeTrf6iE1xBECWbZ68YKQKHf776DYwAU
	p+wQL2aGsMNoK7rYf5/5iQHljze3dyGr71PTgSl/Fls0b7COO+FsFTFCgcwnVh1IEQTcx0HK7Vm
	T1XuqMThxWXomEup0S42wX26ahCXL10LTae532TlzhY/lKliZ3G9lwOq8+nsIMQ8vP9FdKkE5xk
	Y2/uWGsN1V2bsaRvFhNviLUDF8Kpqu5e97dZ8wO0wsAKCBXbwqPnVoRZQtohIq8TsdpddGuAuBH
	FXG8vHHXJiPy3yN8jWpZxYizi2ar+atkptbRcvaiZuqLSpxP9J9ZkgderMvk/8gK5DcGO9MWPRP
	ontRqiS5F7a/MxjYbriLIfbE=
X-Google-Smtp-Source: AGHT+IEZzOtBIGuwGH8V99/1PnvVFeqHKz5G95T0ScoQFANy8Bm4/Pk9sxMD1KSMkgXv9sn+63ZIFw==
X-Received: by 2002:a05:600c:8b78:b0:43d:aed:f7d0 with SMTP id 5b1f17b1804b1-4538ee8c722mr99957955e9.28.1751277403340;
        Mon, 30 Jun 2025 02:56:43 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538234b382sm161110635e9.9.2025.06.30.02.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 02:56:43 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] Revert "nodejs: inherit qemu class conditionally"
Date: Mon, 30 Jun 2025 11:56:36 +0200
Message-Id: <20250630095636.3102220-1-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Jun 2025 09:56:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118175

Plenty of other recipes inherit qemu unconditionally, including
some pretty foundational ones like python3, and they do not need
this fix. I think something else is going on here, and that issue
needs to be properly investigated.

There's a request to provide steps to observe the issue, but the original
patch author so far hasn't been able to reproduce it on demand:
https://lists.openembedded.org/g/openembedded-devel/topic/113861973

This reverts commit b2a950a75b15c93f625bfe6514bc248c9310813f.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
index 679acafabf..4bc829f140 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
@@ -6,11 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b4f41dcacabc8f07b9ca7dee2f188a00"
 CVE_PRODUCT = "nodejs node.js"
 
 DEPENDS = "openssl openssl-native file-replacement-native python3-packaging-native"
+DEPENDS:append:class-target = " qemu-native"
 DEPENDS:append:class-native = " c-ares-native"
 
-inherit pkgconfig python3native ptest siteinfo
-inherit_defer ${@bb.utils.contains('HOST_AND_TARGET_SAME_WIDTH', '0', 'qemu', '', d)}
-
+inherit pkgconfig python3native qemu ptest siteinfo
 
 COMPATIBLE_MACHINE:armv4 = "(!.*armv4).*"
 COMPATIBLE_MACHINE:armv5 = "(!.*armv5).*"
@@ -109,11 +108,11 @@ python do_create_v8_qemu_wrapper () {
     on the host."""
     qemu_libdirs = [d.expand('${STAGING_DIR_HOST}${libdir}'),
                     d.expand('${STAGING_DIR_HOST}${base_libdir}')]
-    qemu_cmd = ""
+    qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
+                                    qemu_libdirs)
 
-    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "0":
-        qemu_cmd = qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'),
-                                        qemu_libdirs)
+    if d.getVar("HOST_AND_TARGET_SAME_WIDTH") == "1":
+        qemu_cmd = ""
 
     wrapper_path = d.expand('${B}/v8-qemu-wrapper.sh')
     with open(wrapper_path, 'w') as wrapper_file:
@@ -210,7 +209,6 @@ python __anonymous () {
     # 32 bit target and 64 bit host (x86-64 or aarch64) have different bit width
     if d.getVar("SITEINFO_BITS") == "32" and "64" in d.getVar("BUILD_ARCH"):
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "0")
-        d.appendVar("DEPENDS:class-target", " qemu-native")
     else:
         d.setVar("HOST_AND_TARGET_SAME_WIDTH", "1")
 }
-- 
2.39.5


