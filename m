Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23A4FD711CE
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 00:11:45 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6544.1766103095043716764
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 16:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=dR6gqVSH;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=M8uv+FTJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BILkrn83427808
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 00:11:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lcwiEZa+6+yeBLmfMpOPpB
	AFr8Z8g7kacSGs6jt2krI=; b=dR6gqVSHFD25Q04fTCRBD2rSDin+KVtzHn3Ziz
	a4KefRmM79pmQEqZq4Te3f+ZaeMvEvfETUC6VPLK2cQ4iskPMDO/WjfZQMcXGyyO
	WI4Jc5M/ZzqOFTiHc93DHnAeCQR8GyvPaLWUuYRhKbT+Hw9CM7aR/C2jyQO28Ozg
	ShGfUPD+pltWfWXaIOwQRrmO3NJxuCfqrKh3I2W2WZGEzO0slj894yez7jJjo2OD
	oiqI8vMQNkeASBSuAkyxFE9Ys07pxjQQgdmtVhDZvys1D+v2QccU4nWmVGF29Wpb
	XfM4VhX5Lb8Dxv9vaYnp1Btx2Yghn59MYrUGqeshows98WpQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2e8kma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 00:11:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-29f1f79d6afso17970715ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 16:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766103093; x=1766707893; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcwiEZa+6+yeBLmfMpOPpBAFr8Z8g7kacSGs6jt2krI=;
        b=M8uv+FTJ4EIN1wqCQZQxyLaszrNFvg43hQ6Rg34hS85H01YViziNwXD9Ye8zeVNQln
         duZllGdLRyTjhCSt4ujKyN2G07W7VZ4Kg2yCw7MZE35p0Wbzcsxd/Gu0ISMrdRy2hyYZ
         UW6R07vEa17FqcR6/gkI9IvettaxUpS+HXXqt+N/jLg2sgDlLd7i+CzVx3OKwQ3yEiq1
         MkGtIxcI12wwTIPIOXIVFFNTBMMUps4uEvINEvszvM1c5JkzELi3g6T5NM/lZwIVUBeX
         yIArf5HpDJS7oV6CcC9mzCpsWzsKCVUnEndGj2U8APlvtgDjU9X3EXlHBvZukIug0Jzi
         A5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766103093; x=1766707893;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcwiEZa+6+yeBLmfMpOPpBAFr8Z8g7kacSGs6jt2krI=;
        b=imQ+ICAa3ryrlS1N3ynCCcyerUtFEw6nXPc0xZnm3q3IGutvRKDcuMEVpu7dPmBDMQ
         sCuwGgsI4Fehou/CGwTg9GeGiROZV+1NgHCGwwSCs6mjIQdbeGkD6JgiaGUdD//wtS+D
         FtOo4p3q/sWI6PykKZneVLI0weymo/VCtE98rkFFN56uN0uUJ/C6z5VcIF7OT3FXbZuj
         H+2V+qbkP+Liw9iQ75YmKnoMqHI/j3XO+ruNqg2iJn8/gw+I2JNjT6XT/uKucyXLr3bf
         8cWZvnDuJK3mVUH4SV+zzq8efqhoxJPKKk3t48jC1eyvE3X5G7JTL9YLAY8DoPERRFtp
         f8/A==
X-Forwarded-Encrypted: i=1; AJvYcCWB4uFquW822s9e/VV7sAaLQdwmjF10zmz+5lUCNAZKIPpNLi0Q/Rd8iR5ty+ChXHbgHgEwQwKs3LIXmFq1ufcITLk=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw67SbdIfx57U11yKVJffvfE8bF3OJZA1YOnYRtGcCcbU112/rZ
	4IEaEstB07KVeOYVkkt3p46Jy9E+HcFSBmNK3H/aRz2xM1r0yEyfGHeM9CXPAO7fvgL8uWs1l5Y
	pipvSZDDkIgojEEqnd/Nle0ukOVLpKU9Ih6slDNdAJGxweC5FQ+WQyegj0Mo9p7uuzV5OV0ksvW
	OGAZWfXO0I
