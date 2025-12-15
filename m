Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E571D5B84E
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 16:05:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.52511.1765814715893043006
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 08:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VC4cWIJw;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so28220665e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 08:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765814714; x=1766419514; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tJDz6hzC4eAfFQF6ZrTHixGkolYYuz3YP59UTRaO0VY=;
        b=VC4cWIJwbA96bdAVTpIfT+w7TwQOy5t23ubiAJrd4UdKBIT3EYelEBotOdLD24bK2f
         iozeD9KM9erLEu8Y+uqA+ASVlSwgSJKF7UBPeOo2il4C5Vh11S4kGi4ALFl77Tk2IslE
         e2zW+k0jUs8/wOtEFHxA2ia0cS4Ob5f/YAugiQVGp+ggFS38lXGDFERbHXVQ/CyhHAu8
         HLaw0gqyPG3C6hbzOM8ZX9i8GKbU/ERTJ05sVCX7AFb4uWJRyQLpEUUeGwWU9aH9ThIq
         DJixes8KTXnolvRcY1mZcA92cqgn72Zlrel16jf9QkojiyOwkb7WyZYVlIFIB3Tl7lNt
         EPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765814714; x=1766419514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJDz6hzC4eAfFQF6ZrTHixGkolYYuz3YP59UTRaO0VY=;
        b=ZvWo1jkkzDbU/QKwX9G+mmk2tgPmuJna7nqA0Zv5MzGQxHSQkzjuD5nPnM/8U9LBvj
         rgKABC6shnhBVERFtK5zjZ72tDszxsihIYywRI1ng+A8GfMkQMyjiOwe9tB6LUrwgjGH
         58vkxcaaahLShd9BaVihFl1FZu+Q8Oc0jMw98FoTZBpUF3XEY/uGvg9l6znjIa+kWPGo
         1aQyLFqIs48Hflk9AvR2fL8jpkZ++jcy2V1R0uKgGhEXQGAr+V/33F3krhq/r8UQtEI2
         Af+o1adGp+nUMaVEbUYqVCKFw775ylMdGSyfebEe7G755kpvpqe68mSO4Dro4JMnrKnI
         XMLA==
X-Gm-Message-State: AOJu0Yw32mI9eWyGTm2B0UywRHP/zSdqqoo2xEE+AtDRgeOcmQPZ6E3E
	YgcOiycYm64F88zMgbbIzuJDaDcRtIMvPmaQ/JXl/ahJlIFs8qfJaoMT/la01Q==
X-Gm-Gg: AY/fxX5CJpE//lyX21VKHmn4mX4RTgimnu4iYOscRqsiKnDZd6accFPOpPWjrc5v11D
	ruF/ThW3O3W6NooJlnM7nzQwLct+xMpvYvnK062f4YpxiPj5bXJ1ZT7ZaFG8PxTlTIeYxpEnG71
	/8EvdVcfZrI5hGn1L9jQUjiaDZfQDyP1+o/9Dm9qn/J3a+lyXf77RjLAC3lwbOXhJSo28qSlW62
	DY+R+j4Hg5qC0NKycF0jKrBePDCBSOvh6uK+/RWIdZSgArTQ0cQ2zKyAWyCxuFbdXdr0/mSfl7w
	VBFUOOU2wHcM3ZCFxlaNhej9HlSOLuC97Tl3FdT3pyWrol8SWh4pIxToE+ZTkI1udd+BPdtz3wJ
	nii9uWM8Edy1QBnptpFy9qXO5ewRk5h16ICs7nGVHxAAht4ID3qnkgi4/D0XFwJ9coUd3M49C+q
	JwhStmdpsUBojCNn0Iyh8=
X-Google-Smtp-Source: AGHT+IE+VWT1wAMXz9SzHK1tIaPB6j2fsOwvK+H0KfiunQVUhI5kLozLhW7eLs86umNnDibrA4rDhw==
X-Received: by 2002:a5d:5f54:0:b0:42f:8816:c01a with SMTP id ffacd0b85a97d-42fb48e7728mr13315933f8f.62.1765814713972;
        Mon, 15 Dec 2025 08:05:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ff626b591sm17757950f8f.15.2025.12.15.08.05.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 08:05:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2025-12-15
Date: Mon, 15 Dec 2025 17:05:12 +0100
Message-ID: <20251215160512.2697333-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 16:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122658

List of all open CVEs (133, out of which new this week: 14):

 - accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - apache2: CVE-2025-55753: https://nvd.nist.gov/vuln/detail/CVE-2025-55753
 - apache2: CVE-2025-58098: https://nvd.nist.gov/vuln/detail/CVE-2025-58098
 - apache2: CVE-2025-59775: https://nvd.nist.gov/vuln/detail/CVE-2025-59775
 - apache2: CVE-2025-65082: https://nvd.nist.gov/vuln/detail/CVE-2025-65082
 - apache2: CVE-2025-66200: https://nvd.nist.gov/vuln/detail/CVE-2025-66200
 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
 - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - [NEW] dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - fex: CVE-2012-0869: https://nvd.nist.gov/vuln/detail/CVE-2012-0869
 - fex: CVE-2012-1293: https://nvd.nist.gov/vuln/detail/CVE-2012-1293
 - fex: CVE-2014-3875: https://nvd.nist.gov/vuln/detail/CVE-2014-3875
 - fex: CVE-2014-3876: https://nvd.nist.gov/vuln/detail/CVE-2014-3876
 - fex: CVE-2014-3877: https://nvd.nist.gov/vuln/detail/CVE-2014-3877
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
 - libcoap: CVE-2025-65493: https://nvd.nist.gov/vuln/detail/CVE-2025-65493
 - libcoap: CVE-2025-65494: https://nvd.nist.gov/vuln/detail/CVE-2025-65494
 - libcoap: CVE-2025-65495: https://nvd.nist.gov/vuln/detail/CVE-2025-65495
 - libcoap: CVE-2025-65496: https://nvd.nist.gov/vuln/detail/CVE-2025-65496
 - libcoap: CVE-2025-65497: https://nvd.nist.gov/vuln/detail/CVE-2025-65497
 - libcoap: CVE-2025-65498: https://nvd.nist.gov/vuln/detail/CVE-2025-65498
 - libcoap: CVE-2025-65499: https://nvd.nist.gov/vuln/detail/CVE-2025-65499
 - libcoap: CVE-2025-65500: https://nvd.nist.gov/vuln/detail/CVE-2025-65500
 - libcoap: CVE-2025-65501: https://nvd.nist.gov/vuln/detail/CVE-2025-65501
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
 - openvpn: CVE-2025-13086: https://nvd.nist.gov/vuln/detail/CVE-2025-13086
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
 - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2025-64458
 - python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2025-64459
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - [NEW] redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
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
 - tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - [NEW] webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - [NEW] wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - [NEW] wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - [NEW] wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
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


