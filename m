Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5FB8D58E72
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 07:06:32 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.154871.1772435189475647047
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 Mar 2026 23:06:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2sltkSu;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439aeed8a5bso1205193f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 01 Mar 2026 23:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772435188; x=1773039988; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mbKywTc4+/PqxbI+Dw/uo2LDNtveGnmDjsD1J+S7weU=;
        b=F2sltkSuFdJy5ArlA9DbDcpf8fDiDKTgj0bXi9ib2G1Wo1UkAQe9o3k8FCwPlCbdLx
         vHduxwd/IvpfQw2jI1LNADkTX1EhMs3//TABE9EaRcud10JhbK8Q7h0iOrrUJs1wcmNg
         R8baDlVEQkwXtujpyf0f4Fhuam5NS8MevIhlErQ06ug/V+5Rkz3AWeOxfEwr6Erhx5w6
         bjWkMwHlp8Qkc8VrE7mjznThq3QN15CNGkF/5wXKYlRfWpjIv0k9WKSCd0BrQmKKEVKF
         BexxMz+79QvB1RC0J0bCZM5mX7wjaT2B2TqBTjtb8TAekk9tKWMMmXRIfzZSFsgiozmh
         z+ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772435188; x=1773039988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mbKywTc4+/PqxbI+Dw/uo2LDNtveGnmDjsD1J+S7weU=;
        b=KL+CaiwVHwVUyY4RansoGpoM8GFaWc8f5Fhk3ZCdSqkQE55sg7Bbp4eE/j55c5Ve9a
         K9aV+NPKHqSQJ83T8mRw4mm5uUQsxBtfbd/+G3PTEU5JlMLjHPWHHLgFgzv3Hxgq4/Qo
         HAAbSoiWcEETKmAw8VW5xg1ors76cv3WfuN3EMYwhMMSyEc+r5X/iDo3f1t4T0fqj6Qg
         TxlUS/cWZznOCFSuzAkpv07+kqUzEr8Bag4Sk3vMENN1Seta3C/y/OIWqdTMcmqG5yV8
         AcjVqrtoGVlEwPCQ+vUUcmsA64owaHrXAooa51pVsG7uPWOiFDZ6Dh+4TJyQBHLmPGuj
         89xw==
X-Gm-Message-State: AOJu0YywBV8YUe8G0k5Qgs3JLSaxvcTMo9Cu8T7fPTEpM1E4h9Fv7tbi
	Mr2dtzCLTCysKx6HBP2b8yqlaII4cpb5FaW+OInubAZShf5Sv9vG6JrGr0BrRA==
X-Gm-Gg: ATEYQzxDhMW4JUtNC7M6v92R1RmQGfDfm+F0FENT1NhfxsXzAXGIpS2hA/zaCRyhVfB
	DYrmWZL8/VmOV34SdI64ALPFM9vCpIKD9DxYg2HtK9XiP07UeN6ccsUOAximAKNM0B21uiX41E6
	2tDKLgwWNWsKKy5G5PMw9hGsuhZx80M7MiHFHBLD2/QcmDZVzjMRJknf7ZQqUOjvyH5IIp6WMMT
	dVierddYswx9wNPHqLPJBUG2xgwrAmme3g8Fx88v3Olqdt2o/iTO1vUHvCAhoe1v+fTgHaXxb5s
	iOQgEJmScLD1cqaOyW8AivSSKkpz4UdmsPV/tZ/q1jkbWSYzJWRriehTR+sXc6+6uZByqgZJl9L
	Y3elIW9hGsxf0aapHGJ8tD+vJPA1DKyfd4XUMo68sGtDt91Ex9WuOKty1CewUUl9JnqVB/n6HPN
	3OLpJFxmh4VOjrOXpCKKNT
X-Received: by 2002:a05:6000:2c08:b0:437:6bcd:77f8 with SMTP id ffacd0b85a97d-4399de3e52emr19628896f8f.38.1772435187626;
        Sun, 01 Mar 2026 23:06:27 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm24766058f8f.24.2026.03.01.23.06.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 23:06:27 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - whinlatter - 2026-03-02
