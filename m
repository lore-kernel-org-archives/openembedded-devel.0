Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0636FF8850
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 05:21:04 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36358.1777267263990360666
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Apr 2026 22:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Yu89YxKs;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so121864045e9.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Apr 2026 22:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777267262; x=1777872062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3RAG/1RVgo/gIvRliYuOKjfcb/h2QLZ/NRGvxtgzvnE=;
        b=Yu89YxKscuwbq7lkZbxKRt7MLXtr6Sc+9eIi65xOvoudtwCUdfQ87IYBobkxaXK4RP
         jvw8127Ua0uJTBYg5mMagiuw3Rd7AC8Aclezmd3pYvqJYAaRj7AybCOJqTv908NYuucP
         hY7vmOn+H6CqCXWG7iOOyNCV8jkoXOwj4wVXadTfvZe26m7qicAZM+yNn548Aa0jDtxN
         he6AbqWh950ISa6sLbXagLzAiICZ9Y0zCLh9BD69LC+eEkq+5oboHgHzU9K8XpRSurqs
         fxPykuf9mg4DzcIEMiolRlggKke12iFPqSBnnQ2mrqDX24/pfwZdiIPUBWuOEOcno7kT
         rumA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777267262; x=1777872062;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3RAG/1RVgo/gIvRliYuOKjfcb/h2QLZ/NRGvxtgzvnE=;
        b=ZYa6ghmk/XE7yCwJjVlhTVFfwJn6NnfPi0MucuRAO9cstNZqxkTk2UUEv68/Fxo7LX
         uD1TueH3CdVVjtqryLpJY6ZWTWtbsVEyfF0EhthHrNzipxB/0qQQWCFtCDzi+fkp0igc
         PVPSTGdUPHx89eg4x6fLsZ3uXI1YDdwfS6K0OHdiHWsiGc04md7BTFJQwulRRszaqcQV
         olTh6yl1s+UF+t0PWJ+Fpmc/ULdprdQS4jMA6aq8YP9d2RdSIitgO3vwzv1QAbqccjpW
         XDaCPHEYrdtX/62dEGJG0vwzDGFvr6dSh+ko2sZkowQILpptM2msaLM+ZPybpPEOyVrS
         FXhw==
X-Gm-Message-State: AOJu0YzfhLfClBy4XEDR09e2ZjYsFJCBhXbxGSAG5SX7+R3MO/EK99dh
	UWy98QHG4wNj/f2GWVkCMk40GQpV2jL2IRQxqD/ywt0+oH1WYVI9T99FMjU27A==
X-Gm-Gg: AeBDiesqTQiQszDrm4efBbPP+ccn0hujiZFWwd88tzngMYQF4wkE/NyHpq/yqC/ysWz
	lPX7bQVsrwF+njGoPIVFSl8/vUzQZgYm1MCI5pt8bSA4QEIZf4pv2n2WICgSmObzCXLcijTato2
	eKJ+y/tv/6bpMh9ig9tsrylcZ3GgIEo7x1KEUvIFFgpUkGohmrAy/0DKji9ZICbNux47Ukz7Nuq
	Efx8KwGqQZd9wgma7LLP5WJJRoNAhsY+1oORh1Teuse28OUWZMvMyy7pqBpzHHNSWcbQB0caL91
	q/2yA9h96qii8kpN7FBKwFbsaObAoPW7k6lrQiMrzcph+orMR/HcJn/wTwrHqIYBkFHaD8CHdkI
	iKZGdn5E03S2Ze4SpuW+HT7wWqKK5BeQPIZejcWZd4LpSDJ7HXSQ2vYGAjRknS4IXJQm4rAY/xH
	9/PZO6DfyCYVK8ORxH75EA39uEPn/pHno=
X-Received: by 2002:a05:600c:1549:b0:48a:761:5808 with SMTP id 5b1f17b1804b1-48a07615c09mr395416115e9.0.1777267261941;
        Sun, 26 Apr 2026 22:21:01 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb767961sm231000335e9.16.2026.04.26.22.21.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 22:21:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-04-27
