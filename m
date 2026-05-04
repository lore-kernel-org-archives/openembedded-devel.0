Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E6EFF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 04:25:41 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8091.1777868738193557297
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2026 21:25:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ET0MSg2C;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48909558b3aso38201755e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 May 2026 21:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777868736; x=1778473536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=bp9p7M0I+GvY5e93wvTvrij7bHnZiQgVSkcnIs64DK0=;
        b=ET0MSg2CAxhEuJJeTbkWohhYEJQ9jZxF2wVlcpT0RHLUTfUS0Y6rrVfVd3y5yXp0c7
         qI2Mx8RmN24nv4I7gTma2BPOcQbssp3urkGhBopsEQFDP+5gCrk3dCkeE75CUif8sH4H
         9bjmlcqtnGAxPsqeBTWDlrDi5IointLWSWVW4VLlj4m5aj5+Dv4yFsZZ8xg3z5RFkTJK
         VIU4sUdUvK8BJ1QhpzeooWn+S/RdGaWkJwarvNIY1wA0y7MoHoOj9wWSrKLKu+c80aqQ
         3z1fSTb1MfQMhps0nqhOrtwUwYZsND2mzFWTWhRunS99Z7bFY1mDDwecf77ZXkGgeGmN
         XIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777868736; x=1778473536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bp9p7M0I+GvY5e93wvTvrij7bHnZiQgVSkcnIs64DK0=;
        b=FYhptA0ZgqK8fP43xOphzZaZJ2wzm0qKd7Skf4BoPyuidAR4BF60H4qfdReMj8QBfm
         /Cmx45e/QhSBbjRuLJAKnDb89lSEVjb/KDIWAvHQx7Kdfkehb/+11rXukauwpJ8oPsG7
         fKGfPjc0wPKnC3bU7Sa2+seJSHnnkqGSjunJj55GXHx3ClQrh7o4uT0bc8fTO4C6eaXT
         I3nBU3ZSvL5Uo8mgGKn1cgxmKB2QlnKTqr1ZZSiAaq8Pgzt4GWkKm2i0xiEogAPe+Ccw
         7zxdgqowhTaMwYQA/zkPU4ruuURhfvwEszJ5jCb7FFXbv7RZVqsiYXhhxQ/e5Y9bkCH5
         lfeg==
X-Gm-Message-State: AOJu0YyIkAsoY64tKdI3+EE4j2uv7P6fVh0Eb212Aboku+IsgScpOb9F
	TxZ24LqvSkDcy17/bOnCgSxp/oFonCyHFOzmWo8DRnvm1c6xhOa8hhU1hRYAyQ==
X-Gm-Gg: AeBDieszM2epCkxCwTkt7VUi1urcLzHLvxQWNtaIddtC0QKKDyGlU85iao8OTqTom3S
	tVWIFF6m7T6sQ7JlSlljqzM1sA0sE+5fox4f+dhE3WCK7P3Vvi/MwthmEPjbGhoJmYpIrl497vk
	dPpdIeQxkMHnzGCH1Pl+qpSr1sNOT0EPdy4XuGhiLnxcfmbyeiExsDiRzGNWAgIG1YQFZzTpTyQ
	ekotA9RA4/2P1YtdLoEAvezvYyAmXHzdTmWg6Hw+/HKQmk19R/uM9jVyovoPYOlrxw9B9PERRmY
	sZmMxcAdhxOFkita+cZEWdIyhhA6dYVNIxQCPmHypzC/axlLKRyD7j6Kk0CWcM9itg7XQJegUR7
	6MkO6PyqGgSSbJExawxA+YXVBdPyNxf+/0Oe+KZPRCw+Q+2p5NumiR4ROXPZHBcHNwZkiGBXw2B
	AQlpeHkHUp5oAdS3Bke9z0A0udXFHMPyk=
X-Received: by 2002:a05:600c:a30a:b0:488:b187:3c with SMTP id 5b1f17b1804b1-48a9865d905mr96946555e9.14.1777868736433;
        Sun, 03 May 2026 21:25:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fee5033sm70235745e9.22.2026.05.03.21.25.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:25:34 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-05-04
