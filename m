Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9386D6CFBB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 03:11:44 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59527.1769137897358658032
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 19:11:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=l85XCc1i;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RS3Kfj3G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60MK7Rd23677799
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ofnU1MnQRQMENKAFY/bzU/
	lhRwyDAx7hOCRUfkepKEw=; b=l85XCc1iVaROYFYhHqBA5VRB1NUVwUjsPiL+FJ
	Ka1KDbx9vcEZwj3hFOZ0L/kSNa2vW/Kp5sOjT4vu9fSJhe6n2HsIF+goDaUemf+F
	TuslHp0olS4/u/72i93naCvOKPCWtedznPeSjdStAB57BG5mtQd+XM5bufItnCMw
	fC3upXzIYiakKf64V+5gpTZz0UScpGrhaLCa0wanFd6CmkzAZ3azZ4NauI0fszQO
	zxM8HFYRj3M34QicnO6nRYh0WEGAQ7qWoMuHjdRxNLJVYQKjOUZ+iuh/t2K6BVQ8
	hA1fEe1leJcAEEnj+RZc8Ybe4MaiIHNJMY+CwqvFiC0Kl1Jg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buqyp1nqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:11:36 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f48cec0ccso1404396b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 19:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769137895; x=1769742695; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ofnU1MnQRQMENKAFY/bzU/lhRwyDAx7hOCRUfkepKEw=;
        b=RS3Kfj3GUeM/LDG4lv0xQH+n6DszcR21L8ZjYjjZgX9jIYt2B2YzkhxXwcWegDdlet
         7+k/qmPRsZNC05T3JznkqRRRTZO2NNFzjNNw1Z8h/QzM2JeQiEQuP9f3kt+Ud30HZsql
         mz9CprpnoH5GiblURowjELpbXFZ60yOmqXn0a6rYmijOgByyuxsUn6iptgKIWoddnXmw
         OkyMwN0diPWL+Ao8HwfPsYs2wFrQHk2I94ZWFM37ZzDufseu3E923eDPXNL3xcu955zh
         XpI07GCKHCX9HnQZR6r03vjCorf1qQt6m2zGHyvDC/QoRrOu0Xd9kIEltGmwR9sGG+9V
         +JrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769137895; x=1769742695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofnU1MnQRQMENKAFY/bzU/lhRwyDAx7hOCRUfkepKEw=;
        b=F30PzLA6CLTsHmp7f7bd3ShZ/HwmINi+strTpxruAIUH6IqBVe+7Ry9ehsK+9Z+F8O
         1JnHEGxWoZYttEeuvN2pQb2betvhNbIJ+co3VciNyDjhcPcW6+KZipp1PVy9IHrlOOck
         VLUVVP0HhINRHcYokQKcfRSCYO5FQ4AuWkz/+CzcBQbwtJ/7T9OwAIebOBwGD4rzWEpx
         5epHKj49HdtJYn4T/2/KOBcj046cwaXLUqkNaKcs7Wc+He849DIlw2Kbm5MH9PfUkAy3
         8p9kkhl2bUU5ORmLCcBA0N0Eoysql5LQ4A8gOMjrjtkBK7DjMO6S2eTilqHvJI3hyD64
         osfQ==
X-Gm-Message-State: AOJu0Yxbu9g6Ab9zahsZggd01TnPfTzAUVwabcLl6/YONK49GBkzQMki
	iELrlBOTlSrzBYVkw8ZgBzsmnMNeQ8vqmEkU2X7R++XXx9lKCQXXLdSaffM/ZMPGNEsqoD7xQCU
	k8BfwQ++8wIwHT8vsc287+FdiXbocGn6G0XTcx57SXiGdxuhCvot0IOb4qPBOaDqIemgrUknJTd
	xoKs8qEW325Y4ZqAb26G4=
X-Gm-Gg: AZuq6aJPYbWApMzc+LOvqd0DkNZjiXdpKQVD8jSiO5ocfcf/TXSNdlLUo3HWyymqmXU
	Jgv341zK9mSUIz6kg+/jogWquiQQL2yqXRQbuLKzKIC+vWigJLZEOZBcJOkkXoixxXWfo1rQ6F3
	Oa0T+xzUETvBGiHEqDdebKh31G+fXmCTDpq3RkQ8x+/yS3DKu475fPcBxjwgjISR1UPtvifH1LF
	aoNUCtdkh/lXp7fiuCV/Bh0KsHl3Izn3rjWGZ7QyOUmuFM7+v3QlpZRv/YbuqgoluU+SwFJ7jqB
	nwmg2dxuJQE1yYfbMmYH3GR4CNeFo/QrajWaj3lgNsGjMFmISJkdwJ8hdRkt6IR4vawzD12860I
	tTLIlZ/Ti6ceqepIX55B/6JG74MxMKyW2XRyMxKOG
