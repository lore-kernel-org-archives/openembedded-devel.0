Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BB33C25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 22:18:16 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.7194.1717453088415751881
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Jun 2024 15:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=UZvYf5K8;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e724bc466fso57266411fa.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 15:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717453086; x=1718057886; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8dS1Y+WP0o88n0fehnv1pwvO7+0rlkChQlcIYAVBOY=;
        b=UZvYf5K8AuNs2sK2aRxLNu04yvT6cQnC8mKRUm7zGtLL5NDQXjQ5gBA4/zHhtoFL5Q
         SOnqDTMdKkhj/EPXulopPDslwKEZqcfExrGVBZpbShadsqloMmlhB9ZdDiUcnVt160CC
         pBcuEA/irct/2jcWPBfV4+vYuAEZEzsLrBrnt2DR7/HZzIQPrWasr0LSp1afWNT2K38x
         /Q8TjzXoNIuVZEQcm6hTb49Jl5nUqaMYtPYOQkAzhzZ0jCYs8g7OvuGqJL2dF0e/jrA0
         Q9xdeLoqq3qUI7SFTmV4rjaNrElWs16gjkxj2dLR+XBMm2VrBXXfr+7V54t8Mou5Vi5x
         jR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717453086; x=1718057886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8dS1Y+WP0o88n0fehnv1pwvO7+0rlkChQlcIYAVBOY=;
        b=Edvhlb/7GYTBkieQFeoLb+GWnbE5vcFKqguaMzVJ6/FeyY/0Wig4wy42O1YG/Tjnef
         SJBWviTWN+MME6q3e+hzu4MhIvmmOLs186cQec2BeVP0fPZPcb+v5AWfafRwI6o5Oz2Z
         xo8VzjznE93s8e4v7FotYTw2wcHH/iZK1qRPn2pDQSLOBvzV+H0o0818NVZLtbI6HHCs
         pdaAUcU/RNAHHnR7T2ftbSZaSNaegwn1qDuYCC/HOp/PvOmCV6LbkZepUiqrKWI2HHA4
         gsGwPvZx6SVT7jgPNLytVwD7fDuZVyNhPrX6RsyKOZgRRIXTzv4NxkecXAbRnaQHph5V
         jfBA==
X-Gm-Message-State: AOJu0YwBREK4hNmxZAV4gFPiDu9YGduFK44I411W2Zw0DseAnOe76G/t
	Tbum5gzH8LZMez4bn1KdGrMrMtMgsqQ3m9h2XyRur5Qw8FpWFzIkS7ElETD9J0havO9Sgyh879r
	W
X-Google-Smtp-Source: AGHT+IFIJkXCuDJofm7i4btVrGWLlg/f8/C/sSzb15Juf7LSL9yNfKYdtpBkDLaaEa+slWc18O/fPw==
X-Received: by 2002:a2e:be1f:0:b0:2e5:67a8:10f2 with SMTP id 38308e7fff4ca-2ea951fc618mr91754491fa.44.1717453086057;
        Mon, 03 Jun 2024 15:18:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ea91b9d65fsm13668861fa.27.2024.06.03.15.18.05
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 15:18:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] android-tools-configfs: Fix build-time warning about S in a second instance of recipe
Date: Tue,  4 Jun 2024 01:18:05 +0300
Message-Id: <20240603221805.3807991-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Jun 2024 22:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110677

android-tools-configfs doesn't have any checked out source files, which
results in a warning regarding S not existing. Fix the warning by
pointing S to ${WORKDIR}/sources and UNPACKDIR to ${S}.

Fix the warning for the selinux-enabled recipe.

The warning text:

WARNING: android-tools-conf-configfs-1.0-r0 do_unpack:
android-tools-conf-configfs: the directory ${WORKDIR}/${BP} (<scrubbed>)
pointed to by the S variable doesn't exist - please set S within the
recipe to point to where the source has been unpacked to

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../android-tools/android-tools-conf-configfs_1.0.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
index 35b3a5c08b6b..86b0ce0778f8 100644
--- a/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
+++ b/meta-oe/dynamic-layers/selinux/recipes-devtool/android-tools/android-tools-conf-configfs_1.0.bb
@@ -3,6 +3,9 @@ SECTION = "console/utils"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
 
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
+
 SRC_URI = " \
     file://android-gadget-setup \
     file://android-gadget-start \
-- 
2.39.2


