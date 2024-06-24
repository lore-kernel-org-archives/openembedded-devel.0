Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4062C2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 15:32:02 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.143905.1719243115325938352
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 08:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HNP21r+l;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70679845d69so979572b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 08:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719243114; x=1719847914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I4Ooxt/l5uFSLkdmipxLzQ5h85VKyK9yY8RVDJHxOV0=;
        b=HNP21r+lpUm6o0GEnU5xut49Em8bjdfU2/+YbOO7dgCP+KtRO9ggTb2aYrNgyLz9V3
         lgiyosKhgu/bWxEP2eanYYyy8sfdi1+K3bqKA76wrV8w7u0HPSfQGTmTp9nBA8BDD0Co
         1WgnohXHvejf1wVukO3UMgYaDZlrVHhT1XzRhhrR4o7PvSB/x2OBGpyX2Kgg87/7SWxv
         Q2XWkuxMSqiVzwUTaGq967klzLJGkd7mwj83UmFx+4tkJjtAq1l6G3BOFL7Dxl4pR4xQ
         6zmJOxBtI0n1D38A4Sbvk3EE2Qm2u3dTr0Gw1o1Pw21ffvWAaj+VuIOLz5gMXM8EmtvC
         8X2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719243114; x=1719847914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4Ooxt/l5uFSLkdmipxLzQ5h85VKyK9yY8RVDJHxOV0=;
        b=cmX06wVTyluAIWd2m+F6iU4BneUZBb4KgTf3a1COusJr2ooii1akO1mvFY55NtO2Jp
         CCKFbOpTasj4TLcA4DTtBT5ucH4qXdxrk/etnNtBWNVcKss62lWMgiTS1q3PWfPg1OF+
         nBOIsbSO3b2s28Nd2clyPGvEi5zYa2QpvPctdbbneIxf949rNEPLwoisl9+9MCAevWtr
         M+yTP8G5ox7Lh8Sp/Vjg1QQLL7YV39QpQP/4bKNfTdM2OUMXMjlsu/RuwrtBi36fozO4
         mYKhqkDynaKfmlV0dcIMJmyF/c3F4OO/unq2rrvMnC1Fna4yeS2roVGe71NfYEif1KPT
         N3xQ==
X-Gm-Message-State: AOJu0Yxz7veB4u84od/BfBwyHubn0fyCX32ci50aDtFpmrl4ExlfMqQa
	uDvs3EcMW49IZq/QlqRq3NwbsvQ69zBgK86J/DFBJHjl2lfJaq9gSxWddQ==
X-Google-Smtp-Source: AGHT+IGwaX27MpRpg21S4ADd/1lQkZ/u9rolGOsMMbJCsEFAwqOCVyZaL/2zn8jRhwpCa/CMR2pGCg==
X-Received: by 2002:a05:6a00:2da:b0:706:3454:7d8b with SMTP id d2e1a72fcca58-706745bbb47mr3850583b3a.16.1719243114209;
        Mon, 24 Jun 2024 08:31:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::6284])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065107ac5csm6337406b3a.34.2024.06.24.08.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:31:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] tipcutils: Replace WORKDIR with UNPACKDIR
Date: Mon, 24 Jun 2024 08:31:51 -0700
Message-ID: <20240624153151.1859490-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 15:32:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111002

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/tipcutils/tipcutils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
index 580d03cbb5..71b62cc513 100644
--- a/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
+++ b/meta-oe/recipes-extended/tipcutils/tipcutils_git.bb
@@ -46,7 +46,7 @@ do_install:append() {
     # Install systemd related configuration file
     if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/modules-load.d
-        install -m 0644 ${WORKDIR}/tipcutils.conf ${D}${sysconfdir}/modules-load.d
+        install -m 0644 ${UNPACKDIR}/tipcutils.conf ${D}${sysconfdir}/modules-load.d
     fi
 }
 

