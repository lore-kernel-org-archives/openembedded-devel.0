Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411E9D5B84C
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 16:05:26 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52538.1765814720150384473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 08:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Idn0ZYXh;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso16225915e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 08:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765814718; x=1766419518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lb7AEpWjrVJxgaRD8zJWXijb1Qm8aZuU6IefqNEU7iA=;
        b=Idn0ZYXhjJzH2T5qf4JFq68/VUjlS3+vEb02opZnYYvlcCSZhmrq6E9nPBIAx1PvNN
         7uQzTzJbRgHYMsv/XS2JILwFO9EcdQiKuKP7KHY3T68QJBAfPljQImC3CGUMgXAY7YBd
         gDNBcsjSi0/SeQSwAivNA3ho0gYbb9FIAeLuoKmJPoNCF8MsYJeK6K/Q7dCe8nC/wNuM
         GlIWytbzRcJbAJwdsIStvKBxVV66aec5kB/ulotdYJMKBrrYxPmLk9vlhU0BgiP1v6GB
         ZiAOQmQgWmAcYubo/Nx9MXUzrSJb7C9p4BpukHImzYab5IqhgvHWE5W+OXOMdwgHZrwZ
         V+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814718; x=1766419518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lb7AEpWjrVJxgaRD8zJWXijb1Qm8aZuU6IefqNEU7iA=;
        b=w43ntZRA+eIeaT/8lIu94GYBbh6lLvHZIqloq8kcnNiImVorUM+iJUSKClcCkxhuLQ
         wpvSa9aKCoOSbAAVlpl9HS2KyvJP3KVChScNjs6oHpOCGSEIMSr5edsS1sgDEVpn6zBU
         RJawcJDQbBDWKXHYqkOKYVH0KBxPjZf1EOc7AFXm8nLr1rebIJ9W3bvAzY4C0ZniRUqK
         81m7MeOCrwnwCKCfnXqbSP0U6AdxYXSoyqpuXaUel/yZrIMImux2VXTOnDdVyqSUUPYk
         pru1IB1N5kS5e2g5YFvr4UJC0O/fxd2Idj0m3JQw0YkjQ16DRElx+wty87KqUYa5psKv
         fV+g==
X-Gm-Message-State: AOJu0YwlXxeypNH7iR/+zoSJn3Pp9yBRLpOYP72/zOckU4O+ACkT1gf1
	b3WbqRO5y51lu+nTCgwKDFGMz/VDw1EwSgGjrdxs1sF0R7GbpOo9WsVyZQGx9w==
X-Gm-Gg: AY/fxX4gna/62+scGjxyrYGrQ2VeOqVcInsgLX44k582eGdX2IdmkyUvsKoZI1JgOva
	rjaj8K+TM+CuWTeuSPJtHHCtAnJkdeG77/vh8dEiJCWcUyIqUCNAvKCdGIi70S3aaxYznKKxIqd
	vtSk0HuxwKps/ls2AYQqpugkpvWGMje/56qEJGD9D2rU3mo0i/HZmeUxgdxlukiisLY3e/yBK5C
	KKcWSgKUL90jEMVclW5ZXrxXTYrFP4+EQKhkD1EmmkidNrESAKeEGjK2N9RidE6DqHpBj5p15uY
	5/STsUu+IM8NeNJ95Xfh3Iut9jFdK7tPr6e8e2CkPg1Sfn8zvRcW6G4aoIrrg+zBQkAmyZ+NtDq
	7twnIkC2weVT0L/tV8LGe4oBW9MusRZk2CNXpOYfqSHZouQwsYC2XK8PgjRRlSys/gVW+8qbei6
	kh+G1CKY3l
X-Google-Smtp-Source: AGHT+IFtP+SMhITD3QTpaAonsrLlC753JfzzTnlct8DCY4ooYBO2ygDNLf30oAv9LPXAGE2DxKOiHw==
X-Received: by 2002:a05:600c:64c8:b0:47a:814c:ee95 with SMTP id 5b1f17b1804b1-47a8f8c0532mr125950435e9.12.1765814718426;
        Mon, 15 Dec 2025 08:05:18 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a8fa7fed8sm74380875e9.5.2025.12.15.08.05.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:05:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-12-15
Date: Mon, 15 Dec 2025 17:05:17 +0100
Message-ID: <20251215160517.2697355-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 16:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122659

List of all open CVEs (76, out of which new this week: 13):

 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - [NEW] dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
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
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - [NEW] imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-2025-65955
 - [NEW] influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - libwebsockets: CVE-2025-11677: https://nvd.nist.gov/vuln/detail/CVE-2025-11677
 - libwebsockets: CVE-2025-11678: https://nvd.nist.gov/vuln/detail/CVE-2025-11678
 - [NEW] libwebsockets: CVE-2025-11680: https://nvd.nist.gov/vuln/detail/CVE-2025-11680
 - [NEW] live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - [NEW] live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - [NEW] minio: CVE-2024-36107: https://nvd.nist.gov/vuln/detail/CVE-2024-36107
 - [NEW] musl: CVE-2025-26519: https://nvd.nist.gov/vuln/detail/CVE-2025-26519
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
 - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - [NEW] redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
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
 - tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - [NEW] webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - [NEW] wolfssl: CVE-2025-11931: https://nvd.nist.gov/vuln/detail/CVE-2025-11931
 - [NEW] wolfssl: CVE-2025-12889: https://nvd.nist.gov/vuln/detail/CVE-2025-12889
 - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395

====================

Removed this week (10): 

 - accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
 - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - fex: CVE-2012-0869: https://nvd.nist.gov/vuln/detail/CVE-2012-0869
 - fex: CVE-2012-1293: https://nvd.nist.gov/vuln/detail/CVE-2012-1293
 - fex: CVE-2014-3875: https://nvd.nist.gov/vuln/detail/CVE-2014-3875
 - fex: CVE-2014-3876: https://nvd.nist.gov/vuln/detail/CVE-2014-3876
 - fex: CVE-2014-3877: https://nvd.nist.gov/vuln/detail/CVE-2014-3877
 - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394

