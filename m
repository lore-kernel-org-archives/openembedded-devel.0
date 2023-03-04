Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF955C678D5
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 07:16:13 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.4732.1677914167765433123
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Mar 2023 23:16:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ppLEhwZ2;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id p3-20020a17090ad30300b0023a1cd5065fso4423426pju.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 03 Mar 2023 23:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677914167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttEzgB12I0R0UJsRexlj3VWsCCCvseXdr7TbO13YVT4=;
        b=ppLEhwZ2iz4mRMQXv0ASRLDygRlCDz5hiOdXOPSmwH6pGadKUadxS77v2RnfCjOfP8
         jiK+LkSZgyoeTixfv3Gl0OArj8GAyFonjprIjlpT6pGmJ6L7FpUkpd1lxhb+Ec66bgzz
         IIQRMpB96/OASNyIeLiRjz8hHnzdudnh4LEVC4/NaK+y9/6ZgS3QWUBvhZ1QiBw5865D
         V4Oj5nk4E6krwka8GTfGvR+vMk/omTJA5m1aJmk+4dJBhGcfAnvXYlDIwKPZWaiyQIVY
         kbM86Ey9zXbW8Vl+mlfnOwXITVuFAYxZMADE5t3f5SYyG6s3xUpP1J08ahM07ugpaOl7
         8V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677914167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ttEzgB12I0R0UJsRexlj3VWsCCCvseXdr7TbO13YVT4=;
        b=Y+NU/cqo3eZpPl/+AdkPOLj8DR5+8f9dOPJ5dVWAGcI4u+Nn67fhlTgTeE4EZkh0YP
         zZwcFg4AHz4cQ7hteGuaesQeoEMlAaNqBvXSCsi7i+7gkhp4J15I9omPbQGIn7xStAeK
         OnOK51qSbsjXpW5fwxeVA0bjYBY56c+vmZYqXlrwWTd+bDGb5gBS9qU7QeWwELFejM2C
         oWSUaTLw3MQ6U8wHqj32lddZB1x1te7Gy6UX4MbAl5+aKXJK74XqYQ9e1diMHSbRT57z
         eU1zPBtH2bwkD/MUA7rO+DgbfRGR7Sz7txGaaIlOIhydjAhW+H3bWaAliouebgxgOKg8
         W0WQ==
X-Gm-Message-State: AO0yUKUDkBOUaVLQcDXI7e7LhGLQuxS5pRedDn/g3yqJeHgA0fKpgpIl
	VTvyMJyZVNFWRqHXewCwqhH8oVCyvuM=
X-Google-Smtp-Source: AK7set95LkAGN21HH0oX4oIIEXzikj6fhxkaZa6wtrr8GDXvgffiB3DA1ttXQc5BuhkTbYU5f313Og==
X-Received: by 2002:a05:6a20:3116:b0:c6:c85f:da5b with SMTP id 22-20020a056a20311600b000c6c85fda5bmr4313842pzf.55.1677914166664;
        Fri, 03 Mar 2023 23:16:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id 17-20020aa79151000000b005cc52ea452csm2672373pfi.100.2023.03.03.23.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 23:16:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 2/2] gnome-desktop: Make seccomp dependency optional for rv32
Date: Fri,  3 Mar 2023 23:16:03 -0800
Message-Id: <20230304071603.3898663-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230304071603.3898663-1-raj.khem@gmail.com>
References: <20230304071603.3898663-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 07:16:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101355

rv32 support in libseccomp is not yet upstream, therefore add rv32 to
seccomp unsupported architectures

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-riscv32-to-seccomp-unsupported-list.patch | 29 +++++++++++++++++++
 .../gnome-desktop/gnome-desktop_43.bb         |  5 +++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch
new file mode 100644
index 0000000000..65e06dafcb
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop/0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch
@@ -0,0 +1,29 @@
+From 6937685426aff8059b68b2941a0fe549eca21ce5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 3 Mar 2023 23:04:56 -0800
+Subject: [PATCH] meson: Add riscv32 to seccomp unsupported list
+
+rv32 needs to upstream the libseccomp support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 6a888b8..a87c419 100644
+--- a/meson.build
++++ b/meson.build
+@@ -65,7 +65,7 @@ udev_dep = dependency('libudev', required: get_option('udev'))
+ host_os = host_machine.system()
+ host_cpu = host_machine.cpu()
+ supported_os = ['linux']
+-unsupported_cpus = ['alpha', 'ia64', 'm68k', 'sh4', 'sparc', 'sparc64']
++unsupported_cpus = ['alpha', 'ia64', 'm68k', 'riscv32', 'sh4', 'sparc', 'sparc64']
+ if supported_os.contains(host_os) and not unsupported_cpus.contains(host_cpu)
+   seccomp_dep = dependency('libseccomp')
+ else
+-- 
+2.39.2
+
diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
index 7695056eaa..254551884f 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop_43.bb
@@ -16,7 +16,8 @@ REQUIRED_DISTRO_FEATURES += "gobject-introspection-data"
 
 GIR_MESON_OPTION = ""
 
-SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch"
+SRC_URI += "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
+            file://0001-meson-Add-riscv32-to-seccomp-unsupported-list.patch"
 SRC_URI[archive.sha256sum] = "3d6e153317486157596aa3802f87676414c570738f450a94a041fe8835420a69"
 
 DEPENDS += " \
@@ -34,6 +35,8 @@ DEPENDS += " \
     xrandr \
 "
 
+DEPENDS:remove:riscv32 = "libseccomp"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
 
-- 
2.39.2


