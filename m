Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A8AC79F99
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 02:08:07 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.527.1788833285133491868
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 19:08:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=OxFAU+BY;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d5cad1a6baso34887155ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 19:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788833284; x=1789438084; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yatTqu0+MQ+AtgEaD/1KqeXbQ4JD5abuVNgj6AoY5ms=;
        b=OxFAU+BYNwj3xTijpzYuwPFSLAdxZBHVK1T3d7TusZQ6DUXJVxRdeyFEgK/Exc2OXL
         yuxU5fYDK2LO/GOgrGe1wUwdYJ2Nj9iND6jkd/1MRU8m0HJmp8+hqwFi5WTxen71SzCY
         58C9mcb7NOC+RzLSC9gRLuM8Un8a8L841fy5fkP7IbYMvrRgzCWEjrakLAQZEv3Sqt+i
         hvX9hsiU6USDikx8hR79dAhj+5r4lrQbIzJtuaAnlMqm/aJYdVcqXtegrkDcLk/ZFZYe
         FZjW0bsRdE307xEiOC1TACXVkY7+oGdIOqrePhVQDpIDp6i42RMFsh+k63gXe6kPBlWO
         wXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833284; x=1789438084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yatTqu0+MQ+AtgEaD/1KqeXbQ4JD5abuVNgj6AoY5ms=;
        b=Qyl7EV7LkFDPn6/vzmSCKIGWef2QMKZpZsvv3m+DicAuibWDM9LDyG+UEYZg2SiU4x
         hoPpG228AJ813AMpMsM8dfLx0385VqYLTTXHPPC6IQdWy7dqJjPmBSIPrkjhaaVoPxdH
         O2mjYvbNu3Q21xhKGnerPvJf/73dNmz5w6jKjkMDLPUc+ildGUohT+/DWUpVDj5wXU0Y
         +Wyodd8rHVP1dbeLML3Y+1AfCOzcnF2aO0GsU1s56RrA0TNUYo0vWnu4sAZrFK3hDICN
         hil8sHXNS22X6WfcFj7BKFFNGEtCjBbEqyT5I420f8Slwd6BH6Y3FG2oWJuQOSOdlENV
         byMw==
X-Gm-Message-State: AFuF++l76ClmMEtxhM2WsyX9penhuUuxxKGK+kvdF1odLr1NrKthwbhO
	Dmxr8KF4C7k8WkAn1esbXMaKZLxbBP4QJCgj0+8Oqh9YoGZ6tpZYm3ceDFOAEw==
X-Gm-Gg: AYBFou2e/O14EYPRwF7Es6vgSSIwAogsHUl+weqGdQvRKE7IHFITr3G1aulf46WCQLH
	eElAztXllbkiAZUJLpa4ewgShWh/H39oV/FKb1VAJTYXZ4QQzNz8iTPtJRXo1jf0dJkA1spLHnj
	+qzj61YG7+59VsGStGR+9LoFO1I72warqk/nPbUlSSLs7yIgD4wD1HqKcAai33hyAX1y23kjxrf
	pEZQmjO2m3F450s3ca0uHjShbAMt2G4A9oZc9kCeRNeSVsIBpOPpMhGDXSdiG0bzwiB6TG5VF7F
	OA4iBBIaP/ndewirdZGBITI4lJRsJv3b3gERtRXsSS4LkEnE1bug/qRLTsCXZYD5OLJAJTPcUcP
	43ZEZoU3XvLsKvhuyt3Ow2EsvccD9zTut9X7T6X0MwbmyP20qQwaTOR/uvueZOwcSDYiY9snkHO
	tVLqS4X2olNdQzZcSJLksuc4Qcet4rIdE/obIz4wXillOfxundgBlUrGVu9jm99G99iidkD0sK2
	We9kmoD7G5AcegQg9uruVtaXTvLqLHpOxdfPCcZIYb0cF0WdvCTsM8Bqi/YYvEvInVtteucby5e
	aMvKNhPusign3khZY4V9SzgO5jsf33yUt0cQdsS8ECZDtBTtIkjrj6PrPg6cyj/FS9iYhG1YnW/
	+iuxjGFIReie9ciDMBnYw0eUa8raEeV5RmJ8fn8Bh+Z1o8oM=
