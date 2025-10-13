Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813D7CCD183
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:33:59 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.43761.1760362429127719858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:33:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0RWkl7k;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46fc5e54cceso7166045e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760362427; x=1760967227; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9yZ0xbUSYEk2JTwJc8r9DuF64Qbtd4NFXO3mr7QkghI=;
        b=V0RWkl7kNi/0/tpF13kvY6z/7YtfGQW6l2SqIwmyickU9FXurqL5qP/kvd4HeKApBE
         XfG/OISKWzIeIy6+aOuwrk+VM9GGFLbAX6swWu1j+YfYR77Pbs4Af51r1CUMW8yHCW7F
         BkMPJ1ucbV8noyC5ooXza839XIo6aGGJmyF9qVCHSagjZKXy4YS+6UgJ5d+Yh9SQAXNC
         JBfWDDj4Ej8Z4N8WehjMz3kB4PA7qpUzJJvaevv1Jx7KgiUaFiRQmMEWih6NVoOzhO2J
         14Zx+1a8E67sPZtg27FG7+sFrYIypvebWAJMEjU/W70ra/gi2QtVkJm0R7dwoLt6Sxuh
         QQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760362427; x=1760967227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9yZ0xbUSYEk2JTwJc8r9DuF64Qbtd4NFXO3mr7QkghI=;
        b=l4KhNXHnYWGoFT86ATqtj8/wYPh8uAq068duryiD4kP5B3it9eU9I7OLxxNxkeQ2SN
         qjaWMdHTX31AcAs3a+TD1cSwcOpmJ9wFLxWSzBz1ev4Hn14t5ZVR4zzCXizwWxMh7+/p
         Tzk+ejvvxnInIN3TTCS6ZzfGR8mXiz2MoZcYVSkFHsA5mwnRbXiL19u9fKtkdD2vnmcy
         X8YwR2exEFRAS1iIZDfvN97z4cYZsP0WdnvgVK86QqVYEnDlnkY8P7xsBNY3U+JHU7mw
         7BKRmG8azH4ymmL7jrDf2daBxQqedIv+3FOiCBKuWhAXMvLwYZjTBaP5/QUFBZa8bPCh
         /Wwg==
X-Gm-Message-State: AOJu0YwpRpTeBzIxpMtab4kSmJZqvk30ITKRBG3cpVp/pnnQywQfIlfs
	AS9/BwmOiiFwT/sUem2ns/V7hFpZdCwFHEG+pNzPHO+ggVD3LuUAwPqO45IMbw==
X-Gm-Gg: ASbGncvP0CeAR1r8+X6bF+DUlsj7NkUepUwcOymB/KCe9hIGS89Fdvb7OF2tWiXmuY9
	VKKDyOG/W0ZrX1Dfq+KuGvMyQFOR4PUbkbf+xZnsuGquq9VIHxZxnAk8mYz3Z4wvQSGsoU6Hb8J
	cW6Hz7NFNFHm2riVZSiKkQf8UsJRpDbOQfglyiYR6EBpQjFtPkhwJiiZ6fdlOp/3vQtYXEnvR2E
	4dsEexT1v+ImSeidQf2misT+ZYhGZdcluiLh0P84sLsVqD9Mq48zrfoVSduUYTMsXPiaLvDKf/f
	++Vz8+TH07e5jFfj5xN6B5yx/j456173n0vhx5/t+pM+kMbyOzCS3U4Bk75jF6JhmQGXpJD3RgK
	pAipESoCZ+qoiVr99W1+DsBvYa/6VeVKkaAuNl1L30VR5axXY0Q==
X-Google-Smtp-Source: AGHT+IHKDkl87spb0oy31STx7V/39V22vpojtxgfyFhh84kQCN0JqxqzU8F+/ngVQRXS0ed0IFKHIQ==
X-Received: by 2002:a05:600c:4fd3:b0:45b:7e86:7378 with SMTP id 5b1f17b1804b1-46fa9b19f64mr176171585e9.34.1760362427359;
        Mon, 13 Oct 2025 06:33:47 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fab3cc939sm131038105e9.1.2025.10.13.06.33.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 06:33:46 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - walnascar - 2025-10-13
Date: Mon, 13 Oct 2025 15:33:45 +0200
Message-ID: <20251013133345.3988661-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:33:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120534

List of all open CVEs (90, out of which new this week: 20):

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
[NEW] emacs-native: CVE-2024-30202: https://nvd.nist.gov/vuln/detail/CVE-2024-30202
[NEW] emacs-native: CVE-2024-30203: https://nvd.nist.gov/vuln/detail/CVE-2024-30203
[NEW] emacs-native: CVE-2024-30204: https://nvd.nist.gov/vuln/detail/CVE-2024-30204
[NEW] emacs-native: CVE-2024-30205: https://nvd.nist.gov/vuln/detail/CVE-2024-30205
[NEW] emacs-native: CVE-2024-39331: https://nvd.nist.gov/vuln/detail/CVE-2024-39331
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
[NEW] gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
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
[NEW] libde265: CVE-2024-38949: https://nvd.nist.gov/vuln/detail/CVE-2024-38949
[NEW] libde265: CVE-2024-38950: https://nvd.nist.gov/vuln/detail/CVE-2024-38950
[NEW] libheif: CVE-2025-43966: https://nvd.nist.gov/vuln/detail/CVE-2025-43966
[NEW] libheif: CVE-2025-43967: https://nvd.nist.gov/vuln/detail/CVE-2025-43967
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
[NEW] redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
[NEW] redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
[NEW] redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
[NEW] redis: CVE-2025-49844: https://nvd.nist.gov/vuln/detail/CVE-2025-49844
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

