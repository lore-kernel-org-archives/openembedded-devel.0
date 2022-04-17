Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB2CC64E65
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:00 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web10.30246.1650211000868042115
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 08:56:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cALN4+QR;
 spf=pass (domain: gmail.com, ip: 209.85.215.177,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id t184so1727342pgd.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Apr 2022 08:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzUlhnQExPD8A4Xq2IopR51pKZlkjRZWL0RBrEovNCE=;
        b=cALN4+QRQyy3mGKBwiUoyt9wK5dfgZZ85O+eT3vnocpS1Jcon3yoiXy+y6qSDK6iaB
         QzettY7GFpS3rLjQyQIrETBvqkMCcQq2bp4SG67ZGWVWuN9+koqvzWYMgs9Y1yNLekp0
         5uYp5AMB1LFVkPHRBl/dW8k48VWYhWL5PdV58N+r2RJcUYDtL5z2+3Xr9hyBZPhfAdwx
         84WWhGAhQK6iXzl0BpXVJ+gAn4oo3D65UDh+7GaoASPk3qW//qOLai4HssAekofcnUi1
         6SJs2C0iy39TqnPyQ6JlkyaIOqiCT165LPEX6e8hQpxQ1OKLi2OqJwz2tdVqHATK9lgO
         gKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zzUlhnQExPD8A4Xq2IopR51pKZlkjRZWL0RBrEovNCE=;
        b=RMQNutnyp30bnfWtzohCtwFXjWcg3XVpMxO7PNGJGYp+zjPg1v3+TL7s7WF5Tj2oVd
         FZYPUZStmmlgX1ZjRBRS798TPSqsOMkDSqxg+m9uoqXbRRilisIVV8gQoTbWzpt4FGlW
         Uc5c6Dvtl50OPzgsj4aK56zv7+lyBV21B36MR/VJK+A7cvydsXDU6RV2ENyM26LqiQ3A
         H/it35XzA3IEmVJ/bWMRXdU/lnU6+spgh3rjnJu4Igiw7cfR2KCUI9+yKoLLEgzPAkne
         8NDv8Q1To8HZG4ULxJdVRgXyszAMaAG/N325qHOicV0mjg47/J6OmG2CANUlktSTNX4f
         7KDw==
X-Gm-Message-State: AOAM531fh8aicg34/zYktksyWMCi0s/TeHb5EtiXR0Ns23V7eZvRyY/N
	CAox7DVL50TnpYTIwvdRiJ9IZoVlscQ=
X-Google-Smtp-Source: 
 ABdhPJzhJRS/nySkecAlvk/8DksbPinTByOPMSOtYiIDUxCmuADKUtnKROPOfFTQ0NdVSkU4GVMF8A==
X-Received: by 2002:a63:ec50:0:b0:39d:2d53:76e7 with SMTP id
 r16-20020a63ec50000000b0039d2d5376e7mr6815221pgj.338.1650211000050;
        Sun, 17 Apr 2022 08:56:40 -0700 (PDT)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:2941:56cd:748e:4135])
        by smtp.gmail.com with ESMTPSA id
 d24-20020aa797b8000000b0050759ced9d9sm9264465pfq.119.2022.04.17.08.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Apr 2022 08:56:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Vincent Prince <vincent.prince.fr@gmail.com.com>
Subject: [meta-oe][dunfell][PATCH] mongodb: Pass OBJCOPY to scons so it does
 not use it from host
Date: Sun, 17 Apr 2022 08:56:38 -0700
Message-Id: <20220417155638.3304469-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96678

From: Khem Raj <raj.khem@gmail.com>

Fixes
objcopy: Unable to recognise the format of the input file `build/opt/mongo/mongos'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Vincent Prince <vincent.prince.fr@gmail.com.com>
(cherry picked from commit e91940073af4e19cd18a09cd12aa381ff60fe54b)
[Fix up for Dunfell context:
also fixes Please add a conforming MONGO_VERSION=x.y.z[-extra] as an argument to SCons]
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../meta-python/recipes-dbs/mongodb/mongodb_git.bb              | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
index 7ef8f69827..cc15a8de31 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.bb
@@ -56,6 +56,8 @@ EXTRA_OESCONS = "--prefix=${D}${prefix} \
                  LINKFLAGS='${LDFLAGS}' \
                  CXXFLAGS='${CXXFLAGS}' \
                  TARGET_ARCH=${TARGET_ARCH} \
+                 MONGO_VERSION=${PV} \
+                 OBJCOPY=${OBJCOPY} \
                  --ssl \
                  --disable-warnings-as-errors \
                  --use-system-zlib \
-- 
2.25.1


