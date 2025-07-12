Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CEEBC83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 17:26:57 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.41007.1752341211482989162
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Jul 2025 10:26:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OOotH3NY;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2349f096605so39347265ad.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 10:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752341211; x=1752946011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvaRZx8CqpMielV3n49Bs9+6GWgvW7wEUj23L01KPHI=;
        b=OOotH3NYxclXd/MzEIP2XPo7uMA+PchtiDAyutfee2bEukWYKSWFcwSEfS4ksMHpc5
         wCZrzndM06A1aC7ZxWQOqFGsx1Doza1EM7RyD9Hsz0HB7Ft0JK5PSzxR1Pqx74dZAZMG
         bSVjzeLIUb8hYodIi7o+EhUsrLG5NaJczy8iW0tJIPSNOn60ICNfnylHRlU6vaLwUzC7
         X2SulEfr2bbb3GOaSyZF5daW5n07nOf15WSOhBk0Dcdrfw1onjOFsO70cclpKsjrqJU7
         yRzDZjRe/0wjs5dXh7haKtZX4Mtm00gcciN6qZxcgXuDvksU3fFkUwc4EVHeQYnOcqaD
         Yk2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752341211; x=1752946011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvaRZx8CqpMielV3n49Bs9+6GWgvW7wEUj23L01KPHI=;
        b=Nb7jc/YvBudSjAL6y2AzHfdwAjqBY058tMMxZ+DPMDFJ6lp46RBWWq9wd4Yx0PqUym
         jL5rRKuneo61SW+5xtm5KcQqIuQYwgqzLEMCcKNQ6fRCXPw6ahh0jV17xhnhbEujV8Gy
         MMC9nQ416gz0i2UKLIpNiilOLdOKUWp3k6totyEVUHY4M3sAzMJiioRe/dsh+qO3QjDa
         B+/LpmNfqGqMhXtPJJXLTiItZFBB14DMMvs7UVUgp+IBUnaFGn1cBtlT9FaEdBAoaGZs
         xMr1lBh7wBZj6MeF56D5DSNgvtKRNCotZts7VbpRt7VwQHHS+p3PdhAtA1LzPAXL7xZG
         q7qg==
X-Gm-Message-State: AOJu0YzKggUD3fBxOWpJ5u1SYSaIWSwV15jQ/17/TulY1c8W435cFsPH
	iRl7BZLzePYFjgJNizMOXKs9LmZ5nU/JGeCkOujFXkOwVAFV6RdLUGygq0yQjpTd
X-Gm-Gg: ASbGncs4lo7OCEEkKhJiwvUc8D8pDMNZJbyptFsfcZIzO8Qi9+/YVDohipWZm3xSxiV
	TyJovuGAXMXZ/43IYe2UchXelNyH+gTx1nMr76bDmONMiEKl5KkUx4obgRQKuVB+qNEvIXtA7wt
	9omdwXiJIktEzy33coy2HNAXMIBYU/BKhJfPp4b8Noie3rMXU8RBgPfFFbAHJgWLkDJnLOYTaT3
	iLzN+4HCB+QgQqSNqOFO1g/TMAG21PnF5Qy/lD8bhTAUFwQ5EIOkgZyZxW95zTmSMdCg/Jl8J7k
	riSJMrxp+OqgUZ0Ob471pzJ3lHqiPlrZaeBmOzm3PaRFIJNltdbIIUt95ALJybFy7HkEhJ4uUyp
	bvslu+H6hOYui/g==
X-Google-Smtp-Source: AGHT+IFoKiU+RJh5/vkXGlSlwSbsRJh+TYoPwLufYGfKnkePWp9Jse5MQm6/yIDp21ptjtDeaHXdnA==
X-Received: by 2002:a17:902:d2d0:b0:235:eb71:a398 with SMTP id d9443c01a7336-23dee285f7emr130180015ad.53.1752341210434;
        Sat, 12 Jul 2025 10:26:50 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de435c2e3sm67021875ad.226.2025.07.12.10.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 10:26:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH v2 2/6] xfce4-clipman-plugin: Upgrade to 1.7.0
Date: Sat, 12 Jul 2025 10:26:42 -0700
Message-ID: <20250712172646.3899204-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712172646.3899204-1-raj.khem@gmail.com>
References: <20250712172646.3899204-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 17:26:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118480

Add dependency on wayland and glib-2.0 native versions, needed for
configuring the plugins

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../clipman/xfce4-clipman-plugin_1.6.7.bb     | 16 --------------
 .../clipman/xfce4-clipman-plugin_1.7.0.bb     | 21 +++++++++++++++++++
 2 files changed, 21 insertions(+), 16 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb
 create mode 100644 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb
deleted file mode 100644
index a54abe184f..0000000000
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.6.7.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-SUMMARY = "Clipman is a clipboard manager for Xfce"
-HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-clipman-plugin/start"
-SECTION = "x11/application"
-LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-inherit xfce-panel-plugin
-
-DEPENDS += "xfconf xorgproto libxtst"
-
-SRC_URI[sha256sum] = "9bae27808a50e959e0912b7202ea5d651ed7401a6fc227f811d9bdaf2e44178c"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
-
-FILES:${PN} += "${datadir}/metainfo"
diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
new file mode 100644
index 0000000000..c2e2f32d5c
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.7.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "Clipman is a clipboard manager for Xfce"
+HOMEPAGE = "https://docs.xfce.org/panel-plugins/xfce4-clipman-plugin/start"
+SECTION = "x11/application"
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+inherit xfce-panel-plugin
+
+DEPENDS += "xfconf xorgproto libxtst glib-2.0-native"
+
+XFCE_COMPRESS_TYPE = "xz"
+SRC_URI[sha256sum] = "903302c3070a951d44ee17a84fa3cf21d36c6787678af8fbfc79e469fd00cb46"
+
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
+PACKAGECONFIG[qrencode] = "--enable-libqrencode,--disable-libqrencode,qrencode"
+PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native wayland"
+
+EXTRA_OECONF += "WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner \
+				 GLIB_COMPILE_RESOURCES=${STAGING_BINDIR_NATIVE}/glib-compile-resources"
+
+FILES:${PN} += "${datadir}/metainfo"

