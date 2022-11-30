Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB1BC47089
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:01:25 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.22821.1669838482740933305
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:01:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Ej2Tg52d;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id w37so11933431pga.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 12:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5O3hURQTB3kwJY2JZkRlKaokzCbydRxM104b4jnal0=;
        b=Ej2Tg52d0On81UQf1OVmXWwjXuFhVVlAUqRjXnakNxIfkM9SJubDlyf74qsyWjgklG
         BR1EgafAfZJU7Hj8RFgKGOEjOW2rgVygZOmj2slsFU1tEk2cE76FlO33EReEShz3feTc
         HsTQALSp/EKYUjwXeHfEh0zOZc4Jvwud9P3LCdb6LZ9SJnrt75fiLqEhp17/TTiYs2Pj
         zVmCV+Vd9K5/8Tec+nAk3v/at9nOMzMnbpBuu0cggxj8FDwZLHoF9vs/35P/6E2jRu9Q
         /JKCzxxmsaQaLd8Muzz9nA23CIjsQNbMlR/iVQ1F7goEpvJQ8OB3OvaOevbXfi4EIIAr
         m64w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T5O3hURQTB3kwJY2JZkRlKaokzCbydRxM104b4jnal0=;
        b=RnUle8ZC9h8l0/YoV/yZf4xCrDNPvpuqNjb/N/8ZJd4vDdJ8ZiaawUADsPJVHmntlR
         N1Mg5IH2pNU22QwaoFe5/I1INYCPB5fx190hM5xMnCwK+fEVYa4TPeiQm0qM0Ast047b
         pLFFOg4gFG+2+itFuIWu600PiNsHG9eNPOUtOM6WXuZLerBN8Hpc5RMeTVXP94l406dA
         mgVp4bk/OMYExqN2nvnuO9Jcv7NSsokFRrY6mB+SB1IwXYqG/IY+T3hpjzGRm9J5spPf
         pWuTZGiPKgR5aGhyOj3HVRn20ISA2xRIoS7pGkFvtaruU9OKI/VjX9PDY+gAlsHszME3
         EzJg==
X-Gm-Message-State: ANoB5pmFrCaxxtGUheIRX427xWGehjLFgI2hJ71Z8rwpRsqW12a5ruET
	+qSpsf3eAOl948IDoEC5nKV+/S82bBk=
X-Google-Smtp-Source: AA0mqf4Hel1W24o/6uZaSywCem1ZJlKYQLI3H+JEgn938tGtYWX8VQCwHuTaSrKkZQRZd2+VAm3Mhw==
X-Received: by 2002:a63:1915:0:b0:477:3803:674f with SMTP id z21-20020a631915000000b004773803674fmr36529790pgl.469.1669838481861;
        Wed, 30 Nov 2022 12:01:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::a42c])
        by smtp.gmail.com with ESMTPSA id ij22-20020a170902ab5600b001893a002107sm1916026plb.0.2022.11.30.12.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 12:01:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 6/7] gnome-photos: Upgrade to 43.0
Date: Wed, 30 Nov 2022 12:01:14 -0800
Message-Id: <20221130200115.1954308-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130200115.1954308-1-raj.khem@gmail.com>
References: <20221130200115.1954308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 20:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99876

Add missing dependency on libportal

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{gnome-photos_42.0.bb => gnome-photos_43.0.bb}             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-photos/{gnome-photos_42.0.bb => gnome-photos_43.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_42.0.bb b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-photos/gnome-photos_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
index 5af3088e3a..c87823ce31 100644
--- a/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-photos/gnome-photos_43.0.bb
@@ -19,6 +19,7 @@ DEPENDS = " \
     gfbgraph \
     tracker \
     libhandy \
+    libportal \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
@@ -30,7 +31,7 @@ def gnome_verdir(v):
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "25cb281425199dec7b045f13f32f8f96034cb0cb8b94d96f9dffaf4f5be68551"
+SRC_URI[archive.sha256sum] = "c7ac7458d533f29d955011c74b76224d79ea31bcc12e9d6d0ce7b6c3704d08e1"
 
 do_install:append() {
     # make gnome-photos available on all desktops
-- 
2.38.1


