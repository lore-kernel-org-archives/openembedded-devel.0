Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDA7C4332F
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 07:34:14 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.15970.1671435245255021735
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Dec 2022 23:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IV5NFRnE;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id e190so1155620pgc.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 18 Dec 2022 23:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wq0f5Lf8RPaAz0zdrr3dvvFeQrING1sVFk6pN1CWU+s=;
        b=IV5NFRnE6LSqCrJH2exwgE41cOJ0lULG9YYjiV9U78F+Cbs7atnLcANtsT/1gePOwn
         XXkeh/rYn12tL/dmiJlAlU13sqOp8T6xK4Jx6QdC4+On57fBNciyL0ehpOO3k5rG8N1s
         XPaFCN+ZaBfqQBnkcBsf4WbDMkZX3FaJJPGLW/JXwfpe59O7xJDnz9CFIyrdcfagDNEP
         ECYNIsLcHPSZMozWGyRs4E1yWEsCUYlB3A5kXa9rlZsbzTLHGZEbFUa0bJv4kMsfMZgN
         LEBYoZ+VEong8fn5TTvmP61oxQRB7nyt3XbK+OUaM6KrMBZcgXMx9rPZxSu5LXgB2rhr
         Corw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wq0f5Lf8RPaAz0zdrr3dvvFeQrING1sVFk6pN1CWU+s=;
        b=WBUO+Yjfw8mk53vABM7xv8qSe3M57bfo8e9Lhv/vzdEdnr8JB6Eslc3nsIMkzR8p4t
         aBa5UL21S2nAD/TOwHdXbte6F+YwLO0FPwmHeJJzwc8EgRcs+LVA9qmmOmBJ4kMPSUFO
         plFae7Ft+FvZHLDWmHu2lxV/agl/19v6+euE6Yv9SxPHVVzRLGj0VhpnXMVarfO8jfmn
         kYpZC9n5npVeERKCMhyW25mb9wTbS2nahVPlR3retiTKnhWuYhnU/++fvCCfSk9XPNHv
         XeM2mGUNjxJmC54Rw2ttNBB+INUflsZoRK8PBEl5h7S7c3auIvDtHrdP73hjzwcnuDbL
         6apA==
X-Gm-Message-State: AFqh2kr6JspAvZHXuDIyDrITO2T5cZgzCd0iErmyk7pEiyHilOHcTXFe
	uX1FL99jPBdB4kn16Juw6yzGnp4p8/8=
X-Google-Smtp-Source: AMrXdXsaO0KOUa11INUmm9K1sfG6Z2iNkJIJChmzzHarbWJPcMT48dvkNAvmfohEjJhxudMQQx70pA==
X-Received: by 2002:aa7:83c1:0:b0:57f:cf88:edf5 with SMTP id j1-20020aa783c1000000b0057fcf88edf5mr3071380pfn.24.1671435244202;
        Sun, 18 Dec 2022 23:34:04 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::41f2])
        by smtp.gmail.com with ESMTPSA id b17-20020a621b11000000b00576a89978e5sm5830350pfb.63.2022.12.18.23.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Dec 2022 23:34:03 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] wxwidgets: Fix build with musl
Date: Sun, 18 Dec 2022 23:33:59 -0800
Message-Id: <20221219073400.1473072-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221219073400.1473072-1-raj.khem@gmail.com>
References: <20221219073400.1473072-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 07:34:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100091

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


