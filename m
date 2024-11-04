Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB444D1CA04
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 22:03:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.3089.1730757816250371468
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Nov 2024 14:03:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aQ3YGku7;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-720be27db27so3785136b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 14:03:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730757815; x=1731362615; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LVj/XQ/JK3amHYr3QdWxOAgx5bViV4oqDvbijwFwYFw=;
        b=aQ3YGku7IeI8bwHyZVgtRbkv7qwFq8/eWoOGXFMKgSj5AsQ4f+MsxfLnlTi//NiKAq
         vZ2yrLyoxcOMxhRXOsJqng+losvrl1B5aN1ylmJH+mcncO5v/S93PvMqx3CRD3IuoY1y
         T5//VS43pd2jdbnOx8EPY80bIsAJLm5Ug2vWOs/a0WY1ymoKJl76rAmanT4C+jjlf5gJ
         2oNfrLcKB7XLJIqe0bCdzUJa9wsemjwjQN6F7PFdraVvLD+77iomDbFY4TIEwWOx/HMu
         rlJsFEMbma1JzHSiuWAQ0SHclnofanajAtF0v0uo6KYftBUzhDr2kfnENV1TYLMVDa/1
         XxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730757815; x=1731362615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVj/XQ/JK3amHYr3QdWxOAgx5bViV4oqDvbijwFwYFw=;
        b=fvrl9WuoXxIWab84RlgqBFcj8UHrRKhhqD7KNeQDBT4bJKf+9Ms3nJ15dlFPdKxscy
         P/La6E+OvA96J/x52hOOviYIGh7ARJnAQ5xUEgmJKcfB1LPgQ/nrlWlAZ33UwZECcf2O
         vPO9vEf5KxwVMxGmcujw8Shf1E3b4T1tQMS0Ycjqifm2EpMnzevMQDJErm2CHvSpnv4T
         spUEHeHuLQklFbD365Imdo2urh8JjHFV3RvCo7TOxEwyqXQuPH60CtSjazBzVuvxKn7Z
         BqlQmL9OO5qtYPweP/3fnQNNG6vthoWwQlgtuFFIYHo7Fuhw8VFInViMlTmaU3GVMdGo
         o7YQ==
X-Gm-Message-State: AOJu0YxmAHDq3dAIBPm//VcJbB5+KpX6toCk5a0SkAtG5+1y3sij7bbH
	mml0tH0jp0024/Ye1OE+T73k3CuWKVcYnjth5KcwKpiTwiyU7EoT+nJU/Q==
X-Google-Smtp-Source: AGHT+IHR2msrDmzLjhqGX1R+VjhC7JWHbozyNL5mg5QFPDjixwuuq1QBtR+dbXobPWOf6zs/GIGkQw==
X-Received: by 2002:a05:6a00:890:b0:71e:658f:c43b with SMTP id d2e1a72fcca58-720ab39e4famr27326607b3a.2.1730757815346;
        Mon, 04 Nov 2024 14:03:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::a151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b91d3sm8044811b3a.38.2024.11.04.14.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 14:03:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gtkwave: Add packageconfig knob for tcl support
Date: Mon,  4 Nov 2024 14:03:33 -0800
Message-ID: <20241104220333.3914910-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Nov 2024 22:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113411

TCL 9.x is not supported and its coming to core, therefore make way
for disabling it by adding the knob and keep is off by default.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
index c0777c3314..3f94933e6a 100644
--- a/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
+++ b/meta-oe/recipes-graphics/gtkwave/gtkwave_3.3.121.bb
@@ -33,12 +33,15 @@ REQUIRED_DISTRO_FEATURES = "wayland x11"
 
 EXTRA_OECONF = " \
     --enable-gtk3 \
-    --with-tcl=${STAGING_BINDIR_CROSS} \
-    --with-tk=${STAGING_BINDIR_CROSS} \
     --with-tirpc \
     --disable-mime-update \
 "
 
+PACKAGECONFIG = ""
+
+PACKAGECONFIG[tcl] = "--with-tcl=${STAGING_BINDIR_CROSS},--disable-tcl,tcl"
+PACKAGECONFIG[tk] = "--with-tk=${STAGING_BINDIR_CROSS},--disable-tcl,tk"
+
 FILES:${PN} = "${bindir} ${datadir}"
 
 RDEPENDS:${PN} += "tk-lib"

