Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE10ACCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 12:22:26 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.16652.1760962945139027125
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 05:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JpRqnGPd;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61feb87fe26so7071022a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 05:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760962943; x=1761567743; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=x7MEh4CShZPKm0c4Lpc1bgTNxxtiwosUU1uRQPpra0M=;
        b=JpRqnGPdU6fBQLhCJP7jaKszV/1DiQys8gKkYBD5jeFgcbEJDjQWohV3c4kP3/62N1
         b/smzRrZwEbYUDOLJtG69wabnWOueFsEoKwRos4RLcgCZ7d+CJqBRiVIZm6F++vJdVrM
         i5zTaiVzjpEnZ/rG+LrliroWDX2dCmjVVi1BFBcRObHmEqhdor5YPjDbp7bz8JFeWNH2
         7mBsmR0wD3CqLN+ndATbr7NRWRGe1U3wxAsWGeB6llfUlGhtuQX3AJLCkZ4af5cGfvhF
         8DD6rgBEpiLu6Oiq573e90N/t9tUfF88jYaHQm6aYY/ppKR+h7G70ZW+DegUsmp/5L2d
         iOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962943; x=1761567743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x7MEh4CShZPKm0c4Lpc1bgTNxxtiwosUU1uRQPpra0M=;
        b=lDfQUS+V6FIrvSs4uZgBTo8vUl624xE4wioj11m1THRJLb9wmd/WN2gHYE2iUHTHlt
         gyWw+uiqJqJIYz22HJybeSXcGlvdHebXTbV9uityTZwfzARyRRNwsL0IrAGC0jJY9svw
         FlZ1rHMqke2sGJuxfWKdBNn9Ce4cekR00St5iyfZRQQ9+JUZ/Vqd49sWkzDuGqQf+qap
         Ap56dZiCSrP5H3Urhm0dV+xG5bJfge5Ry1oaCUiTRi/azKOu1SCfUPxuPpl534hD6H5M
         WV3ToyF+qbK7FIpQtqwnhWPLLhTBAInVMt42YyvoiixN8tv+waPIHECEKladbQTSIsna
         Uqsg==
X-Gm-Message-State: AOJu0YyquKWvaVcez/0q0QeXCu9a+8zxKRMEHaeGX6LNRW/DG7WTGXwq
	ezuhOmlbXtkvf/4cSmj708XRku5F4VrL57Ygj/2ne7vOrg+1LcSG7KL7edtLqg==
X-Gm-Gg: ASbGncshiFYF6Kc0YYoN0c2XcOul9Or0x5k0f/6XZiG2aYAfuCGQ7FJ+UjSsGo/Iv60
	czJiEVi8TvNhjJRuIDiLCQCBftfKOVfW6CfR58uiGXCqtQ9FfVgJCPLd8cVVDnF4HzcwW5NB42T
	NNPnNgwDx+Lruji44IrmXdd7IxIZZ+9NjvNGbdR2W3LM3+I0q8vU1EgtEEb5RdzYUKoHGmiJyaG
	6Mw7E3IaY4cmQ6+APCIt6rRTJ/JJp/Kjpa+1VXmJwMi95MuHu7de3p/z5ptc7NqzWTZtQRfd2Rz
	U4bo7qWkhxW7XANkuNvZS4uWtdqMGQnGfujPNhwvvamUlZuoY353ys8gy9pY0/TxDxPc0cLS/Dl
	I7/oSD9xXf3UnlzjJ94xyIC7e9O6Aty1qBdLlp3lzGyRkpBiP1wAOOIpFFMNNJ25jX2Saqk2yM7
	G1Uv89KCu+
X-Google-Smtp-Source: AGHT+IFo+KkAK5lSloFvtsaVrc4DHzPRBmm3MxT6NLc5smJUPo/H4eQ0jIJBeuEBug/eclwNVAwZuA==
X-Received: by 2002:a05:6402:1ecb:b0:63b:f67b:3781 with SMTP id 4fb4d7f45d1cf-63c1f6da9bemr11624647a12.18.1760962943338;
        Mon, 20 Oct 2025 05:22:23 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab45b8sm6600702a12.9.2025.10.20.05.22.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:22:22 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - walnascar - 2025-10-20
Date: Mon, 20 Oct 2025 14:22:22 +0200
Message-ID: <20251020122222.1459267-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 12:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120815

List of all open CVEs (91, out of which new this week: 1):

