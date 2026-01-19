Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D60CA6004
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:09:19 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31429.1768810152880137303
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HEtGvSXQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbad1fa90so3527591f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810151; x=1769414951; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx9j8KYA8By6UBkoGNOSUtP3FOVpqGNZfudCvTOx+RQ=;
        b=HEtGvSXQHm9heaFm+E06EVScI4tV2ecs5P8mDScMucxSHOjktJT9HeAmad+pyinYwP
         Wr6AOXtOGjn7XloyYFjBiai3xNYtidSaI2IpyODenlmqajwdt3yKaLlVI60o9fSRtCKJ
         UYzbAu2sdxjILe2NpJVh1Mvygtzy4hq+c9Q7BPcqycTRzBGXaKgTLbi4C17Vvd5gF2ky
         JpMYcmiGPcouZka83AcT3M4TtYGZubKXuv7lL3TEHeMNDqaq+ijwHjZIc1pTlWv6vdpz
         99OgMF5+ASpkyLai3faTQVMLHqUv2alcMSIugfJoI/VvOFKzvfs78Vl07dK8Y+RQwFK0
         OCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810151; x=1769414951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx9j8KYA8By6UBkoGNOSUtP3FOVpqGNZfudCvTOx+RQ=;
        b=hol0IVO9n7OhbrV3cZLdcfwAAFHJ+TNad3GKPlYRnAsqpIxvzWNg4CrQc4aAw3k3XM
         xxKpcSSlRU510TbJY+EEsQ8UfCB9xGstcspLYm98lTapU20DMUn009PuYg0hjyMr+95i
         XVN8et0ndyO+Z0Pu2+IPsH6LIKaVJN2DiERF/yNdMnIElNc6hGagIjplr2WlwVHMtHFI
         phujf+a9nGwSFsD2c51yODYTmfIhxoIR1yegidMzEgeLuzCrdMy8XMabgfvaC7xqI/x6
         llCXLBCxutR828OIzibd8D5eDle4R8wFnIGEF616wmj6jneM16nlTJSUA52bKy6u/ZXJ
         eWKA==
X-Gm-Message-State: AOJu0Yw23Q2KkQv+tUZ3P228TsLVvpfAtmvD2n0wR6HBup5n95cvwfIu
	qUH3UPqGJW26mEFTNN+7ZKs4eT2cFaBn0sX1GV0W/u4jLY5kmGmF0kCTlSWELA==
X-Gm-Gg: AZuq6aIePykhuKuJgRuoxOPYxOGZ7IU4J47oBGT6XHB/fG7VLir6vazvAojAeN414RK
	ZKMYHxSUq22NSzyZcaYpGXvVuTpyLafJFp8uxOepzMBhwAv/7dyjaX/rtHdD/IAGGOPpB26+1R3
	eYgG4VmI3atcC3EVJrQmqsVSyluB4ZXep5rSrdEygVK6uIp1OVHnXuCXgcuu2rcQd4yJyIFxFx+
	/SJyMhMNuirEutt8GUkhap1hAWtMo5aFOrICWCoI1BGqcdd0WFZSPwhsu+0nSmE+zlqhx+Ep9eA
	9l6v6+xj8kR4zCRgbo/dTMnuHwYOEy0yfo/Hq18tY+q93JTGjxghEalnuefidzsrtPZRTUmatwW
	H284nQvnCTjeR/iV6C60TJ1yQV0B988IE98pBR8Bxl2XYHzqhYtC8Z/uznEjbyr4YpCA5QcnIOB
	x0838UKL88
X-Received: by 2002:a05:6000:3113:b0:430:fe22:5f1c with SMTP id ffacd0b85a97d-43569bd6ee1mr10045253f8f.59.1768810151005;
        Mon, 19 Jan 2026 00:09:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996cf42sm21574511f8f.20.2026.01.19.00.09.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:09:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2026-01-19
Date: Mon, 19 Jan 2026 09:09:09 +0100
Message-ID: <20260119080909.205660-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123591

