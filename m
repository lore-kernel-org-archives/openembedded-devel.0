Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A95CD4855
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 08:32:23 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71053.1778574738812653756
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 01:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=nif0bPd8;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Fx0capHh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4pFkb2519168
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xDNJEyrbrazj76wBw3OhoHw9VsOs6If6rS/
	F6Fqs1x8=; b=nif0bPd8d6vXYd1ExvfXeFNYh19ev+rKTf2nWcevzSfbj5CiZQQ
	8oSjaoxK7yE+rPofC/6gw+u01sbhkttlVXdu/ndH2Y6nPQOszNZhqECZk6NcmoB5
	+PVngvrA+8Zu89HEHT7MX2bWlj0fDleNJrwRb8m/yQSs7r41hDBjQada0f1OwHXK
	vADZ7ZMN/9VzgKuhh4At6aGuuc/MtdxHkE4pQACsKGwupWwE70FTec9kuPM7TPte
	KjjbaT1iRXMmKNxGxT3ehvKF2HE8EhBpeFIh4lhk/Mag/MnbVPac1lm4g48+v7+T
	HI2DalgPXq7a9WM9zmBf0SgE7sCgFFhas3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1j9hn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:32:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b7aba0af02so56757095ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 01:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778574736; x=1779179536; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=xDNJEyrbrazj76wBw3OhoHw9VsOs6If6rS/F6Fqs1x8=;
        b=Fx0capHh1hQmTG+/3+z8zi4SRYkN8KKazjO7ynnagtAk0Y/LaDTlvMW6R/NNdcSkkQ
         Qi15qOTLsciqxH1WjC973KfQY5+Ak1JPkcyom1rhV5F/Dzu/ZbeQ4tio5fDhn3SP27Wc
         Ho5JeEEszcYU7UpBR6hvh00ipPugRXfq+GdfpMbam7EgmafkQ1E0JDTU5GAWiwtkcamn
         1H4qhGpSKkhwzsC6hacGQicFg9jDyVLk+Sqy6P20jOdxMbLl4PgOJ1zwAnnhFZmAU9e7
         xaLFHSxJIcFaIrx9wxtVuGgLp1JsCWp+SuKB08RfdvLe/fj0jJuPeNv3sIGh4oa2bTj/
         gJAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778574736; x=1779179536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xDNJEyrbrazj76wBw3OhoHw9VsOs6If6rS/F6Fqs1x8=;
        b=HXMeqTzDFLyvAISAPgzETBA90xlWSVucjgBJdot6za9r2pAziKrnCxXBev2nCpq2a6
         BqAKid4usbKK7CinKBoj7e0VSVyJp8zWak1ZI5YuxiwLOeDxWsZi0Vc5hocqgoixgOdR
         FHGEonlp4dEF2P72hKEb78LbuOplQCrgcrVZsP6O1zcGeGenoptmqre0pF1DsZcf+EqV
         WRONcSz3ZUulNUsOUidqDoh5za67rH1e1X4QDObmitBaEm6YPh4yWm3sk+ua6WA/whHo
         Ca81WrRklvUzHH4Rs5SyqIP6tN0xUVZv4DYWiJ1StLa14nZ5hu0jVuMdXkSTjUtgxRfM
         71tg==
X-Forwarded-Encrypted: i=1; AFNElJ+TMC10FcnpQF3Y03t8cUVdedq4F4l6goihP7GbX9kmG/lOv9EtPucgmd+mKYAhpd9i4eErACEV4FL/610v0p8cvmY=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw4FrImGrorcNJhmrY+4gssxVEXKBFLL0CA84lctRPo7f5DJnjN
	lmefaocrgDl05aRYU2F0zUvR1RORsen9N60sLVtVPHbq3uTtp3puU0agLgmoGzx2pE4rnQKZq6n
	8OzC5aK9EBXkk7OXTwDbP5QK9rucInt/YmX+3Wrbm4KZ/nuklH6oQAUBgH1CJ0OHcM1H+g1km2Z
	BFqul9as12sYCBxal2Fhg=
X-Gm-Gg: Acq92OFX2GCGA7oHetl/fBTlyH2/6MuRAUKqBul/LSop2fCU62ncChdClACAFBBwgCg
	vubto3MeHnbmimiwPA0ytsgEx5FwkKSRJwCEGjqL5m8XJySe013Whc76b8tIbdoI01USQVd5ro3
	RxYzqeIeTb5gKZ7/t+md7J4NQlhotoVZ8To47X8nA5DAJkB28M3QKPItQp1xRUW3WaPu8QTuy06
	M4Kc6zBzxFkFpoxbBf8hC2zKXkc2LqKvmyNAVooxAk/Sx8fqmLq5YoBSTXMPrIX6xwlmMjLixR1
	n5KyfXDIUnH4fcLZVIYuv3OPppLrvO8IL8XjjRI0ZC4MRw46Suc18+Yqf/lnM7/n/4yGpEoRVtI
	6Opo4hp581avoIfSG+9RsLc7lKXreGt7SQOPrPgMN5Nk4qWXo9rr8
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id d9443c01a7336-2bc8634c747mr134908515ad.21.1778574736309;
        Tue, 12 May 2026 01:32:16 -0700 (PDT)
