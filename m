Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E92C4167B
	for <webhook@archiver.kernel.org>; Mon, 13 Nov 2023 07:34:57 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.32226.1699860894729321284
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Nov 2023 23:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=A9G9R3LH;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ce1603f5cdso7651995ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Nov 2023 23:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699860894; x=1700465694; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00waiFs8CYnTrrd96a5zWVngPjPGSaUjmWoQLY+H32k=;
        b=A9G9R3LHH90Z8MeLUw3fOVxcFsUevIr0Ry4QSy/Eno/6fbZMEDc8ZPwnN5Tfn9hzye
         2ScHB4FnelNDUL2Mz2rJyUX7of49LzeU5cihP1euoeWxc8fFnHIXQy/ZCHKutLmy89nJ
         AhUqbJve2Iri68qAk8eXiVPtQCVfkYtOm0f7G/XzRhV+GZwE5uSbQbvJG9BlZkwPLsTi
         t4m1vutETVKYNtejMIRX5F60NXYGCnIStMwVtaZhIaWsqiO+uPrQ/CQh0JhRAoqBoZU4
         cxHqLThwH5FsXCGpOIiACoIZ9wdKDH+LKZocJdnLS8wjh+MWGRE63VAYxydbXaGADBBG
         sQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699860894; x=1700465694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00waiFs8CYnTrrd96a5zWVngPjPGSaUjmWoQLY+H32k=;
        b=U+88nvay4j76t0bKtDVw0aypVZb2MH6eP+BoQWORW5d9j2DMaREIVibkdg8YQoLl2j
         kVH+t335biggmSClYSzyymLj21xhCKktcFQO9hH4mJIhAHAo/LMCV9kh0cVg5lFzIyM0
         8ho3DNfhldq8m2GfxVMtNtVIFFgZ4nUVZDEWXTCx0L2HFIj2x3ymDxTdTqrsN99un037
         qznZz6yWXaz0se77+3DBkDAnaZ7stcU3lzbqqhW7+0J/SG8NbERCLeRDahZ/ewYA8r+C
         JsCkln6SAn4uwlzriUBeuVzR1ItLsmYOq5MPBSJlUFQR2TUjaHanaBP+mEbI0RECavb+
         4QwQ==
X-Gm-Message-State: AOJu0Yy803RZZVLSopNwuCG7pywm/jG1k8PDlBCuZp3iiaTJQzbmAgbE
	SsR2sP5b8WQTJXdP92shS7U=
X-Google-Smtp-Source: AGHT+IEIIiVW6H8DoTKy6GiQ0X2itK86PRmeWwIGoWPsICo4vVHyU8wlYtUzrMdqlF/rARx9NrA0+A==
X-Received: by 2002:a17:902:aa48:b0:1cc:59a1:79ae with SMTP id c8-20020a170902aa4800b001cc59a179aemr3871235plr.39.1699860893963;
        Sun, 12 Nov 2023 23:34:53 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9100:2cb0::62f8])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001cc50f67fbasm3509691plx.281.2023.11.12.23.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 23:34:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Nov 2023 23:34:49 -0800
Subject: [PATCH v3 5/6] toscoterm: Delete recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231112-kraj-pu-v3-5-51f4c8091bc8@gmail.com>
References: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
In-Reply-To: <20231112-kraj-pu-v3-0-51f4c8091bc8@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, 
 Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Nov 2023 07:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106631

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/toscoterm/toscoterm_git.bb | 31 ----------------------
 1 file changed, 31 deletions(-)

diff --git a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb b/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
deleted file mode 100644
index 654e886cab..0000000000
--- a/meta-oe/recipes-support/toscoterm/toscoterm_git.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "A very small and simple terminal emulator"
-SECTION = "x11/applications"
-DEPENDS = "vte9"
-
-LICENSE = "GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://main.c;start_line=5;end_line=16;md5=9ae4bf20caf291afa94530026bd15229"
-
-# 0.2 version
-SRCREV = "8586d617aed19fc75f5ae1e07270752c1b2f9a30"
-SRC_URI = "git://github.com/OSSystems/toscoterm.git;branch=master;protocol=https"
-
-S = "${WORKDIR}/git"
-
-inherit features_check gitpkgv pkgconfig
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-do_compile() {
-    oe_runmake \
-        CC="${CC}" \
-        CFLAGS="`pkg-config --cflags vte`${CFLAGS}" \
-        LDFLAGS="`pkg-config --libs vte` ${LDFLAGS}"
-}
-
-do_install() {
-    oe_runmake PREFIX="${prefix}" DESTDIR="${D}" install
-}
-
-RDEPENDS:${PN}:append:libc-glibc = " glibc-gconv-ibm437"
-
-SKIP_RECIPE[toscoterm] ?= "Needs porting to work with latest vte9 >= 0.74.1"

-- 
2.42.1


