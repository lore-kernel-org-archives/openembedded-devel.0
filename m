Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F288C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:44:11 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.5564.1751359442935229655
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NDWM9lm6;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: yishai1999@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4530921461aso35033115e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751359441; x=1751964241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c82ZZviZMG5FaScl9MUn0uhrTWEeTLB8g1SxIZNjc7o=;
        b=NDWM9lm68I7cjNQxmrh9ClDuV/sA4L2vqHRs2tKEntXrI9/guqczYPdFMynzUgq0qV
         8p7vKn9Dk0nQgn60FZHzStjSk0GKK5f6gEMv30YnlpqWG6zVL9uECZjJKEBOZ8c3osDD
         lFlPlDrOkHrglWStuR1+KHg9BI2ergF84kRxMd9EHp0d0AWU21kuCe8VL4KRBrYvzTBr
         P6pjPn+R9GJxzO96BiKBg36WuTTRbc2IaCdULbpJOCWK5f+dNs8tq0/ug0TaM6KniiyO
         +w2vm1bvWkT0hitMtB2r0dcYRSBbZMZFiL3Y/jcYVU/onmuplwtEhBmPPXPH96NqdCVG
         7ZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359441; x=1751964241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c82ZZviZMG5FaScl9MUn0uhrTWEeTLB8g1SxIZNjc7o=;
        b=nOHnkJBhOP4JO8tmNlmYElJ6LaIMr1tRROKwxjLFbRlk2HXAV29RLNo+GhyVN1lM8g
         H3x90C9gXQzf32KS9KZOj51SKjfgSGFZPguDbbeicTExWvZ37gOiOyIP3fBy2WuaU2q/
         EOThs6uc8MDZVFSRJ3m9zaKUygcpd5mmfmQ+v4EbxVcx8QC4DPvwcHVFSE/ywpPBQ2Hl
         3U51CAWrkdUMLQa/yKloj6O9R2PtJptc6k96KsIT/1sAcptVeYAd9MzhHwNNbjJXf5Yv
         5n5zI3Z6L8AnuTa9JM+N8VJ0SyZHToePVlymTpLYWZNGwQ91LsBZUvqgMdUf3wU4dCKK
         7D4Q==
X-Gm-Message-State: AOJu0YwgD0yYHNCAIz0elzcisJc+5uaI+K+47pCDe8I08Hs5Vk0UoM1v
	dVg/gijqoHhl4AxdXh/4Zu62VAdorn+MRccEDTRLIgI7VJyg+LhmER3ObiGhig==
X-Gm-Gg: ASbGncvWWybYl82jEArwxB8Z3zv6sCz1cJNktJtzaqJCCvBOQpigjnneebtNrmHl1Vo
	/22ZkBswsUy7VC7wmcxpvdVkrcFY6DcnbEBPNje1kSZjVHgVnVH6iePEC7E5rZqY4kAF559sQ4U
	x7widu/z1iWshD/zu+i0+Bsgx5LhWBtyqFeJbKlLHJhS1ehvTUpQqgb+ufsZthMOiP/myGL1RV4
	4nJ4JOcXlX1v3SefJN9/vx54hXBoAgzy0zW7B0Vdgd+ymyqgvSBF1LxNBJGJqQcc8hs4Ptdp2MR
	rGQ8X/FH5vuVAjcHhK+AMo9H0TKEBAWD3N9/6AEmroC6b2y2bbeTkEB+GV4S0wZn6+fGyw==
X-Google-Smtp-Source: AGHT+IH/QRzhl8kS48W7VWKG6DEdS6fKgq0Kb8lKo6CxkN7a1W2w0Dg/ReC0a8UdYdo56ZU2eMo6VQ==
X-Received: by 2002:a05:600c:3494:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-453a33d6fb9mr53214825e9.8.1751359439741;
        Tue, 01 Jul 2025 01:43:59 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm12597880f8f.77.2025.07.01.01.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:43:59 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 0/3] Adding native support for a bunch of recipes that are missing it
Date: Tue,  1 Jul 2025 11:43:49 +0300
Message-Id: <20250701084352.4165484-1-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118188


Yishai Jaffe (3):
  zeromq: support native build
  json-schema-validator: support native build
  python3-pybind11-json: support native build

 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.5.bb             | 2 ++
 .../json-schema-validator/json-schema-validator_2.2.0.bb        | 2 ++
 .../recipes-devtools/python/python3-pybind11-json_0.2.15.bb     | 2 ++
 3 files changed, 6 insertions(+)


