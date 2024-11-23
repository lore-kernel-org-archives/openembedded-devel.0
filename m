Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0A3CE6688A
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 21:52:35 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.56539.1732398753578870028
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 13:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mfWZASSI;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ea68cd5780so2746637a91.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 13:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732398753; x=1733003553; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+3dkuFe+T6Khw/bIDgkY7B7/VM6h3pUIhEQ552xtuI=;
        b=mfWZASSIWOD4ibySFJgTSsV33kmRV3igpXjHFEuhgMbXW0tRyg9PDUcboT5IWIdND5
         gLGTNDJgxmKbi6N9LM2s05JZFQ7FpomDrj61+U3wkYHDGuJ4ZZNSfN7oeh0vg85ap3dA
         1WpJq/Zvt2qAmDD0KDYVeKeg2Em/jjDwHPZJ19D+0oKaH790Ns8UyAuj20+mQgNDQskI
         nRJuMVRBCoHvL9XCj8f76HbA/69pOzOH6UPptuoxdPwP/eRqBJlqop1OfwFpDrJKCNOT
         1d/8CPpDoIkLMfl/itYAyIPyCYhyWJJ8poC59+ieVpd25efbphJsbKo2GdMG9DSxkVdO
         j+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732398753; x=1733003553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u+3dkuFe+T6Khw/bIDgkY7B7/VM6h3pUIhEQ552xtuI=;
        b=jlbqB0NMnJl/2Ulp6HFKlqHzciVrd8hEjAAyQRuM18pyjlDeBNBrDRJu5+8nhJVd1B
         cAf2NMdfWmZM9ALOOaQLBF51Adu9Y3Q17miXtw/Wrixe0XW2o5uvVIKQFDMwe7ONsu3I
         Y/VKvmEjAHD9XyujzLdmOaHhx+hl5OYj0kumaJgEsfyUGCRWm/JO726JPEbOuYh2d706
         3vlEponPMyVBPAr7Inl3t4fUGNz1afuBX/vHUwj726R51wgHZ1F5+vIvSQLERa8ELPbh
         fNfMhrOzBJ3eOaVaWKb/E2MWQbWLQMbFKDv7hMNZaubB0sOxS5W3eg3LMXSK8eJDFSOh
         EwhA==
X-Gm-Message-State: AOJu0Yx9UGGi9wzR81lzfCKnSQ39PH7ewWKLKh4HnyqunzTovzVUfMJc
	jU3Ilf7gmBBecjBUTpEi46PS1rX2IcH1hRxhux0JEWk/j0XpL0qGOExxsg==
X-Gm-Gg: ASbGncsw7j6qi4guhdqq42yUYFixk5z6MeaUmMlWhBiCu1jJn3a18wzXPn72S7Tz1Fs
	RgEh419FR0UNHHRTNKdtRdK0ahKPkSf6N5HBrPfGTqqM34OSHzeGiVQcgorRAZS8q5UdeEgHu0Q
	LoiT1GuEHxwBjrTEBq3mtD8aRK0kPKkspy5IUaesuo8zyCXudItRKL1Fbmrq6BRpLH5DQVNoLrs
	u71CtmotEtQcuhoua6TJvUQ/UsPz+3TKh9Zt0b7bjKOBusuieY=
X-Google-Smtp-Source: AGHT+IEqTkEzkitZAllUfyKBQjsV/UNlV6ZU/IRyHEVa5yGgmwLWDmPW6wiHb4WARfk8D1mjinwtRw==
X-Received: by 2002:a17:90b:17c9:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-2eb0e234c02mr9413200a91.10.1732398752521;
        Sat, 23 Nov 2024 13:52:32 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eb0cfe48d2sm3810268a91.3.2024.11.23.13.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 13:52:32 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] mozjs: Fix build with icu 76+
Date: Sat, 23 Nov 2024 13:52:29 -0800
Message-ID: <20241123215230.1558824-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 21:52:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114024

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...with-icu-uc-to-fix-build-with-ICU-76.patch | 27 +++++++++++++++++++
 .../mozjs/mozjs-115_115.16.1.bb               |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
new file mode 100644
index 0000000000..8b1fee2cae
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
@@ -0,0 +1,27 @@
+From 3b75498f523ce6e41662ec79ff7180def6af8a99 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Nov 2024 13:28:33 -0800
+Subject: [PATCH] Link with icu-uc to fix build with ICU-76
+
+Fixes
+https://bugzilla.mozilla.org/show_bug.cgi?id=1927380
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ js/moz.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/moz.configure b/js/moz.configure
+index af11416ec2..2b305bc8dd 100644
+--- a/js/moz.configure
++++ b/js/moz.configure
+@@ -1104,7 +1104,7 @@ set_define(
+ # ======================================================
+ system_lib_option("--with-system-icu", help="Use system ICU")
+ 
+-system_icu = pkg_check_modules("MOZ_ICU", "icu-i18n >= 73.1", when="--with-system-icu")
++system_icu = pkg_check_modules("MOZ_ICU", "icu-i18n >= 73.1 icu-uc", when="--with-system-icu")
+ 
+ 
+ @depends("--with-system-icu")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb b/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
index d235b252ae..df75e29bd3 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.16.1.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fire
            file://armv5.patch \
            file://1849070.patch \ 
            file://1894423.patch \
+           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
            "
 SRC_URI[sha256sum] = "c3bb5a210738ca0f8cd26aa53fc4a07560db079c06cd0421cf35af4035029367"
 