X-Gm-Gg: AY/fxX6vennl1BGTZUIIp8+x2xXLyNcb5xy9VdjWbpoHgV/hwFIvxK33bbgtpY+fXql
	RHOXHnAKqV1iLQoKjxzMaf0lQt9RcWRQe0YcUMSZFvzHXT1Cl1trDIsGzCEiRXU4tI1cjCDgIg0
	Al4UMaKMgH5/ZSkG1bYRVbwhIAiiuwUlfbzMAZwjhWnm9wUMKWX9Hhunh56JwMloOuzGyVoYfpV
	hvDo/EQXDsuyqSCk6NGIRl3dJVHtMSmkEJ1/ONjYnxApVasM68Szyj3ae9NoNBJxfMnRsLd4CGh
	IWTxmDeWjcdvpV4ascIsG+b5tD0uTMHypfU6BJO+YsRl0JDEPxXeB/CEfofAD5YD8ljrKW4rVrc
	V22PvrhO3EwQERgVveP5DZRA/q9Ad6jDS4wwl64kT
X-Received: by 2002:a17:903:41c6:b0:2a1:243:94a9 with SMTP id d9443c01a7336-2a2f2a3d741mr8624525ad.53.1766103092417;
        Thu, 18 Dec 2025 16:11:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGFczUlkeE8nXaaKyO7Q78v+esOZoaOdEX6uu/d0fXfxo5ryHK8QNtby3BvVKbZABKOIVb3sQ==
X-Received: by 2002:a17:903:41c6:b0:2a1:243:94a9 with SMTP id d9443c01a7336-2a2f2a3d741mr8624235ad.53.1766103091796;
        Thu, 18 Dec 2025 16:11:31 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d3fasm3895035ad.69.2025.12.18.16.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 16:11:31 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/56] Whinlatter pull request
Date: Fri, 19 Dec 2025 05:41:22 +0530
Message-ID: <cover.1766102578.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDIwMCBTYWx0ZWRfX+xcYRay21yyR
 pbcDuAuRdfndBJ7Ya9cI0WecN17vvwQxArztSf2Dwmt9ioSG2gcp0cmHQDnVNm50VMHxkUDc5W9
 PznL6SaKFJkUvrtnvGhtc9jLotl9S4uO33RtqdZrBHHuSdZ+s6swYIT+dR7Ohqc99FbfIhPY8Nw
 Uj6JUtRthMIJvrHqaTPEz00zrI7i3OaaYnhKKfOeLPx3FOb0FAIg+/MYjYR6Q5SqXgc/ZdxMQiT
 LjzRpArNY5/H9yheHINoeM796hxolP7spZc2NF5BA6hVNBpixEr2beLRhqx6aRCQuiqdYsJynpV
 wsBQRxZUMJ957j7SnOrjNXOvZN+GvlPhKWrZMHac+QuzeIVPOdQpmGsEp4ZGU6zasKeyphli2Pf
 cJTr1HlL0Wh/y0kEpj15eMCuETGI+EH6Wf69EhqFiYPNBzaDTv/HUsBPURqAkmcu4RCYz40SJ34
 I+ckorIkUe1TapYP1SA==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=69449835 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=zwsEpPN8bGAfTi8Xq-oA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: EPQ2ppI_1UugE30Bpha5NWA11W5oon4W
X-Proofpoint-GUID: EPQ2ppI_1UugE30Bpha5NWA11W5oon4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_04,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512180200
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Dec 2025 00:11:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122770

Please merge these changes in whinlatter. 

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1187

I've dropped some patches sent to the list for whinlatter that included
major version upgrades or changes to behaviour (pcre -> pcre2).

The following changes since commit 09c7f76c196876a4366f220b360f4bdb93ab95c0:

  libunix-statgrab: Put LD export in do_configure (2025-11-23 00:12:01 -0800)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

Alper Ak (1):
  proj: Fix do_package QA issue for unshipped bash-completion files

Ankur Tyagi (2):
  python3-django: upgrade 5.2.7 -> 5.2.8
  python3-django: upgrade 4.2.25 -> 4.2.26

Changqing Li (5):
  hdf5: fix do_package failure when multilib enabled
  hdf5: inherit pkgconfig
  version-check.conf: mute version mismatch warning for flite
  version-check.conf: mute version mismatch warning for bpftrace
  libmng: correct version of libmng

Gyorgy Sarvari (8):
  libao: ignore CVE-2017-11548
  cockpit: set correct CVE_PRODUCT
  tigervnc: ignore CVE-2014-8241
  breakpad: correct SRC_URI branch
  gssdp: upgrade 1.6.3 -> 1.6.4
  gupnp: upgrade 1.6.6 -> 1.6.9
  gupnp-av: upgrade 0.14.1 -> 0.14.4
  gupnp-tools: upgrade 0.12.1 -> 0.12.2

