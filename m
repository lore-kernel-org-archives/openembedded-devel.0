Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3463C71153
	for <webhook@archiver.kernel.org>; Sun, 10 Sep 2023 21:08:22 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.44932.1694380095154764542
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Sep 2023 14:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZN0+ANLg;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68e403bb448so2261032b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 14:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694380094; x=1694984894; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWLsO8pR2eucLCzfSrGS/TyLs32+OWVCpj+IsJdGTlk=;
        b=ZN0+ANLg8cn2p/xjrTmNl4/y7/yzDldZghqn2vG0Ctk6ppsfdUQWXSijIFUaYn1Z/k
         CcIXin307u+zjcYVhdlKPZW9hYItHd4u+XdFGHajMvSl6b+MW5FZSu0ipZ08k4by8X+E
         OUA25XcgY/7cRezcl3nj2/kX1+/9xtYforDl3g+3N8+ZwaSXXUMqdq7cH8gEt1/l8H9x
         zGjtfmF9dxhpHrBX1u8ixHiWMdgFr25K1HmTwu8vYF1mUGLeOPr6vqGaSm2JhfOGbxrv
         COR+OMvMUKLcp/K1Gk9u2/BeSILj5iHMZrxhQEqSOWvHoTALYUVGb2li/cbh9QyFiSNp
         MInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694380094; x=1694984894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWLsO8pR2eucLCzfSrGS/TyLs32+OWVCpj+IsJdGTlk=;
        b=e2Z0w+y29ufk5k9UxlH1wXa7+vtPMjk996SOiPStgj381nhxeTW4KdFiVAKbBvEVQT
         ev5vKgs/Xqc+VV4pBB5mZeeyJaL14XC1MWIaet5uQFtxVbzhiT3s3m12wd92xKAxLrGn
         J0wBDwRfZsRHm4d9hSsgGz3vT7kmFTglx0D23t+GrraOPiKFtvPB9f1srqeJOA3dffHd
         /Dym7KlWOKT4VLYtAowNiN5kDLamIWy1jxOiKbQ19CmYaEaR6ha1wVQYlgUWkuJIbvtZ
         8jDxsygs+JRXZMbIWRtsf9xyE60l9UUjoWXk1MbH1i7wzEURi2FO42jUSZ9RZWzlnkPm
         RdMg==
X-Gm-Message-State: AOJu0YwmtGCIgDgv4dXIxeAVpBtdxa6wooNQt/O4GJ39n7CxU6EopfqT
	QpaVbaP8um7vfGh66hJupAXniyy0XjFDbw==
X-Google-Smtp-Source: AGHT+IEX0/CRgfs0Kwc/xQHx6/rXTmnQsL4oQWqwHfggWVqQzhujIwSdzz029IvT18FoWM69yCcOTg==
X-Received: by 2002:a05:6a00:1d8f:b0:68f:c078:b0c9 with SMTP id z15-20020a056a001d8f00b0068fc078b0c9mr1687898pfw.11.1694380094258;
        Sun, 10 Sep 2023 14:08:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::a05f])
        by smtp.gmail.com with ESMTPSA id t4-20020a62ea04000000b0068a30f6cf32sm4438057pfh.143.2023.09.10.14.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Sep 2023 14:08:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sharutils: Check for intmax_t using configure
Date: Sun, 10 Sep 2023 14:08:11 -0700
Message-ID: <20230910210811.2335948-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 10 Sep 2023 21:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104830

fixes
../../sharutils-4.15.2/lib/system.h:45:14: error: typedef redefinition with different types ('long' vs '__intmax_t' (aka 'long long'))
   45 | typedef long intmax_t;
      |              ^

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...re.ac-Check-and-define-intmax_t-type.patch | 32 +++++++++++++++++++
 .../sharutils/sharutils_4.15.2.bb             |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and-define-intmax_t-type.patch

diff --git a/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and-define-intmax_t-type.patch b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and-define-intmax_t-type.patch
new file mode 100644
index 0000000000..32562a08bc
--- /dev/null
+++ b/meta-oe/recipes-support/sharutils/sharutils/0001-configure.ac-Check-and-define-intmax_t-type.patch
@@ -0,0 +1,32 @@
+From ea6f7a4c22f1b6f28cf426566cccd65eb9a0e9de Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 10 Sep 2023 13:52:31 -0700
+Subject: [PATCH] configure.ac: Check and define intmax_t type
+
+If stdint.h or inttypes.h defines the type intmax_t, define HAVE_INTMAX_T.
+Otherwise, define intmax_t to the widest signed integer type.
+
+intmax_t is defined in lib/system.h if system is not providing it but it
+needs to be checked by configure for existence first.
+
+Upstream-Status: Submitted [https://savannah.gnu.org/bugs/index.php?64653]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/configure.ac b/configure.ac
+index 1242cb7..2ccaac9 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -72,6 +72,7 @@ AC_HEADER_STAT
+ AC_HEADER_STDC
+ AC_STRUCT_TIMEZONE
+ AC_TYPE_SIZE_T
++AC_TYPE_INTMAX_T
+ AC_CHECK_FUNCS([fchmod isascii strchr])
+ AC_FUNC_CLOSEDIR_VOID
+ AC_FUNC_FSEEKO
+-- 
+2.42.0
+
diff --git a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
index bd2776e1bc..2a16b18288 100644
--- a/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
+++ b/meta-oe/recipes-support/sharutils/sharutils_4.15.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-Fix-build-with-recent-gettext.patch \
            file://0001-Fix-building-with-GCC-10.patch \
            file://0002-Do-not-include-lib-md5.c-into-src-shar.c.patch \
+           file://0001-configure.ac-Check-and-define-intmax_t-type.patch \
            "
 SRC_URI[md5sum] = "32a51b23e25ad5e6af4b89f228be1800"
 SRC_URI[sha256sum] = "ee336e68549664e7a19b117adf02edfdeac6307f22e5ba78baca457116914637"
-- 
2.42.0


