Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E106BD3B7EA
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 16:28:22 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1013.1765211293169249225
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 08:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dCEfMQ6m;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso35200665e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 08:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765211291; x=1765816091; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5VzD8IskpX8LQzycE1vViaV1ISdu6wMoFEHMqCQ4TVM=;
        b=dCEfMQ6m83Up8n1ynRTzieWmB8ka27yTVSs4ss6iC+pAoUk3g31MGSTUK5iPikRE6U
         WinUu9Gs+wgSdfN+7AbYFd7Luys/PH/EeUjaewqW7/sQSAF3QIzqTjPkjT64g40t7O5C
         axhtrYFnN/gLY5Ce/f8iAgyCt1q3yW+ZHhLfys2IPhXY8CGdb0NcU3m3DDhvjQV37bGJ
         6VxIsqiByubtPB48FkvfbURAjb+1A/2mrEehfA1j/xDfGd19iUSp6utQal/DR1SGxuYl
         zQ19H7ZuVeNpxQT4cJWgC/STgudQslV9exOM2hP90l6RNKfzvWY+zAGIsceMxbdPmnPa
         DO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765211291; x=1765816091;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5VzD8IskpX8LQzycE1vViaV1ISdu6wMoFEHMqCQ4TVM=;
        b=oOsuYzHXAJl3ePKg6Bj8pSLAYe8HQVsmE6wwQlZpHZcY6/YA0XAVPb8ADNex12NUCi
         e1c909w/SZWK0SjhAnh13RB3WsJFvVunPwbhdHBmMNT2uD9oVQQoeSHZ4cPLuUEhNZM5
         gWrDBbfRMSJzu9CaFnjjO6U7LkB1HK2/dwmbCy7qZLtgLSSdSzVu25P1802wsiBxFJdO
         vAfv5yF+TOZhWyLllJNQXoCJLYV/aAHk21jgEON2O7ljerhZKgrxKGY35qtBObRXfXfK
         v0bl3t8H4bm9gAz01rERe8HkY6LCYCawhy8K7XuPbyYB3vi5loMDRK8TDJ1fE6EUkBA9
         Febw==
X-Gm-Message-State: AOJu0YyC4XqJz5rZpsgI9UAjF3xYNVN3h+ScTA1FxYH1UoWDZmvYjfDT
	Nheq7PFsNbqwQaGcCwSTfnD7d68w2rvRcdknJmpzYqwElICMD264UmNXs4oM6g==
X-Gm-Gg: ASbGncvIvyT+PEJK6tQ7/56FXsDzyCE8+TI8yIHhHHEjWmEbBGom170/n1MmGSI2e/k
	GsZqqV1LANA2fAVuvdk27aacWPsEzuQpCfwcRtqfMvT15o3HVFfnbQtruczBMtD+HA2Z+9bOVBY
	svZi80mSXCvyYtOI+jfXhutK5hno0COtPhav/rPy+lzrSOjXWT7+uJyLDyggySRh4JXY70Q2QZL
	f3AmzzP4AiZy+mllUJ3uxqx9kR22nrf2g/gDZAWZVRAG+7V0StPhqFC+JGyISTW+5NI0NsUy+CN
	/PL7vjWJmx1BNRtfL/k/rhUc8QfQIcyCPib4xNfR3WdPKNod4r/QQayooJ9Ae158h5bKsPEKd0z
	HYru8iIrqBZKpn+dXqLh0YF3XC7iU1ErDXinwd2j4zMyHz5jpGnFoqO+RpuaCNd4WKEfDprBqtV
	JxuMRIrXXA
X-Google-Smtp-Source: AGHT+IHHYHZcUTgBKni0Ooon6Ay18C2qTj9iSLKS0d7UwN+oRzI3BGKjYwlOcQWifFmxM4km1ENpTA==
X-Received: by 2002:a05:600c:1d10:b0:477:5897:a0c4 with SMTP id 5b1f17b1804b1-47939dea834mr65553475e9.4.1765211291485;
        Mon, 08 Dec 2025 08:28:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47930ca4aacsm238455245e9.14.2025.12.08.08.28.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 08:28:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2025-12-08
Date: Mon,  8 Dec 2025 17:28:10 +0100
Message-ID: <20251208162810.3599569-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 16:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122380

