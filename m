Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C43D172DA
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 06:25:35 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47283.1770013525601521641
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Feb 2026 22:25:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fca+1A1p;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso36850295e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Feb 2026 22:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770013524; x=1770618324; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=fUbQQbrUIRLKjHNvWmQVApASgEcXtkSYNnqLppDZV/M=;
        b=Fca+1A1pCTAFGpq++peOtjQStfr8WttDx+MwuN9n7e9IpXw+FRU9JVZBgBVViI7EIE
         LTjt3DC35gdqGn9S9ks0sgh0COwxo5cleDijXcbW21Y6iOPXXYodvcNy0iIY4H0wPnzF
         qFtdzAFDsiMzO95GDRJQGijqph0+cH7UxBjVf5iWEELFNwz4RhMeyan85C76QWtlL2La
         wX6HhzkCScPrFDA19NZVe7F3Y9LUWb2xokLb78unsaP6wHqS5NSVq/thCSGUpmAddrIV
         5RzVs6DKn5RUPS00IXM/aQRB+R1mPMcqHFEQM/MAOS/ASnhSl+bwoOh/qh81j0CNsmWp
         GZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770013524; x=1770618324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUbQQbrUIRLKjHNvWmQVApASgEcXtkSYNnqLppDZV/M=;
        b=SwCVOKFbvSONGxHrUte6iz2WW0nzrqBOjg0uVG/SPNaFT5R4jEohYoirN0uOCKkMKY
         jlpp5aNRJZqgzV6myAW8u6bbbXZiaABzjfiyzR13zx0si5C8plfSx3W2dRd1JLfZxQYO
         gz66oC/+j9C6saKELl0/ByxBc3R0LGD0HEkYtqocJjghnOB3InY60tkMULTyn10AWMpt
         sQU7400d0gdHLd9OzL3Dd+QQmm1nAfCFgrbBuEk9/LfxPnYBCXN7w7ZNkIhof9M0nzK5
         ZOcEEWZxBTFxxwRG5YfNRDqVd+og6YY7r3SZWe+Pk4sKIKpwJ+uGE87SP6DY6x38IvZz
         S9Gg==
X-Gm-Message-State: AOJu0YxESQ+vYVnLZX7b6aAEmQKe4NimTr5X+J/9hk+DJpTaoDd08x8I
	owrvFnFvKetsox8uoue8ohaasOVQwybnpmDdDHhU0A5e20W1cWrLPQrY/Sg+KQ==
X-Gm-Gg: AZuq6aKVXrqYs2ZypUmlgI57j+FFLGgrkmYRZ2pRleUUh83dhYRGg4oy7O2PrGK31RW
	SpPI4wxd0hJKJOeLuhN+48KS6iUQNuOkfUiiTcgrJAgceRuL9ZIeVrWGf3RD6UsjHEkQzN9UEBk
	IOJ5gm4T5L8nsk/NGpBzw0IMQik8M+UqGJIAOsKkHyrTp+wjq46lOrrIc3TS7TrqN22HscRbTB0
	XPzk+awz77BlAzD9zI3MsYz43ia7x0zuwvEMDwqni5EYbBQ2JajC8/j/GmPpUJAmtUWR40plLRa
	MEYib7RqLbhjKGim1qioGe0FLzRGE6T+MY8CmZjQRqfPov9DdiEoY4fmJpKVMegCHXhSklnBrW2
	2W1cXYwfWpm39P/1KA5uH1unx64/X5mOLcC+JLOWcDS6eHUlFosLUzPFv9lgN/hIUcRzYaSiEGa
	mYMm0jbYy0
