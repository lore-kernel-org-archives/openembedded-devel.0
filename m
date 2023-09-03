Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A04BC71153
	for <webhook@archiver.kernel.org>; Sun,  3 Sep 2023 16:03:57 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web11.30286.1693757032482027813
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Sep 2023 09:03:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B/lfioQX;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1ccb6a69b13so663367fac.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 09:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693757031; x=1694361831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+99Q/6ks6Ei70Yb1SR1mjrEnbssTqwC7yhvxvOn/qfE=;
        b=B/lfioQX685eD2YCVVgjTKGrcmPBOpLzAQOt4m3Lhk2FHwhiB9CoMrEORR9IxIch1p
         9b1/q8OhMKdtYgZL6yFkJUOjPDdfsSfFKh50xC6q23bAsKnFvREjrDSa3AfW7PsbMXhB
         RkXnwSyNGYLSmeQr1isRBpF/y4UhaCPzr7//WGWf/Y1063k+GcHVpZ4reKEYX0LFM003
         LaCGO5UjHlANxS2t9wYq6WkrhddcQvvOr7FYOKrwVQlZgvro7s/Qltz6OAZG5Pp/itUE
         /X5GToD+TxzURi4/EHZtQJiHfVcc+I0F9oKewrBQUA9pKzSL5Jd+uYaQb4wciOf/0OPg
         5w0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693757031; x=1694361831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+99Q/6ks6Ei70Yb1SR1mjrEnbssTqwC7yhvxvOn/qfE=;
        b=XNY/EXSSXBHEe4M80PbzAI8x9/Kl4s3c3Ez8KoXZUQ0vecYE7CWShgwUBsBs2y9m5D
         xjR+mqeouGKwi8tXlluajIQLzItH4cqyZVtMFqnSpP4VnQdQLPUAcUuqiIwm/dd2Dspf
         bbIrFYAiFtD+BeLNC66CE7Nff0IrX0Z9N4yLQIGBIVaTekhLMMZN/HxRpRvBN1eU4ncX
         NiMeFOyWQgSl4eBdYXscWZtQVS6PrNv944zCt/UoPAdEdIREeXvoZwBHBerzvbgDY/U3
         RfdnTnQQzSv212GUk/hBpdmeAAOkOjTVV2UWjFo7Qd/dM0mgOa2MVq01+rXgwuYKocyC
         hzUg==
X-Gm-Message-State: AOJu0YzvZt+fwi+pPUTzm1eYcBqAQqdZyzjgL8VRrB5eqgMZW68wVJwC
	sjaBlkeIJ4t5p3Y302F7XcEBfCd58CIYRQ==
X-Google-Smtp-Source: AGHT+IF80XMPOXiiosyEa3TxcbuP7NTBZx7+tPXU6frg8ohIzyoYoQPjly8LDsxgqx2nUOtp6pcnpQ==
X-Received: by 2002:a05:6870:392a:b0:1b3:caa2:eedb with SMTP id b42-20020a056870392a00b001b3caa2eedbmr9519365oap.44.1693757031485;
        Sun, 03 Sep 2023 09:03:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id o20-20020a17090ac09400b002682523653asm6008809pjs.49.2023.09.03.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 09:03:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] network-manager-applet: Fix build with musl/lld linker
Date: Sun,  3 Sep 2023 09:03:48 -0700
Message-ID: <20230903160349.2052956-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 03 Sep 2023 16:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104701

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-script-Do-not-export-_IO_stdin_used.patch | 30 +++++++++++++++++++
 .../network-manager-applet_1.32.0.bb          |  6 ++--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch

diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch
new file mode 100644
index 0000000000..eafd497ae2
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet/0001-linker-script-Do-not-export-_IO_stdin_used.patch
@@ -0,0 +1,30 @@
+From e09ba80e342b3b24bb2a46e11dae1c30cc61c75c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 3 Sep 2023 08:48:42 -0700
+Subject: [PATCH] linker-script: Do not export _IO_stdin_used
+
+This is glibc specific toolhain issue, it should have been handled in
+toolchain instead of exposing to applications. This was done to fix
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=835550
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ linker-script-binary.ver | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/linker-script-binary.ver b/linker-script-binary.ver
+index a2780c0..f030d35 100644
+--- a/linker-script-binary.ver
++++ b/linker-script-binary.ver
+@@ -1,6 +1,5 @@
+ {
+ global:
+-	_IO_stdin_used;
+ local:
+ 	*;
+ };
+-- 
+2.42.0
+
diff --git a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
index cc37291c8a..20fc0f3868 100644
--- a/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
+++ b/meta-gnome/recipes-connectivity/network-manager-applet/network-manager-applet_1.32.0.bb
@@ -5,9 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "gtk+3 libnma libnotify libsecret libgudev networkmanager iso-codes nss"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit features_check gnomebase gsettings gtk-icon-cache gettext
+inherit features_check gnomebase gsettings gtk-icon-cache gettext pkgconfig
 
-REQUIRED_DISTRO_FEATURES = "x11 opengl"
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+SRC_URI:append:libc-musl = " file://0001-linker-script-Do-not-export-_IO_stdin_used.patch"
 
 SRC_URI[archive.sha256sum] = "a2b5affa1505ad43902959fdbe09e5bcec57b11ed333fa60458ffb9c62efba38"
 
-- 
2.42.0