List of all open CVEs (194, out of which new this week: 31):

 - botan: CVE-2024-34702: https://nvd.nist.gov/vuln/detail/CVE-2024-34702
 - botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
 - emacs: CVE-2025-1244: https://nvd.nist.gov/vuln/detail/CVE-2025-1244
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fontforge: CVE-2025-15269: https://nvd.nist.gov/vuln/detail/CVE-2025-15269
 - fontforge: CVE-2025-15270: https://nvd.nist.gov/vuln/detail/CVE-2025-15270
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15275: https://nvd.nist.gov/vuln/detail/CVE-2025-15275
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15279: https://nvd.nist.gov/vuln/detail/CVE-2025-15279
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
 - [NEW] freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
 - [NEW] freerdp: CVE-2026-22852: https://nvd.nist.gov/vuln/detail/CVE-2026-22852
 - [NEW] freerdp: CVE-2026-22853: https://nvd.nist.gov/vuln/detail/CVE-2026-22853
 - [NEW] freerdp: CVE-2026-22854: https://nvd.nist.gov/vuln/detail/CVE-2026-22854
 - [NEW] freerdp: CVE-2026-22855: https://nvd.nist.gov/vuln/detail/CVE-2026-22855
 - [NEW] freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
 - [NEW] freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
 - [NEW] freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
 - [NEW] freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
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
 - gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - [NEW] gimp: CVE-2025-2760: https://nvd.nist.gov/vuln/detail/CVE-2025-2760
 - [NEW] gimp: CVE-2025-2761: https://nvd.nist.gov/vuln/detail/CVE-2025-2761
 - [NEW] gnome-settings-daemon: CVE-2024-38394: https://nvd.nist.gov/vuln/detail/CVE-2024-38394
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - gsoap: CVE-2024-4227: https://nvd.nist.gov/vuln/detail/CVE-2024-4227
 - imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
 - imagemagick: CVE-2025-62594: https://nvd.nist.gov/vuln/detail/CVE-2025-62594
 - imagemagick: CVE-2025-66628: https://nvd.nist.gov/vuln/detail/CVE-2025-66628
 - imagemagick: CVE-2025-68618: https://nvd.nist.gov/vuln/detail/CVE-2025-68618
 - imagemagick: CVE-2025-68950: https://nvd.nist.gov/vuln/detail/CVE-2025-68950
 - imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - keepalived: CVE-2024-41184: https://nvd.nist.gov/vuln/detail/CVE-2024-41184
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libcoap: CVE-2024-46304: https://nvd.nist.gov/vuln/detail/CVE-2024-46304
 - libmad: CVE-2018-7263: https://nvd.nist.gov/vuln/detail/CVE-2018-7263
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - mongodb: CVE-2025-14847: https://nvd.nist.gov/vuln/detail/CVE-2025-14847
 - netdata: CVE-2024-32019: https://nvd.nist.gov/vuln/detail/CVE-2024-32019
 - nodejs: CVE-2024-27982: https://nvd.nist.gov/vuln/detail/CVE-2024-27982
 - nodejs: CVE-2025-23165: https://nvd.nist.gov/vuln/detail/CVE-2025-23165
 - nodejs: CVE-2025-23166: https://nvd.nist.gov/vuln/detail/CVE-2025-23166
 - nodejs: CVE-2025-23167: https://nvd.nist.gov/vuln/detail/CVE-2025-23167
 - nodejs: CVE-2025-27210: https://nvd.nist.gov/vuln/detail/CVE-2025-27210
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - php: CVE-2025-14178: https://nvd.nist.gov/vuln/detail/CVE-2025-14178
 - php: CVE-2025-14180: https://nvd.nist.gov/vuln/detail/CVE-2025-14180
 - pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - python3-aiohttp: CVE-2025-53643: https://nvd.nist.gov/vuln/detail/CVE-2025-53643
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - python3-flask-cors: CVE-2024-1681: https://nvd.nist.gov/vuln/detail/CVE-2024-1681
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-gunicorn: CVE-2024-1135: https://nvd.nist.gov/vuln/detail/CVE-2024-1135
 - python3-gunicorn: CVE-2024-6827: https://nvd.nist.gov/vuln/detail/CVE-2024-6827
 - python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-tornado: CVE-2025-67725: https://nvd.nist.gov/vuln/detail/CVE-2025-67725
 - python3-twisted: CVE-2024-41810: https://nvd.nist.gov/vuln/detail/CVE-2024-41810
 - python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - python3-virtualenv: CVE-2024-53899: https://nvd.nist.gov/vuln/detail/CVE-2024-53899
 - python3-waitress: CVE-2024-49768: https://nvd.nist.gov/vuln/detail/CVE-2024-49768
 - python3-waitress: CVE-2024-49769: https://nvd.nist.gov/vuln/detail/CVE-2024-49769
 - raptor2: CVE-2024-57822: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
 - raptor2: CVE-2024-57823: https://nvd.nist.gov/vuln/detail/CVE-2024-57823
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
 - [NEW] sox: CVE-2017-11332: https://nvd.nist.gov/vuln/detail/CVE-2017-11332
 - [NEW] sox: CVE-2017-11358: https://nvd.nist.gov/vuln/detail/CVE-2017-11358
 - [NEW] sox: CVE-2017-11359: https://nvd.nist.gov/vuln/detail/CVE-2017-11359
 - [NEW] sox: CVE-2017-15370: https://nvd.nist.gov/vuln/detail/CVE-2017-15370
 - [NEW] sox: CVE-2017-15371: https://nvd.nist.gov/vuln/detail/CVE-2017-15371
 - [NEW] sox: CVE-2017-15372: https://nvd.nist.gov/vuln/detail/CVE-2017-15372
 - [NEW] sox: CVE-2017-15642: https://nvd.nist.gov/vuln/detail/CVE-2017-15642
 - [NEW] sox: CVE-2017-18189: https://nvd.nist.gov/vuln/detail/CVE-2017-18189
 - [NEW] sox: CVE-2019-1010004: https://nvd.nist.gov/vuln/detail/CVE-2019-1010004
 - [NEW] sox: CVE-2019-13590: https://nvd.nist.gov/vuln/detail/CVE-2019-13590
 - [NEW] sox: CVE-2019-8354: https://nvd.nist.gov/vuln/detail/CVE-2019-8354
 - [NEW] sox: CVE-2019-8355: https://nvd.nist.gov/vuln/detail/CVE-2019-8355
 - [NEW] sox: CVE-2019-8356: https://nvd.nist.gov/vuln/detail/CVE-2019-8356
 - [NEW] sox: CVE-2019-8357: https://nvd.nist.gov/vuln/detail/CVE-2019-8357
 - [NEW] sox: CVE-2021-40426: https://nvd.nist.gov/vuln/detail/CVE-2021-40426
 - [NEW] sox: CVE-2022-31650: https://nvd.nist.gov/vuln/detail/CVE-2022-31650
 - [NEW] sox: CVE-2022-31651: https://nvd.nist.gov/vuln/detail/CVE-2022-31651
 - [NEW] sox: CVE-2023-34432: https://nvd.nist.gov/vuln/detail/CVE-2023-34432
 - spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
 - spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
 - spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - [NEW] strongswan: CVE-2025-62291: https://nvd.nist.gov/vuln/detail/CVE-2025-62291
 - tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
 - tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
 - tigervnc: CVE-2014-8241: https://nvd.nist.gov/vuln/detail/CVE-2014-8241
 - tigervnc: CVE-2023-6377: https://nvd.nist.gov/vuln/detail/CVE-2023-6377
 - tigervnc: CVE-2023-6478: https://nvd.nist.gov/vuln/detail/CVE-2023-6478
 - tigervnc: CVE-2024-0408: https://nvd.nist.gov/vuln/detail/CVE-2024-0408
 - tigervnc: CVE-2024-0409: https://nvd.nist.gov/vuln/detail/CVE-2024-0409
 - tigervnc: CVE-2025-26594: https://nvd.nist.gov/vuln/detail/CVE-2025-26594
 - tigervnc: CVE-2025-26595: https://nvd.nist.gov/vuln/detail/CVE-2025-26595
 - tigervnc: CVE-2025-26596: https://nvd.nist.gov/vuln/detail/CVE-2025-26596
 - tigervnc: CVE-2025-26597: https://nvd.nist.gov/vuln/detail/CVE-2025-26597
 - tigervnc: CVE-2025-26598: https://nvd.nist.gov/vuln/detail/CVE-2025-26598
 - tigervnc: CVE-2025-26599: https://nvd.nist.gov/vuln/detail/CVE-2025-26599
 - tigervnc: CVE-2025-26600: https://nvd.nist.gov/vuln/detail/CVE-2025-26600
 - tigervnc: CVE-2025-26601: https://nvd.nist.gov/vuln/detail/CVE-2025-26601
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - vsomeip: CVE-2024-3979: https://nvd.nist.gov/vuln/detail/CVE-2024-3979
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43342: https://nvd.nist.gov/vuln/detail/CVE-2025-43342
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-6558: https://nvd.nist.gov/vuln/detail/CVE-2025-6558
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
 - webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
 - webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
 - webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
 - webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
 - webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
 - webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
 - webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
 - webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
 - webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
 - webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
 - webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
 - webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
 - webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
 - webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
 - webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
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

