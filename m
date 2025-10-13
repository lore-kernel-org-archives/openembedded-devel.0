Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C1ECCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:34:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.43601.1760362441458570981
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GutonHoR;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e3cdc1a6aso30938415e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362440; x=1760967240; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uO3TAK0eNwUBHB0CIlPjH0rmG0Ofiye+1VCXoaEwk5Y=;
        b=GutonHoRjgBE9USQ+/FGuYNgAvLm/RXFXF76g6Bk4DlnxkHbNWTAy2VIwN9sKCdSvh
         BXpeNkocOEM3DZBKRxqn2fKs9AxeVh5zfyb2NKh6Tw7mWn/sajkfKzVoYvUpBmi2oEiE
         qobHCtASoF27UIc8yKNkFqCPovS0PME5kZnOo65v76x4mTptuKrFCwnLm8dLb5ttjYQ0
         y0QFZdYvvKF1yq81IlWLWWVgi53njotz4eNZslCMmkN+NczwEum8e0e4aCaTpUV79MVX
         S4NylSisHwhub0i+Lqirb/3pGSO4V8ZHJXTsKFqlwGs7BSv3Hk25CdysFwTK/3S/dbq+
         HXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362440; x=1760967240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uO3TAK0eNwUBHB0CIlPjH0rmG0Ofiye+1VCXoaEwk5Y=;
        b=J1C/76nNa+hxTHSu0+J+zuDwLaGKcGP2zJJ+/MAFCs/UqxqG/nbcJ/HJ9l9i+sO7R3
         b4Yra5aLeF0QF/Towa2eHe/fuVqkcna+4XP3iYrtrM2JHQbwxjncbNfwU+3NS/L9H4ne
         S2sTRxz7paCSpGq8uiZ+7jEVpzORlXDSXURbaWRyQ3JojIiWDIwJKMXI5DBVLilQxgpv
         MeaABwEWCbZiIBjDGRs6j0xLE1we6LJm/r1QI8Sw0ZQeVjuDRS6L1/yqA22yRTy1lpiq
         hyPTt/cF3tpUSBYPd76/zPcfaXd9Fz1c+fHfJ0UNJxX6lM/owSAjkXu5WoQumCIXdIEo
         K8fA==
X-Gm-Message-State: AOJu0YwJAWGCgawe20L8yR/Kh21tZtzfuMTAEUS5vF8pQ1Dk2toejDgW
	0Bbf5nn/sLrgT8iG0hVpvUprY1PERg2Jggl+yaDl7aVWvXzYZB+4t2QvSgkBFg==
X-Gm-Gg: ASbGnctFrotW4QT9PxZS+98+qSwuVdMvDiyY08zczBJ8ntarlIHu9qZpXODfxTPOYw0
	5XzC+5jm7FWtvY405Wm46kAlOK4JmBox29B5VGpz9eZp3C7WlORAvYjYmdQAC2J35AmXOZ5nd25
	m2HLSXq/ja+nt91dmwSLCrDnI52uNi1cknTax/qP1los4wprnvm3Os+Lfo3SvjVBo6R3zhwXn9L
	0dLjDtGPos64H+N7Bxzz0UdfvlCCevlEqz3fSl8mAOkg+T8I0l7CZcszV/nLxdzzW730gPLkGe2
	PbgtHpZhTKIIIs/ckG6rtvYiO4NC9jF7hsJA80wLId6KQpOmyQL9jpuNVkkRrdumcAJbj1wIqcf
	hePTZJZkca/Zje98PvyYoATgZmDCGsqvYAaeO4W0=
X-Google-Smtp-Source: AGHT+IFXEK/J1ZX2Gfacxxl0lB0x50SKPUNZNGUlz0wEiE3EaMVDKD1kb/0FAgVCUXXNBE1mjF1UXQ==
X-Received: by 2002:a05:600c:450e:b0:46e:1a60:c995 with SMTP id 5b1f17b1804b1-46fa9e8dcc7mr166435025e9.2.1760362439614;
        Mon, 13 Oct 2025 06:33:59 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb479c171sm186551475e9.0.2025.10.13.06.33.58
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:33:59 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - master - 2025-10-13
Date: Mon, 13 Oct 2025 15:33:58 +0200
Message-ID: <20251013133358.3988683-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:34:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120535

