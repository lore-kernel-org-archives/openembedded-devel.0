Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C438CA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 14:51:57 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15105.1791816712239664829
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 07:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GdUu3WWR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=CRPJtirm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CBxs0G1404377
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=AkkwEhBBr/4NVcWQwWqCfoEVpPmn5UV4LAC
	lWs0larQ=; b=GdUu3WWR8wz0wnHUKW/mh6N5JVDVZMR2gBrnXMBocJnjK6gwuYK
	Z7449cXVXBNdhYGCFmKXnZa9/M88E53dOvds0w3IFgRzVoyVdcpyG0bLOij0o5sT
	5kx5Zp5+kaRbuyi0DIG2X4AhbLHltjsWayw02XwGEUkOVgplyn2/+66SBShJBMtH
	IynMs32YWM1LaHnJCcDaMdjcR0q3WwdXUI1ta+65fnhzneLt5pJ1qx5Ax7yVcjAR
	7HgWitrII1FLS4CaFOwm4rNG5BGFpYQ+ZjxcLizHTQ3JUEHnPaU+NA+fDnyCX2BK
	GfzmR0+3LJLtcXPUT9RQ6zF2HgjDLaTiBLA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ksmr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:51:51 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so9308948c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791816711; x=1792421511; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AkkwEhBBr/4NVcWQwWqCfoEVpPmn5UV4LAClWs0larQ=;
        b=CRPJtirm92u36X17TY7FS70LOeLumw3gqHWYTYzfzOj424n6FC0EIkNF4R1E2QTLp2
         p4s94TuKlt9oR7k5xjpNOLW/U22ELLn0d9SbgwOqBDPGnEDHAx0qCajfCvpT2E5H92j5
         6DTixy4vZBvwOLzP4bX9sswDxKDSgmRfLy6utBNMh2jwEUYhIZ3FtsBo+Ru3HEUguMyg
         ztoZDT4N94JytsC73ZaI6f0RwhsSY+Ewjk6ZWbMxgrGG+IJmUepkaElUrAqhR7mnSkyO
         yMxeNGuGaGkTRn/F9AUI7fMvsE1+iHJ288xMB9YTDcQLQ8MbbIZln5WNb0SdG5JCJUcm
         Kr6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816711; x=1792421511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AkkwEhBBr/4NVcWQwWqCfoEVpPmn5UV4LAClWs0larQ=;
        b=HNvB2WaE/rjOMATFf0141DCqEUSIWDAE1Kdr6by0i60KTrZUA6uLgGj1khP+oo5tcx
         Dyf/wULedhQ6HL4eokK48xBYXQn57j4ljlaCCm9KnSDAlUqVmpjEiP4lpwnIuleH63zR
         8SoIyBafIhQF0QVKEZu3C6hyDX//5PKESsa5yP3gAPmmqVs3vBx96arbbTD1Bsi/nIVY
         lLUVOOHioSQj40D0B76wrSM48fwJVmJ9LOwa48+wDh6e09lQQAgYredSG4Ry1L4sI2UE
         vU0UzfzvUCS4dJXc7WXcYadXrg8ygzRoyA3xUBjRIHOaDcFbwrCGFwTYNxixfpuzW31V
         eG7Q==
X-Gm-Message-State: AFq9FYKQ3Dmr8OndJigX4l9baLGi+af1s0k0ifLhjUGphEYOXJzB4lIe
	FP3zf3/IZblTe/pcPP1iQ4sbeWQoLormsGDUC9OJMkM0B7cZwU3yJ/JkKpxtiMNfJbG8PLGQfdi
	LICnkoTUq9KWIe2jgUwyflE/4nvJwEwqsb1GPzaEjXuPW1TPdIeR68lrGmUPvKbpYSgKtVJcPXb
	tztLBVoyeS3IRcvl+lBPUQYg==
X-Gm-Gg: AYBFou0/ln9gWXvNa1Ypd42thzIkMM5qxoPs+hJsssozfnsTkc9FqW3+K9El1FI9sN8
	dw3puCVP3RU1fpWekySQ18Pr3hM4hBMLDTOCYZ7APnP1CHRgkTQ5W/wLU9V5PHXGN+87yZtwOaQ
	uCrj0t1XW9ugt68m8V/dbnZ3oChN84tHt7otOqXGAAZn6oHxtuSSRABTCkApo0iEc1rI6P0eMuS
	raB+nWatXbMDnzMMR0ixVDJsOhYXZ5La9IWd94tm4o8piJsRU3rNIP54p7ueqBYAJPVsRHNfVfl
	8+xzcnC7kQzv4f8QoylV/CBAlEXunqYqp/BCLhIhX4oZhQPCNpEi0+FC1x9vD3QQCGO+th8hToa
	W9uBFZkCSyuSE6RRLaBgDdK3KrOp763Wvew==