Date: Mon, 27 Apr 2026 07:20:56 +0200
Message-ID: <20260427052058.805635-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2026 05:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126629

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (94, out of which new this week: 6):

 - [NEW] civetweb: CVE-2026-5789: https://nvd.nist.gov/vuln/detail/CVE-2026-5789
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
 - [NEW] freerdp: CVE-2026-40254: https://nvd.nist.gov/vuln/detail/CVE-2026-40254
 - libcoap: CVE-2026-29013: https://nvd.nist.gov/vuln/detail/CVE-2026-29013
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - [NEW] libsoup-2.4: CVE-2026-2436: https://nvd.nist.gov/vuln/detail/CVE-2026-2436
 - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-5119
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-66442
 - miniupnpd: CVE-2026-5720: https://nvd.nist.gov/vuln/detail/CVE-2026-5720
 - [NEW] ntfs-3g-ntfsprogs: CVE-2026-40706: https://nvd.nist.gov/vuln/detail/CVE-2026-40706
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] polkit: CVE-2026-4897: https://nvd.nist.gov/vuln/detail/CVE-2026-4897
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - [NEW] python3-grpcio-tools: CVE-2026-33186: https://nvd.nist.gov/vuln/detail/CVE-2026-33186
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (52): 

 - fio: CVE-2026-30656: https://nvd.nist.gov/vuln/detail/CVE-2026-30656
 - jq: CVE-2026-32316: https://nvd.nist.gov/vuln/detail/CVE-2026-32316
 - jq: CVE-2026-33947: https://nvd.nist.gov/vuln/detail/CVE-2026-33947
 - jq: CVE-2026-33948: https://nvd.nist.gov/vuln/detail/CVE-2026-33948
 - jq: CVE-2026-39979: https://nvd.nist.gov/vuln/detail/CVE-2026-39979
 - lcms: CVE-2026-41254: https://nvd.nist.gov/vuln/detail/CVE-2026-41254
 - libgphoto2: CVE-2026-40333: https://nvd.nist.gov/vuln/detail/CVE-2026-40333
 - libgphoto2: CVE-2026-40334: https://nvd.nist.gov/vuln/detail/CVE-2026-40334
 - libgphoto2: CVE-2026-40335: https://nvd.nist.gov/vuln/detail/CVE-2026-40335
 - libgphoto2: CVE-2026-40336: https://nvd.nist.gov/vuln/detail/CVE-2026-40336
 - libgphoto2: CVE-2026-40338: https://nvd.nist.gov/vuln/detail/CVE-2026-40338
 - libgphoto2: CVE-2026-40339: https://nvd.nist.gov/vuln/detail/CVE-2026-40339
 - libgphoto2: CVE-2026-40340: https://nvd.nist.gov/vuln/detail/CVE-2026-40340
 - libgphoto2: CVE-2026-40341: https://nvd.nist.gov/vuln/detail/CVE-2026-40341
 - libraw: CVE-2026-20911: https://nvd.nist.gov/vuln/detail/CVE-2026-20911
 - libraw: CVE-2026-21413: https://nvd.nist.gov/vuln/detail/CVE-2026-21413
 - libsoup-2.4: CVE-2026-1467: https://nvd.nist.gov/vuln/detail/CVE-2026-1467
 - libsoup-2.4: CVE-2026-1539: https://nvd.nist.gov/vuln/detail/CVE-2026-1539
 - libsoup-2.4: CVE-2026-1801: https://nvd.nist.gov/vuln/detail/CVE-2026-1801
 - libsoup-2.4: CVE-2026-2443: https://nvd.nist.gov/vuln/detail/CVE-2026-2443
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - ngtcp2: CVE-2026-40170: https://nvd.nist.gov/vuln/detail/CVE-2026-40170
 - openjpeg: CVE-2026-6192: https://nvd.nist.gov/vuln/detail/CVE-2026-6192
 - protobuf: CVE-2026-6409: https://nvd.nist.gov/vuln/detail/CVE-2026-6409
 - python3-grpcio: CVE-2026-33186: https://nvd.nist.gov/vuln/detail/CVE-2026-33186
 - python3-pillow: CVE-2026-40192: https://nvd.nist.gov/vuln/detail/CVE-2026-40192
 - wolfssl: CVE-2026-5188: https://nvd.nist.gov/vuln/detail/CVE-2026-5188
 - wolfssl: CVE-2026-5392: https://nvd.nist.gov/vuln/detail/CVE-2026-5392
 - wolfssl: CVE-2026-5393: https://nvd.nist.gov/vuln/detail/CVE-2026-5393
 - wolfssl: CVE-2026-5447: https://nvd.nist.gov/vuln/detail/CVE-2026-5447
 - wolfssl: CVE-2026-5448: https://nvd.nist.gov/vuln/detail/CVE-2026-5448
 - wolfssl: CVE-2026-5460: https://nvd.nist.gov/vuln/detail/CVE-2026-5460
 - wolfssl: CVE-2026-5466: https://nvd.nist.gov/vuln/detail/CVE-2026-5466
 - wolfssl: CVE-2026-5479: https://nvd.nist.gov/vuln/detail/CVE-2026-5479
 - wolfssl: CVE-2026-5500: https://nvd.nist.gov/vuln/detail/CVE-2026-5500
 - xdg-desktop-portal: CVE-2026-40354: https://nvd.nist.gov/vuln/detail/CVE-2026-40354
 - xrdp: CVE-2026-32105: https://nvd.nist.gov/vuln/detail/CVE-2026-32105
 - xrdp: CVE-2026-32107: https://nvd.nist.gov/vuln/detail/CVE-2026-32107
 - xrdp: CVE-2026-32623: https://nvd.nist.gov/vuln/detail/CVE-2026-32623
 - xrdp: CVE-2026-32624: https://nvd.nist.gov/vuln/detail/CVE-2026-32624
 - xrdp: CVE-2026-33145: https://nvd.nist.gov/vuln/detail/CVE-2026-33145
 - xrdp: CVE-2026-33516: https://nvd.nist.gov/vuln/detail/CVE-2026-33516
 - xrdp: CVE-2026-33689: https://nvd.nist.gov/vuln/detail/CVE-2026-33689
 - xrdp: CVE-2026-35512: https://nvd.nist.gov/vuln/detail/CVE-2026-35512

