Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D174C2A062
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 07:01:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59472.1767596472890598885
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 23:01:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WpOwIkDn;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-430f57cd471so6364283f8f.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 23:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767596471; x=1768201271; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mQXgcO2qSAkhzBUgp7NxcwTWqB42YpkZClxevYHAnI=;
        b=WpOwIkDnaxJixtnBp+J3fSvCVBMqVyGnTfgIqIU5GEkKmKkTq9m5QWE9Sa/UOGVf37
         lSF3adkP8HrQT3IGriRAH54YyFXDymDNGJTHECYL0MYlCqS7qYPx1azL5/JjpcZ6M0jL
         WBTWgUAi1o+LOAFACkY7LLgfjB2nj7eYXdnKHN1qzcvETMI2qQUUyQrIiUm2+8ldaJln
         TZRRHjEn/4Q6hg69ABwFWW8lKg1/tJMkiIoHq9fsc7tob2mkCr6XkW7dguo9Ato7iHRK
         l6dMHtjxVGaw7nnJ8dqW7guw8aHetWJ6FKM9pv1yDT4V02UfYIhAQSWnfZuf82nI4mzU
         Bgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767596471; x=1768201271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mQXgcO2qSAkhzBUgp7NxcwTWqB42YpkZClxevYHAnI=;
        b=shtH4xwZQK5KzYuRRfHOdPzLwWciuiqlHlMvK/FQ6jm1K9ixel5ZmXElXU/gqhTxku
         FyieXQa3YMJ3Mz+Zo9UOhEDCnRrIsgY9TSKlwuUM23wSziZVP0xrgMYgd5Tyz+vQAPsV
         8xzljMibFIE8YAjAjSw27oTKR2djZUS6OW6DNKCKEs3iK1kckfyBs3G8aEqCZBsJfWUK
         DRBsvTZFLmFrbxf1AHUiXRSyMGM9ajqPqvoa+CjBd5LdlTKPUB/jvgfyOCrUxa6iyGzf
         nF93E/NdKoSA0l8sMdD7KC8kAhYaJdRBr4eWzzjC98w4tbQ+ztohSl5So3ZU6vDS5lGB
         KFig==
X-Gm-Message-State: AOJu0YyzsxfJU7yx947qdZEHhansoVrfcpUr/uL2Tt5O5cNMnTgicUUw
	C9Bolv+Dgtnxmo7H+VYYcIVh4c8MzGnZ17xKYT5dmueEvD57xyQiQKpKocoeFQ==
X-Gm-Gg: AY/fxX6Ek3El4PNYBydBX0YGdEBpWSUVEzwRl4bx+TaT6Q3j34KpIW7flR8vo84OwTo
	SISLvXVgZ8pq4eB5fTUyDuulEIdA8NoIYZdeguC62izxGyGKcmLUbJeHACB5mUYJVN5hnL7ciqY
	mItzBLalbTeYUFViaj5YDFO047bM2eW1ImpjJ0lhrWYBgy3pJA37JqSRGr7DiEZ1GaoUXwU3Vz3
	Zid5M74DcrQvf4uYie91wqoazefAFO4nmHzv6wwDD+2jBmqDQ3+++P616vhvCJHP5GPfvzeKO5t
	bs7FbPLb+GRcjr5yiUNB55UnYewllglahDVgnuvm8AhQAEHdo2Wt1blP4PrCtoF27+EOdRDWnMl
	DePYM5FNEcDOMHzaNs9ZqHxLJP/GYE1eEGdg5blvldBqbh84xQAvnWizC9ugyLlIpa0KtQ39m3a
	2jmKTD2FmF
X-Google-Smtp-Source: AGHT+IERmunPNE4HwJQTesJ4ZKIIzTZymREg0AwSFjeXjsKyucSHrb1Uk+Uc1qn6GQdtQMbWqs/Mpw==
X-Received: by 2002:a05:6000:2c13:b0:42b:2fb5:73c9 with SMTP id ffacd0b85a97d-4324e704c19mr61486902f8f.58.1767596470532;
        Sun, 04 Jan 2026 23:01:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82feasm99556997f8f.24.2026.01.04.23.01.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 23:01:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-01-05
Date: Mon,  5 Jan 2026 08:01:09 +0100
Message-ID: <20260105070109.1147610-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 07:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123125

