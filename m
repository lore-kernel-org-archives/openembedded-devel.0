Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C54C5B555
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 06:39:07 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.9997.1749019140850874628
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jun 2025 23:39:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Pf/h6kKG;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b2c384b2945so5162588a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Jun 2025 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749019140; x=1749623940; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jW1fuf35ogsLxI3gRZ7fbmeVBuDG/DKeGa9LT3Hh4os=;
        b=Pf/h6kKG/T9Ki+mNs7JDdBAOJhqolqa6lvEku+l5+MnGeckGcj6S8kCzfm+Hep2/Q6
         AgjyxnqodG1004KUZz4VLvfw/SLkZXiU+vsa8Wa9m2ZaZd6LIA0nOIIZzuZgRgzdLQ9b
         udlqOF8J6wEwKaYi3E0vnGIurmLKo2E0l1wZ8+VYO0P9J4Bi190i1Manpu/GDYut5iZt
         FDiqSKFej80Cbn4q3X7rFilBb0+fhyhBFQQG+8+YWwLXDZfN7C2kkQfVSoej/CbEgo+x
         INa/HP5xp/3q90mZUfaD3dwUASakUqpdafIMsnm0QuPubYYpVcNbYcn9cAoqXZvuiunI
         CV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749019140; x=1749623940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jW1fuf35ogsLxI3gRZ7fbmeVBuDG/DKeGa9LT3Hh4os=;
        b=haFeIlb7UroHUH0FBYREctKS7Pfc0du1YOK/ZATe8oNjpCNdj/A4NFUfUBie20WrLh
         6meAj9ZRrjvKub0Lu3B+Uq1h9s3nNdS2vNh6jdnOqmpRSPUcCmF9LXn2R3EDD3kdd6vG
         +qu6Q3Q4iQI++zKAxBf7bbpz4hOUoLlMHjr4HLitl2kFetgn7SIA+EkRFVyL1GSqtRje
         J8UyBD7ymv+KYA9+S/pRjhqyXppr6QhdBzbjly1DeDi/QPWeyys86n5ZcG5wuctEf+KM
         YBnyX5mQxH4SvHLMMu+isnhp2jD3mQ6ZpyZNUQEMpXW7zSFXLDgrBF2W2LiZ8KfODc0x
         7lmA==
X-Gm-Message-State: AOJu0YxCycrgwMLkYdp3oicd/FrFU0COJ07xEFjS+WKZyNzyqbcigDoe
	3xjg3Qt8YxQA+nxl+U2StGZm+SxtY3U7puEpn+I96uF6XUZdvfGp5Ovw4rEh9ICe
X-Gm-Gg: ASbGnct7PttHoTAD5i8ZQ/Hc8Zf/wvRdLJIZKFjZ+G5uJ7Xi1GJ48dCL5XClV32dEl/
	uMTrL8BZl/WCn6+Pey2VbFK4X6ZY9H8uDfGv4B5/eFL7YuBkD3jvgPcaioRGISADXSnBAGfx6po
	3RCkBNVnGXpO+UwBFm2PNG0JGicjqp/cKqebeBzxkD1/VCrMlWu8KugETHujRw6PE3KRpo7wsA0
	GPo2EGOjo7rlQE/qKEUUueSr56g+A51oQxJ/Cxr7d2EzQSBMYR7jxxBWBRa/1STa0RL7N3qiwv4
	ENPg5SHD6Tk962xhnaGmmYB6yTKYdT4k+LK6In/sxg==
X-Google-Smtp-Source: AGHT+IEreAKWdIAHEXd/x6v+sMr4aRehH8bbmxLYhBxwaFs837Ga+i2McvNkNXks4XwUY36EShjdlA==
X-Received: by 2002:a17:90b:264c:b0:311:e305:4e97 with SMTP id 98e67ed59e1d1-3130cd98a9cmr2645422a91.19.1749019139458;
        Tue, 03 Jun 2025 23:38:59 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::d6e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e32feecsm8218453a91.47.2025.06.03.23.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 23:38:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-typer: Add missing ptest dep on pytest-sugar
Date: Tue,  3 Jun 2025 23:38:55 -0700
Message-ID: <20250604063855.1908198-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250604063855.1908198-1-raj.khem@gmail.com>
References: <20250604063855.1908198-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jun 2025 06:39:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117729

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-typer_0.16.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb b/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
index 87e258ae1f..5295d2213e 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.16.0.bb
@@ -32,6 +32,7 @@ RDEPENDS:${PN}-ptest += "\
     python3-mypy \
     python3-pytest \
     python3-pytest-cov \
+    python3-pytest-sugar \
     python3-pytest-xdist \
     python3-rich \
     python3-shellingham \