List of all open CVEs (119, out of which new this week: 47):

 - [NEW] accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - [NEW] apache2: CVE-2025-55753: https://nvd.nist.gov/vuln/detail/CVE-2025-55753
 - [NEW] apache2: CVE-2025-58098: https://nvd.nist.gov/vuln/detail/CVE-2025-58098
 - [NEW] apache2: CVE-2025-59775: https://nvd.nist.gov/vuln/detail/CVE-2025-59775
 - [NEW] apache2: CVE-2025-65082: https://nvd.nist.gov/vuln/detail/CVE-2025-65082
 - [NEW] apache2: CVE-2025-66200: https://nvd.nist.gov/vuln/detail/CVE-2025-66200
 - [NEW] cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - [NEW] civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - [NEW] cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
 - [NEW] dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - [NEW] fex: CVE-2012-0869: https://nvd.nist.gov/vuln/detail/CVE-2012-0869
 - [NEW] fex: CVE-2012-1293: https://nvd.nist.gov/vuln/detail/CVE-2012-1293
 - [NEW] fex: CVE-2014-3875: https://nvd.nist.gov/vuln/detail/CVE-2014-3875
 - [NEW] fex: CVE-2014-3876: https://nvd.nist.gov/vuln/detail/CVE-2014-3876
 - [NEW] fex: CVE-2014-3877: https://nvd.nist.gov/vuln/detail/CVE-2014-3877
 - [NEW] fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
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
 - [NEW] gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - [NEW] libcoap: CVE-2025-65493: https://nvd.nist.gov/vuln/detail/CVE-2025-65493
 - [NEW] libcoap: CVE-2025-65494: https://nvd.nist.gov/vuln/detail/CVE-2025-65494
 - [NEW] libcoap: CVE-2025-65495: https://nvd.nist.gov/vuln/detail/CVE-2025-65495
 - [NEW] libcoap: CVE-2025-65496: https://nvd.nist.gov/vuln/detail/CVE-2025-65496
 - [NEW] libcoap: CVE-2025-65497: https://nvd.nist.gov/vuln/detail/CVE-2025-65497
 - [NEW] libcoap: CVE-2025-65498: https://nvd.nist.gov/vuln/detail/CVE-2025-65498
 - [NEW] libcoap: CVE-2025-65499: https://nvd.nist.gov/vuln/detail/CVE-2025-65499
 - [NEW] libcoap: CVE-2025-65500: https://nvd.nist.gov/vuln/detail/CVE-2025-65500
 - [NEW] libcoap: CVE-2025-65501: https://nvd.nist.gov/vuln/detail/CVE-2025-65501
 - [NEW] libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - [NEW] libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - [NEW] libwebsockets: CVE-2025-11677: https://nvd.nist.gov/vuln/detail/CVE-2025-11677
 - [NEW] libwebsockets: CVE-2025-11678: https://nvd.nist.gov/vuln/detail/CVE-2025-11678
 - [NEW] live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - [NEW] minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
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
 - [NEW] openvpn: CVE-2025-13086: https://nvd.nist.gov/vuln/detail/CVE-2025-13086
 - [NEW] openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - [NEW] polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - [NEW] python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2025-64458
 - python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2025-64459
 - [NEW] python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - [NEW] samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - [NEW] samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - [NEW] tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - [NEW] unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - [NEW] webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - [NEW] webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - [NEW] webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - xrdp: CVE-2022-23468: https://nvd.nist.gov/vuln/detail/CVE-2022-23468
 - xrdp: CVE-2022-23477: https://nvd.nist.gov/vuln/detail/CVE-2022-23477
 - xrdp: CVE-2022-23478: https://nvd.nist.gov/vuln/detail/CVE-2022-23478
 - xrdp: CVE-2022-23479: https://nvd.nist.gov/vuln/detail/CVE-2022-23479
 - xrdp: CVE-2022-23480: https://nvd.nist.gov/vuln/detail/CVE-2022-23480
 - xrdp: CVE-2022-23481: https://nvd.nist.gov/vuln/detail/CVE-2022-23481
 - xrdp: CVE-2022-23482: https://nvd.nist.gov/vuln/detail/CVE-2022-23482
 - xrdp: CVE-2022-23483: https://nvd.nist.gov/vuln/detail/CVE-2022-23483
 - xrdp: CVE-2022-23484: https://nvd.nist.gov/vuln/detail/CVE-2022-23484
 - xrdp: CVE-2022-23493: https://nvd.nist.gov/vuln/detail/CVE-2022-23493
 - xrdp: CVE-2023-40184: https://nvd.nist.gov/vuln/detail/CVE-2023-40184
 - xrdp: CVE-2023-42822: https://nvd.nist.gov/vuln/detail/CVE-2023-42822
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
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


