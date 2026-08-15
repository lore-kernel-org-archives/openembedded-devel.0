Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE30C5DF6E
	for <webhook@archiver.kernel.org>; Sat, 15 Aug 2026 02:51:01 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2490.1786762258622266094
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 19:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SmQqYNjU;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ceb096e675so20356065ad.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 19:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786762258; x=1787367058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A7KP8xUmT7AvTPhFMZ8zBLARsY0tCuStoHzvDJkwE5o=;
        b=SmQqYNjUMsbLagfeEsgp//tGvS9UnxV9WcP5pdI1Xofbhjsvt5ukqznZlKO8Z/JzHl
         p+2TtdmCc7paFoKb9cGdpRjP0ZxaIYIGQqwinz7JR4Z1B6mKNVi9lZyyOfJ7jcujnXQ6
         Vy7cAiclDQTX7WPMXr8c+niftUg//kMlmJgA5mMLp7tscTT0WBl5Zp/ye9A6xpna7puj
         MVYUPbFGTEyjwT+TscRvITYdd1rf1sROGfDtNBI+YMKJeZLHozT1w6VrNHhYFGi8SOO8
         GzwvEyBzC5zROoaCnlS27D/U/izmL2mRREr4OpCu92N18t+YL1Jb/FHXzbaO0MsETBjD
         ICCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786762258; x=1787367058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A7KP8xUmT7AvTPhFMZ8zBLARsY0tCuStoHzvDJkwE5o=;
        b=AJqQYpXj9jwKIm8e8+E37TJSKBgjYcsfCfh4p93fmXA5ol/5bZoB1CgGmzidrimYnB
         3OOOWKdthinFS3grFB1sSwOpcW/y4/0VQpLZwarIAnFuHPNDKJ+ddbGWf5dHATNXmaGp
         LpcbVF7g3gc35VZ4WYl3cT64XxGXUZMhCj2cdHiwoPkUWZ9cMwg5o7+gbLKtchaBYJ/J
         5AGNasntSD8DPtUmekM4B8uvO2uJxri6KxbPwZe5cpbOtEu6IWfeAiZ+9RCCKfMDROa3
         jqmPzLC8cifENB5fWn/VDOYC4ColEio6LRbNzLMYbPCgWlkjDBz3CESBfvnVYeTfnlUu
         oaKg==
X-Gm-Message-State: AOJu0YxTQH8HAxKQx244uAXcvs1QlAi2rWtDLOn/hro0Tg+vrus2NVaw
	QAVpBusYMa8IJhPPLFxK3Wx38Pn0vNGrQDIU6+sz51L+70YHChZxp4Lai1wvS6nZ
X-Gm-Gg: AR+sD10L+ygLeE7sbGgI4roLGqGUualjz1l+bg6y4zbS4HaQwZKHrlGENkJHwIdZFbf
	Ax4w7N8cmKFS2PQpOsGWHtK6L7nFV5AH9R1kl8LXJrFaXTcAWglIfHN4pY2S2n8VaRFiVxpizYB
	kgBkgp8iyCCNfCKKRBCKzdXvuIPlWtazrqp0F01czKqY3t+hR0jurTB9ywmdQS/e6shEPXs6oPl
	Tr2DDf7J6HCHaD8aqdGOj+IgvriJ5820U2ew9uLdkY690aHIePngC68a+OMy2+2xssy3SIVcKFm
	33tb6Lb0E+PHPXKLpELZVglNUYKduZhVymOe2de2iC+rjiqiRBerfUncaEFtiNRQIjwOyBiGdHV
	Ka7n81HIvD0ohMx4qK/K1fQWIExY+yuOaakkdXl9t+xt3qrutEVlx+hfJuyXv19RxLCXjTK4KNY
	l48229Oha8Gr8PoKi+7upy1+4P9jgyZyC9uIgtXFjNgqCMGzCMQulPd20DuT3FgJ8ISZsGAdviH
	+ztUdPFF3NDWIKBmMM+9oAwNSHGeLrrig1NURQWS8Oa7jllfmvfnl3uOc1NGmfzB8s9jky/FphI
	Lq8/Hhp9yEyUL+72bTwIcU5k4OxmAyVGNf1eUbt3/8ffCYIMEAYDPsfz0WD+/SH2iUtcle5RJ7t
	dMMkEtMbCR6P9nF8HzzCk3RCUby6NvGYWcIEZoa/l58nuEg==
