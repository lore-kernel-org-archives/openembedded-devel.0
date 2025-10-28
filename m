Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6235CCF9EE
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 11:33:07 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web10.9098.1761651179452168921
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 04:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gP+mxMwE;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7835321bc98so4874396b3a.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 04:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761651178; x=1762255978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqRrWjzByy5Nxo/RntYn59CXtNGWMoy8ZSI2JbrGM14=;
        b=gP+mxMwEyIfL+0m/LFezNrgiQC8EtcsghEly8XRKOEtoVwh4cXAHgyHeJ2+cLq8j36
         DKA/juLTQsoGLI6ejoCGGj4SRHoEKtGjTt5YKCGVNpndBXIeSvAkHuM4I4ahZVt3Wp+M
         PGIl7nuhZymHApFcXRbqu2NaRAIF9dOCRtY42NvAzKfcU/YcESQYRuNLjIMxUQEywxvY
         L/lEYfOja//N8I06/byAjFFeV9i6hehuuckzkOg32bR1SbsKEhqVnd3jImyO/cEjx6BJ
         uBJxCsg8fdC+NCmlFY68soy5y3Dy7uI5Jpj+mhEn/3DtN36P9UWGEIkzg3FC/8mnkD2d
         sR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761651178; x=1762255978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqRrWjzByy5Nxo/RntYn59CXtNGWMoy8ZSI2JbrGM14=;
        b=M+Fc7JrTRUKaxJOaWC1dezy4ydnjKf7yLSMSA1DrKTIoN4tYnQ5ulZvKTnKDdg7Eo9
         ZZz3AYQb4gxoM2vhBU9jk2k63Qus628YFszGwN+ZK9fXCN8aUCHHY7V3/amtyJrY3zyA
         tp+5aitK9y3i2uM+DXL9buy8E7WY3XIqH+FDGE5xXBhfzPjQ7yPYAm3wUqLDgk8WT4Mu
         s7x8hwVNeWcYp9yEL3lZAzr7/DSO1YP5zP9nOGjWprqJwtEVczXaEXSS2GhaMWb7qmTb
         te7q5YF5Z44qdyX75tYVni7x5PAKL2uHwr67pgU9D+sOb+c9G3zayd2/OorTz8J2ZkeC
         pDvQ==
X-Gm-Message-State: AOJu0YwsRddqA1O2K25AuDLg7tj8QibbSgK5I4f3GYx2jeH9SEOY6Kmw
	NdktBiDKF94Wrpj+IOjyz59ZNv98PVZ9ZRIuJQzKj89kDLXdik9vtyKwY2j46w==
X-Gm-Gg: ASbGncuzugmv41HLkH6G8hzyV5r4SuKwb5bYRmw5IpN3QxohIpSpHvGI9nbrM/70ZLQ
	g+bBeVi1Zc133h4Q18gV7YXpuPy7y80cUQY8EljMWiCT4pMbdgmFiyB2TpyZTAVFd1He+OAqvjP
	P9Pp0aWlMsnaDpMi/9dQubcZxL8Khh2aPtNh51k5yvzmECtUKMX7D0+4A6kZ6aEYpFg6eHlPPV9
	r2MYRLPUa/JpOgDDMc3WsmbHzavRHEU3xLwt+J4jdK9kYBTUqVB7jdbaEpbqTIt9fqkllAEIdK5
	7D7C8/YJNK1isVy60+VpTIeYBA1+HSQjPdoSy2d+gmaB7iZQ41scK1uWIRLoxYD1qnPr17kYl7T
	GLM0j2BdwH5bn0PfNpekkH+7kVin1htyiTfYoRqyK4Be/m1Ve759pDPidA3Wl+6PuXEMWndmdc+
	qVjGGmSRaJc92TOg==
X-Google-Smtp-Source: AGHT+IEDJIRdvF9fuW8YGk+74/t5KCKmRSgkp7XCwL5GKzSzD2103Nzl8Io3T14spfokoZgTmMKVBg==
X-Received: by 2002:a05:6a20:72a6:b0:2f6:9592:9075 with SMTP id adf61e73a8af0-344d296b014mr4408895637.25.1761651177681;
        Tue, 28 Oct 2025 04:32:57 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm11819686a91.17.2025.10.28.04.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 04:32:57 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 0/7] hdf5 CVE fixes
Date: Wed, 29 Oct 2025 00:32:40 +1300
Message-ID: <20251028113247.1761834-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 11:33:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121078

Consolidating all CVE fixes for hdf5 together.

Request to please drop patches submitted earlier:
https://lists.openembedded.org/g/openembedded-devel/message/120662
https://lists.openembedded.org/g/openembedded-devel/message/120663
https://lists.openembedded.org/g/openembedded-devel/message/120664
https://lists.openembedded.org/g/openembedded-devel/message/120665

Patch CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch fixes vulnerability
OSV-2023-77 and is needed to cherry-pick actual CVE fix.

Ankur Tyagi (7):
  hdf5: patch CVE-2025-2913
  hdf5: patch CVE-2025-2914
  hdf5: patch CVE-2025-2915
  hdf5: patch CVE-2025-2923, CVE-2025-6816, CVE-2025-6856
  hdf5: patch CVE-2025-2924
  hdf5: patch CVE-2025-2925
  hdf5: patch CVE-2025-6269, CVE-2025-6270, CVE-2025-6516

 .../hdf5/files/CVE-2025-2913.patch            |  32 +++
 .../hdf5/files/CVE-2025-2914.patch            |  47 ++++
 .../hdf5/files/CVE-2025-2915.patch            |  50 ++++
 ...025-2923-CVE-2025-6816-CVE-2025-6856.patch |  65 +++++
 .../hdf5/files/CVE-2025-2924.patch            |  37 +++
 .../hdf5/files/CVE-2025-2925.patch            |  53 ++++
 ...-6269-CVE-2025-6270-CVE-2025-6516_01.patch |  65 +++++
 ...-6269-CVE-2025-6270-CVE-2025-6516_02.patch | 252 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   8 +
 9 files changed, 609 insertions(+)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2913.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2914.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2915.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2923-CVE-2025-6816-CVE-2025-6856.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2924.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-2925.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_01.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2025-6269-CVE-2025-6270-CVE-2025-6516_02.patch


