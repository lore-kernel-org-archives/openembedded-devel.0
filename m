Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE132CD5BC4
	for <webhook@archiver.kernel.org>; Thu,  5 Sep 2024 12:52:37 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.8501.1725540751557417481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Sep 2024 05:52:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=MU56l5hK;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-428e0d18666so5838945e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 05:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1725540750; x=1726145550; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BKRZwdXx62hHSJMiU7/p7qJUQJId9Kl/qBO4hs+ynCs=;
        b=MU56l5hKraFCb6VOJaDqClWP04oVlZN3UupwC4bBJPu0jHVgICN3dX1lgnKpxcQE+y
         p2mhXSjUTpclZMD1DUM5HaZZPp56KN5i0xZjHz+qGmEIjj+tDzuXM8NSI/IMTuquMgmC
         4uFRN0HTqvNSLhg2Dxpe/kQH7VDB5JlO3qsMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725540750; x=1726145550;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BKRZwdXx62hHSJMiU7/p7qJUQJId9Kl/qBO4hs+ynCs=;
        b=HVljxitamah607B7hIcaTvRAW4pWhMAxHBsGdeAhC4WzzlQe3ytuEpbCG3PVOnR7Rc
         JRI2mcHGo+8twjx37zVLX3EoNTPbR1p0zc8jLy23hhq9jah1ULhbxWc72Lp9Tq2fpxZ0
         WnaVGtt37uV4U5KTkW+FIZfQl+9JdveX3SBCdNclcKuSl8dl3k5kDL9b4V03JJeCVYAR
         7KwscojGBNYVSOaqOOEmvXMcWcT1UTbpEkJmOexHNhpy8T4mxFItbEI3Jil0ArfJQdgJ
         xfZGW5cmzfVlHg4iuY+RlUlN6/uteRUAgi97TU2+ZI4b5hTMKtB4fYt56jctWUGq3Dwk
         V6Hg==
X-Gm-Message-State: AOJu0YyRuyuWwVlYtUPxGOlSQsHNJ9DzPBSxaSCHP8HbPtFrLMvbD5M2
	XUXozcjnjpvremFI3QT5/jAw999Ptwx0BW2sX6d/vWQEuJqFqngPPHNV+Zd++GyWNOYjbfk+wts
	1ofa6Tg==
X-Google-Smtp-Source: AGHT+IFZfvyYdDwZgknA/F3/GPtc7ArVm6mVS+J5is/SssTJdgm6sT+dNrUVUM35n3pz+//RN9qcfA==
X-Received: by 2002:a05:600c:1c9e:b0:426:61af:e1d6 with SMTP id 5b1f17b1804b1-42bbb44023emr145647395e9.29.1725540749021;
        Thu, 05 Sep 2024 05:52:29 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6df100csm231692265e9.20.2024.09.05.05.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 05:52:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH v3 1/2] polkit: Switch PAM files to common-*
Date: Thu,  5 Sep 2024 14:52:20 +0200
Message-Id: <20240905125221.2758495-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Sep 2024 12:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112105

From: Yoann Congal <yoann.congal@smile.fr>

Add a new OS option to polkit meson: "openembedded" and use this to
set PAM include to common-* which matches OE-Core libpam.

This also may fix a non-reproducibility since polkit meson system tried
to detect the host (compiling) OS and changed PAM config from the
detected value.

Fixes: https://github.com/openembedded/meta-openembedded/issues/860

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
v1->v2: removed patch and switch to the preexisting "Suse" OS config.
v2->v3: readded patch and updated Upstream-Status to Submitted
---
 ...pport-openembedded-OS-for-PAM-config.patch | 48 +++++++++++++++++++
 meta-oe/recipes-extended/polkit/polkit_125.bb |  8 +++-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch

diff --git a/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch b/meta-oe/recipes-extended/polkit/files/meson-build-Support-openembedded-OS-for-PAM-config.patch
new file mode 100644
index 0000000000..cc396dfa3b
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
+Upstream-Status: Submitted [https://github.com/polkit-org/polkit/pull/497]
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

