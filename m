Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 617DAC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 17:39:44 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.28479.1684258774981441725
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 May 2023 10:39:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=U9s9ibOJ;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1aad5245632so103183115ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 10:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684258774; x=1686850774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9sx4HC2ECPRt1ph73FHHniUyy1NaB5N2dDMho1y5ls8=;
        b=U9s9ibOJAuOwYv2ClZ/pRinkP/VYvGaXAKMz4iaEXxVBRN8oIdy1juIKra1ZijoEcJ
         roKP+EmoqfvoTD9PX1nIMqWJcB9DHdzvAaOUWZybuu+HKE9wjm4W/JLJrSR8ncpFhPy6
         mtvISTj4L23xwwGtCStL1F1h7VUu8X3m2ErwFeN+Go4eqO0XO1583KULcNjScM89/SQw
         /eYhsDKvt7YA5EUyrzMmzS6Ka8A8zMoK3EYtS9wPzakFMSdMNHTyua3ogw+96nY2n/zg
         kULkcwV2TrcQvzVV9GAkqACWmZXU9hSYRyWTTa4dkXKqGOdkc7jeoJg8YqjwDJgkQN2m
         ki4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684258774; x=1686850774;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9sx4HC2ECPRt1ph73FHHniUyy1NaB5N2dDMho1y5ls8=;
        b=FHHYMAGGW78DZJR6VYsvcqvxyv5G7tZat08z6MAZV58qJU+7S02eQNP0rnAE0a2MnK
         skeI3Ngh/DzenSY9j32L9e1fICJsB8QElKjATW/TYmt2Dh/fpNocZ4JAzmHytKPoRegn
         tEhHwKsb1z+QgyImRNnzgrGzpY6wBZzFHwLXGlD4xbPzhjxhlinbHZqkR9GLaOg49jI1
         BiiU3H1rWqIwymU6s/yNXpmrDcj1Lj2fQ6rWj27VwD4KqZLUrOz98VpoPJvNdG7CDSSB
         DT/b4lcuY4/4MiLv+rS4Oq3bsFZu3wXkcJSTcOD3XFFykMWr8IvHjKT3OP1anYV6le3D
         TQ8A==
X-Gm-Message-State: AC+VfDxt6lenEc8aXcMK+3aISWyPgg5t/V3VIyWwFgzHgzzp34tyuC0V
	LNxnEFsGvgIMXoaeqE6FmnWhtm2j3ZQ=
X-Google-Smtp-Source: ACHHUZ4IblNxG1VreCd/zPUxdN/BvbkFGNPenn9xsXCADbfN1kmAfCWygWq/Q8DOLxUvYjqUfkwYzQ==
X-Received: by 2002:a17:903:11d0:b0:1ae:10bc:4ae8 with SMTP id q16-20020a17090311d000b001ae10bc4ae8mr11930160plh.26.1684258773902;
        Tue, 16 May 2023 10:39:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::c675])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902704400b001aaf370b1c7sm15734490plt.278.2023.05.16.10.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 10:39:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libmad: Add a patch to pass cflags to build
Date: Tue, 16 May 2023 10:39:31 -0700
Message-Id: <20230516173931.408592-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 17:39:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102634

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Respect-the-cflags-from-environment.patch | 47 +++++++++++++++++++
 .../libmad/libmad_0.15.1b.bb                  |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/libmad/libmad/0001-configure-Respect-the-cflags-from-environment.patch

diff --git a/meta-oe/recipes-multimedia/libmad/libmad/0001-configure-Respect-the-cflags-from-environment.patch b/meta-oe/recipes-multimedia/libmad/libmad/0001-configure-Respect-the-cflags-from-environment.patch
new file mode 100644
index 0000000000..586782a348
--- /dev/null
+++ b/meta-oe/recipes-multimedia/libmad/libmad/0001-configure-Respect-the-cflags-from-environment.patch
@@ -0,0 +1,47 @@
+From 26342d1c775205f661f5cf005b7e054a04f5d32e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 16 May 2023 10:14:57 -0700
+Subject: [PATCH] configure: Respect the cflags from environment
+
+This is needed with OE like cross-build envs where certain important
+flags maybe passed as global policy to aid cross compiling or
+reproducibility etc.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -73,12 +73,9 @@ debug=""
+ optimize=""
+ profile=""
+ 
+-set -- $CFLAGS
+-CFLAGS=""
+-
+ if test "$GCC" = yes
+ then
+-    CFLAGS="-Wall"
++    CFLAGS="$CFLAGS -Wall"
+ fi
+ 
+ while test $# -gt 0
+@@ -115,10 +112,13 @@ do
+ 	    optimize="$optimize $1"
+ 	    shift
+ 	    ;;
+-	*)
++	-*)
+ 	    CFLAGS="$CFLAGS $1"
+ 	    shift
+ 	    ;;
++	*)
++	    shift
++	    ;;
+     esac
+ done
+ 
diff --git a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
index d3ac85ee0b..5b089a0b33 100644
--- a/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
+++ b/meta-oe/recipes-multimedia/libmad/libmad_0.15.1b.bb
@@ -16,6 +16,7 @@ SRC_URI = "ftp://ftp.mars.org/pub/mpeg/libmad-${PV}.tar.gz \
     file://fix_for_mips_with_gcc-4.5.0.patch \
     file://obsolete_automake_macros.patch \
     file://automake-foreign.patch \
+    file://0001-configure-Respect-the-cflags-from-environment.patch \
 "
 SRC_URI:append:toolchain-clang = " file://0004-Remove-clang-unsupported-compiler-flags.patch "
 
-- 
2.40.1