7zip: CVE-2025-53816: https://nvd.nist.gov/vuln/detail/CVE-2025-53816
7zip: CVE-2025-53817: https://nvd.nist.gov/vuln/detail/CVE-2025-53817
7zip: CVE-2025-55188: https://nvd.nist.gov/vuln/detail/CVE-2025-55188
apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
emacs-native: CVE-2024-30202: https://nvd.nist.gov/vuln/detail/CVE-2024-30202
emacs-native: CVE-2024-30203: https://nvd.nist.gov/vuln/detail/CVE-2024-30203
emacs-native: CVE-2024-30204: https://nvd.nist.gov/vuln/detail/CVE-2024-30204
emacs-native: CVE-2024-30205: https://nvd.nist.gov/vuln/detail/CVE-2024-30205
emacs-native: CVE-2024-39331: https://nvd.nist.gov/vuln/detail/CVE-2024-39331
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
[NEW] freerdp: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
gnuplot: CVE-2025-31176: https://nvd.nist.gov/vuln/detail/CVE-2025-31176
gnuplot: CVE-2025-31178: https://nvd.nist.gov/vuln/detail/CVE-2025-31178
gnuplot: CVE-2025-31179: https://nvd.nist.gov/vuln/detail/CVE-2025-31179
gnuplot: CVE-2025-31180: https://nvd.nist.gov/vuln/detail/CVE-2025-31180
gnuplot: CVE-2025-31181: https://nvd.nist.gov/vuln/detail/CVE-2025-31181
hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
hdf5: CVE-2025-2913: https://nvd.nist.gov/vuln/detail/CVE-2025-2913
hdf5: CVE-2025-2914: https://nvd.nist.gov/vuln/detail/CVE-2025-2914
hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
libavif: CVE-2025-48175: https://nvd.nist.gov/vuln/detail/CVE-2025-48175
libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
libheif: CVE-2025-43966: https://nvd.nist.gov/vuln/detail/CVE-2025-43966
libheif: CVE-2025-43967: https://nvd.nist.gov/vuln/detail/CVE-2025-43967
libssh: CVE-2025-5318: https://nvd.nist.gov/vuln/detail/CVE-2025-5318
libssh: CVE-2025-5987: https://nvd.nist.gov/vuln/detail/CVE-2025-5987
luajit: CVE-2024-25176: https://nvd.nist.gov/vuln/detail/CVE-2024-25176
luajit: CVE-2024-25177: https://nvd.nist.gov/vuln/detail/CVE-2024-25177
luajit: CVE-2024-25178: https://nvd.nist.gov/vuln/detail/CVE-2024-25178
minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
nbdkit: CVE-2025-47711: https://nvd.nist.gov/vuln/detail/CVE-2025-47711
nbdkit: CVE-2025-47712: https://nvd.nist.gov/vuln/detail/CVE-2025-47712
ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
redis: CVE-2025-49844: https://nvd.nist.gov/vuln/detail/CVE-2025-49844
rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
squid: CVE-2025-59362: https://nvd.nist.gov/vuln/detail/CVE-2025-59362
sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464
yasm: CVE-2021-33465: https://nvd.nist.gov/vuln/detail/CVE-2021-33465
yasm: CVE-2021-33466: https://nvd.nist.gov/vuln/detail/CVE-2021-33466
yasm: CVE-2021-33467: https://nvd.nist.gov/vuln/detail/CVE-2021-33467
yasm: CVE-2021-33468: https://nvd.nist.gov/vuln/detail/CVE-2021-33468
yasm: CVE-2023-30402: https://nvd.nist.gov/vuln/detail/CVE-2023-30402
yasm: CVE-2023-31972: https://nvd.nist.gov/vuln/detail/CVE-2023-31972
yasm: CVE-2023-31973: https://nvd.nist.gov/vuln/detail/CVE-2023-31973
yasm: CVE-2023-31974: https://nvd.nist.gov/vuln/detail/CVE-2023-31974
yasm: CVE-2023-51258: https://nvd.nist.gov/vuln/detail/CVE-2023-51258
zabbix: CVE-2024-45700: https://nvd.nist.gov/vuln/detail/CVE-2024-45700
zabbix: CVE-2025-27231: https://nvd.nist.gov/vuln/detail/CVE-2025-27231
zabbix: CVE-2025-27236: https://nvd.nist.gov/vuln/detail/CVE-2025-27236
zabbix: CVE-2025-27238: https://nvd.nist.gov/vuln/detail/CVE-2025-27238
zabbix: CVE-2025-49641: https://nvd.nist.gov/vuln/detail/CVE-2025-49641

====================

Removed this week (0): 


