Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB684FEA812
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 06:43:10 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16493.1774420986661143556
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 23:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PI+hxLPt;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=bLGewr8P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3xGcc919622
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 06:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rAcjbyGanYkE5l6koS0sb8AzJvJ0sVU3OP5
	YGTE6R+8=; b=PI+hxLPt0zn9vBpKsfSeh8m3ACAVgnnPd3R0jebtWFfiKtZfjmu
	dCOBnVatmNufKztGA8dlv93DOp52DVTt//yxOlBXovCm9CSVi3xXsBvnVTMDnNgq
	OaZky+6V2i3qhLaddqrSYyJJg/hGc7YyToBIdki0asNdAjy8lRutGiYjaqxJ9+2L
	b1oo3HLKR36CW4up5EZLpipTVuYXBys5pwDL5wvlkbm6MzVKu4lp6DHCIogVz54y
	3gvBdQ9gAn4fdbUkA9ZeAY4KMv2VoxikmFCpBPp45nPrwbLOmzHE8bd+wkARTy0d
	+ddX8UN5jgFvguaNxj+iQV/8rPFP23j9g+w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489mgfxa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 06:43:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso4457184a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 23:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774420985; x=1775025785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAcjbyGanYkE5l6koS0sb8AzJvJ0sVU3OP5YGTE6R+8=;
        b=bLGewr8Pj0LDrKZhnDrhvocUhDlsbqcckRQ5JjOZa+Vp0lx0BaK+CcnjT6zBJ2VNtA
         LVeAgE7QQSOjcW8/4iehDND3lbbTzriXf6cgN1Gbfh+yAQzEaqhUpVWKydiQOZ/1wA+l
         Yi8HBQ9IwvZmLASXIurrrmMg8HZ+VHVpX1KxW9KHk1P968i9FmYRE3C/xMQNq04ThvQc
         adeOWax2UyGoQxaFL2x/bhDAtVw2OewDR9gwyjXBt9V+HzqKgODZtBnYR6bKdzSnFAAc
         T4nHVw/T9UTVvRsWqn4MG9nCogeyMp4gaKaYaA2snDY/ASU2QQnyhdnlhmp99kCdGNqa
         XWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774420985; x=1775025785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAcjbyGanYkE5l6koS0sb8AzJvJ0sVU3OP5YGTE6R+8=;
        b=iFAYI5gCHdxU92hx7r8mmKSLS1t5uAWvztfijDqLZUpkUYS2rBeHx2tvMQkEeQGQZw
         Kt5T71rARMeOdnp8LPHK4v112gwpPVPq7KekbwgmnGNa3/jDpY3L0KBhgh0DrGWfR3d0
         qvEeQP39eeNb7D4WBvtQSLrIvy0GKT5v+M5o6gR/diwxbcKsWmqGH4Ps6DXdujMSkHmI
         i1TwTiwj4va06Y7EEs+uNTGcly3DQD04L/Q34JJiCcYTWRGEWrqtt7aS2yWQr2+SfBeb
         KAs57m6SpuokSEs9UyLJI/O6FH5aUIceCdd9UcrgjYmdXc56UkLdUQLESOlFFARMSCcF
         WsvQ==
X-Gm-Message-State: AOJu0YyEBUDJApPych/CRKQdljBoxltffQKT87u86QPJbyjODF2Bh+fV
	lamLw02h6/fZoWxHgyIV7Zuz3Zn53mKuMnzDKTMgYWDx8jLcbkf7bTdQsYS7wrd5pypGGRY/O3a
	5jM89hJP2xdlD2aia2wZeezUErfyw05ItpHTolwHiPGkkUklg8BvSI24u+kLnMs507VhAWMn4hv
	vzzY3Xtd5Onl+q+7uDRtg=
X-Gm-Gg: ATEYQzyIfyvatrLrLc6iZAVulQhi5JSYpgKE2F5x9M2+bnfnm//dVdvng/OJkJZtaIx
	4ufPWCG1qblOTVzTSpgOoGyZeKav03EFNnb4jxRuCNjMbnK8qRMfWiNQ2I5BE7xX/4mLFixiOkh
	Qwa7FgsTHjbnYY14LD6ZACOgmkc/u8zASWrVH9eEKWuP60GwDT990zV+9jZDsuui3Pyy/k+g3+K
	8yDXMy0QCw19a1u1Qc6tTuUQPsBxN3aMk6ehJ19NSVweSvzISHOGh2AAmBqV+RRIsOTjM5KNP6m
	vxgScboN73vsE7zK468290ehjnmjrZ6g0TLyuBe9WF5FAL+i8D7SYy1Ctgb2P31n7nSz/231Unf
	dcZnq96i/HHQoLpU1x2+tnrSkIpGJrFVKx5as0LWDbRfnDCsLXikY
