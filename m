Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33419C433FE
	for <webhook@archiver.kernel.org>; Mon, 27 Dec 2021 20:38:17 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.30773.1640637496417445073
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Dec 2021 12:38:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hIxuy5nM;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id co15so14250085pjb.2;
        Mon, 27 Dec 2021 12:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=91L+wDN3j/fKvvlF2I5tUQs78RVYFi0RRvbAUFso+xg=;
        b=hIxuy5nM270xNrrB7w1Gr0aAsTtNx+F2cgU5MAMzzTKZP/qNAMad/ElVJ7cAURZxzl
         EX1xZU+H8T+NC2c589Y0QnK7Oy9eeC93c9eyBm+CQIWmEY34fUXuEnXhHllLIBhf3rxm
         hkm64Y4qsu3P8TyV7nkAD/R89nOBog0oOZgHIQ/zEJthUWMx5QFa+FsJ1ylNg+OvwDQ8
         1yMYnnFd5HCNR8dTw2ZuCmxchNzaG/aeY9z8LKjkvpioqv3xRyCfwBbpE4Yg7Auwjlb4
         6Q/CU6h3loTjciG3itrbA3XG4qIk9WiR86YsyslIiUuN5Hv+xSpPlEmSmEdeuRQXE3CM
         pD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=91L+wDN3j/fKvvlF2I5tUQs78RVYFi0RRvbAUFso+xg=;
        b=eYFI6qGXyNMPF4Osdei0cyIpFGt2Lp549QuwLDjNQnptcUwoU3Aedh6vnT1UUjoQ3A
         wStCeW0XPO2TvlOU0JVPOTbePimiilAa7mfxqGojJIvY6R+THs5hFblxCu55uz/DYA2J
         F1OwMnxOBU8FbdOBQhYCqA2TVgnGgR/i1i/zSfwDqqVOunB49u0Qwbp1Xl75BixbcevG
         Tn0WxxbYI5U/Nq9nzjn78Jve7+M1rTENJ8E/vbapNttOtIuTK/so8WiEWxVMB49nh9RY
         96zlWBsSuuFOHqKFnjehvRifjRqMkkP2GFatbZPHry2D10o4xR3EItUk6BxPOvQsmtwW
         OouQ==
X-Gm-Message-State: AOAM530zWovzb54tqqT1/i/xJvs/tM6t0rlUwRnd2fz4jWrlM0tmWASg
	IBlXKUGTdChR6SyiD9eUOyqm8+1YbaE=
X-Google-Smtp-Source: 
 ABdhPJwIrWaOHU33MWrR2JgemJp3AW5SVn0w5fB27rU+P5Sc+T56kX2qJi/iuhtRD+OBhAg8er0EuA==
X-Received: by 2002:a17:90a:f196:: with SMTP id
 bv22mr22661703pjb.155.1640637495800;
        Mon, 27 Dec 2021 12:38:15 -0800 (PST)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:67e3:bc71:b585:c820])
        by smtp.gmail.com with ESMTPSA id
 br24sm19962896pjb.40.2021.12.27.12.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 12:38:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: "Armin Kuster via lists.openembedded.org"
 <akuster808=gmail.com@lists.openembedded.org>
Subject: [meta-networking][v2][PATCH 4/4] strongswan: remove redundant DEPENDS
Date: Mon, 27 Dec 2021 12:38:11 -0800
Message-Id: <20211227203811.481782-4-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227203811.481782-1-akuster808@gmail.com>
References: <20211227203811.481782-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Dec 2021 20:38:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94520

From: "Armin Kuster via lists.openembedded.org" <akuster808=gmail.com@lists.openembedded.org>

drop openssl and gmp from DEPENDS, covered in PACKAGECONFIG

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
index 0466b1d62..2b7a7a241 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.4.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "http://www.strongswan.org"
 SECTION = "net"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-DEPENDS = "gmp openssl flex-native flex bison-native"
+DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
 SRC_URI = "http://download.strongswan.org/strongswan-${PV}.tar.bz2 \
-- 
2.25.1


