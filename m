Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52940C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 10:20:43 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26679.1786357237428657858
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 03:20:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=TYsxEP3i;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=TWm8fUsQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A9SPKA890721
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 10:20:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OYoG4aQG4WRlg6lWnpeL80UjHOg6wqbR2pk
	LWGRxIcg=; b=TYsxEP3i7Osbj7KPyBulYAEdkITNnJqRfRyeBtvB/0U+X/T9bQD
	WHaXVjxCjtcpS4zJ7k6O4P1Kv2pHhxxFTwbC2uBkyMsRQQK11SwM3DursIHCx5de
	cqvSu/2/UVL//hhgRNwStD+bObVDkVmX0gDVaQVSp1HTo3SixMyFGYzc3eE/uEm0
	XpE0Ct6U2zb/LyLSbGKgutc3zGV74j262U/t6RdlXvmXa36RGRySu6Bzopm0h7Be
	QRMmoR478T6k07dcfVlsssNMFCxm8ru6Tl5rxUPM3FNzv23XILSVnDo/wVyqCvs2
	HL4yL6U92KMMlDSl/q96k6245iNLlw3nEdA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v490d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 10:20:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5cc1e139bso1254550a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 03:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786357235; x=1786962035; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OYoG4aQG4WRlg6lWnpeL80UjHOg6wqbR2pkLWGRxIcg=;
        b=TWm8fUsQJwGDGmiSD+b5gnbpJuQevLLMs/CuY32kn1QZSBKKMx6i+oOk74+zJczvDC
         Lc0NqW2DUxegxfFgvqrN8vcyGOWtyz3euiU2V7qm4Gl97/j16jxgPBPV0m25kUQKtEiW
         xKCk80RGnHj5ayvkd73NIytQgnynT6OveHydM/Ie2ybxvSqIZajdpJvuiBo30zqZ+Luu
         p+9loH9W4Nd3TgyyJxhin8DjOsUT2fKxPEbKsJadhfDFE9gsus/1M2Pc7Sx+Lxle6vgE
         EScduGyDqayng7umbRwn4/7I/cDmRBFQHjUXx/Taipuy9jAC7LVcyjDu1gWWfjZUTVG7
         cnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357235; x=1786962035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OYoG4aQG4WRlg6lWnpeL80UjHOg6wqbR2pkLWGRxIcg=;
        b=LE14b+JUPEOEuAmVplYhoxAlf3rGdR/wT9XbdF5mIE8qdynUWlv1x6jw0uIC3Jw7B0
         K/qO+DpVSVARvt2tEEqMdluDzcFFgfXGAzoIavCnEcXtZ+gBTB6dUW6S6kjOsRPb1cbY
         4Ew9PwHlUoe+TXzlhfyddgLlWuFrcNmXD4d5Z7y2t1imU0fHQZUQOngz06dqvBAVzZwt
         nZqFp+60qsvqUiShtuwyEsHrwzpNAXmhIIt1l6x6Pd+gYoW9rmcOkTdTqfV9MDKYq5k2
         N4qMpLVrdvuGBbgIMb9k+I0laXQgsD9SIPgTrUtvVKcrF7y9YLJLO864RqEwzoWoCsiF
         10Tg==
X-Gm-Message-State: AOJu0YycSfyolStUsivLkCy41s/Wyo7lB/Jur+3rauD6n0OjNQIjAwjv
	fmSO0Ji6pDv3uqh4G8fKCgyqim7UMfcB2rqtzIUVTikObjGDXl8Lj0XoXTYWTh2IQEVsky/rW5e
	meIFU6oKczLAybG9RWJ+VrgfkXTRk7mylqhes8jdXAPBdGHVL0xlCZIc9fezNYyLgShKF8Ym1tY
	l98w2FuhRGLQgn1pYQFyU=
