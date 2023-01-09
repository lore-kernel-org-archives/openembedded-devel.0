Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF37FC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:05:09 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.77956.1673283900871805486
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 09:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FsE54WTY;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id c85so3343416pfc.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 09:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mmDtcG205TMoLS0dEf2NN6SAU+451d3zPc4/4BYcgr8=;
        b=FsE54WTYJfXuZ62/FjQz0IYwnvw9g9XIuivaFmdes42R9yh1e+E9Xvdh5jp+s8A/jb
         BVB9LHo+IHyMhsaPREVqbTE/tyR9h345hoqfsxBdkJweF+Dn2G4U80CT5jFvX/v5ZScl
         ixCuIWrznhg6sXxn53zvSoQhIimzRdMYkgFNLBBUI1TepLRIkUcqhlcIdbCoaBUkY+jL
         HVjyMB5ZZPBXeUtaw5dTynL/UFAq8nMiN8Fyx0ociLVNJpwmJYBZqC2iffbNrg7hp0xP
         ivFpu0/lt7RhUCz5w0OuWPCFGdudvPsLebdeBFLX6xS16Dz+0/g8W5327YOLkmOAprei
         3vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmDtcG205TMoLS0dEf2NN6SAU+451d3zPc4/4BYcgr8=;
        b=MPBfW6+v13YGCIs7GizJ7J7cZWQHqkEoPsoZcGf85b4sjjhidYHtnzccrO+zTK6PQN
         JUg75HW1/kyVopoDOeYhLHHmhUxG7+bvAb/PRS3YXbg073M5fI8YwT2bkQJKypfLJIUm
         fgf/JL1QT6WwfzoNXCKPiiTKKh6hmnPdNd5mf42iazpgTSLa8v+ZyS0S/QMQe5Sa5ehO
         3qkENiy2fdMvPlXD2DsfQDhW1Vs7jVukbwS8JTC236OozISPpFe87hIlOZ7r0FS71XS3
         Qyp5oTRouETFAzEX2JJpI5tjTAli+5kKS//ukxVUDEW+lv3jd96sMAhFo9+lq8ig9km1
         Mk3Q==
X-Gm-Message-State: AFqh2kp11rX9YxlwaIy94VZRyN/HgEqhVWjBnQAJ5JR0OLRDD4RtRxIb
	PvcMRReqDnkLOYmDHD41DFpJcdB13t0CLA==
X-Google-Smtp-Source: AMrXdXv5EWfzBCv83bOKCUl47WpF4FvzbVQq+osNwn5C71rhJYfYNKC3gjgo7wiqPKY4EWV1MNmjVQ==
X-Received: by 2002:a05:6a00:d6f:b0:581:4ce0:e5bf with SMTP id n47-20020a056a000d6f00b005814ce0e5bfmr53702950pfv.26.1673283899818;
        Mon, 09 Jan 2023 09:04:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id f10-20020aa79d8a000000b005823b7da05asm2083515pfq.122.2023.01.09.09.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 09:04:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: Remove boost-url from comments
Date: Mon,  9 Jan 2023 09:04:57 -0800
Message-Id: <20230109170457.3549957-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 17:05:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100485

This recipe is removed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 65eaf6a88f..0bb4f7c407 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -1003,7 +1003,7 @@ RDEPENDS:packagegroup-meta-oe-fortran-packages = "\
 # They wont be built as part of images but might be interesting to include
 # with dev-pkgs images
 #
-# opencl-headers sdbus-c++-libsystemd boost-url nlohmann-fifo sqlite-orm
+# opencl-headers sdbus-c++-libsystemd nlohmann-fifo sqlite-orm
 # nlohmann-json exprtk liblightmodbus p8platform gnome-doc-utils-stub
 # glm ttf-mplus xbitmaps ceres-solver cli11 fftw gnulib libeigen ade
 # spdlog span-lite uthash websocketpp catch2 properties-cpp cpp-netlib
-- 
2.39.0


