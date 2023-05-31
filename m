Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A184C77B7C
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:33 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.11443.1685531604456530023
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=LlYumOjL;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-565bdae581eso69420417b3.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531603; x=1688123603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbbXFMSRugVeNHsNg1Q34zMHhMb/P7cqXwceLM1AbDs=;
        b=LlYumOjLhIPR4f0NlFPVwcgaBkunYLt8eBn/h/TbrzEhtNxbUywuSU4Mrx3708WKu1
         Fp8Li+djN3sjDA3MXFn1uY626wPfqAWklNPy5yLyouGJU895TfVQSA/ldcXQ3/rMP/gG
         zvnwkbiSW9EmEZQ0hGrdRqDWVNybgoNHCP/A4lbgUCbG8GOEteh7vWm3WglQKZTH1EcI
         g/T6pK4JCj5jWsy34flf6g786xLLsuEyKOkbW8k+4Wg4Kvg1Ycvai5AQG98xCl9Qrzk/
         q+h34KAZNEbDfYjL5PWgFMN0aofrPnbCpRGLlaOq+O5p4nseUaX2u1KmuMf233td87pz
         b2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531603; x=1688123603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbbXFMSRugVeNHsNg1Q34zMHhMb/P7cqXwceLM1AbDs=;
        b=Kc4cQljzG9kV9/0JavnNuEYq5sE9vFObpOVurvwS6ofeefpUkdpY+X5mQ32M+8LGgF
         gGLPwi5zreL70oAYpUhhNX7G6B4O+2lEU+ps04RuZzmmM8XBf6KA0ff9ikcf2wHYVTu3
         bNtLTIDa5WtU6QZNT9i5KJlVBbVfjWzC5BwPcYItMU/SS1nk2PxSNfuZMJK3N/+p8lsj
         xEbqaJv5fBUHftMJrkdHsvqeAKMubcvvFpb0QzJb5q0s9XTdsU/UOVALDa3e/Yd1Qgov
         xMJpQYotB8yCmNQdKtzzKtLMa5X3doheLmd2bteygJMyE6xLTAI2XHFLW2GW8Pgea779
         bY3w==
X-Gm-Message-State: AC+VfDzsZXjCQg0jeP1wrIe22cu445PqRDZ6d0PphqNxsgqquWmH8E3v
	W6d0ietGfqZAvRdQeyfn13gRfL4my0Q=
X-Google-Smtp-Source: ACHHUZ7ef+LmYjemuuGkueLq870ZH1ecTIAKWBagruzVb0pNkK14KjRqirz2Ok7fERkW9PzE04yV/A==
X-Received: by 2002:a81:d246:0:b0:54f:895e:70f7 with SMTP id m6-20020a81d246000000b0054f895e70f7mr6111566ywl.9.1685531603336;
        Wed, 31 May 2023 04:13:23 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:22 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 15/36] libmad: Add a patch to pass cflags to build
Date: Wed, 31 May 2023 07:12:48 -0400
Message-Id: <20230531111309.2454603-15-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103044

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0474e0b8705ee2048e92ed5874b83b2535dc9cd2)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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
2.25.1


