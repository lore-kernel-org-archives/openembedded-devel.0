Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA12CCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 11:18:13 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.29445.1761563884886684300
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 04:18:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=daNfHvUI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-475dc6029b6so18270015e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 04:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761563883; x=1762168683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7SrHchrzlRb9hxbTrnDNvaDZLq0OJtwkwLmfuuH/hA=;
        b=daNfHvUIAsjlXTD6Am98DQFScBoirRpwuDDiUy74V0IIKYssEyYNh4mh7vFBVOaMFK
         HR4DHpWnfuexVRSfF2wU+defSaVQhXRNND+HcNlGrqp1ciAixqQXu5FeW3QXNfjKtVR8
         iblGcNLPKlvS+mi3zs/ptrc2O4op5Q3Jg5FjsBYp9aAVgWfsNW53PuzBOYWa+p+pZRVF
         bqlUeETCdYXH5YPB3VQjhJNrcbmnKTXGdrEUi61TJcTceZ4yuZtm+aWSn+khIt0t/A8R
         HG+BZ0szn1G1Nxe/t6UB5grp1fbrVgN5JiQsr5EeyV9oLxV375eTHohgUxrZE+OEgydd
         niHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563883; x=1762168683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7SrHchrzlRb9hxbTrnDNvaDZLq0OJtwkwLmfuuH/hA=;
        b=JRklIVBtv694je8M6VnhKZU0by5iGjzAbx/ssnUsK+YLwR7JyjbG9vPp8YFy2rHgrs
         Lnfgdb+JVBDZD5/sqQ1G4xGS2kWAUta83ZoXfbq1xmnzmEyzmThdLDYe4bG+pHQny+nS
         Dkkj4BB5lD22il7P59zyHVazdSilj/As8yFmf8BY5dDW6/Ew97XxBbky5cgao2y7bzpl
         bnMGy+o7PBhf0mV2826IbBfP0BuAD+lthSvIYJHd7pvbroLE4oiYIWH+EunDneeUve6u
         chjo9if3VQFp69ifwlY6ScG1SOLTef+N+tBVGnICJlgdSimm6WTZitv281/C5cI5jHkm
         UDpA==
X-Gm-Message-State: AOJu0Yz0M7c/YAU8sj3VjfW1sODoW8/j0RI2DiBlxU1YASSQsoaP2Ibn
	m5gwYQFIVuwFu3l0G7IM1Lw3fylCrQtJWOnfU0hMVZAsbErIbSz3qB/MpANwig==
X-Gm-Gg: ASbGnctGvk67LjOfiUw55yn0DPxJhggU0DZ5TgX7TSEJrSHoGyL2HQI7IPhnBDxprvP
	OD+kV7MbpLBLsU+8bu5zbWlK2H+bTtv5OjvPciKYp4s0XPd3JBjlXTyeXTQegYXjPIOTBHvZSgV
	isUQu6k4QZsoKrwrGQG9dV0FokzGywuZxy65qnf9i3ehhTAt57UOA5tpvkcoN1XIba38KUA3Si9
	adFkASPDSrVf32U0b0F0aFTsq4fA3k4a8/P69yit9vDJHbegOx0CUQXnJaxrJsrU+KHiB16f4BJ
	sbYB0SLJv8OK9oeMl0/iw5ZEIWE70RCRQijNMljgT1W4dXVflBc2e2eeCIXMnFfcHk+kfhqvVFS
	d/1rluubd1rWyAck34g7REMvMU6Du7pzzx9OKv41x0ZboDZbrhPfZbHfCWWF/NW9En8T8eZHGWm
	YPZKjiTTuo
X-Google-Smtp-Source: AGHT+IEdLNG7chEAhzC4IEPDBEW3eqkdX9y4Jpls3BLgXKWymvIgwx/CqOEPCdpFfC+BtXfXhXhYGg==
X-Received: by 2002:a05:600d:8310:b0:471:7a:7922 with SMTP id 5b1f17b1804b1-475d2e72e26mr62057115e9.6.1761563883156;
        Mon, 27 Oct 2025 04:18:03 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952db99asm13794191f8f.32.2025.10.27.04.18.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:18:02 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-10-27
Date: Mon, 27 Oct 2025 12:18:01 +0100
Message-ID: <20251027111801.332169-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:18:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121037

List of all open CVEs (69, out of which new this week: 3):

audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
freerdp: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
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
[NEW] hostapd: CVE-2025-24912: https://nvd.nist.gov/vuln/detail/CVE-2025-24912
[NEW] imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
[NEW] mbedtls: CVE-2025-59438: https://nvd.nist.gov/vuln/detail/CVE-2025-59438
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

Removed this week (0): 


