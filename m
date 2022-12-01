Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25FFC47089
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 18:46:05 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.53027.1669920356955418286
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 10:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qpW2q+gc;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id k2-20020a17090a4c8200b002187cce2f92so6079773pjh.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 10:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxlYRfF+66DsiyGV/bZ2x4r5/CTWwr2okPCRwWADhFY=;
        b=qpW2q+gcqSWXoABzTRbRHQL8MhB21LgxFEZ6AYqR49OdSavPrGs5ZUnozNTV+/t6QI
         TR6W4NafcU3w82PQbVjPJIqQv/9I5xh1yj8WoBmbsYJqgQCileFE5Dig5n273AQBPWK6
         VR0zZlvVY6HSIz578BjjMO+1WM8jB0tgPvAC2XMW9OwleEftZwZncgwp4j/Tu4/gTmoz
         Zny5+rYaElqIG4F7PLBx7XjRQ/XP+VpEtyxYJpS2b4p8twG9NXLE9+P4X7TjpvQJqtMp
         VFZ0X32PYaEShvagaPXDVnLHuGK4MhaEcfqpj5LjDK7Qy8qSkNlzROA8nk2YvcZ9t0nk
         X3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KxlYRfF+66DsiyGV/bZ2x4r5/CTWwr2okPCRwWADhFY=;
        b=qgiqPrZVeTJVzJftnN7BYGJUEShAOVxCbuOTt1qusQzVniHJpi+EeG0tduDpJaZjjJ
         Ocj2hvx+392NdKaqWh38eWfvOdo4LIgz5ISR4rxW5wOBv8JHaFsECTncDvmwxRYa6OcP
         HLoZ8icU5z+mVUBlOHMYJqT/GwL43GVQGx5ecrm8MO6U/6/kSEhhQZ4DTRAy+5BAKHZ8
         U2A9IF5oI2cDCCYczF7d7RHpWlWN4TDrItRoRyCSnSW9c3k4vOevibyyPaZ3Vc4s/E9x
         XEI+d8oZh5ZiJXbrkB8c5Hkyj5U2R57g/PBjxQ772lWJryykKTKfexb5QUtwbXLeUT9t
         cLxA==
X-Gm-Message-State: ANoB5pl+LX2PdwHN/ITG5z9NjTDN0zNCoOlWTBKOGZV8X/F75CYCaX3S
	tGmhfllxHFAGu02Fy6RKaGOOqe0WrRM=
X-Google-Smtp-Source: AA0mqf5yJmRnk24JYcl1VVqptiscumjvxJdxqcs/M7g2OScQmRh++KBPpCrLToa23aviUSxbcTJgGw==
X-Received: by 2002:a17:903:2787:b0:189:b8a2:27ef with SMTP id jw7-20020a170903278700b00189b8a227efmr1308523plb.60.1669920356116;
        Thu, 01 Dec 2022 10:45:56 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::d00])
        by smtp.gmail.com with ESMTPSA id n16-20020a170902e55000b00188a1ae94bbsm4018120plf.23.2022.12.01.10.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 10:45:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/5] fontforge: Inherit python3targetconfig
Date: Thu,  1 Dec 2022 10:45:49 -0800
Message-Id: <20221201184551.35272-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221201184551.35272-1-raj.khem@gmail.com>
References: <20221201184551.35272-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 18:46:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99899

It currently ends up using native python3-config which adds native paths
to compiler includes which is not what we want.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
index c53f2db01b..ddb4443baa 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native libspiro"
 DEPENDS:append:class-target = " libxi"
 
-inherit cmake pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
+inherit cmake pkgconfig python3native python3targetconfig features_check gettext gtk-icon-cache mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
 
-- 
2.38.1


