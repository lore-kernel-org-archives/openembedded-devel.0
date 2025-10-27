Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0F5DCCF9E0
	for <webhook@archiver.kernel.org>; Mon, 27 Oct 2025 11:18:03 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.29249.1761563878906197407
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Oct 2025 04:17:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CH8r8L5Q;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so27831955e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 04:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761563877; x=1762168677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rogj5L5gdvnYSc8nA1A4UhhgE4e4crhCR+K1Ct1nFi8=;
        b=CH8r8L5QMj452tAR7dH3yU43Eh7osDt+PRR0//grNnkyAquj90qWXowuttormkKs31
         uG7mQ9ZDfsXOHJq6iPKLipzkhwZ3FYJ7dAWBw8My7L5pj4yOPnT9PznkCKvKOaBzKGiV
         b38N1pdozfua8cduGtfpGoaxRHSwY72c+1GYlFmkgPFmBafK2r76C7y527i+0Q+FxHuO
         kU78Y+Xk/L5/NQkD0N61XXkrUVgIuadQX4SsBQjmT+dH7HRIPZVWBbp7r6Wf1MusavWj
         TYfYRm0+4792/SaSg6H091LDAv5T8HMAr/ME1PAmUWT5JDXfBBO6YEE9NbvGvj9fBtVp
         vg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761563877; x=1762168677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rogj5L5gdvnYSc8nA1A4UhhgE4e4crhCR+K1Ct1nFi8=;
        b=soaMHBdqUi3yWvoNHRKhNT9GgcKjONvvetW3JVgZTMirK5So89MW4BJOFuy05t58Wt
         haCxpzkjiCiNZlEirDd8dsd/U+8Lc7A77lDHSUmj4wJjxygBkd1RwTsW4v29hcdSDzEs
         SvWmguoAp6kkNHOLA/lEZPlAeS0xaoAz6tU4mR/OMYT0EIK702D2DJ0QaAI61uvjHNvE
         3Sc283KxhhR3pJpdKU3U6zFTQnkCaS0Pp3FZz7Czo1YZ8otICiZlCA3zGxXyGgzFM6MJ
         MSHW2P6YGJPsymahgtspRQhkv8hX/vjE8Lhg2Mfpc/q70eVSF1Obck7Hlf/LOD6k0Zea
         JiPA==
X-Gm-Message-State: AOJu0YwxCSxENoOWcB1jslT/einlwdwUS9HF2ywt96V4VKVzLPdARWbj
	BArUJ1FERFZfQYXLWxXDJJmJVl4ZPlILDrDM7FnxmrhFaY/SC5NkTQUQ2oj5CA==
X-Gm-Gg: ASbGncvzA1uBBhqo9c8zjDyUEVRaNy+rJrCjGF3bO/+D7Zy2FkUjt1p9qaMgtdurG8+
	6WLDuF1g+rnEvvD5UDMei9/oLoceTWf2lUQKbspkMD9HpeYX4WLVaz7Drg4jkep741BaL3gOhMM
	b2gz/63kqZX5Tcy//cFiR6JXYxhK8Gf8NxwplVSO88M4r8SuIuNA+O+l0bzktiefxhgLMY05HRx
	Mj+AWjfj2WKSAiEE1QWKizo27nrJCtM8U2aOcXHWgzRaH562D0p5PS/XlDq212C0eQIi3/xZPFD
	UQVMCzxvMao98+ORWIlZgvA5MqdQwA5bfdjXxtZpA+U+7dZmv1fwi8KngQpppm5caLqyUC/KUpS
	cyL1UO7tw0cysV6+k/QiybbXVl4wqI4ex505XGrKhcSltq5oYdnYK+9ipvurDGXZ9IaOuqRR0vY
	thod/r6vZH
X-Google-Smtp-Source: AGHT+IF8IUbwFNim+KLkkT3vuJIw6XxLfbQAlVQyBICmzMWTmIOxiAad9TTkp07qmMbn3L4at2akJQ==
X-Received: by 2002:a05:600d:4392:b0:475:d8f3:71c1 with SMTP id 5b1f17b1804b1-475d8f37463mr50102405e9.27.1761563877160;
        Mon, 27 Oct 2025 04:17:57 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm13824442f8f.47.2025.10.27.04.17.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 04:17:56 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2025-10-27
