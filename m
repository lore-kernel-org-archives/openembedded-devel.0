Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 055B2D58D5C
	for <webhook@archiver.kernel.org>; Mon, 25 Nov 2024 14:54:35 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.20504.1732546467205812238
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Nov 2024 06:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RsP3bRPr;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6eee6874ef8so28400277b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 06:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732546466; x=1733151266; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBCr6vbvqEaxWEtqHsFOABbi22yAeDOGXB5qIvTmPso=;
        b=RsP3bRPrf0LHt4BctvEbFiTbGc3b4TyTRgovniKazonKK1jPfzp97/JNey7Lcu3Hm5
         bEeFnEu+6iVelIb2YKMDZuZ+gxaNBvjkn9MvQeedk3xkK878F+L1++PDyVGyMqd2KGdj
         9QK9Efld7K/Llf5zOjwe3ZV4dT6icyNXFaOorDjAEEEUcktVy3EA9efJaK9EsZIjEkZV
         dNJy+GZ4OosSWTDCgM7kLbyZ5xyMPQ9A6OX0NWvmGpn0WnhVRs95cBdV4rg9GP/dJM/v
         CA00Kw88OKfEgUy8blOZWiejW/ejt3PdiRQJh1viM9v+2clERLL6LHmr23L2EHEHvbFC
         4WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732546466; x=1733151266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBCr6vbvqEaxWEtqHsFOABbi22yAeDOGXB5qIvTmPso=;
        b=Mi3d2dco0Q2fJH/yrs3H9S854mdNPnfgAaeW4PrjOpD50QXbcJ2bVZGCYjCQks1mP+
         VxUtEWcOpfw8BJwq0mRtS21sTfcmonY34rsolVrlGuDf60lBqaivJEZYnB9A1N4vvK3v
         HYvv0wYkNx9gbNhhmQDhN6rXD1fH87z432YiSZrulcKq4U/Cawd1HgjqizIIjfRnj17T
         nRa5bnhYfe87bBlFya9gavxlQjedXMtDRn844vnwfMgYG2/S6M7W2A+s+/0qt6ffZyBF
         7zSHxjbkGt69KXgWF2X2GjBW+QJkCQUn6GVxwET9+KUHLOgoruxoMLqhlSm4qVygEBn1
         pomw==
X-Gm-Message-State: AOJu0YzKyUOC0oynPWxPLEIq1nubnnOYTVkx+DGO6r1wyrnzfnXMq582
	/51c4o8n1xsb2DPCKVXyDGqhldI9/vHecujK+whPtpHVaJ/GXB5ONdRSz0BU
X-Gm-Gg: ASbGncuuE1KEVrkMrdM6yyRNESTtve6iFIyxvjNF++E4oOIXwWHvtLp75z2d+rmxqws
	mjngNEElRlTnbZfu/6SJb+9t6Q5mIQjZXXAJIPqc1ebKSDPidwp/EaopNz8hyGOVUOtCncVpo2j
	qbtNConGb3ZO+dw5Yx6waey4krI8NVv82K/sla+B5U+PN/83K/h3bZjbUTDtKMlpWlXn7EP3dfN
	MHaN4NA4UEvhafo4jrbRXdWLygxiF3+TftkWG5c99+IrtF2tpKuXawL
X-Google-Smtp-Source: AGHT+IG+xHlNjHafHSkEhuEa3JIk0wCZu5I/+qy8AODYW3pKGjuUyRt+6AgpQ9teYytgX5RkzlTYyQ==
X-Received: by 2002:a05:690c:6d0e:b0:6e3:d6ff:2db5 with SMTP id 00721157ae682-6eee0b6e9eamr130734167b3.40.1732546465831;
        Mon, 25 Nov 2024 06:54:25 -0800 (PST)
Received: from localhost.localdomain ([71.215.7.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6eedfe152b2sm18073417b3.1.2024.11.25.06.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 06:54:25 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH 5/7] xfce4-appfinder: Upgrade 4.19.2 -> 4.19.3
Date: Mon, 25 Nov 2024 09:53:05 -0500
Message-ID: <20241125145307.5479-5-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241125145307.5479-1-schonm@gmail.com>
References: <20241125145307.5479-1-schonm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Nov 2024 14:54:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114042

Changelog: https://gitlab.xfce.org/xfce/xfce4-appfinder/-/tags/xfce4-appfinder-4.19.3

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-appfinder_4.19.2.bb => xfce4-appfinder_4.19.3.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.19.2.bb => xfce4-appfinder_4.19.3.bb} (78%)

diff --git a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.2.bb b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.3.bb
similarity index 78%
rename from meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.2.bb
rename to meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.3.bb
index abc04a031..b81dcb89d 100644
--- a/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-appfinder/xfce4-appfinder_4.19.3.bb
@@ -8,6 +8,6 @@ inherit xfce features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[sha256sum] = "e2f4878482bb8bbef63d9499329e46b2a1e0c5b984e8515e6aeec7efb5bfd330"
+SRC_URI[sha256sum] = "9ea2c1c2e5630d0670c9cd47793144ee63c04a63b8b68f0397432e043cd62d27"
 
 FILES:${PN} += "${datadir}/metainfo"
-- 
2.43.0


