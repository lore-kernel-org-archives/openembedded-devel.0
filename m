Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3FD1C8303C
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 01:19:32 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.12298.1751505569011938343
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Jul 2025 18:19:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ve5UgbEq;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-748d982e97cso5037563b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Jul 2025 18:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751505568; x=1752110368; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8tuCBxP1uTfs38XoyvqlF4vaHHEVMTDpU1b2tz/No0=;
        b=Ve5UgbEqlM1QjrHq17W2tVSVr8QazPkcEnbarMTTxlOOfr2Hg/5WNt/wlN9NlIyChC
         uka1Oj0OXGm0lagbnO82i/g3FJKE6518p4uAjlLeALk7tIG1K+1/CIFPAhTm0BvGgRgG
         uHr/wSLkzod6l6E5Gdb7g/rCjj+bxYw8yslpHXMQn85Wl6JdE43RIhXRH3XMw2Y+U6wl
         BA1TRz8PgdO8qaMMNdiPAvIX8EAmfZ7hQWvuRNQbGOxNpow1PGUNIM5dXShB5YsNFas+
         DBviZAFJqZNIRu1pQlQuC0c8zR+3OJZ/SgCv6i6bF+iM5IVrH+RbeMJEwpTAIHaHMfkg
         3dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751505568; x=1752110368;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q8tuCBxP1uTfs38XoyvqlF4vaHHEVMTDpU1b2tz/No0=;
        b=I84SfHCJgEVwKYgqa2SV88uousLwHJXn9nXZ9pNQvNVbk+/N/ynH7YEraUsEbnmket
         pao2SpIkfjzlO1NNciG1yrEnE8Cn9Oyf69DZkKwQFelCRfUahrjRXVbf4QB92deYAM8I
         p3P8i1aLengUDR20M95T0HJBj5ptXZvzbZ9lFs8fuIYGbiKPUwRKb/IF04yPavrYD1rW
         1jGizsuH8KklOnzw9z8tbBaVXl0vMkVItyrk5h9IsIOvg8dC5RBjVsikDmi6+lC90UoL
         tZro2i+4t/hSIzjyDLYGo5iExSjKT1VUgiGedTxjkvxMDSdUVWXGIfnPFpZ7uuxEtwFX
         SzaQ==
X-Gm-Message-State: AOJu0Yx8JDxITKj8a26EZxFlW/CV338bcuVLpZKRF3gZ2FYNepDFnYR6
	oVAiF3Ek9GkFvg/m8nvAxVh873UxLPcVQaiXJ96H9j+0Zg+K5Y1qJME3NCoblLTr
X-Gm-Gg: ASbGncvu/CV9orh8haNqoPTyUmpTYss6of0sHwLfzVjgCrICqPt+rJhy4QKcNbN+9a0
	DTet+zaHC8jtu+VD0zBP7VKmsDZVqUM+NkGvQvXV5LfNKc+XKbCL4n8Ri0FuA9eHyPkF5OtGoTZ
	bIuLIMUA75vT8Z+OG7sPo8sIyfe5S3iKlF7+wz/9Oq5JRwcRq9EzVdqcMgU5FzCCE3op4O7a9sb
	teraOpEUnmhzEhS2QKTRwcMpYB3a/Gh7GhsSN8+c6EA0m1sdl5dOIq2F7jEKOxRDeA5Tt2dI8P7
	+f+y9Cv1k77FkdtWRvmPc3beBtk9laKwWr5a3btwOaAJMMulU4Y8zw==
X-Google-Smtp-Source: AGHT+IGTEf7HVtxj3PSMs/2aqPHeBRH7y388j/biLLOK87fH0FL8FdSotJepwUdAU4x5IpjYlu8aeA==
X-Received: by 2002:a05:6a20:d80f:b0:220:83e1:49a1 with SMTP id adf61e73a8af0-2240bec1ec4mr2593560637.19.1751505568031;
        Wed, 02 Jul 2025 18:19:28 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301f704sm13891476a12.18.2025.07.02.18.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 18:19:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-screenshooter: Fix build for wayland systems
Date: Wed,  2 Jul 2025 18:19:25 -0700
Message-ID: <20250703011925.1469842-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 01:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118204

Ensure that wayland-scanner is added to dependencies
Create protocols directory as well where the .c files generated
during build are emitted into.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb     | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
index 8778ff3451..f843b9459e 100644
--- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
+++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.10.6.bb
@@ -9,9 +9,13 @@ inherit xfce-app perlnative
 
 SRC_URI[sha256sum] = "992066cfecfb44a68681340bfd55d524d40410aac3da6ef25c6c6cb2150a5965"
 
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)}"
+PACKAGECONFIG[wayland] = "--enable-wayland, --disable-wayland, wayland-native wayland"
+
+EXTRA_OECONF += "WAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner"
+
 do_compile:prepend() {
-    mkdir -p lib
-    mkdir -p src panel-plugin
+    mkdir -p lib src panel-plugin protocols
 }
 
 FILES:${PN} += " \

