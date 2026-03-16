Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A122EFCBCD
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 06:31:43 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44727.1773642696497116514
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Mar 2026 23:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b7hx48zU;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48557c8ad47so22340875e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Mar 2026 23:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773642695; x=1774247495; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3r2bgrzWAgIdq+CrEx1UY7ofmuE31iJm1TOOReDwcu4=;
        b=b7hx48zUQ3ErvJv3TLIr/iMq5M1oAysHADlfX3dtHXLzxSQ1GfwBSHhFrnZ3hcQ04P
         O3ncidhTbMk6z8s7NJ7SlZ5IMUGXtPUtgCWDSQ1vu4A6V0Yk0OW3YVnF3t67DJ/IQgUu
         U0anr0bV4Y6gO15Rrus7aS5+P9qVPExBOn8LtUrRgwkbDDo1l46Niuak1VmwT4juftL3
         J2xNWASRCyEen0Fc+2H2rS05XiIAwde6xdTXt2C5F0i80YLEQNSamlkHPOjhMq55n5tT
         0jCcEuPWQbtsj+uAjAc5ISvhtGBsIh7QFdLrfMthHA6LQzl0PI67aRuUr/CPbonix1Qf
         VZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773642695; x=1774247495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3r2bgrzWAgIdq+CrEx1UY7ofmuE31iJm1TOOReDwcu4=;
        b=hfCay+cdtGd4EtFDBI8LdeGQsWUdWYFOeAXH9GCmOCsn/3grqoaKJEYmv1JnQOsmCC
         LtZbt/PcsVVe+PO90azMT3Ph3lf+tM20G2ltEzlGMsJF1dQsWt/2Wl2S2CXqaHfkzXEH
         RxLxC2Haee1959lvFs7fSa6nqRI2IYnk4rFaMlzXKIgUYvZuPnsFkIFVBJ0xmbB6Mxnk
         nzhnq3toT25qlR0vMYEbseN3oZoPKd4wSIuuVQWYBPBYXcymJlFPb3uaPplbF0eqpOWG
         nCY3LPuVFkiDc8kcuB1JXqKoDREizXonVO22r3L8liLnfZTdpa9fmCHnZkXl0MKkl2EF
         okDw==
X-Gm-Message-State: AOJu0YwSMccLUqnOsZ7mNiDM3CFTZhsVmPuJnSsweSVlj0DV+kGQ9bPZ
	q24UbbgSuD3fbxB2rotHtrxeg5kKcKFRbtsNjGXqe132wzi/XFpKRNc6st6YRA==
X-Gm-Gg: ATEYQzz7JqXdQYMHXMxzydrgHC3HBZofMUba4u5ScJJ6q09apzda8rHaV//tuSSrvyD
	Q+n1h8KsApu0gVt9oz//k068Crrku25qOtQUb995DRBh+qtvnCGQaMccbscW2T6GFiPig6n8U4Q
	ZCp/gSGLkJ6VLAjxdxbImIxGqi5lM8HWHqO31RA6KLNiiRE4xGl4XvxaP4bS81eGFM8zZJh9aH2
	WLekGfKbrXwic+Ac1twmosa8kTSXKmRAiRoM1ix1ORTK+zVLVORdm+DKG+g6i3VtH+yhSTQc3xw
	RBShaN8OaU6eaW0Z6/t+OrZ7vUAZAOEccGwtjvvuXXE/ShdmoGH03Km63GVt4MqDpcAgKKZavKA
	Ne2kU3a3aD61OV5tgYUE1iZsSuMFmdQE6JCminj/cBQNMNO3bxT1I/OOs9YjMUPhKcCQy323und
	mA8U5thoatZ6qMq6CLBiQG
X-Received: by 2002:a05:600c:4fc6:b0:485:3e6c:aacb with SMTP id 5b1f17b1804b1-485566d2e5bmr189421755e9.4.1773642694642;
        Sun, 15 Mar 2026 23:31:34 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm1027701795e9.2.2026.03.15.23.31.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 23:31:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-03-16
