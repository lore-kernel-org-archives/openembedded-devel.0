Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF55CCA474
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 14:19:42 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.18527.1758896373700690238
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 07:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TS/5G+1M;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3727611d76so238966166b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 07:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758896372; x=1759501172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BiDdvDh696H1EROsuhiAcmAmJRlyFMt+wJpJWWJ+HA=;
        b=TS/5G+1MuFTl45qtNbYreullHihVMIky7luDywGM6KwIfgYQShAGSSDbOZNhzRFTig
         FfhgvM9g4d3frK+mLUcZ4bQJaykjEmi1lTrDRlIzwiYcR7co1vkO2S5/RLqJ+POToGsn
         +emZZtVxUXOriuKMSnDiTYx/2q7Q0rj24zw0ds55QCkuU7zWK+Xbb8gt5pxnYQDBzKoa
         Epp0r/xYglqypDm6AGxZzQ4kT5zl2qy1o70T2i630WMcnYRuRccTS0Mi6lbVbcHl33Kq
         BC08YGNnKtQIU9mJVrlyeIWW/yahTfWfzOFl48JBJenkZMkgfN+lTiV53/8SHjwF3MWR
         35hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758896372; x=1759501172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2BiDdvDh696H1EROsuhiAcmAmJRlyFMt+wJpJWWJ+HA=;
        b=LxrW9QbDLWpcCM4eN6OikrmpbxHp4OOngxzICfP7rRqyaj+3tRO2xSP38C8yoL7ulx
         DerHnCXUqF4On7JDVn9jJtEb+/JKnD61BSUc0UMlzG7JwRMA/71Yb0Bq9WNc6jwYVCoW
         yRCWUxTemiRWYcWfoxINOtdI2BA1O9X+hNOZtkW2IBBfrLOZ8WpFbUuOA5R01fHMMeBP
         1TPKA9tw3NryBhkamvTZmjTvzDROCyP1qLZVRWkPGvEWBDWAcx5xBMv7G8idoYzxWi85
         ensRCkANabMqU7uk3adq6LZB5vOQ2m9JcGK8/3nRA7BQgOrhyI3Yi2PHT1714cWKVzcG
         719g==
X-Gm-Message-State: AOJu0Yw0gmLPo66EMjeduyENDz0RYW41ZBsYVF4/hFxM3jK9tT3cz2yO
	o/INx7AffaCZkCceiKPOMKbLwDclqz//MH6LyBUc+7DJzy+t8HtOSuhZC5GA8A==
X-Gm-Gg: ASbGncvgZWlH2G5AnzNmGjNvEnoL4YpcZ+V3+CnPA5DzKXELZpzLfYyaRQQMasbGlKE
	HJHwrtTs4cxcopaB7e+eKH1bPz9zgoPpkOL+LyotZLsHmLExcjYnG84p68UiWa2PTV9HzUYxlUV
	b7uVF7tL4N40Xqmb6DW32gpcb0d1RWMSo1LOlW3Iv5LAFBuwPk3DRhBeZ/qyf4LKDE+IclYdLXF
	YBS3CArxARJaS24bJv5jfGb7hBCrZyb3L/Bdrei/SizHPWt9l8K8vMW7BA9AT4KcrozHd3TNP++
	CsdpLNZ//hn6JYonMMMNfm2IQBDmrpm62SlVypKiqoVmHOc0MNjMztT7T3oP0iameaHj5NUbZ+y
	Oh7oKFLbpZXIinU8cTIkG
X-Google-Smtp-Source: AGHT+IFlyTaKDbqMY9bwPXp8+ixJd1EFl3ImVH6lZ/OHXSDWgTE/bD6otfi1oZsNYe7hX1/Zur74SA==
X-Received: by 2002:a17:907:970c:b0:b2b:c145:ab9a with SMTP id a640c23a62f3a-b34bfa52b03mr839316166b.60.1758896371620;
        Fri, 26 Sep 2025 07:19:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae321csm3001028a12.24.2025.09.26.07.19.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 07:19:31 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 11/20] libnftnl: upgrade 1.2.4 -> 1.2.5
Date: Fri, 26 Sep 2025 16:19:10 +0200
Message-ID: <20250926141919.2010846-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250926141919.2010846-1-skandigraun@gmail.com>
References: <20250926141919.2010846-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:19:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119920

From: Yi Zhao <yi.zhao@windriver.com>

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e9df01df3db8fd67102e53c6a424bc0128100573)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libnftnl/0001-configure.ac-Add-serial-tests.patch     | 8 ++++----
 .../libnftnl/{libnftnl_1.2.4.bb => libnftnl_1.2.5.bb}     | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.4.bb => libnftnl_1.2.5.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
index 049ad2d39a..abeca6579c 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl/0001-configure.ac-Add-serial-tests.patch
@@ -1,4 +1,4 @@
-From 1cb59c1fed33607e4fb2bee9144ce45276e9cc96 Mon Sep 17 00:00:00 2001
+From 801a4dd42449fb5f09fb9cb99714ed137278ca24 Mon Sep 17 00:00:00 2001
 From: Trevor Gamblin <trevor.gamblin@windriver.com>
 Date: Tue, 14 Dec 2021 12:31:12 -0500
 Subject: [PATCH] configure.ac: Add serial-tests
@@ -14,13 +14,13 @@ Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 8e68035..2704214 100644
+index d5c6bd0..d90048e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -8,7 +8,9 @@ AC_CONFIG_HEADERS([config.h])
  m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
  
- AM_INIT_AUTOMAKE([-Wall foreign tar-pax no-dist-gzip dist-bzip2
+ AM_INIT_AUTOMAKE([-Wall foreign tar-pax no-dist-gzip dist-xz
 -	1.6 subdir-objects])
 +	1.6 subdir-objects serial-tests])
 +
@@ -29,5 +29,5 @@ index 8e68035..2704214 100644
  dnl kernel style compile messages
  m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
 -- 
-2.33.1
+2.25.1
 
diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
index ede35e7624..380a33064b 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.4.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "141cc997755dd91e94dd64c5497f2a23bd9a894c"
+SRCREV = "c62bef65fef638452b4ed1893c2451fc253ca7ca"
 
 S = "${WORKDIR}/git"
 

