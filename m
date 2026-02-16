Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565D0E63F3C
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 08:25:40 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15482.1771230330483403385
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 00:25:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vg0r96tU;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43767807da6so1928064f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 00:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771230329; x=1771835129; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWqvHvZRqec7Ax0S8ZIJjbREGxOQKmjFWfoj2n/OuiY=;
        b=Vg0r96tUkOFGsEVnaUGjuI3iExMVUCU5zsr/ZmuCsrMBHmcn4cf/j4Petbj1Bbz5+S
         PftbKTSXxjaOQ+f4PPbIlZG/NM474lYWE36149XSPk/hZlR6oIEbQJqdS9s/GvJb8nIB
         9iUYoozbm1k8HtS49qo8O1UglglFpmw53bpw4YeMrYgmRaIeb6irw+CHPw/QrpjTbyC3
         HQRNDOdMnhWJaH3YN7R4D5imfOADGLSwhTaFEbc+Ud2ttA4MAjqtOwYFZkbp6KbcK4do
         qki2xepJ9ORA6GoZqjWTn9vCJT81ZVd4xfgHqHUQdVpzvnvQF7TrjgpNqTM7CRNnizgZ
         2CMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230329; x=1771835129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWqvHvZRqec7Ax0S8ZIJjbREGxOQKmjFWfoj2n/OuiY=;
        b=JUtVEx1okoU/FzRGBBtSuyxOhRjHZ9KB2OK6l7ShwAaJlIZw/FlHXxB7cwxCB0yu4+
         9O1KVpCiyjqb1jHu20PAG/5r1wRgLxyhWWoDbrH+GCYyMKuf972x7/tAVzSba44FpGtZ
         k1qY0V2nOV5Mo6jKpvKnYKLir/CBZ007lwhfsr34EghACVwGWeI0F8IPYGIekOMNZnYp
         m+SlIeZpNvET0Xes/ygsK/Kbup7cB/TP5zwMNdqbdmpAHQTRaNu/eyWwobIExVIlr7gN
         C/vGju07924G0tDKfqjZ76//xH2gx6WGfYSYyaiQiNF5uZpptGvDZsAB7ydU89nSODXm
         SwEw==
X-Gm-Message-State: AOJu0YxloaRv42A3kGfbi1LV/WcP7JATm/5aBTaFbQz21uCh4q3tR+ec
	XTydW4lC50VBAbOpqdJXdE4wDrp1Kf6aH78Uivxzm4JBXBHPWWETpoYYsaZpcQ==
X-Gm-Gg: AZuq6aICOLEk+GbS4GigFSNNljEzBoc1F36uEhV7tZuCZQLHwg8vvjwi4KqvebggB0D
	GicjxIlyfg9GHgIaiR8l7KQaZkvoG0yBNz29eQWmK+pRP7vr90zNcoVz9OkW8M4vxtsqRwUoOUL
	oMTWqDilSk08rHQzkHMG1t3smwX2w6fytwj+Fq8FioRfMXaQpjDltKmYmDBsaB0a9sxCKCsRaw+
	zB3jNpBUcU+gkjK5cLNdJFnnxZBZLaSlsBBTM+1efY2FV/UGFMMGmxBu68/xN/gcikB3H1TcJky
	EhZ8lW49x3e7X96dumbOZfHIjYesN1EXOKLX2qOZd1BFp8eWaY0OU2tuhaqj8Z3vx/gYftNGTHE
	Lrw89Q2HJxc8s3wc93fd1OeOaaIHnS6pf0tz8NAPG513/BabxUTNmJDl0rDci7s/58toA5q/bb5
	dg57d4Hgc+HiKremwbx6fZ
X-Received: by 2002:a05:6000:2212:b0:436:332e:b8f9 with SMTP id ffacd0b85a97d-43797917f05mr17141226f8f.43.1771230328637;
        Mon, 16 Feb 2026 00:25:28 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74704sm26740523f8f.16.2026.02.16.00.25.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:25:28 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-02-16
Date: Mon, 16 Feb 2026 09:25:25 +0100
Message-ID: <20260216082525.1473394-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 08:25:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124411

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (139, out of which new this week: 19):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
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
 - [NEW] freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
 - [NEW] freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
 - [NEW] freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
 - [NEW] freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
 - [NEW] freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
 - [NEW] freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
 - [NEW] freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
 - [NEW] freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
 - [NEW] freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
 - [NEW] freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
 - [NEW] freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
 - [NEW] freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - [NEW] libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - [NEW] libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - minidlna: CVE-2024-51442: https://nvd.nist.gov/vuln/detail/CVE-2024-51442
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - nginx: CVE-2026-1642: https://nvd.nist.gov/vuln/detail/CVE-2026-1642
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] postgresql: CVE-2026-2003: https://nvd.nist.gov/vuln/detail/CVE-2026-2003
 - [NEW] postgresql: CVE-2026-2004: https://nvd.nist.gov/vuln/detail/CVE-2026-2004
 - [NEW] postgresql: CVE-2026-2005: https://nvd.nist.gov/vuln/detail/CVE-2026-2005
 - [NEW] postgresql: CVE-2026-2006: https://nvd.nist.gov/vuln/detail/CVE-2026-2006
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - python3-cbor2: CVE-2025-68131: https://nvd.nist.gov/vuln/detail/CVE-2025-68131
 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312
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
 - [NEW] python3-pillow: CVE-2026-25990: https://nvd.nist.gov/vuln/detail/CVE-2026-25990
 - python3-py: CVE-2022-42969: https://nvd.nist.gov/vuln/detail/CVE-2022-42969
 - python3-pyjwt: CVE-2025-45768: https://nvd.nist.gov/vuln/detail/CVE-2025-45768
 - python3-python-multipart: CVE-2026-24486: https://nvd.nist.gov/vuln/detail/CVE-2026-24486
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
 - streamripper: CVE-2020-37065: https://nvd.nist.gov/vuln/detail/CVE-2020-37065
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
 - xrdp: CVE-2025-68670: https://nvd.nist.gov/vuln/detail/CVE-2025-68670
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


