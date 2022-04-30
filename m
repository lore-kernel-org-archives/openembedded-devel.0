Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFCFC43217
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:40 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web12.26114.1651346318397172760
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VjPnRKHS;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id i17so526226pla.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UETN4ruaodDkb4fNllj+joRNp27Qw994pxASgK/ps6E=;
        b=VjPnRKHSI4F5peC3umrNcXH8+19X2KbqQ/KlEcpHGYl2bg/Gwrq+/zhWX2tmWagfGO
         DnIuUZtEXVo6Zmkdm9sgEbuWuCzNOW5aZVfx3jCWhMZH5n4TulGG1I5SmoHOBOqKqVzJ
         E1+PhyDdXfSLWZ5Wi6FbMPDA2f8wlP+by1/jNbUYAVCV/Tg29dIYFIiNHg1zgeRe4AlQ
         7SQGKMbESKbfV5bjxymDzB8d31yF1sE1LhiaSYiV/gTTBPensX0tE1i6/+lzlSjnJaZe
         63J9E8GMG2+asNlAZuhTW9TqoCqbgWVkQmnP9hPAGTIETQ9ctOiFYY/hq7uwHHxjN7tF
         hugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UETN4ruaodDkb4fNllj+joRNp27Qw994pxASgK/ps6E=;
        b=5JxzA0ylMMpClJNX/RFfhlhaiFJ6RpWEUGOzr3WZUpY2P1e2GUdccJVZvx41lKt0AH
         QL76YdOG0/7T31yGn7aegh+KDIOIAFPyscprhlCY6degh5wOOtBXFVmvlHlooDJ+Gejc
         AMQtB3rle7BCEmFQsS4yCDfRaUHCltxWVwuuaZMbZnZ4kGer3Gt9uS2xvl+rcIMwBxJ2
         stUqf4bPuAVEw47L7CpGacFIM8V3+CHOtpv+cxzNeTOV/7R1CXaiMWrVkR3lz83yaKzT
         5sxTYho3/oZo5PFDVWb5TiTVLZBzArNCeYAJ1o6PIMQsyPIolvVbe/HduWSspdNtls7E
         aR1w==
X-Gm-Message-State: AOAM5300m5nTCTgr1NOLSLWBf+EYjkGfh2mAwko+cBcO41q1L3Z2csO8
	wYz8ipfmxUod6q7hYHyAO2iglkaIpSu6oQ==
X-Google-Smtp-Source: 
 ABdhPJz9E6ZZ1nixqv06LcJEB6fqc56/L1Ta7z3B3hOdUg4jeENLjR0y/JlRQI2/tSHbNtEYkhIXRg==
X-Received: by 2002:a17:902:b406:b0:14f:bb35:95ab with SMTP id
 x6-20020a170902b40600b0014fbb3595abmr4738551plr.140.1651346317629;
        Sat, 30 Apr 2022 12:18:37 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 08/39] dietsplash: specify install rootdir
Date: Sat, 30 Apr 2022 12:17:48 -0700
Message-Id: 
 <3bac79c66648daf7025619bca3174319c4fe5229.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96875

From: Khem Raj <raj.khem@gmail.com>

This takes care of rootdir being different when using usrmerge

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 8cec1f1fd9ea585039d985943f3f20b37aff9a3b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
index 44fc2d08ca..2c28fde347 100644
--- a/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
+++ b/meta-oe/recipes-graphics/dietsplash/dietsplash_git.bb
@@ -17,6 +17,6 @@ inherit autotools
 S = "${WORKDIR}/git"
 
 EXTRA_OECONF = " --with-systemdsystemunitdir=${systemd_unitdir}/system \
-                 --disable-staticimages"
+                 --disable-staticimages --with-rootdir=${root_prefix}"
 
 FILES:${PN} += "${systemd_unitdir}/system/"
-- 
2.25.1