X-Received: by 2002:a05:600c:a00e:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-482db481bffmr142149725e9.17.1770013523796;
        Sun, 01 Feb 2026 22:25:23 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10e476dsm40864614f8f.4.2026.02.01.22.25.23
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 22:25:23 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-02-02
Date: Mon,  2 Feb 2026 07:25:20 +0100
Message-ID: <20260202062520.1325307-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 06:25:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124047

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (140, out of which new this week: 16):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
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
 - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
 - freerdp: CVE-2026-22852: https://nvd.nist.gov/vuln/detail/CVE-2026-22852
 - freerdp: CVE-2026-22853: https://nvd.nist.gov/vuln/detail/CVE-2026-22853
 - freerdp: CVE-2026-22854: https://nvd.nist.gov/vuln/detail/CVE-2026-22854
 - freerdp: CVE-2026-22855: https://nvd.nist.gov/vuln/detail/CVE-2026-22855
 - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
 - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
 - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
 - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
 - freerdp: CVE-2026-23530: https://nvd.nist.gov/vuln/detail/CVE-2026-23530
 - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
 - freerdp: CVE-2026-23532: https://nvd.nist.gov/vuln/detail/CVE-2026-23532
 - freerdp: CVE-2026-23533: https://nvd.nist.gov/vuln/detail/CVE-2026-23533
 - freerdp: CVE-2026-23534: https://nvd.nist.gov/vuln/detail/CVE-2026-23534
 - freerdp: CVE-2026-23732: https://nvd.nist.gov/vuln/detail/CVE-2026-23732
 - freerdp: CVE-2026-23883: https://nvd.nist.gov/vuln/detail/CVE-2026-23883
 - freerdp: CVE-2026-23884: https://nvd.nist.gov/vuln/detail/CVE-2026-23884
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2025-15059: https://nvd.nist.gov/vuln/detail/CVE-2025-15059
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - gpsd: CVE-2025-67268: https://nvd.nist.gov/vuln/detail/CVE-2025-67268
 - gpsd: CVE-2025-67269: https://nvd.nist.gov/vuln/detail/CVE-2025-67269
 - [NEW] hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - [NEW] hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - [NEW] hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - imagemagick: CVE-2026-22770: https://nvd.nist.gov/vuln/detail/CVE-2026-22770
 - [NEW] imagemagick: CVE-2026-23874: https://nvd.nist.gov/vuln/detail/CVE-2026-23874
 - [NEW] imagemagick: CVE-2026-23876: https://nvd.nist.gov/vuln/detail/CVE-2026-23876
 - imagemagick: CVE-2026-23952: https://nvd.nist.gov/vuln/detail/CVE-2026-23952
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - libcupsfilters: CVE-2025-64503: https://nvd.nist.gov/vuln/detail/CVE-2025-64503
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - [NEW] monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - [NEW] monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - [NEW] monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - [NEW] monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - [NEW] monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - [NEW] monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - [NEW] monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - [NEW] monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - [NEW] monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - nodejs: CVE-2025-55130: https://nvd.nist.gov/vuln/detail/CVE-2025-55130
 - nodejs: CVE-2025-55131: https://nvd.nist.gov/vuln/detail/CVE-2025-55131
 - nodejs: CVE-2025-55132: https://nvd.nist.gov/vuln/detail/CVE-2025-55132
 - nodejs: CVE-2025-59465: https://nvd.nist.gov/vuln/detail/CVE-2025-59465
 - nodejs: CVE-2025-59466: https://nvd.nist.gov/vuln/detail/CVE-2025-59466
 - nodejs: CVE-2026-21637: https://nvd.nist.gov/vuln/detail/CVE-2026-21637
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - proftpd: CVE-2021-47865: https://nvd.nist.gov/vuln/detail/CVE-2021-47865
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - python3-flask-cors: CVE-2024-1681: https://nvd.nist.gov/vuln/detail/CVE-2024-1681
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-ldap: CVE-2025-61911: https://nvd.nist.gov/vuln/detail/CVE-2025-61911
 - python3-ldap: CVE-2025-61912: https://nvd.nist.gov/vuln/detail/CVE-2025-61912
 - python3-lief: CVE-2025-15504: https://nvd.nist.gov/vuln/detail/CVE-2025-15504
 - python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - [NEW] python3-python-multipart: CVE-2026-24486: https://nvd.nist.gov/vuln/detail/CVE-2026-24486
 - python3-tornado: CVE-2025-67724: https://nvd.nist.gov/vuln/detail/CVE-2025-67724
 - python3-tornado: CVE-2025-67725: https://nvd.nist.gov/vuln/detail/CVE-2025-67725
 - python3-tornado: CVE-2025-67726: https://nvd.nist.gov/vuln/detail/CVE-2025-67726
 - python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - python3-uvicorn: CVE-2020-7694: https://nvd.nist.gov/vuln/detail/CVE-2020-7694
 - python3-virtualenv: CVE-2026-22702: https://nvd.nist.gov/vuln/detail/CVE-2026-22702
 - python3-werkzeug: CVE-2025-66221: https://nvd.nist.gov/vuln/detail/CVE-2025-66221
 - python3-werkzeug: CVE-2026-21860: https://nvd.nist.gov/vuln/detail/CVE-2026-21860
 - raptor2: CVE-2024-57822: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
 - raptor2: CVE-2024-57823: https://nvd.nist.gov/vuln/detail/CVE-2024-57823
 - redis: CVE-2025-46686: https://nvd.nist.gov/vuln/detail/CVE-2025-46686
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - wireshark: CVE-2026-0962: https://nvd.nist.gov/vuln/detail/CVE-2026-0962
 - wolfssl: CVE-2025-13912: https://nvd.nist.gov/vuln/detail/CVE-2025-13912
 - wolfssl: CVE-2025-7394: https://nvd.nist.gov/vuln/detail/CVE-2025-7394
 - wolfssl: CVE-2025-7395: https://nvd.nist.gov/vuln/detail/CVE-2025-7395
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - xrdp: CVE-2024-39917: https://nvd.nist.gov/vuln/detail/CVE-2024-39917
 - [NEW] xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670
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

Removed this week (25): 

 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - nodejs: CVE-2025-59464: https://nvd.nist.gov/vuln/detail/CVE-2025-59464
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

