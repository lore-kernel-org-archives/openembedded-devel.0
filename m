Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D916E9B26D
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:20:00 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21331.1771942794352787201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 06:19:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=k9vw+xRn;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ZCXQ0yFN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OAFQY43570192
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 14:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=YbLM1IxrRQ9UKZDAbI9msQmpTUctqUbHdlZ
	FQKxIYYk=; b=k9vw+xRn0xU1M1U+E6vooSSBcHkHc3+y/uZxiFDHEUAzp2Do4sG
	t1Vk07ZN4B7YQfWOTsU8T61MkPST04pLtlPBaAlWuRi7UMZ9tNkDMNE8n6aM7d4m
	PNHd8HWKvoG8ALFN4ygW43lYzJEwty2LIGJNDPk/F8HvQ+Zqv2uootIXj0Xcjisl
	Dp8ipH0Gg+pL91Fg1DVW7zZ6/gpQWbUWO5impZGrry5r9+LKUwnLm8f+npgGryeY
	ji/xLxXegYrpVUOSw3Ns1GjFF/P771J0eVqjcBitnnurTm6MS3lf3njb42FT+thb
	LkeuvsfkjMJfbOWEBuza5NvXveR3Sxi7xyw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8rcgtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 14:19:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adb085735bso4300185ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 06:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771942793; x=1772547593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YbLM1IxrRQ9UKZDAbI9msQmpTUctqUbHdlZFQKxIYYk=;
        b=ZCXQ0yFNxVhHwOvI1jG/llcVxLVH+Rxi/j2i7eCbTrxHJ6LMQCG4x92RbnnvkgdMuR
         4Zgnya/wbbz1m3iJ6Gqdx9bZx00uaZS1Nh5lX9/Ji8LtAAkUHs3SwmxYQIks0Q14KitL
         aSv77JKVbmdNEJ7UKVbhGjYHeLlqI+L/J2FQZ0t6/ANpap2LqjU/2QAiNFXw+H2xrw5W
         Fig1KGj6eHvY+eBru2wOwaTh0DUiwY0uOee+6jhSH8ysTMD1+q7DacsDJP9hzFrVsA4j
         b1kLJOZ8LnCfIW54llkGhY/NnHVyPgQ97fdTctENLNidSpVdxB6BH+OzLbjyaylFqhPS
         S9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771942793; x=1772547593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbLM1IxrRQ9UKZDAbI9msQmpTUctqUbHdlZFQKxIYYk=;
        b=nrbvHqCQqHPYlL8xoOoWpSuK+w7MUIzNRf0usKRZbS0I3uW/0/cG3NLyoh6vF0q1RI
         e62PXuFaoWw2kQCTOXdd5a/wZxRW7LMQPDIcF0RQaCuVoFWK9D2J5VjKh45tPy8Phu0/
         jXsmC+Ibvhy0YC4Wx4lgMGW5L0thC0IwLbs17Oe2Dr01sczDd+wVGtd96HZnBoIUvtux
         PlQBwp8nbflTJ4uNFFRxDHYSfzhLFfuLvCvTveGPDzeWvJVN4GUyTvGjDzLXmr41vqfV
         SyTUnhMKx0fnwNNhnDATVhs2pLva8p3eH2utMcceYlKrOzOAJ/KYsaH7Csfp1LxWbByl
         ThOA==
X-Gm-Message-State: AOJu0YxIN5QlMhnbAcs5Sp8Qn30gAI/njWTWzd9/X4ixqNvodzbnw8sD
	ADUJJjn0OstLd3N1iGvqE6is/h37wi2sOvfQg/zLfDMlv0f6B49mC9MnSvJtTx0FoZ6f1uZmtF3
	L1HmJmNonMTDCdXKs9+dEXidx12mLa3e0IcloYVblFH+c2m97FzbV4LMaln5f5WtSGJMeSt2V8n
	YbtLuIq4xwmvHOR2zUU1I=