List of all open CVEs (80, out of which new this week: 28):

audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
[NEW] dovecot: CVE-2016-4983: https://nvd.nist.gov/vuln/detail/CVE-2016-4983
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
[NEW] gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
[NEW] hdf5: CVE-2025-2153: https://nvd.nist.gov/vuln/detail/CVE-2025-2153
[NEW] hdf5: CVE-2025-2308: https://nvd.nist.gov/vuln/detail/CVE-2025-2308
[NEW] hdf5: CVE-2025-2309: https://nvd.nist.gov/vuln/detail/CVE-2025-2309
[NEW] hdf5: CVE-2025-2310: https://nvd.nist.gov/vuln/detail/CVE-2025-2310
hdf5: CVE-2025-2914: https://nvd.nist.gov/vuln/detail/CVE-2025-2914
hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
hdf5: CVE-2025-2924: https://nvd.nist.gov/vuln/detail/CVE-2025-2924
hdf5: CVE-2025-2925: https://nvd.nist.gov/vuln/detail/CVE-2025-2925
hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
[NEW] hdf5: CVE-2025-44904: https://nvd.nist.gov/vuln/detail/CVE-2025-44904
[NEW] hdf5: CVE-2025-44905: https://nvd.nist.gov/vuln/detail/CVE-2025-44905
hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
[NEW] hdf5: CVE-2025-6750: https://nvd.nist.gov/vuln/detail/CVE-2025-6750
[NEW] hdf5: CVE-2025-6816: https://nvd.nist.gov/vuln/detail/CVE-2025-6816
[NEW] hdf5: CVE-2025-6817: https://nvd.nist.gov/vuln/detail/CVE-2025-6817
[NEW] hdf5: CVE-2025-6818: https://nvd.nist.gov/vuln/detail/CVE-2025-6818
[NEW] hdf5: CVE-2025-6856: https://nvd.nist.gov/vuln/detail/CVE-2025-6856
[NEW] hdf5: CVE-2025-6857: https://nvd.nist.gov/vuln/detail/CVE-2025-6857
[NEW] hdf5: CVE-2025-6858: https://nvd.nist.gov/vuln/detail/CVE-2025-6858
[NEW] hdf5: CVE-2025-7067: https://nvd.nist.gov/vuln/detail/CVE-2025-7067
[NEW] hdf5: CVE-2025-7068: https://nvd.nist.gov/vuln/detail/CVE-2025-7068
[NEW] hdf5: CVE-2025-7069: https://nvd.nist.gov/vuln/detail/CVE-2025-7069
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
[NEW] python3-django: CVE-2025-59681: https://nvd.nist.gov/vuln/detail/CVE-2025-59681
[NEW] redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
[NEW] redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
[NEW] redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
[NEW] squid: CVE-2025-59362: https://nvd.nist.gov/vuln/detail/CVE-2025-59362
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
[NEW] zabbix: CVE-2024-45700: https://nvd.nist.gov/vuln/detail/CVE-2024-45700
[NEW] zabbix: CVE-2025-27231: https://nvd.nist.gov/vuln/detail/CVE-2025-27231
[NEW] zabbix: CVE-2025-27236: https://nvd.nist.gov/vuln/detail/CVE-2025-27236
[NEW] zabbix: CVE-2025-27238: https://nvd.nist.gov/vuln/detail/CVE-2025-27238
[NEW] zabbix: CVE-2025-49641: https://nvd.nist.gov/vuln/detail/CVE-2025-49641

====================

Removed this week (61): 

apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
civetweb: CVE-2025-55763: https://nvd.nist.gov/vuln/detail/CVE-2025-55763
dovecot: CVE-2022-30550: https://nvd.nist.gov/vuln/detail/CVE-2022-30550
emacs: CVE-2024-30202: https://nvd.nist.gov/vuln/detail/CVE-2024-30202
emacs: CVE-2024-30203: https://nvd.nist.gov/vuln/detail/CVE-2024-30203
emacs: CVE-2024-30204: https://nvd.nist.gov/vuln/detail/CVE-2024-30204
emacs: CVE-2024-30205: https://nvd.nist.gov/vuln/detail/CVE-2024-30205
emacs: CVE-2024-39331: https://nvd.nist.gov/vuln/detail/CVE-2024-39331
emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
exiv2: CVE-2025-26623: https://nvd.nist.gov/vuln/detail/CVE-2025-26623
exiv2: CVE-2025-54080: https://nvd.nist.gov/vuln/detail/CVE-2025-54080
exiv2: CVE-2025-55304: https://nvd.nist.gov/vuln/detail/CVE-2025-55304
gimp: CVE-2025-8672: https://nvd.nist.gov/vuln/detail/CVE-2025-8672
gnuplot: CVE-2025-31176: https://nvd.nist.gov/vuln/detail/CVE-2025-31176
gnuplot: CVE-2025-31178: https://nvd.nist.gov/vuln/detail/CVE-2025-31178
gnuplot: CVE-2025-31179: https://nvd.nist.gov/vuln/detail/CVE-2025-31179
gnuplot: CVE-2025-31180: https://nvd.nist.gov/vuln/detail/CVE-2025-31180
gnuplot: CVE-2025-31181: https://nvd.nist.gov/vuln/detail/CVE-2025-31181
hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
hdf5: CVE-2025-2913: https://nvd.nist.gov/vuln/detail/CVE-2025-2913
hdf5: CVE-2025-2923: https://nvd.nist.gov/vuln/detail/CVE-2025-2923
imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
imagemagick: CVE-2025-55298: https://nvd.nist.gov/vuln/detail/CVE-2025-55298
imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
iperf2: CVE-2025-54349: https://nvd.nist.gov/vuln/detail/CVE-2025-54349
iperf2: CVE-2025-54350: https://nvd.nist.gov/vuln/detail/CVE-2025-54350
iperf2: CVE-2025-54351: https://nvd.nist.gov/vuln/detail/CVE-2025-54351
jasper: CVE-2025-8835: https://nvd.nist.gov/vuln/detail/CVE-2025-8835
jasper: CVE-2025-8836: https://nvd.nist.gov/vuln/detail/CVE-2025-8836
jasper: CVE-2025-8837: https://nvd.nist.gov/vuln/detail/CVE-2025-8837
libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
libavif: CVE-2025-48175: https://nvd.nist.gov/vuln/detail/CVE-2025-48175
libcupsfilters: CVE-2024-47076: https://nvd.nist.gov/vuln/detail/CVE-2024-47076
libiec61850: CVE-2024-26529: https://nvd.nist.gov/vuln/detail/CVE-2024-26529
libiec61850: CVE-2024-45970: https://nvd.nist.gov/vuln/detail/CVE-2024-45970
libiec61850: CVE-2024-45971: https://nvd.nist.gov/vuln/detail/CVE-2024-45971
libppd: CVE-2024-47175: https://nvd.nist.gov/vuln/detail/CVE-2024-47175
libraw: CVE-2025-43961: https://nvd.nist.gov/vuln/detail/CVE-2025-43961
libraw: CVE-2025-43962: https://nvd.nist.gov/vuln/detail/CVE-2025-43962
libraw: CVE-2025-43963: https://nvd.nist.gov/vuln/detail/CVE-2025-43963
libraw: CVE-2025-43964: https://nvd.nist.gov/vuln/detail/CVE-2025-43964
libssh: CVE-2025-5318: https://nvd.nist.gov/vuln/detail/CVE-2025-5318
libssh: CVE-2025-5987: https://nvd.nist.gov/vuln/detail/CVE-2025-5987
luajit: CVE-2024-25176: https://nvd.nist.gov/vuln/detail/CVE-2024-25176
luajit: CVE-2024-25177: https://nvd.nist.gov/vuln/detail/CVE-2024-25177
luajit: CVE-2024-25178: https://nvd.nist.gov/vuln/detail/CVE-2024-25178
nbdkit: CVE-2025-47711: https://nvd.nist.gov/vuln/detail/CVE-2025-47711
nbdkit: CVE-2025-47712: https://nvd.nist.gov/vuln/detail/CVE-2025-47712
python3-django: CVE-2025-32873: https://nvd.nist.gov/vuln/detail/CVE-2025-32873
redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
tinyproxy: CVE-2023-49606: https://nvd.nist.gov/vuln/detail/CVE-2023-49606

