Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FD46CD37B7
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 05:50:28 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.43474.1778478617911875622
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 May 2026 22:50:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=PP0SPWd5;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so43487955e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 10 May 2026 22:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778478616; x=1779083416; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xPOS+quMeVbRgyWbofedJ92zIdwlWCH5Rg8225N1w88=;
        b=PP0SPWd5VbvGPVp+IjH4Vk3RbHTZnCLDOp+YGHll67P1l8aihtDANHOveTq/zma9JY
         yUGk1V45DTNWauMEI69oB7VM7jmYQ/arbMGxXY8EHQJDy5w0/w9LYXb/Wjw2gLWjhNUK
         GacwhCxRkOtQ60R/O/u7gtqWigAEj4cXz3ImG5PH+y7lPNoDyzX7wGlZjMuyDLwT1uTx
         1H9Nty4sUYgItFpFuYUMm93OKnoghBMPr0vGMS4wvP3HwvaeDE9ktDH5nR5vjMPI1DM+
         Ao5OZ83a7ershc4aMLhm7hBJdsDjc6HJ3yBSBmd6HbcMDDigkMCVbcYlEsEpEe/vY9QT
         BaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778478616; x=1779083416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xPOS+quMeVbRgyWbofedJ92zIdwlWCH5Rg8225N1w88=;
        b=il3AZyZELg9wgkg+5WBEEJFvPmoA6FQCIbcdVib5d874JKj+3KPpqyyzbdGHwOf6ti
         KDxadldZHbVbf6lvzAIXmMfnrS3w8P76/RZA8ECVAhPn2ffjHD1fBJqA5VzRr8ls1Uj0
         H/gfVPunQeizvBXnUGUBalpdAeVIDLaVTn1NsCB6Kx/tVeqJk1LCFsRds6IllyAuonrZ
         RZGC2SM4ZztIc35o0hjLDF2Ji77J0Dv1sqwkZnMBLHwELZsAPpThJAvaaI6/1Fbd1860
         gGPrMahMF6zFBap1CyaooNO3GDiW59EELGAVa06x3tJF+U0llXChyB/goYxOoZuzpwVF
         1whg==
X-Gm-Message-State: AOJu0YzJ8j8QL1D1hAn04HcmBtG2SnbZ9U7xCunn6CxzDMLwh/xbuZu7
	E/nLhAk2/+6mnlWBLGbPxoTLvxGv9eT6UCmybTydwu5yNC0Pn22dLMJoyWUltQ==
X-Gm-Gg: Acq92OHBELiQIyTsy9UAlCcImUo30sWr6aMbY6NC1YQKgFl5YmDiDIRcecqfprwjO9G
	umIKLOoBqSJTElsE9ceSrzIZ/31yY3JSVZL8NdWdUgLFNBlr41DaBfhHRKwPai453Yv2Uisjo81
	+UzrLQ+Vykqq3++C+Sdh9os8N5NoFc7unQdQKfecHediqM49ASu3EEkqDacLApDI+8bpMufetGY
	0M7Dce6x8/NQXcBPRG2d3Dje0zxIvh61QEggilaOb7xr2W2QU7EULEVnT5Xms/fgXT6F+uqMzK4
	RYhLqlyDU6wvDx+J/L0L/B7NKdHFMGjKonWeDr0BGKBqctGMgWA/oGTx97ntJEc8e2IAR3F2cV7
	+EKwN7g1VjqR1bGVYvDiyF+nOc/ifu2ZknfRGFpaSSIg7xek0vQ/vQm90rlLAVZO2dlxZkJNUTg
	qDk9yvEJ4N1IwjnptvcmNDfOZJYkDveas=
