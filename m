Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD82BE64002
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:39:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49175.1775453978050667037
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:39:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MTg5V4tz;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso29499615e9.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775453976; x=1776058776; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7tag1jZ1UKfAW2CtZ6iPAjk4kb1CI8E09kLFI11sdig=;
        b=MTg5V4tz70qLy3fxPaPi6mHXXQeYOy0SH+FzW0Qn+8+b59GsVLljM62uN3U3og1PVn
         OwncQGCl0fUgMGsK8CTsjmYJsUCRmvxJKVBE8Z0264yCHeTXTdcgHW4ecsiI/uNZUyXv
         Uyp0hMADhxbOvr6dEgNUCN7GJW2GjiDHePES+OQ+WP+hICBDugbqDFtdSOXYPzhdXAmn
         LsrpTfGpeBl5LGwcO235E5JkrQ50uGpPvIptzb0+xigSY4QI+5xmVTn+xXEDCJBnnfpK
         sWsuqgJppC8eyE6z7mS52tRZ+lnHuliA66S800V7yISk1ag7EKrLofk8d5fy41yvfmZJ
         +jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775453976; x=1776058776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tag1jZ1UKfAW2CtZ6iPAjk4kb1CI8E09kLFI11sdig=;
        b=MbybwTtHrPe3i4nFT9e3dbVf9rWa4Iy1C5xXGjzn04RfZb24ygl/4/HQmg9qeJA6Sj
         HFZR4ZiP7yeRr4ithoQV1nbvi5hdUFrXdSx1Kk4MEDAcDwGEgJ4zwf9VfrkR5GZVMhS2
         ZQarSi7/kvgd8k+1a0j3tczMeb8ZfhsPnI4MMrPKDdxIc3Li+VEvHO61s+p/98WgYXSe
         xf7m82MHzcKE+Miis1Fnf4hQYEk3/Wg6mFk8Ka2G4BBuAhB3+s8Tg6trMb2byjCh8HFv
         Ij5Uu4/FnpwKcar0OiO/2UNtvzGDxNEo4pWG/cDxIqORPGsepExSxCrjt5AFwwkNstvn
         OSDw==
X-Gm-Message-State: AOJu0Yy9GXcKrnlVzKZrZTU6I964pdQAI3TdF/1ubsln9MlNZ2/yTOmv
	C6FDSqlT3hrOHVjj1VuS8potUu7ar14Xj94y8u7GjnfUhG+X/0csk8cIXaw2FA==
X-Gm-Gg: AeBDietK/F/H65wl1L5DsIwOVRCryeQpnjl3ODiBj6wR2vDQXFAYecym7Z7InztPN2c
	8wGBUHHo1c6IDPvPkQjUvmkA5btovTjaPETzPrjLTXtqbNQdtChILTfB6fFg+JAb39g+ADkkwP5
	56gpGhbK463uyJyZOWidUAll7Z+WZTKNvY5YytCQGsbDWpQwHXXfW0OgM6o4y+l5QBSx7WYf/Pt
	cMnV87df9/MUc3bK8gmrwxIfBsfEEMHRW2C+PXWYqc1oqYk+ViSzfbK4JfxX6qeXfb3TqPaBfMb
	EYiv5FqmwWrT6mHbwwPlRBaGmR0vWuTkYI6c0mcXaqLbdEE8BGBouSV60pq5inSLBj7LBn49XVv
	T99qeOia7j03zxD9JrkJpMcEBpy/EHp58iGOaEDI2fDfcm7EhdeR8U+fly1gUhlYZKSWj/yQ8ng
	Mvn8pxj5rj7wUZbWZpFkRkfBuGcaiB/+M=
X-Received: by 2002:a05:600c:c8f:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-488996d23e7mr140000765e9.6.1775453976297;
        Sun, 05 Apr 2026 22:39:36 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48897fd5594sm83627845e9.3.2026.04.05.22.39.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 22:39:35 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2026-04-06
Date: Mon,  6 Apr 2026 07:39:30 +0200
Message-ID: <20260406053932.3155661-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126027

Do you see a recipe on this list that is important for you? Help us busting some CVEs by sending some patches.

