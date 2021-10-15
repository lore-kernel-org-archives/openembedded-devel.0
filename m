Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98483C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 22:57:13 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.4208.1634338632969354656
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=f6R9SJZG;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.48, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f48.google.com with SMTP id u21so44561896lff.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 15:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LCi01yeqqSKcRdvxd0WDfjKNUWuT7BWBV0gri8KwU6E=;
        b=f6R9SJZGcrSX8+KuA58E5g3d2hKS0kMh1qBxiP1ash6IqQgr99lFddVnuOYnuj+9lH
         Bx5mT2Ol8qebvLVH6/sjx5XypCDXycl0VoiUjxfjYGprOui+bDth4EKFkKynrr2h+QTZ
         v2GVs7CrmvmDJ3l7wFNnKa4aX6X1i8cyehMByzV2lnNhMpX6hT/LrXDXsVeLHFVTmsRp
         MX5XB/iVKewD7uoe0Rc2S6i/T2j8Pk/bdvdzDKAWmaGheeMCMptrTadqEfhbqLE1bkkd
         5OhHJ9SB92vM6HI9wbA3UTJ6U2fNNqmtkBZoso/WFChKAup+sgxNH0687fhUnFr7WQN9
         F8/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LCi01yeqqSKcRdvxd0WDfjKNUWuT7BWBV0gri8KwU6E=;
        b=572N54RJYDNqAEfpwPYe728y6limiH554xJWkpxMrOIMhpxg9hssK6NmKDGZLfY5wx
         xT9W49eb/tkdUYlz9BWnjauPnbWuRvTiD0xJg9avxXbwqagHB8gaQZKAsFPn14ceGORq
         /wD6HsgJ/SaFvj5pWcGABtKfUhOIILgyTSTMFsSiax2wcIW+RSNce2Jnvxl7ZOCy/a/Z
         iE7cdsSmCeHQTyzaN8ibZf5GTRwo9G8+w34JVHlfBtuSGA/vMDIP3YiwqHSLhB05lDse
         kL1Lk2Bb/UaHosSV5U5V2u5Ef/pF2suokSbAgH7RoHD/vlNaUID6rCea6Fz7sEc0dNaY
         U6yg==
X-Gm-Message-State: AOAM530iL4yuLcNVPdC+TuV93YcTXpbY9+TNtk0ba+PBGuyTrcUptd/X
	9RH0ZvpLaWYUyPxjbEEmZRZIzMYW2QX0l2pd
X-Google-Smtp-Source: 
 ABdhPJx5Ch/QrFSjMPJGddinbLYDdEUqKCG0YPOqmXvBWRYcU/fwURArcT9lug1cRyNz7BM7TvcjnQ==
X-Received: by 2002:a2e:868e:: with SMTP id l14mr14772190lji.26.1634338631036;
        Fri, 15 Oct 2021 15:57:11 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id i7sm654814lfl.38.2021.10.15.15.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 15:57:10 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-humanize: update to 3.12.0
Date: Sat, 16 Oct 2021 00:57:08 +0200
Message-Id: <20211015225708.4163616-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 22:57:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93367

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-humanize_3.11.0.bb => python3-humanize_3.12.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-humanize_3.11.0.bb => python3-humanize_3.12.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb b/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
rename to meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
index aacda65ca..1aecc5a96 100644
--- a/meta-python/recipes-devtools/python/python3-humanize_3.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-humanize_3.12.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=4ecc42519e84f6f3e23529464df7bd1d"
 
-SRC_URI[sha256sum] = "4160cdc63fcd0daac27d2e1e218a31bb396fc3fe5712d153675d89432a03778f"
+SRC_URI[sha256sum] = "5ec1a66e230a3e31fb3f184aab9436ea13d4e37c168e0ffc345ae5bb57e58be6"
 
 inherit pypi setuptools3
 
-- 
2.25.1