X-Received: by 2002:a05:600c:4e0d:b0:48a:5c23:cab with SMTP id 5b1f17b1804b1-48e70700e20mr137111755e9.19.1778478616060;
        Sun, 10 May 2026 22:50:16 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e6daf039esm78303255e9.3.2026.05.10.22.50.15
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 22:50:15 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-05-11
Date: Mon, 11 May 2026 07:50:11 +0200
Message-ID: <20260511055013.1806816-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 05:50:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126836

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (195, out of which new this week: 82):

 - [NEW] apache2: CVE-2026-23918: https://nvd.nist.gov/vuln/detail/CVE-2026-23918
 - [NEW] apache2: CVE-2026-24072: https://nvd.nist.gov/vuln/detail/CVE-2026-24072
 - [NEW] apache2: CVE-2026-28780: https://nvd.nist.gov/vuln/detail/CVE-2026-28780
 - [NEW] apache2: CVE-2026-29168: https://nvd.nist.gov/vuln/detail/CVE-2026-29168
 - [NEW] apache2: CVE-2026-29169: https://nvd.nist.gov/vuln/detail/CVE-2026-29169
 - [NEW] apache2: CVE-2026-33006: https://nvd.nist.gov/vuln/detail/CVE-2026-33006
 - [NEW] apache2: CVE-2026-33007: https://nvd.nist.gov/vuln/detail/CVE-2026-33007
 - [NEW] apache2: CVE-2026-33523: https://nvd.nist.gov/vuln/detail/CVE-2026-33523
 - [NEW] apache2: CVE-2026-33857: https://nvd.nist.gov/vuln/detail/CVE-2026-33857
 - [NEW] apache2: CVE-2026-34032: https://nvd.nist.gov/vuln/detail/CVE-2026-34032
 - [NEW] apache2: CVE-2026-34059: https://nvd.nist.gov/vuln/detail/CVE-2026-34059
 - [NEW] bubblewrap: CVE-2026-41163: https://nvd.nist.gov/vuln/detail/CVE-2026-41163
 - [NEW] cannelloni: CVE-2026-37539: https://nvd.nist.gov/vuln/detail/CVE-2026-37539
 - civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-5789
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - [NEW] dovecot: CVE-2025-59028: https://nvd.nist.gov/vuln/detail/CVE-2025-59028
 - [NEW] dovecot: CVE-2025-59032: https://nvd.nist.gov/vuln/detail/CVE-2025-59032
 - [NEW] dovecot: CVE-2026-27859: https://nvd.nist.gov/vuln/detail/CVE-2026-27859
 - [NEW] emacs: CVE-2026-6861: https://nvd.nist.gov/vuln/detail/CVE-2026-6861
 - [NEW] exiftool: CVE-2026-7580: https://nvd.nist.gov/vuln/detail/CVE-2026-7580
 - [NEW] firewalld: CVE-2026-4948: https://nvd.nist.gov/vuln/detail/CVE-2026-4948
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
 - gimp: CVE-2026-40915: https://nvd.nist.gov/vuln/detail/CVE-2026-40915
 - gimp: CVE-2026-40916: https://nvd.nist.gov/vuln/detail/CVE-2026-40916
 - gimp: CVE-2026-40917: https://nvd.nist.gov/vuln/detail/CVE-2026-40917
 - gimp: CVE-2026-40918: https://nvd.nist.gov/vuln/detail/CVE-2026-40918
 - gimp: CVE-2026-40919: https://nvd.nist.gov/vuln/detail/CVE-2026-40919
 - gimp: CVE-2026-6384: https://nvd.nist.gov/vuln/detail/CVE-2026-6384
 - [NEW] lcms: CVE-2026-42798: https://nvd.nist.gov/vuln/detail/CVE-2026-42798
 - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - libsoup-2.4: CVE-2026-2436: https://nvd.nist.gov/vuln/detail/CVE-2026-2436
 - [NEW] libsoup-2.4: CVE-2026-2708: https://nvd.nist.gov/vuln/detail/CVE-2026-2708
 - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-5119
 - libssh: CVE-2025-14821: https://nvd.nist.gov/vuln/detail/CVE-2025-14821
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
 - [NEW] postfix: CVE-2026-43964: https://nvd.nist.gov/vuln/detail/CVE-2026-43964
 - proftpd: CVE-2026-42167: https://nvd.nist.gov/vuln/detail/CVE-2026-42167
 - [NEW] proftpd: CVE-2026-44331: https://nvd.nist.gov/vuln/detail/CVE-2026-44331
 - python3-binwalk: CVE-2026-7179: https://nvd.nist.gov/vuln/detail/CVE-2026-7179
 - [NEW] python3-django: CVE-2026-35192: https://nvd.nist.gov/vuln/detail/CVE-2026-35192
 - [NEW] python3-django: CVE-2026-5766: https://nvd.nist.gov/vuln/detail/CVE-2026-5766
 - [NEW] python3-django: CVE-2026-6907: https://nvd.nist.gov/vuln/detail/CVE-2026-6907
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-grpcio-tools: CVE-2026-33186: https://nvd.nist.gov/vuln/detail/CVE-2026-33186
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - [NEW] python3-pillow: CVE-2026-42309: https://nvd.nist.gov/vuln/detail/CVE-2026-42309
 - [NEW] python3-pillow: CVE-2026-42310: https://nvd.nist.gov/vuln/detail/CVE-2026-42310
 - [NEW] python3-pillow: CVE-2026-42311: https://nvd.nist.gov/vuln/detail/CVE-2026-42311
 - [NEW] redis: CVE-2026-23479: https://nvd.nist.gov/vuln/detail/CVE-2026-23479
 - [NEW] redis: CVE-2026-23631: https://nvd.nist.gov/vuln/detail/CVE-2026-23631
 - [NEW] redis: CVE-2026-25243: https://nvd.nist.gov/vuln/detail/CVE-2026-25243
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - thrift: CVE-2025-48431: https://nvd.nist.gov/vuln/detail/CVE-2025-48431
 - thrift: CVE-2026-41602: https://nvd.nist.gov/vuln/detail/CVE-2026-41602
 - thrift: CVE-2026-41603: https://nvd.nist.gov/vuln/detail/CVE-2026-41603
 - thrift: CVE-2026-41604: https://nvd.nist.gov/vuln/detail/CVE-2026-41604
 - thrift: CVE-2026-41605: https://nvd.nist.gov/vuln/detail/CVE-2026-41605
 - thrift: CVE-2026-41606: https://nvd.nist.gov/vuln/detail/CVE-2026-41606
 - thrift: CVE-2026-41607: https://nvd.nist.gov/vuln/detail/CVE-2026-41607
 - thrift: CVE-2026-41636: https://nvd.nist.gov/vuln/detail/CVE-2026-41636
 - [NEW] thrift: CVE-2026-43868: https://nvd.nist.gov/vuln/detail/CVE-2026-43868
 - [NEW] thrift: CVE-2026-43869: https://nvd.nist.gov/vuln/detail/CVE-2026-43869
 - [NEW] thrift: CVE-2026-43870: https://nvd.nist.gov/vuln/detail/CVE-2026-43870
 - tinyproxy: CVE-2026-31842: https://nvd.nist.gov/vuln/detail/CVE-2026-31842
 - uriparser: CVE-2026-42371: https://nvd.nist.gov/vuln/detail/CVE-2026-42371
 - [NEW] uriparser: CVE-2026-44927: https://nvd.nist.gov/vuln/detail/CVE-2026-44927
 - [NEW] uriparser: CVE-2026-44928: https://nvd.nist.gov/vuln/detail/CVE-2026-44928
 - [NEW] wireshark: CVE-2026-5299: https://nvd.nist.gov/vuln/detail/CVE-2026-5299
 - [NEW] wireshark: CVE-2026-5401: https://nvd.nist.gov/vuln/detail/CVE-2026-5401
 - [NEW] wireshark: CVE-2026-5402: https://nvd.nist.gov/vuln/detail/CVE-2026-5402
 - [NEW] wireshark: CVE-2026-5403: https://nvd.nist.gov/vuln/detail/CVE-2026-5403
 - [NEW] wireshark: CVE-2026-5404: https://nvd.nist.gov/vuln/detail/CVE-2026-5404
 - [NEW] wireshark: CVE-2026-5405: https://nvd.nist.gov/vuln/detail/CVE-2026-5405
 - [NEW] wireshark: CVE-2026-5406: https://nvd.nist.gov/vuln/detail/CVE-2026-5406
 - [NEW] wireshark: CVE-2026-5407: https://nvd.nist.gov/vuln/detail/CVE-2026-5407
 - [NEW] wireshark: CVE-2026-5408: https://nvd.nist.gov/vuln/detail/CVE-2026-5408
 - [NEW] wireshark: CVE-2026-5409: https://nvd.nist.gov/vuln/detail/CVE-2026-5409
 - [NEW] wireshark: CVE-2026-5653: https://nvd.nist.gov/vuln/detail/CVE-2026-5653
 - [NEW] wireshark: CVE-2026-5654: https://nvd.nist.gov/vuln/detail/CVE-2026-5654
 - [NEW] wireshark: CVE-2026-5655: https://nvd.nist.gov/vuln/detail/CVE-2026-5655
 - [NEW] wireshark: CVE-2026-5656: https://nvd.nist.gov/vuln/detail/CVE-2026-5656
 - [NEW] wireshark: CVE-2026-5657: https://nvd.nist.gov/vuln/detail/CVE-2026-5657
 - [NEW] wireshark: CVE-2026-6519: https://nvd.nist.gov/vuln/detail/CVE-2026-6519
 - [NEW] wireshark: CVE-2026-6520: https://nvd.nist.gov/vuln/detail/CVE-2026-6520
 - [NEW] wireshark: CVE-2026-6521: https://nvd.nist.gov/vuln/detail/CVE-2026-6521
 - [NEW] wireshark: CVE-2026-6522: https://nvd.nist.gov/vuln/detail/CVE-2026-6522
 - [NEW] wireshark: CVE-2026-6523: https://nvd.nist.gov/vuln/detail/CVE-2026-6523
 - [NEW] wireshark: CVE-2026-6524: https://nvd.nist.gov/vuln/detail/CVE-2026-6524
 - [NEW] wireshark: CVE-2026-6525: https://nvd.nist.gov/vuln/detail/CVE-2026-6525
 - [NEW] wireshark: CVE-2026-6526: https://nvd.nist.gov/vuln/detail/CVE-2026-6526
 - [NEW] wireshark: CVE-2026-6527: https://nvd.nist.gov/vuln/detail/CVE-2026-6527
 - [NEW] wireshark: CVE-2026-6528: https://nvd.nist.gov/vuln/detail/CVE-2026-6528
 - [NEW] wireshark: CVE-2026-6529: https://nvd.nist.gov/vuln/detail/CVE-2026-6529
 - [NEW] wireshark: CVE-2026-6530: https://nvd.nist.gov/vuln/detail/CVE-2026-6530
 - [NEW] wireshark: CVE-2026-6531: https://nvd.nist.gov/vuln/detail/CVE-2026-6531
 - [NEW] wireshark: CVE-2026-6532: https://nvd.nist.gov/vuln/detail/CVE-2026-6532
 - [NEW] wireshark: CVE-2026-6533: https://nvd.nist.gov/vuln/detail/CVE-2026-6533
 - [NEW] wireshark: CVE-2026-6534: https://nvd.nist.gov/vuln/detail/CVE-2026-6534
 - [NEW] wireshark: CVE-2026-6535: https://nvd.nist.gov/vuln/detail/CVE-2026-6535
 - [NEW] wireshark: CVE-2026-6536: https://nvd.nist.gov/vuln/detail/CVE-2026-6536
 - [NEW] wireshark: CVE-2026-6537: https://nvd.nist.gov/vuln/detail/CVE-2026-6537
 - [NEW] wireshark: CVE-2026-6538: https://nvd.nist.gov/vuln/detail/CVE-2026-6538
 - [NEW] wireshark: CVE-2026-6867: https://nvd.nist.gov/vuln/detail/CVE-2026-6867
 - [NEW] wireshark: CVE-2026-6868: https://nvd.nist.gov/vuln/detail/CVE-2026-6868
 - [NEW] wireshark: CVE-2026-6869: https://nvd.nist.gov/vuln/detail/CVE-2026-6869
 - [NEW] wireshark: CVE-2026-6870: https://nvd.nist.gov/vuln/detail/CVE-2026-6870
 - [NEW] wireshark: CVE-2026-7375: https://nvd.nist.gov/vuln/detail/CVE-2026-7375
 - [NEW] wireshark: CVE-2026-7376: https://nvd.nist.gov/vuln/detail/CVE-2026-7376
 - [NEW] wireshark: CVE-2026-7378: https://nvd.nist.gov/vuln/detail/CVE-2026-7378
 - [NEW] wireshark: CVE-2026-7379: https://nvd.nist.gov/vuln/detail/CVE-2026-7379
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880
 - [NEW] zabbix: CVE-2026-23926: https://nvd.nist.gov/vuln/detail/CVE-2026-23926
 - [NEW] zabbix: CVE-2026-23927: https://nvd.nist.gov/vuln/detail/CVE-2026-23927

====================

Removed this week (0): 


