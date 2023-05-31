Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D68C7EE39
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 08:25:21 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.9054.1685521519911096565
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 01:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bgdev-pl.20221208.gappssmtp.com header.s=20221208 header.b=qf0XrHRZ;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.221.54, mailfrom: brgl@bgdev.pl)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-30aa76048fbso3892033f8f.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1685521518; x=1688113518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1RyGKcHICohRs86PN8LxgGijd8ClZtB9zu7aodEse8=;
        b=qf0XrHRZnEIIG8lSbs7EHQIbSNtZP9E9r4ieCezYUArIoqjMfqiq9brxamTuGczCwz
         hR2J8FwpBygUsMAMw+5Z5kJYkbW7DngDpSMiHOmOaTjIQN3Inwa37d1va1BieZOcnLuq
         Pe1KJrOnV+J/s7XAIQRRwZJS3WZuWhFVX+Etu3FFCnyGIy6iq+dAlMx1n4e2plhRyFM1
         ilpB8XcufzSlXiK0djsdkQkv1XgjrOgCfFErJR5W2/MXmdqHxX8puFaC+xyLgIRQW3gV
         3Bs7ulYNTe0X/Dbknfcnc1vMoBDl5xxVUHj9cVnY3SMXp/APW/oTQZu71o21VoEsjJO7
         xu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685521518; x=1688113518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f1RyGKcHICohRs86PN8LxgGijd8ClZtB9zu7aodEse8=;
        b=Y42GqhsIMjEGp3PoaLCX4iOIFqJEs9lvxmuWhuSr2d4zgG3XmFAhkDgP8QZ0/dxTiS
         4kKL5g4naOBJbmYJVlyfFTN22/fqJ406ZNxnF9lALXc8wUNN1vPQAVntZLtbg2IWdCC4
         Z9G7L5r6SRmFXHd8Sp/dyL2XJCS/SoLzjs0KAcwTXeTqRsOwW3Kb3L6EFJ28Zvbf7Iqg
         VxHnvZythmDG8UiQmUYEOcu8CSmVRdgyWAAgRWvWXt36Wwto1nSOF5gjBGLr1Pc9dt3w
         J0zYrejyXufXbooesj+OYnGm7mr8Y3EXvURgR45fTbwQzkVI0C+R7L9As61HrDaYGlc+
         zs7w==
X-Gm-Message-State: AC+VfDzNlbbxatai9v2VrWRSKQtlUHMLvgJappG9lDau1Dw1Vxm9ZXzz
	RZ+1rykES9Kw/s/oQB1AzVRfeV8KweNuOvS0Vv4=
X-Google-Smtp-Source: ACHHUZ69G5hQeurVk4bVHCNgVsCgRT2Y0bqhcvbBuFZ9frpI35bk54/1lns90pKI83zz1G25Z8u8zQ==
X-Received: by 2002:a5d:526e:0:b0:309:50e7:7c3 with SMTP id l14-20020a5d526e000000b0030950e707c3mr3574807wrc.63.1685521518460;
        Wed, 31 May 2023 01:25:18 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:fc69:2162:e0f2:38b5])
        by smtp.gmail.com with ESMTPSA id o11-20020a5d670b000000b0030ada01ca78sm5855346wru.10.2023.05.31.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 01:25:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	openembedded-devel@lists.openembedded.org
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [meta-python][PATCH 011/149] python3-ldap: add missing run-time dependencies
Date: Wed, 31 May 2023 10:22:19 +0200
Message-Id: <20230531082437.10646-12-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230531082437.10646-1-brgl@bgdev.pl>
References: <20230531082437.10646-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 08:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102938

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add missing RDEPENDS for this package.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 meta-python/recipes-networking/python/python3-ldap_3.4.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
index 2091f63a9..0bf1ff14a 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.3.bb
@@ -26,4 +26,5 @@ RDEPENDS:${PN} = " \
     python3-pyasn1 \
     python3-pyasn1-modules \
     python3-threading \
+    python3-unittest \
 "
-- 
2.39.2


