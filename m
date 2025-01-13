Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FEAE7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 04:46:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web11.10466.1736743570087435842
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jan 2025 20:46:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h5JnVtBe;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2efe25558ddso4814867a91.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jan 2025 20:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736743569; x=1737348369; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThVD4sWvNPNxmRIC78SVSmhE8TgmUCXvy3BiZRYbReQ=;
        b=h5JnVtBekFO6v3mRDgTFt5adu0JJ13A86SOI9MpE4v/teqvVIIvLLKUy3NIqfeGYMr
         sjeTyZiHnOvpnu9DsgKVb37SMvw7flz35PHheODm6RcP1SQowxLs75yeFi1k9kBF7DjU
         3IXd7+T7MtfjRqUrWu1OIEy6KMrMgMKMQRCYwP0kTt/m02gqZoC3MQAuTowO3o4lmU/+
         Fz2U/aSm5zxaItiY0SNWVMf9AnjBvPQ3BdH3dtczLtCFkk3Z3KFh8pWMtqWzvOpix8LT
         /j0zK+mOmf/GlGdq+gUzYa+RM/Gu8xX0bbD8HRaBtzNc4/NBpQIJlrNrvS6ffc2y1mYi
         f8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736743569; x=1737348369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThVD4sWvNPNxmRIC78SVSmhE8TgmUCXvy3BiZRYbReQ=;
        b=Ioc4yp9Yfy2BabJk3rvemHvPj+B32BY8OIrHN+HKBdcYHvtQLBj5AWdte9VANP1nM6
         KMvhDJ8HSsvqndngjeVpTRh9jD87T48yngKtmuM5IJb9rawtFnQcdzEYg1hkAsOKbW31
         u+QL2YUn2HRL9gaFuebwedzOutsjlga3xktdtTa8rf19h7dNHIy6cm+WUwHg2zkx4msX
         K2M5VQRtEt6O+3FzxgboyM9GyMRgCaJzBPWNvxj3nw600IgUPZlM44rE+ENfpZoLAU9M
         1UG+ZLDUPeEjBt48MsUMQnHl3yuivgw3Zsegcdbshnl2cH10kxQWpTxRsAXhaBb7XL7l
         irEg==
X-Gm-Message-State: AOJu0YxDN/Iq1o7hC86LTFl6PSB4TJ15/9vUKQLYtfSKVvSEl2tpHTUX
	bJgYnUfdbWPBiGRRPeT7D6UNl+4LZf11aFfBjqfMSNlUQcFy+G7tgXzZVx7/
X-Gm-Gg: ASbGncss/rcPCce/4it8pfuuwNETTDrnAzhIW2ClCIOE5GNqMFbdf37j8b4GJEyLGN8
	m/EbBYKOXvt/xlLHkXNtYpUNUn09poDRbXEZN7OzhVxZ+f3Of//1ocfeD6U98rfv58aru3nYyzC
	lQDfTneMf3ZZPvgQ5aekizSffziJ7ZpGUtbm2E/5w7gHBx86Ey/LnjjsBKfyDjpu+XiH7lE9naK
	0SkSVW1vGeyHI/d0RNZaP9/XyYwH314aA8xqNaSS6o1Flmk
X-Google-Smtp-Source: AGHT+IFP1Qh5oK3VfiLdhOAncBCg4gy1bLzBMy7C0n/TgVtSgceyAH/0hxKhD8nZdr8Yx5i3cMV6Kw==
X-Received: by 2002:a17:90a:fc48:b0:2ee:b2fe:eeeb with SMTP id 98e67ed59e1d1-2f548eca9dfmr24163622a91.22.1736743569125;
        Sun, 12 Jan 2025 20:46:09 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::65e9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm7614921a91.30.2025.01.12.20.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 20:46:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/5] websocketpp: Skip recipe, not buildable with boost >= 1.87
Date: Sun, 12 Jan 2025 20:46:02 -0800
Message-ID: <20250113044603.3467963-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250113044603.3467963-1-raj.khem@gmail.com>
References: <20250113044603.3467963-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jan 2025 04:46:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114824

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
index f437accc50..c2819fadbc 100644
--- a/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
+++ b/meta-oe/recipes-support/websocketpp/websocketpp_0.8.2.bb
@@ -37,3 +37,5 @@ do_install:append() {
 	install -d ${D}${docdir}/${BPN}
 	cp -R ${S}/examples ${D}${docdir}/${BPN}
 }
+
+SKIP_RECIPE[websocketpp] = "Does not work with boost >= 1.87"

