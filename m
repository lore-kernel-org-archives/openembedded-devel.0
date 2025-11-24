Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB4CFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 12:58:58 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15964.1763989136744726287
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 04:58:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yw09eRpa;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b3669ca3dso1726037f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 04:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763989135; x=1764593935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RqYsjqOreGktoFC9Q43DZegiAyW6ocb85FengpgVm4=;
        b=Yw09eRpa6As1vUadR1cYMaMlF3pEA7JugK0y0vaaGyhZHW32TxuEklxg140MWzJ5FH
         j5PJmqBf1mLsLTmxB/QeteS2hS/v6hl2+Jc4t/SC1V50GtlBokJOCT9VJGRxAQZ8yIxd
         Jr/M0q8PEnptPihAwcR81QP0mo9g1K1nJiA8iAts0gu9w1mwPJof22ofusESUkMERBkf
         7uLl0zCBiIdlHJ3sO+2q69cG9En4jmHLvt7uWABUt3GqwP/5Tg/0LQv5tVbykvLBYmbp
         3/l90KUs3LoQLSoAVnFkhYFmawhJMZ6et81Ovx39jr+gjKAbe/0IO25fi6dAmi8UPh33
         yYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989135; x=1764593935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RqYsjqOreGktoFC9Q43DZegiAyW6ocb85FengpgVm4=;
        b=gO9a3if70p6HjVBrprXLA3qJI51vpyzUlpazL6VNNP67QM9Lq3Ga4pYWvNQPgy3K7o
         EtCXg7Y3X+bRyqMQgOB4f5speUdoPVQuFjcxH1FyV7NSEvvGAcraCCIJ6Ai5IbD+bY/z
         Oeju4CFQR+9YkbSM9GwKmjfvEAZIT7OBMgbZlnjqlXVUrzMLoYlVaMWOr8v4FLNR6Fp4
         FVJRKL7KbptTIv6Yb+KFaWPSWimALDiV59PXnsTw2i+dsV4/nXJCofMCRstuB7p9+Wkv
         5Kjq1/YRT8IHzfWkc8NYMNJjc4Eipz+kPY2s1d8NqI88Mn0Vym4xcYAh43rTIxAjculQ
         m4Dg==
X-Gm-Message-State: AOJu0YxhWb3XwK/DxmdqLrlDfvGdN0kP0QeGo0ssvqIiLThOs74wcypB
	M351bsE1a8DG60W2vNjYPKi7jalpX0uSofdQ4bH0yiXOYC9gALTO1lSr/KX7JHfh
X-Gm-Gg: ASbGncuAPdHwI+nllIbS1g4MXowQB7GLkBiqF79FDp9V4TCu7ca/S7hDC8mGbjAhGkp
	M0WEmNZ+o27Pq08CQXK9fme94dQ40kAHalZUje2aul5um5qI7GQdSyyuN6Cnx4aLuIyFCSNf0QH
	u5b/ZjoGL2MfruPje+ZAGtujMi/f5vYTsVU38HiklnAtD95qd/VLPnKACY/o8cuu8kMpYEHUNLm
	4GnycJ3iZr5Q7vby41rpbOWN/vN7wspsmFjiQG4M8b7oWy2IvKCccEAc8B56j6l2iRz+Ok6zD17
	UHKM36jJOXDHNhcvDsId3VpkQYI9nqKu+SOgfWiowstpbnaZrjmVA1verslS7iSOtZbFjQlCxJh
	D6NVxHvIydivJCuojOGJxqjQcycdOv1QyzkyUdpaBaEAYAmJoHcaS/cUFqGUUPWHKnIP3gEKp4P
	nzyue1O7oBN7jOJ7PpJs8=
X-Google-Smtp-Source: AGHT+IHFCpgOmzV/a3hACdWCPpmTt5UXnI7rKRvBI3NLdXvFl4b4taqUdNpDFdcBMRv3XF/Dyg81hw==
X-Received: by 2002:a05:6000:40c7:b0:42b:39ae:d07b with SMTP id ffacd0b85a97d-42cc1d1bf4dmr12273398f8f.50.1763989135011;
        Mon, 24 Nov 2025 04:58:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fb91f4sm28922042f8f.31.2025.11.24.04.58.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:58:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2025-11-24
Date: Mon, 24 Nov 2025 13:58:53 +0100
Message-ID: <20251124125853.734201-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 12:58:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122011

List of all open CVEs (76, out of which new this week: 29):

 - [NEW] cockpit: CVE-2018-15538: https://nvd.nist.gov/vuln/detail/CVE-2018-15538
 - [NEW] cockpit: CVE-2018-15539: https://nvd.nist.gov/vuln/detail/CVE-2018-15539
 - [NEW] cockpit: CVE-2018-15540: https://nvd.nist.gov/vuln/detail/CVE-2018-15540
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - [NEW] libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2025-64458
 - python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2025-64459
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - [NEW] tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - [NEW] tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - [NEW] tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - [NEW] tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - [NEW] tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - [NEW] tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - [NEW] tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - [NEW] tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - [NEW] tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - [NEW] tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - [NEW] tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - [NEW] webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - [NEW] xrdp: CVE-2022-23468: https://nvd.nist.gov/vuln/detail/CVE-2022-23468
 - [NEW] xrdp: CVE-2022-23477: https://nvd.nist.gov/vuln/detail/CVE-2022-23477
 - [NEW] xrdp: CVE-2022-23478: https://nvd.nist.gov/vuln/detail/CVE-2022-23478
 - [NEW] xrdp: CVE-2022-23479: https://nvd.nist.gov/vuln/detail/CVE-2022-23479
 - [NEW] xrdp: CVE-2022-23480: https://nvd.nist.gov/vuln/detail/CVE-2022-23480
 - [NEW] xrdp: CVE-2022-23481: https://nvd.nist.gov/vuln/detail/CVE-2022-23481
 - [NEW] xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
 - [NEW] xrdp: CVE-2022-23483: https://nvd.nist.gov/vuln/detail/CVE-2022-23483
 - [NEW] xrdp: CVE-2022-23484: https://nvd.nist.gov/vuln/detail/CVE-2022-23484
 - [NEW] xrdp: CVE-2022-23493: https://nvd.nist.gov/vuln/detail/CVE-2022-23493
 - [NEW] xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
 - [NEW] xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822
 - [NEW] xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
 - yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
 - yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
 - yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
 - yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
 - yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
 - yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
 - yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
 - yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258

====================

Removed this week (0): 


