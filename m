Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 955BD1076373
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 06:08:12 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6611.1775023691947470850
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 Mar 2026 23:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eQAhE70c;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ow+/iflz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6313VFnY1458761
	for <openembedded-devel@lists.openembedded.org>; Wed, 1 Apr 2026 06:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TRPD+RN53wfrZ4KrNzRQENUEEmSh+ZBf4CY
	XbcROan8=; b=eQAhE70c0OXi3staFYB73EC2I7WhcgTfXHEkikz8zAo6Ms1Hrn7
	cwA07GClBtmUl30dJFkwRk8oa0NAdBzL9MGZpaZy6pFSdFbTtwAqm6mwOYRfyMDS
	TnoqqVeklmlZHs1vjNwNuYEMsCk2oWMH8GwNqNcnXePS1lpE85Yabppw9WORxZYe
	TAYzdMW4pw3qXo2U9ZDVAI5eXs6IS8D15bf2212W5wD+ebg3dEjunzqhLm6cTfCf
	vWe78O2XpJTcP1DM1++dYQqTi3JWFZUjDSsNcUNav/XxexAvPgvm5JP6au2+Dnfo
	F9AJrf0onJKrDr7LvTTmr0EVAbh/h8Bd0sw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8uhg0j05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 06:08:11 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c7651644975so3893010a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 31 Mar 2026 23:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775023690; x=1775628490; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=TRPD+RN53wfrZ4KrNzRQENUEEmSh+ZBf4CYXbcROan8=;
        b=Ow+/iflzE2QIVss3zasteXBpARVmYu5WbQGIySmKf4KrfWRWE+AbkvxpvPHYQnVTLC
         Wpom0HZleDOcMUtC78AX+IX0SVz/7AWWfk7uJ8jHqAC/6P20/bDVxmwAPDDOJBom9GOL
         JvSH9ke2UH6GADMxGqWwKPtwu+OE3A9FAlf0kXUiip3FaVdjdVWwYTErKqg3JxwtWvdL
         17vWl8OqHKbSDPhuU+E4DTnPkfieD+QPRlfDlwFs7PGY/ldhxZetBCVHL0m9701jutgx
         78PIN9IWUwcl0pze3lcQ4rksXJKLRTK+77JDDTLLIwZEFkQqnzZcmxrFwONpc2rpSawM
         A65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775023690; x=1775628490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRPD+RN53wfrZ4KrNzRQENUEEmSh+ZBf4CYXbcROan8=;
        b=RVP11rV9a2WaZkl4j7q4+x5BRQ8hoMHsfGfbcogW97uCIjYCk2MyDQiVnqez8x/yRZ
         F2p72MANO5kBh7ya1PB3A0/q+fboxyz5PfRBftsV09iQZQw/jKRe23uWdT4gHfyiOjzj
         h39YWf/0CTQxhkwT7MXGVKDZ4IxAyqPp7CcHCxrJv96QEeqLmZKmSiBNK5Lf+FPlOlGT
         DfoT06Rj5kKWzrPuncoaV0/1vIUdBWzKWU81VYtPhkx9Qx8dI+lGe+wUelj5boT5SeqW
         sZ2ofO4byLGkqZ1zcDvslmZ4pH9usqdSLy09f2PsXANH7hS7mIP0NiKbvw9NnZ0UGa3H
         zu5g==
X-Gm-Message-State: AOJu0YwYqjs0dXppa7hLlGPLx4vGI0pURint4i88OqulzCYdyB2ShuKi
	N0wAmuXoXpQFzJuDFLd+mkml403OIHyWq7hR1XIWUkc7hb/Z3l7G9VX6LjdvkKboHbjK2UMUNEh
	WJLZdSpqaA1kkR6xEiwQRvhE0L3td88rVx4H+kjpWDEFvG/cm9l4id7gk4tLlOWofq1l/TfEh+g
	ecAUMUDF9yGdHvZ6YOmMw=
