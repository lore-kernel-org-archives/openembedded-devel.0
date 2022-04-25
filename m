Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6777DC4332F
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:15 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web08.34509.1650913850474049031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 12:10:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kl+hoXTN;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id a11so4465361pff.1
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Apr 2022 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9I9InhlYu+nhPw+89Q6xw1qhjvszYwmFtLX8V4x6qoA=;
        b=Kl+hoXTNzmYZJfakIEoKBIpGGZm4bo3Y+iEGgq0RNkvuQcy0MNCF8Ivl59PqiRztoU
         wFJ5hfQooRVgtuVh1YGXnA0vaV396PLnHMVS/srpL0SrvDH/Rf1tLfr/8C0ij6MDR96c
         5uIPXHNKX2nRlXyAbqbp6U6lgYgsUwam0mHn0Hos7T3yIQDfZklt6TKRfRTh72lPAIt0
         a9piGKIWm/an4jz3F35cj2c9RysIhZ3eNtTcDwV5xAwnj+3ht19tX+GdlW2NnPyrFQob
         xC42uGmuVbAQqNQ5Xhs1KWblZfp06VXGKj0whJIdGlrJbZ7FPw1MB8UBCuNwcjQ4rIbY
         3ILg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9I9InhlYu+nhPw+89Q6xw1qhjvszYwmFtLX8V4x6qoA=;
        b=PUvdrW2sVFz/31l+flkJvWk7phVFZnjyj5OXCvfqQ8Vnkv5i3qfVTEDFSkN+Q83e7s
         3XLUA8XZeQDuvY3/4ZtD8gf5hBx9phQtytXi+bxaP+2f1Sf6D2JWX2wVGtEiEiHn1u/c
         9J7xMWE+76sNauc//JeWMphdTZpymu/3xlj03tbcytIH4l1aqnaLQX+fNdyV8xHLvISd
         oeacTst86QEH7mZZUwokdBxhQHMavfoI5WoO1X3phUnNvie71w544Peu3GTeKH2DMaC8
         I/eNh0KO6WJVH7n+CJ1j62PWCxhtf9+kC23DhVtHaiLpgH5C5ok526IhR5Qjbe9uIsmD
         jHUg==
X-Gm-Message-State: AOAM532gGovbM+wkEOXl+SbN0Syq42F0/f/r/KFpKE+dFw3F3Ew9flJk
	Je/s5oS6IGDRjf0/xiPfwW0pdjzHf12LCg==
X-Google-Smtp-Source: 
 ABdhPJxBCL3SZF0srM+9P31yV8Q7HAMnHb8Ct66akmtJ3upvgF7VPbALVC0SEuJ3OKZonwCna4ltDQ==
X-Received: by 2002:a05:6a00:1d97:b0:50d:555e:81bf with SMTP id
 z23-20020a056a001d9700b0050d555e81bfmr98267pfw.30.1650913849747;
        Mon, 25 Apr 2022 12:10:49 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2ca3])
        by smtp.gmail.com with ESMTPSA id
 m13-20020a62a20d000000b004fe0ce6d7a1sm12602565pff.193.2022.04.25.12.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 12:10:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] fluentbit: Disable systemd support when systemd
 distro feature is disabled
Date: Mon, 25 Apr 2022 12:10:45 -0700
Message-Id: <20220425191045.2455121-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220425191045.2455121-1-raj.khem@gmail.com>
References: <20220425191045.2455121-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96784

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch | 2 +-
 .../fluentbit/cross-build-init-system-detection.patch         | 4 ++--
 meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb         | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
index b90a62ef19..bf4cda08f0 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Control-sytemd-unit-install-location-with-SYSTEM_DIR.patch
@@ -24,5 +24,5 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +        install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
 +    endif()
      install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
-   elseif(IS_DIRECTORY /usr/share/upstart OR FLB_UPSTART)
+   elseif(FLB_UPSTART)
      set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
index a185789992..d3822fc8da 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/cross-build-init-system-detection.patch
@@ -12,7 +12,7 @@ Signed-off-by: Khem Raj <raj.kheem@gmail.com>
  
    # Detect init system, install upstart, systemd or init.d script
 -  if(IS_DIRECTORY /lib/systemd/system)
-+  if(IS_DIRECTORY /lib/systemd/system OR FLB_SYSTEMD)
++  if(FLB_SYSTEMD)
      set(FLB_SYSTEMD_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.service")
      configure_file(
        "${PROJECT_SOURCE_DIR}/init/systemd.in"
@@ -21,7 +21,7 @@ Signed-off-by: Khem Raj <raj.kheem@gmail.com>
      install(FILES ${FLB_SYSTEMD_SCRIPT} DESTINATION /lib/systemd/system)
      install(DIRECTORY DESTINATION ${FLB_INSTALL_CONFDIR})
 -  elseif(IS_DIRECTORY /usr/share/upstart)
-+  elseif(IS_DIRECTORY /usr/share/upstart OR FLB_UPSTART)
++  elseif(FLB_UPSTART)
      set(FLB_UPSTART_SCRIPT "${PROJECT_SOURCE_DIR}/init/${FLB_OUT_NAME}.conf")
      configure_file(
        "${PROJECT_SOURCE_DIR}/init/upstart.in"
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
index e586262a60..b231cc2878 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.3.5.bb
@@ -48,7 +48,8 @@ EXTRA_OECMAKE += "-DFLB_LUAJIT=Off -DFLB_FILTER_LUA=Off "
 # Disable Library and examples
 EXTRA_OECMAKE += "-DFLB_SHARED_LIB=Off -DFLB_EXAMPLES=Off "
 
-EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On -DSYSTEMD_DIR=${systemd_system_unitdir}','',d)}"
+# Enable systemd iff systemd is in DISTRO_FEATURES
+EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEMD=On -DSYSTEMD_DIR=${systemd_system_unitdir}','-DFLB_SYSTEMD=Off',d)}"
 
 EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
 EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
-- 
2.36.0