Removed this week (27): 

 - boinc-client: CVE-2013-2018: https://nvd.nist.gov/vuln/detail/CVE-2013-2018
 - fluidsynth: CVE-2025-56225: https://nvd.nist.gov/vuln/detail/CVE-2025-56225
 - gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
 - gimp: CVE-2025-14422: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
 - gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425
 - gimp: CVE-2025-48796: https://nvd.nist.gov/vuln/detail/CVE-2025-48796
 - gimp: CVE-2025-48797: https://nvd.nist.gov/vuln/detail/CVE-2025-48797
 - gimp: CVE-2025-48798: https://nvd.nist.gov/vuln/detail/CVE-2025-48798
 - gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
 - gpsd: CVE-2025-67268: https://nvd.nist.gov/vuln/detail/CVE-2025-67268
 - gpsd: CVE-2025-67269: https://nvd.nist.gov/vuln/detail/CVE-2025-67269
 - lmdb: CVE-2026-22185: https://nvd.nist.gov/vuln/detail/CVE-2026-22185
 - php: CVE-2025-14177: https://nvd.nist.gov/vuln/detail/CVE-2025-14177
 - python3-aiohttp: CVE-2024-52304: https://nvd.nist.gov/vuln/detail/CVE-2024-52304
 - python3-configobj: CVE-2023-26112: https://nvd.nist.gov/vuln/detail/CVE-2023-26112
 - python3-eventlet: CVE-2025-58068: https://nvd.nist.gov/vuln/detail/CVE-2025-58068
 - python3-ldap: CVE-2025-61911: https://nvd.nist.gov/vuln/detail/CVE-2025-61911
 - python3-ldap: CVE-2025-61912: https://nvd.nist.gov/vuln/detail/CVE-2025-61912
 - python3-pymongo: CVE-2024-5629: https://nvd.nist.gov/vuln/detail/CVE-2024-5629
 - python3-tornado: CVE-2025-47287: https://nvd.nist.gov/vuln/detail/CVE-2025-47287
 - python3-tornado: CVE-2025-67724: https://nvd.nist.gov/vuln/detail/CVE-2025-67724
 - python3-tornado: CVE-2025-67726: https://nvd.nist.gov/vuln/detail/CVE-2025-67726
 - python3-tqdm: CVE-2024-34062: https://nvd.nist.gov/vuln/detail/CVE-2024-34062
 - python3-virtualenv: CVE-2026-22702: https://nvd.nist.gov/vuln/detail/CVE-2026-22702
 - python3-werkzeug: CVE-2025-66221: https://nvd.nist.gov/vuln/detail/CVE-2025-66221
 - python3-werkzeug: CVE-2026-21860: https://nvd.nist.gov/vuln/detail/CVE-2026-21860
 - tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384