List of all open CVEs (142, out of which new this week: 41):

 - [NEW] botan: CVE-2026-32877: https://nvd.nist.gov/vuln/detail/CVE-2026-32877
 - [NEW] botan: CVE-2026-32883: https://nvd.nist.gov/vuln/detail/CVE-2026-32883
 - ctags: CVE-2026-2641: https://nvd.nist.gov/vuln/detail/CVE-2026-2641
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - docopt.cpp: CVE-2025-67125: https://nvd.nist.gov/vuln/detail/CVE-2025-67125
 - dovecot: CVE-2025-59031: https://nvd.nist.gov/vuln/detail/CVE-2025-59031
 - dovecot: CVE-2026-0394: https://nvd.nist.gov/vuln/detail/CVE-2026-0394
 - dovecot: CVE-2026-24031: https://nvd.nist.gov/vuln/detail/CVE-2026-24031
 - dovecot: CVE-2026-27855: https://nvd.nist.gov/vuln/detail/CVE-2026-27855
 - dovecot: CVE-2026-27860: https://nvd.nist.gov/vuln/detail/CVE-2026-27860
 - fontforge: CVE-2025-15271: https://nvd.nist.gov/vuln/detail/CVE-2025-15271
 - fontforge: CVE-2025-15272: https://nvd.nist.gov/vuln/detail/CVE-2025-15272
 - fontforge: CVE-2025-15273: https://nvd.nist.gov/vuln/detail/CVE-2025-15273
 - fontforge: CVE-2025-15274: https://nvd.nist.gov/vuln/detail/CVE-2025-15274
 - fontforge: CVE-2025-15276: https://nvd.nist.gov/vuln/detail/CVE-2025-15276
 - fontforge: CVE-2025-15277: https://nvd.nist.gov/vuln/detail/CVE-2025-15277
 - fontforge: CVE-2025-15278: https://nvd.nist.gov/vuln/detail/CVE-2025-15278
 - fontforge: CVE-2025-15280: https://nvd.nist.gov/vuln/detail/CVE-2025-15280
 - freeipmi: CVE-2026-33554: https://nvd.nist.gov/vuln/detail/CVE-2026-33554
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
 - [NEW] freerdp: CVE-2026-33952: https://nvd.nist.gov/vuln/detail/CVE-2026-33952
 - [NEW] freerdp: CVE-2026-33977: https://nvd.nist.gov/vuln/detail/CVE-2026-33977
 - [NEW] freerdp: CVE-2026-33982: https://nvd.nist.gov/vuln/detail/CVE-2026-33982
 - [NEW] freerdp: CVE-2026-33983: https://nvd.nist.gov/vuln/detail/CVE-2026-33983
 - [NEW] freerdp: CVE-2026-33984: https://nvd.nist.gov/vuln/detail/CVE-2026-33984
 - [NEW] freerdp: CVE-2026-33985: https://nvd.nist.gov/vuln/detail/CVE-2026-33985
 - [NEW] freerdp: CVE-2026-33986: https://nvd.nist.gov/vuln/detail/CVE-2026-33986
 - [NEW] freerdp: CVE-2026-33987: https://nvd.nist.gov/vuln/detail/CVE-2026-33987
 - [NEW] freerdp: CVE-2026-33995: https://nvd.nist.gov/vuln/detail/CVE-2026-33995
 - [NEW] giflib: CVE-2026-23868: https://nvd.nist.gov/vuln/detail/CVE-2026-23868
 - [NEW] leancrypto: CVE-2026-34610: https://nvd.nist.gov/vuln/detail/CVE-2026-34610
 - libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
 - libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
 - libheif: CVE-2026-3950: https://nvd.nist.gov/vuln/detail/CVE-2026-3950
 - [NEW] libraw: CVE-2026-5318: https://nvd.nist.gov/vuln/detail/CVE-2026-5318
 - [NEW] libraw: CVE-2026-5342: https://nvd.nist.gov/vuln/detail/CVE-2026-5342
 - libsoup-2.4: CVE-2026-1467: https://nvd.nist.gov/vuln/detail/CVE-2026-1467
 - libsoup-2.4: CVE-2026-1536: https://nvd.nist.gov/vuln/detail/CVE-2026-1536
 - libsoup-2.4: CVE-2026-1539: https://nvd.nist.gov/vuln/detail/CVE-2026-1539
 - libsoup-2.4: CVE-2026-1801: https://nvd.nist.gov/vuln/detail/CVE-2026-1801
 - libsoup-2.4: CVE-2026-2443: https://nvd.nist.gov/vuln/detail/CVE-2026-2443
 - libsoup-2.4: CVE-2026-3099: https://nvd.nist.gov/vuln/detail/CVE-2026-3099
 - libsoup-2.4: CVE-2026-3632: https://nvd.nist.gov/vuln/detail/CVE-2026-3632
 - libsoup-2.4: CVE-2026-3633: https://nvd.nist.gov/vuln/detail/CVE-2026-3633
 - libsoup-2.4: CVE-2026-3634: https://nvd.nist.gov/vuln/detail/CVE-2026-3634
 - libsoup-2.4: CVE-2026-4271: https://nvd.nist.gov/vuln/detail/CVE-2026-4271
 - [NEW] libsoup-2.4: CVE-2026-5119: https://nvd.nist.gov/vuln/detail/CVE-2026-5119
 - libuvc: CVE-2026-1991: https://nvd.nist.gov/vuln/detail/CVE-2026-1991
 - live555: CVE-2026-1200: https://nvd.nist.gov/vuln/detail/CVE-2026-1200
 - [NEW] mbedtls: CVE-2025-66442: https://nvd.nist.gov/vuln/detail/CVE-2025-66442
 - [NEW] mbedtls: CVE-2026-34872: https://nvd.nist.gov/vuln/detail/CVE-2026-34872
 - [NEW] mbedtls: CVE-2026-34874: https://nvd.nist.gov/vuln/detail/CVE-2026-34874
 - [NEW] mbedtls: CVE-2026-34875: https://nvd.nist.gov/vuln/detail/CVE-2026-34875
 - monkey: CVE-2025-63649: https://nvd.nist.gov/vuln/detail/CVE-2025-63649
 - monkey: CVE-2025-63650: https://nvd.nist.gov/vuln/detail/CVE-2025-63650
 - monkey: CVE-2025-63651: https://nvd.nist.gov/vuln/detail/CVE-2025-63651
 - monkey: CVE-2025-63652: https://nvd.nist.gov/vuln/detail/CVE-2025-63652
 - monkey: CVE-2025-63653: https://nvd.nist.gov/vuln/detail/CVE-2025-63653
 - monkey: CVE-2025-63655: https://nvd.nist.gov/vuln/detail/CVE-2025-63655
 - monkey: CVE-2025-63656: https://nvd.nist.gov/vuln/detail/CVE-2025-63656
 - monkey: CVE-2025-63657: https://nvd.nist.gov/vuln/detail/CVE-2025-63657
 - monkey: CVE-2025-63658: https://nvd.nist.gov/vuln/detail/CVE-2025-63658
 - [NEW] nodejs: CVE-2026-21712: https://nvd.nist.gov/vuln/detail/CVE-2026-21712
 - [NEW] nodejs: CVE-2026-21713: https://nvd.nist.gov/vuln/detail/CVE-2026-21713
 - [NEW] nodejs: CVE-2026-21714: https://nvd.nist.gov/vuln/detail/CVE-2026-21714
 - [NEW] nodejs: CVE-2026-21715: https://nvd.nist.gov/vuln/detail/CVE-2026-21715
 - [NEW] nodejs: CVE-2026-21716: https://nvd.nist.gov/vuln/detail/CVE-2026-21716
 - [NEW] nodejs: CVE-2026-21717: https://nvd.nist.gov/vuln/detail/CVE-2026-21717
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - [NEW] opensc: CVE-2025-49010: https://nvd.nist.gov/vuln/detail/CVE-2025-49010
 - [NEW] opensc: CVE-2025-66037: https://nvd.nist.gov/vuln/detail/CVE-2025-66037
 - [NEW] opensc: CVE-2025-66038: https://nvd.nist.gov/vuln/detail/CVE-2025-66038
 - [NEW] opensc: CVE-2025-66215: https://nvd.nist.gov/vuln/detail/CVE-2025-66215
 - polkit: CVE-2016-2568: https://nvd.nist.gov/vuln/detail/CVE-2016-2568
 - [NEW] python3-aiohttp: CVE-2026-22815: https://nvd.nist.gov/vuln/detail/CVE-2026-22815
 - [NEW] python3-aiohttp: CVE-2026-34513: https://nvd.nist.gov/vuln/detail/CVE-2026-34513
 - [NEW] python3-aiohttp: CVE-2026-34514: https://nvd.nist.gov/vuln/detail/CVE-2026-34514
 - [NEW] python3-aiohttp: CVE-2026-34515: https://nvd.nist.gov/vuln/detail/CVE-2026-34515
 - [NEW] python3-aiohttp: CVE-2026-34516: https://nvd.nist.gov/vuln/detail/CVE-2026-34516
 - [NEW] python3-aiohttp: CVE-2026-34517: https://nvd.nist.gov/vuln/detail/CVE-2026-34517
 - [NEW] python3-aiohttp: CVE-2026-34518: https://nvd.nist.gov/vuln/detail/CVE-2026-34518
 - [NEW] python3-aiohttp: CVE-2026-34519: https://nvd.nist.gov/vuln/detail/CVE-2026-34519
 - [NEW] python3-aiohttp: CVE-2026-34520: https://nvd.nist.gov/vuln/detail/CVE-2026-34520
 - [NEW] python3-aiohttp: CVE-2026-34525: https://nvd.nist.gov/vuln/detail/CVE-2026-34525
 - python3-flask-user: CVE-2021-23401: https://nvd.nist.gov/vuln/detail/CVE-2021-23401
 - python3-m2crypto: CVE-2023-50781: https://nvd.nist.gov/vuln/detail/CVE-2023-50781
 - samba: CVE-2025-10230: https://nvd.nist.gov/vuln/detail/CVE-2025-10230
 - samba: CVE-2025-9640: https://nvd.nist.gov/vuln/detail/CVE-2025-9640
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - strongswan: CVE-2026-25075: https://nvd.nist.gov/vuln/detail/CVE-2026-25075
 - [NEW] tinyproxy: CVE-2026-3945: https://nvd.nist.gov/vuln/detail/CVE-2026-3945
 - wolfssl: CVE-2026-0819: https://nvd.nist.gov/vuln/detail/CVE-2026-0819
 - wolfssl: CVE-2026-2646: https://nvd.nist.gov/vuln/detail/CVE-2026-2646
 - wolfssl: CVE-2026-3503: https://nvd.nist.gov/vuln/detail/CVE-2026-3503
 - wolfssl: CVE-2026-3548: https://nvd.nist.gov/vuln/detail/CVE-2026-3548
 - xerces-c: CVE-2012-0880: https://nvd.nist.gov/vuln/detail/CVE-2012-0880

