Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DE7EC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 04:25:08 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.5061.1635827107783217344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 21:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dxrwguqT;
 spf=pass (domain: gmail.com, ip: 209.85.214.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id o14so3910081plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 21:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0mKOv9YXDK9eQw7u4bwZFD/9ZQ27SQoRK2vIulAR3I=;
        b=dxrwguqTA/9rMiC0oC/j7oqS8ZzyNwRXMVbBCWUpUfNPbg8I0JWuKLukm00aJlI/bv
         eMnjYcd+ACQruLI/QsY3qUhqoStAMg3bo/Axa18/BrMQ8FZ6hIoKkHLnXDSECh2yGAlM
         xlXjVgOlerCqvgov8VtvcNSoSgE2z+nT40jazXbD8BRkZKhllZFSngE/ywZoqXzlBuqL
         yP2P/GmlqxVKHN9Y/Zd5eFir6MRJJAzAcopizoUJ2NH2UVl/medM+3S7yEaAJvE1Pzh0
         4f0W/xRPvnqqHYxvgoDUkgdg+mNtZeZ0s+3MXKEgeRXIyrd707OUWAsKd4TpnsEZkw25
         9iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y0mKOv9YXDK9eQw7u4bwZFD/9ZQ27SQoRK2vIulAR3I=;
        b=MUSwziwuP4U14Kc76/0AquIKBR/tNel/10raZE/ja2xBmbbSmdy93JWSh7pAzGmuKV
         I0Ox20ci7+itWr0yEhCLaIvWFycAdvRLuUC2HGlUp0ov6bFrbCwkteV2JAqHaDdx9xUC
         Cb7+kn+g+kUGujBSulV3t7MnI25m69iblnq7isi3UJSWDaHGJP/uu8wONTmHLWJ1gGf2
         4wydgqfnNUOjqdHzBt7e9ru9epT//T8aneVB3wKjhB6VjCOhZqBcLroBG2XuNXfF2z/e
         KDUKyDgSH40OQdqdgk5pUDXvif/jw5TUY50Ca9oNEPIw4ek3G1AQsEt88htAt6OJiLsN
         JurQ==
X-Gm-Message-State: AOAM5301BcBmTF1xHRV+Fk0KmpLMa+iuxla3Hq6sYYrzcXAhhVUUpqIj
	cFeACklOnpBbnIGjBlYQG9KmKmRT1jM=
X-Google-Smtp-Source: 
 ABdhPJwiAOV8FcwLLt4UJRMc/wr2DlRxIxrJgmtza7EgpmkFKCyZT8wRJ/O16vGnzPAnE6ZFD8mq6w==
X-Received: by 2002:a17:902:a983:b0:141:9407:1fb3 with SMTP id
 bh3-20020a170902a98300b0014194071fb3mr27624001plb.35.1635827106800;
        Mon, 01 Nov 2021 21:25:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::f94a])
        by smtp.gmail.com with ESMTPSA id
 e12sm14880513pgv.82.2021.11.01.21.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 21:25:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libjs-jquery-globalize: Use a proper SHA in SRCREV
 instead of tag
Date: Mon,  1 Nov 2021 21:25:03 -0700
Message-Id: <20211102042503.3486832-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Nov 2021 04:25:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93767

Use https for git protocol

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
index a87c5bf758..b6147ffeb2 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-globalize_1.7.0.bb
@@ -7,7 +7,8 @@ S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4db68fb4d1d9986d736b35039f2ad9ea"
 
-SRC_URI = "git://github.com/globalizejs/globalize;tag=1.7.0;nobranch=1"
+SRCREV = "771061fb35f7fd8d7c2c37f5d5bb26115be382bc"
+SRC_URI = "git://github.com/globalizejs/globalize;protocol=https;nobranch=1"
 
 FILES:${PN} = "${datadir}/javascript/jquery-globalize"
 FILES:${PN}-doc += "${docdir}/${PN}"
-- 
2.33.1


