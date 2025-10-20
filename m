Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0DDCCCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 12:22:36 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.16875.1760962951659035733
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 05:22:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IcFEQqtI;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4539dddd99so764726466b.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760962950; x=1761567750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8fDhRN7r/1EZZAMhPaY4+h6DlNCXhnPtQaxAYmsxKw=;
        b=IcFEQqtIV7y57oOtnLpHCk707PAbpnVGChMLzS6hRcEUBGj/Tm5QK6TEeOm+2wn31d
         VKrn6W+VlUsbGcaT2VETxC7j/WrSahTyY7EpYjP3LsQtaZD9Vh2Sh3fUtwOuSHbZNcyV
         6gKn2+oiXhapd7/d+Eg46INesldICPvDA4VmsfY32LbgmWP7lPliQNDbPLaOc8XCYqv7
         uSxolSZZ8QEw3piqwtfFT7C4uSWFQKuqbL3fj7sSGd4WbbkoDDiApHRsya77wAN1VG6r
         dp4jM0gynazmDkTFPWQTPBJqyacrCqH8zdLdxr3lSvZfZG9wlp2X2Z1vmIaawBqovSJc
         Pe9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962950; x=1761567750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8fDhRN7r/1EZZAMhPaY4+h6DlNCXhnPtQaxAYmsxKw=;
        b=VzD1opNG4/um2/Dm1fk4ncthqRW9FePMNntMHxfzCuYgi8XnX5XpIQ0VIXLpvKD9oZ
         mDuweFPvI1NchT62T/9sbr3DW2Z7YeWRSs3OuEdFK6XdkL2COBRv4jl63f/tu+3tY1h/
         rofo9elFG8Kt+jbDHXWXC30K2qzLcuSDLTX3JTddDyxjAY2+jVpdxYkAQxePzEKY0u61
         lGiFGRu7GZ5pqsRFr3kcQh8L+UicGUoOpkxURc+cVHULeUq+3A7i8v53NIXDuNJ1+iCY
         zaBc1MO2NmLt1h1b3DWapPCqzyb0uMvTM45sKUxocv/n7T1ByoOHwPD974zm+ZiY7XIP
         qUhg==
X-Gm-Message-State: AOJu0Yw20/bIBN4VaJhP8p3Ol4Yqt5crHKBAzEt99gaotRPuPURG/XeL
	nmbeGf9+hkZDhRSSkvFqsWOEIcz9MRRO1sqaCn5n+YyadpCv+qKwvoJiZ9bRVg==
X-Gm-Gg: ASbGncsXf4ZyYEtGnNgdfRZHZeosL5miTWYUMJXspphgqsxGhoSQwviKRD1jjb9JGii
	PbvuiQ/T28sm3g623VN5B3iIwWPb1PHaE8bTdIz6Kyu+SCBi2qwOl3EnfssaBX/TXYgQyFhNaCw
	LC56ooLBq8mDIw2FSDtG8oXr6IdOG+i751xtYrXuSO8K+ta4WU6oVFxWoYYR6TgrfZOfP741Qhb
	OEh1t7Pdu2VCNkI7hgHQhcIX93rI8sWyTsuCzAI1AkmI7sq1ZMJda+/+AOgMdrlFMNTNSKYPxY4
	oWQ9pfpi3OpSnbaFHfwasytJUccTnpETxAY8eM3z3B3AZ4389TI6sznR96jYIB5+oAmNd4f0eFM
	W+hX1nAiDksGZgxnEmMHFe1YFx/kkxEPnf7Qkp6XWDhds3QBFDPo5n+J3XW4l9M7i82Mfw3ssvn
	bNv7pW2pSR
X-Google-Smtp-Source: AGHT+IFDFW2cHWtreBaM47+HWRxCrP9kFL044UZkPyRBNNfwJWgFj0MgbHA9/PomJbitpqq+75ZeTw==
X-Received: by 2002:a17:906:f594:b0:b04:7232:3e97 with SMTP id a640c23a62f3a-b647304ae4amr1506654766b.21.1760962949852;
        Mon, 20 Oct 2025 05:22:29 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da25d4sm772142866b.9.2025.10.20.05.22.29
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:22:29 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-10-20
Date: Mon, 20 Oct 2025 14:22:28 +0200
Message-ID: <20251020122228.1467610-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 12:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120816

List of all open CVEs (66, out of which new this week: 1):

audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
[NEW] freerdp: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
hdf5: CVE-2025-2308: https://nvd.nist.gov/vuln/detail/CVE-2025-2308
hdf5: CVE-2025-2309: https://nvd.nist.gov/vuln/detail/CVE-2025-2309
hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
hdf5: CVE-2025-44904: https://nvd.nist.gov/vuln/detail/CVE-2025-44904
hdf5: CVE-2025-44905: https://nvd.nist.gov/vuln/detail/CVE-2025-44905
hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
hdf5: CVE-2025-6816: https://nvd.nist.gov/vuln/detail/CVE-2025-6816
hdf5: CVE-2025-6817: https://nvd.nist.gov/vuln/detail/CVE-2025-6817
hdf5: CVE-2025-6818: https://nvd.nist.gov/vuln/detail/CVE-2025-6818
hdf5: CVE-2025-6856: https://nvd.nist.gov/vuln/detail/CVE-2025-6856
hdf5: CVE-2025-6857: https://nvd.nist.gov/vuln/detail/CVE-2025-6857
hdf5: CVE-2025-6858: https://nvd.nist.gov/vuln/detail/CVE-2025-6858
hdf5: CVE-2025-7067: https://nvd.nist.gov/vuln/detail/CVE-2025-7067
hdf5: CVE-2025-7068: https://nvd.nist.gov/vuln/detail/CVE-2025-7068
hdf5: CVE-2025-7069: https://nvd.nist.gov/vuln/detail/CVE-2025-7069
libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
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

====================

Removed this week (15): 

dovecot: CVE-2016-4983: https://nvd.nist.gov/vuln/detail/CVE-2016-4983
gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
hdf5: CVE-2025-2153: https://nvd.nist.gov/vuln/detail/CVE-2025-2153
hdf5: CVE-2025-2310: https://nvd.nist.gov/vuln/detail/CVE-2025-2310
hdf5: CVE-2025-2914: https://nvd.nist.gov/vuln/detail/CVE-2025-2914
hdf5: CVE-2025-2924: https://nvd.nist.gov/vuln/detail/CVE-2025-2924
hdf5: CVE-2025-2925: https://nvd.nist.gov/vuln/detail/CVE-2025-2925
hdf5: CVE-2025-6750: https://nvd.nist.gov/vuln/detail/CVE-2025-6750
python3-django: CVE-2025-59681: https://nvd.nist.gov/vuln/detail/CVE-2025-59681
squid: CVE-2025-59362: https://nvd.nist.gov/vuln/detail/CVE-2025-59362
zabbix: CVE-2024-45700: https://nvd.nist.gov/vuln/detail/CVE-2024-45700
zabbix: CVE-2025-27231: https://nvd.nist.gov/vuln/detail/CVE-2025-27231
zabbix: CVE-2025-27236: https://nvd.nist.gov/vuln/detail/CVE-2025-27236
zabbix: CVE-2025-27238: https://nvd.nist.gov/vuln/detail/CVE-2025-27238
zabbix: CVE-2025-49641: https://nvd.nist.gov/vuln/detail/CVE-2025-49641