X-Received: by 2002:a05:701b:2713:b0:168:6ad8:e8b0 with SMTP id a92af1059eb24-16a6187f095mr15747755c88.14.1791816710272;
        Mon, 12 Oct 2026 07:51:50 -0700 (PDT)
X-Received: by 2002:a05:701b:2713:b0:168:6ad8:e8b0 with SMTP id a92af1059eb24-16a6187f095mr15747689c88.14.1791816709227;
        Mon, 12 Oct 2026 07:51:49 -0700 (PDT)
Received: from hyd-e160-a01-2-02.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a42407e7sm30994301c88.15.2026.10.12.07.51.47
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:51:48 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/99] Wrynose pull request
Date: Mon, 12 Oct 2026 20:21:31 +0530
Message-Id: <cover.1791816187.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OSBTYWx0ZWRfX0Kl7PMoUzeAB
 TPHrmDl7wSX9Mg6Q6sUmW55Knh71ED4NZNvJRzGH4hJe1FoxxtGgs+EFzPdry6BFKcnJmTdjmsc
 +jRejNzsTyjJ/cZ9nCrkabW/9Sp14YuuhQFDaUPPnM5K/nZy1cz0VF9k5iMrrx3dh5BPmv0MsMB
 XXaHpB6wmfduFeZiWeDtagR479uLtkSgJ4A6fi/OurDoz35haVeQdheLyqBF0lDBcJ9CKGgkXYf
 CftyLjPc4Xooztszs+MrbkR/+S+4h6Ige+HoKgxJDyq26y0enV2ucfsz0Z9b3DH158+iTgbKlgP
 7Bxhh109wEPgGrQx9Tz3iBJrWVxblSB+U34Xp3lwHCy2NiWH/THx8qMaTQHFXUX5TxkvIIZ0PEM
 +vvxDsetMPxk7500hGZQUPY/taW4nMUm+Eow87cpdXsQeGd4lqrSw+XVo/XAHGMXFjxo7EVOlNg
 IQ70nwbvs0BuPWk8/fA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OSBTYWx0ZWRfX7vxhM8U+XUgU
 JMtOa/qX9yU3U3zcG3Bd9lW9jEjJcEcirHi8COv07l88bYnxQN6Bwo5tbJyWhjhomdzyCztE5l7
 yz0wC9ykDNglzA/J5qGXDiKxbImxqHU=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6accf407 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=PDWnKCw7FQta02R5ze0A:9 a=Kq8ClHjjuc5pcCNDwlU0:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: NjpU6mCiMg0jP5wGqk9cXqVkOldrf3Ky
X-Proofpoint-ORIG-GUID: NjpU6mCiMg0jP5wGqk9cXqVkOldrf3Ky
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:51:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130763

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/113/builds/1773