Removed this week (52): 

apache2: CVE-2025-54090: https://nvd.nist.gov/vuln/detail/CVE-2025-54090
civetweb: CVE-2025-55763: https://nvd.nist.gov/vuln/detail/CVE-2025-55763
dovecot: CVE-2022-30550: https://nvd.nist.gov/vuln/detail/CVE-2022-30550
emacs: CVE-2024-30202: https://nvd.nist.gov/vuln/detail/CVE-2024-30202
emacs: CVE-2024-30203: https://nvd.nist.gov/vuln/detail/CVE-2024-30203
emacs: CVE-2024-30204: https://nvd.nist.gov/vuln/detail/CVE-2024-30204
emacs: CVE-2024-30205: https://nvd.nist.gov/vuln/detail/CVE-2024-30205
emacs: CVE-2024-39331: https://nvd.nist.gov/vuln/detail/CVE-2024-39331
exiv2: CVE-2025-26623: https://nvd.nist.gov/vuln/detail/CVE-2025-26623
exiv2: CVE-2025-54080: https://nvd.nist.gov/vuln/detail/CVE-2025-54080
exiv2: CVE-2025-55304: https://nvd.nist.gov/vuln/detail/CVE-2025-55304
gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
gimp: CVE-2025-8672: https://nvd.nist.gov/vuln/detail/CVE-2025-8672
hdf5: CVE-2025-2923: https://nvd.nist.gov/vuln/detail/CVE-2025-2923
hdf5: CVE-2025-2924: https://nvd.nist.gov/vuln/detail/CVE-2025-2924
hdf5: CVE-2025-2925: https://nvd.nist.gov/vuln/detail/CVE-2025-2925
hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
imagemagick: CVE-2025-53014: https://nvd.nist.gov/vuln/detail/CVE-2025-53014
imagemagick: CVE-2025-53015: https://nvd.nist.gov/vuln/detail/CVE-2025-53015
imagemagick: CVE-2025-53019: https://nvd.nist.gov/vuln/detail/CVE-2025-53019
imagemagick: CVE-2025-53101: https://nvd.nist.gov/vuln/detail/CVE-2025-53101
imagemagick: CVE-2025-55004: https://nvd.nist.gov/vuln/detail/CVE-2025-55004
imagemagick: CVE-2025-55005: https://nvd.nist.gov/vuln/detail/CVE-2025-55005
imagemagick: CVE-2025-55154: https://nvd.nist.gov/vuln/detail/CVE-2025-55154
imagemagick: CVE-2025-55160: https://nvd.nist.gov/vuln/detail/CVE-2025-55160
imagemagick: CVE-2025-55212: https://nvd.nist.gov/vuln/detail/CVE-2025-55212
imagemagick: CVE-2025-57803: https://nvd.nist.gov/vuln/detail/CVE-2025-57803
imagemagick: CVE-2025-57807: https://nvd.nist.gov/vuln/detail/CVE-2025-57807
iperf2: CVE-2025-54349: https://nvd.nist.gov/vuln/detail/CVE-2025-54349
iperf2: CVE-2025-54350: https://nvd.nist.gov/vuln/detail/CVE-2025-54350
iperf2: CVE-2025-54351: https://nvd.nist.gov/vuln/detail/CVE-2025-54351
jasper: CVE-2025-8835: https://nvd.nist.gov/vuln/detail/CVE-2025-8835
jasper: CVE-2025-8836: https://nvd.nist.gov/vuln/detail/CVE-2025-8836
jasper: CVE-2025-8837: https://nvd.nist.gov/vuln/detail/CVE-2025-8837
libavif: CVE-2025-48174: https://nvd.nist.gov/vuln/detail/CVE-2025-48174
libcupsfilters: CVE-2024-47076: https://nvd.nist.gov/vuln/detail/CVE-2024-47076
libiec61850: CVE-2024-26529: https://nvd.nist.gov/vuln/detail/CVE-2024-26529
libiec61850: CVE-2024-45970: https://nvd.nist.gov/vuln/detail/CVE-2024-45970
libiec61850: CVE-2024-45971: https://nvd.nist.gov/vuln/detail/CVE-2024-45971
libpcre2: CVE-2025-58050: https://nvd.nist.gov/vuln/detail/CVE-2025-58050
libppd: CVE-2024-47175: https://nvd.nist.gov/vuln/detail/CVE-2024-47175
libraw: CVE-2025-43961: https://nvd.nist.gov/vuln/detail/CVE-2025-43961
libraw: CVE-2025-43962: https://nvd.nist.gov/vuln/detail/CVE-2025-43962
libraw: CVE-2025-43963: https://nvd.nist.gov/vuln/detail/CVE-2025-43963
libraw: CVE-2025-43964: https://nvd.nist.gov/vuln/detail/CVE-2025-43964
python3-django: CVE-2025-27556: https://nvd.nist.gov/vuln/detail/CVE-2025-27556
redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
redis: CVE-2025-32023: https://nvd.nist.gov/vuln/detail/CVE-2025-32023
redis: CVE-2025-48367: https://nvd.nist.gov/vuln/detail/CVE-2025-48367
tinyproxy: CVE-2023-49606: https://nvd.nist.gov/vuln/detail/CVE-2023-49606
wireshark: CVE-2025-5601: https://nvd.nist.gov/vuln/detail/CVE-2025-5601