X-Received: by 2002:a05:6a20:938c:b0:3bf:7081:9356 with SMTP id adf61e73a8af0-3cc71d5627amr11007906637.17.1786762257988;
        Fri, 14 Aug 2026 19:50:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-323050db573sm5153181eec.9.2026.08.14.19.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 19:50:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 108/109] glade: fix buildpaths QA warning in gladeui-enum-types
Date: Fri, 14 Aug 2026 19:50:42 -0700
Message-ID: <20260815025044.437694-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
References: <20260815025044.437694-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Aug 2026 02:51:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129173

glib-mkenums records the "enumerations from" comment using the
input file's full path (@filename@), embedding the build host's
TMPDIR/HOME path into the installed gladeui-enum-types.c/.h and
tripping the buildpaths QA check:

  WARNING: glade-3.40.0-r0 do_package_qa: QA Issue: File
  /usr/src/debug/glade/3.40.0/gladeui/gladeui-enum-types.c in
  package glade-src contains reference to TMPDIR [buildpaths]

Switch both mkenums templates to @basename@ (supported since glib
2.22), the same fix already used for the analogous gcab-enums
issue. Verified with a clean rebuild: do_package_qa now reports no
buildpaths warnings for glade.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pes-templates-use-basename-instead-o.patch | 54 +++++++++++++++++++
 .../recipes-devtools/glade/glade_3.40.0.bb    |  1 +
 2 files changed, 55 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/glade/glade/0001-gladeui-enum-types-templates-use-basename-instead-o.patch

diff --git a/meta-oe/recipes-devtools/glade/glade/0001-gladeui-enum-types-templates-use-basename-instead-o.patch b/meta-oe/recipes-devtools/glade/glade/0001-gladeui-enum-types-templates-use-basename-instead-o.patch
new file mode 100644
index 0000000000..1c070150f9
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade/0001-gladeui-enum-types-templates-use-basename-instead-o.patch
@@ -0,0 +1,54 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Fri, 7 Aug 2026 00:00:00 +0000
+Subject: [PATCH] gladeui-enum-types templates: use @basename@ instead of
+ @filename@
+
+glib-mkenums records the "enumerations from" comment using the input
+file's full path (@filename@), which embeds the build host's absolute
+source path (including TMPDIR and, since the build is run from a
+checkout under $HOME, the host's HOME directory) into the installed
+gladeui-enum-types.c/.h, tripping the buildpaths QA check:
+
+  WARNING: glade-3.40.0-r0 do_package_qa: QA Issue: File
+  /usr/src/debug/glade/3.40.0/gladeui/gladeui-enum-types.c in package
+  glade-src contains reference to TMPDIR [buildpaths]
+
+glib-mkenums has supported @basename@ (base name of the current input
+file) since glib 2.22, which avoids embedding the build path. This is
+the same fix already applied upstream/downstream for the analogous
+gcab-enums.c.etemplate issue.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ gladeui/gladeui-enum-types.c.template | 2 +-
+ gladeui/gladeui-enum-types.h.template | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/gladeui/gladeui-enum-types.c.template b/gladeui/gladeui-enum-types.c.template
+index 1111111..2222222 100644
+--- a/gladeui/gladeui-enum-types.c.template
++++ b/gladeui/gladeui-enum-types.c.template
+@@ -5,7 +5,7 @@
+ /*** END file-header ***/
+
+ /*** BEGIN file-production ***/
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+
+ /*** BEGIN value-header ***/
+diff --git a/gladeui/gladeui-enum-types.h.template b/gladeui/gladeui-enum-types.h.template
+index 3333333..4444444 100644
+--- a/gladeui/gladeui-enum-types.h.template
++++ b/gladeui/gladeui-enum-types.h.template
+@@ -10,7 +10,7 @@ G_BEGIN_DECLS
+
+ /*** BEGIN file-production ***/
+
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+
+ /*** BEGIN value-header ***/
diff --git a/meta-oe/recipes-devtools/glade/glade_3.40.0.bb b/meta-oe/recipes-devtools/glade/glade_3.40.0.bb
index 140b6637a6..6285755738 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.40.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.40.0.bb
@@ -14,6 +14,7 @@ inherit features_check gettext pkgconfig gnomebase gobject-introspection mime-xd
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
+SRC_URI += "file://0001-gladeui-enum-types-templates-use-basename-instead-o.patch"
 SRC_URI[archive.sha256sum] = "31c9adaea849972ab9517b564e19ac19977ca97758b109edc3167008f53e3d9c"
 
 # Man pages are generated with xsltproc pulling the docbook stylesheets over