X-Gm-Gg: ATEYQzxkOQSe9M5VmsJ7njXw3oGKn0Dfn40RZp6SMoHNUZI3/tG2c8hefe5V+5jdpiZ
	V9u98ZJpu2koQTW5zBiSnjmKw56XsChXA5MJVu1bePZ0HCxgc46x9nKrOKrz0612Jaxtub8StQY
	iQPvsEBAKsL2y72Uvs5YRMT1sQq1gpd2BQ65lwAGXCWNdhrGi84cNNnRNBVWx8ib/5YYBv3lXwC
	EnuREH5TiPPI118pXncTX8pHHtodyuLc8Fkbkr/1lEB3J4OhQyR2m+9W+PtWLJdPQzrsYO3ggr9
	8pKC6GbIdvkNqwm5ToHr65NsdM5RZZY1nW9L+wuWF3Tvg96IIcDU7FDC8/HmWsfJ4ZcncfcHC8/
	OmWHR5/If5AyEzIBpVA31DZkvuZiSuO8PlaQbLMKk/w64iAz2BzQs
X-Received: by 2002:a05:6a00:94c9:b0:82c:e635:e624 with SMTP id d2e1a72fcca58-82ce88e8d2amr2608273b3a.16.1775023690286;
        Tue, 31 Mar 2026 23:08:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:94c9:b0:82c:e635:e624 with SMTP id d2e1a72fcca58-82ce88e8d2amr2608239b3a.16.1775023689735;
        Tue, 31 Mar 2026 23:08:09 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca846d8a9sm13024268b3a.19.2026.03.31.23.08.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 23:08:09 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/30] Whinlatter pull request
Date: Wed,  1 Apr 2026 11:38:00 +0530
Message-ID: <cover.1775010235.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA1MSBTYWx0ZWRfX78lsumPGWOtS
 RAwrg8NXsdeVVlboqzVfc01V903+CfXc6WKV8S3MqMNVyGCswRxCfFvnO/n0vmRl8gRFiVGbYPI
 m1BT/D0ajavfaRb7LTT4Q0fYQZcfLtbhizwYrPnQtzeeOOe26WYPKJWgfPui2nJKyJN/oCHTsxz
 cfDjcfcE08t5U0HsZYFrwKmusY8pUSWuZzD/SEHcVqMt4vwlqih+Fin/KsLcJR5lRa3Ts3W7J1C
 AFijgtlXZOhPiDHMqZ85+Elv9A8mmt9BY0tEGIhNLZGMDQC9plVYTvcLdovgBV0P83ifXUE1geX
 UG9hxwh6Xm3qw/rkGMDbhlQh4cXxunL6w5G8rZoZL7kQThT1ycNu59/aLcJRBuX+kyXBOBKc5D1
 4TBGVbzGsjG/ZTovrHPn8L0ciFfXVpRhdEIog6smI/Yjn8fi01U2/ABowcHIYINI6GoXg8JXPK2
 2G3sMtDqY0Eg/jKwVgw==
X-Authority-Analysis: v=2.4 cv=YcawJgRf c=1 sm=1 tr=0 ts=69ccb64b cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=i7loKr_oFkrv0SLjQ6EA:9 a=x9snwWr2DeNwDh03kgHS:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: rH4ARsu1vekZ3ylUERuozfqgc2_MsY61
X-Proofpoint-ORIG-GUID: rH4ARsu1vekZ3ylUERuozfqgc2_MsY61
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_02,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010051
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2026 06:08:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125896

Please merge these changes in whinlatter. Tested locally and on
autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1420

