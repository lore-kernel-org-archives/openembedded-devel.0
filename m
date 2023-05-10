Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE22C7EE22
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 13:33:09 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.16903.1683725582728575463
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 May 2023 06:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s3Mhacz2;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6435bbedb4fso7808119b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 06:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683725582; x=1686317582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eqAUDQC2PzHuacSyX5+zjcgmJOf7n+dWcGwbs3vFeRg=;
        b=s3Mhacz2XcVN+e4qEBVrRRKDbquuFjeRMF+0C4FU3i4it+1aeKzKfdi18e/6eRPm6A
         1qU6UwxkCFEG/6XRtUusc45Z9VsnE9XG5Yidpu19zpz8GLD7PsE3/aGEYv1cdjfUMmBv
         gZhjoueH50prUBU8kJ6hM2rP8Ch6bWqOQlCodIKvA8XgewfphB1Fq52zJVYUaz+1szT3
         /3+U0AuC9fKFs88sCiyXJKNThFnLH3LJtCSG0ZaXfXUzHi2ZXsKM5q2GCnOeoqF3azGH
         P3CfJ04Ud8Xf28RAmOavJJ3dwgEsB5MS0dmkoVkJE/P38YkjyPowzG2GO1A8GctVojNz
         sLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683725582; x=1686317582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eqAUDQC2PzHuacSyX5+zjcgmJOf7n+dWcGwbs3vFeRg=;
        b=HpEYNZ7BMTYC+CU4zWrdFau/785gwcF70DfRU2l+O3YHe9sh3O4cYy5jBE7EKLdJzC
         PzTyA5FeuAZ29YbFmJC6BehL/o+mcM2GBtG2HAXNTHo3xx2JsnmytWH+e+CKUH/gKol5
         ViTz3VM6Wg5N7et0Y/lVlsgtmEdmg+jgUBTZZqJY11ENDpXg77nLJlwmfexm7VehrC4p
         WHLnpgKzPcMl1gTS3gma3ctqKPU5MfASmk6fE2QrwsHVw6bgkMGW/FHKTt7+6X3xM/j7
         vOndtXQfPBMgxWTEsrX8SsT6CP0R+p0jqxmy6DIWs2zw48shxfw9sM/m0e93uAwHuhP5
         y9bA==
X-Gm-Message-State: AC+VfDxLPsye43WCn0B6xKvP5RQNKWnqqD9MSl3MlJyPP28+krcynCVu
	ZM06cK1okYMSKhkANEfB6F0ec7kdU9baYw==
X-Google-Smtp-Source: ACHHUZ7pGnvxKg/VdId0MmyOxXjB+oDvg+TQeyQrLTkK/80DOKx4qVGmQsRLwc7R+DK2pARamYLQ2A==
X-Received: by 2002:a05:6a00:2d25:b0:643:6b94:374b with SMTP id fa37-20020a056a002d2500b006436b94374bmr26951346pfb.1.1683725581484;
        Wed, 10 May 2023 06:33:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id s145-20020a632c97000000b0050bc4ca9024sm3171977pgs.65.2023.05.10.06.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 06:33:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] idevicerestore: Update to latest on master branch
Date: Wed, 10 May 2023 06:32:58 -0700
Message-Id: <20230510133258.2997303-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 May 2023 13:33:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102530

Needed to pick fixes to build with latest libplist

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
index d7c76a5971..2a0a129fee 100644
--- a/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
+++ b/meta-oe/recipes-support/idevicerestore/idevicerestore_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "libirecovery libimobiledevice libzip curl libimobiledevice-glue opens
 
 PV = "1.0.1+git${SRCPV}"
 
-SRCREV = "7d622d916be16f2df5a72bf53a42f3a326bbfaa4"
+SRCREV = "163a1647dedb7ca4656c0f072e4733573f9f982b"
 SRC_URI = "git://github.com/libimobiledevice/idevicerestore;protocol=https;branch=master"
 
 S = "${WORKDIR}/git"
-- 
2.40.1


