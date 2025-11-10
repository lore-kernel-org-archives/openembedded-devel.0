Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F241CCFA13
	for <webhook@archiver.kernel.org>; Mon, 10 Nov 2025 12:06:13 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46586.1762776364500915208
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 04:06:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PavFdJe3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477770019e4so18876115e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 04:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762776363; x=1763381163; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gAOhh6mpqZfVFsBZMmgh2Y5sPlSuKEGfZEA7Anzauco=;
        b=PavFdJe37a02/gOmMsWdbqZmiVODT6XspNZUOn+6BsToMmO5nv61QNcgjROHIyj8ZI
         FG+McWc2+Rel/SqVvllqT9AxGiUiNKHVAvtpzjXGTXxXzVkXeVNktpQBK4h2D6zoB/I2
         drI6mJj3Ny6P8o2aS9eas1AXVEURHz18iPgDWoeS8B+tr2uPVVlWtfleQx4ca7/9SrPe
         VSqJE3V4qaa4yIHtpPbiAazV+a+3aDo5LUOTEG30DS/SBnnksg4Um4tu6OxjFplSe/QP
         fHwma0nn6Xe4Ha7/GNvxu+HZaZiC3SRtypagKUmf+cX4sVuzSdCmGlkSkGKfbdEzhrYf
         UZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762776363; x=1763381163;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAOhh6mpqZfVFsBZMmgh2Y5sPlSuKEGfZEA7Anzauco=;
        b=EGx0xSc0UIJ68EM572aWNhLM4NlmdiT5Wn/COQ5nAVaP2jRi2Ti/E4O5uswSj1hD+m
         ESB6qD2wDCtq0Mc5xmX3TN9b+at25Cdh6HPlzVF8QMuOpIS3DldltqVklzjP2TwAmIdr
         1Ow7QKmwzhxF8ySJ7+YcCl1RMDTma43ke5IPWmzl5X0zpqTQPl/aAQEUX1/CKDH+YWM/
         E9We8ZS/B0h1EANXsw8l5PEJnm/862r3m4j9O2wNjza8YNTrxHOyuSgr0/biMEInov4s
         fwiESz4HjIKyrKjrTAwnMi0UBh7gjoWacRjYAuTZu4Zb8tBmvdd5QNUd4Lkqi2L6yLAq
         lrlA==
X-Gm-Message-State: AOJu0YxdlWMhOlDff3R/RclMHk8jwAC0MjK0q0N2ywBL3e1k5NuT0fkK
	nW3jjzyOfpxt+QoXCEJZAUzNMw2gFTBJ2YDh2GcQwM19ciWjmETGmr2EeSgkoK0K
X-Gm-Gg: ASbGncv/pW1mIf9gsM3oEYnpkCKu7osv4FCpLvCI7gFbI6fPZsqmoB8zq+n/HW3zfvS
	q+nnSCmAXCBtCLHwXhljeMN4Q3vPa0iS07eFcACLjZ1rnJb9efcFw8FKC+zwzOIZVzERbCKVLZR
	a9PJF/tJ3XQl3wmlNQv58uepO1ujK3roGvvNusm37qDd7GDum9edH+kYztNoj0HVr6HPlTKaYf5
	1O62FlDA/t/RfnTW1cxQI314jQRy7Enxl2xmGGQJlVbn38se/FszAs3wbm33uw6gOXLIjsqvxiH
	xPwfvfB3VGACnWFohmTVQrdRpPa1Q9JKJrLjqfRo6FPC/C1HQPSq62bsMg+a1ZD16WWUxuSiJtn
	fonPT3fOv5tQ3k2L2Iywrya3dnsKknBtKIsrbwjxNDr99fR2AR6NwhKjwtPqfAynyJiTGpU0Scw
	==
X-Google-Smtp-Source: AGHT+IGfj4+l5OH72a1uPr5sslGThWaC5Zg8kEm+U7gv7m1d/cHaocAeVa+fWQcdQbF+2juIb7r3Gg==
X-Received: by 2002:a05:600c:1c06:b0:477:7f4a:44b0 with SMTP id 5b1f17b1804b1-4777f4a48bfmr15442295e9.33.1762776362704;
        Mon, 10 Nov 2025 04:06:02 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcdd91esm207979335e9.8.2025.11.10.04.06.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 04:06:02 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-11-10
Date: Mon, 10 Nov 2025 13:06:01 +0100
Message-ID: <20251110120601.2269026-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 12:06:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121461

