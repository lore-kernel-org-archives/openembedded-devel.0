Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.10419.1617328734644768514
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Apr 2021 18:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=P+LIfyHZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so3961631pjq.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Apr 2021 18:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=+6KA69BAN/SGZY7Oy7ChNm7T1TBulLJcs25ClSSCZyA=;
        b=P+LIfyHZoTaBjUaYfdwblNrwCrAeKuUi6MUF0omTyhKAv6jIz7ZRLjKsH4V7aLDbTp
         hsMeg/vbH8Nccf83IhJ6NbqqhonWgqw7VvN/1EyepECjoqlg7/qMD86Grb4NDtr2FfGj
         CoBz6QMBJcWrmniK/FOsQotPRQ6jqPiHxcySdBNwHp1d3+cY9wKAPmQ2h+06W+sEa9zE
         zG24FF+4D40bXZF6Zd2nRyUv6aOwuj6qWZjhFVJBruFj724XLXk97RLH6Pw6EN2YydBK
         yPz4hzHg7YXt6jCilEeTfs/XBXrS6ifY/6Yd2sMS8uj4RuHr3Ddvb0GB9+px7IoYhCnC
         +X1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=+6KA69BAN/SGZY7Oy7ChNm7T1TBulLJcs25ClSSCZyA=;
        b=hW2cVgwlKjO4dU/mm3VvVQdBMppC0oXBQzHu5s1HXicPHcybj9qWmdncgFGozJY7c3
         QtZs0r646lCuClsoiZ10VY2PwqkRWczBzbrlDHifk8HiVjyLNitQLQ7QM02qtyQlMbU6
         p0EYb0vrS+9d4qF4uwZXw+mw4tMVe9MR1xGN8/LheNmP0g+2jdlkGZKB4Pt1xQnb2Iy5
         LWA4jJWmmWxPLeL7vG+MbM9QT/wDxEqNLAMfHbJDLnQ91OY83XvMCRx/NTln6UPsWklp
         Zi6E7r2q1AT4//S2Yh2wrEezwE0C7VM8cIpDMIYbzOXcxSB2bpnFas8fjOlYO9zpZM2Q
         5l+A==
X-Gm-Message-State: AOAM530Ik/b9lkHwZw6D3rOXHe+hH1peGwpFTQbz4XT3auETZugNOJNq
	iLTAgrryqBMnn0Vxnv+qcykOfQDGGE0=
X-Google-Smtp-Source: ABdhPJw9Ykj5vT0LHfMkXwme7tPbRVUE4CnclMN6MmDTV3V47lfByn4b/k6kmTyy3unRT/xTOABshQ==
X-Received: by 2002:a17:90b:2284:: with SMTP id kx4mr11241107pjb.96.1617328734002;
        Thu, 01 Apr 2021 18:58:54 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:344e:3d2c:47a3:4e6b])
        by smtp.gmail.com with ESMTPSA id x9sm707641pfd.158.2021.04.01.18.58.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 18:58:53 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [gatesgarth 08/14] rapidjson: Upgrade SRCREV to latest
Date: Thu,  1 Apr 2021 18:58:36 -0700
Message-Id: <910ac74e68810e725a95ebc8f4b2b581295319df.1617328609.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617328609.git.akuster808@gmail.com>
References: <cover.1617328609.git.akuster808@gmail.com>

From: Harpritkaur Bhandari <harpritkaur.bhandari@kpit.com>

Upgrade SRCREV to latest as it fixes the below issue:
Running UndefinedBehaviorSanitizer on projects that use
rapidjson triggers 'applying non-zero offset <NN> to null
pointer' findings in 'internal/stack.h' which are hard
to suppress by library users.
Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
as the changes are already incorporated in the latest
codebase.
As per abi-compliance-checker report the source compatibility
and binary compatibility between previous SRCREV
6a905f9311f82d306da77bd963ec5aa5da07da9c and current
SRCREV 0ccdbf364c577803e2a751f5aededce935314313
is 100% and this patch is already tested on 64bit
ARM (aarch64) in a product with on target CI tests.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 04d9ea0ba7ece968244bf049893dd5636675b76f)
Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
index e3ed9c6a17d..5b5c8b25708 100644
--- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
+++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
@@ -4,10 +4,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
 
-SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
-           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
+SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
 
-SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
+SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
 
 PV = "1.1.0+git${SRCPV}"
 
-- 
2.17.1