X-Received: by 2002:a17:902:d987:b0:2db:257c:9fd5 with SMTP id d9443c01a7336-2db257ca020mr333661245ad.16.1788833284323;
        Mon, 07 Sep 2026 19:08:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm14044803eec.20.2026.09.07.19.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:08:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 6/6] libosinfo: Do not error on clang's -Wunused-but-set-global
Date: Mon,  7 Sep 2026 19:07:52 -0700
Message-ID: <20260908020752.2748681-6-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
References: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129854

clang 23 added -Wunused-but-set-global to the -Wunused warning group, so
the -Werror that meson.build adds for git builds turns it into a hard
error:

  osinfo/osinfo_avatar_format.c:24:1: error: variable
    'osinfo_avatar_format_parent_class' set but not used
    [-Werror,-Wunused-but-set-global]

Add -Wno-error=unused-but-set-global to libosinfo_check_cflags so the
warning stays visible but is not fatal. The flag is placed in the list
that meson.build filters through compiler.has_argument(), so it is
dropped on compilers that do not know the warning group

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ror-on-clang-s-unused-but-set-global.patch | 45 +++++++++++++++++++
 .../libosinfo/libosinfo_1.12.0.bb             |  1 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-oe/recipes-support/libosinfo/libosinfo/0002-meson-don-t-error-on-clang-s-unused-but-set-global.patch

diff --git a/meta-oe/recipes-support/libosinfo/libosinfo/0002-meson-don-t-error-on-clang-s-unused-but-set-global.patch b/meta-oe/recipes-support/libosinfo/libosinfo/0002-meson-don-t-error-on-clang-s-unused-but-set-global.patch
new file mode 100644
index 0000000000..042aaac21a
--- /dev/null
+++ b/meta-oe/recipes-support/libosinfo/libosinfo/0002-meson-don-t-error-on-clang-s-unused-but-set-global.patch
@@ -0,0 +1,45 @@
+From ab54bb415451f0b85207867ae2d68c5dcf1a191c Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 7 Sep 2026 18:39:42 -0700
+Subject: [PATCH] meson: don't error on clang's -Wunused-but-set-global
+
+clang 23 added -Wunused-but-set-global to the -Wunused warning group, so
+the -Werror that meson.build adds for git builds now turns it into a hard
+error:
+
+  osinfo/osinfo_avatar_format.c:24:1: error: variable
+    'osinfo_avatar_format_parent_class' set but not used
+    [-Werror,-Wunused-but-set-global]
+
+It fires on the <type>_parent_class variables that GLib's G_DEFINE_TYPE
+family of macros emit, which libosinfo cannot fix, and on the write-only
+'format' global in tools/osinfo-detect.c.
+
+Keep the warning visible but not fatal. gcc does not know this warning
+group and rejects the flag outright, so compiler.has_argument() drops it
+there.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ meson.build | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 377539d..7fd9de7 100644
+--- a/meson.build
++++ b/meson.build
+@@ -246,6 +246,12 @@ if compiler.get_id() == 'clang'
+     libosinfo_check_cflags += [
+         '-Wno-typedef-redefinition',
+         '-Wno-missing-field-initializers',
++        # clang 23 added -Wunused-but-set-global to the -Wunused group. It
++        # fires on the <type>_parent_class variables that GLib's G_DEFINE_TYPE
++        # family of macros emit, which libosinfo cannot fix, and on the
++        # deliberately write-only 'format' global in osinfo-detect.
++        # Keep the warning visible but not fatal.
++        '-Wno-error=unused-but-set-global',
+     ]
+ endif
+
diff --git a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
index 94286872b3..2a8059cf22 100644
--- a/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
+++ b/meta-oe/recipes-support/libosinfo/libosinfo_1.12.0.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
 	git://gitlab.com/libosinfo/libosinfo.git;branch=main;protocol=https \
 	file://0001-meson.build-allow-crosscompiling-gir.patch \
 	file://0adf38535637ec668e658d43f04f60f11f51574f.patch \
+	file://0002-meson-don-t-error-on-clang-s-unused-but-set-global.patch \
 "

 SRCREV = "b505ef5161d2552102a743acd4ad83298d3d8f99"

