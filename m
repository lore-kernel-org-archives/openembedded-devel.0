Return-Path: <andre.paiusco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62724C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 18:58:24 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.2330.1709751496083294925
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 10:58:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J5+SbUZo;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: andre.paiusco@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a4532f84144so10364766b.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 10:58:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709751494; x=1710356294; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lU1ZMZPhjIPJV7/Lqjh5Ezuo0+l4thl0tSnbSgLcrq8=;
        b=J5+SbUZowkaYGiTJpWW9Z3NblGVxcbRXzxE78LywXDf3Ih2BGJvoJzw1hR8DbSdWMM
         NfH/EYoP5BetSi6AUAGfHgKn+2KewYDoy7kxYwg0M0V3+vtydbLVnZ73Mg0z+aB9CW+a
         +2z/pLzX7qSq3WqHMChe1YxIrls3GMs73CHtdoNFoTeC4zOcdcToXRgMuPnyypv0eSk/
         iTCaVE+yr6vtaSicbaQsdhOrz66pX4asVrCRzGi/7BYcYCLZ5c7GwCW4tbw+rnUOURNA
         xqncF7qPGZsY5UWEaP/2IW7h5Lm3ExzONiQqjE9avxCMbGuCuF9iDMPfojPzoL13WSeT
         5V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709751494; x=1710356294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lU1ZMZPhjIPJV7/Lqjh5Ezuo0+l4thl0tSnbSgLcrq8=;
        b=EfB0qiyXnHu51SlBiYdrbLMSbums3KjTEVxUSbm9nGN07jU1U+1aSDO56Fs0ehFWER
         ufUKuFQhTuZzxY64MjFTXDsWLF+YskUwr+/fO8K2IjJJV6UpdLCG8aDehCc/V6jCJpEu
         kte/q25Nhk+KhkKKBlrIjjNhydagIwv9ZuFsBfpa+HbIZs7n+Q8eu1zbe8k26UetBhQT
         KT6G7Qv5kjN7/FqGoeYTO2G7FSCYLQ9xzFeVYX6Pq1oyQw6DVtcQAJj+hQpIZvFFPUpP
         Rq9aqEdQb9UVLObYxqASz8QjY7GchVOVs4gVXtvoWhRo5rDB1xfUnS1zK7bUrEeCMNh5
         PylQ==
X-Gm-Message-State: AOJu0YwRXPl6Q/UGIHeuID9sc+QDG5M98bfSVc+f+9avYwOC3lUw4Irn
	zorQeDcRZX4iJr0u7bjaWEQqmSxRnHaL9dQtLqLZIHR9TiJCSUm48BZxymBc
X-Google-Smtp-Source: AGHT+IEdz/LfgKyJTmw6pjVvvUCBYpizKgvPP5CS4NirKy4dNVKMUbvvEL6rbqgCfE/bUEbAqJvUsQ==
X-Received: by 2002:a17:906:dfc2:b0:a45:acad:b3e7 with SMTP id jt2-20020a170906dfc200b00a45acadb3e7mr3631607ejc.65.1709751493545;
        Wed, 06 Mar 2024 10:58:13 -0800 (PST)
Received: from localhost.localdomain (84-107-6-196.cable.dynamic.v4.ziggo.nl. [84.107.6.196])
        by smtp.gmail.com with ESMTPSA id h5-20020a1709062dc500b00a45beb1c671sm799947eji.13.2024.03.06.10.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 10:58:13 -0800 (PST)
From: Andre Paiusco <andre.paiusco@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andre Paiusco <andre.paiusco@gmail.com>
Subject: [meta-oe][PATCH] ydotool: Add new package
Date: Wed,  6 Mar 2024 19:57:24 +0100
Message-ID: <20240306185724.14629-2-andre.paiusco@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306185724.14629-1-andre.paiusco@gmail.com>
References: <20240306185724.14629-1-andre.paiusco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 18:58:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109179

Signed-off-by: Andre Paiusco <andre.paiusco@gmail.com>
---
 .../packagegroups/packagegroup-meta-oe.bb      |  1 +
 .../recipes-graphics/ydotool/ydotool_git.bb    | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/ydotool/ydotool_git.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 6e2012dae..dd033208b 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -611,6 +611,7 @@ RDEPENDS:packagegroup-meta-oe-graphics ="\
     xcursorgen \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 pam", "xscreensaver", "", d)} \
     yad \
+    ydotool \
     parallel-deqp-runner \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl", "opengl-es-cts", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "opengl vulkan", "vulkan-cts", "", d)} \
diff --git a/meta-oe/recipes-graphics/ydotool/ydotool_git.bb b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
new file mode 100644
index 000000000..83ab1fc37
--- /dev/null
+++ b/meta-oe/recipes-graphics/ydotool/ydotool_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Generic Linux command-line automation tool (no X!)"
+DESCRIPTION = "ydotool is not limited to Wayland. You can use it on anything as long as it accepts keyboard/mouse/whatever input."
+LICENSE = "AGPL-3.0-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=eb1e647870add0502f8f010b19de32af"
+
+DEPENDS = "systemd"
+PV = "1.0.4+git${SRCPV}"
+
+SRC_URI = "git://github.com/ReimuNotMoe/ydotool;protocol=https;branch=master"
+SRCREV = "c07ae72be46c40912023b91b8ba737630d8720e1"
+
+inherit cmake systemd pkgconfig
+
+EXTRA_OECMAKE = "\
+    -DBUILD_DOCS=OFF \
+"
+
+SYSTEMD_SERVICE:${PN} = "ydotoold.service
\ No newline at end of file
-- 
2.44.0


