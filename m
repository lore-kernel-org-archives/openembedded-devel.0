Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CDDD116F3
	for <webhook@archiver.kernel.org>; Mon,  1 Dec 2025 14:48:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23141.1764600498206501910
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Dec 2025 06:48:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JZaEEU1R;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477632b0621so26363205e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 06:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764600496; x=1765205296; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHhQ8EOyhIAYHbfBu7nQk1CC8ue8HFfEdOK6fwIxQz4=;
        b=JZaEEU1REe1kT+meimZvqw9lBruN4bUkb6A5U4ZxJ7MqqM5yZVVIv0yBAyLf0Ot//T
         wPFCctTolFYPrwEu18ECbnI8cjlIRWht7xBCfbdjLAxz7rylJn9u6ZDNYPKJ0Hink2nx
         6DvZkOPeO7bBdXCOxm6/lOzKEuvr6ClRc3QLqdbJszx1O7wLzzY/9u3KchwcMbtVJARq
         kaQsQaNxKMZGwEJA21wGs8XxNYVOfty35lldC7SX8gZGmkU9BwE0SILFEB61YHP2Btj7
         Zpxg8MAKN07jkSxBC3mCGAG4uLE5Rd31gaJRjBUZ+WOCzo0Xcl0z2cMrDTOmzvdJlxtD
         AwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764600496; x=1765205296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHhQ8EOyhIAYHbfBu7nQk1CC8ue8HFfEdOK6fwIxQz4=;
        b=G/RymVz22WhJBm60Mi4OxTwRY6SFX8XiZKh19i9p3rBFtjLrDmWGhpqqQu4rUZfgU0
         25raf4XWaq2ONvPzWGoSahsAa+nPT8n1U7rvl1Rr+lCujQTRQ2R5Z49uB5xPRMT1WU9i
         W75t9ljly7ai4JxD6kcf2FaiSKBSgGhlutrRizsMEexy2jh11Zm+RTxkFcoYH+1kvNlv
         XXRFOCZoHCsadl9JWmsugvyJeNYivrzuqzpOVwA01GqOiijmCN1KNucPzz/xxkLD3jLG
         tuptzffCm7YCk3z5GrcEgwtY1/uCitSyTnY/qdX8HosejhR7DAPEkF1buATlzpHYDYoQ
         xdpA==
X-Gm-Message-State: AOJu0YxZMW0jOaLUzBuhipvhN0i8jTqIPiCFK2YJNRpSxdKujbHRDhYw
	LFibkLzsFSkX+SuZDko3YoWPrNJH/zVtt+acaGM7j66l9v9Ea1FQUDy+fbbAzg==
X-Gm-Gg: ASbGncsdssipjO+uEjxqseF5tJvFK4h80MFKkV7ISRP4qXfoZ9bqLx+90oiUUQnourr
	qbvToASwzhpW24Kjae7GQEU+Fc4s1zrKiCeOnwqQIUYB0C7YmUIPZi03vegQiMMNl+nSehzmNvX
	f9PEFX2ICQHlqXFdfFJGjU7lObMXO8BBCfLsaTIGaW+LJ46U5gt7XurlvvBJ1iHtcbVKCwwnWpp
	RDMGB2g8TDnCa/088vCSOdgkqLW51L5EFaPYuyncyrF+PCiYv/OkN26FYetxokA1amdRzjJl/ks
	Xz3gvmAtCqWQuUOMyJtDvl0Kh3MITAo5hAovAvtehHN6wxBPPmPIXOd4Qj6T84jSO70UQ8Cppbe
	1AeXgSj+V3X94NcsXuVk2GoI5QWpdZ1AkcPLEGTKKOQxpZ8iTeWt0MSqq6S6Pj7q1ktkeMo/xZU
	aBiCFkA2li
X-Google-Smtp-Source: AGHT+IEgtL7+RW0y+5shzIiZn9F0A7NP3iQmB+Y+VrXI3zOhHAgCeye6P+yT+hOVCMHPIxjLbZX00w==
X-Received: by 2002:a05:600c:3111:b0:477:b734:8c53 with SMTP id 5b1f17b1804b1-477c10deffamr387295415e9.12.1764600496456;
        Mon, 01 Dec 2025 06:48:16 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479040cfe17sm159467895e9.5.2025.12.01.06.48.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:48:15 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2025-12-01
Date: Mon,  1 Dec 2025 15:48:15 +0100
Message-ID: <20251201144815.2687344-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Dec 2025 14:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122213

List of all open CVEs (72, out of which new this week: 0):

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
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
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
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
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

Removed this week (4): 

 - cockpit: CVE-2018-15538: https://nvd.nist.gov/vuln/detail/CVE-2018-15538
 - cockpit: CVE-2018-15539: https://nvd.nist.gov/vuln/detail/CVE-2018-15539
 - cockpit: CVE-2018-15540: https://nvd.nist.gov/vuln/detail/CVE-2018-15540
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548