X-Received: by 2002:a05:6a00:2294:b0:81b:ab6f:2974 with SMTP id d2e1a72fcca58-82317c0e311mr1186807b3a.9.1769137895162;
        Thu, 22 Jan 2026 19:11:35 -0800 (PST)
X-Received: by 2002:a05:6a00:2294:b0:81b:ab6f:2974 with SMTP id d2e1a72fcca58-82317c0e311mr1186797b3a.9.1769137894637;
        Thu, 22 Jan 2026 19:11:34 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82318644890sm700276b3a.5.2026.01.22.19.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 19:11:34 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [PATCH 00/42] Whinlatter pull request
Date: Fri, 23 Jan 2026 08:41:25 +0530
Message-ID: <cover.1769137698.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMy+3oi+ c=1 sm=1 tr=0 ts=6972e6e8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=egktpAuXqWhj32BERbgA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: tXD_jxNIHqLnj3Z7Ft6Ry9gEFuH8MecA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDAxOSBTYWx0ZWRfX62CFNeroxk3p
 mgqsFdUr9SDZDEX3vOHbmqxUcM47LY9OvBfrgau9fOmhI1/jMQ3/daR6LXgb1UqGLwiqoVm/CpY
 x1AoHDurIefbj4VtHwhKI5sD3ANqvAeij5otOO5L5rwGhshfmqCa4h4S+6lRvjzRnjuSEsqW4FT
 +0kt2f2FAlX7TMZAoUkNm4OvNj7n6dOVmfQyR60fkU0OmldOBSnAKgspnWC0rC13a3RPjpNA1FM
 gMpjC/5hm/Yc9SDgVvwtdOz9FxSqVC0TNhd19m4KvihsNbkm4uyrOvXSwcT+OXlDaCqSge0r7l4
 A4iJQaPHDP9wBtGiN34ChuXS5Dss2866CBFNdPuDoUsgeMu3RqiG/YTbu5LtihMm2VK3WSXoKix
 SNTgLXUIKNV3BCgmxpgnfWJ2QoRqhTG+Bb1CLflxkuJ6yk/1NCBBNLJOUGK0mJs6JAGMYORdAma
 hRD25jo0BechBrPniDA==
X-Proofpoint-GUID: tXD_jxNIHqLnj3Z7Ft6Ry9gEFuH8MecA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 03:11:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123760

Please merge these changes in whinlatter. Tested on autobuilder and
locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1259