Jason Schonberg (3):
  xdebug: upgrade 3.4.6 -> 3.4.7
  php: upgrade 8.4.14 -> 8.4.15
  gsoap: upgrade 2.8.135 -> 2.8.137

Khem Raj (5):
  wxwidgets: Upgrade to 3.2.8.1 bugfix release
  fuse3: Add missing rdep on file for ptests
  fuse3: Fix build with clang on riscv32
  e2tools: Fix buildpaths in ptests
  libplist: Fix buildpaths in ptests

Leon Anavi (3):
  python3-polyline: Upgrade 2.0.3 -> 2.0.4
  python3-cloudpickle: Upgrade 3.1.1 -> 3.1.2
  python3-huey: Upgrade 2.5.4 -> 2.5.5

Liu Yiding (2):
  lvm2: upgrade 2.03.36 -> 2.03.37
  pgpool2: 4.6.3 -> 4.6.4

Mingli Yu (3):
  mariadb: Upgrade 11.4.8 -> 11.4.9
  openipmi: Pass BUILD_CFLAGS to BUILD_CC
  bpftool-native: Empty DEBUG_PREFIX_MAP_EXTRA

Peter Marko (1):
  libcoap: upgrade 4.3.5 -> 4.3.5a

Valeria Petrov (1):
  apache2: upgrade 2.4.65 -> 2.4.66

Viswanath Kraleti (1):
  gflags: switch Git branch from master to main

Wang Mingyu (19):
  debootstrap: upgrade 1.0.141 -> 1.0.142
  libgphoto2: upgrade 2.5.32 -> 2.5.33
  asyncmqtt: upgrade 10.2.5 -> 10.2.6
  libnice: upgrade 0.1.22 -> 0.1.23
  psqlodbc: upgrade 17.00.0006 -> 17.00.0007
  fcgi: upgrade 2.4.6 -> 2.4.7
  swagger-ui: upgrade 5.30.2 -> 5.30.3
  openvpn: upgrade 2.6.15 -> 2.6.16
  libdaq: upgrade 3.0.22 -> 3.0.23
  postfix: upgrade 3.10.5 -> 3.10.6
  nautilus: upgrade 49.1 -> 49.2
  python3-gpt-image: upgrade 0.9.0 -> 0.9.1
  python3-moteus: upgrade 0.3.95 -> 0.3.96
  python3-rich-argparse: upgrade 1.7.1 -> 1.7.2
  python3-eventlet: upgrade 0.40.3 -> 0.40.4
  python3-gmpy2: upgrade 2.2.1 -> 2.2.2
  python3-pybcj: upgrade 1.0.6 -> 1.0.7
  python3-pymodbus: upgrade 3.11.3 -> 3.11.4
  python3-sqlparse: upgrade 0.5.3 -> 0.5.4

Yi Zhao (1):
  crash: add zlib-native to depends for crash-cross

