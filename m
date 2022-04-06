Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7A0C352B6
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.7322.1649244888615608348
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iRjzXM6h;
 spf=pass (domain: gmail.com, ip: 209.85.218.52,
 mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a6so3746918ejk.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Apr 2022 04:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opnnZV1NSQ5Q46oA6B0w93nDGj8MGY6LkliTO+/rXhE=;
        b=iRjzXM6h97ojzTykLqR5nhTb5jy5m1JiskSbNdwJoKg8SyO/FAUJlAKKkerQ+9bTeY
         ygbzktihKhQZ3faaCIHv8Ng4w1LfhUK9kCifmAq91SlFnB1T/Te77Wm3+4LUctamdEE2
         jywLADpISEmC16xdXCA6BZ+H7xLYjJRS6zHSr7OAnc8GRGho9izhORUh/Q0udQUD5o47
         9+T2yD1Z23PnLvKkHvAwmuBufd9fl93Oc2bHj0IpOHGD6dQHpyGJFCjwNBM3fpP+4kjU
         jJ5eGuJIQ0HHE1KgPqmc7a9a6GQMB5YH0bZZ4/NWyoT5uNURSSmkCJfNidUnV0ovi/UA
         5YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=opnnZV1NSQ5Q46oA6B0w93nDGj8MGY6LkliTO+/rXhE=;
        b=TXil/QHfaW8qj7cqp+aYi0bq7L/zQPQTYRKWPx0zsYE7TrEwuGl/WWK47muTSR2E8J
         cVnPDvcLp3Mqw3bBPST7nnDcNHEAMuOtNbt2zOaR/Y2B8tXMz2W3fh1cS87saTTr6ywg
         +F81jHoti9qYh7g13vZJvymj9sJAL1oJAhPPItUCphfIVJcQqlF/K6EgjXGdr2igjp/U
         Kbl/e6bHlEMMqi41EQ9dBEhC71RpCbsJ4FYNPSValhR4nsgkyVJCsS5krro4bftj8RX3
         JiM+y0sxlpTy41UU/jKCYJBCAiqvJsfJowCzm0XV0NclljovmUTB/vurTT8fdbHm2OYE
         fFdg==
X-Gm-Message-State: AOAM530mtC9crtZFNP7+J9QysfSe5VwCUYQCjtaZ8hoLTWDnGB3B9GBB
	TaK1mfxfIgHO19iRIgItjzRwepa2jpE=
X-Google-Smtp-Source: 
 ABdhPJyW/5ALonuVwG+vx4UAkL84LkfPMkue3rGlzrScqE4ENbMUdSrRaks7yMvh0MJaQoReeBO6UQ==
X-Received: by 2002:a17:906:c149:b0:6df:f047:1698 with SMTP id
 dp9-20020a170906c14900b006dff0471698mr7848193ejc.16.1649244886701;
        Wed, 06 Apr 2022 04:34:46 -0700 (PDT)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.69])
        by smtp.gmail.com with ESMTPSA id
 dd6-20020a1709069b8600b006df08710d00sm6638035ejc.85.2022.04.06.04.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 04:34:46 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] srecord: build fix
Date: Wed,  6 Apr 2022 13:34:34 +0200
Message-Id: <20220406113434.533132-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96438

build failed with:
ln: failed to create symbolic link '...srecord-1.64/configure.ac': File exists

As expected, the existing file was a symlink pointing to etc/configure.ac

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 meta-oe/recipes-support/srecord/srecord_1.64.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/srecord/srecord_1.64.bb b/meta-oe/recipes-support/srecord/srecord_1.64.bb
index 85deabde1..5765272ce 100644
--- a/meta-oe/recipes-support/srecord/srecord_1.64.bb
+++ b/meta-oe/recipes-support/srecord/srecord_1.64.bb
@@ -21,7 +21,7 @@ inherit autotools-brokensep
 do_configure:prepend() {
     # To autoreconf we need the script in ${S}, we can't tell autotools to use
     # etc/ because then it can't find the Makefile.in
-    ln -s ${S}/etc/configure.ac ${S}
+    ln -sf ${S}/etc/configure.ac ${S}
 }
 
 PACKAGECONFIG ??= "gcrypt"
-- 
2.35.1


