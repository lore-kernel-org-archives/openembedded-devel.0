Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 870B1C433EF
	for <webhook@archiver.kernel.org>; Fri, 21 Jan 2022 21:39:16 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web12.535.1642801155456937844
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HNhRpYOw;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id r14so1979177wrp.2
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Jan 2022 13:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8uxSMus+y5t9aeIQd65y9JSdq3tXd//CthdvXuoUuns=;
        b=HNhRpYOw6f6r7PMsEXYunurwfinGG0zTxViTyKU1ib0tdcvtscfAQJ33Ja6UXv85sK
         kRtyxGyUZUSjOWcCshaoT7SWXWENTnqVbtTowayP+i5uxc0jpQUF8TCpjyKRVC5h+aoH
         62qs0lgvGcfE1hVRKe0k30dZr2HNvuH8xIRu2d57fF3eIRVEr8O2hiWCtCrs5xGDJqGm
         qhhEVbw17ewXvmY6Ip08FLI1L4OCnzkRiT/27kl9hiCC/PKP/Fp5/gOc5xeHDFlhcWCB
         MGrEO3MRYBx7NRgG9oYjT1+Vo1yCyv9apfAzoPkatLqHqvp82pghPgeH210hSisW5If0
         fa9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8uxSMus+y5t9aeIQd65y9JSdq3tXd//CthdvXuoUuns=;
        b=F105qYyx8+qZDqaLdMMD/P395YHk+n6wXeen8pZPcIQ/5c10rfdBMjGyVhut7s9kia
         5cUb4N74jPUdfEkpDRsFhAaFObH2P2CHkJafoXSqzOwdcBSpxF8Bz8te4khJNeLUS+kc
         YU5aaVuT3nX9hnhOKUNzAsq0ed9dJbdf9z2KktwyGsBwatNbIdQl8pMe3t7esa7ox9Au
         NaEGq+ohAg/mwowHbqpizVPwm6tP9BeAHkMFSIUNlVZKhuDOBf2Bk+2CzMvOlo3ijfOD
         xCKYBAYy8BuGQDZoh26jf3NoOX/8io/orwDE8IvX+M9O3TjnrdTlI0r1q2g/bVcV9gbo
         GiEg==
X-Gm-Message-State: AOAM53025YpwvG3QvU6ZDCRynNDyT1mH5CZauEpsAv1wUhZ4S7j9lO+V
	+JB3eJNwAzmpvpYeLfbJeZakIfi0RzQ=
X-Google-Smtp-Source: 
 ABdhPJy0VgrNNk4pBWqpQxdWKJWsF1qZdZ1w1a7uOhhI0PKjEteCYs2OB6m9FskHY786OSlrMjXWew==
X-Received: by 2002:a5d:598b:: with SMTP id n11mr5257675wri.562.1642801154032;
        Fri, 21 Jan 2022 13:39:14 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 l24sm5870274wme.17.2022.01.21.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jan 2022 13:39:13 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/19] accountsservice: backport a meson 0.61 patch
Date: Fri, 21 Jan 2022 22:38:48 +0100
Message-Id: <20220121213858.762625-9-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220121213858.762625-1-alex@linutronix.de>
References: <20220121213858.762625-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Jan 2022 21:39:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94987

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Fix-build-with-meson-0.60.patch      | 29 +++++++++++++++++++
 .../0001-musl-Hack-to-fix-build.patch         |  8 +----
 .../0002-musl-add-missing-fgetspent_r.patch   |  6 ++--
 .../accountsservice/accountsservice_0.6.55.bb |  4 ++-
 4 files changed, 35 insertions(+), 12 deletions(-)
 create mode 100644 meta-gnome/recipes-support/accountsservice/accountsservice/0001-Fix-build-with-meson-0.60.patch

diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-Fix-build-with-meson-0.60.patch b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-Fix-build-with-meson-0.60.patch
new file mode 100644
index 000000000..98b483d53
--- /dev/null
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-Fix-build-with-meson-0.60.patch
@@ -0,0 +1,29 @@
+From bedec82615ca6858c3e9494650a5bbf33c710ebb Mon Sep 17 00:00:00 2001
+From: Luca Boccassi <bluca@debian.org>
+Date: Sun, 31 Oct 2021 12:29:14 +0000
+Subject: [PATCH] Fix build with meson 0.60
+
+Positional parameters to merge_file() were never allowed and always
+ignored, so just drop it.
+See: https://github.com/mesonbuild/meson/issues/9441
+
+Fixes #97
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ data/meson.build | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/data/meson.build b/data/meson.build
+index 4987937..ed0e2c4 100644
+--- a/data/meson.build
++++ b/data/meson.build
+@@ -29,7 +29,6 @@ configure_file(
+ policy = act_namespace.to_lower() + '.policy'
+ 
+ i18n.merge_file(
+-  policy,
+   input: policy + '.in',
+   output: policy,
+   po_dir: po_dir,
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
index c2310fe46..429192cd0 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
@@ -1,10 +1,7 @@
-From 2a1c7103839c20df5ca9ce2fa863535d802f8f3a Mon Sep 17 00:00:00 2001
+From ff0718174faf1167fb4765ebe4bd280bbe8d2ac6 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 8 Dec 2019 23:42:00 +0100
 Subject: [PATCH] musl: Hack to fix configure
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
 ---
  meson.build | 10 ++++++++--
@@ -31,6 +28,3 @@ index 4465a26..726c9fe 100644
  endif
  
  # compiler flags
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch b/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
index 14161804e..2b0924b2e 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0002-musl-add-missing-fgetspent_r.patch
@@ -1,4 +1,4 @@
-From 820249ea8e38c568e6a36fbd9c852718c7665b56 Mon Sep 17 00:00:00 2001
+From 7401e682400df87f3258f795bb1d143f64a35a9f Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Mon, 9 Dec 2019 00:12:08 +0100
 Subject: [PATCH] musl: add missing fgetspent_r
@@ -6,6 +6,7 @@ Subject: [PATCH] musl: add missing fgetspent_r
 Stolen from void-linux
 
 Upstream-Status: Inappropriate [musl-specific]
+
 ---
  src/daemon.c | 20 ++++++++++++++++++++
  1 file changed, 20 insertions(+)
@@ -41,6 +42,3 @@ index c52bda3..a7676fe 100644
  static struct passwd *
  entry_generator_fgetpwent (Daemon       *daemon,
                             GHashTable   *users,
--- 
-2.21.0
-
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
index a19102e8f..26cc04b8e 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice_0.6.55.bb
@@ -12,7 +12,9 @@ inherit meson gobject-introspection gtk-doc features_check systemd
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
-SRC_URI = "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
+SRC_URI = "https://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
+           file://0001-Fix-build-with-meson-0.60.patch \
+           "
 SRC_URI:append:libc-musl = " \
     file://0001-musl-Hack-to-fix-build.patch \
     file://0002-musl-add-missing-fgetspent_r.patch \
-- 
2.20.1


