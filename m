Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98FD5EE57ED
	for <webhook@archiver.kernel.org>; Wed, 31 Dec 2025 07:54:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.81808.1767167692107233452
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Dec 2025 23:54:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hqakOT+m;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47d63594f7eso797685e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Dec 2025 23:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767167690; x=1767772490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=knDQopk9CildZER8cwxl00zdhY6ZRqZTDKWSzZ/0gVA=;
        b=hqakOT+mnE4GqrPLmLitPkQlXcTyeHbdtnaHDnhDBK6597o7k+T0fRkk8XRx0gmbyj
         14tkYO3rjBvEs4/LzOoGz70x7a7Es+K5OMrRuCD7Jz/vKiRbPuIAAOFBueO0BDoHGOvh
         kPPiSv3nWFS4kpgyEkr7gbRyBR/XuHe3VaZzYhTXJndW8ZURmAeZeB2Oj8hF/aY+zJG6
         TkexpNXBf9m4xHt5XGzYgH+6iyYGiagJpb6CrRtrhNZU5v2DSxvtI2OHUzT0SXQbVsO/
         AiR/V8+6N/XLxyXkyVqYTEP8lKF4eKTRCkucWXiX9edK2JnY5YFoCl1n3LHnDuZUaPpN
         1rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767167690; x=1767772490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=knDQopk9CildZER8cwxl00zdhY6ZRqZTDKWSzZ/0gVA=;
        b=WYhQqrOol1PHSLZh0eLJb2n6FEHIbSfEUxN20fesjIauA37MUBqYjrFkRVVHP4wd/j
         KXlpTzRgGw2PnhfEAQp9z9JnKmm58lWLTINItaD7eGODRY6XTIehMMrf+bjxXuRJd31C
         tIFTUor3ng+6/wGq/8xnB2rJnrzsqzVEssh2SEKvFXf+LU18/bcjJnPH4deOg2w1BnjP
         Ib01SYaMUroXmEjpd1J4C12vTdVhV4qGaBJRQvS50WVw3TDzauaTtbxCU4mbJB0pcfkD
         0Kj/OwAvz7EvgD4UjRjWTDcPPHnzHHsvoyHj+xdn5E5PcHcLra1tLDMzeqQKA/mXL2r1
         HfbA==
X-Gm-Message-State: AOJu0YxWms7YFQ8cRCZsPBj8BjAjzPGuRliEx6LKcSVtl4ABpdWrnO+K
	c5le3LL12HIUd6hmTsHWBaOEgNgmD0aYp0jZynJttm338wi03P71MLIWlnKfLA==
X-Gm-Gg: AY/fxX6KutDtsh78MPJ4exRLCk0dtNoZKznl/k7DAqt1WiRdUUuMV6Ly590S9cK45Fd
	jOP5kP9E/SqfetPf44kXtycYhKFcplIk2ip/3MEZSOuHBTZfro1mDBWBnwtOjNqTAkpjn2neLGF
	XjwKuOTWchWJdVzFsuH4Ld++kexVNVgbqtHsK8u79mMTzEHYhuaN9G1W1rZrzctg2Vshaycj2d7
	vekuJBeoy6RL7Jmtzm5mN44qfX1oTNO97HcXInAUe8ck7dD4/Q014YPtxFB7qnxGxl4weMnuMn4
	ZKXR98sF6Tnf6o7o05VUueJsHDQge58T4rO0SE5vuk6TxwqNUOfcfH7dCySMi1nLeibyLL//Fmu
	pLxzz+wsliL3iZ1qSPlHb5pCdplodwDNxAflL02k/hjq57lrO+yBQzpVD45O2W/dUh1sR7QQzZo
	thxgdVNcX0
X-Google-Smtp-Source: AGHT+IEdz3kHM8r0pJOf415su92c+c+T1LRe+Q0w0S0I4wkc9MT4Pvr3a+HYh00hZXD141gM3Rqqbg==
X-Received: by 2002:a05:600c:608f:b0:477:63b5:6f76 with SMTP id 5b1f17b1804b1-47d19582bfcmr389989695e9.25.1767167690374;
        Tue, 30 Dec 2025 23:54:50 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273f147sm700559825e9.7.2025.12.30.23.54.49
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 23:54:49 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 19/34] python3-binwalk: set CVE_PRODUCT
Date: Wed, 31 Dec 2025 08:54:21 +0100
Message-ID: <20251231075436.771395-19-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251231075436.771395-1-skandigraun@gmail.com>
References: <20251231075436.771395-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 Dec 2025 07:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123059

Set correct CVE_PRODUCT to use instead of the default ${PN}, which doesn't
match relevant CVEs.

See CVE db query:
sqlite> select * from products where product like '%binwalk%';
CVE-2021-4287|microsoft|binwalk|||2.3.3|<|0
CVE-2022-4510|microsoft|binwalk|2.2.0|>=|2.3.3|<|0

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
index 288c4068cd..e2d6b24acb 100644
--- a/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-binwalk_2.3.4.bb
@@ -10,6 +10,7 @@ SRC_URI = "git://github.com/ReFirmLabs/binwalk;protocol=https;branch=master"
 
 SRCREV = "cddfede795971045d99422bd7a9676c8803ec5ee"
 
+CVE_PRODUCT = "binwalk"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 

