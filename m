Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD334C38A06
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.3882.1649883243451880922
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=byrSnFuM;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.52, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f52.google.com with SMTP id u19so5709976lff.4
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Apr 2022 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+HVKlKl9UpmtGbvCTEx/Xvol+obfth3/SuPWcXkXEs=;
        b=byrSnFuM8yReZFB2hx+Hs00IFeBFO8Vy9+YqysW5Dvv9PZOP8DGG6uDWyfGt0zL5Sl
         92hJYaznAliZ8L7up4OrCElbgSmdvRMfYU7665r00l39VfcNsvnrdkq0d6sLUSfvfERT
         wOm+OQVg8t4n+iRWu5/fMq94n1T5AhOLJjrAVYwT+7qrZm56ZNXd0v8HHDaYHlouWIQc
         jqDeWDPGbk95xXtb+mmzUBvJ6PdKK8yY6LZGIVP2THF0mkkU3MhKNJH5T1YpSLCfVKU+
         JqHi9l+ekRVfFsd+omWfO7aH8ow5Dk+saSOmIcCmG0zPX8uPJz4IteqO97/2lCSaZmCt
         sN9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s+HVKlKl9UpmtGbvCTEx/Xvol+obfth3/SuPWcXkXEs=;
        b=OrfLzJL/rS6koeH8QQamCuSARMd3Qv69IXvqHxJjxCCVGtCf4XiJ8IGdjeF5ZHUpA4
         iCMIZ7DZ6OaPBKkt4XQld/CYk9iY8Ce92Wi0RyebKWoASacHDHwXNZT6oKeDM/IV8a+K
         QTPpS5hSSBhPQVMKsZtJybkRsQcK6cNpAuxRrpGXjAZtuHqhSTslw4PVPk9cYwVBDSSy
         GY4DRTiDM6yPQDRt612fnlYcfF0m4lvKZgQve3kn9hSlqBVr+dhR0ZBY+80SMxC4Mc2E
         phOGgMKb1Bzo91GxGXgHpxPB6EVIt4PKBiGtEblyhVkboYhO9zYPdPr817u6LfnT4gbJ
         EFmw==
X-Gm-Message-State: AOAM530L3tOxtDTeZ6dy25Mop4el7N8Ly0EjNQa5VQOC/tnPP2siLEVI
	en3UaJF5sgFMR9mlllGrfgBsLSm5kM4ljKQ2B4g=
X-Google-Smtp-Source: 
 ABdhPJz6dBprXcdFYxjm1d5Ozf/OJyEwU8PMllkpyoMCyJsHp8JnBB/PA1y1CbKs8pi06iUKpNuGUg==
X-Received: by 2002:a05:6512:b19:b0:44a:b7c4:3d94 with SMTP id
 w25-20020a0565120b1900b0044ab7c43d94mr28541287lfu.358.1649883240725;
        Wed, 13 Apr 2022 13:54:00 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 b43-20020a05651c0b2b00b0024b5f54f483sm2850ljr.28.2022.04.13.13.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:54:00 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] pkcs11-helper: fix PV
Date: Wed, 13 Apr 2022 22:53:57 +0200
Message-Id: <20220413205357.447415-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96621

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{pkcs11-helper_1.28.bb => pkcs11-helper_1.28.0.bb}            | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-oe/recipes-crypto/pkcs11-helper/{pkcs11-helper_1.28.bb => pkcs11-helper_1.28.0.bb} (100%)

diff --git a/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb b/meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.0.bb
similarity index 100%
rename from meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.bb
rename to meta-oe/recipes-crypto/pkcs11-helper/pkcs11-helper_1.28.0.bb
-- 
2.25.1


