Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1015EC4332F
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 01:37:44 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.149942.1672105061962344212
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 17:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Dt7ucmE0;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id n4so11971711plp.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 17:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wq0f5Lf8RPaAz0zdrr3dvvFeQrING1sVFk6pN1CWU+s=;
        b=Dt7ucmE0XTf/GcnbJZozHCLaaqHnsCK9jH4eAmmgngPaiJE/fdKWemzCURAR32gsvD
         Ec4emGVAFZwSRzxVgqB9Om774ygHRivmu3zQV27vZtfGqKV7BGFkj8CmboT9lK97nov9
         YYF2L7rjlFFz1mdgOP9NuTcT6t/g9QGTV1ATdTI7gyXz8Z23WsS/nlEj5Opi60avs7AK
         2B6kVpC5Oo8XdWTaXlVTUTc1yIJnhVmh27no+GVVTPs33hlAoFf4fhxMwFIDV5pApGuR
         /tFHAgm114c8Y4eUouofGVPQVdBa5ORPpKMyQ7Z+uDXIJaA3Zi5Yo0d6Lwp7fdi/agnu
         9DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wq0f5Lf8RPaAz0zdrr3dvvFeQrING1sVFk6pN1CWU+s=;
        b=DXhU6utldQ1CVONVojqekI8tEWlQZvNR0ZwxUxcPvDsJvf6Up5+L2Ee12musMpDADg
         btd2xX+CFLV99MmzxNQGeZ6WU2wLuPrOh9h/vn9LsZRG9v5S9sCeIl7VxL3tbjNzkkiY
         QbfG7HCQgnLTJazHLpsENRS1BzrmeKOYaiXlVMIhn6GUwdgmSw99D5hZP+b3jFALDh+K
         qJieyNvpFVJUjp+ZTVf9kPSGozOU9Hhssc5fmiiXaV8EukzZM6+ezUevgJSb1c4u4HSZ
         HMPEoiwqrq7D/u04Vfboxo+f6QGCSEfiEgsk4qm+NbWhgpPqVugKqlS9UQPs1mSPlaTR
         eO0Q==
X-Gm-Message-State: AFqh2koVhGhr/PtoYk7t8LSp9a6dY/unKJ9w4p0ymIgTeOeryMJIJEBB
	+7Yb7HJ8zdb8yONXTSCcS4/JJjHxoU8=
X-Google-Smtp-Source: AMrXdXsW9uLNVXdWptDNbqeukaoG8JFbD4art2zxYaGY98lfxjIsz+C8wX3J3zkLv67wiGfaNRZzXA==
X-Received: by 2002:a17:902:ff0f:b0:192:4887:f7b9 with SMTP id f15-20020a170902ff0f00b001924887f7b9mr24064661plj.17.1672105061008;
        Mon, 26 Dec 2022 17:37:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id a13-20020a1709027e4d00b00183c6784704sm7596442pln.291.2022.12.26.17.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 17:37:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2 1/6] wxwidgets: Fix build with musl
Date: Mon, 26 Dec 2022 17:37:33 -0800
Message-Id: <20221227013738.3840802-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 01:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100249

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...using-glibc-specific-defines-on-musl.patch | 26 +++++++++++++++++++
 .../wxwidgets/wxwidgets_3.2.1.bb              | 16 ++++++------
 2 files changed, 34 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch
new file mode 100644
index 0000000000..52f4449339
--- /dev/null
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch
@@ -0,0 +1,26 @@
+From 72c3b7324f00047e6dc5d8380ed2f6ff2494a6f9 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Dec 2022 14:51:34 -0800
+Subject: [PATCH] locale: Avoid using glibc specific defines on musl
+
+musl does not provide some glibc-only enum members e.g. _NL_ADDRESS_LANG_NAME
+
+Upstream-Status: Submitted [https://github.com/wxWidgets/wxWidgets/pull/23050]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/unix/uilocale.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/unix/uilocale.cpp b/src/unix/uilocale.cpp
+index 57773e17f5..86816ba896 100644
+--- a/src/unix/uilocale.cpp
++++ b/src/unix/uilocale.cpp
+@@ -619,7 +619,7 @@ wxString
+ wxUILocaleImplUnix::GetLocalizedName(wxLocaleName name, wxLocaleForm form) const
+ {
+     wxString str;
+-#if defined(HAVE_LANGINFO_H) && defined(__LINUX__)
++#if defined(HAVE_LANGINFO_H) && defined(__LINUX__) && defined(__GLIBC__)
+     switch (name)
+     {
+         case wxLOCALE_NAME_LOCALE:
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
index 7f0d27123f..03a75d8bd3 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
@@ -18,14 +18,14 @@ DEPENDS += " \
     tiff \
 "
 
-SRC_URI = " \
-    gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https \
-    file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
-    file://fix-libdir-for-multilib.patch \
-    file://create-links-with-relative-path.patch \
-    file://not-append-system-name-to-lib-name.patch \
-    file://wx-config-fix-libdir-for-multilib.patch \
-"
+SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https \
+           file://0001-wx-config.in-Disable-cross-magic-it-does-not-work-fo.patch \
+           file://fix-libdir-for-multilib.patch \
+           file://create-links-with-relative-path.patch \
+           file://not-append-system-name-to-lib-name.patch \
+           file://wx-config-fix-libdir-for-multilib.patch \
+           file://0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch \
+           "
 SRCREV= "97e99707c5d2271a70cb686720b48dbf34ced496"
 S = "${WORKDIR}/git"
 
-- 
2.39.0