List of all open CVEs (140, out of which new this week: 32):

 - civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - fex: CVE-2012-0869: https://nvd.nist.gov/vuln/detail/CVE-2012-0869
 - fex: CVE-2012-1293: https://nvd.nist.gov/vuln/detail/CVE-2012-1293
 - fex: CVE-2014-3875: https://nvd.nist.gov/vuln/detail/CVE-2014-3875
 - fex: CVE-2014-3876: https://nvd.nist.gov/vuln/detail/CVE-2014-3876
 - fex: CVE-2014-3877: https://nvd.nist.gov/vuln/detail/CVE-2014-3877
 - [NEW] fontforge: CVE-2025-15269: https://nvd.nist.gov/vuln/detail/CVE-2025-15269
 - [NEW] fontforge: CVE-2025-15270: https://nvd.nist.gov/vuln/detail/CVE-2025-15270
 - [NEW] fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - [NEW] fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - [NEW] fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - [NEW] fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - [NEW] fontforge: CVE-2025-15275: https://nvd.nist.gov/vuln/detail/CVE-2025-15275
 - [NEW] fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - [NEW] fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - [NEW] fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - [NEW] fontforge: CVE-2025-15279: https://nvd.nist.gov/vuln/detail/CVE-2025-15279
 - [NEW] fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
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
 - gimp: CVE-2025-14422: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
 - gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-2025-65955
 - [NEW] imagemagick: CVE-2025-69204: https://nvd.nist.gov/vuln/detail/CVE-2025-69204
 - influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - libcoap: CVE-2025-50518: https://nvd.nist.gov/vuln/detail/CVE-2025-50518
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - libwebsockets: CVE-2025-11677: https://nvd.nist.gov/vuln/detail/CVE-2025-11677
 - libwebsockets: CVE-2025-11678: https://nvd.nist.gov/vuln/detail/CVE-2025-11678
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
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
 - minio: CVE-2024-36107: https://nvd.nist.gov/vuln/detail/CVE-2024-36107
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - openvpn: CVE-2025-13086: https://nvd.nist.gov/vuln/detail/CVE-2025-13086
 - openvpn: CVE-2025-13751: https://nvd.nist.gov/vuln/detail/CVE-2025-13751
 - php: CVE-2025-14177: https://nvd.nist.gov/vuln/detail/CVE-2025-14177
 - php: CVE-2025-14178: https://nvd.nist.gov/vuln/detail/CVE-2025-14178
 - php: CVE-2025-14180: https://nvd.nist.gov/vuln/detail/CVE-2025-14180
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
 - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - [NEW] python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - [NEW] python3-configobj: CVE-2023-26112: https://nvd.nist.gov/vuln/detail/CVE-2023-26112
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - [NEW] python3-flask-cors: CVE-2024-1681: https://nvd.nist.gov/vuln/detail/CVE-2024-1681
 - [NEW] python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - [NEW] python3-ldap: CVE-2025-61911: https://nvd.nist.gov/vuln/detail/CVE-2025-61911
 - [NEW] python3-ldap: CVE-2025-61912: https://nvd.nist.gov/vuln/detail/CVE-2025-61912
 - [NEW] python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - [NEW] python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - [NEW] python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - [NEW] python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - [NEW] python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - [NEW] python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - [NEW] python3-tornado: CVE-2025-67724: https://nvd.nist.gov/vuln/detail/CVE-2025-67724
 - [NEW] python3-tornado: CVE-2025-67725: https://nvd.nist.gov/vuln/detail/CVE-2025-67725
 - [NEW] python3-tornado: CVE-2025-67726: https://nvd.nist.gov/vuln/detail/CVE-2025-67726
 - [NEW] python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - [NEW] python3-uvicorn: CVE-2020-7694: https://nvd.nist.gov/vuln/detail/CVE-2020-7694
 - [NEW] python3-werkzeug: CVE-2025-66221: https://nvd.nist.gov/vuln/detail/CVE-2025-66221
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - [NEW] sox: CVE-2022-50798: https://nvd.nist.gov/vuln/detail/CVE-2022-50798
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - tinyproxy: CVE-2025-63938: https://nvd.nist.gov/vuln/detail/CVE-2025-63938
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
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

Removed this week (17): 

 - accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - c-ares: CVE-2025-62408: https://nvd.nist.gov/vuln/detail/CVE-2025-62408
 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
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