Date: Mon, 16 Mar 2026 07:31:30 +0100
Message-ID: <20260316063130.515051-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 06:31:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125253

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (154, out of which new this week: 32):

 - bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - [NEW] capnproto: CVE-2026-32239: https://nvd.nist.gov/vuln/detail/CVE-2026-32239
 - [NEW] capnproto: CVE-2026-32240: https://nvd.nist.gov/vuln/detail/CVE-2026-32240
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
 - [NEW] freerdp: CVE-2026-29774: https://nvd.nist.gov/vuln/detail/CVE-2026-29774
 - [NEW] freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - [NEW] freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - [NEW] freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - [NEW] freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - [NEW] freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - [NEW] freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - [NEW] imagemagick: CVE-2026-28493: https://nvd.nist.gov/vuln/detail/CVE-2026-28493
 - [NEW] imagemagick: CVE-2026-28494: https://nvd.nist.gov/vuln/detail/CVE-2026-28494
 - [NEW] imagemagick: CVE-2026-28686: https://nvd.nist.gov/vuln/detail/CVE-2026-28686
 - [NEW] imagemagick: CVE-2026-28687: https://nvd.nist.gov/vuln/detail/CVE-2026-28687
 - [NEW] imagemagick: CVE-2026-28688: https://nvd.nist.gov/vuln/detail/CVE-2026-28688
 - [NEW] imagemagick: CVE-2026-28689: https://nvd.nist.gov/vuln/detail/CVE-2026-28689
 - [NEW] imagemagick: CVE-2026-28690: https://nvd.nist.gov/vuln/detail/CVE-2026-28690
 - [NEW] imagemagick: CVE-2026-28691: https://nvd.nist.gov/vuln/detail/CVE-2026-28691
 - [NEW] imagemagick: CVE-2026-28692: https://nvd.nist.gov/vuln/detail/CVE-2026-28692
 - [NEW] imagemagick: CVE-2026-28693: https://nvd.nist.gov/vuln/detail/CVE-2026-28693
 - [NEW] imagemagick: CVE-2026-30883: https://nvd.nist.gov/vuln/detail/CVE-2026-30883
 - [NEW] imagemagick: CVE-2026-30929: https://nvd.nist.gov/vuln/detail/CVE-2026-30929
 - [NEW] imagemagick: CVE-2026-30931: https://nvd.nist.gov/vuln/detail/CVE-2026-30931
 - [NEW] imagemagick: CVE-2026-30935: https://nvd.nist.gov/vuln/detail/CVE-2026-30935
 - [NEW] imagemagick: CVE-2026-30936: https://nvd.nist.gov/vuln/detail/CVE-2026-30936
 - [NEW] imagemagick: CVE-2026-31853: https://nvd.nist.gov/vuln/detail/CVE-2026-31853
 - [NEW] imagemagick: CVE-2026-32259: https://nvd.nist.gov/vuln/detail/CVE-2026-32259
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - [NEW] libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - [NEW] libssh: CVE-2026-3731: https://nvd.nist.gov/vuln/detail/CVE-2026-3731
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - [NEW] mariadb: CVE-2026-3494: https://nvd.nist.gov/vuln/detail/CVE-2026-3494
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
 - python3-django: CVE-2026-25673: https://nvd.nist.gov/vuln/detail/CVE-2026-25673
 - python3-django: CVE-2026-25674: https://nvd.nist.gov/vuln/detail/CVE-2026-25674
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - [NEW] python3-nltk: CVE-2026-0846: https://nvd.nist.gov/vuln/detail/CVE-2026-0846
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - [NEW] python3-pyjwt: CVE-2026-32597: https://nvd.nist.gov/vuln/detail/CVE-2026-32597
 - [NEW] python3-tornado: CVE-2026-31958: https://nvd.nist.gov/vuln/detail/CVE-2026-31958
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
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


