Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE31C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 20:09:38 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28111.1786651770365340369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Aug 2026 13:09:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=IQLVOnbj;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so248364a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 13:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786651770; x=1787256570; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7lgts+GLAyoVIRZP+MTKCQR6a2zmdYPBKggF8y1oagk=;
        b=IQLVOnbj+cVX/S0sWPolZkHs5cEWwsdtBo3f31wf8LEdoP3Z5Js3YEYloMuOHSLOI2
         We+FjQiLASS8t6TXIy6DGqxnzJn37IQHpVJR1wTrm+f5A6jRha5rwmjcaKgAXXYyjc5H
         D3J1Loj9ICfrA0Na3S3sSozEzQbAOIRY6Ld+ioVSvm37Uf3e7m63aOmYtPas/zYqdk1v
         2r+ssMzGysudqwLHB0DIrgi9TgdbkyQz2XVVlcePfICrA6vAjR7myJ++sYq/0lzKijjC
         0vwtycKDf/3HIUQV9uDcEG5iy8mLVYjnVLe9SfG1mNyhV/Vn88KWS7tkOSYZQUZrOmAZ
         A4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786651770; x=1787256570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7lgts+GLAyoVIRZP+MTKCQR6a2zmdYPBKggF8y1oagk=;
        b=KWIrw+VqWxHitb0xqU4AVKh/g3KCIV1td8RIcCCZeSUJjDsvZejgB5k8frQJLuLsBj
         LXPKGJcPd/7bpaRLpgcndH10b66izlUc8ydrGEqRhVfTjCXu9avIN3ASIMks73uocz6+
         JSnmiLQGDqQwBo6tkP8yRqrDIM2DhMKHYhQ/kfxrmf6MgmFo/dsPUZ+lnhNZfSbLst9K
         OT6rmgDXNtUSx83pemvJtL5RDIDIdHN2mOiIEmqqjEv9Qob5AzwHQvR0HB6AO4ZqvxzV
         TcE9bLWJxIRXdYhFPuDsO7xl+JL7OflWuOgSmKWqyqMuaqMOkFtSgiCEMFpk1lC1S97S
         mphw==
X-Gm-Message-State: AOJu0Yx30NoayNwLLOgcpZb4nAKjgrpcLC9l/0V1WwtN3BNLANMJ5q3c
	YFM1MPHOWvn7Udms+kghMs21sg6L+Vw+l917faedXArj62RPBnmumte5pBHtIQ==
X-Gm-Gg: AR+sD11Yel7skdr8ielB0hVNh/R34w9/01Bt9vkWBMOtw/H2bmg9W/2nZLpM+fdkHE2
	8XXd3ZyFl5NHzcMqxACxT9h0ktVdUvOnozOj0TtN24dsicw5j7HnCymCU3DmSG96LFL9T8p6ncj
	PdLQdDkXpewLLVJEdtTHuOAdUBS+wi5EqyAdcf49iiBcPaPbsCimXiV1F8dMXIxaTrMrQnTW/mx
	ljH4ZkETXDkBxaeDlTgeBprTzal/OQ0zNiFhRmQRl84W+xgIY7P/6x7I5TuPypw0a/CqRI3kTQY
	/6HhNAQLvRxpoEqg+6a2dPVKWgoXPpCHO/k+j/FVuuY+srk1o0A3iVjH/9GBHVLb1mMVtgDklfA
	EzX9Tzywo4Dn/1Fd49uYpxHhflBt94rZVtXRpiLFuPNiaN3IDaNVpFr+UkGftWgeoQx3XjSInT0
	wrjNDIeMY2pUYZKn1wHCM+mfqdvckXFsFmYUKWkue1zBcQq+5yXvyvFrwUBpn31Eo5H3ANvs8qM
	195THhYtUXWdVQkMVcfzvLifxBPBpiMJigScrSs6uLQOIVB5endwwxig7w03NO6J0l+0w4WEiP/
	IZVx0y3v5cFBcAT+xTUT2oxd6sBcFs1ZZHaOQWmB1wHAyBBV01x3AtHRI2BOC6r0BGRtEGamMYl
	1Sc2J4cBaBMHHr4Y/2K5lsxRhJLz/5e3fTpY9576wHlRYHg==
X-Received: by 2002:a17:90b:2891:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-3933b916f3fmr521704a91.10.1786651769656;
        Thu, 13 Aug 2026 13:09:29 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc37202sm10012289eec.20.2026.08.13.13.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:09:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 28/80] python3-grpcio: add python3-wheel-native to DEPENDS
Date: Thu, 13 Aug 2026 13:07:42 -0700
Message-ID: <20260813200834.1302829-28-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
References: <20260813200834.1302829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Aug 2026 20:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128972

setuptools3.bbclass and python_setuptools_build_meta.bbclass no longer
add python3-wheel-native to DEPENDS by default, following oe-core
commit e546c697b7 ("classes/setuptools3: remove wheel dependency"),
since setuptools >= 70.1.0 no longer needs the external wheel package
to build a wheel.

This recipe's pyproject.toml/setup.py still declares wheel as a build
requirement, so pyproject-build's --no-isolation dependency check now
fails:

  ERROR Unmet dependencies (checked against .../recipe-sysroot-native/usr/bin/nativepython3):
  	wheel
  		wanted: any
  		found: not installed

Add python3-wheel-native to DEPENDS directly to satisfy it.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
index a5d77d952f..a926ac2baf 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.78.0.bb
@@ -20,6 +20,8 @@ RDEPENDS:${PN} = "python3-protobuf python3-typing-extensions"
 inherit python_setuptools_build_meta cython
 inherit pypi
 
+DEPENDS += "python3-wheel-native"
+
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
 # unbundling abseil-cpp needs work on dynamic linker issue

