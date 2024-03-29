Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BB8C6FD1F
	for <webhook@archiver.kernel.org>; Fri, 29 Mar 2024 09:39:06 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.13190.1711705139804567970
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Mar 2024 02:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RCOz/c2g;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a4e38f941c6so29633966b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Mar 2024 02:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711705138; x=1712309938; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DlwAfXK4nrg/HH4tpZn6RcGu98KE5CzcuUU6zeupfro=;
        b=RCOz/c2gtVp5ZBrMIQY3dCyTKlpNbB6+52qCIF6rX5/cJ9mC/eBRG2I+u+knRLWI7x
         8J2t3xugd2xYhMEakhowv3tqQ8YBmZlo37SlGuE+/okXZ7NzIYU4sj0t4cwY1DrYW31R
         pbw3rKdmrND8zvIe0SrMGsDmVHHWVOb07AQoJyo8ErKgdButbNrOG4zngiQmR28D3w/Q
         lICNGgk5Q4XRFMcd/qTtlyMV/yM9F1pwqO2m+6K9Mlut8zX81Og/w/vD/4NLGImI9acJ
         zz/XSmNwA3j1+MaspD/MS99sCsnBDB5pQFIpThFmDf0QlbHI2BKgbgTB4ey6zsrLDmBh
         lYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711705138; x=1712309938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DlwAfXK4nrg/HH4tpZn6RcGu98KE5CzcuUU6zeupfro=;
        b=Exgckz2XivW2ibi5izCh8SOv5L0Hga9nW5sA9XtNmClaIuYZBlQDmNoTwNmhQe9Kx5
         2pYitIw8a+tYat1RIwdiNUYaT7WhU8gC1YQMe0oUUyMN4loCpPGMgfNoM2RcOJ875VXX
         eHWQI/gr+QPIQ8/WBBY2QNAqO5iyA3O8krlelsQTAQJaaasNLnSoCaursSwJrtYRlC7U
         z0MLwtyFU/AThGEY56+rlXn5jF4c1IyF3JBTkhis6TTqVrcsPVGhAfuqVuMDIH8i6/Ke
         07DWEJxkSEsOAm20Lv8BYbizhxXXw7O6K925l27lQ1CfvHvWW7A5Q1hFKQWJld3wpjW8
         Edlg==
X-Gm-Message-State: AOJu0YyPYRJOGvQVcN0POyl5U1BMmu2yihFar5OyjIjoBIUagzu1pEqf
	ATAZLRl3ljFE7q0cWpLwJwiurAmhEBHpWM4EDRKbVR22CS47JJWww/fGkesw
X-Google-Smtp-Source: AGHT+IGFUm3TkcOO1rBDa733URSDH3hFDEqf06z+T8R0ctyVPvDD5n9Mn0fKTk45vGWev8qQ1fi8xg==
X-Received: by 2002:a17:906:4946:b0:a46:4e14:c9fd with SMTP id f6-20020a170906494600b00a464e14c9fdmr1179375ejt.23.1711705137684;
        Fri, 29 Mar 2024 02:38:57 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ce8-20020a170906b24800b00a466c66804bsm1712693ejb.49.2024.03.29.02.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 02:38:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][RFC][PATCH] gtkmm4: add x11 to REQUIRED_DISTRO_FEATURES
Date: Fri, 29 Mar 2024 10:38:49 +0100
Message-ID: <20240329093849.3464267-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Mar 2024 09:39:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109682

* depends on pangomm-2.48 which has x11 in REQUIRED_DISTRO_FEATURES

* maybe pangomm-2.48 should be adjusted to use GTK3DISTROFEATURES
  like regular pangomm in :
  https://git.openembedded.org/meta-openembedded/commit/?h=scarthgap&id=9abe74eb0bd53316b0bb3fe1d241c83e2674e72e

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
index b0b51ed73f..d3a01e444c 100644
--- a/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtkmm4_4.14.0.bb
@@ -12,7 +12,7 @@ BPN = "gtkmm"
 
 inherit gnomebase features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl"
+REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 SRC_URI[archive.sha256sum] = "9350a0444b744ca3dc69586ebd1b6707520922b6d9f4f232103ce603a271ecda"
 
-- 
2.44.0