yuyu (1):
  trace-cmd: Update SRC_URI to use HTTPS protocol

 .../recipes-utils/e2tools/e2tools_0.1.2.bb    |  16 +-
 .../{nautilus_49.1.bb => nautilus_49.2.bb}    |   2 +-
 ...mplate-use-basename-instead-of-filen.patch |  32 --
 .../gupnp/{gssdp_1.6.3.bb => gssdp_1.6.4.bb}  |   5 +-
 .../0001-all-Drop-xmlRecoverMemory.patch      |  44 ---
 ...{gupnp-av_0.14.1.bb => gupnp-av_0.14.4.bb} |   8 +-
 ...-tools_0.12.1.bb => gupnp-tools_0.12.2.bb} |   2 +-
 ...mplate-use-basename-instead-of-filen.patch |  32 --
 .../gupnp/{gupnp_1.6.6.bb => gupnp_1.6.9.bb}  |   5 +-
 .../recipes-multimedia/libao/libao_1.2.0.bb   |   2 +
 .../{libdaq_3.0.22.bb => libdaq_3.0.23.bb}    |   2 +-
 .../{postfix_3.10.5.bb => postfix_3.10.6.bb}  |   2 +-
 .../{libcoap_4.3.5.bb => libcoap_4.3.5a.bb}   |   6 +-
 ...ile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch |  35 ++
 .../openipmi/openipmi_2.0.37.bb               |   1 +
 .../{openvpn_2.6.15.bb => openvpn_2.6.16.bb}  |   2 +-
 ...h.h-to-ensure-isnan-and-isinf-are-de.patch |  40 ---
 ...e-time-calculations-always-long-long.patch | 336 ------------------
 .../{pgpool2_4.6.3.bb => pgpool2_4.6.4.bb}    |   4 +-
 meta-oe/conf/version-check.conf               |   2 +
 ...syncmqtt_10.2.5.bb => asyncmqtt_10.2.6.bb} |   2 +-
 ...ive_11.4.8.bb => mariadb-native_11.4.9.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   3 +-
 ...lity-with-ARMv9-by-updating-.arch-di.patch |  41 ---
 .../{mariadb_11.4.8.bb => mariadb_11.4.9.bb}  |   0
 ...xpected-output-file-for-descrec-test.patch |  72 ----
 .../psqlodbc-fix-for-ptest-support.patch      |  17 +-
 ...c_17.00.0006.bb => psqlodbc_17.00.0007.bb} |  13 +-
 .../breakpad/breakpad_2023.06.01.bb           |   2 +-
 ...trap_1.0.141.bb => debootstrap_1.0.142.bb} |   2 +-
 .../php/{php_8.4.14.bb => php_8.4.15.bb}      |   2 +-
 .../libimobiledevice/libplist_2.6.0.bb        |  10 +-
 ...xwidgets_3.2.8.bb => wxwidgets_3.2.8.1.bb} |   4 +-
 ...gphoto2_2.5.32.bb => libgphoto2_2.5.33.bb} |   2 +-
 ...0001-configura.ac-update-the-version.patch |  32 ++
 .../recipes-graphics/libmng/libmng_2.0.3.bb   |   3 +-
 .../tigervnc/tigervnc_1.15.0.bb               |   2 +
 .../bpftool/bpftool-native_6.16.bb            |   2 +
 meta-oe/recipes-kernel/crash/crash_8.0.6.bb   |   2 +
 .../trace-cmd/trace-cmd_3.1.5.bb              |   2 +-
 meta-oe/recipes-navigation/proj/proj_9.7.0.bb |   4 +-
 meta-oe/recipes-support/fuse/fuse3_3.16.2.bb  |   4 +
 .../recipes-support/gflags/gflags_2.2.2.bb    |   2 +-
 .../{gsoap_2.8.135.bb => gsoap_2.8.137.bb}    |   2 +-
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   9 +-
 .../{libnice_0.1.22.bb => libnice_0.1.23.bb}  |   6 +-
 meta-oe/recipes-support/lvm2/lvm2.inc         |   4 +-
 ..._3.1.1.bb => python3-cloudpickle_3.1.2.bb} |   9 +-
 ...ngo_4.2.25.bb => python3-django_4.2.26.bb} |   4 +-
 ...jango_5.2.7.bb => python3-django_5.2.8.bb} |   2 +-
 ...t_0.40.3.bb => python3-eventlet_0.40.4.bb} |   2 +-
 ...-gmpy2_2.2.1.bb => python3-gmpy2_2.2.2.bb} |   2 +-
 ...n3-huey_2.5.4.bb => python3-huey_2.5.5.bb} |   2 +-
 ...eus_0.3.95.bb => python3-moteus_0.3.96.bb} |   2 +-
 ...ine_2.0.3.bb => python3-polyline_2.0.4.bb} |   2 +-
 ...-pybcj_1.0.6.bb => python3-pybcj_1.0.7.bb} |   2 +-
 ...s_3.11.3.bb => python3-pymodbus_3.11.4.bb} |   2 +-
 ....7.1.bb => python3-rich-argparse_1.7.2.bb} |   2 +-
 ...rse_0.5.3.bb => python3-sqlparse_0.5.4.bb} |   2 +-
 ...ge_0.9.0.bb => python3-gpt-image_0.9.1.bb} |   4 +-
 ...gger-ui_5.30.2.bb => swagger-ui_5.30.3.bb} |   2 +-
 .../{apache2_2.4.65.bb => apache2_2.4.66.bb}  |   2 +-
 .../{xdebug_3.4.6.bb => xdebug_3.4.7.bb}      |   2 +-
 .../fcgi/{fcgi_2.4.6.bb => fcgi_2.4.7.bb}     |   2 +-
 .../recipes-webadmin/cockpit/cockpit_349.bb   |   2 +
 65 files changed, 182 insertions(+), 687 deletions(-)
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_49.1.bb => nautilus_49.2.bb} (93%)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gssdp/0001-gssdp-enums.c.template-use-basename-instead-of-filen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.3.bb => gssdp_1.6.4.bb} (82%)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-av/0001-all-Drop-xmlRecoverMemory.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-av_0.14.1.bb => gupnp-av_0.14.4.bb} (51%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.1.bb => gupnp-tools_0.12.2.bb} (84%)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp/0001-gupnp-enums.c.template-use-basename-instead-of-filen.patch
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.6.bb => gupnp_1.6.9.bb} (83%)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.22.bb => libdaq_3.0.23.bb} (92%)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.5.bb => postfix_3.10.6.bb} (99%)
 rename meta-networking/recipes-devtools/libcoap/{libcoap_4.3.5.bb => libcoap_4.3.5a.bb} (90%)
 create mode 100644 meta-networking/recipes-support/openipmi/files/0001-Makefile.am-Pass-BUILD_CFLAGS-to-BUILD_CC.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.15.bb => openvpn_2.6.16.bb} (98%)
 delete mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/0001-snprintf-Add-math.h-to-ensure-isnan-and-isinf-are-de.patch
 delete mode 100644 meta-networking/recipes-support/pgpool2/pgpool2/v1-0001-Make-time-calculations-always-long-long.patch
 rename meta-networking/recipes-support/pgpool2/{pgpool2_4.6.3.bb => pgpool2_4.6.4.bb} (89%)
 rename meta-oe/recipes-connectivity/asyncmqtt/{asyncmqtt_10.2.5.bb => asyncmqtt_10.2.6.bb} (87%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.8.bb => mariadb-native_11.4.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Ensure-compatibility-with-ARMv9-by-updating-.arch-di.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.8.bb => mariadb_11.4.9.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/psqlodbc/files/add-expected-output-file-for-descrec-test.patch
 rename meta-oe/recipes-dbs/psqlodbc/{psqlodbc_17.00.0006.bb => psqlodbc_17.00.0007.bb} (87%)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.141.bb => debootstrap_1.0.142.bb} (89%)
 rename meta-oe/recipes-devtools/php/{php_8.4.14.bb => php_8.4.15.bb} (99%)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.8.bb => wxwidgets_3.2.8.1.bb} (98%)
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.32.bb => libgphoto2_2.5.33.bb} (93%)
 create mode 100644 meta-oe/recipes-graphics/libmng/libmng/0001-configura.ac-update-the-version.patch
 rename meta-oe/recipes-support/gsoap/{gsoap_2.8.135.bb => gsoap_2.8.137.bb} (93%)
 rename meta-oe/recipes-support/libnice/{libnice_0.1.22.bb => libnice_0.1.23.bb} (88%)
 rename meta-python/recipes-devtools/python/{python3-cloudpickle_3.1.1.bb => python3-cloudpickle_3.1.2.bb} (55%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.25.bb => python3-django_4.2.26.bb} (70%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.7.bb => python3-django_5.2.8.bb} (60%)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.40.3.bb => python3-eventlet_0.40.4.bb} (83%)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.2.1.bb => python3-gmpy2_2.2.2.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.4.bb => python3-huey_2.5.5.bb} (78%)
 rename meta-python/recipes-devtools/python/{python3-moteus_0.3.95.bb => python3-moteus_0.3.96.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-polyline_2.0.3.bb => python3-polyline_2.0.4.bb} (80%)
 rename meta-python/recipes-devtools/python/{python3-pybcj_1.0.6.bb => python3-pybcj_1.0.7.bb} (85%)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.11.3.bb => python3-pymodbus_3.11.4.bb} (90%)
 rename meta-python/recipes-devtools/python/{python3-rich-argparse_1.7.1.bb => python3-rich-argparse_1.7.2.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.5.3.bb => python3-sqlparse_0.5.4.bb} (82%)
 rename meta-python/recipes-extended/python3-gpt-image/{python3-gpt-image_0.9.0.bb => python3-gpt-image_0.9.1.bb} (78%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.30.2.bb => swagger-ui_5.30.3.bb} (94%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.4.6.bb => xdebug_3.4.7.bb} (91%)
 rename meta-webserver/recipes-support/fcgi/{fcgi_2.4.6.bb => fcgi_2.4.7.bb} (87%)

-- 
2.52.0


