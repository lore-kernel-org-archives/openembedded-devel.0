Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F154FC54ED0
	for <webhook@archiver.kernel.org>; Sun, 25 May 2025 04:14:31 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.3643.1748146466095014498
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 May 2025 21:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=llVY3ESC;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73712952e1cso835902b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 May 2025 21:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748146465; x=1748751265; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i1mk57iksxJksqSRfqZ9oxwtpq0xiHUXTL9D2L1JkIE=;
        b=llVY3ESChv7Vk0DpILTMPI1jR2kKzlenr8ESW6CZwSrUQRWq1ddYEbhHbqlxQke7tb
         s4pmnT3QCJm5BYI86gteSqYEtNNu3ecf5EyEEyBF0qT1tC9rJRYd21rzZVF4PSU23T7D
         XLgLAQxLEOhwxQWmGEBWYDiO+nrZ07Q+geTID/UUEqxHdZOrcYDT4c8Ma6rVB/l6Fktv
         r7nzXry7SOxccMbcaCdrT3c/oEW3NwunN5gyal7X7bqADMc8VLf6o8cDKJoO6+7LG+n3
         XqFVR9/VZdro7ZyktqbRTNhTCdBB34dBuEPrOiJuC2h3FCqqTuoC1CbvpHw4JWxV4U/Z
         k3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748146465; x=1748751265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i1mk57iksxJksqSRfqZ9oxwtpq0xiHUXTL9D2L1JkIE=;
        b=fPEGC1tK58/k6BPcZR4iKzkTSKI7AVAs7Ip2gPQydBwwC1CKD6w6PyIMs4ez1/YSbp
         PrpgQh67p4qYrbwBNbqrX6Ae+j/L3K7VVXQepwWbqWvvG/qj60q4WmtVRooSycAEto6n
         0BvVJNkHiqkVr9XNX4zKSVrxeGKzmAlElIU+kvbS3E9Z4zM7OKNmAKHKHp4/RQXO3KlU
         mAcHiNVwhBzXbx6Ga6KBZ9+ZMvpmOmNc8izFlqO708kZQ/9ic+rDQngAZOnVns1JTD61
         oj7dnCKkxQGxecP0rcCeZdBQbbQIrXBl8q3mnes046ytTUuluPRnLFBujQOrVlHWlUdZ
         kvHw==
X-Gm-Message-State: AOJu0YyvgTK6fIXKEm/3Se+kAtSGxZxdrCf6xXueIfZJxT56irYLK6FR
	190MsXfD9ibrJSOL641X+2iBruZSlttuBsWzUiGjL5lyfm0cvCynOj1PwMSZMYif
X-Gm-Gg: ASbGncvlsxbNRbf8O+CCvda54P4LamefgBAFJGBHaJdkZGwWHpiYhyja/oUCzaAcwof
	Cjf7lRUzyjqegqishcfCT51Pd6Z86bqz80dHtQT4yssO7+1l61IGa+krlPEUf6KghbCviaqkila
	MHkukmwt70xdibgIpNKYWpxp9gBvgc9PnSGy8HjVdcJIsXD0CeEr0mC9IDvjBPxtagOyDdK5S5c
	3UloxNwwnhg/XwvjL05R8Skr7SewL8hpPb+luiE9Vg+niO5vEwSzEiJOocKV9WB72EwAOTsXZsI
	jexCTsB2k1GZvWV8WrcYT0O+jDfWc5DdsBibZuv/ntt2Csj8cbMk4Q==
X-Google-Smtp-Source: AGHT+IFAI49Tyak1AppIiZCi/K0u79sO4MyTWZQCkBzLA1ehYoJJ0lqbFdSgtNyQ4yWRyIrBb097/g==
X-Received: by 2002:a05:6a21:458a:b0:201:2834:6c62 with SMTP id adf61e73a8af0-2188c28d3d9mr7008349637.25.1748146465133;
        Sat, 24 May 2025 21:14:25 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::deb9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb08450csm15060463a12.55.2025.05.24.21.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 21:14:24 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 1/2] python3-pyzstd: Bump upper version of setuptools to > 80
Date: Sat, 24 May 2025 21:14:22 -0700
Message-ID: <20250525041423.1210095-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 May 2025 04:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117615

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Bump-setuptools-dependency-from-74-to-79.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch
index 8fc26bd90b..cbc167157b 100644
--- a/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch
+++ b/meta-python/recipes-devtools/python/python3-pyzstd/0001-Bump-setuptools-dependency-from-74-to-79.patch
@@ -22,6 +22,6 @@ index dd885e4..9f273b3 100644
  # setuptools 64+ support --build-option
  # setuptools 74+ drops distutils.msvc9compiler required for Python 3.9 under Windows
 -requires = ["setuptools>=64,<74"]
-+requires = ["setuptools>=64,<79"]
++requires = ["setuptools>=64,<89"]
  backend-path = ["build_script"]
  build-backend = "pyzstd_pep517"

