Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1CACCD199
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 12:22:26 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web11.16872.1760962940355736753
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Oct 2025 05:22:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=I9e2l7pK;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-63c556b4e0cso3965501a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 05:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760962939; x=1761567739; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHnleYcFvYgUJ7x7qOn/t/PXSVtr4QdzOpNgKN+oFEw=;
        b=I9e2l7pKhnDXsX0rj75Z3e8W76qo4g51+sYo1pz8XgCuLbJDa36p066lQrFahVGe8M
         xNiHVPyG0aIBQi5RDMPT7TNFBqcEtO7M0jFpQzgvVFkkPCxryUfOhsA+EjXKbaDdeAiJ
         jRajQdfXd1g5vz7Ande4vHCoLBu4pY+dHesah1Ga0up9LPPFYEl/48aS+Q46LDfgLp5j
         o3LLlr9YBh57aHLRJdy3u/sdqBcXN1FxvCbqSdmm2PnzxY/kNXBYbN0HMDE1duW2YzFf
         5Tq6RdlEedeXgzKWEuLOke+2wTG8HH1HPDKszkIqP/8omzV+cE7SJ2lZUPGeuJVOyPBs
         d4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962939; x=1761567739;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHnleYcFvYgUJ7x7qOn/t/PXSVtr4QdzOpNgKN+oFEw=;
        b=oPy+GZqvS5wC9zTqJCasVDiL0cLG7mU2pLqUbbUbJFu9u8UhgMw8UkMuoVrzgkhOCq
         hxl9ByQV1E2HOwDms+FBSFw33hU4dwEGQqEWDHb61zxYtL6gn6WVh/VBlQrsuj5Mzr7G
         I0NzHzjuoQ7Ly07z1Ag+2Mh1wnitiSlzynjy1Kia2VYIo9KB+eJ7psdPjWyV7WPkQW9S
         9+i2UXpFQnuL20QHhFdYHQy5utiL5rIQCKKSD3DsSjsBYezugf/CAzFjqGqaxaZd+IsX
         6AWtB22PkuolU7vvuHZvzx+nijgSyBHDr1mDFMSU49I3o+GesXOc3so/II9XRa4X2WrJ
         SE2Q==
X-Gm-Message-State: AOJu0YxBMpy8olKOaYP+9auWVqAWwvU3raGJZTTGFbl7cwXlapf2+xjm
	2Gu5eDdXPRlraY8EhZQM2qtYX0cah6oQyc+KRKOOQOJgA3D53W1R5PoaEJ7jYg==
X-Gm-Gg: ASbGncvqJyVSOh9nVn7Oh423nBnhd5WR9TKStl24Y58TH+cWez+x6MudwTXEBuJflNB
	2bzeegua+MhtiXtgylkU8qgOmt0GROFmtOl0L9AzVof//mjF2Z0iJ0fENrBq9nbpjH6KwiknSd5
	oujLSVxft78bzJaNB6MYiNp4Lu2FqJSwg8Qj0YENDPVYarFQpnHjjtsJ4KnNse/baajN+dHAjvw
	Cf1hOKG7BpJIkKrtN/dKnus/eIXbBDIUTolZ4zY611vcXSjesPHVw5y0+RQ8fThq1j0sKMbmXwD
	meA+MP5tHHq9VtMG8JmF41TIu0u0LKFU00xlD4wJPmj/MMFNeuGy56wNzSDz0/wEI5+6KCw2sCc
	6Ey3Axy37eKOAtKdReNmRSMknHSwlj8mkG3+fZQZ54XrdOAZEaMg/F6ytBdlouHeVGzZL+W0zVi
	a4tyAZeMF7
X-Google-Smtp-Source: AGHT+IHppFs9yKE04Tf7QApl7Zy7Gs165EkQFsaASE648Q3wf4bbnfarKjHMdREsy1DJKRhnDP4RDQ==
X-Received: by 2002:a17:907:25cc:b0:b38:6689:b9f5 with SMTP id a640c23a62f3a-b6471d45e6bmr1612342666b.3.1760962938044;
        Mon, 20 Oct 2025 05:22:18 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da33c6sm757666966b.2.2025.10.20.05.22.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 05:22:17 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: CVE report - scarthgap - 2025-10-20
Date: Mon, 20 Oct 2025 14:22:16 +0200
Message-ID: <20251020122216.1457528-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Oct 2025 12:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120814

List of all open CVEs (150, out of which new this week: 2):

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
[NEW] freerdp: CVE-2025-4478: https://nvd.nist.gov/vuln/detail/CVE-2025-4478
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
[NEW] iptraf-ng: CVE-2024-52949: https://nvd.nist.gov/vuln/detail/CVE-2024-52949
libao: CVE-2017-11548: https://nvd.nist.gov/vuln/detail/CVE-2017-11548
libcdio: CVE-2024-36600: https://nvd.nist.gov/vuln/detail/CVE-2024-36600
libiec61850: CVE-2023-27772: https://nvd.nist.gov/vuln/detail/CVE-2023-27772
libiec61850: CVE-2024-26529: https://nvd.nist.gov/vuln/detail/CVE-2024-26529
libiec61850: CVE-2024-45970: https://nvd.nist.gov/vuln/detail/CVE-2024-45970
libiec61850: CVE-2024-45971: https://nvd.nist.gov/vuln/detail/CVE-2024-45971
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
proftpd: CVE-2023-48795: https://nvd.nist.gov/vuln/detail/CVE-2023-48795
pure-ftpd: CVE-2024-48208: https://nvd.nist.gov/vuln/detail/CVE-2024-48208
python3-django: CVE-2025-26699: https://nvd.nist.gov/vuln/detail/CVE-2025-26699
python3-django: CVE-2025-27556: https://nvd.nist.gov/vuln/detail/CVE-2025-27556
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
squid: CVE-2025-59362: https://nvd.nist.gov/vuln/detail/CVE-2025-59362
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

