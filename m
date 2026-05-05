Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D795DCD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 15:07:10 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41917.1777993622456748119
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 08:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ohqO9qq8;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3650453fb28so2356436a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777993622; x=1778598422; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZkI4ZU8Le/3SXqwQcUiSGEePdgqx84ZmyOghTn+cQe0=;
        b=ohqO9qq8WryZW+SuREhTRSEBc3PwhTDHj8S2p9wQ1VIjkSOKA6qD64G77GNVFQhWak
         2Q7ItpXb5dbVo7yDzIeNnro4Icc8ipz7G88dS1cFCNnk52K7vykH3r4w1Zp7b3kD4DhB
         dzWUeEKjsVfiAjNf3QPP1LaPRUY+V0nQxdRHChNdZMse36kLez4/t8QvAQZO1qJOiMTe
         P1pyIarMIm4GhE/WUGSCuHd4WNW56ktJkT2ZYlVtTh87FFBYsxFJVyTdy81p7MsQ61oB
         yhyfBcKsA2kCIahkgwXhV8IqYO4ed/yFR5URwkmUhJHyWQO7ym52vq8tC/wE34BZw0yR
         ooNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777993622; x=1778598422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZkI4ZU8Le/3SXqwQcUiSGEePdgqx84ZmyOghTn+cQe0=;
        b=nHl7tatRrewP+PGEzEZvAhNPuLuQNgPbH8ANLF+qCT+9e5zMeTor/E3HAj7sHZ9hNZ
         xmqvTn9cagHjvu+BN1VPPfRsWMVqPfAdpw26birKDzZsSZvaPkof2KjQNJ3AFYEAcYHg
         i5/bhFD1mtfI93JAsCsuC1xT72uc5Vd2VlkD/mAMJ5/KuBEw6BiaJUAsPnmVCJiUbHvb
         nNoAwZj8mmjE7nZePaQMlPCDEO2hJoEQ+2OW+Vua/JY4v5soR4yI+7VPauyRfwb4tlm5
         RVgDA72pJ7R911kek1Om6ZylhrFkpZbFgaDiKp7Nf6WxpkpUBDmYEsP9yvel6vs2Yb7G
         Nz6Q==
X-Gm-Message-State: AOJu0YxZjDbY8+yPu9NqtLvywsa98ETjeHG2lgz66QVfRbBSy1K1nuz9
	MFMdM2IYhm/JYk7lt+tuTAGQLYNuLeAp5ZbGfTDZs1FzHYOGJ1NUJxTErTfUNg==
X-Gm-Gg: AeBDievSMzOs1z1Mq2pMrvlF06SlQBJCn68+OQSUCWTyX2ZD60DlPWWR32iMfKvEbaZ
	fbehRKbARxkh1RkVjGVkHiSwL4aT2c1MPzn6gZD5M6IUGmv2ceDsmRvXaN/toFhZ4es1RsHISFr
	PyXz9zY44Kpcsz+9F/ITT+JvlrV3lUKXTsdT5hxdPeDJxRsmQrsi6ShzOVrfcRGz1A6Fr6q9By9
	YaDxdP5HXCrXwMj150lvx2eC4R84F+WkvExuDGwAB7AvjXU6NuzCGMFEEpCFk1pCzYaEUBnvcvo
	EDKDHsfsPiJ2A9Wo4i/J6/11WjupDFe9iaEzb0zZyHxFh6MeAGUpPLvQUckGzH+1aQY87eZz/5S
	YR5GV4oN8E+3PaVQaoU4xUlU/7dR/UooM/9WlgHR8LcfgYF6vMX6h0MlHHJPmlQ/U6EsHM6VvLp
	jHwg75UQr44Ek=
X-Received: by 2002:a17:90b:53c6:b0:365:3154:7b1 with SMTP id 98e67ed59e1d1-36577613d3emr3682276a91.26.1777993621315;
        Tue, 05 May 2026 08:07:01 -0700 (PDT)
Received: from ashishkumar.. ([2406:7400:94:f3a8:779c:1a0f:5ac1:14ef])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364dbeb2db0sm20957092a91.10.2026.05.05.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 08:07:00 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v3 3/3] android-tools: removes selinux dependency from android-tools_29.0.6.r14.bb
Date: Tue,  5 May 2026 20:36:33 +0530
Message-ID: <20260505150634.192651-4-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
References: <20260505150634.192651-1-emailaddress.ashish@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 15:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126791

From: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Signed-off-by: AshishKumar Mishra <ashishkumar.mishra@bmwtechworks.in>
---
 .../android-tools/android-tools_29.0.6.r14.bb                | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
index 3d4e95b496..b3a3f78254 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_29.0.6.r14.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = " \
     file://${COMMON_LICENSE_DIR}/BSD-2-Clause;md5=cb641bc04cda31daea161b1bc15da69f \
     file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9 \
 "
-DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip libselinux googletest"
+DEPENDS = "libbsd libpcre zlib libcap libusb squashfs-tools 7zip googletest"
 
 SRCREV_core = "abfd66fafcbb691d7860df059f1df1c9b1ef29da"
 
@@ -191,3 +191,6 @@ FILES:${PN}-fstools = "\
 FILES:${PN} += "${libdir}/android ${libdir}/android/*"
 
 BBCLASSEXTEND = "native"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
+PACKAGECONFIG[selinux] = ",,libselinux"
-- 
2.43.0


