Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72059CD4F4B
	for <webhook@archiver.kernel.org>; Wed,  4 Sep 2024 22:54:11 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.63852.1725490440893449903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Sep 2024 15:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lfiv2dhl;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so456905e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 15:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725490439; x=1726095239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OFzH1y10wkMyEzGdQUHg212LHYwAQimcvXXwQkpd5SY=;
        b=lfiv2dhlFVSkJ/rOg8vDI3feBU8zOcZM0V4HXb1o2bq5yU1qktOUjEfEpamm3LyDka
         O4w9+gWB8NFT9lbB9TeCMmfSV5LCcTP8mh1vTcsDWrnKIGbg4olIZ/X/lO67Tg336g1q
         N7FCMHTgV2mMzm7y5aDnZLWPDc+DQ60b61M+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490439; x=1726095239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFzH1y10wkMyEzGdQUHg212LHYwAQimcvXXwQkpd5SY=;
        b=SBTOeeh8U1brEEzHRKEoUnSuLwDk3x48KX+/mIBb3+fB8Yx41G5JLBpeV16YYYeYIQ
         7hS3PIynZ0Ub55BrAcZkHRlVOXWmXUklUwn+CY6eP44N39famYOuZMVjg7+F5SeENKuW
         COpR33AWaYLIqWSWhMdj2nBzHY7IDT+CrZFDRQ7QvwQ3snGQencrsi9P1uLWL+U+Di3W
         p3xIdMwRXrRBuWCemmubDrbRN6oKDjN+T9q1xPPZSBrnUJtNgaLpOyE0V2rnYth8Cr9Q
         /zzMsvo5PSKHAjZo6TSiGRT9rya6xh6pTb8Hlqdv2HZP++skvRrWgtZcnCPrxACiVx5Q
         dg/A==
X-Gm-Message-State: AOJu0YyFg5SwIpje+EKoZ/qL/OhJXM0bViYjCyPC8xdIE+fK85f0BdaS
	4mR2FgwfecZHlzJNRsF6R2Hjec3Hnuts8QPLnrS8N2y0IxgwCilgkUC/+1zjEy74yzrSVxTSDF1
	0CTZL1g==
X-Google-Smtp-Source: AGHT+IGqVfGFnp2joQVzJWa/M2+OXacvSATGT3id3s0oBQrfczTc9oQ325Zb020Ngaf8enJcv19NNg==
X-Received: by 2002:a05:600c:5487:b0:428:15b0:c8dd with SMTP id 5b1f17b1804b1-42c9a36ce87mr3865335e9.20.1725490438391;
        Wed, 04 Sep 2024 15:53:58 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr (53.1.159.89.rev.sfr.net. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c046685fsm12833761f8f.79.2024.09.04.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 15:53:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH 1/2] polkit: Switch PAM files to common-*
Date: Thu,  5 Sep 2024 00:53:40 +0200
Message-Id: <20240904225341.2699885-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Sep 2024 22:54:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112093

From: Yoann Congal <yoann.congal@smile.fr>

Add a new OS option to polkit meson: "openembedded" and use this to
set PAM include to common-* which matches OE-Core libpam.

This also may fix a non-reproducibility since polkit meson system tried
to detect the host (compiling) OS and changed PAM config from the
detected value.

Fixes: https://github.com/openembedded/meta-openembedded/issues/860

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...pport-openembedded-OS-for-PAM-config.patch | 48 +++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_125.bb |  8 +++-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch

diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
new file mode 100644
index 0000000000..e0ee8a309a
--- /dev/null
+++ b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
@@ -0,0 +1,48 @@
+From 7c89b88f0f81ad220d08d69d212c14c6eeefb647 Mon Sep 17 00:00:00 2001
+From: Yoann Congal <yoann.congal@smile.fr>
+Date: Tue, 3 Sep 2024 12:17:42 +0200
+Subject: [PATCH] meson.build: Support "openembedded" OS for PAM config
+
+In Openembedded, same as Suse/Solaris: PAM files are common-*:
+* PAM_FILE_INCLUDE_AUTH: common-auth
+* PAM_FILE_INCLUDE_ACCOUNT: common-account
+* PAM_FILE_INCLUDE_PASSWORD: common-password
+* PAM_FILE_INCLUDE_SESSION: common-session
+See OE-Core libpam recipe.
+
+NB: This is also the same config as Debian but its not mentioned in the
+code.
+
+Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
+Upstream-Status: Inappropriate [oe specific]
+---
+ meson.build       | 2 +-
+ meson_options.txt | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 302c189..a55f2d6 100644
+--- a/meson.build
++++ b/meson.build
+@@ -311,7 +311,7 @@ endif
+ 
+ pam_include = get_option('pam_include')
+ if pam_include == ''
+-  if ['suse', 'solaris'].contains(os_type)
++  if ['suse', 'solaris', 'openembedded'].contains(os_type)
+     pam_conf = {
+       'PAM_FILE_INCLUDE_AUTH': 'common-auth',
+       'PAM_FILE_INCLUDE_ACCOUNT': 'common-account',
+diff --git a/meson_options.txt b/meson_options.txt
+index c2e4a6c..14d7a50 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -6,7 +6,7 @@ option('polkitd_user', type: 'string', value: 'polkitd', description: 'User for
+ option('polkitd_uid', type: 'string', value: '-', description: 'Fixed UID for user running polkitd (polkitd)')
+ 
+ option('authfw', type: 'combo', choices: ['pam', 'shadow', 'bsdauth'], value: 'pam', description: 'Authentication framework (pam/shadow)')
+-option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', 'pardus', 'solaris', 'netbsd', 'lfs', ''], value: '', description: 'distribution or OS')
++option('os_type', type: 'combo', choices: ['redhat', 'suse', 'gentoo', 'pardus', 'solaris', 'netbsd', 'lfs', 'openembedded', ''], value: '', description: 'distribution or OS')
+ 
+ option('pam_include', type: 'string', value: '', description: 'pam file to include')
+ option('pam_module_dir', type: 'string', value: '', description: 'directory to install PAM security module')
diff --git a/meta-oe/recipes-extended/polkit/polkit_125.bb b/meta-oe/recipes-extended/polkit/polkit_125.bb
index fe1ee467c3..2405ed6034 100644
--- a/meta-oe/recipes-extended/polkit/polkit_125.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_125.bb
@@ -5,7 +5,9 @@ LICENSE = "LGPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb"
 BUGTRACKER = "https://github.com/polkit-org/polkit/issues"
 
-SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/polkit-org/polkit.git;protocol=https;branch=main \
+           file://meson-build-Support-openembedded-OS-for-PAM-config.patch \
+           "
 
 S = "${WORKDIR}/git"
 SRCREV = "112752c12da812a163dac67d7f675b60de8f7d7b"
@@ -16,6 +18,10 @@ inherit meson pkgconfig useradd systemd gettext gobject-introspection features_c
 
 REQUIRED_DISTRO_FEATURES = "polkit"
 
+# Prevent meson.build to try to autodetect host OS (which could lead to
+# non-reproducibility)
+EXTRA_OEMESON = "-Dos_type=openembedded"
+
 PACKAGECONFIG = " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
 	${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', 'consolekit', d)} \

