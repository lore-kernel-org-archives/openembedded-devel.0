Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6985FC83F1A
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 01:38:32 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.28398.1752284310854159692
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 18:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ERQ3MAkc;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2311884b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 18:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752284310; x=1752889110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvaRZx8CqpMielV3n49Bs9+6GWgvW7wEUj23L01KPHI=;
        b=ERQ3MAkcvuKqaW6awCN76JQ0mjQnQxV2iDTtVOKxVjg9S42e/fmvBGl2DgcIhVSyzs
         hczai6DKRW8KP047p9PvuGh/Lk/zv67M+VKVpYZtLAS3HMbu5FrnII1QXsEl+SRaSxri
         jngq7ZcinwOqFzvMZYrxOLbQn7vhlyvKhSHYokyUiTk5nStW9iGiBzA1UAFMYm0g8k6c
         0ZiSNLmDmM9nGoApeGAKMosNUKMWdwHdqC1AI18gzLO+kaH3x8EtDqdwXACQWPeAyeT8
         3pvOgrYSmm+A55uufGGdb7mPYfh2BhZiGdySOu4DMO01EZao17bqRIZjUyRFJha+Fyk/
         Q0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752284310; x=1752889110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JvaRZx8CqpMielV3n49Bs9+6GWgvW7wEUj23L01KPHI=;
        b=fr/LE4+P4BfbC+Mll/wVQg2lJUa+vtYbQ/RZyJ/Upo3Y2gUh1tM1XEs+18KNwXTNYu
         5UPFJuAEd17gS4EyJjK/KWKi8Yf3pyRryNOR5jYHml0EHBtVIMl/TGDFCV3Fv4HCLhiw
         BrK2PRtU/mG1pkqrHArEGKASIuEkbCgy9zpBSbDno/i3Jx2v0czHDCtdsBqsUU3tlLPj
         zFrxWi9rZZ6VRCBwzq2T1DaaxENhW5WRHB6hzgaL02VQRvVU8ZTSdBXPcvTz0ExE5WD2
         A37PEdCLC003UjH/rm1SsXAWvix6N5VtYmZXF5AeIZqz2Jmocq19fEWe3stahNkL7WGp
         HhhA==
X-Gm-Message-State: AOJu0YyoY8GcXLYJb9fToYn4zQmHIB+dxE7aJSholxTyNHCYcr5Bmjzd
	vSogwB289urr09Id9rY3ww2YOZ4Z2J1/qFFiTaXt41U7rLlwiW33eCr0hXzhAgTs
X-Gm-Gg: ASbGncvMyJxlFVl4npkS1KI/WzI9Qhad4AZ8RN/QhKJY99jeI1mSLJeTArL7rnQom9p
	FraZXrkAOeznBm6YsibyqK9Dfr0kInmjalJxFnKw0fk1km1yzYzB9+o08cKksY/Ts6ltEqaWjPC
	7IVX+5WnizdBnNVHAC3Sz8UJEayJjojdaTEet3YU3QtVcQTvAf7YwPoECuRGkZ5KfpMyzXpZ23h
	GE7cPmZ4ZhTIQ/kQh9yqbxCHv1VsutXcfq0+d6XS4FTk6xjPA8Qrsgwj+uRGtxN0Nl5xoAj1P9/
	6CUIwGEuQnmGGv55KiNnlJziWVtFNZZY/w9OIkmFWSoMJA910izPo9TLfTgwY4JTf2BBXRH1pLT
	5P6y2hHrEeyznyg==
X-Google-Smtp-Source: AGHT+IGHQFjswPRJMaOu95ZDYtLyJlyzdqwXIQWZHAlaxHOy9c/q0+8s62/ETQYcYlCnT62AGaxEtg==
X-Received: by 2002:a05:6a00:189c:b0:742:a0cf:7753 with SMTP id d2e1a72fcca58-74ee03a1868mr7802495b3a.3.1752284309773;
        Fri, 11 Jul 2025 18:38:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1a851sm5972348b3a.82.2025.07.11.18.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 18:38:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 2/2] xfce4-clipman-plugin: Upgrade to 1.7.0
Date: Fri, 11 Jul 2025 18:38:26 -0700
Message-ID: <20250712013826.3708694-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250712013826.3708694-1-raj.khem@gmail.com>
References: <20250712013826.3708694-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 01:38:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118465

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

