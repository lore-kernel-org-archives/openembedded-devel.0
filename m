Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAFCFD064D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 07:36:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15588.1773214589066443059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 00:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=kiWhXcos;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=KRYA2piV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B7RjKK1265796
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 07:36:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JrWHmJKcjMllLzdW5oVG+/uV76ssOyxeJfq
	fb/x4I/U=; b=kiWhXcos59UJ/OWI075T0O6BRnEpZipLFyNgykeqpi2kA8IrxqL
	L42d5hDtBEJ4UrRNwCC32CJ6B2LHnB4qmjW/7m3tRctALF4FGt/z8Iqst2IBBZ0s
	NG2EuBG9kH6DRccVf63lMKpxa3XC8600M/lvau+kUKI0HxlTWFZYCtjGaE9gu7FL
	DHIWwNjeSUZBOCy706F4cB0oIJU4s9N3L7C95TZ26aGnOpBEdWud3ZOk90tc4nRV
	cFY/nMtRUoZijuEkCfH5pTpk6iOn+2daXUYn9F1bz2XVWr7khiwdB/R3tCp4S484
	lUqBfASpzWTZ3pvia3DeESd6Q4K7z3o45IA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfju21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 07:36:28 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c738bebd53fso22657155a12.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773214587; x=1773819387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JrWHmJKcjMllLzdW5oVG+/uV76ssOyxeJfqfb/x4I/U=;
        b=KRYA2piVvvDtq1CDENF5n/R37badEbDtvC/2BMybaDb7GOja8E+/+fvjKU2F+MvWRv
         rINBOr1/xFv5SGYeZ1QefbNhCql5LPf1FAM+8GvBn/GtCXa0fKee2uw4Q1Xsrw+kDoSx
         EcBSZVMuMlac6vjXrYcknybV1c6R3yG+Ya5u6bpxD/oZmu5P11l2lsgM7md49DVOGxdP
         XPWP5mzpHG8JWXyiuNgIzl6mAaMgoB9QtmGZDsrMlVoJpnyBhrO4KVXt47PnGR15R+hn
         oRcmYeQtEmte0uV9w8PGo/O3DGO9F+UL1BENzR+B3XFLlFlp/m5iuKkCvbImxkEyz9xU
         PHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773214587; x=1773819387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JrWHmJKcjMllLzdW5oVG+/uV76ssOyxeJfqfb/x4I/U=;
        b=REzsN8pkJaOqMqqcHzQhwXCpUCPi1JRcn2OG+Vpgh60H+JA17q/9NmkY5QPkWsS7+q
         fWidaUNN75BpVIWaDeK4jRJp1gg4plqvh3Q8x4qYk1goR/gDe/hje0C8YYqfcjDjiIvM
         /qoeB/Gnwvj6zxZaeqWYxsDiG6xDRhEG3ULCdsJdLUrX2TPIogXF0sxSiYs3nlcybVXt
         I94dSup+SXx8RT92JJO5jnaFocz+X/hERHA4EHk1Hd118y+EiNZbducdpii5nUcJ+oeG
         2sckGtBHnSE8s+UCYluhE4/q0yknb/l/bcdwA/eEWp5DRCurxfIhicIS64HINqEJqeto
         OIag==
X-Forwarded-Encrypted: i=1; AJvYcCVMdXktGpLTtubE9ZXVwJVnLGFi1YqG6dkoXYh+xynh3INbkdesnJz97IvAQjDxPXakZHP/GlZ1nrMxE9R64fdw7k4=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzsn6kWDU5tlUt3R0Swi1UlNXE59gE/A4JQJsJMjNTAAsvWdTuw
	UVB5jqp4+DwSMHja6aY0JqJNmjahbYON52AoF2ZJdbF6+GRemfN5Z9/jvs1Cruo5XCE6UeeXipy
	95wxVAjTFpmJmE0AlS7rYJjF5gzkwU33RClcp1i1O4nsWlzZ6u99xKOWoTaoKgd+VFxMew1iwaR
	AvBC/dsQXF
X-Gm-Gg: ATEYQzzgWOcLOAjQjDQTNDpDUzgqTbcy002ifJ39oKJ4ESqVGYt51m+ZZWz9/lM+Ms1
	OBZs88voj/wUF4y9OTlGmbelJZ+VxB7yxabK1c32kJb7xkAGQAqiJiq4kVGDXsBpn9Vpz1lRWyI
	J1M7n9T1Bg4AZDArFXKqRw2gmxRES7i2TeWIgJaIZswXYhIciQfSsBGBnKliQ+aJGLsXoRgaD1W
	E2LOSxiOafCz5IVBxMnFl/e+2uEWSlXHu98HtWqWwpNQTxrBD10/1MQUxrGTn73CunnDGEfjuZJ
	2XTNg8lzIQyqUv93INKnxMsslweqhG8nJPK9eKRHX6z4joy/2/AXDYXZoYO+5kVlmK+fVD5x+RP
	IBoVwmS8FvjDzDgI9kMZ7Ft6enEHK+H2+PQENI1rHnybz9uc1v3Iz
