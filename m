Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA75C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Dec 2021 12:19:15 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web10.7248.1638447553963209147
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BuN1FH7A;
 spf=pass (domain: gmail.com, ip: 209.85.215.175,
 mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id s37so17159589pga.9
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Dec 2021 04:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=luKm9E7Mds2quZBEMCzmd4uu85LM3NODkw5rBKXWpbc=;
        b=BuN1FH7AeV8QgYGvEPry/CRJSLOUrsykqImmya/MUMhU4nYySvrdP7DRiInCE3KP5W
         hLk++sej2Qq5i7OFxKpmOP54lcyMMdnMDqOG/GAEf68maaydQ74wCT65fwpVgPIWpfdE
         m+c5FosIFpwXKp9fA0cYHRiKsNwZM6QekBb86TiDkc+0NBLAP92C4LyhLpkiHGbH473k
         +O4KceCJ6c+0UI/BxHkuJG5ZaEmWxpeayY8N/pbH1VsJPnRlhYPDakKMEwhoEgqkDisy
         YlCG4DY/HsjGPKB23i8JhJJ4OqZgcDX7SDkU3T+6Zdt4osWrGz0F74Fvl+jwXVk10pdG
         9mfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=luKm9E7Mds2quZBEMCzmd4uu85LM3NODkw5rBKXWpbc=;
        b=2ZlbagKE3A4JsFdSOgE1W/PsB+Mmcisg1LbsNOeahc2xAVuOusTxaGRjnzQrDMxk5v
         J8PFiqHl3CTYGy1nthLxqkBaq0rcmhd9JCd63Qnka0eVS7GwatXoJjerg4UmPbnaRW5a
         sLGjeda1FLUgXHsHyCGl0CgC/F6jxo2qPPL7/r8Fn9lc2iyjQRb+gkaBTU9a7wzzc5fk
         XrbDgNS+1Sog5S/g03xtNmZgLvtNh2+SjJDG8DAESevXvgk/IGk48DSO98alSOwKyiE2
         eEubekmKNI7ywjTrIddlKA3bdsEJ0eB0wOBsgpFu1C1mYTG3NWu3zYn4+xpuogxenRtb
         j24Q==
X-Gm-Message-State: AOAM530/P6ByBq+gXBzswElGkHsT2oQXs1ML/fovcYIrk/mTqw6x3hoU
	16V5eleLFVvh3uTTFjTrUQMjt+Q6baE=
X-Google-Smtp-Source: 
 ABdhPJz4RRgmPnIXFWb4k251Kf33T7B2V9B6363AJbxu3nhKtIe1gvgW69TQG7dwHaD9uD+NlFWaJQ==
X-Received: by 2002:a63:2c50:: with SMTP id s77mr9018573pgs.387.1638447553315;
        Thu, 02 Dec 2021 04:19:13 -0800 (PST)
Received: from keaua.hsd1.ca.comcast.net
 ([2601:202:4180:a5c0:9b75:b57e:d1aa:6e39])
        by smtp.gmail.com with ESMTPSA id
 d2sm3396881pfj.42.2021.12.02.04.19.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 04:19:13 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 3/5] lmsensors: do not depend on lmsensors-isatools on
 non-x86
Date: Thu,  2 Dec 2021 04:19:03 -0800
Message-Id: 
 <c618e90cdad6bc7f9776f4d75be3f583a6dfbb1d.1638447451.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638447451.git.akuster808@gmail.com>
References: <cover.1638447451.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Dec 2021 12:19:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94181

From: lumag <dbaryshkov@gmail.com>

lmsensors will build isadump and isaset only on x86 architecture.
Depending on this package breaks lmsensors on all non-x86 machines. Fix
this by enabling ${PN}-isatools dependency only on x86.

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index a2f0805fe5..37a98a0996 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -95,7 +95,7 @@ RDEPENDS_${PN} += " \
     ${PN}-sensorsdetect \
     ${PN}-sensorsconfconvert \
     ${PN}-pwmconfig \
-    ${PN}-isatools \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'x86', '${PN}-isatools', '', d)} \
 "
 
 # libsensors packages
-- 
2.25.1


