Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F3BACA6004
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 08:09:29 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31430.1768810161086629532
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 00:09:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DXBH5hzV;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso35797515e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 00:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810159; x=1769414959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rv4YHOcDl4j2arAkgN+yV3mXQCIxC3RudovrLKNUEWk=;
        b=DXBH5hzVAnYgV1AwXZ29a7eU8ErxONZBlGviY9hEfi9+9XeKRbfSiyySPLfP4FQfiB
         Fk9ZXQpjViaXLjdBJlW999AKa55hzVJNT80dxgJ1zcnt5YPwK924PguUMSm7voX0kI6h
         LSVRGIZTK8bZ8ot6dNhOYnq++Kveq1N7wMciQERhE3kNAyEyYw5T5Yr8ZGJFJddjhe/8
         0hGBa7dQOCTz10P9a2P37DfZWkcrKGnbFCZUIb8oAEsnmVK0+X05k+O5wQk/yzmmZxuV
         b7CbshCS1/DBsYyGJu+/AyN+9xacbLVMth4dTjwvwi+YTNPQSUzH8lElG4aLAvZwJiKu
         BrAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810159; x=1769414959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rv4YHOcDl4j2arAkgN+yV3mXQCIxC3RudovrLKNUEWk=;
        b=o5tnQtGJHeNQn1C4fWYtPBXzQ0h/WOPb64RK59ackvUne0Qli4dVK76LJ5kZ2V+uHR
         /AMSHya4A4cdkXYK6AtTiyU+pHBs9lBNDFFDg+I/JDW/sy5sGWdgMbxAhKNtwIuaHJ+h
         9x/+BRuybBTXUCLjp8EeOAmv/wJLtQuciZh2quko9QOm2HW+SiYs/KWlQGKTeSyDdhAc
         sI2iKemC+ehR+x+/aha31gDk6rVa2wtypel65sO8QwgV05t8ZvoEM3TXYdGhWinjURuo
         yTCLCBnuqTjOwK3pSsd6UxzuOLnEbWZGctwaDZaYPkHx4oguRuObaGEWXU5aXxjnX+9+
         ZTRg==
X-Gm-Message-State: AOJu0YwWYtKDqThkk1mG85KPrPiM3eQ8x4OScG+C8cIMdg0uh0uvv+ky
	H03avg71kEQbnkhWOo9/eY05GOOIFrKq2RrASiiwP3qbpKayL8hu1d92yeM76g==
X-Gm-Gg: AY/fxX6pd1BrWU8an6aTKw+y2kPZZ3tk30tethw0RmMQycynX5cKZ1dP1GRqetKoYxK
	YeQMh1MRCUyMXPF8fvrJh8RkpX8RLwJcQGRmcpb1yvSW8sFjiznpWTgQwODe3MYyhQ+dGgGP5bm
	+kPluu0DCTQYHqwGw9E8Yi6XO+HyksUfqqNVzmaGS0rgX2cIxS/1vXG2D308CHlcuA6oNDNX6J9
	5s1pTo/z7VCn0tO68+tRACcJ1JQ+n2Fb/NHNa30+3fmnT0sZwQcGxDP5l66CEa8lgC8p2rWHS+8
	Pkt98SLFQwPel2cZTleSvsXbFMjDrTb8rcJ+lpuQMTXEVYi7+2dUk9n5vBmZOIPVnxiZBmXmmuX
	RPX+gU5sDMSTTFhu3Cyl0hSc/Bi1CgwDMcSV60xABt/J2v3l9/zbjTA80PGmnru9A+Zq215Gy1P
	/42zErWd73
X-Received: by 2002:a05:600c:4683:b0:480:1e9e:f9d with SMTP id 5b1f17b1804b1-48036439ce0mr17952555e9.8.1768810159349;
        Mon, 19 Jan 2026 00:09:19 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8d90b3sm183471685e9.15.2026.01.19.00.09.18
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:09:18 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-01-19
Date: Mon, 19 Jan 2026 09:09:18 +0100
Message-ID: <20260119080918.205706-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 08:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123593

List of all open CVEs (65, out of which new this week: 13):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
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
 - [NEW] freerdp: CVE-2025-68118: https://nvd.nist.gov/vuln/detail/CVE-2025-68118
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
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libuser: CVE-2012-5644: https://nvd.nist.gov/vuln/detail/CVE-2012-5644
 - live555: CVE-2025-65405: https://nvd.nist.gov/vuln/detail/CVE-2025-65405
 - live555: CVE-2025-65407: https://nvd.nist.gov/vuln/detail/CVE-2025-65407
 - live555: CVE-2025-65408: https://nvd.nist.gov/vuln/detail/CVE-2025-65408
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-lief: CVE-2025-15504: https://nvd.nist.gov/vuln/detail/CVE-2025-15504
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - python3-werkzeug: CVE-2026-21860: https://nvd.nist.gov/vuln/detail/CVE-2026-21860
 - [NEW] raptor2: CVE-2024-57822: https://nvd.nist.gov/vuln/detail/CVE-2024-57822
 - [NEW] raptor2: CVE-2024-57823: https://nvd.nist.gov/vuln/detail/CVE-2024-57823
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - [NEW] xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (18): 

 - influxdb: CVE-2024-30896: https://nvd.nist.gov/vuln/detail/CVE-2024-30896
 - libsodium: CVE-2025-69277: https://nvd.nist.gov/vuln/detail/CVE-2025-69277
 - lmdb: CVE-2026-22185: https://nvd.nist.gov/vuln/detail/CVE-2026-22185
 - nginx: CVE-2025-53859: https://nvd.nist.gov/vuln/detail/CVE-2025-53859
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-aiohttp: CVE-2025-69224: https://nvd.nist.gov/vuln/detail/CVE-2025-69224
 - python3-aiohttp: CVE-2025-69225: https://nvd.nist.gov/vuln/detail/CVE-2025-69225
 - python3-aiohttp: CVE-2025-69226: https://nvd.nist.gov/vuln/detail/CVE-2025-69226
 - python3-aiohttp: CVE-2025-69227: https://nvd.nist.gov/vuln/detail/CVE-2025-69227
 - python3-aiohttp: CVE-2025-69228: https://nvd.nist.gov/vuln/detail/CVE-2025-69228
 - python3-aiohttp: CVE-2025-69229: https://nvd.nist.gov/vuln/detail/CVE-2025-69229
 - python3-aiohttp: CVE-2025-69230: https://nvd.nist.gov/vuln/detail/CVE-2025-69230
 - python3-m2crypto: CVE-2009-0127: https://nvd.nist.gov/vuln/detail/CVE-2009-0127
 - python3-m2crypto: CVE-2020-25657: https://nvd.nist.gov/vuln/detail/CVE-2020-25657
 - python3-reportlab: CVE-2020-28463: https://nvd.nist.gov/vuln/detail/CVE-2020-28463
 - python3-twitter: CVE-2012-5825: https://nvd.nist.gov/vuln/detail/CVE-2012-5825
 - python3-uvicorn: CVE-2020-7694: https://nvd.nist.gov/vuln/detail/CVE-2020-7694
 - python3-virtualenv: CVE-2026-22702: https://nvd.nist.gov/vuln/detail/CVE-2026-22702