The following changes since commit c6849e7529727a2c9eca0f9220836bd0d69ce086:

  python3-django: upgrade 5.2.8 -> 5.2.9 (2026-01-06 18:07:59 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

Ankur Tyagi (5):
  php: upgrade 8.4.16 -> 8.4.17
  mozjs-128: Fix build error with arm and musl
  libjxl: Fix build error with arm and musl
  influxdb: ignore CVE-2024-30896
  frr: upgrade 10.4.1 -> 10.4.2

Dmitry Baryshkov (1):
  vulkan-cts: upgrade 1.4.4.0 -> 1.4.4.2

Gyorgy Sarvari (16):
  nodejs: remove extra CVE_PRODUCT
  smarty: extend CVE_PRODUCT
  raptor2: set CVE_PRODUCT
  libcereal: set CVE_PRODUCT
  asyncmqtt: set CVE_PRODUCT
  boinc-client: set CVE_PRODUCT
  boinc-client: mark CVE-2013-2018 patched
  lmdb: patch CVE-2026-22185
  xerces-c: set CVE_PRODUCT
  dante: upgrade 1.4.3 -> 1.4.4
  tinyproxy: patch CVE-2025-63938
  python3-scapy: set CVE_PRODUCT
  nginx: set CVE_PRODUCT
  softhsm: fix SRC_URI branch
  ncp: update SRC_URI
  libowfat: update SRC_URI

Jason Schonberg (1):
  nginx: upgrade 1.28.0 -> 1.28.1

Jiaying Song (1):
  minicoredumper: fix 2038 year problem in timestamp handling

Khem Raj (2):
  vboxguestdrivers: Upgrade to 7.2.4
  dante: Add _GNU_SOURCE for musl builds

Liu Yiding (2):
  liblognorm: upgrade 2.0.7 -> 2.0.8
  libsdl3: upgrade 3.2.28 -> 3.2.30

Peter Marko (4):
  net-snmp: patch CVE-2025-68615
  libsodium: patch CVE-2025-69277
  libcoap: set CVE version suffix
  nginx: ignore CVE-2025-53859 for 1.28.1

Sanjay Chitroda (1):
  recipes-core/toybox: Switch SRC_URI to HTTPS for reliable fetch

Wang Mingyu (9):
  python3-psycopg: upgrade 3.2.12 -> 3.2.13
  parallel: upgrade 20251022 -> 20251122
  libsdl3: upgrade 3.2.26 -> 3.2.28
  usb-modeswitch-data: upgrade 20191128 -> 20251207
  usb-modeswitch: upgrade 2.6.1 -> 2.6.2
  microsoft-gsl: upgrade 4.2.0 -> 4.2.1
  cryptsetup: upgrade 2.8.1 -> 2.8.3
  libdecor: upgrade 0.2.4 -> 0.2.5
  libsdl3-image: upgrade 3.2.4 -> 3.2.6

 .../libcoap/libcoap_4.3.5a.bb                 |   2 +
 .../python/python3-scapy_2.6.1.bb             |   2 +
 .../dante/{dante_1.4.3.bb => dante_1.4.4.bb}  |   6 +-
 .../frr/{frr_10.4.1.bb => frr_10.4.2.bb}      |   2 +-
 .../net-snmp/net-snmp/CVE-2025-68615.patch    |  33 +++++
 .../net-snmp/net-snmp_5.9.4.bb                |   1 +
 .../recipes-support/ncp/libowfat_0.32.bb      |   2 +-
 .../recipes-support/ncp/ncp_1.2.4.bb          |   2 +-
 .../tinyproxy/tinyproxy/CVE-2025-63938.patch  |  43 ++++++
 .../tinyproxy/tinyproxy_1.11.2.bb             |   1 +
 .../asyncmqtt/asyncmqtt_10.2.6.bb             |   2 +
 meta-oe/recipes-core/toybox/toybox_0.8.13.bb  |   2 +-
 ...ryptsetup_2.8.1.bb => cryptsetup_2.8.3.bb} |   2 +-
 .../libsodium/libsodium/CVE-2025-69277.patch  |  61 ++++++++
 .../libsodium/libsodium_1.0.20.bb             |   2 +
 .../recipes-dbs/influxdb/influxdb_1.8.10.bb   |   1 +
 .../lmdb/files/CVE-2026-22185.patch           |  31 +++++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb       |   1 +
 ...ft-gsl_4.2.0.bb => microsoft-gsl_4.2.1.bb} |   8 +-
 .../recipes-devtools/nodejs/nodejs_22.21.1.bb |   2 -
 .../php/{php_8.4.16.bb => php_8.4.17.bb}      |   2 +-
 ...pg_3.2.12.bb => python3-psycopg_3.2.13.bb} |   2 +-
 .../xerces-c/xerces-c_3.3.0.bb                |   2 +
 .../boinc/boinc-client_7.20.5.bb              |   4 +
 ...iblognorm_2.0.7.bb => liblognorm_2.0.8.bb} |   3 +-
 ...001-Cargo.toml-do-not-abort-on-panic.patch |   2 +-
 ...nfigure-do-not-look-for-llvm-objdump.patch |   2 +-
 ...o-not-try-to-find-a-suitable-upstrea.patch |   2 +-
 .../mozjs-128/0004-use-asm-sgidefs.h.patch    |   2 +-
 ...2.patch => 0005-Add-RISCV32-support.patch} |   2 +-
 ...x-one-occasionally-reproduced-confi.patch} |   2 +-
 ...ewrite-cargo-host-linker-in-python3.patch} |   2 +-
 ...e-stack-unwinder-like-glibc-therefo.patch} |   2 +-
 ...om-firefox-bugzilla-to-fix-compile-.patch} |   2 +-
 ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |   2 +-
 ...ith-icu-uc-to-fix-build-with-ICU-76.patch} |   2 +-
 ...gc-and-riscv32gc-as-valid-architect.patch} |  38 +++--
 .../0013-Fix-build-error-with-musl.patch      |  30 ++++
 .../mozjs/mozjs-128_128.5.2.bb                |  17 +--
 ...allel_20251022.bb => parallel_20251122.bb} |   2 +-
 .../{libdecor_0.2.4.bb => libdecor_0.2.5.bb}  |   2 +-
 ...-image_3.2.4.bb => libsdl3-image_3.2.6.bb} |   2 +-
 .../{libsdl3_3.2.26.bb => libsdl3_3.2.30.bb}  |   2 +-
 ...01-decode-fix-build-on-ARMv7-targets.patch |   4 +-
 ...ing-for-non-NEON-enabled-ARM-targets.patch |  73 +++++-----
 .../vk-gl-cts/vulkan-cts-sources.inc          |   2 +-
 ...n-cts_1.4.4.0.bb => vulkan-cts_1.4.4.2.bb} |   2 +-
 ...8-year-problem-in-timestamp-handling.patch |  55 ++++++++
 .../minicoredumper/minicoredumper_2.0.7.bb    |   1 +
 .../libjxl/libjxl_0.11.1.bb                   |   3 +
 .../recipes-security/softhsm/softhsm_2.6.1.bb |   2 +-
 .../libcereal/libcereal_1.3.2.bb              |   2 +
 .../recipes-support/raptor2/raptor2_2.0.16.bb |   2 +
 .../recipes-support/smarty/smarty_5.6.0.bb    |   2 +-
 ...128.bb => usb-modeswitch-data_20251207.bb} |   2 +-
 .../0001-Fix-build-with-gcc-15.patch          |  51 -------
 ...witch_2.6.1.bb => usb-modeswitch_2.6.2.bb} |   6 +-
 ...ers_7.2.2.bb => vboxguestdrivers_7.2.4.bb} |   2 +-
 .../nginx/files/CVE-2025-53859.patch          | 131 ------------------
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   2 +
 .../recipes-httpd/nginx/nginx_1.28.0.bb       |   7 -
 .../recipes-httpd/nginx/nginx_1.28.1.bb       |   7 +
 62 files changed, 404 insertions(+), 286 deletions(-)
 rename meta-networking/recipes-protocols/dante/{dante_1.4.3.bb => dante_1.4.4.bb} (88%)
 rename meta-networking/recipes-protocols/frr/{frr_10.4.1.bb => frr_10.4.2.bb} (99%)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2025-68615.patch
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2025-63938.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.1.bb => cryptsetup_2.8.3.bb} (98%)
 create mode 100644 meta-oe/recipes-crypto/libsodium/libsodium/CVE-2025-69277.patch
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
 rename meta-oe/recipes-devtools/microsoft-gsl/{microsoft-gsl_4.2.0.bb => microsoft-gsl_4.2.1.bb} (93%)
 rename meta-oe/recipes-devtools/php/{php_8.4.16.bb => php_8.4.17.bb} (99%)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.12.bb => python3-psycopg_3.2.13.bb} (85%)
 rename meta-oe/recipes-extended/liblognorm/{liblognorm_2.0.7.bb => liblognorm_2.0.8.bb} (95%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv32.patch => 0005-Add-RISCV32-support.patch} (97%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-util.configure-fix-one-occasionally-reproduced-confi.patch => 0006-util.configure-fix-one-occasionally-reproduced-confi.patch} (96%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-rewrite-cargo-host-linker-in-python3.patch => 0007-Rewrite-cargo-host-linker-in-python3.patch} (97%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{musl-disable-stackwalk.patch => 0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.patch} (94%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-add-arm-to-list-of-mozinline.patch => 0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.patch} (95%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{armv5.patch => 0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.patch} (93%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch => 0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch} (92%)
 rename meta-oe/recipes-extended/mozjs/mozjs-128/{riscv.patch => 0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.patch} (60%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error-with-musl.patch
 rename meta-oe/recipes-extended/parallel/{parallel_20251022.bb => parallel_20251122.bb} (93%)
 rename meta-oe/recipes-graphics/libdecor/{libdecor_0.2.4.bb => libdecor_0.2.5.bb} (94%)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.2.4.bb => libsdl3-image_3.2.6.bb} (87%)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.26.bb => libsdl3_3.2.30.bb} (97%)
 rename meta-oe/recipes-graphics/vk-gl-cts/{vulkan-cts_1.4.4.0.bb => vulkan-cts_1.4.4.2.bb} (94%)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0002-Fix-2038-year-problem-in-timestamp-handling.patch
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch-data_20191128.bb => usb-modeswitch-data_20251207.bb} (84%)
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch/0001-Fix-build-with-gcc-15.patch
 rename meta-oe/recipes-support/usb-modeswitch/{usb-modeswitch_2.6.1.bb => usb-modeswitch_2.6.2.bb} (86%)
 rename meta-oe/recipes-support/vboxguestdrivers/{vboxguestdrivers_7.2.2.bb => vboxguestdrivers_7.2.4.bb} (97%)
 delete mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb

-- 
2.52.0