X-Received: by 2002:a17:902:ef06:b0:2bc:8634:c35c with SMTP id d9443c01a7336-2bc8634c747mr134908085ad.21.1778574735635;
        Tue, 12 May 2026 01:32:15 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35e9dsm133062525ad.39.2026.05.12.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 01:32:15 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/27] Whinlatter pull request
Date: Tue, 12 May 2026 14:02:07 +0530
Message-ID: <cover.1778574417.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 94Y9Jr6bzri9PxCTjjNNm-7bgkViR8gc
X-Proofpoint-ORIG-GUID: 94Y9Jr6bzri9PxCTjjNNm-7bgkViR8gc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA4NSBTYWx0ZWRfX2qrl/Gj0yLXg
 JHE+9krk3elWRrAzXGwjeUKBLsXl4eRnILC5F1RcDGHXm0VZgDc1K40mm97mYFuLVMiQHzGsEFH
 JgYkmgccZUO2YnETimkaSb+GBN7I7Soxn9hGInR7GT4Wi5fb4kQJWGf7Lbb0FWttkagBbDT9l7c
 GE1+PCYlQZQkUl4J0qm+L8P4506EScj9fvb8wDdnn8RHCdG4fnthtrOXjeBUgv0nlv+Z9GHBU3d
 fgr7mjbiOyiQIWwMlO4J4me/OLeYIZgyMrbYvuwMpgBEMvEzxsWvYLZzFbY5HSVGh8Ty5QpVfQO
 1Jaq6y/k3ViGNUwz1gBobFmhfmRewJAVzcALUJ0Axh/Ntg2U6GjvvqyYZaMMrVwemixhR7MNF8G
 RUP1sE0lB0a+A68+6sOcWNX4yDURBPnPq8pYhmj/wSax/1DDtvJ0Guki5HqT6fU2UxeOLa+8S1h
 H9aR5uKiFzMjo4noG+Q==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02e591 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=01_sZfdKZkNv7EaSDHAA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120085
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 08:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126863

Please merge these changes in whinlatter. Tested locally and on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1512

This is the last pull request for whinlatter and the branch will not be
maintained any more.

