Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF116CA5FA0
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 10:51:03 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35347.1790506258386951234
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 03:50:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yt4l5Sly;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-881269371acso587567b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506258; x=1791111058; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1i1XH3vNMJc1qtbT0t8EZ/+nLelo5etEcRaQ3E004E=;
        b=Yt4l5Sly6GhDTs2Jc/BFr6d0MF8CJw6tk6/keW/DLMbB+g5H3EUm8lciQDI99d7UPx
         VIvsVej9wwKK/p1czlDHtVzYhRa3Ys1OPAc1OeMg7Fys+lWPXfiZkx3ExB+F5PlpYPNk
         gyHpg/hTqUPcuO6dtqnotg1iWKoB/W8dNnIrxsjYwefEnbXtM6N9zuvuxgbj4+eCTtYe
         RphBftfozXXs/ldYPvbuRCE1GYsI1UZmistHDzd6DiDeybKA5gbCxWRErkr+tK0lNh0C
         mlU4fEiQO1GRNMeWGR/W+BoPeyyX2LvMBBPyibqD6yDqN/diaHomJTPSiMKLL51KTOFU
         rhqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506258; x=1791111058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1i1XH3vNMJc1qtbT0t8EZ/+nLelo5etEcRaQ3E004E=;
        b=DCLx6RtR4aeO/bzsW/VnZdlQc5vYORKofUrP+fbI7B/eCpsPnQ9eQ/1w9svhZM2In5
         tGbTQ4XwBKhULIkZKg9U+qTvfFbjAgFygMrRLZl3QIgz5FrVJiRBw9TqWZghVVTlBA14
         O/sBEAydfuq5lJibJIp8WB2o+0G0VsttbSknuuksljIEgIV/cqNtHKauMRS8lGMVCnpf
         s2GYM2V2EFPE51iOLjUFugEhuIVZBm955RPmwb3OioIt/ARIImoRqYi0nQ7XUIWMbEsy
         vvwH6BBO1exZRLdv+eVaed6/Yir+yGK1Lvx/ucjP25ShkKfk/69uZhpZDYE3nJhWEpgN
         JOcg==
X-Gm-Message-State: AFuF++mdlg34BpnHRmG7GNYcLk9DzDzIlgxj1Q1NehDQPlh4kTjz4Udl
	dUrPe+FNYgbMYtaILrsSCNQISwhWFtyxXAqeq0GUBIOeZ0xEHTFxhfQRqMgUkQ==
X-Gm-Gg: AYBFou3z7wEJlEEf0U7Aa1b6w4hOyk/CImv1zr3JWvcz4fWh6XBuTNF/nSLqTwnQqRf
	QW4gvkRAQLSfigSmQixzBkIzXn9/ebmEMmMpcAuUf/vo7Twm9U/llx3xrA6+GI/g5Xo49Wcf/FC
	Gpa86HGLCQ3gZujMRKWGob/Tclj0yP7mDwRYt5ko2k/v8YEQJ9SdV2U03+6qegJdEcy25Xc+8UJ
	GJaTTKuQa/dtOkSwEL+YYQu3cXKQoHbiP73lRtzb4Cog1xRwBq6YrP0cnG2A0TiG/lJZ2okYHGp
	10O+XZA/s20X49JxanHDegRdryT4r0/dkaWI54GAK6SKIeoGg88M5UA9WLJ8IfWH89vJUkTSJqs
	WKvpxSh1nQvb9RwWbwm/htaO49If3XV6PQDqt+A3RXPRucmknFd6DP13kY1n4X10iEoK1M7s8jm
	X0yv9b8iCT8Pit4kSlfdKUStDpnjmx6xHjGTp+bnrRTZB/wDqv3LplH2nKkHuEu6pL4mSDPmGP6
	MvzmM8sEbaJt2jXFz2+QM3r7WBSM7vlaA==
X-Received: by 2002:a05:6a00:995:b0:882:4cdd:140e with SMTP id d2e1a72fcca58-8824cdd15c5mr1419058b3a.15.1790506257699;
        Sun, 27 Sep 2026 03:50:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88268c5ed75sm640542b3a.48.2026.09.27.03.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:50:57 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 18/35] unbound: upgrade 1.26.0 -> 1.26.1
Date: Sun, 27 Sep 2026 23:49:45 +1300
Message-ID: <20260927105002.1832451-18-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
References: <20260927105002.1832451-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 10:51:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130352

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/NLnetLabs/unbound/releases/tag/release-1.26.1
---
 .../unbound/{unbound_1.26.0.bb => unbound_1.26.1.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.26.0.bb => unbound_1.26.1.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.26.0.bb b/meta-networking/recipes-support/unbound/unbound_1.26.1.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.26.0.bb
rename to meta-networking/recipes-support/unbound/unbound_1.26.1.bb
index 711c93ef6f..f426ce351e 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.26.0.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.26.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "a45da353d3feb5d8fc00685fa1ceda3816d5108f"
+SRCREV = "13b6717f1716810523ffb60f971a6c9c5e8ce127"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 

