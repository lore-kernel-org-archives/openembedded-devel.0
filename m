Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06678CEACEF
	for <webhook@archiver.kernel.org>; Mon, 17 Nov 2025 09:39:02 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5886.1763372336950480642
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Nov 2025 01:38:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BXRVfZYu;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso3303165f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 01:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763372335; x=1763977135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=gxFh0bKC36bS1df0gebxai4KEU/o8H2FswABi+i+9mE=;
        b=BXRVfZYuvnUC+1i/oCt3ulc7SxqbYOkKqO8Jlh3yQ7tLaF72imBf34sm7T6cBD57BU
         qASJueuaLP42rBwdYi7TFGVvMmIbi0nHgrysOEe9Sz4e0J5HZ4c1yIgUzV6ONBp4tmK0
         pYkw75U9X4iIm7pJ8Fu5ukGMJE9mEJ65vp7ZorWj0fxMhXFiEfVaKZkqj3S5WNVdkgsc
         Q+/dbAE9AW4iqMnFlOBYJPhW3W3fSubdAFgh9HNCK4vYEmwnCx9Cack/uYmoQATmJgWq
         hZytb85h55PPBw5OJODSRK1+VEfMdGCo48G7xaEin2JwxYuzjl6zItwb+NZ29o8aIT7o
         Qr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763372335; x=1763977135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gxFh0bKC36bS1df0gebxai4KEU/o8H2FswABi+i+9mE=;
        b=kNN5EfYX9DhOf3FWn5YnEG+1m5nQTcqqqWgFC3sByzVSDZ17iUCFOjEOmp0EdXgHNI
         H/AfU6PGjdTvKUle33g/CDYLeKhjiLJtkjrK43emgnCzri1c7Bkkl/dxZnodNgp6cdpO
         yBnHQsdS2WEA667Exft+1BTTqo0bcQKSMkhZ7znHwp2RK1hcZ9LRwx6z+RwaCFJ7tTZi
         xfp37MX088fx1Iom0+HwZT4BMI7rI45yYsZN6S+D9cJATYf2xdjmYym5bG+7m9tQCCOc
         oud95sVVPjQQ5mmvjSAJ23Vb5mzJFwg62E0xhc2cGCQ4G+GuFyqtTbZNKrS5Wp67zWII
         O+mw==
X-Gm-Message-State: AOJu0YwB5bU5jfSz7m9tsEI5BLCVDanNAp0BBumzgRUpPwOKKfV0d4ro
	uYnjSerCeGRdiq6O5wYNA1PSU+DwVmKSr95Y32DoQuYFhXT22jtcTQyhdZR7VDxD
X-Gm-Gg: ASbGncs6J9qAi/KxI8ARAlapGqBddWsuCKl2pQjhUxHUEj5/b8euPUVvGOR5kyTm8gv
	b2hsLf7soS9JRf4GoZiP+p3ZPQYuPWA4TgqdN+26o5yNzJLfRrr1QJEmAvKJeThH2abspQEMhTu
	206na/n0LP+haY25e+D0H8j7PXsM04nHRyHs3BlYlp8WirOZjzNnYEiEN9zAFiYcEokIH8D03kJ
	s+6KDSsmoWM0m68gIoYOUFKsZfHfo/JkwwJkFNuysNIrZl3PiTFKVNP4zvcQyixazXN/lcAj2U4
	cv93wI2k7Wt7MW0YbxEb20+nPmN8opPS9mZ5ICzrXa48sr13Ej5ajHVVbqqe6+x5/2Y+GZVwRbH
	DD8bsyTFaSvyPiwN8JZmuJKiInIaie9NNQ2NrOdyHXwDC1Qw4xllF9Z8Kwwdk+ETIkmw+quwEGw
	==
X-Google-Smtp-Source: AGHT+IGKiwO+7+s/bOZChVl+8icLUzpirF/YB0Un/GzMkF013s5p6RaVqVz2yaLCT7GeaqBPWzUA2g==
X-Received: by 2002:a05:6000:1863:b0:42b:3746:3b85 with SMTP id ffacd0b85a97d-42b5938efcamr11546425f8f.45.1763372335008;
        Mon, 17 Nov 2025 01:38:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e97a87sm25986127f8f.20.2025.11.17.01.38.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:38:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-11-17
Date: Mon, 17 Nov 2025 10:38:53 +0100
Message-ID: <20251117093853.844143-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Nov 2025 09:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121770

List of all open CVEs (47, out of which new this week: 2):

 - dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
 - ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
 - frr: CVE-2025-61099: https://nvd.nist.gov/vuln/detail/CVE-2025-61099
 - frr: CVE-2025-61100: https://nvd.nist.gov/vuln/detail/CVE-2025-61100
 - frr: CVE-2025-61101: https://nvd.nist.gov/vuln/detail/CVE-2025-61101
 - frr: CVE-2025-61102: https://nvd.nist.gov/vuln/detail/CVE-2025-61102
 - frr: CVE-2025-61103: https://nvd.nist.gov/vuln/detail/CVE-2025-61103
 - frr: CVE-2025-61104: https://nvd.nist.gov/vuln/detail/CVE-2025-61104
 - frr: CVE-2025-61105: https://nvd.nist.gov/vuln/detail/CVE-2025-61105
 - frr: CVE-2025-61106: https://nvd.nist.gov/vuln/detail/CVE-2025-61106
 - frr: CVE-2025-61107: https://nvd.nist.gov/vuln/detail/CVE-2025-61107
 - giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
 - libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
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
 - [NEW] python3-django: CVE-2025-64458: https://nvd.nist.gov/vuln/detail/CVE-2025-64458
 - [NEW] python3-django: CVE-2025-64459: https://nvd.nist.gov/vuln/detail/CVE-2025-64459
 - sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
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

Removed this week (36): 

 - audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
 - audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
 - audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
 - audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
 - gimp: CVE-2025-10920: https://nvd.nist.gov/vuln/detail/CVE-2025-10920
 - gimp: CVE-2025-10921: https://nvd.nist.gov/vuln/detail/CVE-2025-10921
 - gimp: CVE-2025-10922: https://nvd.nist.gov/vuln/detail/CVE-2025-10922
 - gimp: CVE-2025-10923: https://nvd.nist.gov/vuln/detail/CVE-2025-10923
 - gimp: CVE-2025-10924: https://nvd.nist.gov/vuln/detail/CVE-2025-10924
 - gimp: CVE-2025-10925: https://nvd.nist.gov/vuln/detail/CVE-2025-10925
 - gimp: CVE-2025-10934: https://nvd.nist.gov/vuln/detail/CVE-2025-10934
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
 - libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
 - redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
 - redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
 - redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
 - rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
 - yasm: CVE-2021-33456: https://nvd.nist.gov/vuln/detail/CVE-2021-33456
 - yasm: CVE-2021-33464: https://nvd.nist.gov/vuln/detail/CVE-2021-33464

