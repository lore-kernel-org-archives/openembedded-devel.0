Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AC87CFA466
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 12:59:08 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15971.1763989142400253224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Nov 2025 04:59:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y41N5C30;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso2641256f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 04:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763989141; x=1764593941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0RqYsjqOreGktoFC9Q43DZegiAyW6ocb85FengpgVm4=;
        b=Y41N5C301UdKK2hVkSjUM+HETVwS79QE4/fiIaHl4tM4XAjOUXkn3JeTr7haLEaC2f
         mMIAma8Vz/xnPDZQ0VuQsaWPM7VILYj6L1xtfRNh61wlNaSwILEEeHKftNoBjVa8f8Yc
         Ww3oyKMNqsmtieE4cPu9YefhQJe/mUgssRcNUsvNtrmyksinF3R5LwLW2B9fWnEWE3SM
         Xx1lP2O5Cza+aj47z4KtYgfZc7ZyMVedVpVH/wZLt9uUCDtXuXW8qfb2nHi4AODFQM9D
         twpw2ArVkTKwHI/ilt5E9AqFIHtrvYlC5deTMSBarUiM2ruBy4LiESuAZ/j8G2zJZk9W
         C+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763989141; x=1764593941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RqYsjqOreGktoFC9Q43DZegiAyW6ocb85FengpgVm4=;
        b=Ol1AdrEjHsczpQAZ86gXYUOgw6nizBZ6vOgLWCBwumEiyU39S/e4OMTZZ9v0fUvfUj
         Nlb4oE/ua3gjJBslh8GmW8+RYMyV3aCxlsWAi92azgZlNr9jpXe4qrqkZ/dX2ZXEFLSp
         Dle8cYVhr/JFNYoD80khh5AhpX7SngB/bTl1b5SQpeP/Us0eRzfn3MKtZpa45/9fFEqb
         RLiGkaql3Og6HEtCGMB+L4voLCryFwgtnb8I6Db+xWQzUGPAltJDfOIG9b6nGyMPqMeO
         R8oogY/llL+iwoH7h4DwP2vHzuGk3OETrT2/FrGuTMJk2BzfeKMpeMVa1OX5p2vkVkJs
         KNTw==
X-Gm-Message-State: AOJu0YzmXfgcKTK8fZT3Xx/j1CbPB4FcovjwyJ9e3xrAoBK3feILPshY
	+SCp81swZaZ7Z7rs0nWx0yhYoybgXRz+4lji3r9zUz2izYt0REBqmGpVExi2d1hV
X-Gm-Gg: ASbGncuczrkCMrH3I2Ve/UvNgyei2dPDhFrzUqBRxd1zC+FJrp6dIF0ndQBo/6mTt7o
	HDJPLS77MJR58V/JJ/Gf/RqGds5uFkc/WE7EkCCagGCfGVTdkgzr5Tg/43fy8o+Sp8GBLJlw7pZ
	9hSpA/RhPEDVJNgj4Szas++WeUiz/M7ofd/DBzJhBxjFU49f1QBdhhZ02tIv8KSAqJbBB3SRms6
	kioZt6H2nyfwOr0jKDe3ZTlFSZqptVMvru4xv/9xRZZEONrfhrkbViq6i9EjyLa/P30Bq+zhZH1
	IIPT5SVge9+zRjzPFv/Oy9DNWsw2s2UcTQjXzuaU7G+BkV7jRD/Rm4TnxFZEIesIr1qP450+y8b
	rO81dyXFwlW075+rY6cWThff9TzhoDXaUHbXYD8CqA/Jda4hocP1kglaG6Rv4wHAIJc23fU1SPW
	9uuMMP1GiI21EKcdLiq0s=
X-Google-Smtp-Source: AGHT+IF8LECGW7WG3qq25m9Rtn9WtJppwoaLNMX6Dal92P0O5Jvtdhhij5GYF+dwcYMfr9Ub7WViWw==
X-Received: by 2002:a05:6000:2281:b0:425:825d:15d1 with SMTP id ffacd0b85a97d-42cc1d347c3mr12756585f8f.44.1763989140282;
        Mon, 24 Nov 2025 04:59:00 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fa3592sm26973858f8f.21.2025.11.24.04.58.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 04:58:59 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-11-24
Date: Mon, 24 Nov 2025 13:58:59 +0100
Message-ID: <20251124125859.734223-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Nov 2025 12:59:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122012

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