X-Received: by 2002:a05:6a00:7484:b0:829:803e:678b with SMTP id d2e1a72fcca58-829f70fa194mr1447130b3a.54.1773214587376;
        Wed, 11 Mar 2026 00:36:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:7484:b0:829:803e:678b with SMTP id d2e1a72fcca58-829f70fa194mr1447103b3a.54.1773214586767;
        Wed, 11 Mar 2026 00:36:26 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc83cfsm1393618b3a.7.2026.03.11.00.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:36:26 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/45] Whinlatter pull request
Date: Wed, 11 Mar 2026 13:06:18 +0530
Message-ID: <cover.1773213012.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: sQVjt-GEIn05KYw2d4CBpxFGssGeMqOs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA2MyBTYWx0ZWRfX8EF2rEshVrvq
 db1NKQQPdQculKX/gutMsBrszHwBTgN1bdJE2rNdXHTeNsiO69Yeq0Um+3Nl3TyPPf9Gf0gy5BS
 SXG+HBLDz0g8y9nFTOiAETMRnmBNNgrw/NFEXY7r8s9t7Pa/LnV3K2RxJ3xiLpZTcWj6m9BY7R4
 BF1DCMSZzkb9Qq5ZwNnJgRtzLsMF5gQiq6oHOJylCICsclUGrnlC56WJRm1EeXH48ntt0xaOwyr
 O11qdcfAwi/szpv74ynUvxOb6lTmTNGuMGqP+MXduso4XxD/r/WgoxNdO71D9E0haBHSDD94dTc
 +eWaaKNI9X6khoo3jmxCFtp1MGJhe8qNqM7Og77ZkFUbYSZI1Kp/S2mycdHk6M7SUq/epsGC3RF
 YYB576PloVCRnZ9TBQqbhSLbQKoWaO/BJk2y4WghZ04Z42KNRvDlQvxHkVj2ZMU/xBH3slxE/6U
 /t31Rj3bM3eHucgsn/Q==
X-Proofpoint-ORIG-GUID: sQVjt-GEIn05KYw2d4CBpxFGssGeMqOs
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b11b7c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=3VtVgfPWLLr2lWB8dpwA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 07:36:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125063

Please merge these changes in whinlatter. Tested on autobuilder and
locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1345

