Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E807C4725D
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 23:56:14 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.3237.1705535773654860499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jan 2024 15:56:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HQ8ztubB;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e90163be1so483125e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 15:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705535771; x=1706140571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xxS9QsUTFmYJdlhgkB70Yt01VNr7ke+iN1NzSyC4C8Y=;
        b=HQ8ztubBMvsRboMFlSa4h/O2K+fJpvqmPqHWtKl4oPtyuMoLyUPQxiT73nBmZ10XJr
         ngNIU+QpL3qTGsJjMiDsgT6Mp1+d3JOYNdUyWOXg1stlAUo4BnTh32/zVKc4AeOfTrFD
         xesaxZelXZRAaIcgtf3EPon18XrFgPt4X0nRk8/WyY2ZET2HfyVVOZcdrXRur00BJGM2
         rqObbL8CpS2yqYTkJfcnyi9/XYX9Fm+XCzdXAmvHQ2EYmSWj4iRJECVvjgfOY4bBdnAn
         dhIqdLPMH/BOofas/UICIBVgE3W5OSVwLKBm8Bhm9Z92mpOS+ainkrm82sYiaB8CPymn
         WXCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705535771; x=1706140571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxS9QsUTFmYJdlhgkB70Yt01VNr7ke+iN1NzSyC4C8Y=;
        b=rgUEdtiUs0DVHuyk/NGYwUhat0Rv0mPvzQ3ZttZ+W8YNhsvPTUwrnMouU/bX9sWiqA
         g4qPaNNunvvk6rdJL3D9myynCAWQ+kg+/mrvoSzApjKwTBXJ6DQgrfg4IFb+KUys0Bd4
         K5JsoXuXdxlXwYeX9dmoz+n2vYxeYVd7YxjoHcH5xunEQp11jGu7rbr6EXT+Ewf3Z0j5
         tcSYhX85bKCGasqp+G81yVp2ZJQaKd89x7pbNfLBRXh6m00785jkTg0jhlFK3bjBI777
         mXrw2Vm6VGfhZ4Q2q+SUQwx4L/dLCEPp6z9iJEkYA52zqlCARRoaffz80eyKNl0NGqPr
         yJtw==
X-Gm-Message-State: AOJu0Yz0mJRJUvxLhNthd3uZRCeGvmsk8NfCe2/y8mMTAWfDOmJu1L55
	6q1Cxk4VrB+dKn7enBkl9qQTsht/qVA=
X-Google-Smtp-Source: AGHT+IGs6Ty0thPoWXACG4E1qQRQahwhLw1Kieb/K1TqV+NhPK1qTnp6ujx9aB+HQeDQsD2xQJh7+w==
X-Received: by 2002:a05:600c:6a85:b0:40e:48e8:ee05 with SMTP id jl5-20020a05600c6a8500b0040e48e8ee05mr3011345wmb.92.1705535770753;
        Wed, 17 Jan 2024 15:56:10 -0800 (PST)
Received: from localhost.localdomain (cust-east-par-46-193-64-76.cust.wifirst.net. [46.193.64.76])
        by smtp.gmail.com with ESMTPSA id m35-20020a05600c3b2300b0040e541ddcb1sm24069425wms.33.2024.01.17.15.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 15:56:10 -0800 (PST)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: openembedded-devel@lists.openembedded.org
Cc: f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH] Monocypher: Correct source URI and license
Date: Thu, 18 Jan 2024 00:56:07 +0100
Message-Id: <20240117235607.370589-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jan 2024 23:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108340

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

Monocypher has two recipes and a release tarball in home page and in github

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 .../recipes-crypto/monocypher/monocypher_4.0.2.bb    | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
index e6380d9a2..813c6ec4c 100644
--- a/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
+++ b/meta-oe/recipes-crypto/monocypher/monocypher_4.0.2.bb
@@ -3,13 +3,15 @@ DESCRIPTION = "Monocypher is an easy to use, easy to deploy, \
 auditable crypto library written in portable C. It approaches the size of TweetNaCl and the speed of libsodium."
 HOMEPAGE = "https://monocypher.org/"
 SECTION = "libs"
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.md;md5=6a251155d943c8531e01a139f3fc531a"
+LICENSE = "BSD-2-Clause | CC0-1.0"
+LIC_FILES_CHKSUM = "file://LICENCE.md;md5=ff30a1c41dfd9e6fa559a9e45ee98302"
 
-SRC_URI = "git://github.com/LoupVaillant/Monocypher.git;protocol=https;branch=master"
-SRCREV = "0d85f98c9d9b0227e42cf795cb527dff372b40a4"
+SRC_URI = "https://monocypher.org/download/${BPN}-${PV}.tar.gz"
+SRC_URI[sha512sum] = "bf275d4c53ff94af6cdc723a4e002e9f080f4d1436c86c76bb37870b34807f1d7b32331d8ff8a1aeb369e946f3769021e03e63efac25b82efc5abf54dc084714"
 
-S = "${WORKDIR}/git"
+MIRRORS = "https://.*/.* https://github.com/LoupVaillant/Monocypher/releases/download/${PV}/${BPN}-${PV}.tar.gz "
+
+S = "${WORKDIR}/${BPN}-${PV}"
 
 CFLAGS += "-pedantic -Wall -Wextra -O3"
 EXTRA_OEMAKE = "'PREFIX=${prefix}' 'DESTDIR=${D}' 'CFLAGS=${CFLAGS}' 'LIBDIR=${libdir}'"
-- 
2.17.1

