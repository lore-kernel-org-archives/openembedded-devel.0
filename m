Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA8FD75E59
	for <webhook@archiver.kernel.org>; Sat, 23 Nov 2024 16:59:54 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.51107.1732381189151221836
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Nov 2024 08:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XBj78JlO;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7f8095a200eso3221414a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 08:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732381188; x=1732985988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GUq1h9s6oGHEQD5ZXxCMoN0NtGSlh2u8iA0RrDmhJlY=;
        b=XBj78JlOCjiN0Z+O5MIYsL7kOJ1kmlhSkbGtfOcX/+9qUW7VvElZIdvKyViWmc1u/D
         IRIP0uGJslwpLk+cocczT/Z96oIvM+6UQn8W4hCYj2XZqZgCGk36aCvcIEUpMIynmS4B
         MDkPluwIIU9FmtGb7JHNRUzsxY4nH5vYdgJzIYGyObd3Be/EXas/Pif/mwQ4pT8DYgP8
         HhKrwNZ8eG/GO6FXuFS93Ubv1VaZxtyf9IUaoMobtXzT4ZaLIMQghJkVLS+3TdVCctTu
         dcOPc6rNiAIazbVyrAtKw8uONjjkKWNpaUZZcdJ2iglG8YUbNO8bFoU7OTvG8nyc+WYs
         qW4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732381188; x=1732985988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUq1h9s6oGHEQD5ZXxCMoN0NtGSlh2u8iA0RrDmhJlY=;
        b=K6vtKoC5sCdzWo2cX1Y7c8xpGmXcFbsukdooULd4GbcQAseGG3/ZH3dVpedFdx+ysq
         1pvEmITmz1UMWWB3tOfe/dtsitIgGW+kznkdkk+g/AmgaVV+k/eS2J3tk6iKDQ4au3mo
         3teHf9swEq4yKck4z/eJRd4gYwKOZJbeoZ5x0U0Pr1meXayqa+D1j8rswDWOKR1RDO4p
         qzt2m6PpCVy983eS5mVYcyHdXUHDEiMPz5BDhd6BSCoM5deJFN2MqBJ8HAYFttuZtUhM
         DDF7F6ioVJwHdCM2/FRVtkkZ5N7ws+YaxM3s2bu+I8jcJEohmBy/ZzrsXxDFNbb2Cy1j
         s8/Q==
X-Gm-Message-State: AOJu0YzszKjeOGk1p9IGJpKrUYo8Z00bJhOUR81YMeXoX6QEfZGe13S3
	1K3CgirVwrfQe60rBs5PbY/UFB5yBjZQsoMVoCJS0e80slz1szWAdbR9gA==
X-Gm-Gg: ASbGncsDed/7I8UTB92QQP49LmsJPvKLek97ZWSV2GAkNs5jLFlT0tu1X0WNfdjBgJP
	obtfFyLkd0L0PpG83en7LXE5/+Jl8ez16e+r2lN3DJRILtCnrZ+bYeyo0kWb1/KJWw9QBLZAdXF
	NaAYRY4OBiSiL/ddHfPS7G5YIddXF1FY3SDfztsZR0SUYDdfe6r9ERX7pB9/8zfi/kCBqX1qCoW
	GvfcjXQdBeaw6gKafpNRlcRpKIvXw9/CNcFrz192fhat4JfSII=
X-Google-Smtp-Source: AGHT+IGO3i7EAXv54UQiiqJ0+/sExPGOg7oHTl4v7gECLL5rBnVdUSKsDSHkS9PDyp41a6NjbrtBWA==
X-Received: by 2002:a05:6a20:a109:b0:1db:d6e4:d1d9 with SMTP id adf61e73a8af0-1e09d5af343mr11956875637.1.1732381186629;
        Sat, 23 Nov 2024 08:59:46 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::1dd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbcc2280acsm3103871a12.48.2024.11.23.08.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Nov 2024 08:59:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] dovecot: Upgrade to 2.3.21.1
Date: Sat, 23 Nov 2024 08:59:43 -0800
Message-ID: <20241123165943.3163820-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Nov 2024 16:59:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114016

Fix build with icu-76.x while here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...5b54a408d12fce0c94ab0bbaedbb5ef69830.patch | 24 +++++++++++++++++++
 ...{dovecot_2.3.21.bb => dovecot_2.3.21.1.bb} |  3 ++-
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
 rename meta-networking/recipes-support/dovecot/{dovecot_2.3.21.bb => dovecot_2.3.21.1.bb} (95%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch b/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
new file mode 100644
index 0000000000..0765d963c1
--- /dev/null
+++ b/meta-networking/recipes-support/dovecot/dovecot/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch
@@ -0,0 +1,24 @@
+From 1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830 Mon Sep 17 00:00:00 2001
+From: fundawang <fundawang@yeah.net>
+Date: Sun, 27 Oct 2024 22:11:21 +0800
+Subject: [PATCH] configure: Explicitly check for icu-uc
+
+Ensure we link against libicu-uc when it's split in v76.
+
+Upstream-Status: Backport [https://github.com/dovecot/core/commit/1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ m4/want_icu.m4 | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/m4/want_icu.m4
++++ b/m4/want_icu.m4
+@@ -1,7 +1,7 @@
+ AC_DEFUN([DOVECOT_WANT_ICU], [
+   if test "$want_icu" != "no"; then
+     if test "$PKG_CONFIG" != "" && $PKG_CONFIG --exists icu-i18n 2>/dev/null; then
+-      PKG_CHECK_MODULES(LIBICU, icu-i18n)
++      PKG_CHECK_MODULES(LIBICU, [icu-i18n icu-uc])
+       have_icu=yes
+       AC_DEFINE(HAVE_LIBICU,, [Define if you want ICU normalization support for FTS])
+     elif test "$want_icu" = "yes"; then
diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
similarity index 95%
rename from meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
index 4e76d24526..3177cdb1d7 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.3.21.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.21.1.bb
@@ -11,8 +11,9 @@ SRC_URI = "http://dovecot.org/releases/2.3/dovecot-${PV}.tar.gz \
            file://dovecot.socket \
            file://0001-not-check-pandoc.patch \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
+           file://1ccd5b54a408d12fce0c94ab0bbaedbb5ef69830.patch \
            "
-SRC_URI[sha256sum] = "05b11093a71c237c2ef309ad587510721cc93bbee6828251549fc1586c36502d"
+SRC_URI[sha256sum] = "2d90a178c4297611088bf7daae5492a3bc3d5ab6328c3a032eb425d2c249097e"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"

