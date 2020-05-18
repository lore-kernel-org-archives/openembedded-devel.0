Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.43857.1589813431743683927
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 07:50:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=h3DPA3PC;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id t40so5227267pjb.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 07:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=SKzjMOef2kq+/pkAnGCMtxZXTpPscJ/Nz6iPvKffnkw=;
        b=h3DPA3PCEtL4T+Jmfkt/pRswZczqb7KIfFKPNBW/Cy/AGBzVyTPHtuHAGfYdMv+ITN
         97hHzNTkY8nGxuS3LpDqTdbqIOziE9XI+1ZMvYdGFnX5fwvL2euLUZuvjjnSPXt4TcsY
         +q83l9VzVvsYBrf+NnaYflZm2250PjXgX4eYI/2KnOp3UkIIew4jN9oJE7vkMpSkrKj7
         wVez8pz8vhkqIJkOUHCOtIoS/CKyY3melEuTy5d2ODoalD4fg3GOa4dTIxcs2FW51bc/
         8wB9rf+iZqoQ+2Ii6FPohMGu23QN9smeg3+VSaZSf8xpACPavsF6+qa/+Qu5OovxJ+1V
         coWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=SKzjMOef2kq+/pkAnGCMtxZXTpPscJ/Nz6iPvKffnkw=;
        b=COYSaIihp+/lNCNcs/uB6Ns5oOpx2sOaZVAcDqvC7EFAb3KHFg0a8nzMVOSjSyUJl1
         tGwZz9abzt/pDpOSwZIuCZHYYKprNSabfaD++AOE1/n5mHgpu6hu6AbxFzSF2XSRis4Q
         FwHIMx5iWR4oTbMFeTci0jQhJzge3PuFSJ66cr2dJWpq3ZqazH/cOaierjCH/awZlrpI
         UMbkR/U9NCtaZMTMMUosZVvyC6HZXRlLSju4mDVsEiCU4xIIWb9JE/Y3Rdz1dltsXYCC
         7E0/OWruGxiyg87Ruo/pgU6Ej7IUbx5vcaiciROGeTv7FS6IbkEUUDXzZzuDU5Eq/HWo
         XhZA==
X-Gm-Message-State: AOAM533/Jy3fg0Xs5fE59UWehto/LTe4aK2ejHJExpq/mN46u4TdFUNB
	z0p8COb80HZHlSfEjj3lPvuq+uud
X-Google-Smtp-Source: ABdhPJxlDLhz+ZeFODa+yrDEecY5ilzoGZchqUwPtqlaDAJpagxdbFy1SBDg+Kg3YnWyIX2C8x/mgQ==
X-Received: by 2002:a17:902:d68b:: with SMTP id v11mr16698108ply.295.1589813430801;
        Mon, 18 May 2020 07:50:30 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:4481:39b9:1b65:c59])
        by smtp.gmail.com with ESMTPSA id b1sm8984694pfi.140.2020.05.18.07.50.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 07:50:30 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 23/57] python3-attrs: Add nativesdk to BBCLASSEXTEND
Date: Mon, 18 May 2020 07:49:28 -0700
Message-Id: <3ab088ccdc35e1ad04ceb44efbe240dbb7513945.1589813083.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1589813083.git.akuster808@gmail.com>
References: <cover.1589813083.git.akuster808@gmail.com>

From: "niko.mauno@vaisala.com" <niko.mauno@vaisala.com>

By doing so we mitigate failure when trying to bitbake recipe which
rdepends on nativesdk-python3-attrs, such as following error
when bitbaking nativesdk-python3-jsonschema:

  ERROR: Nothing RPROVIDES 'nativesdk-python3-attrs' (but virtual:nativesdk:.../meta-openembedded/meta-python/recipes-devtools/python/python3-jsonschema_3.2.0.bb RDEPENDS on or otherwise requires it)

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 129efc7fa0c04ee812a972fc5b63990fe74288ea)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb b/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
index b3739fda8c..7ff8049e52 100644
--- a/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-attrs_19.3.0.bb
@@ -12,5 +12,9 @@ RDEPENDS_${PN}_class-target += " \
     ${PYTHON_PN}-crypt \
     ${PYTHON_PN}-ctypes \
 "
+RDEPENDS_${PN}_class-nativesdk += " \
+    ${PYTHON_PN}-crypt \
+    ${PYTHON_PN}-ctypes \
+"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1

