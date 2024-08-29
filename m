Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B87B9C8303E
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 17:17:56 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.25955.1724951876069358034
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Aug 2024 10:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Th0X73p+;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2021c03c13aso9067935ad.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724951875; x=1725556675; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N2JlF+NUMIpHYIb03fthTN1xDfPUtyR5Qprm6UblxY0=;
        b=Th0X73p++LNtvzKMvEj/W1PHpGfpKslaARnFTgPmlEZj++F4K9Ro+ENTgXNLg+If10
         hfGOp2NX1Xb9sfYZriVnlqtYxkokAcPFsVjGCxDyswvWcEh5/NdmArkTK0dV9lj6LYXG
         eGBuyT1WpPu8ngViAZNPaEoCnjz6wW4P48tW7Pgt2jrqx4/p5PFSoBPrKPt8buuHpxci
         WYawz/3TVhr2WR2RmdndPwUmwGHAhaiF0ZUJcrPzUfVtZvhYUiKAGvLNa1bR2i7nB5zl
         04M52Aet4011eW8k+omgA8kDrXUVp/eQqzCNFhlEewLhycRkLWV1iCuQA1tHBmJROtBQ
         bi/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724951875; x=1725556675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2JlF+NUMIpHYIb03fthTN1xDfPUtyR5Qprm6UblxY0=;
        b=RHl9f1JyEWYRKgRBCDZifs3OWEMaC9W/9xNNjKkQQlP3jkSHcmkdAcSIZxIATT/zEY
         MlDhXtA5D6pLNK6oL681XqDNVRlYf+1vaiUtS3kYpFiYzd1vRJC/k1lZrdPwHZ9tDTrZ
         P1ktZgXpwciMVCNdpcbd3q/arVECIOuAguDZhBQZa7/mxamj9EcitJrPtoQZOm/rQLgH
         oFjq/tfDvsk8lJ+aibIvd7jDn/PTG22g3KY0ATszbbQx1JF17cPoGM/PVQDFz+c0CrE1
         +zK15AQGs4Uzv0waATUZCHkmYRyGwU12inN44YDnnit/MuNp1+JoyYhJ12Q64ctnS8Yq
         uXfA==
X-Gm-Message-State: AOJu0Ywej34kK32+BxhcTiEq7Ubi4Tnqg+DmwOvhOxxqZM1FYpt49OCl
	GCyreatm6j5otrFW3y+ziuf4gXz0oa5KFfsQaYRioqMajS2SH7s7zW/5+ad6
X-Google-Smtp-Source: AGHT+IG/tB1wL98Qy6CQDYVRAXF9JtfwLtzp5meH/TbqW8U1dgsXjxtIJ5meCtfP92GTO/H9Fw6uhw==
X-Received: by 2002:a17:902:dac8:b0:1fb:77e7:27b2 with SMTP id d9443c01a7336-20516776c11mr38657295ad.18.1724951875116;
        Thu, 29 Aug 2024 10:17:55 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::2696])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-205152b13a3sm13887465ad.44.2024.08.29.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 10:17:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] gerbera: Upgrade to 2.2.0
Date: Thu, 29 Aug 2024 10:17:52 -0700
Message-ID: <20240829171752.520411-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Aug 2024 17:17:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112038

Fixes build against fmt11 among other things [1]

[1] https://github.com/gerbera/gerbera/releases/tag/v2.2.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gerbera/{gerbera_2.0.0.bb => gerbera_2.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/gerbera/{gerbera_2.0.0.bb => gerbera_2.2.0.bb} (96%)

diff --git a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.2.0.bb
similarity index 96%
rename from meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb
rename to meta-multimedia/recipes-multimedia/gerbera/gerbera_2.2.0.bb
index fea14fd840..da2953ef21 100644
--- a/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/gerbera/gerbera_2.2.0.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=25cdec9afe3f1f26212ead6bd2f7fac8"
 
 SRC_URI = "git://github.com/gerbera/gerbera.git;protocol=https;branch=master"
-SRCREV = "2f26e656b16fb86132f27d1f8d47c6055041430d"
+SRCREV = "821d364d611dc30b3ef8a5e9beb0bf3e71b25199"
 
 S = "${WORKDIR}/git"
 

