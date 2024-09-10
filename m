Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E32BECE57A
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 13:47:55 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.22193.1725972585625778503
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Sep 2024 05:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XYT48ply;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: tolvupostur@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3780c8d689aso3449480f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 05:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725972584; x=1726577384; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZzk41QRbuoMXIuyoJEfU1bEbZKF4doA6VnY0gqu/Is=;
        b=XYT48plycMhH8cwBeMGbwlfI3yPg6aeRZc9uL49V5ekyZBMk96ktIZj1SY76TseSDt
         aH25qW9MypdtYep8Fr1YVs/TeJ+D3/OSbW5scMUWL0IC8BW9DMO5GQgoI219d0wXfMuO
         6BarbMuJSQZKe2JsfgRmEb5KRsNTiJS8X634u2gSrYvyhiu8snd7UqNuWpCkNMh7h5gp
         e84ckfC54/6E167CGwfIul2a2KJ/P2OqRB9phjmcciyFP+XxYf0TPqVjgJRs/fEhH0pV
         QhD8l09fg5RxpYNdStLx9fk7uO0/hVGqkxLiUi3JAC2wm2C4LHYdgKXRRpgTLnxAmJ3z
         fqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725972584; x=1726577384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZzk41QRbuoMXIuyoJEfU1bEbZKF4doA6VnY0gqu/Is=;
        b=gWUqcc25TNBufV4+OXa/9078pqyAtTjebvGE6KrZ33SJprcYKwC+ZO57e8pkd+LCZR
         gWwz7LlV1Mq4SftX76H6m1UDEEJkAp+DLM369WtVf5SaUINcQLUsnNwEFAAXSybEWPtM
         piRxNujyufaQJ/8zoBMfKcM0QXNQ97tFVPSflvKI6YVEy82tRxg0mzFrKCYUidkIWsQZ
         mTmQoz4qpvxqdy054FIixfdxf9a9Q5VCkp+U23KlV1hBYggsWht78LRrFe+rTh5JCAvs
         uRyRb2y21qd7H1J++Yw3mHQpwZDwh3dd3xH5mwF+ElUFCKRQxmWWjQMO3DoMMULVAn2R
         xJNA==
X-Gm-Message-State: AOJu0Yw/1i2bsflU7wukewCZnlDLY6tc05g7xw8wudPg+IFuuD9aFoxu
	pHjd3SBGfBRfkFdvaeVeSNG3Tw4zSVU88p0dCItZuDHlrmSRlMWiBPhn+umbJDo=
X-Google-Smtp-Source: AGHT+IENKh/njCXpGdmbCYNfPz9sR1dVOLfyEi1zMMCjfQA7Bcb9RszoVf8BFQwgLZKqTuAVbq64rw==
X-Received: by 2002:adf:cd8b:0:b0:374:c621:3d67 with SMTP id ffacd0b85a97d-378895db8f5mr7908687f8f.24.1725972582885;
        Tue, 10 Sep 2024 05:49:42 -0700 (PDT)
Received: from vision3-sde.. ([213.255.218.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564b02asm8964642f8f.4.2024.09.10.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:49:42 -0700 (PDT)
From: "Einar Gunnarsson" <tolvupostur@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Subject: [PATCH] yavta: Update to kernel 6.8
Date: Tue, 10 Sep 2024 12:49:36 +0000
Message-Id: <20240910124936.21220-1-tolvupostur@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Sep 2024 13:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112229

Additional changes:
Use https protocol for git fetch
Build with meson

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 .../recipes-multimedia/v4l2apps/yavta_git.bb   | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
index c4f31c033..db00c67b1 100644
--- a/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
+++ b/meta-oe/recipes-multimedia/v4l2apps/yavta_git.bb
@@ -2,9 +2,9 @@ SUMMARY = "Yet Another V4L2 Test Application"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master \
+SRC_URI = "git://git.ideasonboard.org/yavta.git;branch=master;protocol=https \
           "
-SRCREV = "65f740aa1758531fd810339bc1b7d1d33666e28a"
+SRCREV = "323facd1d5bd6251eec70dd5c1484a12ce01202a"
 
 PV = "0.0"
 S = "${WORKDIR}/git"
@@ -12,16 +12,4 @@ S = "${WORKDIR}/git"
 # Upstream repo does not tag
 UPSTREAM_CHECK_COMMITS = "1"
 
-EXTRA_OEMAKE = "-e MAKEFLAGS="
-
-# The yavta sources include copies of the headers required to build in the
-# include directory.  The Makefile uses CFLAGS to include these, but since
-# we override the CFLAGS then we need to add this include path back in.
-CFLAGS += "-I${S}/include"
-
-do_install() {
-    install -d ${D}${bindir}
-    install -m 0755 yavta ${D}${bindir}
-}
-
-
+inherit meson
-- 
2.43.5


