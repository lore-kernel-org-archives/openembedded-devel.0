Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083D0C53210
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 15:21:32 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web11.46806.1673191282128701687
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 07:21:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kSoDSs1h;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: akuster808@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id x44-20020a05683040ac00b006707c74330eso3833073ott.10
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 07:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85gfWC0+v9s9SKcF1NDhVkZbXsFsbBnTrOuJXQDPdgg=;
        b=kSoDSs1h04qGRBmGOh2zNjw1ke2WekwLuKoU6zju61u559aJdeVp/NvHuFLTyfFT6u
         TmnfYRIGPZvbFNZCtxvdi8PlvAI4Lzxb1ILHLxn181Lcm5uetDC1I9+8ZiGLArNK+G7z
         ANaPE8+1ZahlAogZAWc6DdTMqe7XqKFoJarak5eFwQmc2eDmsRHK1c6BNWYXrkEPLGl9
         5/5NOji355TCbbtwv2+3JAmZ7F45Pmr/5dQyzhNe1IxmtJn2Y4tq1jxxuNu/qqaW5XXM
         srdQv647ZJyEM6nCUrRzlWw0w+vuCi71S/EW+Yb+h6xgAAPknT2msSAIGBp7tezojdYC
         u+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85gfWC0+v9s9SKcF1NDhVkZbXsFsbBnTrOuJXQDPdgg=;
        b=mF7e3tJkz6Sh5Dx778pK2YonrdCaeWpUMesV4UlGgTbKg4/tmDGoX5UxgsQHaBn6Lw
         uZ3rOd+tK62dniXyVPp1yx2g+7AqkaEUuiZeBOvRRLGS7Pnlpe66CoNJlpzuwXVjkQT2
         bI0Qj+ZBXyN+F8kg82g9nwk5IJR6JWtWEiPIYnSJECeudB/ug63t29J7fTnPdwMg56BE
         rNrnaUW5bnFqkLwsqPR3s5KAspPS4LiNRgvIotJ5zMuZoKCvVGc9698/XE7zMAZmnh63
         1Ei7dLRFDhYniMt8REyeCaiLGkhNFHWe/pbDFb1wtWsT9m7e2/7eAGQd1to3CsLVgJ41
         7pMA==
X-Gm-Message-State: AFqh2kr64yeeepWxD9YJBt/2jJCVk1oejNEOvgxnBv4VAKD+0k/MkmVS
	k8VvE+Z2YX1dTCfODzIcfpktaPY7qLo=
X-Google-Smtp-Source: AMrXdXuuokNn6G5+JRbcRw0g0p4/sapx+zrR4ALgsxWnhpgxQ8sRYvWU2Z7t056UZKBko1zc+FhNFg==
X-Received: by 2002:a05:6830:1da6:b0:670:a09e:c7d2 with SMTP id z6-20020a0568301da600b00670a09ec7d2mr39791927oti.30.1673191281326;
        Sun, 08 Jan 2023 07:21:21 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:14ca:f21f:f9fe:c54d])
        by smtp.gmail.com with ESMTPSA id s24-20020a056830125800b00684074fbce6sm3184725otp.54.2023.01.08.07.21.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jan 2023 07:21:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 09/26] protobuf: stage protoc binary to sysroot
Date: Sun,  8 Jan 2023 10:20:44 -0500
Message-Id: <a7212d75fcfe871d6a9c292df8620cc68ec5fb39.1673191116.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673191116.git.akuster808@gmail.com>
References: <cover.1673191116.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 15:21:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100454

From: Samuli Piippo <samuli.piippo@gmail.com>

If protoc is enabled for the build, recipes using protobuf will
fail when protoc is not available in the recipe sysroot:

|   The imported target "protobuf::protoc" references the file
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/bin/protoc-3.21.5.0"
|
|   but this file does not exist.  Possible reasons include:
|
|   * The file was deleted, renamed, or moved to another location.
|
|   * An install or uninstall procedure did not complete successfully.
|
|   * The installation package was faulty and contained
|
|      ".../recipe-sysroot/usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/cmake/protobuf/protobuf-targets.cmake"
|
|   but not all the files it references.

Use SYSROOT_DIRS to stage the binary to sysroot so it's always
available for other recipes.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d7f46fa816964e30edb2ccfecc57a26251cc351c)
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
index c8b9158e6c..201908f3c9 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.21.5.bb
@@ -92,6 +92,8 @@ PACKAGE_BEFORE_PN = "${PN}-compiler ${PN}-lite"
 FILES:${PN}-compiler = "${bindir} ${libdir}/libprotoc${SOLIBS}"
 FILES:${PN}-lite = "${libdir}/libprotobuf-lite${SOLIBS}"
 
+SYSROOT_DIRS += "${bindir}"
+
 RDEPENDS:${PN}-compiler = "${PN}"
 RDEPENDS:${PN}-dev += "${PN}-compiler"
 RDEPENDS:${PN}-ptest = "bash ${@bb.utils.contains('PACKAGECONFIG', 'python', 'python3-protobuf', '', d)}"
-- 
2.25.1


