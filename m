Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A21C1C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 03:16:12 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.150195.1680750971462447258
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 20:16:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iH0vSFd7;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so41597203pjp.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 20:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680750971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BbP0Vc0jh7a+rlpZWmFz6lDbW1rsjfEWAxQGy8H5RIc=;
        b=iH0vSFd7CsA66+iILKxsBAd8W+bI/6uJ2bzAjigk+K2cCEbxzgzf1/r5CQlksgR9rV
         XDXVmX8oNJAtv+OEedzCIE5F85AeUuVA1WunHN8AQJQG/HPHHtF5TSkrzxn95Q5oE1W0
         35rp70maehHrJua4cjncCbR/NGeCysXWRx89yT6vyuANPoYa7u1b21KgLTmdq4jsSkU2
         Xqi4VbFWR84KRgb+XqASyqotQJTmbrKH7jgt5fCMbVwVdgpGWd20YtifsUROVUgsKHys
         niKYnMpbJ4TJCpVy5e7872HXtaa5xI64iu9mQCfFP44QEJXU0Clv330R7CsbcrfJGQCa
         LuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680750971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbP0Vc0jh7a+rlpZWmFz6lDbW1rsjfEWAxQGy8H5RIc=;
        b=gmvPomU3NlOdL2BoCTBUOaC/nmdsT8Bh8pQRi8g7yL/SBDVMTA3OLbWRUn8ohZ4Zo+
         YS9fKaYo02ZGX65VaWVGEm4Fmqpja4V/YKCA91CU7PwbwWr0VUBFVVILJ7VKlB12lvUe
         lNAjvlhf/leBlt4A3NDAuJOL1cv4kVI3RN61auCOBqd3glmZHZl8fuwWzboWx/xqL2IX
         AffkrMFsrduWn3AOboA9RMhdQNWp/sMzwJ1qKdGjTivgyTAFeJlrYgAsqh2d7dWeVkL0
         ExA3EVYwGRNT368h5TyX4i1kEluSma/Gq2n3wsXL5KGcadzGB22NQ/X8lcSGWh21ztwf
         WBAQ==
X-Gm-Message-State: AAQBX9cK9iDJgU3fF4s700VPsVbLp1IqtusVdER/7VxzvCERcFwfrVit
	P2pSJeJP7SYnvgfPQiIqcaUQZ2cFaEN66A==
X-Google-Smtp-Source: AKy350awc+vl7E1KUkn3bn+36KnX4niWd3G2Mc/dExeGcEX22y++s9GEx6d5BM9ngw70wZzL9hWnwg==
X-Received: by 2002:a17:90b:4d8c:b0:23d:31c3:c9a4 with SMTP id oj12-20020a17090b4d8c00b0023d31c3c9a4mr9501122pjb.26.1680750970536;
        Wed, 05 Apr 2023 20:16:10 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709028c9000b001a279237e73sm137589plo.152.2023.04.05.20.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:16:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH] meta-xfce: Fix missing upstream status in patches
Date: Wed,  5 Apr 2023 20:16:07 -0700
Message-Id: <20230406031607.3285228-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 03:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101963

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-check-for-fstab.h-during-configure.patch               | 1 +
 .../files/0001-xsettings.xml-Set-default-themes.patch           | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
index d81f702891..64f06cebb5 100644
--- a/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
+++ b/meta-xfce/recipes-panel-plugins/mount/xfce4-mount-plugin/0001-check-for-fstab.h-during-configure.patch
@@ -9,6 +9,7 @@ plugin
 
 Makes it compile/build with musl
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Patch Reworked for xfce4-mount-plugin 0.6.4->1.1.2
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
index 0463d2ebdb..274454c015 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-default-themes.patch
@@ -6,7 +6,7 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Upstram status:  Inappropriate [configuration]
+Upstream-Status: Inappropriate [configuration]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 
-- 
2.40.0


