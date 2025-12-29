Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC770D3B7E5
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 12:05:41 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42046.1767009940631028167
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 04:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=meId1/IV;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso72935755e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 04:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767009939; x=1767614739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BsvoHZQ2StHXSsov1u/hlssoJ/IgOl5w/e7mI/bRP7g=;
        b=meId1/IVYkxktqVv4kr52VcI5XQHKVCd29rozc4iQodNgwQVu++HDAo1n1EYRaGwwi
         yRfYnBUwU1FjA7O/derhvx8/eCRd9Z84oqOw8leTDLMB3v3VHmmhvnBEADOrMz7cMass
         ePIftGjUgB546GwrsC1XI7mLzxKTtVsjq544msy4FoR1j9OVnXMXpORx5Y3EXmVPS7gn
         +oQn6j2nAp6R8aYyU7mYAlg382IdF+SQ7JQOUKRvNLoS58KiVJmANpTKnoIMWM5zXv2s
         I4PYUMpAOzRBz50v40Ty9wJvYQuJUaQjKtK3qubu2gTslZGtUgvlAqQoiw7pDhVq/g88
         12pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767009939; x=1767614739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsvoHZQ2StHXSsov1u/hlssoJ/IgOl5w/e7mI/bRP7g=;
        b=Lh8ePLAkdTR+EDte4kH+MZ87tSyyNqjhs3mXOixGHQV/Tn5S1TCXlGHI2qFcsa1es/
         geIivxVu2meKVaKWZy1ShsQVn8PeTmPORu+Hv1TZxtb69ILzY8ioZ722UTOXNjEjhzaL
         6tc9nB53nQOhLtinGpE9V+s6+Pppz0Wypwxag4l657Ps+tlUZ/g37ib5fyndXm1BirtA
         dlGnkWOvmY+UONJvx24JBxZOsj0uykwVQj/swxXXrXtybtUxwcKQl8SlBUv1T9hbOeVZ
         K+cONbEjrz9o5LGk7cnuiHVXNz/tD88/IeuMXydvgafwGTvR6gxn0pRevoeN51WPACrP
         q1gg==
X-Gm-Message-State: AOJu0Yy33KIY7B90QMVulNpsu9hfHfk3zD+HhFXhdJXTFOdNtd7zB0Wi
	Ky0nXT3SEvrSHVrC89H1al8UICFZRmSj1HZTgiAyyPqP80EcqNC/GmflYaMoew==
X-Gm-Gg: AY/fxX5KtK4I1XNLQqiUGUv7HQladkUm9s8MPfkGVuU/+jW2s/RAUtog0rl2G+X/K+y
	IQ+2NshJi1NMF4Wlg2kd45x6rMKbIG+wr4ZSRrObd5AwXkSPbWRP2oAlPdFpeCDUtVvVLL8BbsM
	ZBpl3BIZ++w8VZJL+3EtuPmcfoxQfHnbVwxuxmp1ZTJ6RiCPC1jouciaJ6DyUt1MGLCjGlm0J65
	l0mxGJXiFtpKy0NYgh0Xcy1y5/pxU42fhyTKtM3UFrFj67hH2HN3F4MudopwA3jUlptjGCHsPty
	Ga9mxWf+1VWLE6F0xPdGJk0N6ulZerwNm4h9814gaFFwKDluUTxK7hboRQ4/Kg3Febg+kcTQ1zV
	twnViz9KvZ1KoX4t84Cwe6DE49au1LRApUNKxXbD2okagxcI/1vbQaU1FbE0Swkhhm9Telp/KM8
	19vi3T1UG2
X-Google-Smtp-Source: AGHT+IEYrmdZATTDUmL9ekpSAEv1cbb1YSE4KPrg4LBkWZBkSBV//EAUajtSt+engBgNTMGFawBszw==
X-Received: by 2002:a05:600c:4fc6:b0:477:755b:5587 with SMTP id 5b1f17b1804b1-47d1955b35fmr302202615e9.8.1767009938900;
        Mon, 29 Dec 2025 04:05:38 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d5372sm559781565e9.14.2025.12.29.04.05.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 04:05:38 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2025-12-29
Date: Mon, 29 Dec 2025 13:05:37 +0100
Message-ID: <20251229120537.602342-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 12:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122977

List of all open CVEs (125, out of which new this week: 7):

 - accountsservice: CVE-2023-3297: https://nvd.nist.gov/vuln/detail/CVE-2023-3297
 - c-ares: CVE-2025-62408: https://nvd.nist.gov/vuln/detail/CVE-2025-62408
 - cifs-utils: CVE-2025-2312: https://nvd.nist.gov/vuln/detail/CVE-2025-2312
 - civetweb: CVE-2025-9648: https://nvd.nist.gov/vuln/detail/CVE-2025-9648
 - cups-filters: CVE-2025-64524: https://nvd.nist.gov/vuln/detail/CVE-2025-64524
 - dante: CVE-2024-54662: https://nvd.nist.gov/vuln/detail/CVE-2024-54662
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - dovecot: CVE-2025-30189: https://nvd.nist.gov/vuln/detail/CVE-2025-30189
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - fetchmail: CVE-2025-61962: https://nvd.nist.gov/vuln/detail/CVE-2025-61962
 - fex: CVE-2012-0869: https://nvd.nist.gov/vuln/detail/CVE-2012-0869
 - fex: CVE-2012-1293: https://nvd.nist.gov/vuln/detail/CVE-2012-1293
 - fex: CVE-2014-3875: https://nvd.nist.gov/vuln/detail/CVE-2014-3875
 - fex: CVE-2014-3876: https://nvd.nist.gov/vuln/detail/CVE-2014-3876
 - fex: CVE-2014-3877: https://nvd.nist.gov/vuln/detail/CVE-2014-3877
 - fio: CVE-2025-10824: https://nvd.nist.gov/vuln/detail/CVE-2025-10824
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
 - [NEW] gimp: CVE-2025-14422: https://nvd.nist.gov/vuln/detail/CVE-2025-14422
 - [NEW] gimp: CVE-2025-14423: https://nvd.nist.gov/vuln/detail/CVE-2025-14423
 - [NEW] gimp: CVE-2025-14424: https://nvd.nist.gov/vuln/detail/CVE-2025-14424
 - [NEW] gimp: CVE-2025-14425: https://nvd.nist.gov/vuln/detail/CVE-2025-14425
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - imagemagick: CVE-2025-65955: https://nvd.nist.gov/vuln/detail/CVE-2025-65955
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
 - [NEW] php: CVE-2025-14177: https://nvd.nist.gov/vuln/detail/CVE-2025-14177
 - [NEW] php: CVE-2025-14178: https://nvd.nist.gov/vuln/detail/CVE-2025-14178
 - [NEW] php: CVE-2025-14180: https://nvd.nist.gov/vuln/detail/CVE-2025-14180
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - postgresql: CVE-2025-12817: https://nvd.nist.gov/vuln/detail/CVE-2025-12817
 - postgresql: CVE-2025-12818: https://nvd.nist.gov/vuln/detail/CVE-2025-12818
 - python3-django: CVE-2025-13372: https://nvd.nist.gov/vuln/detail/CVE-2025-13372
 - python3-django: CVE-2025-64460: https://nvd.nist.gov/vuln/detail/CVE-2025-64460
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
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

Removed this week (0): 


