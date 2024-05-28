Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8220BC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 16:11:43 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.26277.1716912697091801347
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 09:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=XMMgr+vA;
 spf=pass (domain: linaro.org, ip: 209.85.167.51, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52388d9ca98so1740426e87.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716912695; x=1717517495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gX1jn+9i9utpvyT+upxfvE/j0o3E9xv42Ymp+X9eh+o=;
        b=XMMgr+vAVko7Tv2aTQScE+rLy6onRJ/4HUhjKihFoSKkFuJ4V9s6VPB30PwajuYW01
         RAmIfIHpPaGaI54+WtcsHg9K6gKSRKKY9f8MX+lpkWPWZnsplw/vPhhOl/ff5OyjWK94
         FQdiCPQwEQaYe+N77GPveM2Bl6R9xQJkQ0/I44KDSZuNNon9xyLL6FbWpg6Uyc5JlyL3
         vbVAlfL39e82Y1yurPle2QU59HHZw4X21bQgT+avpvYPRb/+4MEfJobyGVMq9z74Id3c
         Zxze7GdpibtXqmgTMLN7CTa2/AdOGVDnghRxmVEg1gbO5ot4NXcX5jkDT7CyUKgKFzXz
         zG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716912695; x=1717517495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gX1jn+9i9utpvyT+upxfvE/j0o3E9xv42Ymp+X9eh+o=;
        b=Xb9bPhVBPHSuhnFMwgwxIxkGmSIE6N4NDItnsesY+YqEXY46t3qBiU2LtQuknXVqkO
         KDmCGcNpAb7DnZTx3goBNYO/qBrbgnab15Cc+mnId81WlSJYTPZR+Lk/8Wwzl6Tg4NaF
         ELqEBbEub66HvqkXxe751ukvLhNtJYxQnomfc8rFR5j53kCwOm9xOcP0SerfOFbyTbon
         q1wFCUyYJIZw2AcgwEI3ptrW8fxu6yE+oHMAOChFnihsTvYbjf9MzUAYowxO7yLcJC3m
         BcOcpBQdq7SxOQbhrrOuFXS9zbwCO2LamOyumwHWPv3A13q+sjrWiW159ckP2fLq9Xo3
         ZOVw==
X-Gm-Message-State: AOJu0Yw/EoLlHuwyYsOb0U2sH3q97MAxwJCm5O2SrtlC7FZj0wl/jPWw
	uTYREm/qgysW+cDN2+uz7GDNenSWIqTHrcVYSNy/ECyqZK7rhr/OjG4U1lx5WyqdDjBi95Hf44q
	F
X-Google-Smtp-Source: AGHT+IEqav26HCljOxBa4EGLTIaM+2BCpylXuhnnr9eZRDEu1Fu/Cf6bZKOuD+x7ATiYVbpkIIrmxA==
X-Received: by 2002:a05:6512:2813:b0:523:892c:9e0 with SMTP id 2adb3069b0e04-5296600670bmr12686916e87.41.1716912694876;
        Tue, 28 May 2024 09:11:34 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529b5cf35f1sm510453e87.186.2024.05.28.09.11.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 09:11:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] android-tools-configfs: Fix build-time warning about S being non-existent
Date: Tue, 28 May 2024 19:11:33 +0300
Message-Id: <20240528161133.3767471-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 16:11:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110595

android-tools-configfs doesn't have any checked out source files, which
results in a warning regarding S not existing. Fix the warning by
pointing S to ${WORKDIR}/sources and UNPACKDIR to ${S}.

The warning text:

WARNING: android-tools-conf-configfs-1.0-r0 do_unpack:
android-tools-conf-configfs: the directory ${WORKDIR}/${BP} (<scrubbed>)
pointed to by the S variable doesn't exist - please set S within the
recipe to point to where the source has been unpacked to

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Follow S = ${WORKDIR}/sources and UNPACKDIR = ${S} as it's done
  everywhere else (Khem Raj)

---
 .../android-tools/android-tools-conf-configfs_1.0.bb           | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
index 430b53c4d0cf..a91229f90878 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools-conf-configfs_1.0.bb
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