The following changes since commit d861698ab8d4bbdda13f93747390f3f095f1f48f:

  lshw: Fix binmerge (2026-04-24 21:13:21 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to f52f32952cb9717949f8bc3d3ccf6c4c5a59521f:

  wolfssl: patch CVE-2026-5778 (2026-05-08 07:28:45 +0530)

----------------------------------------------------------------

Ankur Tyagi (11):
  lcms: patch CVE-2026-41254
  libcoap: patch CVE-2026-29013
  python3-django: upgrade 4.2.29 -> 4.2.30
  wolfssl: patch CVE-2026-1005
  wolfssl: patch CVE-2026-3580
  wolfssl: patch CVE-2026-5188
  wolfssl: patch CVE-2026-5392
  wolfssl: patch CVE-2026-5446
  wolfssl: patch CVE-2026-5447
  wolfssl: patch CVE-2026-5772
  wolfssl: patch CVE-2026-5778

Bartosz Golaszewski (3):
  libgpiod: update to v2.2.3
  libgpiod: update to v2.2.4
  python3-gpiod: update to v2.4.2

Changqing Li (1):
  libsoup-2.4: fix several CVEs

Gyorgy Sarvari (6):
  protobuf, python3-protobuf: ignore CVE-2026-6409
  python3-grpcio: ignore CVE-2026-33186
  freeipmi: mark CVE-2026-33554 patched
  nodejs: mark CVE-2026-21710 patched
  xdg-dbus-proxy: upgrade 0.1.6 -> 0.1.7
  python3-django: upgrade 5.2.12 -> 5.2.13

Mingli Yu (1):
  python3-ecdsa: Upgrade 0.19.1 -> 0.19.2

Wang Mingyu (5):
  python3-werkzeug: upgrade 3.1.6 -> 3.1.7
  python3-werkzeug: upgrade 3.1.7 -> 3.1.8
  python3-tzdata: upgrade 2025.2 -> 2025.3
  python3-tzdata: upgrade 2025.3 -> 2026.1
  python3-bitarray: upgrade 3.8.0 -> 3.8.1

 .../wolfssl/files/CVE-2026-1005.patch         |  83 ++++
 .../wolfssl/files/CVE-2026-3580.patch         | 425 ++++++++++++++++++
 .../wolfssl/files/CVE-2026-5188.patch         | 101 +++++
 .../wolfssl/files/CVE-2026-5392.patch         |  33 ++
 .../wolfssl/files/CVE-2026-5446-1.patch       |  62 +++
 .../wolfssl/files/CVE-2026-5446-2.patch       |  27 ++
 .../wolfssl/files/CVE-2026-5447.patch         |  65 +++
 .../wolfssl/files/CVE-2026-5772-1.patch       |  25 ++
 .../wolfssl/files/CVE-2026-5772-2.patch       |  35 ++
 .../wolfssl/files/CVE-2026-5778.patch         |  38 ++
 .../wolfssl/wolfssl_5.8.0.bb                  |  10 +
 .../libcoap/libcoap/CVE-2026-29013.patch      |  86 ++++
 .../libcoap/libcoap_4.3.5a.bb                 |   1 +
 .../recipes-devtools/nodejs/nodejs_22.22.2.bb |   1 +
 .../protobuf/protobuf_6.31.1.bb               |   1 +
 .../freeipmi/freeipmi_1.6.17.bb               |   1 +
 .../lcms/lcms/CVE-2026-41254_1.patch          |  30 ++
 .../lcms/lcms/CVE-2026-41254_2.patch          |  36 ++
 meta-oe/recipes-support/lcms/lcms_2.16.bb     |   5 +-
 .../{libgpiod_2.2.2.bb => libgpiod_2.2.4.bb}  |   2 +-
 .../libsoup/libsoup-2.4/CVE-2025-14523.patch  |  52 +++
 .../libsoup-2.4/CVE-2025-32049-1.patch        | 229 ++++++++++
 .../libsoup-2.4/CVE-2025-32049-2.patch        | 131 ++++++
 .../libsoup/libsoup-2.4/CVE-2026-1467.patch   | 151 +++++++
 .../libsoup/libsoup-2.4/CVE-2026-1539.patch   |  31 ++
 .../libsoup/libsoup-2.4/CVE-2026-1760.patch   | 153 +++++++
 .../libsoup/libsoup-2.4/CVE-2026-1761.patch   |  36 ++
 .../libsoup/libsoup-2.4/CVE-2026-1801.patch   | 126 ++++++
 .../libsoup/libsoup-2.4/CVE-2026-2369.patch   |  33 ++
 .../libsoup/libsoup-2.4/CVE-2026-2443.patch   | 135 ++++++
 .../libsoup/libsoup-2.4_2.74.3.bb             |  10 +
 ...proxy_0.1.6.bb => xdg-dbus-proxy_0.1.7.bb} |   6 +-
 ...ray_3.8.0.bb => python3-bitarray_3.8.1.bb} |   2 +-
 ...ngo_4.2.29.bb => python3-django_4.2.30.bb} |   2 +-
 ...ngo_5.2.12.bb => python3-django_5.2.13.bb} |   2 +-
 ...cdsa_0.19.1.bb => python3-ecdsa_0.19.2.bb} |   2 +-
 ...-gpiod_2.4.1.bb => python3-gpiod_2.4.2.bb} |   2 +-
 .../python/python3-grpcio_1.76.0.bb           |   1 +
 .../python/python3-protobuf_6.33.5.bb         |   1 +
 ...ata_2025.2.bb => python3-tzdata_2026.1.bb} |   2 +-
 ...eug_3.1.6.bb => python3-werkzeug_3.1.8.bb} |   2 +-
 41 files changed, 2165 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-1005.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-3580.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5188.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5392.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5446-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5447.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5772-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2026-5778.patch
 create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/CVE-2026-29013.patch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_1.patch
 create mode 100644 meta-oe/recipes-support/lcms/lcms/CVE-2026-41254_2.patch
 rename meta-oe/recipes-support/libgpiod/{libgpiod_2.2.2.bb => libgpiod_2.2.4.bb} (98%)
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-14523.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-1.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2025-32049-2.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1467.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1539.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1760.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1761.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-1801.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2369.patch
 create mode 100644 meta-oe/recipes-support/libsoup/libsoup-2.4/CVE-2026-2443.patch
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.6.bb => xdg-dbus-proxy_0.1.7.bb} (75%)
 rename meta-python/recipes-devtools/python/{python3-bitarray_3.8.0.bb => python3-bitarray_3.8.1.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.29.bb => python3-django_4.2.30.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.12.bb => python3-django_5.2.13.bb} (60%)
 rename meta-python/recipes-devtools/python/{python3-ecdsa_0.19.1.bb => python3-ecdsa_0.19.2.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.1.bb => python3-gpiod_2.4.2.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2025.2.bb => python3-tzdata_2026.1.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.6.bb => python3-werkzeug_3.1.8.bb} (90%)

-- 
2.53.0


