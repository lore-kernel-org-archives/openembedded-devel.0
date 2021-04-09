Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.3667.1617934858431460323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 19:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F77/Xz+I;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: akuster808@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id z15so4276085oic.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 19:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=dr5AnNMfsb4sPZQ+jIJeXPYPujbBaeC8s3VUPI+7OcU=;
        b=F77/Xz+IVQyXtjJGGb1B4yiIJ1oPI+R6wd32EXn7xfwbDx4VztJupuLrGXt3myRMYz
         wszIZpD+KlEjZYO+ZYXjyf/wdg3Q3Y0tpP4ao9Te/E0GFI4rR73+h2VYqROHtfyq/HJx
         yW4z2xTSZ1/cOP0UOgtUtS26RisAU8T6dkAna1nw8QFjVZzoo7N0NLH/v0pECRskGLRS
         mg8CAi2vSwCasQ2cJPIuud3v1pMwqeD+GczSy4pUWMpffcXYocCC+Uw2vKLsktTiylou
         clYrfGoatWtaMhCuZh6rm+mG1BiMhtN2Mps23LI8IrY0kDjSH2+kAk6qQkcw9r9nf2Zf
         NGQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=dr5AnNMfsb4sPZQ+jIJeXPYPujbBaeC8s3VUPI+7OcU=;
        b=Lhje6h0/ltdgGAU5UoGuudVEMTe8wKz80yUvxD2blh+4EwxjA/Xvr5Pq10fzlaWbLS
         bhHoR1yJ2c2u8GiwgrXoq+dwZ2AchhosJTTp9jU1voK2U88qlhLoFRwMSjEA8xGn61n9
         hL0JOLvdZc3sF0sGwcz5U7TJMP16yxbwGyEmd4au7hsyLYJwWgRjdl9To+JcXh/cnH+l
         3gyVGY/Qgf9OWtTkDscPpYb8/CQTdKtW2bRu1W9oEjyx9FVR6i2cqc4EJkhFEC4mocCA
         TxLaXA2NvjgF2DdCEFbDU23M+BiY8nYAJZikrQeYXUe8VDSKskvcEbhVspTqhuI1L3ji
         iziQ==
X-Gm-Message-State: AOAM530dXPbwsw1sjdWAdopHRSx8jpJLEjXeCdt9eSi/JNUkqksACGk9
	1Te3sBPkRPmyIuRckNYsz+7X76iP4Mw=
X-Google-Smtp-Source: ABdhPJy6+b1AWK1phsSKZhtFyTL2FCV3Fu+2aW2oeHQCTj09n1l+X6Sq+nJKGqnd4BMAyHuQ2VZz3Q==
X-Received: by 2002:aca:b9c1:: with SMTP id j184mr8223807oif.5.1617934857666;
        Thu, 08 Apr 2021 19:20:57 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:8533:6d3:7a8:8272])
        by smtp.gmail.com with ESMTPSA id k65sm299815otk.53.2021.04.08.19.20.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 19:20:57 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 04/36] android-tools: use PN instead of BPN in RDEPENDS
Date: Thu,  8 Apr 2021 19:20:17 -0700
Message-Id: <6943019c150a629591e5136619c261b32943134a.1617934043.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617934043.git.akuster808@gmail.com>
References: <cover.1617934043.git.akuster808@gmail.com>

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 7e60ff535380b905f631a31f3f1228e78f1c117c)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/android-tools/android-tools_5.1.1.r37.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index d93a7f72394..e8992346b08 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -160,8 +160,8 @@ do_install() {
 
 PACKAGES =+ "${PN}-fstools ${PN}-adbd"
 
-RDEPENDS_${BPN}-adbd = "${BPN}-conf"
-RDEPENDS_${BPN}-fstools = "bash"
+RDEPENDS_${PN}-adbd = "${PN}-conf"
+RDEPENDS_${PN}-fstools = "bash"
 
 FILES_${PN}-adbd = "\
     ${bindir}/adbd \
-- 
2.17.1