X-Received: by 2002:a17:90b:3c0c:b0:35c:bdc:52b2 with SMTP id 98e67ed59e1d1-35c0dc5fe1dmr2021824a91.6.1774420985007;
        Tue, 24 Mar 2026 23:43:05 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0c:b0:35c:bdc:52b2 with SMTP id 98e67ed59e1d1-35c0dc5fe1dmr2021803a91.6.1774420984242;
        Tue, 24 Mar 2026 23:43:04 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c0313eedasm4378285a91.5.2026.03.24.23.43.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 23:43:04 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/49] Scarthgap pull request
Date: Wed, 25 Mar 2026 12:12:57 +0530
Message-ID: <cover.1774420778.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA0NSBTYWx0ZWRfX7vxRCEIrU0zS
 rX2j4v00jG9OfJfTYqxFsufR/Ja28xBwjDOCXJCgeWvTsYWrMRRevXouCXlnLQrP5S9fZXxvepp
 xMeb2mQnH77GGRmCSzGD0UdcF7MM3/bU42VE48bRjyNNEmBEIim83I22OeXW6pdGnqljDd0RJI4
 pQkb+eUkgGtOLsIUFFtMBlS931ulaCmBc99MvDfDo8ZJPM9GDz8vBT0/lFkVa7E+rV2521m0pgb
 j9/0+CdxIUp/5+DTbNf/+bXQehtN4sqYL2DlZ/5XfzhDwmNzyJKHsYeQ4CVWeAwxSJmxzj4rmvY
 cYpBemfS7tnTXf7NHxo6tW0oOXv/40DBMosrJMCwyro7J0PeFbVnXaWWd192blOMQHrbaSs+DkQ
 Fm4Sa4AqLip13ThhQ42kY10mOUIEUc88l+fXrifgVBX9Ydp6r5ThzgnQxSnZKh4g+vX7VvySj8+
 yYpbGlOLlCs6kX6nU+Q==
X-Proofpoint-GUID: 67FWiIM7yJ-LVnSCPy1qc6ic6Xzw-1vh
X-Proofpoint-ORIG-GUID: 67FWiIM7yJ-LVnSCPy1qc6ic6Xzw-1vh
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=69c383f9 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=JPyCODDqjvVcQ7vOHO4A:9 a=rl5im9kqc5Lf4LNbBjHf:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250045
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 06:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125601

Please merge these changes in scarthgap. Tested with qemux86, qemu86-64,
qemuarm and qemuarm64 locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1392

