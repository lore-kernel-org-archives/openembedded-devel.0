Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6BCCCD183
	for <webhook@archiver.kernel.org>; Sun, 19 Oct 2025 13:43:05 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.24468.1760881375601936829
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Oct 2025 06:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TBue+nMM;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4270a3464caso1170764f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 06:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760881374; x=1761486174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ikAjsrt0mfz2Iaj2bxkl2FX7i6i1bPorVbIjvVf9Dy4=;
        b=TBue+nMMFUoj4tcAXJ2QWHxgYRAI8kfjS3EZRcALbruZlrfTThSar8uHGaVK2nofz9
         vtlsLakRvliGCs9Y2+pIyOtrfHX5VS0VV1zAIxg53z2gH2DMY1hDTm3B2RuASLxvDo1Z
         S+GfCfvuqgHodwUnHJOoG0UDuqeyH1b7n8odHzLL4eCVlL1JHyolhY5hpc11YH3tXL6P
         LWVbMkE2uAQPMA4HqSNX0ffedhB0ncUspZpKulDPZkjrJf6MGcm81RJGdfsYrEthN+wa
         EUNp403faETBxJ7LbGOgr8/SzieXdon46IVhSN9NMYRkeF2E1qhX0MhfDvU4ZDf/NUD5
         d9dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760881374; x=1761486174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikAjsrt0mfz2Iaj2bxkl2FX7i6i1bPorVbIjvVf9Dy4=;
        b=OcF5EViHTyDQAjLpx+08Mbg7rl/JLYWm7484j/bTs3384QNuEjUt0cvTIoSqqGo5Yl
         OUUFXbvjZ6/e2v7K2hEaylEY+vTEqsdog2VPoZ3XObprxcTsGuhtmD4rrv0IvbivC27M
         yctfFxDOa0tHiSOi2R/NwuZcbE5RXtBjCXGoGGYJt/lXC3BcATAKbcXv5Zi7OhsAcY3o
         pbFrC39wnrqlWJ2JSx0RjYu9CQvPab01HFmxppiJNY3yb/qrkys7D1xWo8UzMPN7gZyk
         HCWUQjNzrwqFnpCp2oElJ7jQwbZBQWHcv5Bzu/l0GAB6G11vyYuxe6GlW83kN41ZBv58
         0k0w==
X-Gm-Message-State: AOJu0YxWpKx8G3N/kY5hiFeRt4og+FTDXR6Z4s1d9ERnQ4yoe7YyhcpN
	oXVVGnGoyuv8cFCPJTPS0pdaJtzhIjPkflom+O3IHjXA1qPLa5NIBWdQTym1Zg==
X-Gm-Gg: ASbGnctcd/PR9M8jkcFfqDsU8/5jUJJL1knVbRo76kZaEuSUrR7FLUvESqemRmTNAcL
	OXHX5iLf0UFZ5kWJU3HpYvd8niAtbcdVuRAblqSU38Mi1zyFe922KWmuLqfOM7IRZjKjXZ0Z/X7
	BNlbFewGDNTI0pBi90QtyBzf7Q39jpVfQdFzIlHB02SRWE1YJI09cDAP4HUQASXZES9rukOEYyg
	5aUzBn69xOl68M5jwOjz90sc0aussgK6WNKOZlaz2o98mo+vEoLZsC0emipyfA9sNtx33yd3SA3
	0Fz9FxZ91OUiaYUlkZHktg278ezSrP21tyV6gJKppfThUv6mZJ/4gdGMyzggZoXQwDmyMkRL8qi
	FmfdyKKZKNSx5Ixc2KRnZP1fvhMef9Xzg92EK5YyeD3OmLoLn2X6S5hAJimRF2NHu0dUwxxVw2Q
	==
X-Google-Smtp-Source: AGHT+IHNwFhRX4cs26JfiFH5UwbMvhjjg93HS0NR8ei3dkJWZ/aKCA2KMonC9u+jgmhK3RApqohYmw==
X-Received: by 2002:a05:600c:8b30:b0:45d:f88f:9304 with SMTP id 5b1f17b1804b1-4711791cbcbmr73132485e9.30.1760881373860;
        Sun, 19 Oct 2025 06:42:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3d4csm10056136f8f.19.2025.10.19.06.42.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 06:42:52 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][kirkstone][PATCH] python3-typeguard: update ptest dependencies
Date: Sun, 19 Oct 2025 15:42:51 +0200
Message-ID: <20251019134251.1100187-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Oct 2025 13:43:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120793

From: Derek Straka <derek@asterius.io>

Signed-off-by: Derek Straka <derek@asterius.io>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit bb8e0534be8349e73b069a63739e965e9442934e)

Adapted to Kirkstone.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
index e9fce61452..4126f5ed66 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_2.13.3.bb
@@ -15,6 +15,7 @@ RDEPENDS:${PN}-ptest += " \
         ${PYTHON_PN}-pytest \
         ${PYTHON_PN}-typing-extensions \
         ${PYTHON_PN}-unixadmin \
+        ${PYTHON_PN}-mypy \
 "
 
 do_install_ptest() {

