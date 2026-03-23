Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD554D58CD7
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 05:28:41 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10935.1774243718013451004
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Mar 2026 22:28:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UwO/9d75;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: skandigraun@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8cd8576a512so549745485a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Mar 2026 22:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774243717; x=1774848517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=jungZPAkvfTMC4Cu8Cu9Tbi6GbZSNTwci4/rtgiiVXk=;
        b=UwO/9d75IQksv5aCxgG6KORNEAqIqOsBhpk9cIj8bJ9kPb5Wxrp53fXfznYF7Xcpb+
         CPU5v8iLCEw9T1dxIl1HaBX3zbUKWlLt0W0LUyeAZS/8mFBmKKIApj0LfojE73EiHkJu
         tSAddRU7ekWkS/B7KBoj3X69auwd93egcQwvHaT3y/qbxuP3fFagnKy0UX26rqelqA3/
         fyPIT2wtNFIAFjAw06s5yUg0ZHNjlRqmXFXIu4dyfTY/auuQO3kpeVyeRQvoFHGMVUNV
         jvoHU76AObyCXO8Z8V/yuUvkHJkaOqI9xM6DitrpozjK/0PIMItqVjozcqcoSuakjcQm
         YPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774243717; x=1774848517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jungZPAkvfTMC4Cu8Cu9Tbi6GbZSNTwci4/rtgiiVXk=;
        b=oQbSMTZzVE5GtSFh+A5ZSkWyfYBU9BgXqB464m1liyENko7Kj5Xj0MTooKzNyx4CfQ
         3TbiQQ8pDv2eCPPm4salJ0VPuPap4fWlYkit+zIxxKP15eYJME3enza8b3Y0vV2b6VlY
         ENMU54rB5wVGavytHdUUKWkW+7moMb/Cm8EbE8YNzYU3yGPcZ/sQNBrC6RyjO7Ex08Tz
         tm6R8HjExeR+L4GalNkaErdddCsyfucd2YxKvsFUsELuEunqqypF3aCAa6q6hqoyTpjw
         Av53E/1MZ4IHmhkGZzpAD/TJvIQNH5ETn8Q1mZYhJo2OoRVMhoyDfBn+R1BarifcQ1Po
         vYDw==
X-Gm-Message-State: AOJu0YyE2jZztLY74hLOhi3EGzmX/HrP2WCm6oZAjTXW3g6Gd0Yb8la7
	Qir/gcfl4Bdt93SbXGZBClAmEiaYPxZhpK4WGJWOMALGmv2uJFsaLgRH5q6JbA==
X-Gm-Gg: ATEYQzzhAT0+gnsQ9IE7g09JVhZivpacgY/tbkZFNifebwJ0pJHajfr04VPTW9WgtqX
	CgxjGILldKHP70dZIbWkhlPFFwRtIdSkpQA0vMfurvCX165Ist1OLdoOaweKEihMt0wj/M1b7o1
	cOApEThoiKbwsEz4jSJopF7niXWtTs7+51gb1OvlCTQ62WvATZO2MZdItwcOxpQmdWVDnrI6GTh
	PzirU+m8L4YdAVQpsvj0uMdjlqbjNwzTCOSuvqvq/GSMN5Ub2BeguEJbHTDP/Ytj/HoaRj3dTsB
	Lzr/uSfOT4DQ46e4QWzUnIO4t+xvrmlAeWsSeq9G4IOdHagNOvnmtg0By+seZ6iyRqvwJcFwJ3I
	rpR9oziygZHOCZ5XH9pOKQqmiQWiXzTz06MDPK7wpFFGAM55CLFAe0YBXZoetAJc8SrRx2rrZ7n
	qtZP1DTuLUS2N7heGLZylkHNP+vf9iCyo=
X-Received: by 2002:a05:620a:4004:b0:8cd:918e:e824 with SMTP id af79cd13be357-8cfb9eb9451mr2116530985a.42.1774243716920;
        Sun, 22 Mar 2026 22:28:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8f934a4sm747424485a.16.2026.03.22.22.28.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 22:28:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-03-23