List of all open CVEs (81, out of which new this week: 12):

 - audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
 - audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
 - audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
 - audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - [NEW] frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - [NEW] frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - [NEW] frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - [NEW] frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - [NEW] frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - [NEW] gimp: CVE-2025-10920: https://nvd.nist.gov/vuln/detail/CVE-2025-10920
 - [NEW] gimp: CVE-2025-10921: https://nvd.nist.gov/vuln/detail/CVE-2025-10921
 - [NEW] gimp: CVE-2025-10922: https://nvd.nist.gov/vuln/detail/CVE-2025-10922
 - [NEW] gimp: CVE-2025-10923: https://nvd.nist.gov/vuln/detail/CVE-2025-10923
 - [NEW] gimp: CVE-2025-10924: https://nvd.nist.gov/vuln/detail/CVE-2025-10924
 - [NEW] gimp: CVE-2025-10925: https://nvd.nist.gov/vuln/detail/CVE-2025-10925
 - [NEW] gimp: CVE-2025-10934: https://nvd.nist.gov/vuln/detail/CVE-2025-10934
 - hdf5: CVE-2025-2308: https://nvd.nist.gov/vuln/detail/CVE-2025-2308
 - hdf5: CVE-2025-2309: https://nvd.nist.gov/vuln/detail/CVE-2025-2309
 - hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
 - hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
 - hdf5: CVE-2025-44904: https://nvd.nist.gov/vuln/detail/CVE-2025-44904
 - hdf5: CVE-2025-44905: https://nvd.nist.gov/vuln/detail/CVE-2025-44905
 - hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
 - hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
 - hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
 - hdf5: CVE-2025-6816: https://nvd.nist.gov/vuln/detail/CVE-2025-6816
 - hdf5: CVE-2025-6817: https://nvd.nist.gov/vuln/detail/CVE-2025-6817
 - hdf5: CVE-2025-6818: https://nvd.nist.gov/vuln/detail/CVE-2025-6818
 - hdf5: CVE-2025-6856: https://nvd.nist.gov/vuln/detail/CVE-2025-6856
 - hdf5: CVE-2025-6857: https://nvd.nist.gov/vuln/detail/CVE-2025-6857
 - hdf5: CVE-2025-6858: https://nvd.nist.gov/vuln/detail/CVE-2025-6858
 - hdf5: CVE-2025-7067: https://nvd.nist.gov/vuln/detail/CVE-2025-7067
 - hdf5: CVE-2025-7068: https://nvd.nist.gov/vuln/detail/CVE-2025-7068
 - hdf5: CVE-2025-7069: https://nvd.nist.gov/vuln/detail/CVE-2025-7069
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - minio: CVE-2018-1000538: https://nvd.nist.gov/vuln/detail/CVE-2018-1000538
 - minio: CVE-2020-11012: https://nvd.nist.gov/vuln/detail/CVE-2020-11012
 - minio: CVE-2021-21287: https://nvd.nist.gov/vuln/detail/CVE-2021-21287
 - minio: CVE-2021-21362: https://nvd.nist.gov/vuln/detail/CVE-2021-21362
 - minio: CVE-2021-21390: https://nvd.nist.gov/vuln/detail/CVE-2021-21390
 - minio: CVE-2021-43858: https://nvd.nist.gov/vuln/detail/CVE-2021-43858
 - minio: CVE-2022-35919: https://nvd.nist.gov/vuln/detail/CVE-2022-35919
 - minio: CVE-2023-28433: https://nvd.nist.gov/vuln/detail/CVE-2023-28433
 - minio: CVE-2023-28434: https://nvd.nist.gov/vuln/detail/CVE-2023-28434
 - ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
 - openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
 - openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
 - openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
 - openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
 - redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
 - redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
 - redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
 - rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
 - yasm: CVE-2021-33455: https://nvd.nist.gov/vuln/detail/CVE-2021-33455
 - yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
 - yasm: CVE-2021-33457: https://nvd.nist.gov/vuln/detail/CVE-2021-33457
 - yasm: CVE-2021-33458: https://nvd.nist.gov/vuln/detail/CVE-2021-33458
 - yasm: CVE-2021-33459: https://nvd.nist.gov/vuln/detail/CVE-2021-33459
 - yasm: CVE-2021-33460: https://nvd.nist.gov/vuln/detail/CVE-2021-33460
 - yasm: CVE-2021-33461: https://nvd.nist.gov/vuln/detail/CVE-2021-33461
 - yasm: CVE-2021-33462: https://nvd.nist.gov/vuln/detail/CVE-2021-33462
 - yasm: CVE-2021-33463: https://nvd.nist.gov/vuln/detail/CVE-2021-33463
 - yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464
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

Removed this week (3): 

 - imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
 - mbedtls: CVE-2025-54764: https://nvd.nist.gov/vuln/detail/CVE-2025-54764
 - mbedtls: CVE-2025-59438: https://nvd.nist.gov/vuln/detail/CVE-2025-59438