X-Gm-Gg: ATEYQzw8zH6MzySUNaBFQ1lS0WCDI9JkTl7yYIL1HFERTWfhOrf8ejhog7uk8rU/pGM
	wTizr467L9HCl/yGPhpwKjRwK163ewem22SbS5o/stX1pqJqBQIPdTBRJnUhXEJJ6yvsP/HQimH
	Fp5ibOrtoTgARFCdE53hCuyPQeosoLV/g5fy7Tq97aa7zj4s45MDaMtbq0IK1S5hEISsOOkojSW
	QCrceoG0d0kLoaPcDHjlAzyiy1QwkJK4dh2u/PzoD5l5qlmTvXLfFIfgJKMYfOwHjhZ7p+t1WiT
	KZ1CsA+SM2RESUKYvtjXPozR8EtmxImKxe6ecvLC+0MVOFF0Sl5xH+oU4bKmfGcIFVAPj63zvFm
	yvFiDMGZLKjqN+tzblz1ZzNyHlbk8+78x/gPoQLoO1ldqYiMBZQ2W
X-Received: by 2002:a17:903:2388:b0:2aa:fc73:98ac with SMTP id d9443c01a7336-2ad7455f3d6mr104620595ad.49.1771942793009;
        Tue, 24 Feb 2026 06:19:53 -0800 (PST)
X-Received: by 2002:a17:903:2388:b0:2aa:fc73:98ac with SMTP id d9443c01a7336-2ad7455f3d6mr104620265ad.49.1771942792278;
        Tue, 24 Feb 2026 06:19:52 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71a7351sm11671420a12.8.2026.02.24.06.19.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 06:19:51 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/36] Whinlatter pull request
Date: Tue, 24 Feb 2026 19:49:37 +0530
Message-ID: <cover.1771939291.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _mMMS5vlXNw2GmMKM1SU5cs1ChYn1mnc
X-Authority-Analysis: v=2.4 cv=V7twEOni c=1 sm=1 tr=0 ts=699db389 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=O24Aq5uEAAAA:8 a=eHGge6PBmljtkPBd4GYA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=SYBONWESK5muIIdMMRMZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDExOCBTYWx0ZWRfX+In706rzMqx2
 0BHy2bHgGUmDZY8bq8Jk4MlZXIHbBh1txfpGqj++Ty8q2g7czeyuRoPGUDMs0GtQqn6Rp7f11V6
 RTLdgzAhxPQu1MQk4JqjCg6qrBJgvvZO1xshFihJNfpBBSjPKa07tTQCClTAmgQY/E9HVA59d/j
 hPxHCodpTKZUr/cMDIERaHoNIDYkpF5xo7Bk3iqWpBSq4SifBl/Z7BaSSfJJtd7HbdPzFix0qw/
 mSwC0tejglXUKR2LhRRey1ShW7JfQY71pl1kTtpHS3hGi9H+SGtCpz3CqouCoS4aw/cjhvxRPCS
 Dt0BAkRyJwD2qRVJ2HNMEO+pHUHu6vKgNBink7rtkiAlzpqbrT+dFVMr95DtOm9B9/MWbMBlIoD
 ia2xIW5RWnLNtE8s0nAjnI9p/uhYd2r/pGz3Lm2aMeyjtUQlh4BYLjAbDobLYHldYdr6EBXkj9E
 nLeZFdyq+IttFMY/Ltg==
X-Proofpoint-GUID: _mMMS5vlXNw2GmMKM1SU5cs1ChYn1mnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_02,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 14:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124582

Please merge these changes in whinlatter. Tested locally with
qemux86/qemux86-64/qemuarm/qemuarm64 and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1319

