Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5700.1794974916373234474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=0lZ7lLlY;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1b546061d58so389077c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974916; x=1795579716; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZD5roxyQn09MjT8yKMmJj1diWt+QIx+tzb37LL819Wo=;
        b=0lZ7lLlY7XMkpPI9Z+eXW1ZwdKPkjko/o7zqpcUPFt2gLUFWoJD8xy/mJgrNCA/7KA
         T/EENefNJtBJmqGwG8hDcZHQoGa56Y/al981l4Vrum9NDqryPiroFS7cb6hN3Z9FIPFc
         7WxAPJKr883OwQvwtqaib5m0ZFz2Qcb+AjMILuHWVv6XpNrbiifCYbEljO0f1NEtk4s9
         xlf9wrX5mVX8y5DJvSeIuumFn81VFE61v15wOm0b4Dhm+CzdzHml7tXxVQuDYyp1bX14
         +XI1j57CD2cvpno4s6C/+UnQHg35/c9HpVTmpGDeghl54nbKU2scXhd1w4jXFBHci/iQ
         hq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974916; x=1795579716;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZD5roxyQn09MjT8yKMmJj1diWt+QIx+tzb37LL819Wo=;
        b=2c6NxpZbnyoKtREY6WdCWDh9IiIdLPS14UPQ5toeUyeqAAYWci/DF3oN5Ee64dGJJE
         PeA380nFjjOXm0SxAlH9zTfZKJXwLo1bsBYGA6BHR16rmt4cNzYi0pWUApdzU/cSL9tC
         4wYz/7qQ1/xlAg8UiXOOThmLUGbA0l/A3q7FqNcIuYOjAl0Kk+IJcssUZnEi1SDBY6FR
         9uwRwvM7S9tc1VItDzAjj3U+lgPv70jPRDE131Nj+xRl/C1OS6MaPVkfxXpl5itbhojU
         AOP6A01K7sWUmAL1Se8imJ2U88rlOveequTAyl/cE+PAe365OdirN17Q3OJ626IlhhO0
         vxXA==
X-Gm-Message-State: APuU4Z/tI7E+RJZjFGFTR6hoCUmGTb0jG7gnG27JzGOu1UP00ShhYf6B
	R8OMciL/4smsloFAD+pPJcmhco4BactqxT1fh931ezrLtzGh7ZCQ8WpEHlx/57Rx
X-Gm-Gg: AYBFou0HsoUknud3qQeKs9KAw5xvdA2E2mmf924BgeuUJiCMJR2Oooi8pzvOc7d7Mve
	nhSz9q3ZK8NGsKTTp0TdfMbJYmSkSFoHfIJKxvubJ3zmREEqKmym/0XKoo936ORr9fJYYLc6oTT
	uCrwXnVa8H5i166t6H1XkhUm6Bsu0HXZFg17dMZKIZTqTCH/iTyjJ95gLhZfiCsAyuUg/1OXuoG
	8i3Cu7jAzoQfDp47FSDi5pTrAbnPqGqaBFzClR5ze64vgYD74YmVReKlirqlFURiQJrZZ6HYNYX
	B9vOTK846Opni8pXS8jpDdjYBj2/OJFmqofafRqj3Uk3DdyoJIHW/8QEF+E29QVxzIzwT3wTHeY
	CBwUcb5XTh9kDnXE2mRe7hgL0PpF0OEhZbNlYE7NZiiaGxahJy3ncj2jYgSIPx81I0LaDe6d7JM
	o0eBjvrh/H8/Q20McgKhGeOp6kMaFC11SncZ0xPvlBl2Z1RiwrTe5Tm4TfbyCMcaUnH56QQf6UX
	XDi13qjxjJK3cTscbLrls6fgQgoJyUAxwbaLZmrA3n0kk0Zf+7OXQ8LEiMmn9GovzoSZeulbmrQ
	QQD3G7SSIfp56gvS5lBWGBQ62OgzgU5KiLSyTm7Z9f403Av2niiTEeHTbq9BUUJp+2EpCyo+TR7
	puTYSpOF5QhdLAi7/hyfOtiRlUkgITrXTOAt9Xz9tbG5u+wMIsxAEkyEjQOpAA6tsf7qP6nEX1U
	opxnA6qjd+pchM+9sCR4lMyAhIMYHmGozC1J/seIB0YPVsSTbGRwTjg4KIQNEV3WX6vOUz017gW
	P5shIQsTgb51JZCUW657Ktbj05GkV7iPPqtwd66OihzAGXxfJY0+RdyHLI/PDHpTCdrN1UVmctE
	4+g9
X-Received: by 2002:a05:7022:699d:b0:17e:ee5f:6715 with SMTP id a92af1059eb24-1b543c275c5mr2389368c88.27.1794974915529;
        Tue, 17 Nov 2026 20:08:35 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a73e0aa6sm2695251eec.19.2026.11.17.20.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:08:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/8] geany-plugins: Remove unused patch
Date: Tue, 17 Nov 2026 20:08:23 -0800
Message-ID: <20261118040831.2284885-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:08:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132616
Content-Type: text/plain; charset="utf-8"

0001-Use-pkg-config-to-find-gpgme.patch is not referenced in SRC_URI.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../0001-Use-pkg-config-to-find-gpgme.patch   | 31 -------------------
 1 file changed, 31 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch
deleted file mode 100644
index 9030f36d44..0000000000
--- a/meta-oe/recipes-devtools/geany/geany-plugins/0001-Use-pkg-config-to-find-gpgme.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 0c24f99ca4d4f64ea8584347ca6ae0d638d625a8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
-Date: Mon, 18 Feb 2019 16:13:17 +0100
-Subject: [PATCH] Use pkg-config to find gpgme
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
----
- build/bundled/gpgme.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/bundled/gpgme.m4 b/build/bundled/gpgme.m4
-index 44bf43c..c9a8ae6 100644
---- a/build/bundled/gpgme.m4
-+++ b/build/bundled/gpgme.m4
-@@ -18,7 +18,7 @@ AC_DEFUN([_AM_PATH_GPGME_CONFIG],
-   if test "x$gpgme_config_prefix" != x ; then
-       GPGME_CONFIG="$gpgme_config_prefix/bin/gpgme-config"
-   fi
--  AC_PATH_PROG(GPGME_CONFIG, gpgme-config, no)
-+  GPGME_CONFIG="pkg-config gpgme"
- 
-   if test "$GPGME_CONFIG" != "no" ; then
-     gpgme_version=`$GPGME_CONFIG --version`
--- 
-2.20.1
-
