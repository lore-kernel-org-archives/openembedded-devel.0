Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9FCEE57EB
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81809.1767167693916586405
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IcMB6t3z;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so46450605e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167692; x=1767772492; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KOXyNbU/8XH11f5lBnyiJ0eHxtA2g6xWlY1TjkbZlyk=;
        b=IcMB6t3zgyIvdL1qfazs7fvKf2zs57jLOBY0+Qoi/E0VBRRPyVuLvqHNLQQorjrEpa
         yWJ0UDGTPpG2wqwYjBQZVlNJsFfIT9Kd80vlZI1LqYZvjN1uNOQGfRJyaXN5tcIMOrac
         wuLgzwV6zObr3ul6zf70r3ckNYVEG6/r08MXEKeGRAMzC3SScpidZ6Y7T9kdeY0qypT7
         EEO7qpOdExjsmspHFS7SMImpXKRWVHDS5jz8X98hMXhS4Ivc61ja+kb/3WZ+fGe0W7vP
         GZcY04pNh3nT5j49vkvOzGYuDU1793175fcu6Ey7BnEhuSqCGPZAiWTjn08wINT/DplQ
         VwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167692; x=1767772492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KOXyNbU/8XH11f5lBnyiJ0eHxtA2g6xWlY1TjkbZlyk=;
        b=wEJ8cqql502joMWl3eDpSx/oOWZ+k5alBtUwLqOWis7ghwWMyMOEvLhm2LkMWKP4Aa
         ZiK/TSLavtJ8hccNcM0VJiY75j0AjDfhmVnyvhNMOtW83lhyjkhNr6EvEbSwtjfAQPxa
         z7F2pXHN5HjoJ+7cCCt6leE2g5/R+GuSzr40k8/BWjNhpKNffUoj80cHmt+aLwlYX5uz
         DqHZ5HCkHq8UHHXbygYwnIKtab2V1+2bjpLJCbvJBpYAAb+CdXqqzQc5veHOR3ZATJM7
         k3lk3uVzdnGgSsVt2RkRHyLAm3PkayHBR/znlOd9eQcjo+2wTtQRn04YYdS/CxAqwbby
         9ICA==
X-Gm-Message-State: AOJu0Yyb4+ruKAE+GKua2vSSeFUOO15A0+XeBc0m0c1aQ3HgmRmhOVEC
	hBdFCTOWzS+rLb5ysaVN5bBYuezHcu+sOUJpaIAKNR0sb28fy1Ihdaot1/EdeQ==
X-Gm-Gg: AY/fxX6sL9wq8Ny8jh1J+dn4V4CjQjtMLcwGD9UjUyVeS5W8Zi317HPrranxWb2vJl/
	+/tRMJ9IBT/2EYzg5/EQceiI7I0PFIWGHMtFqbJntSlHxEjfIo3O80T1jhAcGIefoMec/1pvL3B
	lh0ML34Y3LLr984eTxjA2W4DOlBMMYfBoXDmUO6zprBsgmxHBLIEuUwDkPU/7fC2VAP+RHNk8Zu
	kSMit1PNtu0/ucNGSVN7/tQsk7iX+7489ZRICAggMfDrkYfvJnWWwDyQrBvHOC0MI2Ong7z5H8Y
	aa4PHd8vPaB+ApihWnb4P4cIugQFjGwK4Gvk9hBlDFBkN3Z+uOlwx4f6nyH5TO646wUH3LAqEUd
	z2+AWacF10TUctjZnOgZ/RYe9C5IcjatmR9c6z9UFXndFIYGPg6ysPgxQlTNMhW4BfITIhOruuc
	jTskNCgL67
X-Google-Smtp-Source: AGHT+IEo5y1pXndkeLNc6jRUUAPa8Q31coN3vuSwWjt1jU+pZWwPNiPpn9I740N+h4anB7irKgS4hA==
X-Received: by 2002:a05:600c:5250:b0:479:3a86:dc1b with SMTP id 5b1f17b1804b1-47d36243a0bmr265810515e9.37.1767167692198;
        Tue, 30 Dec 2025 23:54:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:51 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 21/34] python3-joblib: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:23 +0100
Message-ID: <20251231075436.771395-21-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123061

The relevant CVEs are tracked with joblib_project:joblib CPE, and the
default python:joblib CPE doesn't match this. Set the CVE_PRODUCT
accordingly.

See CVE db query:
sqlite> select * from products where product like '%joblib%';
CVE-2022-21797|joblib_project|joblib|||1.1.1|<
CVE-2024-34997|joblib_project|joblib|1.4.2|=||

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb b/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
index 3dd1b57aaa..46b89ba267 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.5.3.bb
@@ -6,6 +6,8 @@ inherit python_setuptools_build_meta pypi
 
 SRC_URI[sha256sum] = "8561a3269e6801106863fd0d6d84bb737be9e7631e33aaed3fb9ce5953688da3"
 
+CVE_PRODUCT = "joblib"
+
 RDEPENDS:${PN} += " \
     python3-asyncio \
     python3-json \

