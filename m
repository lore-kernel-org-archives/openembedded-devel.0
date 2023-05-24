Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CC1C8300C
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 07:53:13 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web10.3700.1684914787208088580
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 00:53:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=ovtyNl09;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-510d6e1f1abso1530092a12.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 00:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684914785; x=1687506785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=THW7BWLPqUyYMdMIzdVEaXSkBHfx9EjrCjzn++XHQV8=;
        b=ovtyNl0914TCLvfBioEmGp/dDsktA2zKCpe36Gknvlg2OVQOWBfDNin95yHpN6RYXG
         xQU+T0+ajAOJ3NfzP9MHuS/B7ab3kTsC4kpHq4ru1mi26AcrZZRBHnWHKF8G7ZLozOi/
         Kdddi+Y14L9WTabb6CzxFNXHH3l5Ty+npdlo3q86mhBm8QyF9JxKg5Wn8YVnSKNQx9tL
         clSg1EEr7bULQp2Qh70tvVmycSuSm//LBJ7N84m63tCmq9uglWrZnnZMOJoYuDRFgu+S
         SZsxXWb8nijQbBOaXhA9qtWpqTEcvPlW6bXJ2t9sCMUAN0kWSFewjZyfNpIXwoF9hHo9
         OaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684914785; x=1687506785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=THW7BWLPqUyYMdMIzdVEaXSkBHfx9EjrCjzn++XHQV8=;
        b=Oy8KtIGerqAuxEwDWHKSi30i0Yww3V758/55Z9zE5/lfrC7BTvSUA7/QUqy+wCuoKw
         CaOAR77A9JMuUZrUWdTZ2VMIYYkxFLznJySYHf3GQDdilHyN0UVLLlbhBt4EDfE2ZMwP
         ZwFNtCYBGNKRsNGAx+9N+bNUO3hFP6n8jNXE0DZJkNz+Ga4xaNTa+hWpZu7ROFonP1Cw
         TxZLZBgSD/QCpO8L6Na/ayphmuAUtETddzrxAeF+1xTSCtJCUimiHyi8SunaOeSJ3qZd
         vdAwGkKJUskA68I82sXfa6DAMISY7MzH4hZblBRPtNrYtl0xu0d4LWyAzXDKlyJDQjs1
         CMQw==
X-Gm-Message-State: AC+VfDwA4rSn9sY+NoRzF44BZMkq9364FegghkVMN6FSjCO4NMcTmiwg
	B9hpcDJjNqo1xDZau9G1Sduqm6ovAK4=
X-Google-Smtp-Source: ACHHUZ5xmoSTKOoCyuBdLfV117LTTmgECMrjIOH7EdmCqTcH/7Cgc5bdlW7XhX7WKcnHZr2i028v8g==
X-Received: by 2002:aa7:da53:0:b0:510:f6e9:6d92 with SMTP id w19-20020aa7da53000000b00510f6e96d92mr1225008eds.0.1684914785625;
        Wed, 24 May 2023 00:53:05 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7c689000000b005083bc605f9sm4823048edq.72.2023.05.24.00.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 00:53:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/20] geary: remove unused patch files
Date: Wed, 24 May 2023 09:52:40 +0200
Message-Id: <20230524075253.1033593-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
References: <20230524075253.1033593-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 May 2023 07:53:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102761

* they were removed from SRC_URI in:
  https://git.openembedded.org/meta-openembedded/commit/?id=3bb4ee4ba1161cff3b8c22dc07aa130ac2de9789

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...orkaround-missing-generic-type-argum.patch | 27 ------------
 ...y-issues-with-initializer-of-constan.patch | 42 -------------------
 2 files changed, 69 deletions(-)
 delete mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch
 delete mode 100644 meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch b/meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch
deleted file mode 100644
index 22af4f5bea..0000000000
--- a/meta-gnome/recipes-connectivity/geary/geary/0001-Util.Cache.Lru-Workaround-missing-generic-type-argum.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 166198735e9f4fbe91557df1351b3481bcf79e78 Mon Sep 17 00:00:00 2001
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Sun, 30 Jan 2022 19:54:11 +0100
-Subject: [PATCH 1/2] Util.Cache.Lru: Workaround missing generic type argument
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit/0f75e7a84a39492d0748cec2ba6028e08cae3644]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/client/util/util-cache.vala | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/client/util/util-cache.vala b/src/client/util/util-cache.vala
-index f054e32e..ecc275e8 100644
---- a/src/client/util/util-cache.vala
-+++ b/src/client/util/util-cache.vala
-@@ -12,7 +12,7 @@ public class Util.Cache.Lru<T> : Geary.BaseObject {
-     private class CacheEntry<T> {
- 
- 
--        public static int lru_compare(CacheEntry<T> a, CacheEntry<T> b) {
-+        public static int lru_compare(CacheEntry a, CacheEntry b) {
-             if (a.key == b.key) {
-                 return 0;
-             }
--- 
-2.35.1
-
diff --git a/meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch b/meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch
deleted file mode 100644
index 76315f3a0e..0000000000
--- a/meta-gnome/recipes-connectivity/geary/geary/0002-Fix-accessibility-issues-with-initializer-of-constan.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 64b56e75a54a9fa3f37c7686be97a5c8818413a4 Mon Sep 17 00:00:00 2001
-From: Rico Tzschichholz <ricotz@ubuntu.com>
-Date: Tue, 30 Nov 2021 15:31:31 +0100
-Subject: [PATCH 2/2] Fix accessibility issues with initializer of constants
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/geary/-/commit/9bd4c82952a0a2c3308c5cc86c0b85650c1fb484]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/client/application/application-client.vala | 14 +++++++-------
- 1 file changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/src/client/application/application-client.vala b/src/client/application/application-client.vala
-index 6ce19ce2..e6ba8533 100644
---- a/src/client/application/application-client.vala
-+++ b/src/client/application/application-client.vala
-@@ -8,16 +8,16 @@
- 
- // Defined by CMake build script.
- extern const string GETTEXT_PACKAGE;
--extern const string _APP_ID;
--extern const string _BUILD_ROOT_DIR;
--extern const string _GSETTINGS_DIR;
--extern const string _INSTALL_PREFIX;
--extern const string _NAME_SUFFIX;
-+public extern const string _APP_ID;
-+public extern const string _BUILD_ROOT_DIR;
-+public extern const string _GSETTINGS_DIR;
-+public extern const string _INSTALL_PREFIX;
-+public extern const string _NAME_SUFFIX;
- extern const string _PLUGINS_DIR;
- extern const string _PROFILE;
- extern const string _REVNO;
--extern const string _SOURCE_ROOT_DIR;
--extern const string _VERSION;
-+public extern const string _SOURCE_ROOT_DIR;
-+public extern const string _VERSION;
- extern const string _WEB_EXTENSIONS_DIR;
- 
- 
--- 
-2.35.1
-
-- 
2.40.1