Date: Mon, 23 Mar 2026 06:28:32 +0100
Message-ID: <20260323052832.3221799-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 05:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125495

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (172, out of which new this week: 18):

 - bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - capnproto: CVE-2026-32239: https://nvd.nist.gov/vuln/detail/CVE-2026-32239
 - capnproto: CVE-2026-32240: https://nvd.nist.gov/vuln/detail/CVE-2026-32240
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - ettercap: CVE-2026-3606: https://nvd.nist.gov/vuln/detail/CVE-2026-3606
 - exiv2: CVE-2026-25884: https://nvd.nist.gov/vuln/detail/CVE-2026-25884
 - exiv2: CVE-2026-27596: https://nvd.nist.gov/vuln/detail/CVE-2026-27596
 - exiv2: CVE-2026-27631: https://nvd.nist.gov/vuln/detail/CVE-2026-27631
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
 - freerdp: CVE-2026-23948: https://nvd.nist.gov/vuln/detail/CVE-2026-23948
 - freerdp: CVE-2026-24491: https://nvd.nist.gov/vuln/detail/CVE-2026-24491
 - freerdp: CVE-2026-24675: https://nvd.nist.gov/vuln/detail/CVE-2026-24675
 - freerdp: CVE-2026-24676: https://nvd.nist.gov/vuln/detail/CVE-2026-24676
 - freerdp: CVE-2026-24677: https://nvd.nist.gov/vuln/detail/CVE-2026-24677
 - freerdp: CVE-2026-24678: https://nvd.nist.gov/vuln/detail/CVE-2026-24678
 - freerdp: CVE-2026-24679: https://nvd.nist.gov/vuln/detail/CVE-2026-24679
 - freerdp: CVE-2026-24680: https://nvd.nist.gov/vuln/detail/CVE-2026-24680
 - freerdp: CVE-2026-24681: https://nvd.nist.gov/vuln/detail/CVE-2026-24681
 - freerdp: CVE-2026-24682: https://nvd.nist.gov/vuln/detail/CVE-2026-24682
 - freerdp: CVE-2026-24683: https://nvd.nist.gov/vuln/detail/CVE-2026-24683
 - freerdp: CVE-2026-24684: https://nvd.nist.gov/vuln/detail/CVE-2026-24684
 - freerdp: CVE-2026-25941: https://nvd.nist.gov/vuln/detail/CVE-2026-25941
 - freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-25942
 - freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-25952
 - freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-25953
 - freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-25954
 - freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-25955
 - freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-25959
 - freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-25997
 - freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-26271
 - freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-26955
 - freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-26965
 - freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-26986
 - freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-27015
 - freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-27950
 - freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-27951
 - freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-29774
 - [NEW] freerdp: CVE-2026-29775: https://nvd.nist.gov/vuln/detail/CVE-2026-29775
 - freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - [NEW] giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - imagemagick: CVE-2026-28493: https://nvd.nist.gov/vuln/detail/CVE-2026-28493
 - imagemagick: CVE-2026-28494: https://nvd.nist.gov/vuln/detail/CVE-2026-28494
 - imagemagick: CVE-2026-28686: https://nvd.nist.gov/vuln/detail/CVE-2026-28686
 - imagemagick: CVE-2026-28687: https://nvd.nist.gov/vuln/detail/CVE-2026-28687
 - imagemagick: CVE-2026-28688: https://nvd.nist.gov/vuln/detail/CVE-2026-28688
 - imagemagick: CVE-2026-28689: https://nvd.nist.gov/vuln/detail/CVE-2026-28689
 - imagemagick: CVE-2026-28690: https://nvd.nist.gov/vuln/detail/CVE-2026-28690
 - imagemagick: CVE-2026-28691: https://nvd.nist.gov/vuln/detail/CVE-2026-28691
 - imagemagick: CVE-2026-28692: https://nvd.nist.gov/vuln/detail/CVE-2026-28692
 - imagemagick: CVE-2026-28693: https://nvd.nist.gov/vuln/detail/CVE-2026-28693
 - imagemagick: CVE-2026-30883: https://nvd.nist.gov/vuln/detail/CVE-2026-30883
 - imagemagick: CVE-2026-30929: https://nvd.nist.gov/vuln/detail/CVE-2026-30929
 - imagemagick: CVE-2026-30931: https://nvd.nist.gov/vuln/detail/CVE-2026-30931
 - imagemagick: CVE-2026-30935: https://nvd.nist.gov/vuln/detail/CVE-2026-30935
 - imagemagick: CVE-2026-30936: https://nvd.nist.gov/vuln/detail/CVE-2026-30936
 - [NEW] imagemagick: CVE-2026-30937: https://nvd.nist.gov/vuln/detail/CVE-2026-30937
 - imagemagick: CVE-2026-31853: https://nvd.nist.gov/vuln/detail/CVE-2026-31853
 - imagemagick: CVE-2026-32259: https://nvd.nist.gov/vuln/detail/CVE-2026-32259
 - [NEW] imagemagick: CVE-2026-32636: https://nvd.nist.gov/vuln/detail/CVE-2026-32636
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - [NEW] libde265: CVE-2026-33165: https://nvd.nist.gov/vuln/detail/CVE-2026-33165
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libssh: CVE-2026-3731: https://nvd.nist.gov/vuln/detail/CVE-2026-3731
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mariadb: CVE-2026-3494: https://nvd.nist.gov/vuln/detail/CVE-2026-3494
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - [NEW] python3-black: CVE-2026-31900: https://nvd.nist.gov/vuln/detail/CVE-2026-31900
 - [NEW] python3-black: CVE-2026-32274: https://nvd.nist.gov/vuln/detail/CVE-2026-32274
 - python3-django: CVE-2026-25673: https://nvd.nist.gov/vuln/detail/CVE-2026-25673
 - python3-django: CVE-2026-25674: https://nvd.nist.gov/vuln/detail/CVE-2026-25674
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-nltk: CVE-2026-0846: https://nvd.nist.gov/vuln/detail/CVE-2026-0846
 - [NEW] python3-nltk: CVE-2026-33230: https://nvd.nist.gov/vuln/detail/CVE-2026-33230
 - [NEW] python3-nltk: CVE-2026-33236: https://nvd.nist.gov/vuln/detail/CVE-2026-33236
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - python3-pyjwt: CVE-2026-32597: https://nvd.nist.gov/vuln/detail/CVE-2026-32597
 - python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
 - [NEW] wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - [NEW] wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - [NEW] wolfssl: CVE-2026-3229: https://nvd.nist.gov/vuln/detail/CVE-2026-3229
 - [NEW] wolfssl: CVE-2026-3230: https://nvd.nist.gov/vuln/detail/CVE-2026-3230
 - [NEW] wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - [NEW] wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - [NEW] wolfssl: CVE-2026-3549: https://nvd.nist.gov/vuln/detail/CVE-2026-3549
 - [NEW] wolfssl: CVE-2026-3580: https://nvd.nist.gov/vuln/detail/CVE-2026-3580
 - [NEW] wolfssl: CVE-2026-3849: https://nvd.nist.gov/vuln/detail/CVE-2026-3849
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
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
 - zabbix: CVE-2026-23925: https://nvd.nist.gov/vuln/detail/CVE-2026-23925

====================

Removed this week (0): 