X-Gm-Gg: AR+sD10pysqw6QQ3AZHTosSMEf5yt0qcCugZb29prdcnqpCd1Cvnk60o318w895xKHH
	6RYDTbzHDOoDyu3opB4eEJHceNwfJPYjoOmcYvocrwmEIAK/YiBwEy6uRMadmDTXC05Ay1BodSp
	kHBQI48HN6aNywJ6I1Pv/5LRJkppHK6crKDIPz8SAi8tzNfZWhvokWODsqH0EBIX03IOh/rQSP/
	KdonR0zrhaGp8WfCzcER/RQ+AvDMY/Vdzs5pFQBYVa1pWX/vm1j7cDbtmBxVDQhRdS6lSmdjoIn
	lOq4oSQJydQNaM43vOFEy6fnNYQxqtGehRl1VKQnDqwzOHvQHPIZU/JNcXcHWPL0I+T4zxULurp
	r4MxX6imHBwlVia1tXLsc3NyhUSlL1/A=
X-Received: by 2002:a05:6a21:e598:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3cc1a35367cmr929866637.26.1786357234939;
        Mon, 10 Aug 2026 03:20:34 -0700 (PDT)
X-Received: by 2002:a05:6a21:e598:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3cc1a35367cmr929785637.26.1786357234335;
        Mon, 10 Aug 2026 03:20:34 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebdf796sm39278839eec.22.2026.08.10.03.20.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:20:34 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/48] Wrynose pull request
Date: Mon, 10 Aug 2026 15:50:27 +0530
Message-ID: <cover.1786352020.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dk-B6NKXg3H3FqvXKssJzi9rdvAordY5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA4OCBTYWx0ZWRfX/VcOAaL01rFP
 z6omSnDICUvsiMXqMJwFWnNAHrGwOtvK4srDgIj7kbflo+PX5TwtET3ysuQKQGSHQKfbaYJ0Hoo
 9f4w3MskwN7YoEMXMRaDsByIVapubpY=
X-Authority-Analysis: v=2.4 cv=W5EIkxWk c=1 sm=1 tr=0 ts=6a79a5f4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=o_KhZ_Hz4fGxiQYnKa0A:9 a=x9snwWr2DeNwDh03kgHS:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA4OCBTYWx0ZWRfX9oSyjRHr/sj5
 q/+Y6Q1uBUqKTxN6lteTnM4n+1VjHxfVMjqbdrpJGsLBU/NHleKYCvHsOLsrhtjLa1diBgrhD0V
 X+WPEMZNfNh9ml6eawOWrjxUFxoSw3h7cs6uU+sc4n4IwPSqXxBnQKGSrG3BMCQV+OrliyN8G3I
 3HBSDU+8eZlLUH+rub2Yhleelsbc280bJl1xLi67XBFggr7LZSG3+OXWVWfu9VqGBZgIgG+n6/D
 UsHK369c1FkeF8YF7wwwqmc+S+GEXJkfwB57Anfj7qKG0lp1aVvlEeom0cvrBUm2xVyrWshn2wY
 uEvHuX3Ydq38F8xdFAHkLdDFH2cfr0x6GqrY2TxMAmqfiF5zjCE+1PmCykdgxu8oHlCoAo4OuKL
 vlZsu8k3lq+Mudqu1pEnfrTdNXwAVHlsDoTKtU/ZpuYCSPJ3SLUuVe9/44jKHpw1Ej/P5pQ0sVZ
 mHHsS4pfdD9HdB7Vr2g==
X-Proofpoint-GUID: dk-B6NKXg3H3FqvXKssJzi9rdvAordY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_02,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 10:20:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128877

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1711