The following changes since commit 12fc4c6584e001f89108a6691ccf2028eb05ed5a:

  tomoyo-tools: update SRC_URI (2026-02-24 18:46:45 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

Ankur Tyagi (12):
  wolfssl: patch CVE-2025-13912
  wolfssl: patch CVE-2025-7395
  wolfssl: patch CVE-2025-7394
  postgresql: upgrade 17.7 -> 17.8
  libjxl: upgrade 0.11.1 -> 0.11.2
  xrdp: patch CVE-2025-68670
  valkey: upgrade 8.1.4 -> 8.1.6
  python3-greenlet: upgrade 3.2.4 -> 3.2.5
  libde265: upgrade 1.0.15 -> 1.0.16
  frr: upgrade 10.4.2 -> 10.4.3
  nopoll: upgrade 0.4.7.b429 -> 0.4.9.b462
  open62541: upgrade 1.3.15 -> 1.3.17

Anuj Mittal (1):
  systemd-netlogd: upgrade 1.4.4 -> 1.4.5

Daniel Klauer (1):
  nbench-byte: Fix sysinfo generation in parallel build

Gyorgy Sarvari (17):
  nginx: patch CVE-2026-1642
  openjpeg: patch CVE-2023-39327
  protobuf: ignore CVE-2026-0994
  gnome-shell: ignore CVE-2021-3982
  gimp: ignore already fixed CVEs
  minidlna: ignore CVE-2024-51442
  python3-werkzeug: upgrade 3.1.5 -> 3.1.6
  libheif: patch CVE-2025-68431
  python3-nltk: upgrade 3.9.2 -> 3.9.3
  python3-pillow: patch CVE-2026-25990
  streamripper: ignore CVE-2020-37065
  unbound: patch CVE-2025-5994
  python3-protobuf: mark CVE-2026-0994 patched
  exiftool: ignore CVE-2026-3102
  libmediaart-2.0: upgrade 1.9.6 -> 1.9.7
  libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched
  zabbix: mark CVE-2026-23925 as patched

Jason Schonberg (1):
  nopoll: Upgrade to 0.4.7.b429

Leon Anavi (3):
  python3-filelock: Upgrade 3.20.1 -> 3.20.2
  python3-filelock: Upgrade 3.20.2 -> 3.20.3
  python3-flask: Upgrade 3.1.2 -> 3.1.3

Liu Yiding (2):
  networkmanager: upgrade 1.52.0 -> 1.52.2
  networkmanager-openvpn: upgrade 1.12.3 -> 1.12.5

Markus Volk (1):
  pipewire: update 1.4.9 -> 1.4.10

Peter Kjellerstedt (1):
  ceres-solver: Don't fail if .git/hooks/commit-msg can't be touched

Tafil Avdyli (1):
  python3-pybind11-json: fix Targets.cmake trying to reference host

Wang Mingyu (5):
  python3-filelock: upgrade 3.20.0 -> 3.20.1
  python3-sqlparse: upgrade 0.5.4 -> 0.5.5
  imagemagick: upgrade 7.1.2-13 -> 7.1.2-15
  libcacard: upgrade 2.8.1 -> 2.8.2
  postfix: upgrade 3.10.6 -> 3.10.8

 meta-gnome/recipes-gimp/gimp/gimp_3.0.8.bb    |   5 +-
 .../gnome-shell/gnome-shell_48.3.bb           |   1 +
 ...{libde265_1.0.15.bb => libde265_1.0.16.bb} |   4 +-
 .../libheif/libheif/CVE-2025-68431.patch      |  26 ++
 .../libheif/libheif_1.20.2.bb                 |   4 +-
 .../recipes-multimedia/minidlna/minidlna.inc  |   1 +
 .../{pipewire_1.4.9.bb => pipewire_1.4.10.bb} |   2 +-
 .../streamripper/streamripper_1.64.6.bb       |   2 +
 ...-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb} |   2 +-
 ....3.bb => networkmanager-openvpn_1.12.5.bb} |   4 +-
 ...ger_1.52.0.bb => networkmanager_1.52.2.bb} |   4 +-
 .../wolfssl/files/CVE-2025-13912.patch        | 439 ++++++++++++++++++
 .../wolfssl/files/CVE-2025-7394-1.patch       |  46 ++
 .../wolfssl/files/CVE-2025-7394-2.patch       | 276 +++++++++++
 .../wolfssl/files/CVE-2025-7394-3.patch       | 125 +++++
 .../wolfssl/files/CVE-2025-7394-4.patch       |  88 ++++
 .../wolfssl/files/CVE-2025-7394-5.patch       |  42 ++
 .../wolfssl/files/CVE-2025-7394-6.patch       |  49 ++
 .../wolfssl/files/CVE-2025-7395-1.patch       |  85 ++++
 .../wolfssl/files/CVE-2025-7395-2.patch       |  28 ++
 .../wolfssl/files/CVE-2025-7395-3.patch       |  26 ++
 .../wolfssl/files/CVE-2025-7395-4.patch       |  27 ++
 .../wolfssl/wolfssl_5.8.0.bb                  |  11 +
 .../{postfix_3.10.6.bb => postfix_3.10.8.bb}  |   2 +-
 .../frr/{frr_10.4.2.bb => frr_10.4.3.bb}      |   2 +-
 ...oll_0.4.6.b400.bb => nopoll_0.4.9.b462.bb} |   3 +-
 ...pen62541_1.3.15.bb => open62541_1.3.17.bb} |   2 +-
 ...{libcacard_2.8.1.bb => libcacard_2.8.2.bb} |   4 +-
 .../unbound/unbound/CVE-2025-5994.patch       | 279 +++++++++++
 .../recipes-support/unbound/unbound_1.22.0.bb |   1 +
 ...sysinfo-generation-in-parallel-build.patch |  69 +++
 .../sysinfo.sh-Fix-typo-in-rm-command.patch   |  27 ++
 .../nbench-byte/nbench-byte_2.2.3.bb          |   4 +-
 .../zabbix/zabbix_7.0.19.bb                   |   2 +
 .../files/0001-tcl.m4-Recognize-tclsh9.patch  |   2 +-
 .../files/0002-Improve-reproducibility.patch  |   9 +-
 ...c-bypass-autoconf-2.69-version-check.patch |   6 +-
 ...-config_info.c-not-expose-build-info.patch |   4 +-
 ...gresql-fix-ptest-failure-of-sysviews.patch |   5 +-
 .../postgresql/files/not-check-libperl.patch  |   6 +-
 ...{postgresql_17.7.bb => postgresql_17.8.bb} |   4 +-
 .../recipes-devtools/perl/exiftool_13.42.bb   |   2 +
 .../protobuf/protobuf_6.31.1.bb               |   2 +
 .../{valkey_8.1.4.bb => valkey_8.1.6.bb}      |   4 +-
 .../openjpeg/openjpeg/CVE-2023-39327.patch    |  50 ++
 .../openjpeg/openjpeg_2.5.4.bb                |   1 +
 .../{libjxl_0.11.1.bb => libjxl_0.11.2.bb}    |   7 +-
 .../ceres-solver/ceres-solver_2.2.0.bb        |   2 +-
 ...ck_7.1.2-13.bb => imagemagick_7.1.2-15.bb} |   2 +-
 ...logd_1.4.4.bb => systemd-netlogd_1.4.5.bb} |   4 +-
 .../xrdp/xrdp/CVE-2025-68670.patch            |  78 ++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |   1 +
 ...k_3.20.0.bb => python3-filelock_3.20.3.bb} |   2 +-
 ...-flask_3.1.2.bb => python3-flask_3.1.3.bb} |   4 +-
 ...let_3.2.4.bb => python3-greenlet_3.2.5.bb} |   2 +-
 .../python3-pillow/CVE-2026-25990.patch       | 151 ++++++
 .../python/python3-pillow_12.0.0.bb           |   5 +
 .../python/python3-protobuf_6.33.5.bb         |   1 +
 ...p-PYTHON_INCLUDE_DIRS-from-interface.patch |  34 ++
 .../python/python3-pybind11-json_0.2.15.bb    |   3 +-
 ...rse_0.5.4.bb => python3-sqlparse_0.5.5.bb} |   2 +-
 ...eug_3.1.5.bb => python3-werkzeug_3.1.6.bb} |   2 +-
 ...n3-nltk_3.9.2.bb => python3-nltk_3.9.3.bb} |   2 +-
 .../nginx/files/CVE-2026-1642.patch           |  46 ++
 .../recipes-httpd/nginx/nginx_1.29.1.bb       |   1 +
 65 files changed, 2082 insertions(+), 54 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.15.bb => libde265_1.0.16.bb} (90%)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2025-68431.patch
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.4.9.bb => pipewire_1.4.10.bb} (99%)
 rename meta-multimedia/recipes-support/libmediaart/{libmediaart-2.0_1.9.6.bb => libmediaart-2.0_1.9.7.bb} (90%)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.12.3.bb => networkmanager-openvpn_1.12.5.bb} (91%)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.52.0.bb => networkmanager_1.52.2.bb} (99%)
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-13912.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-4.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-5.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7394-6.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-1.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-2.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-3.patch
 create mode 100644 meta-networking/recipes-connectivity/wolfssl/files/CVE-2025-7395-4.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.6.bb => postfix_3.10.8.bb} (99%)
 rename meta-networking/recipes-protocols/frr/{frr_10.4.2.bb => frr_10.4.3.bb} (99%)
 rename meta-networking/recipes-protocols/nopoll/{nopoll_0.4.6.b400.bb => nopoll_0.4.9.b462.bb} (84%)
 rename meta-networking/recipes-protocols/opcua/{open62541_1.3.15.bb => open62541_1.3.17.bb} (98%)
 rename meta-networking/recipes-support/spice/{libcacard_2.8.1.bb => libcacard_2.8.2.bb} (82%)
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2025-5994.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/Makefile-Fix-sysinfo-generation-in-parallel-build.patch
 create mode 100644 meta-oe/recipes-benchmark/nbench-byte/nbench-byte/sysinfo.sh-Fix-typo-in-rm-command.patch
 rename meta-oe/recipes-dbs/postgresql/{postgresql_17.7.bb => postgresql_17.8.bb} (76%)
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.4.bb => valkey_8.1.6.bb} (97%)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.11.1.bb => libjxl_0.11.2.bb} (90%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-13.bb => imagemagick_7.1.2-15.bb} (99%)
 rename meta-oe/recipes-support/systemd-netlogd/{systemd-netlogd_1.4.4.bb => systemd-netlogd_1.4.5.bb} (91%)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2025-68670.patch
 rename meta-python/recipes-devtools/python/{python3-filelock_3.20.0.bb => python3-filelock_3.20.3.bb} (87%)
 rename meta-python/recipes-devtools/python/{python3-flask_3.1.2.bb => python3-flask_3.1.3.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.2.4.bb => python3-greenlet_3.2.5.bb} (81%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pybind11-json/0001-CMakeLists-drop-PYTHON_INCLUDE_DIRS-from-interface.patch
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.4.bb => python3-sqlparse_0.5.5.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb} (90%)
 rename meta-python/recipes-devtools/python3-nltk/{python3-nltk_3.9.2.bb => python3-nltk_3.9.3.bb} (88%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch

-- 
2.53.0


