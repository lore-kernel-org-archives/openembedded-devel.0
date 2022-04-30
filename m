Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197F6C433FE
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:21 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.25729.1651346354821487680
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bMrUszyD;
 spf=pass (domain: gmail.com, ip: 209.85.216.54,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so9894488pjf.0
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6JAKtIAyRP9bUwAd61kMKoPxwUsWfGt1x3f9JOzLwCY=;
        b=bMrUszyDFcAatS1iZO/xCJb9CH1bvZjNjOvXTRcUNcVkgJROAftjuPlCNAN7HW95FB
         XEayjzvE/Uc7zKVxkfa2xGxn3s0HfnhQicClWG1RhPoKpYZKX5kImjgcC4REQpRv+ZKD
         FKdJ0edOfjHcZUO196nXAQK208uDPZthPwsEjE+GZINZUX8gk4PlBZ2/KqobzdVCQb8K
         g9X+52k5YYhRMktbcfSH0gRalb4tWkxqT3i9N0yw5COYz4HaaTsXrQ7IupOJ/wdiUrGR
         K/EJOd6rX92vy5Z0ttSrhfjSREUgdbpuB2uCZbIWc13G8rvcQCLqUJUpkKGAVu9FvlVj
         wgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6JAKtIAyRP9bUwAd61kMKoPxwUsWfGt1x3f9JOzLwCY=;
        b=6Jtzn402rrzTUGnQpzDX65PLTUTJloKrZLn8xoiPx1UrDAPFu36hpbtX2a4dVXdY8W
         tDiiR6/zDERX6Kb8Pc8f0M3LB0kds+fPQRFRy34iyltGSJJoZLBNaqIDx9XLPztJSCgT
         TcxuduyOn3QEYTIhBpz3FUbySff0ZIBit3Jap+yLdh6DqyJ8W3qj4AnJaKt6I+QW5zQf
         KL1eRSiEORkISvzJNJUFvquvKXmAubG2YELnWVC5dP37Wx4mXcEdCO7mKSAuvVnr2a4/
         N7wrViDH/yya8J9sKX01o4j8e/kC2O+LDlafukKkXvFpkFpeqCaTp1N2h44p/MD2KNWo
         ujWA==
X-Gm-Message-State: AOAM530KyC63GP3pK59wJUnDFOpQxyjjmKGpONFa2Xw/K1mO2VJJB2yq
	bUgX2hCJh048wrDc6Ermv3JftkYlUzQYgQ==
X-Google-Smtp-Source: 
 ABdhPJwDXIglejVBVObAOYyChBscWewlz8bSFhg/mOhQiVBvqJJFtgYdu7ORZoAxTLJBEoqGUHI9WQ==
X-Received: by 2002:a17:902:e054:b0:15c:ed0d:f13f with SMTP id
 x20-20020a170902e05400b0015ced0df13fmr4824967plx.76.1651346353881;
        Sat, 30 Apr 2022 12:19:13 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:12 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 30/39] fluentbit: Disable systemd support when systemd
 distro feature is disabled
Date: Sat, 30 Apr 2022 12:18:10 -0700
Message-Id: 
 <fbed7036c492f5ec4a29580cee8844386aaaeedc.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96897

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f9a935ac8e0129fa91279ec8bff9f8ced93734f2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