Removed this week (42): 

corosync: CVE-2025-30472: https://nvd.nist.gov/vuln/detail/CVE-2025-30472
dash: CVE-2024-21485: https://nvd.nist.gov/vuln/detail/CVE-2024-21485
emacs-native: CVE-2024-30202: https://nvd.nist.gov/vuln/detail/CVE-2024-30202
emacs-native: CVE-2024-30203: https://nvd.nist.gov/vuln/detail/CVE-2024-30203
emacs-native: CVE-2024-30204: https://nvd.nist.gov/vuln/detail/CVE-2024-30204
emacs-native: CVE-2024-30205: https://nvd.nist.gov/vuln/detail/CVE-2024-30205
emacs-native: CVE-2024-39331: https://nvd.nist.gov/vuln/detail/CVE-2024-39331
exiv2: CVE-2025-26623: https://nvd.nist.gov/vuln/detail/CVE-2025-26623
exiv2: CVE-2025-54080: https://nvd.nist.gov/vuln/detail/CVE-2025-54080
exiv2: CVE-2025-55304: https://nvd.nist.gov/vuln/detail/CVE-2025-55304
frr: CVE-2024-44070: https://nvd.nist.gov/vuln/detail/CVE-2024-44070
gattlib: CVE-2019-6498: https://nvd.nist.gov/vuln/detail/CVE-2019-6498
gnupg: CVE-2025-30258: https://nvd.nist.gov/vuln/detail/CVE-2025-30258
hdf5: CVE-2025-2923: https://nvd.nist.gov/vuln/detail/CVE-2025-2923
hdf5: CVE-2025-2924: https://nvd.nist.gov/vuln/detail/CVE-2025-2924
hdf5: CVE-2025-2925: https://nvd.nist.gov/vuln/detail/CVE-2025-2925
hdf5: CVE-2025-6269: https://nvd.nist.gov/vuln/detail/CVE-2025-6269
influxdb: CVE-2019-10329: https://nvd.nist.gov/vuln/detail/CVE-2019-10329
jasper: CVE-2023-51257: https://nvd.nist.gov/vuln/detail/CVE-2023-51257
libavif: CVE-2025-48175: https://nvd.nist.gov/vuln/detail/CVE-2025-48175
libconfuse: CVE-2022-40320: https://nvd.nist.gov/vuln/detail/CVE-2022-40320
libcupsfilters: CVE-2024-47076: https://nvd.nist.gov/vuln/detail/CVE-2024-47076
libmemcached: CVE-2023-27478: https://nvd.nist.gov/vuln/detail/CVE-2023-27478
libppd: CVE-2024-47175: https://nvd.nist.gov/vuln/detail/CVE-2024-47175
libraw: CVE-2025-43961: https://nvd.nist.gov/vuln/detail/CVE-2025-43961
libraw: CVE-2025-43962: https://nvd.nist.gov/vuln/detail/CVE-2025-43962
libraw: CVE-2025-43963: https://nvd.nist.gov/vuln/detail/CVE-2025-43963
libraw: CVE-2025-43964: https://nvd.nist.gov/vuln/detail/CVE-2025-43964
libvpx: CVE-2024-5197: https://nvd.nist.gov/vuln/detail/CVE-2024-5197
memcached: CVE-2022-26635: https://nvd.nist.gov/vuln/detail/CVE-2022-26635
memcached: CVE-2023-46852: https://nvd.nist.gov/vuln/detail/CVE-2023-46852
memcached: CVE-2023-46853: https://nvd.nist.gov/vuln/detail/CVE-2023-46853
mercurial: CVE-2022-43410: https://nvd.nist.gov/vuln/detail/CVE-2022-43410
monkey: CVE-2013-1771: https://nvd.nist.gov/vuln/detail/CVE-2013-1771
monkey: CVE-2013-2183: https://nvd.nist.gov/vuln/detail/CVE-2013-2183
ndpi: CVE-2025-25066: https://nvd.nist.gov/vuln/detail/CVE-2025-25066
neatvnc: CVE-2024-42458: https://nvd.nist.gov/vuln/detail/CVE-2024-42458
opencv: CVE-2025-53644: https://nvd.nist.gov/vuln/detail/CVE-2025-53644
redis: CVE-2025-48367: https://nvd.nist.gov/vuln/detail/CVE-2025-48367
redis: CVE-2025-49844: https://nvd.nist.gov/vuln/detail/CVE-2025-49844
tinyproxy: CVE-2023-49606: https://nvd.nist.gov/vuln/detail/CVE-2023-49606
vorbis-tools: CVE-2023-43361: https://nvd.nist.gov/vuln/detail/CVE-2023-43361