The following changes since commit 47d7dbdd10890bbd429bc0cccbe14435c37e5af1:

  unbound: patch CVE-2026-56444 (2026-09-15 10:14:05 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db:

  vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_helper_alloc_info (2026-10-06 13:52:06 +0530)

----------------------------------------------------------------

Ankur Tyagi (63):
  python3-django: upgrade 6.0.7 -> 6.0.8
  python3-eventlet: mark CVE-2023-29483 fixed
  python3-marshmallow: mark CVE-2025-68480 fixed
  python3-sqlparse: patch CVE-2026-54284
  python3-sqlparse: patch CVE-2026-59893
  python3-sqlparse: patch CVE-2026-59894
  python3-sqlparse: patch CVE-2026-71491
  python3-tornado: mark CVEs fixed
  c-ares: mark CVEs fixed
  cjose: mark CVE-2026-53938 and CVE-2026-53939 fixed
  cjson: patch CVE-2026-87933
  colord: ignore CVE-2026-85062
  flatcc: patch CVE-2026-90786
  flatcc: patch CVE-2026-90785
  fluidsynth: mark CVEs fixed
  freeipmi: patch CVE-2026-85509
  freeipmi: patch CVE-2026-85508
  freeipmi: patch CVE-2026-85507
  freeipmi: patch CVE-2026-85506
  freeipmi: patch CVE-2026-85505
  freeipmi: patch CVE-2026-85504
  libde265: patch CVE-2026-54240 and CVE-2026-54241
  libheif: ignore CVE-2026-84383
  libwebsockets: patch CVE-2026-19773
  libopenmpt: upgrade 0.8.4 -> 0.8.6
  smarty: mark CVEs patched
  libssh: ignore CVE-2026-59842
  ntopng: ignore CVE-2026-84989
  ntopng: patch CVE-2026-84990
  ntopng: patch CVE-2026-86090 and CVE-2026-86091
  rabbitmq-c: patch CVE-2026-44236
  redis: patch CVE-2026-81934
  sngrep: patch CVE-2026-90558
  strongswan: patch CVE-2026-78123
  strongswan: patch CVE-2026-78124
  strongswan: patch CVE-2026-78126
  strongswan: patch CVE-2026-78127
  strongswan: patch CVE-2026-78129
  strongswan: patch CVE-2026-78133
  strongswan: patch CVE-2026-78131
  strongswan: patch CVE-2026-78130
  strongswan: patch CVE-2026-78132
  strongswan: patch CVE-2026-78135
  strongswan: patch CVE-2026-78134
  tesseract: patch CVE-2026-88052
  tesseract: patch CVE-2026-88048
  tesseract: patch CVE-2026-88049
  tesseract: patch CVE-2026-88050
  tesseract: patch CVE-2026-88047
  tesseract: patch CVE-2026-88051
  tesseract: patch CVE-2026-88054
  valkey: upgrade 9.0.5 -> 9.0.6
  valkey: mark CVE-2026-86227 fixed
  unbound: patch CVE-2026-80225
  unbound: patch CVE-2026-81642
  unbound: patch CVE-2026-78227
  unbound: patch CVE-2026-77860
  python3-tornado: patch CVE-2026-91990
  python3-tornado: patch CVE-2026-82397
  python3-tornado: patch CVE-2026-91991
  freerdp3: patch CVE-2026-85089
  freerdp3: patch CVE-2026-85090
  gpsd: patch CVE-2026-60122

Anuj Mittal (1):
  vboxguestdrivers: fix vboxvideo build on kernels lacking
    drm_fb_helper_alloc_info

Aravind Bandari (2):
  python3-pillow: fix CVE-2026-54058
  python3-pillow: fix CVE-2026-59204

Devansh Patel (16):
  python3-py: correct CVE_PRODUCT mapping
  ldns: correct CVE_PRODUCT mapping
  dnsmasq: correct CVE_PRODUCT mapping
  jq: correct CVE_PRODUCT mapping
  python3-twisted: correct CVE_PRODUCT mapping
  php: correct CVE_PRODUCT mapping
  python3-ldap: correct python-ldap CVE_PRODUCT mapping
  mariadb: correct CVE_PRODUCT mapping
  libssh: correct CVE_PRODUCT mapping
  python3-flask-user: correct CVE_PRODUCT mapping
  python3-aiohttp: correct CVE_PRODUCT mapping
  python3-werkzeug: correct CVE_PRODUCT mapping
  python3-flask: correct CVE_PRODUCT mapping
  python3-twitter: correct Tweepy CVE_PRODUCT mapping
  python3-ujson: add CVE_PRODUCT mapping
  python3-waitress: correct CVE_PRODUCT mapping

Jaipaul Cheernam (1):
  abseil-cpp: fix 32-bit x86 build of hash.cc

Jason Schonberg (2):
  nodejs: upgrade 22.23.2 -> 22.23.3
  php: upgrade 8.5.10 -> 8.5.11

Khem Raj (1):
  openvpn: upgrade 2.7.0 -> 2.7.5

Leon Anavi (1):
  python3-tzdata: Upgrade 2026.3 -> 2026.4

Louis Rannou (1):
  openvpn: create an extra package for the dns-updown script

Mehmet Fide (1):
  spidev-test: clean the build dir before configure

Nate Kent (1):
  nanomsg: upgrade 1.2.4 -> 1.2.5

Peter Marko (4):
  msgpack-c: patch CVE-2026-72854
  recipes: correct homepage
  polkit: patch CVE-2026-4897 and CVE-2026-85498
  syslog-ng: patch CVE-2026-39879

Sana Kazi (1):
  avro-c++: Use fmt from oe-core instead of bundling fmt 10.2.1

Viswanath Kraleti (1):
  libfastjson: switch git branch from master to main

Wang Mingyu (3):
  faad2: upgrade 2.11.2 -> 2.11.3
  libmxml: upgrade 4.0.4 -> 4.0.5
  nanomsg: upgrade 1.2.2 -> 1.2.4

 .../fluidsynth/fluidsynth_2.5.7.bb            |   6 +
 .../CVE-2026-54240-CVE-2026-54241.patch       | 426 ++++++++++
 .../libde265/libde265_1.0.19.bb               |   1 +
 .../libheif/libheif_1.21.2.bb                 |   2 +
 ...ibopenmpt_0.8.4.bb => libopenmpt_0.8.6.bb} |   4 +-
 .../{nanomsg_1.2.2.bb => nanomsg_1.2.5.bb}    |   4 +-
 .../recipes-support/dnsmasq/dnsmasq_2.93.bb   |   2 +
 .../ntopng/files/CVE-2026-84990.patch         |  53 ++
 .../files/CVE-2026-86090-CVE-2026-86091.patch |  67 ++
 .../recipes-support/ntopng/ntopng_6.6.bb      |   4 +
 ...-test-execution-when-cross-compiling.patch |  34 -
 .../openvpn/openvpn/CVE-2026-13117.patch      |  46 --
 .../openvpn/openvpn/CVE-2026-40215.patch      |  59 --
 .../{openvpn_2.7.0.bb => openvpn_2.7.5.bb}    |  10 +-
 .../sngrep/sngrep/CVE-2026-90558.patch        |  84 ++
 .../recipes-support/sngrep/sngrep_1.8.2.bb    |   4 +-
 .../strongswan/CVE-2026-78123.patch           |  51 ++
 .../strongswan/CVE-2026-78124.patch           |  34 +
 .../strongswan/CVE-2026-78126.patch           |  37 +
 .../strongswan/CVE-2026-78127.patch           | 115 +++
 .../strongswan/CVE-2026-78129.patch           | 155 ++++
 .../strongswan/CVE-2026-78130.patch           |  49 ++
 .../strongswan/CVE-2026-78131.patch           |  86 ++
 .../strongswan/CVE-2026-78132.patch           |  75 ++
 .../strongswan/CVE-2026-78133.patch           | 620 ++++++++++++++
 .../strongswan/CVE-2026-78134.patch           | 712 ++++++++++++++++
 .../strongswan/CVE-2026-78135.patch           |  72 ++
 .../strongswan/strongswan_6.0.6.bb            |  11 +
 .../unbound/unbound/CVE-2026-77860.patch      |  31 +
 .../unbound/unbound/CVE-2026-78227.patch      |  30 +
 .../unbound/unbound/CVE-2026-80225.patch      | 286 +++++++
 .../unbound/unbound/CVE-2026-81642.patch      |  30 +
 .../recipes-support/unbound/unbound_1.24.2.bb |   4 +
 .../libwebsockets/CVE-2026-19773.patch        |  31 +
 .../libwebsockets/libwebsockets_4.5.8.bb      |   1 +
 .../rabbitmq-c/CVE-2026-44236.patch           | 145 ++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |   1 +
 meta-oe/recipes-dbs/mysql/mariadb_11.4.12.bb  |   2 +
 ...-x86-AES-SIMD-path-to-64-bit-targets.patch |  34 +
 .../abseil-cpp/abseil-cpp_20260107.1.bb       |   1 +
 .../cjson/cjson/CVE-2026-87933.patch          | 110 +++
 .../recipes-devtools/cjson/cjson_1.7.19.bb    |   1 +
 .../flatcc/flatcc/CVE-2026-90785.patch        |  29 +
 .../flatcc/flatcc/CVE-2026-90786.patch        |  40 +
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb |   2 +
 meta-oe/recipes-devtools/jq/jq_1.8.1.bb       |   2 +
 meta-oe/recipes-devtools/ldns/ldns_1.9.2.bb   |   2 +
 .../msgpack/msgpack-c/CVE-2026-72854.patch    | 127 +++
 .../msgpack/msgpack-c_6.1.0.bb                |   4 +-
 .../{nodejs_22.23.2.bb => nodejs_22.23.3.bb}  |   2 +-
 .../php/{php_8.5.10.bb => php_8.5.11.bb}      |   4 +-
 .../polkit/files/CVE-2026-4897-01.patch       |  64 ++
 .../polkit/files/CVE-2026-4897-02.patch       |  32 +
 .../polkit/files/CVE-2026-85498.patch         |  38 +
 meta-oe/recipes-extended/polkit/polkit_127.bb |   7 +-
 .../redis/redis-8.0.6/CVE-2026-81934.patch    |  53 ++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |   1 +
 .../rsyslog/libfastjson_1.2304.0.bb           |   2 +-
 .../{valkey_9.0.5.bb => valkey_9.0.6.bb}      |   3 +-
 .../tesseract/tesseract/CVE-2026-88047.patch  | 226 ++++++
 .../tesseract/tesseract/CVE-2026-88048.patch  | 228 ++++++
 .../tesseract/tesseract/CVE-2026-88049.patch  | 316 ++++++++
 .../tesseract/tesseract/CVE-2026-88050.patch  | 210 +++++
 .../tesseract/tesseract/CVE-2026-88051.patch  | 185 +++++
 .../tesseract/tesseract/CVE-2026-88052.patch  | 165 ++++
 .../tesseract/tesseract/CVE-2026-88054.patch  | 275 +++++++
 .../tesseract/tesseract_5.5.2.bb              |   7 +
 .../recipes-kernel/spidev-test/spidev-test.bb |   1 +
 .../{faad2_2.11.2.bb => faad2_2.11.3.bb}      |   6 +-
 .../gpsd/gpsd/CVE-2026-60122.patch            |  45 ++
 .../recipes-navigation/gpsd/gpsd_3.27.5.bb    |   1 +
 .../recipes-support/avro/avro-c++_1.12.1.bb   |  10 +-
 .../recipes-support/c-ares/c-ares_1.34.8.bb   |   3 +
 .../recipes-support/cjose/cjose_0.6.2.8.bb    |   2 +
 meta-oe/recipes-support/colord/colord.bb      |   1 +
 .../freeipmi/freeipmi/CVE-2026-85504.patch    |  93 +++
 .../freeipmi/freeipmi/CVE-2026-85505.patch    |  49 ++
 .../freeipmi/freeipmi/CVE-2026-85506.patch    |  51 ++
 .../freeipmi/freeipmi/CVE-2026-85507.patch    |  50 ++
 .../freeipmi/freeipmi/CVE-2026-85508.patch    |  51 ++
 .../freeipmi/freeipmi/CVE-2026-85509.patch    |  54 ++
 .../freeipmi/freeipmi_1.6.17.bb               |   6 +
 .../freerdp/freerdp3/CVE-2026-85089-1.patch   |  28 +
 .../freerdp/freerdp3/CVE-2026-85089-2.patch   |  28 +
 .../freerdp/freerdp3/CVE-2026-85090.patch     |  59 ++
 .../freerdp/freerdp3_3.24.2.bb                |   3 +
 .../{libmxml_4.0.4.bb => libmxml_4.0.5.bb}    |   4 +-
 .../recipes-support/libssh/libssh_0.11.5.bb   |   2 +
 .../recipes-support/smarty/smarty_5.8.4.bb    |   4 +
 .../syslog-ng/files/CVE-2026-39879-01.patch   |  65 ++
 .../syslog-ng/files/CVE-2026-39879-02.patch   | 572 +++++++++++++
 .../syslog-ng/files/CVE-2026-39879-03.patch   | 758 ++++++++++++++++++
 .../syslog-ng/files/CVE-2026-39879-04.patch   | 176 ++++
 .../syslog-ng/syslog-ng_4.11.0.bb             |   4 +
 ...-build-decide-if-drm_fb_helper_alloc.patch |  52 ++
 .../vboxguestdrivers_7.2.8.bb                 |   9 +-
 .../python/python3-aiohttp_3.13.5.bb          |   2 +-
 .../python/python3-beautifulsoup4_4.14.3.bb   |   2 +-
 .../python/python3-colorzero_2.0.bb           |   2 +-
 ...ped-minimum-setuptools-version-to-83.patch |  42 +
 ...jango_6.0.7.bb => python3-django_6.0.8.bb} |   3 +-
 .../python/python3-eventlet_0.41.0.bb         |   2 +
 .../python/python3-flask-login_0.6.3.bb       |   2 +-
 .../python/python3-flask-mail_0.10.0.bb       |   2 +-
 .../python/python3-flask-user_0.6.19.bb       |   4 +-
 .../python/python3-flask_3.1.3.bb             |   2 +-
 .../python/python3-marshmallow_4.3.0.bb       |   2 +
 .../python3-pillow/CVE-2026-54058.patch       |  89 ++
 .../python3-pillow/CVE-2026-59204.patch       |  37 +
 .../python/python3-pillow_12.2.0.bb           |   2 +
 .../python/python3-py_1.11.0.bb               |   2 +-
 .../python/python3-pyexpect_1.0.22.bb         |   2 +-
 .../python3-sqlparse/CVE-2026-54284-1.patch   |  37 +
 .../python3-sqlparse/CVE-2026-54284-2.patch   | 144 ++++
 .../python3-sqlparse/CVE-2026-59893.patch     | 293 +++++++
 .../python3-sqlparse/CVE-2026-59894.patch     |  79 ++
 .../python3-sqlparse/CVE-2026-71491.patch     | 147 ++++
 .../python/python3-sqlparse_0.5.5.bb          |   7 +
 .../python3-tornado/CVE-2026-82397.patch      | 149 ++++
 .../python3-tornado/CVE-2026-91990.patch      |  40 +
 .../python3-tornado/CVE-2026-91991.patch      |  57 ++
 .../python/python3-tornado_6.5.7.bb           |   9 +
 .../python/python3-twisted_25.5.0.bb          |   2 +-
 .../python/python3-twitter_4.16.0.bb          |   2 +-
 ...ata_2026.3.bb => python3-tzdata_2026.4.bb} |   2 +-
 .../python/python3-ujson_5.12.1.bb            |   2 +
 .../python/python3-waitress_3.0.2.bb          |   2 +-
 .../python/python3-werkzeug_3.1.8.bb          |   2 +-
 .../python/python3-ldap_3.4.5.bb              |   2 +-
 129 files changed, 8725 insertions(+), 189 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-54240-CVE-2026-54241.patch
 rename meta-multimedia/recipes-multimedia/libopenmpt/{libopenmpt_0.8.4.bb => libopenmpt_0.8.6.bb} (95%)
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.2.bb => nanomsg_1.2.5.bb} (94%)
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-84990.patch
 create mode 100644 meta-networking/recipes-support/ntopng/files/CVE-2026-86090-CVE-2026-86091.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/0001-tests-skip-test-execution-when-cross-compiling.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-13117.patch
 delete mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2026-40215.patch
 rename meta-networking/recipes-support/openvpn/{openvpn_2.7.0.bb => openvpn_2.7.5.bb} (94%)
 create mode 100644 meta-networking/recipes-support/sngrep/sngrep/CVE-2026-90558.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78123.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78126.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78129.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78130.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78131.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78132.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78133.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78134.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-77860.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-78227.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-80225.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2026-81642.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-19773.patch
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44236.patch
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-hash-restrict-x86-AES-SIMD-path-to-64-bit-targets.patch
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2026-87933.patch
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90785.patch
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90786.patch
 create mode 100644 meta-oe/recipes-devtools/msgpack/msgpack-c/CVE-2026-72854.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.23.2.bb => nodejs_22.23.3.bb} (99%)
 rename meta-oe/recipes-devtools/php/{php_8.5.10.bb => php_8.5.11.bb} (99%)
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-01.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-4897-02.patch
 create mode 100644 meta-oe/recipes-extended/polkit/files/CVE-2026-85498.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-81934.patch
 rename meta-oe/recipes-extended/valkey/{valkey_9.0.5.bb => valkey_9.0.6.bb} (96%)
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88047.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88048.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88049.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88050.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88051.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88052.patch
 create mode 100644 meta-oe/recipes-graphics/tesseract/tesseract/CVE-2026-88054.patch
 rename meta-oe/recipes-multimedia/faad2/{faad2_2.11.2.bb => faad2_2.11.3.bb} (81%)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2026-60122.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85504.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85505.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85506.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85507.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85508.patch
 create mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/CVE-2026-85509.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-1.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85089-2.patch
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-85090.patch
 rename meta-oe/recipes-support/libmxml/{libmxml_4.0.4.bb => libmxml_4.0.5.bb} (92%)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-01.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-02.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-03.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/CVE-2026-39879-04.patch
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/0001-vboxvideo-let-the-build-decide-if-drm_fb_helper_alloc.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django/0001-Revert-Bumped-minimum-setuptools-version-to-83.patch
 rename meta-python/recipes-devtools/python/{python3-django_6.0.7.bb => python3-django_6.0.8.bb} (62%)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54058.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59204.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-54284-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59893.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-59894.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2026-71491.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-82397.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91990.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-91991.patch
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.3.bb => python3-tzdata_2026.4.bb} (86%)

-- 
2.34.1