Date: Mon, 27 Oct 2025 12:17:55 +0100
Message-ID: <20251027111755.332145-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Oct 2025 11:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121036

List of all open CVEs (146, out of which new this week: 4):

apache2: CVE-2025-3891: https://nvd.nist.gov/vuln/detail/CVE-2025-3891
audiofile: CVE-2018-13440: https://nvd.nist.gov/vuln/detail/CVE-2018-13440
audiofile: CVE-2018-17095: https://nvd.nist.gov/vuln/detail/CVE-2018-17095
audiofile: CVE-2019-13147: https://nvd.nist.gov/vuln/detail/CVE-2019-13147
audiofile: CVE-2020-18781: https://nvd.nist.gov/vuln/detail/CVE-2020-18781
audiofile: CVE-2022-24599: https://nvd.nist.gov/vuln/detail/CVE-2022-24599
botan: CVE-2024-39312: https://nvd.nist.gov/vuln/detail/CVE-2024-39312
botan: CVE-2024-50382: https://nvd.nist.gov/vuln/detail/CVE-2024-50382
botan: CVE-2024-50383: https://nvd.nist.gov/vuln/detail/CVE-2024-50383
dhrystone: CVE-2020-23026: https://nvd.nist.gov/vuln/detail/CVE-2020-23026
emacs: CVE-2024-53920: https://nvd.nist.gov/vuln/detail/CVE-2024-53920
ez-ipupdate: CVE-2003-0887: https://nvd.nist.gov/vuln/detail/CVE-2003-0887
freerdp: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
giflib: CVE-2024-45993: https://nvd.nist.gov/vuln/detail/CVE-2024-45993
gimp: CVE-2007-3741: https://nvd.nist.gov/vuln/detail/CVE-2007-3741
gimp: CVE-2025-5473: https://nvd.nist.gov/vuln/detail/CVE-2025-5473
hdf5: CVE-2025-2912: https://nvd.nist.gov/vuln/detail/CVE-2025-2912
hdf5: CVE-2025-2913: https://nvd.nist.gov/vuln/detail/CVE-2025-2913
hdf5: CVE-2025-2914: https://nvd.nist.gov/vuln/detail/CVE-2025-2914
hdf5: CVE-2025-2915: https://nvd.nist.gov/vuln/detail/CVE-2025-2915
hdf5: CVE-2025-2926: https://nvd.nist.gov/vuln/detail/CVE-2025-2926
hdf5: CVE-2025-6270: https://nvd.nist.gov/vuln/detail/CVE-2025-6270
hdf5: CVE-2025-6516: https://nvd.nist.gov/vuln/detail/CVE-2025-6516
[NEW] hostapd: CVE-2022-37660: https://nvd.nist.gov/vuln/detail/CVE-2022-37660
[NEW] hostapd: CVE-2025-24912: https://nvd.nist.gov/vuln/detail/CVE-2025-24912
id3lib: CVE-2007-4460: https://nvd.nist.gov/vuln/detail/CVE-2007-4460
imagemagick: CVE-2023-5341: https://nvd.nist.gov/vuln/detail/CVE-2023-5341
imagemagick: CVE-2024-41817: https://nvd.nist.gov/vuln/detail/CVE-2024-41817
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
[NEW] imagemagick: CVE-2025-62171: https://nvd.nist.gov/vuln/detail/CVE-2025-62171
iptraf-ng: CVE-2024-52949: https://nvd.nist.gov/vuln/detail/CVE-2024-52949
libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
libtar: CVE-2013-4420: https://nvd.nist.gov/vuln/detail/CVE-2013-4420
libtar: CVE-2021-33643: https://nvd.nist.gov/vuln/detail/CVE-2021-33643
libtar: CVE-2021-33644: https://nvd.nist.gov/vuln/detail/CVE-2021-33644
libtar: CVE-2021-33645: https://nvd.nist.gov/vuln/detail/CVE-2021-33645
libtar: CVE-2021-33646: https://nvd.nist.gov/vuln/detail/CVE-2021-33646
libwmf: CVE-2009-1364: https://nvd.nist.gov/vuln/detail/CVE-2009-1364
libwmf: CVE-2015-0848: https://nvd.nist.gov/vuln/detail/CVE-2015-0848
libwmf: CVE-2015-4588: https://nvd.nist.gov/vuln/detail/CVE-2015-4588
libwmf: CVE-2015-4695: https://nvd.nist.gov/vuln/detail/CVE-2015-4695
libwmf: CVE-2015-4696: https://nvd.nist.gov/vuln/detail/CVE-2015-4696
libwmf: CVE-2016-9011: https://nvd.nist.gov/vuln/detail/CVE-2016-9011
links: CVE-2008-3319: https://nvd.nist.gov/vuln/detail/CVE-2008-3319
linuxptp: CVE-2024-42861: https://nvd.nist.gov/vuln/detail/CVE-2024-42861
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
nbdkit: CVE-2025-47711: https://nvd.nist.gov/vuln/detail/CVE-2025-47711
nbdkit: CVE-2025-47712: https://nvd.nist.gov/vuln/detail/CVE-2025-47712
openflow: CVE-2018-1000155: https://nvd.nist.gov/vuln/detail/CVE-2018-1000155
openjpeg: CVE-2023-39327: https://nvd.nist.gov/vuln/detail/CVE-2023-39327
openjpeg: CVE-2023-39328: https://nvd.nist.gov/vuln/detail/CVE-2023-39328
openjpeg: CVE-2023-39329: https://nvd.nist.gov/vuln/detail/CVE-2023-39329
opusfile: CVE-2022-47021: https://nvd.nist.gov/vuln/detail/CVE-2022-47021
p7zip: CVE-2022-47069: https://nvd.nist.gov/vuln/detail/CVE-2022-47069
pidgin: CVE-2022-26491: https://nvd.nist.gov/vuln/detail/CVE-2022-26491
proftpd: CVE-2001-0027: https://nvd.nist.gov/vuln/detail/CVE-2001-0027
pure-ftpd: CVE-2024-48208: https://nvd.nist.gov/vuln/detail/CVE-2024-48208
redis: CVE-2022-0543: https://nvd.nist.gov/vuln/detail/CVE-2022-0543
redis: CVE-2022-3734: https://nvd.nist.gov/vuln/detail/CVE-2022-3734
redis: CVE-2025-21605: https://nvd.nist.gov/vuln/detail/CVE-2025-21605
redis: CVE-2025-27151: https://nvd.nist.gov/vuln/detail/CVE-2025-27151
redis: CVE-2025-46817: https://nvd.nist.gov/vuln/detail/CVE-2025-46817
redis: CVE-2025-46818: https://nvd.nist.gov/vuln/detail/CVE-2025-46818
redis: CVE-2025-46819: https://nvd.nist.gov/vuln/detail/CVE-2025-46819
rsyslog: CVE-2015-3243: https://nvd.nist.gov/vuln/detail/CVE-2015-3243
rtmpdump: CVE-2015-8270: https://nvd.nist.gov/vuln/detail/CVE-2015-8270
rtmpdump: CVE-2015-8271: https://nvd.nist.gov/vuln/detail/CVE-2015-8271
rtmpdump: CVE-2015-8272: https://nvd.nist.gov/vuln/detail/CVE-2015-8272
sassc: CVE-2022-43357: https://nvd.nist.gov/vuln/detail/CVE-2022-43357
smarty: CVE-2020-10375: https://nvd.nist.gov/vuln/detail/CVE-2020-10375
sngrep: CVE-2024-35434: https://nvd.nist.gov/vuln/detail/CVE-2024-35434
spice: CVE-2016-0749: https://nvd.nist.gov/vuln/detail/CVE-2016-0749
spice: CVE-2016-2150: https://nvd.nist.gov/vuln/detail/CVE-2016-2150
spice-gtk: CVE-2012-4425: https://nvd.nist.gov/vuln/detail/CVE-2012-4425
sthttpd: CVE-2021-26843: https://nvd.nist.gov/vuln/detail/CVE-2021-26843
synergy: CVE-2020-15117: https://nvd.nist.gov/vuln/detail/CVE-2020-15117
tcpreplay: CVE-2025-9384: https://nvd.nist.gov/vuln/detail/CVE-2025-9384
tcpreplay: CVE-2025-9385: https://nvd.nist.gov/vuln/detail/CVE-2025-9385
tcpreplay: CVE-2025-9386: https://nvd.nist.gov/vuln/detail/CVE-2025-9386
uw-imap: CVE-2018-19518: https://nvd.nist.gov/vuln/detail/CVE-2018-19518
webkitgtk3: CVE-2024-27834: https://nvd.nist.gov/vuln/detail/CVE-2024-27834
webmin: CVE-2017-15644: https://nvd.nist.gov/vuln/detail/CVE-2017-15644
webmin: CVE-2017-15645: https://nvd.nist.gov/vuln/detail/CVE-2017-15645
webmin: CVE-2017-15646: https://nvd.nist.gov/vuln/detail/CVE-2017-15646
webmin: CVE-2017-17089: https://nvd.nist.gov/vuln/detail/CVE-2017-17089
webmin: CVE-2019-12840: https://nvd.nist.gov/vuln/detail/CVE-2019-12840
webmin: CVE-2019-15107: https://nvd.nist.gov/vuln/detail/CVE-2019-15107
webmin: CVE-2019-15641: https://nvd.nist.gov/vuln/detail/CVE-2019-15641
webmin: CVE-2019-15642: https://nvd.nist.gov/vuln/detail/CVE-2019-15642
webmin: CVE-2020-12670: https://nvd.nist.gov/vuln/detail/CVE-2020-12670
webmin: CVE-2020-35606: https://nvd.nist.gov/vuln/detail/CVE-2020-35606
webmin: CVE-2020-8820: https://nvd.nist.gov/vuln/detail/CVE-2020-8820
webmin: CVE-2020-8821: https://nvd.nist.gov/vuln/detail/CVE-2020-8821
webmin: CVE-2022-0824: https://nvd.nist.gov/vuln/detail/CVE-2022-0824
webmin: CVE-2022-0829: https://nvd.nist.gov/vuln/detail/CVE-2022-0829
webmin: CVE-2022-30708: https://nvd.nist.gov/vuln/detail/CVE-2022-30708
webmin: CVE-2022-36446: https://nvd.nist.gov/vuln/detail/CVE-2022-36446
webmin: CVE-2023-43309: https://nvd.nist.gov/vuln/detail/CVE-2023-43309
webmin: CVE-2023-52046: https://nvd.nist.gov/vuln/detail/CVE-2023-52046
webmin: CVE-2024-36450: https://nvd.nist.gov/vuln/detail/CVE-2024-36450
webmin: CVE-2024-36451: https://nvd.nist.gov/vuln/detail/CVE-2024-36451
webmin: CVE-2024-36452: https://nvd.nist.gov/vuln/detail/CVE-2024-36452
webmin: CVE-2024-36453: https://nvd.nist.gov/vuln/detail/CVE-2024-36453
webmin: CVE-2024-45692: https://nvd.nist.gov/vuln/detail/CVE-2024-45692
weechat: CVE-2024-46613: https://nvd.nist.gov/vuln/detail/CVE-2024-46613
yasm: CVE-2021-33454: https://nvd.nist.gov/vuln/detail/CVE-2021-33454
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

Removed this week (8): 

libiec61850: CVE-2023-27772: https://nvd.nist.gov/vuln/detail/CVE-2023-27772
libiec61850: CVE-2024-26529: https://nvd.nist.gov/vuln/detail/CVE-2024-26529
libiec61850: CVE-2024-45970: https://nvd.nist.gov/vuln/detail/CVE-2024-45970
libiec61850: CVE-2024-45971: https://nvd.nist.gov/vuln/detail/CVE-2024-45971
proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
python3-django: CVE-2025-26699: https://nvd.nist.gov/vuln/detail/CVE-2025-26699
python3-django: CVE-2025-27556: https://nvd.nist.gov/vuln/detail/CVE-2025-27556
squid: CVE-2025-59362: https://nvd.nist.gov/vuln/detail/CVE-2025-59362