The following changes since commit 4d3e2639dec542b58708244662d5ce36810fc510:

  source-han-sans-*-fonts: rename downloaded files in SRC_URI (2026-03-03 13:08:08 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to 06f846a325fde423bb0a6d49d771d8c1e144d7eb:

  bluealsa: fix QA issue staticdev (2026-03-24 15:53:24 +0530)

----------------------------------------------------------------

Aviv Daum (1):
  lldpd: fix xml PACKAGECONFIG dependency

Christos Gavros (1):
  nativesdk-pistache: dependency with brotli

Deepak Rathore (1):
  yasm: extend recipe for nativesdk builds

Gyorgy Sarvari (33):
  exiftool: ignore CVE-2026-3102
  freerdp: upgrade 2.11.7 -> 2.11.8
  gimp: ignore CVE-2025-14424
  gimp: patch CVE-2025-15059
  gimp: patch CVE-2025-2760
  gimp: patch CVE-2025-2761
  gimp: patch CVE-2026-0797
  gimp: patch CVE-2026-2044
  gimp: patch CVE-2026-2045
  gimp: ignore CVE-2026-2047
  gimp: patch CVE-2026-2048
  gnome-shell: ignore CVE-2021-3982
  keepalived: patch CVE-2024-41184
  libjxl: upgrade 0.10.2 -> 0.10.5
  protobuf: ignore CVE-2026-0994
  python3-django: upgrade 4.2.28 -> 4.2.29
  streamripper: ignore CVE-2020-37065
  gimp: add additional patch for CVE-2026-0797
  vlc: ignore CVE-2026-26227 and CVE-2026-26228
  php: upgrade 8.2.29 -> 8.2.30
  ettercap: patch CVE-2026-3603
  exiv2: patch CVE-2026-25884
  exiv2: patch CVE-2026-27596
  exiv2: patch CVE-2026-27631
  imagemagick: patch CVE-2025-68618
  imagemagick: patch CVE-2025-68950
  imagemagick: patch CVE-2025-69204
  hiawatha: fix SRC_URI
  openjpeg: patch CVE-2023-39327
  capnproto: patch CVE-2026-32239 and CVE-2026-32240
  libjxl: mark CVE-2025-12474 and CVE-2026-1837 patched
  mariadb: upgrade 10.11.12 -> 10.11.16
  libde265: patch CVE-2025-61147

Hitendra Prajapati (4):
  wireshark: Fix CVE-2026-3201
  wireshark: Fix CVE-2026-0960
  python3-pyjwt: Fix CVE-2026-32597
  python3-pillow: fix CVE-2026-25990

Martin Jansa (1):
  krb5: fix build with gcc-15

Matthias Proske (1):
  bluealsa: fix QA issue staticdev

Peter Marko (4):
  spice-gtk: mark CVE-2012-4425 as fixed
  spice: ignore CVE-2016-0749
  spice: set CVE-2016-2150 status to fixed
  sassc: ignore CVE-2022-43357

Sujeet Nayak (1):
  libnice: make crypto library configurable via PACKAGECONFIG

Vijay Anusuri (1):
  libssh: Fix CVE-2026-3731

haonguyen-qualgo (1):
  mbedtls: Do not set LIB_INSTALL_DIR to an absolute path to make
    MbedTLSTargets.cmake relocateable

 .../gimp/gimp/CVE-2025-15059.patch            |    33 +
 .../gimp/gimp/CVE-2025-2760-1.patch           |    38 +
 .../gimp/gimp/CVE-2025-2760-2.patch           |    84 +
 .../gimp/gimp/CVE-2025-2761.patch             |    34 +
 .../gimp/gimp/CVE-2026-0797-1.patch           |    91 +
 .../gimp/gimp/CVE-2026-0797-2.patch           |    62 +
 .../gimp/gimp/CVE-2026-2044.patch             |    28 +
 .../gimp/gimp/CVE-2026-2045.patch             |    36 +
 .../gimp/gimp/CVE-2026-2048.patch             |    84 +
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |    13 +-
 .../gnome-shell/gnome-shell_46.1.bb           |     1 +
 .../bluealsa/bluealsa_git.bb                  |     1 +
 .../libde265/libde265/CVE-2025-61147.patch    |    84 +
 .../libde265/libde265_1.0.12.bb               |     3 +-
 .../streamripper/streamripper_1.64.6.bb       |     2 +
 .../recipes-multimedia/vlc/vlc_3.0.20.bb      |     3 +
 .../mbedtls/mbedtls_2.28.10.bb                |     2 -
 .../mbedtls/mbedtls_3.6.5.bb                  |     2 -
 .../keepalived/CVE-2024-41184-1.patch         |    98 +
 .../keepalived/CVE-2024-41184-2.patch         |    88 +
 .../keepalived/CVE-2024-41184-3.patch         |    94 +
 .../keepalived/CVE-2024-41184-4.patch         |    33 +
 .../keepalived/keepalived_2.2.8.bb            |     4 +
 .../recipes-daemons/lldpd/lldpd_1.0.18.bb     |     2 +-
 .../ettercap/ettercap/CVE-2026-3606.patch     |    48 +
 .../ettercap/ettercap_0.8.3.1.bb              |     4 +-
 .../recipes-support/spice/spice-gtk_0.42.bb   |     2 +
 .../recipes-support/spice/spice_git.bb        |     2 +
 .../wireshark/files/CVE-2026-0960.patch       |    43 +
 .../wireshark/files/CVE-2026-3201.patch       |    55 +
 .../wireshark/wireshark_4.2.14.bb             |     2 +
 ...nate-old-style-function-declarations.patch | 10803 ++++++++++++++++
 .../recipes-connectivity/krb5/krb5_1.21.3.bb  |     1 +
 ...10.11.12.bb => mariadb-native_10.11.16.bb} |     0
 meta-oe/recipes-dbs/mysql/mariadb.inc         |     2 +-
 ...ck-if-syscall-exists-before-using-it.patch |     8 +-
 ...Lists.txt-fix-gen_lex_hash-not-found.patch |     6 +-
 ...ariadb_10.11.12.bb => mariadb_10.11.16.bb} |     0
 .../CVE-2026-32239_CVE-2026-32240.patch       |   160 +
 .../capnproto/capnproto_1.0.2.bb              |     4 +-
 .../recipes-devtools/perl/exiftool_12.72.bb   |     2 +
 .../php/php/CVE-2025-14177.patch              |    84 -
 .../php/php/CVE-2025-14178.patch              |    65 -
 .../php/php/CVE-2025-14180.patch              |    69 -
 .../php/{php_8.2.29.bb => php_8.2.30.bb}      |     5 +-
 .../protobuf/protobuf_4.25.8.bb               |     2 +
 meta-oe/recipes-devtools/yasm/yasm_git.bb     |     2 +-
 .../recipes-extended/brotli/brotli_1.1.0.bb   |     2 +-
 .../openjpeg/openjpeg/CVE-2023-39327.patch    |    51 +
 .../openjpeg/openjpeg_2.5.4.bb                |     1 +
 .../libjxl/libjxl/CVE-2024-11403.patch        |    70 -
 .../libjxl/libjxl/CVE-2024-11498.patch        |   113 -
 .../{libjxl_0.10.2.bb => libjxl_0.10.5.bb}    |    10 +-
 .../exiv2/exiv2/CVE-2026-25884-1.patch        |    69 +
 .../exiv2/exiv2/CVE-2026-25884-2.patch        |    25 +
 .../exiv2/exiv2/CVE-2026-27596-1.patch        |    71 +
 .../exiv2/exiv2/CVE-2026-27596-2.patch        |    24 +
 .../exiv2/exiv2/CVE-2026-27631-1.patch        |    63 +
 .../exiv2/exiv2/CVE-2026-27631-2.patch        |    26 +
 meta-oe/recipes-support/exiv2/exiv2_0.28.3.bb |     8 +
 .../0001-Fixed-compilation-warnings.patch     |    27 -
 .../{freerdp_2.11.7.bb => freerdp_2.11.8.bb}  |     3 +-
 .../imagemagick/CVE-2025-68618.patch          |   109 +
 .../imagemagick/CVE-2025-68950.patch          |    25 +
 .../imagemagick/CVE-2025-69204.patch          |    71 +
 .../imagemagick/imagemagick_7.1.1.bb          |     3 +
 .../recipes-support/libnice/libnice_0.1.22.bb |     5 +-
 .../libssh/libssh/CVE-2026-3731-1.patch       |    44 +
 .../libssh/libssh/CVE-2026-3731-2.patch       |   102 +
 .../recipes-support/libssh/libssh_0.10.6.bb   |     2 +
 meta-oe/recipes-support/sass/sassc_git.bb     |     2 +
 .../0001-lower-setuptools-requirements.patch  |     0
 ...ngo_4.2.28.bb => python3-django_4.2.29.bb} |     2 +-
 .../python3-pillow/CVE-2026-25990.patch       |    91 +
 .../python/python3-pillow_10.3.0.bb           |     1 +
 .../python/python3-pyjwt/CVE-2026-32597.patch |   216 +
 .../python/python3-pyjwt_2.8.0.bb             |     1 +
 .../recipes-httpd/hiawatha/hiawatha_10.12.bb  |     2 +-
 78 files changed, 13067 insertions(+), 461 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-15059.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-1.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2760-2.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-2761.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-1.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-0797-2.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2044.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2045.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2026-2048.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2025-61147.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-1.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-2.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-3.patch
 create mode 100644 meta-networking/recipes-daemons/keepalived/keepalived/CVE-2024-41184-4.patch
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/CVE-2026-3606.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-3201.patch
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/0001-Eliminate-old-style-function-declarations.patch
 rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.11.12.bb => mariadb-native_10.11.16.bb} (100%)
 rename meta-oe/recipes-dbs/mysql/{mariadb_10.11.12.bb => mariadb_10.11.16.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/capnproto/capnproto/CVE-2026-32239_CVE-2026-32240.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.29.bb => php_8.2.30.bb} (98%)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2023-39327.patch
 delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11403.patch
 delete mode 100644 meta-oe/recipes-multimedia/libjxl/libjxl/CVE-2024-11498.patch
 rename meta-oe/recipes-multimedia/libjxl/{libjxl_0.10.2.bb => libjxl_0.10.5.bb} (87%)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-25884-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27596-2.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-1.patch
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2026-27631-2.patch
 delete mode 100644 meta-oe/recipes-support/freerdp/freerdp/0001-Fixed-compilation-warnings.patch
 rename meta-oe/recipes-support/freerdp/{freerdp_2.11.7.bb => freerdp_2.11.8.bb} (97%)
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68618.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-68950.patch
 create mode 100644 meta-oe/recipes-support/imagemagick/imagemagick/CVE-2025-69204.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-1.patch
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2026-3731-2.patch
 rename meta-python/recipes-devtools/python/{python3-django-4.2.28 => python3-django-4.2.29}/0001-lower-setuptools-requirements.patch (100%)
 rename meta-python/recipes-devtools/python/{python3-django_4.2.28.bb => python3-django_4.2.29.bb} (82%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-25990.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pyjwt/CVE-2026-32597.patch

-- 
2.53.0