The following changes since commit 6f989b75a08aacdcec1edb761da5559d3443c1ef:

  postfix: upgrade 3.10.6 -> 3.10.8 (2026-03-09 17:14:08 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

for you to fetch changes up to 8bcdb0cc1dab116253b409e78fb868ced7d8397c:

  bluealsa: fix QA issue staticdev (2026-03-26 10:31:48 +0530)

----------------------------------------------------------------

Ankur Tyagi (4):
  zfs: upgrade 2.2.8 -> 2.2.9
  php: upgrade 8.4.18 -> 8.4.19
  python3-pyjwt: Fix CVE-2026-32597
  python3-tornado: upgrade 6.5.4 -> 6.5.5

Aviv Daum (1):
  lldpd: fix xml PACKAGECONFIG dependency

Bartosz Golaszewski (1):
  python3-gpiod: update to v2.4.1

Deepak Rathore (1):
  libssh: Fix CVE-2026-3731

Gyorgy Sarvari (14):
  packagegroups: fix foldername
  owfs: upgrade 3.2p3 -> 3.2p4
  python3-django: upgrade 5.2.11 -> 5.2.12
  python3-django: upgrade 4.2.28 -> 4.2.29
  ettercap: patch CVE-2026-3603
  exiv2: patch CVE-2026-25884
  exiv2: patch CVE-2026-27596
  exiv2: patch CVE-2026-27631
  hiawatha: fix SRC_URI
  pcp: fix SRC_URI
  capnproto: patch CVE-2026-32239 and CVE-2026-32240
  imagemagick: upgrade 7.1.2-16 -> 7.1.2-17
  python3-marshmallow: mark CVE-2025-68480 patched
  libde265: patch CVE-2025-61147

Liu Yiding (1):
  btrfsmaintenance: upgrade 0.5 -> 0.5.2

Matthias Proske (1):
  bluealsa: fix QA issue staticdev

Mingli Yu (1):
  mariadb: Upgrade 11.4.9 -> 11.4.10

Peter Kjellerstedt (1):
  bpftrace: Update the runtime dependencies

Sujeet Nayak (1):
  libnice: make crypto library configurable via PACKAGECONFIG

Wang Mingyu (4):
  ser2net: upgrade 4.6.6 -> 4.6.7
  imagemagick: upgrade 7.1.2-15 -> 7.1.2-16
  jasper: upgrade 4.2.8 -> 4.2.9
  imapfilter: upgrade 2.8.3 -> 2.8.5

 .../owfs/0001-Add-build-rule-for-README.patch |   6 +-
 .../0001-Fix-compilation-with-GCC10.patch     |  44 -----
 .../owfs/{owfs_3.2p3.bb => owfs_3.2p4.bb}     |   7 +-
 .../packagegroup-meta-filesystems.bb          |   0
 ...Define-strndupa-if-it-does-not-exist.patch |   5 +-
 ...arch64-inline-assembly-for-gcc-13.1.patch} |   6 +-
 ...admmap-Replace-uint_t-with-uint32_t.patch} |  11 +-
 ...e-sys-stat.h-instead-of-linux-stat.h.patch |  83 +++++++++
 .../zfs/{zfs_2.2.8.bb => zfs_2.2.9.bb}        |   9 +-
 ...nance_0.5.bb => btrfsmaintenance_0.5.2.bb} |   4 +-
 ...change-sysconfig-path-to-etc-default.patch |  18 +-
 .../bluealsa/bluealsa_4.3.0.bb                |   1 +
 .../libde265/libde265/CVE-2025-61147.patch    |  84 +++++++++
 .../libde265/libde265_1.0.16.bb               |   4 +-
 .../recipes-daemons/lldpd/lldpd_1.0.20.bb     |   2 +-
 .../ettercap/ettercap/CVE-2026-3606.patch     |  48 ++++++
 .../ettercap/ettercap_0.8.3.1.bb              |   4 +-
 .../bpftrace/bpftrace_0.24.1.bb               |  11 +-
 .../{ser2net_4.6.6.bb => ser2net_4.6.7.bb}    |   2 +-
 ...ve_11.4.9.bb => mariadb-native_11.4.10.bb} |   0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |   4 +-
 ...info-t-fails-for-certain-TZ-values-o.patch |  47 -----
 ...move-x86-specific-loop-in-my_convert.patch |  93 ----------
 .../{mariadb_11.4.9.bb => mariadb_11.4.10.bb} |   0
 .../CVE-2026-32239_CVE-2026-32240.patch       | 160 ++++++++++++++++++
 .../capnproto/capnproto_1.0.2.bb              |   4 +-
 .../php/{php_8.4.18.bb => php_8.4.19.bb}      |   2 +-
 .../{jasper_4.2.8.bb => jasper_4.2.9.bb}      |   2 +-
 .../exiv2/exiv2/CVE-2026-25884-1.patch        |  69 ++++++++
 .../exiv2/exiv2/CVE-2026-25884-2.patch        |  25 +++
 .../exiv2/exiv2/CVE-2026-27596-1.patch        |  71 ++++++++
 .../exiv2/exiv2/CVE-2026-27596-2.patch        |  24 +++
 .../exiv2/exiv2/CVE-2026-27631-1.patch        |  63 +++++++
 .../exiv2/exiv2/CVE-2026-27631-2.patch        |  26 +++
 meta-oe/recipes-support/exiv2/exiv2_0.28.7.bb |  11 +-
 ...ck_7.1.2-15.bb => imagemagick_7.1.2-17.bb} |   2 +-
 ...mapfilter_2.8.3.bb => imapfilter_2.8.5.bb} |   4 +-
 .../recipes-support/libnice/libnice_0.1.23.bb |   5 +-
 .../libssh/libssh/CVE-2026-3731_p1.patch      |  35 ++++
 .../libssh/libssh/CVE-2026-3731_p2.patch      | 102 +++++++++++
 .../recipes-support/libssh/libssh_0.11.3.bb   |   2 +
 meta-oe/recipes-support/pcp/pcp.inc           |   2 +-
 ...ngo_4.2.28.bb => python3-django_4.2.29.bb} |   2 +-
 ...ngo_5.2.11.bb => python3-django_5.2.12.bb} |   2 +-
 ...-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} |   8 +-
 .../python/python3-marshmallow_4.1.2.bb       |   2 +
 .../python/python3-pyjwt/CVE-2026-32597.patch |  79 +++++++++
 .../python/python3-pyjwt_2.10.1.bb            |   2 +
 ...nado_6.5.4.bb => python3-tornado_6.5.5.bb} |   2 +-
 .../recipes-httpd/hiawatha/hiawatha_11.7.bb   |   2 +-
 50 files changed, 952 insertions(+), 249 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/owfs/owfs/0001-Fix-compilation-with-GCC10.patch
 rename meta-filesystems/recipes-filesystems/owfs/{owfs_3.2p3.bb => owfs_3.2p4.bb} (96%)
 rename meta-filesystems/recipes-filesystems/{packageconfigs => packagegroups}/packagegroup-meta-filesystems.bb (100%)
 rename meta-filesystems/recipes-filesystems/zfs/zfs/{aaf28a4630af60496c9d33db1d06a7d7d8983422.patch => 0002-fixes-broken-aarch64-inline-assembly-for-gcc-13.1.patch} (94%)
 rename meta-filesystems/recipes-filesystems/zfs/zfs/{0001-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch => 0003-fs-tests-cmd-readmmap-Replace-uint_t-with-uint32_t.patch} (83%)
 create mode 100644 meta-filesystems/recipes-filesystems/zfs/zfs/0004-linux-use-sys-stat.h-instead-of-linux-stat.h.patch
 rename meta-filesystems/recipes-filesystems/zfs/{zfs_2.2.8.bb => zfs_2.2.9.bb} (91%)
 rename meta-filesystems/recipes-utils/btrfsmaintenance/{btrfsmaintenance_0.5.bb => btrfsmaintenance_0.5.2.bb} (96%)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
 rename meta-oe/recipes-connectivity/ser2net/{ser2net_4.6.6.bb => ser2net_4.6.7.bb} (91%)
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_11.4.9.bb => mariadb-native_11.4.10.bb} (100%)
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-38029-my_tzinfo-t-fails-for-certain-TZ-values-o.patch
 delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/0001-Remove-x86-specific-loop-in-my_convert.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb_11.4.9.bb => mariadb_11.4.10.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
 rename meta-oe/recipes-devtools/php/{php_8.4.18.bb => php_8.4.19.bb} (99%)
 rename meta-oe/recipes-graphics/jasper/{jasper_4.2.8.bb => jasper_4.2.9.bb} (92%)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-15.bb => imagemagick_7.1.2-17.bb} (99%)
 rename meta-oe/recipes-support/imapfilter/{imapfilter_2.8.3.bb => imapfilter_2.8.5.bb} (80%)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731_p2.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb => python3-django_4.2.29.bb} (79%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.11.bb => python3-django_5.2.12.bb} (60%)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} (74%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch
 rename meta-python/recipes-devtools/python/{python3-tornado_6.5.4.bb => python3-tornado_6.5.5.bb} (93%)

-- 
2.53.0


