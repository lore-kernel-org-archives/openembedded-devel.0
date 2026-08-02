Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BF0C55162
	for <webhook@archiver.kernel.org>; Sun,  2 Aug 2026 12:05:19 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22147.1785672312993158695
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Aug 2026 05:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F8f48NQC;
 spf=pass (domain: gmail.com, ip: 209.85.210.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848595b338cso3145453b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785672312; x=1786277112; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAjSG0eOLYA9uf5t+M4kb4wTd3XkKmYlqx7SYTftBbE=;
        b=F8f48NQCEaNjZK66EuvCvDBe+IEFcY57VUV3lTs/Eg4vaCQuwDQrWYDbutRHEkd6bb
         VLZfzEd3tF+N64EALQ1fqY5vGuAbxvLeAB+jiNnlD5QOYoZnYt8S/6SRF409WymB2bYY
         4KYxbaHNcqItC50xxFC2HwPX6VDKMtookHQnvT3PttQplfhgK7qVsuVdeIKcIUIv7ukf
         5OMd925iblfgleaDKpVdBYHxuBCAVmbilwDi89FN0WxCJ/rTTUkBb5DijiKv6UD+UklS
         yF4WUUacgOs/s3N++Y9FRheMDgSkcVF96RJAOfI4pOMRPPL1TlUb8RJYxzrNnKeJTTVm
         U8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785672312; x=1786277112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAjSG0eOLYA9uf5t+M4kb4wTd3XkKmYlqx7SYTftBbE=;
        b=sIf9PiMcHI5X7BgO89qm6Li2P610ByByINHP2TW0zmm53fePL0ZW2exQh5H/+ogor5
         gAGX9TrfFgAUdUqltrNF34nzHgpVLQZpOv9ebnbwPsDt9I9e2AoV7D6ElZCGSKRBXQEi
         0l9MAIgGjaR3XivetLKajeKkNVJtQhg/77w4Ws3k0RnzfaLQ/CEQCMdrA2m74PJp3ED8
         axNMSg7Qfy9P52wVHUPG+InA1kkmFEagjeUs1DWmhdikSl2gU+fV697m2M0AtWWd+sg6
         /k83lplGnQNQe8jh1yPX13gTmXdOYhPrsnGu57nG1hqcmh01vDX8Jd4Es0wDo9w6VujK
         4ebw==
X-Gm-Message-State: AOJu0YysG6ysojmUBxhTfD2qkkJ5BVvAHKBgCflSe/xZM56vLM57fwtg
	ZFTLu8PT1AZMwPTg0vSdSAzSPxFCZba05WYrcUqLobjH4+DRulb/E5NDSPCqaQ==
X-Gm-Gg: AR+sD11gbXO5EMmFebFzyaQElmKHDp232gLLQ7NMDjKlBFR2/HkoEqoYeDK+hpOz60g
	AdwEwplBk1ML4Bvgz/AHPjDflToUfUiDTQFmoGqzWIUkkmMb+mIFR9bb10uGRLOuqngHV/iAKch
	p2qOCk+6wJiV71GnTPSoMq7zVjU7G9xUX/qdQ18xtGkm3/cP/Q5q2JWbij8xhkiD1qhqmWw7lER
	0YPp2KiF01TmkmRpcuWY2eFkAD3XHpAHC9x09/Se3HgFTAlb6e6Jon16sEJmfmWkA8XEIj06BgJ
	Slz2+ylnlZGCKGE5P+2hT/TZQtRtRsEprIk+QNRkNDoKGJ3xiwIU7r23MURW7Q9JQBqngwtB5Bb
	jgvnsIsC2l5Phnce8mrJRR+rvPVWtootbFl8dgj1icfpZtnHqd9rRHzh7tcBe89+XZrBu0NJXPF
	eomEZR6WMOJwr1T6TPU71jIUXr+DqVhtS9zhYtgVRNvJp56aN/Uechd9ULdJK5/8e0PyftZxcqY
	g==
X-Received: by 2002:a05:6a00:2294:b0:848:4c0c:59b4 with SMTP id d2e1a72fcca58-84ee48eb9b4mr5693886b3a.64.1785672312180;
        Sun, 02 Aug 2026 05:05:12 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe39eb13dbsm2556152a12.29.2026.08.02.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 05:05:11 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][master-next][PATCH 7/11] unbound: upgrade 1.25.1 -> 1.25.2
Date: Mon,  3 Aug 2026 00:04:38 +1200
Message-ID: <20260802120444.2973561-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
References: <20260802120444.2973561-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 02 Aug 2026 12:05:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128662

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This release has a number of security fixes.
https://github.com/NLnetLabs/unbound/releases/tag/release-1.25.2

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../unbound/{unbound_1.25.1.bb => unbound_1.25.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.25.1.bb => unbound_1.25.2.bb} (98%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.25.1.bb b/meta-networking/recipes-support/unbound/unbound_1.25.2.bb
similarity index 98%
rename from meta-networking/recipes-support/unbound/unbound_1.25.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.25.2.bb
index 7331fc01d1..273e466ea2 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.25.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.25.2.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master;t
            file://run-ptest \
            "
 
-SRCREV = "75b6dba593d4fff000434cd64807c6ebd50bd244"
+SRCREV = "c33ad1b1a21e48bfe4f140e90252a9be1b0c5745"
 
 inherit autotools pkgconfig systemd update-rc.d ptest
 