The following changes since commit d28d0a23615f4d91d125fdcd247a71245087dab3:

  Use https when accessing archive.xfce.org (2026-02-05 06:59:42 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

Ankur Tyagi (1):
  tomoyo-tools: update SRC_URI

Gyorgy Sarvari (23):
  python3-cbor2: patch CVE-2025-68131
  python3-flask-cors: upgrade 4.0.0 -> 4.0.2
  python3-ldap: upgrade 3.4.4 -> 3.4.5
  python3-lief: upgrade 0.17.1 -> 0.17.2
  python3-m2crypto: ignore CVE-2009-0127
  python3-m2crypto: mark CVE-2020-25657 as patched
  python3-orjson: upgrade 3.10.17 -> 3.10.18
  python3-py: ignore CVE-2022-42969
  python3-pyjwt: ignore CVE-2025-45768
  python3-twitter: mark CVE-2012-5825 patched
  python3-uvicorn: mark CVE-2020-7694 patched
  python3-virtualenv: patch CVE-2026-22702
  python3-werkzeug: upgrade 3.1.4 -> 3.1.5
  raptor2: patch CVE-2024-57822 and CVE-2024-57823
  redis: ignore CVE-2025-46686
  python3-python-multipart: patch CVE-2026-24486
  wireshark: patch CVE-2026-0962
  gnome-desktop: upgrade 44.1 -> 44.4
  python3-django: upgrade 5.2.9 -> 5.2.11
  python3-django: upgrade 4.2.27 -> 4.2.28
  libx86-1: upgrade 1.1 -> 1.1.1
  paho-mqtt-c: upgrade 1.3.14 -> 1.3.15
  nginx: upgrade 1.28.1 -> 1.28.2

Jason Schonberg (2):
  usbids: upgrade 2025.09.15 -> 2025.12.13
  php: upgrade 8.4.17 -> 8.4.18

Liu Yiding (1):
  minizip-ng: 4.0.8 -> 4.0.10

Markus Volk (1):
  libsdl2-compat: update 2.32.58 -> 2.32.62

Tero Kinnunen (1):
  python3-watchdog: Remove obsolete dependencies

Wang Mingyu (7):
  python3-marshmallow: upgrade 4.1.0 -> 4.1.1
  python3-marshmallow: upgrade 4.1.1 -> 4.1.2
  python3-tornado: upgrade 6.5.2 -> 6.5.3
  python3-tornado: upgrade 6.5.3 -> 6.5.4
  python3-werkzeug: upgrade 3.1.3 -> 3.1.4
  cryptsetup: upgrade 2.8.3 -> 2.8.4
  libtracefs: upgrade 1.8.2 -> 1.8.3

 ...-desktop_44.1.bb => gnome-desktop_44.4.bb} |   2 +-
 .../wireshark/files/CVE-2026-0962.patch       | 131 +++++
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 ...rror-due-to-bool-keyword-with-gcc-15.patch |  37 --
 ...mqtt-c_1.3.14.bb => paho-mqtt-c_1.3.15.bb} |   5 +-
 ...0001-crypt.h-Remove-register-keyword.patch |  35 --
 ...nizip-ng_4.0.8.bb => minizip-ng_4.0.10.bb} |   3 +-
 ...ryptsetup_2.8.3.bb => cryptsetup_2.8.4.bb} |   2 +-
 .../php/{php_8.4.17.bb => php_8.4.18.bb}      |   2 +-
 ...efine-CARD32-as-uint-as-it-is-32-bit.patch |   0
 .../0001-assume-zero-is-valid-address.patch   |   0
 ...-type-of-the-void-pointer-assignment.patch |  33 --
 .../libx86-1.1/libx86-mmap-offset.patch       | 192 -------
 .../libx86-1.1/makefile-add-ldflags.patch     |  17 -
 .../{libx86-1_1.1.bb => libx86-1_1.1.1.bb}    |   9 +-
 .../recipes-extended/redis/redis_6.2.21.bb    |   1 +
 .../recipes-extended/redis/redis_7.2.12.bb    |   1 +
 ...t_2.32.58.bb => libsdl2-compat_2.32.62.bb} |   2 +-
 ...ibtracefs_1.8.2.bb => libtracefs_1.8.3.bb} |   2 +-
 .../tomoyo-tools/tomoyo-tools_2.6.1.bb        |   3 +-
 .../raptor2/raptor2/CVE-2024-57822.patch      |  44 ++
 .../raptor2/raptor2/CVE-2024-57823.patch      |  31 ++
 .../recipes-support/raptor2/raptor2_2.0.16.bb |   2 +
 ...ids_2025.09.15.bb => usbids_2025.12.13.bb} |   4 +-
 .../python/python3-cbor2/CVE-2025-68131.patch | 515 ++++++++++++++++++
 .../python/python3-cbor2_5.7.1.bb             |   1 +
 ...ngo_4.2.27.bb => python3-django_4.2.28.bb} |   2 +-
 ...ango_5.2.9.bb => python3-django_5.2.11.bb} |   2 +-
 .../python3-flask-cors/CVE-2024-6221.patch    | 110 ----
 ...s_4.0.0.bb => python3-flask-cors_4.0.2.bb} |   8 +-
 ...-lief_0.17.1.bb => python3-lief_0.17.2.bb} |   2 +-
 .../python/python3-m2crypto_0.46.2.bb         |   3 +
 ..._4.1.0.bb => python3-marshmallow_4.1.2.bb} |   2 +-
 ...n_3.10.17.bb => python3-orjson_3.10.18.bb} |   2 +-
 .../python/python3-py_1.11.0.bb               |   2 +
 .../python/python3-pyjwt_2.10.1.bb            |   2 +
 .../CVE-2026-24486.patch                      |  61 +++
 .../python/python3-python-multipart_0.0.20.bb |   1 +
 ...nado_6.5.2.bb => python3-tornado_6.5.4.bb} |   2 +-
 .../python/python3-twitter_4.16.0.bb          |   2 +
 .../python/python3-uvicorn_0.38.0.bb          |   1 +
 .../python3-virtualenv/CVE-2026-22702.patch   |  60 ++
 .../python/python3-virtualenv_20.35.4.bb      |   1 +
 .../python/python3-watchdog_6.0.0.bb          |   9 +-
 ...eug_3.1.3.bb => python3-werkzeug_3.1.5.bb} |   2 +-
 ...n3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb} |   8 +-
 .../{nginx_1.28.1.bb => nginx_1.28.2.bb}      |   2 +-
 47 files changed, 892 insertions(+), 467 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-desktop/{gnome-desktop_44.1.bb => gnome-desktop_44.4.bb} (93%)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0962.patch
 delete mode 100644 meta-oe/recipes-connectivity/paho-mqtt-c/paho-mqtt-c/0001-Fix-build-error-due-to-bool-keyword-with-gcc-15.patch
 rename meta-oe/recipes-connectivity/paho-mqtt-c/{paho-mqtt-c_1.3.14.bb => paho-mqtt-c_1.3.15.bb} (88%)
 delete mode 100644 meta-oe/recipes-core/minizip-ng/minizip-ng/0001-crypt.h-Remove-register-keyword.patch
 rename meta-oe/recipes-core/minizip-ng/{minizip-ng_4.0.8.bb => minizip-ng_4.0.10.bb} (91%)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.3.bb => cryptsetup_2.8.4.bb} (98%)
 rename meta-oe/recipes-devtools/php/{php_8.4.17.bb => php_8.4.18.bb} (99%)
 rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 => libx86-1.1.1}/0001-Define-CARD32-as-uint-as-it-is-32-bit.patch (100%)
 rename meta-oe/recipes-extended/libx86-1/{libx86-1.1 => libx86-1.1.1}/0001-assume-zero-is-valid-address.patch (100%)
 delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/0001-Fix-type-of-the-void-pointer-assignment.patch
 delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/libx86-mmap-offset.patch
 delete mode 100644 meta-oe/recipes-extended/libx86-1/libx86-1.1/makefile-add-ldflags.patch
 rename meta-oe/recipes-extended/libx86-1/{libx86-1_1.1.bb => libx86-1_1.1.1.bb} (74%)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl2-compat_2.32.58.bb => libsdl2-compat_2.32.62.bb} (91%)
 rename meta-oe/recipes-kernel/libtracefs/{libtracefs_1.8.2.bb => libtracefs_1.8.3.bb} (94%)
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57822.patch
 create mode 100644 meta-oe/recipes-support/raptor2/raptor2/CVE-2024-57823.patch
 rename meta-oe/recipes-support/usbids/{usbids_2025.09.15.bb => usbids_2025.12.13.bb} (83%)
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.2.27.bb => python3-django_4.2.28.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.9.bb => python3-django_5.2.11.bb} (60%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
 rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb => python3-flask-cors_4.0.2.bb} (73%)
 rename meta-python/recipes-devtools/python/{python3-lief_0.17.1.bb => python3-lief_0.17.2.bb} (95%)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_4.1.0.bb => python3-marshmallow_4.1.2.bb} (91%)
 rename meta-python/recipes-devtools/python/{python3-orjson_3.10.17.bb => python3-orjson_3.10.18.bb} (84%)
 create mode 100644 meta-python/recipes-devtools/python/python3-python-multipart/CVE-2026-24486.patch
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.2.bb => python3-tornado_6.5.4.bb} (93%)
 create mode 100644 meta-python/recipes-devtools/python/python3-virtualenv/CVE-2026-22702.patch
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.3.bb => python3-werkzeug_3.1.5.bb} (90%)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb} (76%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.28.1.bb => nginx_1.28.2.bb} (66%)

-- 
2.53.0


