Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A12C433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 19:08:13 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.15293.1648148892875266540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FSmb67aL;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id
 mp6-20020a17090b190600b001c6841b8a52so10256044pjb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 12:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+ZlHdxMX0MeiqoRlglp7EeGmDd1LcPrOSroSiaFEtLY=;
        b=FSmb67aLmE2W5/ZVZUnZALsZQdfDxf5NdApLLXuJpnMiAOqtH52/HAFUlhPpxGgKTc
         yO78Wz7hGQRwAry+Cw54Bgjvgh8jLqaqNTsdM0+GZbl3lnLFgSGJy7BalX+Vp1T6Govd
         NTelv0ENBRCap7HSR8HeKf1VZ6FrFRsOtRXe97pfsbliBa6YKqwLhMQh7DFYq9DciF6a
         oaP/Rf2zu1+KfkX3gM+0jPP+8ckqltIUwG+vWFXOtJjo32BOSW3BteoF76Hpu3Jbmyzf
         uF7PaukoEaO+XeJCS/UL2z4iC7ZAunO+o+Jg90YkwWaHKMmS/norx783EoU/1NV1JWvL
         uOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+ZlHdxMX0MeiqoRlglp7EeGmDd1LcPrOSroSiaFEtLY=;
        b=U4dcoDtoSXqIur6adVyr709/vZ1vXMo/BtgKWygq/+S/KJ8JoBCm68TD1L12mhGP+A
         sI2lBM7C2QwoZjQq2agbEHjZHeoVBCstY1etjKKn2V/qRlov1P7KGWL2MPCRiplVbuMO
         VmRYrmLAO467tuJOSRlbzPgpW7+VSOu8lnEWs8VOdC+rCOkdjUv67cZaiLA0zYwaRLPJ
         inLvg4yviL+PA9cL2WJWEa47TAHzjukldnTgjTcnAgtJMH0tvK2bUDO22nRl+jsmtCZT
         iv5fVqR8tN4DeIsGp9GolDMcM3iU2FOk8iKzPq1VYcX87isD4387Q0nW5qc0SHF8rAfA
         28Tg==
X-Gm-Message-State: AOAM530BO2sc3C0LuBWBMD9mzUI61mwVdBT06noSQKxQykaP7d/3DKOn
	EEaVYYXUXtRe9VKMIRnsKAqR2b7NDLw=
X-Google-Smtp-Source: 
 ABdhPJzQXTvgn8a0ykAHiZsIgAltb2Rwrn39rGPkzaCUasa1NdGdtegv4JuqS2jsEmI9SReCA9FKCQ==
X-Received: by 2002:a17:90a:e545:b0:1c6:d783:6e64 with SMTP id
 ei5-20020a17090ae54500b001c6d7836e64mr20596473pjb.222.1648148892076;
        Thu, 24 Mar 2022 12:08:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 ds15-20020a17090b08cf00b001c6a4974b45sm10029671pjb.40.2022.03.24.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 12:08:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-webserver][PATCH] netdata: Fix override separator syntax
Date: Thu, 24 Mar 2022 12:08:09 -0700
Message-Id: <20220324190809.1934248-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 19:08:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96202

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
index 012efc0682..f575a4cbaf 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_1.33.1.bb
@@ -76,6 +76,6 @@ do_install:append() {
     chown -R netdata:netdata ${D}${datadir}/netdata/web
 }
 
-FILES_${PN} += "${localstatedir}/cache/netdata/ ${localstatedir}/lib/netdata/"
+FILES:${PN} += "${localstatedir}/cache/netdata/ ${localstatedir}/lib/netdata/"
 
 RDEPENDS:${PN} = "bash zlib"
-- 
2.35.1