The following changes since commit af8b6d6b2f0b11595b0a0d5b82efa3129d52a628:

  sysdig: Use LuaJIT headers to match the linked LuaJIT library (2026-07-24 06:15:59 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to c466d490dd85e1bdfa7bc2dd4aca1b279afdf83a:

  sdbus-c++-libsystemd: add .git to github repository url (2026-08-10 07:33:03 +0530)

----------------------------------------------------------------

Adarsh Jagadish Kamini (4):
  thrift: fix CVE-2026-55971
  thrift: fix CVE-2026-58023
  thrift: fix CVE-2026-48144
  thrift: fix CVE-2026-58389

Ankur Tyagi (14):
  valkey: upgrade 9.0.4 -> 9.0.5
  bluealsa: upgrade 4.3.0 -> 4.3.1
  strongswan: patch CVE-2026-47895
  netplan: upgrade 1.2.1 -> 1.2.2
  transmission: upgrade 4.1.1 -> 4.1.3
  liboauth2: upgarde 2.2.0 -> 2.3.0
  cryptsetup: upgrade 2.8.6 -> 2.8.7
  xrdp: upgrade 0.10.6 -> 0.10.6.1
  swagger-ui: upgrade 5.32.8 -> 5.32.11
  cjose: upgrade 0.6.2.4 -> 0.6.2.7
  usbredir: upgrade 0.14.0 -> 0.15.0
  tcpreplay: upgrade 4.5.2 -> 4.5.5
  python3-faker: upgrade 40.13.0 -> 40.14.1
  python3-sh: upgrade 2.2.2 -> 2.2.4

Devansh Patel (2):
  hdf5: Fix CVE-2026-26199
  hdf5: Fix CVE-2026-26197

Hetvi Thakar (5):
  libdbi-perl: Fix CVE-2026-9698
  libdbi-perl: Fix CVE-2026-10879
  libdbi-perl: Fix CVE-2026-14380
  libdbi-perl: Fix CVE-2026-14739
  libdbi-perl: Fix CVE-2026-14740

Jason Schonberg (2):
  nodejs: upgrade 22.23.1 -> 22.23.2
  php: upgrade 8.5.8 -> 8.5.9

Khem Raj (10):
  libopus: upgrade 1.6 -> 1.6.1
  mpv: propagate ffmpeg's commercial LICENSE_FLAGS
  python3-mpv: propagate ffmpeg's commercial LICENSE_FLAGS
  fluidsynth: upgrade 2.5.3 -> 2.5.7
  libde265: upgrade 1.0.18 -> 1.0.19
  libsrtp: upgrade 2.7.0 -> 2.8.0
  gssdp: upgrade 1.6.4 -> 1.6.6
  srt: upgrade 1.5.4 -> 1.5.6
  gupnp: upgrade 1.6.9 -> 1.6.10
  gupnp-tools: upgrade 0.12.2 -> 0.12.4

Leon Anavi (1):
  python3-rarfile: Upgrade 4.2 -> 4.3

Markus Volk (2):
  colord: set proper home-dir
  fluidsynth: fix branch after recipe update

Omkar Patil (1):
  openvpn: fix CVE-2026-40215

Peter Marko (1):
  sdbus-c++-libsystemd: add .git to github repository url

Tugrul Kukul (1):
  jq: fix infinite loop in CVE-2026-47770 backport

Wang Mingyu (5):
  dovecot: upgrade 2.4.3 -> 2.4.4
  smarty: upgrade 5.8.0 -> 5.8.3
  smarty: upgrade 5.8.3 -> 5.8.4
  libosip2: upgrade 5.3.1 -> 5.3.2
  python3-rarfile: upgrade 4.3 -> 4.4

 .../gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb}  |   2 +-
 ...-tools_0.12.2.bb => gupnp-tools_0.12.4.bb} |   2 +-
 .../gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb} |   2 +-
 ...asename-implementation-from-glib-2.0.patch |  88 ---
 .../{bluealsa_4.3.0.bb => bluealsa_4.3.1.bb}  |   5 +-
 ...luidsynth_2.5.3.bb => fluidsynth_2.5.7.bb} |   4 +-
 ...{libde265_1.0.18.bb => libde265_1.0.19.bb} |   3 +-
 .../{libsrtp_2.7.0.bb => libsrtp_2.8.0.bb}    |   2 +-
 .../srt/0002-allow-build-with-cmake-4.patch   |  43 --
 .../srt/{srt_1.5.4.bb => srt_1.5.6.bb}        |   3 +-
 .../{dovecot_2.4.3.bb => dovecot_2.4.4.bb}    |   2 +-
 .../{libosip2_5.3.1.bb => libosip2_5.3.2.bb}  |   2 +-
 .../openvpn/openvpn/CVE-2026-40215.patch      |  59 ++
 .../recipes-support/openvpn/openvpn_2.7.0.bb  |   1 +
 ...{usbredir_0.14.0.bb => usbredir_0.15.0.bb} |   4 +-
 .../strongswan/CVE-2026-47895.patch           |  92 +++
 .../strongswan/strongswan_6.0.6.bb            |   4 +-
 ...{tcpreplay_4.5.2.bb => tcpreplay_4.5.5.bb} |   2 +-
 .../{netplan_1.2.1.bb => netplan_1.2.2.bb}    |   2 +-
 .../thrift/thrift/CVE-2026-48144.patch        |  36 +
 .../thrift/thrift/CVE-2026-55971.patch        |  92 +++
 .../thrift/thrift/CVE-2026-58023.patch        | 231 ++++++
 .../thrift/thrift/CVE-2026-58389.patch        |  93 +++
 .../thrift/thrift_0.22.0.bb                   |   4 +
 ...mission_4.1.1.bb => transmission_4.1.3.bb} |   4 +-
 .../sdbus-c++/sdbus-c++-libsystemd_259.5.bb   |   2 +-
 ...ryptsetup_2.8.6.bb => cryptsetup_2.8.7.bb} |   2 +-
 .../jq/jq/CVE-2026-47770.patch                |   6 +-
 .../{nodejs_22.23.1.bb => nodejs_22.23.2.bb}  |   2 +-
 .../perl/libdbi-perl/CVE-2026-10879.patch     |  41 ++
 .../perl/libdbi-perl/CVE-2026-14380.patch     |  37 +
 .../perl/libdbi-perl/CVE-2026-14739.patch     | 124 ++++
 .../perl/libdbi-perl/CVE-2026-14740.patch     |  39 +
 .../perl/libdbi-perl/CVE-2026-9698.patch      |  51 ++
 .../perl/libdbi-perl_1.647.bb                 |   9 +-
 .../php/{php_8.5.8.bb => php_8.5.9.bb}        |   2 +-
 .../{valkey_9.0.4.bb => valkey_9.0.5.bb}      |   2 +-
 .../{libopus_1.6.bb => libopus_1.6.1.bb}      |   2 +-
 .../recipes-multimedia/mplayer/mpv_0.41.0.bb  |   7 +-
 .../{cjose_0.6.2.4.bb => cjose_0.6.2.7.bb}    |   2 +-
 meta-oe/recipes-support/colord/colord.bb      |   7 +-
 .../hdf5/files/CVE-2026-26197.patch           |  70 ++
 .../hdf5/files/CVE-2026-26199.patch           | 678 ++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   2 +
 ...rage-linker-flag-behind-CODE_COVERAG.patch |  33 -
 ..._easy_setopt-takes-a-long-not-an-int.patch |  33 -
 .../0002-Fix-use-of-strchr-with-new-GCC.patch |  33 -
 ...{liboauth2_2.2.0.bb => liboauth2_2.3.0.bb} |   8 +-
 .../{smarty_5.8.0.bb => smarty_5.8.4.bb}      |   2 +-
 .../xrdp/{xrdp_0.10.6.bb => xrdp_0.10.6.1.bb} |   2 +-
 ...er_40.13.0.bb => python3-faker_40.14.1.bb} |   2 +-
 .../python/python3-mpv_1.0.8.bb               |   6 +-
 ...-rarfile_4.2.bb => python3-rarfile_4.4.bb} |   2 +-
 ...ython3-sh_2.2.2.bb => python3-sh_2.2.4.bb} |   2 +-
 ...ger-ui_5.32.8.bb => swagger-ui_5.32.11.bb} |   2 +-
 55 files changed, 1715 insertions(+), 277 deletions(-)
 rename meta-multimedia/recipes-connectivity/gupnp/{gssdp_1.6.4.bb => gssdp_1.6.6.bb} (92%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp-tools_0.12.2.bb => gupnp-tools_0.12.4.bb} (84%)
 rename meta-multimedia/recipes-connectivity/gupnp/{gupnp_1.6.9.bb => gupnp_1.6.10.bb} (93%)
 delete mode 100644 meta-multimedia/recipes-multimedia/bluealsa/bluealsa/0001-Use-basename-implementation-from-glib-2.0.patch
 rename meta-multimedia/recipes-multimedia/bluealsa/{bluealsa_4.3.0.bb => bluealsa_4.3.1.bb} (96%)
 rename meta-multimedia/recipes-multimedia/fluidsynth/{fluidsynth_2.5.3.bb => fluidsynth_2.5.7.bb} (92%)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.18.bb => libde265_1.0.19.bb} (93%)
 rename meta-multimedia/recipes-support/libsrtp/{libsrtp_2.7.0.bb => libsrtp_2.8.0.bb} (94%)
 delete mode 100644 meta-multimedia/recipes-support/srt/srt/0002-allow-build-with-cmake-4.patch
 rename meta-multimedia/recipes-support/srt/{srt_1.5.4.bb => srt_1.5.6.bb} (90%)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.3.bb => dovecot_2.4.4.bb} (97%)
 rename meta-networking/recipes-support/libosip2/{libosip2_5.3.1.bb => libosip2_5.3.2.bb} (88%)
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
 rename meta-networking/recipes-support/spice/{usbredir_0.14.0.bb => usbredir_0.15.0.bb} (82%)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-47895.patch
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.5.2.bb => tcpreplay_4.5.5.bb} (89%)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.2.1.bb => netplan_1.2.2.bb} (97%)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55971.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58023.patch
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-58389.patch
 rename meta-oe/recipes-connectivity/transmission/{transmission_4.1.1.bb => transmission_4.1.3.bb} (97%)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.6.bb => cryptsetup_2.8.7.bb} (98%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.1.bb => nodejs_22.23.2.bb} (99%)
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
 rename meta-oe/recipes-devtools/php/{php_8.5.8.bb => php_8.5.9.bb} (99%)
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.4.bb => valkey_9.0.5.bb} (98%)
 rename meta-oe/recipes-multimedia/libopus/{libopus_1.6.bb => libopus_1.6.1.bb} (96%)
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.4.bb => cjose_0.6.2.7.bb} (88%)
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26197.patch
 create mode 100644 meta-oe/recipes-support/hdf5/files/CVE-2026-26199.patch
 delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-build-guard-coverage-linker-flag-behind-CODE_COVERAG.patch
 delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0001-fix-clang-curl_easy_setopt-takes-a-long-not-an-int.patch
 delete mode 100644 meta-oe/recipes-support/liboauth2/liboauth2/0002-Fix-use-of-strchr-with-new-GCC.patch
 rename meta-oe/recipes-support/liboauth2/{liboauth2_2.2.0.bb => liboauth2_2.3.0.bb} (71%)
 rename meta-oe/recipes-support/smarty/{smarty_5.8.0.bb => smarty_5.8.4.bb} (95%)
 rename meta-oe/recipes-support/xrdp/{xrdp_0.10.6.bb => xrdp_0.10.6.1.bb} (98%)
 rename meta-python/recipes-devtools/python/{python3-faker_40.13.0.bb => python3-faker_40.14.1.bb} (93%)
 rename meta-python/recipes-devtools/python/{python3-rarfile_4.2.bb => python3-rarfile_4.4.bb} (82%)
 rename meta-python/recipes-devtools/python/{python3-sh_2.2.2.bb => python3-sh_2.2.4.bb} (84%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.8.bb => swagger-ui_5.32.11.bb} (94%)

-- 
2.54.0