Date: Mon,  4 May 2026 06:25:31 +0200
Message-ID: <20260504042533.3811271-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 May 2026 04:25:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126773

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (113, out of which new this week: 19):

 - civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-5789
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
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
 - freerdp: CVE-2026-22851: https://nvd.nist.gov/vuln/detail/CVE-2026-22851
 - freerdp: CVE-2026-22856: https://nvd.nist.gov/vuln/detail/CVE-2026-22856
 - freerdp: CVE-2026-22857: https://nvd.nist.gov/vuln/detail/CVE-2026-22857
 - freerdp: CVE-2026-22858: https://nvd.nist.gov/vuln/detail/CVE-2026-22858
 - freerdp: CVE-2026-22859: https://nvd.nist.gov/vuln/detail/CVE-2026-22859
 - freerdp: CVE-2026-23531: https://nvd.nist.gov/vuln/detail/CVE-2026-23531
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
 - freerdp: CVE-2026-29775: https://nvd.nist.gov/vuln/detail/CVE-2026-29775
 - freerdp: CVE-2026-29776: https://nvd.nist.gov/vuln/detail/CVE-2026-29776
 - freerdp: CVE-2026-31806: https://nvd.nist.gov/vuln/detail/CVE-2026-31806
 - freerdp: CVE-2026-31883: https://nvd.nist.gov/vuln/detail/CVE-2026-31883
 - freerdp: CVE-2026-31884: https://nvd.nist.gov/vuln/detail/CVE-2026-31884
 - freerdp: CVE-2026-31885: https://nvd.nist.gov/vuln/detail/CVE-2026-31885
 - freerdp: CVE-2026-31897: https://nvd.nist.gov/vuln/detail/CVE-2026-31897
 - freerdp: CVE-2026-33952: https://nvd.nist.gov/vuln/detail/CVE-2026-33952
 - freerdp: CVE-2026-33977: https://nvd.nist.gov/vuln/detail/CVE-2026-33977
 - freerdp: CVE-2026-33982: https://nvd.nist.gov/vuln/detail/CVE-2026-33982
 - freerdp: CVE-2026-33983: https://nvd.nist.gov/vuln/detail/CVE-2026-33983
 - freerdp: CVE-2026-33984: https://nvd.nist.gov/vuln/detail/CVE-2026-33984
 - freerdp: CVE-2026-33985: https://nvd.nist.gov/vuln/detail/CVE-2026-33985
 - freerdp: CVE-2026-33986: https://nvd.nist.gov/vuln/detail/CVE-2026-33986
 - freerdp: CVE-2026-33987: https://nvd.nist.gov/vuln/detail/CVE-2026-33987
 - freerdp: CVE-2026-33995: https://nvd.nist.gov/vuln/detail/CVE-2026-33995
 - freerdp: CVE-2026-40254: https://nvd.nist.gov/vuln/detail/CVE-2026-40254
 - [NEW] gimp: CVE-2026-40915: https://nvd.nist.gov/vuln/detail/CVE-2026-40915
 - [NEW] gimp: CVE-2026-40916: https://nvd.nist.gov/vuln/detail/CVE-2026-40916
 - [NEW] gimp: CVE-2026-40917: https://nvd.nist.gov/vuln/detail/CVE-2026-40917
 - [NEW] gimp: CVE-2026-40918: https://nvd.nist.gov/vuln/detail/CVE-2026-40918
 - [NEW] gimp: CVE-2026-40919: https://nvd.nist.gov/vuln/detail/CVE-2026-40919
 - [NEW] gimp: CVE-2026-6384: https://nvd.nist.gov/vuln/detail/CVE-2026-6384
 - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - libsoup-2.4: CVE-2026-2436: https://nvd.nist.gov/vuln/detail/CVE-2026-2436
 - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-5119
 - [NEW] libssh: CVE-2025-14821: https://nvd.nist.gov/vuln/detail/CVE-2025-14821
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-66442
 - miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-5720
 - ntfs-3g-ntfsprogs: CVE-2026-40706: https://nvd.nist.gov/vuln/detail/CVE-2026-40706
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - polkit: CVE-2026-4897: https://nvd.nist.gov/vuln/detail/CVE-2026-4897
 - [NEW] proftpd: CVE-2026-42167: https://nvd.nist.gov/vuln/detail/CVE-2026-42167
 - [NEW] python3-binwalk: CVE-2026-7179: https://nvd.nist.gov/vuln/detail/CVE-2026-7179
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-grpcio-tools: CVE-2026-33186: https://nvd.nist.gov/vuln/detail/CVE-2026-33186
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - [NEW] thrift: CVE-2025-48431: https://nvd.nist.gov/vuln/detail/CVE-2025-48431
 - [NEW] thrift: CVE-2026-41602: https://nvd.nist.gov/vuln/detail/CVE-2026-41602
 - [NEW] thrift: CVE-2026-41603: https://nvd.nist.gov/vuln/detail/CVE-2026-41603
 - [NEW] thrift: CVE-2026-41604: https://nvd.nist.gov/vuln/detail/CVE-2026-41604
 - [NEW] thrift: CVE-2026-41605: https://nvd.nist.gov/vuln/detail/CVE-2026-41605
 - [NEW] thrift: CVE-2026-41606: https://nvd.nist.gov/vuln/detail/CVE-2026-41606
 - [NEW] thrift: CVE-2026-41607: https://nvd.nist.gov/vuln/detail/CVE-2026-41607
 - [NEW] thrift: CVE-2026-41636: https://nvd.nist.gov/vuln/detail/CVE-2026-41636
 - [NEW] tinyproxy: CVE-2026-31842: https://nvd.nist.gov/vuln/detail/CVE-2026-31842
 - [NEW] uriparser: CVE-2026-42371: https://nvd.nist.gov/vuln/detail/CVE-2026-42371
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (0): 