Date: Mon,  2 Mar 2026 08:06:24 +0100
Message-ID: <20260302070624.1505272-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 07:06:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124803

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (177, out of which new this week: 57):

 - [NEW] bit7z: CVE-2026-27117: https://nvd.nist.gov/vuln/detail/CVE-2026-27117
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - [NEW] exiftool: CVE-2026-3102: https://nvd.nist.gov/vuln/detail/CVE-2026-3102
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
 - [NEW] freerdp: CVE-2026-25941: https://nvd.nist.gov/vuln/detail/CVE-2026-25941
 - [NEW] freerdp: CVE-2026-25942: https://nvd.nist.gov/vuln/detail/CVE-2026-25942
 - [NEW] freerdp: CVE-2026-25952: https://nvd.nist.gov/vuln/detail/CVE-2026-25952
 - [NEW] freerdp: CVE-2026-25953: https://nvd.nist.gov/vuln/detail/CVE-2026-25953
 - [NEW] freerdp: CVE-2026-25954: https://nvd.nist.gov/vuln/detail/CVE-2026-25954
 - [NEW] freerdp: CVE-2026-25955: https://nvd.nist.gov/vuln/detail/CVE-2026-25955
 - [NEW] freerdp: CVE-2026-25959: https://nvd.nist.gov/vuln/detail/CVE-2026-25959
 - [NEW] freerdp: CVE-2026-25997: https://nvd.nist.gov/vuln/detail/CVE-2026-25997
 - [NEW] freerdp: CVE-2026-26271: https://nvd.nist.gov/vuln/detail/CVE-2026-26271
 - [NEW] freerdp: CVE-2026-26955: https://nvd.nist.gov/vuln/detail/CVE-2026-26955
 - [NEW] freerdp: CVE-2026-26965: https://nvd.nist.gov/vuln/detail/CVE-2026-26965
 - [NEW] freerdp: CVE-2026-26986: https://nvd.nist.gov/vuln/detail/CVE-2026-26986
 - [NEW] freerdp: CVE-2026-27015: https://nvd.nist.gov/vuln/detail/CVE-2026-27015
 - [NEW] freerdp: CVE-2026-27950: https://nvd.nist.gov/vuln/detail/CVE-2026-27950
 - [NEW] freerdp: CVE-2026-27951: https://nvd.nist.gov/vuln/detail/CVE-2026-27951
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - gimp: CVE-2026-0797: https://nvd.nist.gov/vuln/detail/CVE-2026-0797
 - gimp: CVE-2026-2044: https://nvd.nist.gov/vuln/detail/CVE-2026-2044
 - gimp: CVE-2026-2045: https://nvd.nist.gov/vuln/detail/CVE-2026-2045
 - gimp: CVE-2026-2047: https://nvd.nist.gov/vuln/detail/CVE-2026-2047
 - gimp: CVE-2026-2048: https://nvd.nist.gov/vuln/detail/CVE-2026-2048
 - gnome-shell: CVE-2021-3982: https://nvd.nist.gov/vuln/detail/CVE-2021-3982
 - hiawatha: CVE-2025-57783: https://nvd.nist.gov/vuln/detail/CVE-2025-57783
 - hiawatha: CVE-2025-57784: https://nvd.nist.gov/vuln/detail/CVE-2025-57784
 - hiawatha: CVE-2025-57785: https://nvd.nist.gov/vuln/detail/CVE-2025-57785
 - hplip: CVE-2025-43023: https://nvd.nist.gov/vuln/detail/CVE-2025-43023
 - [NEW] imagemagick: CVE-2026-24481: https://nvd.nist.gov/vuln/detail/CVE-2026-24481
 - [NEW] imagemagick: CVE-2026-24484: https://nvd.nist.gov/vuln/detail/CVE-2026-24484
 - [NEW] imagemagick: CVE-2026-24485: https://nvd.nist.gov/vuln/detail/CVE-2026-24485
 - [NEW] imagemagick: CVE-2026-25576: https://nvd.nist.gov/vuln/detail/CVE-2026-25576
 - [NEW] imagemagick: CVE-2026-25637: https://nvd.nist.gov/vuln/detail/CVE-2026-25637
 - [NEW] imagemagick: CVE-2026-25638: https://nvd.nist.gov/vuln/detail/CVE-2026-25638
 - [NEW] imagemagick: CVE-2026-25794: https://nvd.nist.gov/vuln/detail/CVE-2026-25794
 - [NEW] imagemagick: CVE-2026-25795: https://nvd.nist.gov/vuln/detail/CVE-2026-25795
 - [NEW] imagemagick: CVE-2026-25796: https://nvd.nist.gov/vuln/detail/CVE-2026-25796
 - [NEW] imagemagick: CVE-2026-25797: https://nvd.nist.gov/vuln/detail/CVE-2026-25797
 - [NEW] imagemagick: CVE-2026-25798: https://nvd.nist.gov/vuln/detail/CVE-2026-25798
 - [NEW] imagemagick: CVE-2026-25799: https://nvd.nist.gov/vuln/detail/CVE-2026-25799
 - [NEW] imagemagick: CVE-2026-25897: https://nvd.nist.gov/vuln/detail/CVE-2026-25897
 - [NEW] imagemagick: CVE-2026-25898: https://nvd.nist.gov/vuln/detail/CVE-2026-25898
 - [NEW] imagemagick: CVE-2026-25965: https://nvd.nist.gov/vuln/detail/CVE-2026-25965
 - [NEW] imagemagick: CVE-2026-25966: https://nvd.nist.gov/vuln/detail/CVE-2026-25966
 - [NEW] imagemagick: CVE-2026-25967: https://nvd.nist.gov/vuln/detail/CVE-2026-25967
 - [NEW] imagemagick: CVE-2026-25968: https://nvd.nist.gov/vuln/detail/CVE-2026-25968
 - [NEW] imagemagick: CVE-2026-25969: https://nvd.nist.gov/vuln/detail/CVE-2026-25969
 - [NEW] imagemagick: CVE-2026-25970: https://nvd.nist.gov/vuln/detail/CVE-2026-25970
 - [NEW] imagemagick: CVE-2026-25971: https://nvd.nist.gov/vuln/detail/CVE-2026-25971
 - [NEW] imagemagick: CVE-2026-25982: https://nvd.nist.gov/vuln/detail/CVE-2026-25982
 - [NEW] imagemagick: CVE-2026-25983: https://nvd.nist.gov/vuln/detail/CVE-2026-25983
 - [NEW] imagemagick: CVE-2026-25985: https://nvd.nist.gov/vuln/detail/CVE-2026-25985
 - [NEW] imagemagick: CVE-2026-25986: https://nvd.nist.gov/vuln/detail/CVE-2026-25986
 - [NEW] imagemagick: CVE-2026-25987: https://nvd.nist.gov/vuln/detail/CVE-2026-25987
 - [NEW] imagemagick: CVE-2026-25988: https://nvd.nist.gov/vuln/detail/CVE-2026-25988
 - [NEW] imagemagick: CVE-2026-25989: https://nvd.nist.gov/vuln/detail/CVE-2026-25989
 - [NEW] imagemagick: CVE-2026-26066: https://nvd.nist.gov/vuln/detail/CVE-2026-26066
 - [NEW] imagemagick: CVE-2026-26283: https://nvd.nist.gov/vuln/detail/CVE-2026-26283
 - [NEW] imagemagick: CVE-2026-26284: https://nvd.nist.gov/vuln/detail/CVE-2026-26284
 - [NEW] imagemagick: CVE-2026-26983: https://nvd.nist.gov/vuln/detail/CVE-2026-26983
 - [NEW] imagemagick: CVE-2026-27798: https://nvd.nist.gov/vuln/detail/CVE-2026-27798
 - [NEW] imagemagick: CVE-2026-27799: https://nvd.nist.gov/vuln/detail/CVE-2026-27799
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - [NEW] libde265: CVE-2025-61147: https://nvd.nist.gov/vuln/detail/CVE-2025-61147
 - [NEW] libheif: CVE-2025-68431: https://nvd.nist.gov/vuln/detail/CVE-2025-68431
 - libjxl: CVE-2025-12474: https://nvd.nist.gov/vuln/detail/CVE-2025-12474
 - libjxl: CVE-2026-1837: https://nvd.nist.gov/vuln/detail/CVE-2026-1837
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
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
 - postgresql: CVE-2026-2003: https://nvd.nist.gov/vuln/detail/CVE-2026-2003
 - postgresql: CVE-2026-2004: https://nvd.nist.gov/vuln/detail/CVE-2026-2004
 - postgresql: CVE-2026-2005: https://nvd.nist.gov/vuln/detail/CVE-2026-2005
 - postgresql: CVE-2026-2006: https://nvd.nist.gov/vuln/detail/CVE-2026-2006
 - protobuf: CVE-2026-0994: https://nvd.nist.gov/vuln/detail/CVE-2026-0994
 - python3-aiohttp: CVE-2025-69223: https://nvd.nist.gov/vuln/detail/CVE-2025-69223
 - [NEW] python3-flask: CVE-2026-27205: https://nvd.nist.gov/vuln/detail/CVE-2026-27205
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - [NEW] python3-marshmallow: CVE-2025-68480: https://nvd.nist.gov/vuln/detail/CVE-2025-68480
 - python3-nltk: CVE-2025-14009: https://nvd.nist.gov/vuln/detail/CVE-2025-14009
 - python3-orjson: CVE-2025-67221: https://nvd.nist.gov/vuln/detail/CVE-2025-67221
 - python3-pillow: CVE-2026-25990: https://nvd.nist.gov/vuln/detail/CVE-2026-25990
 - python3-werkzeug: CVE-2026-27199: https://nvd.nist.gov/vuln/detail/CVE-2026-27199
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - streamripper: CVE-2020-37065: https://nvd.nist.gov/vuln/detail/CVE-2020-37065
 - unbound: CVE-2025-5994: https://nvd.nist.gov/vuln/detail/CVE-2025-5994
 - uriparser: CVE-2025-67899: https://nvd.nist.gov/vuln/detail/CVE-2025-67899
 - [NEW] valkey: CVE-2025-67733: https://nvd.nist.gov/vuln/detail/CVE-2025-67733
 - [NEW] valkey: CVE-2026-21863: https://nvd.nist.gov/vuln/detail/CVE-2026-21863
 - webkitgtk3: CVE-2025-13502: https://nvd.nist.gov/vuln/detail/CVE-2025-13502
 - webkitgtk3: CVE-2025-13947: https://nvd.nist.gov/vuln/detail/CVE-2025-13947
 - webkitgtk3: CVE-2025-43343: https://nvd.nist.gov/vuln/detail/CVE-2025-43343
 - webkitgtk3: CVE-2025-66287: https://nvd.nist.gov/vuln/detail/CVE-2025-66287
 - webmin: CVE-2025-67738: https://nvd.nist.gov/vuln/detail/CVE-2025-67738
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

Removed this week (6): 

 - python3-django: CVE-2025-13473: https://nvd.nist.gov/vuln/detail/CVE-2025-13473
 - python3-django: CVE-2025-14550: https://nvd.nist.gov/vuln/detail/CVE-2025-14550
 - python3-django: CVE-2026-1207: https://nvd.nist.gov/vuln/detail/CVE-2026-1207
 - python3-django: CVE-2026-1285: https://nvd.nist.gov/vuln/detail/CVE-2026-1285
 - python3-django: CVE-2026-1287: https://nvd.nist.gov/vuln/detail/CVE-2026-1287
 - python3-django: CVE-2026-1312: https://nvd.nist.gov/vuln/detail/CVE-2026-1312