====================

Removed this week (16): 

 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - giflib: CVE-2026-26740: https://nvd.nist.gov/vuln/detail/CVE-2026-26740
 - nginx: CVE-2026-27651: https://nvd.nist.gov/vuln/detail/CVE-2026-27651
 - nginx: CVE-2026-27654: https://nvd.nist.gov/vuln/detail/CVE-2026-27654
 - nginx: CVE-2026-27784: https://nvd.nist.gov/vuln/detail/CVE-2026-27784
 - nginx: CVE-2026-28753: https://nvd.nist.gov/vuln/detail/CVE-2026-28753
 - nginx: CVE-2026-28755: https://nvd.nist.gov/vuln/detail/CVE-2026-28755
 - nginx: CVE-2026-32647: https://nvd.nist.gov/vuln/detail/CVE-2026-32647
 - python3-nltk: CVE-2026-33230: https://nvd.nist.gov/vuln/detail/CVE-2026-33230
 - python3-nltk: CVE-2026-33231: https://nvd.nist.gov/vuln/detail/CVE-2026-33231
 - python3-nltk: CVE-2026-33236: https://nvd.nist.gov/vuln/detail/CVE-2026-33236
 - tigervnc: CVE-2026-34352: https://nvd.nist.gov/vuln/detail/CVE-2026-34352
 - zabbix: CVE-2026-23919: https://nvd.nist.gov/vuln/detail/CVE-2026-23919
 - zabbix: CVE-2026-23920: https://nvd.nist.gov/vuln/detail/CVE-2026-23920
 - zabbix: CVE-2026-23921: https://nvd.nist.gov/vuln/detail/CVE-2026-23921
 - zabbix: CVE-2026-23923: https://nvd.nist.gov/vuln/detail/CVE-2026-23923

