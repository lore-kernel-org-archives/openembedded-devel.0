Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7139.1793262998801182688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2026 01:36:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gP5KroEk;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cGrrvA1a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H5bP3282364
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 08:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=R20u/GTE5RYFu0x+q+NoRkwELEUNfW9gokc
	eai8em70=; b=gP5KroEkaJLVlTya7sbotCsK0ZLpATqSzvHFL7uy2KDIf0DNNfb
	PguNDC4wgM7i7Zmml/1PBvTVLTGlFlfy7mXkEnH9o/cHa6BUv77c2SS1WsR9q25A
	tNpoHujqEvCiWgvnuQiyII4aY0kB6sC0kCngAUZPjPHxrEX0F07IOuiOp40pUE7I
	e1zC+2k1v5vrkgJKOsyS083lGLRg5HUr7d9z8ta6zx7ILck2u0BzQJVvHa17bGsv
	vkWIiGEcfmMFC7GVbV3q+a0PE9sa3Zeh8BAGbSxaPkjcF9UV7CFv1KFlii3EyRhp
	iefBmxiFUGI6Yi6lUzheKQGP//8ANEdBDxg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgptpr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 08:36:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so2638876eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793262996; x=1793867796; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R20u/GTE5RYFu0x+q+NoRkwELEUNfW9gokceai8em70=;
        b=cGrrvA1aX9lO4sPqmPQ372RdeJC8NTO1vb87f60HwQ9BiE0LlE81ZOHytDGwUppBIj
         aMiW3vFEeCqkkXGIO1NnTr+L4XJXTtivalw7E1apK3od1KS7UuDb6heyKAgo4T9s+Mmj
         9HHX5BmDXCWsK7RUWQIk4J2PEb6iZjwpZC2mSdOeo1C/H4RROJXBbmscypveFe+JWKTb
         +7oJyonffXIfIuZV5wBCVhybezhFj7NQskihCCT9/F442Qv+4ix5lj6VZe2DK+Sei4Vy
         xO7+cVJHSwulSTOKXLuGLcb3f1AQsc10pjmSkpxhIHbQMoVcdHHF64Sv2QDoUuLc1ttT
         Hwsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262996; x=1793867796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=R20u/GTE5RYFu0x+q+NoRkwELEUNfW9gokceai8em70=;
        b=Or5LyKfzWRiZchg5rqLx7mtxaaczBVGj/blQTOl002BTZUofaFmMxGaH37VFLC4Pk3
         DDlYFhg0LkUGudJyU9kQzQwWYNIkwsbIuch5c66Hm+5tEItFSUYHmKc/Tz9oXTC7lwM9
         P06a8/tk/xw3mkqyflnG/dUMRwaJFhK2wbdwsR+z70FoukMXzaAhDM3rIiZvpxkiKraL
         o5Tf2QuEd1chRKM5oBnd1mONME5RJdkM2Eqh5cHAXdGf9EyhOBgytDLM/KgMk+1Zhv0g
         ISb/sdrG/e9GtLQtS8o0U7c89Yy5OON64J5qvWiknOUOopQMydIpj3bxZ+q8JMYHQYMV
         XmsQ==
X-Gm-Message-State: AFq9FYLxtK31Vh7zvMin4KZw2pJiAQH2EvjdcAGStoB5srePOrA6nxNd
	RyoNgyEf3GGLCvvGgEgbhx3sG9fxudJ8SRSi5neF+2V2IUkZaBkhMKox3JQyd8tsF0+wH1tMXTQ
	q1ey5cWzNiOimGb4dpdrb5YTfW6M+S4XS24y6QR5D4/dxS4N9h/4XSt+rvJSBkoy7YyQ5GiW8cy
	c31CIf+e19sX/ZdBwP6tlM1A==
X-Gm-Gg: AYBFou01EajaFD2b72kmHlE3qhz58Odj4Bp7TnfFswt1vzp3yTRBOyy0UohQwl4s1uH
	Z6pEwOSQwnlTpd6CHUoDMtds8KPs7HuVGuIlgRw5kC8QQZMR0Z7/aLAkUG3KsD++W7Ul66mQWK6
	LNbgI0WpmK4jZf7QxJU7BPJ54xFMfKEvsBC1OrifAwGvDDybT2fXuRSty+Hbfojz4g77Uk/TVak
	xSO/zaOWPEEaIgDlEkYZHZw6wXRqh4nuPOcAXvr7FH1MpiQPamvubuLah/g0vNL959RO07quhCp
	4cpqkc1k8qCcCwX6UM85dhFagRf1INyVGIVr5f4puCaEeu9HJumYI9X987ML2lOuM7V6fXOq8ct
	YItfL46WQoHEbMMbIf+vHHJ30RgUOmZ7sX4jBKC/4YBZw4+mR3GXT1S5c/mAH2YZeVKDxzQU3Uf
	c+Q/Q=
X-Received: by 2002:a05:7301:578e:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-36a2006ea33mr10050019eec.19.1793262995796;
        Thu, 29 Oct 2026 01:36:35 -0700 (PDT)
X-Received: by 2002:a05:7301:578e:b0:369:f961:ccf8 with SMTP id 5a478bee46e88-36a2006ea33mr10049956eec.19.1793262994920;
        Thu, 29 Oct 2026 01:36:34 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm16527298eec.9.2026.10.29.01.36.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:36:34 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/85] Wrynose pull request
Date: Thu, 29 Oct 2026 14:06:27 +0530
Message-ID: <cover.1793262316.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX0fSAlex4IqhP
 DmhEH1p6+2Vr4hwXtefkUyCXNqAN81Xcre65DgSH+n296FQ1Za5GyPF1j94EZS321pQ3MKXTtPJ
 O7EIUtRz0pf2c7FSnMcdvLlLo4iFTCxJWDaFIcoFIXQpSZzPAf0Hmz68Askuyim3agj+Z7ZtfLU
 qIyTMaogluRD2Xoxeu/7Q14mpp1grcFobbmORW7teEYP9bvu64zurDtAu10cdd1re6zRgT+jw9q
 PAXGklfNBZLjdKER5MNEyYiFS9Lu4FP/fKLMtwNce6BlXuSDlc9ihDNNkzmsvpKU6PR+FxTOr+S
 9YyremWd1ya5eoaha/D0BgHyRk9dz1QtLK+tYKPw6IEgOrmXl39mJJHc63oK74HKr7obAzEyi3n
 vsbiNWgsFkh+5YFdA1/e4lIXTn8gfKthty0jGBg3TNnn0c5SZUuY81CZD9wDdlh8L4tFqAy/G3J
 uj5JnoQkzBAUfiLKL4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMyBTYWx0ZWRfX4l4o4NP7dqxl
 nU7lraK9CGYtpY1L2DuFqMab6r+MqgHZQIkQp7efMhJI4AyW9gzr/r0/8/GSH+8t8qNR8yNWAKK
 ClHI3LBJLrsVrm2qd87IPBxgdod1dVA=
X-Proofpoint-ORIG-GUID: G4hal-dRAXBEHMQr8uzdbQZ2DmnaV5g_
X-Proofpoint-GUID: G4hal-dRAXBEHMQr8uzdbQZ2DmnaV5g_
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae30595 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=Sq4l0du-5qcvokYK5kMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2026 08:36:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131643
Content-Type: text/plain; charset="utf-8"

Please merge these changes in wrynose. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1914

The following changes since commit f28a144aa0a0ae05ca2ee91e1aef6aa05f6a12db:

  vboxguestdrivers: fix vboxvideo build on kernels lacking drm_fb_helper_alloc_info (2026-10-06 13:52:06 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/wrynose
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/wrynose

for you to fetch changes up to c734c2cb9713dbd6d50697a9f6c25ebdf3ae589e:

  frr: Fix native clippy failing to load libatomic.so.1 (2026-10-29 10:19:10 +0530)

----------------------------------------------------------------

Altair Bueno Calvente (1):
  mdio-tools,mdio-netlink: upgrade 1.3.1 -> 1.3.2

Ankur Tyagi (19):
  rabbitmq-c: patch CVE-2026-44235
  squid: upgrade 7.6 -> 7.7
  cryptsetup: upgrade 2.8.7 -> 2.8.8
  znc: upgrade 1.10.2 -> 1.10.3
  srt: upgrade 1.5.6 -> 1.5.7
  swagger-ui: upgrade 5.32.14 -> 5.32.15
  python3-sdbus: upgrade 0.14.2 -> 0.14.3
  python3-werkzeug: upgrade 3.1.8 -> 3.1.9
  apache2: upgrade 2.4.68 -> 2.4.69
  xdg-dbus-proxy: upgrade 0.1.7 -> 0.1.9
  python3-tzdata: upgrade 2026.4 -> 2026.5
  python3-django: upgrade 5.2.17 -> 5.2.18
  python3-django: upgrade 6.0.8 -> 6.0.9
  tinyproxy: patch CVE-2026-54388
  zeroconf: ignore CVEs
  tmate: patch CVE-2026-4751
  udisks2: patch CVE-2026-7867
  libspdm: upgrade 3.8.2 -> 3.8.3
  postfix: upgrade 3.10.13 -> 3.10.14

Darsh Kelaiya (14):
  libdbi-perl: fix CVE-2026-73194
  libdbi-perl: fix CVE-2026-73193
  python3-aiohttp: fix CVE-2026-54273
  python3-aiohttp: fix CVE-2026-59881
  python3-aiohttp: fix CVE-2026-69243
  python3-aiohttp: fix CVE-2026-69244
  net-snmp: fix CVE-2026-89147
  ntfs-3g-ntfsprogs: fix CVE-2026-46572 and CVE-2026-42617
  ntfs-3g-ntfsprogs: fix CVE-2026-46571
  ntfs-3g-ntfsprogs: fix CVE-2026-46570
  ntfs-3g-ntfsprogs: fix CVE-2026-46569
  ntfs-3g-ntfsprogs: fix CVE-2026-42618
  ntfs-3g-ntfsprogs: fix CVE-2026-42616
  ntfs-3g-ntfsprogs: fix CVE-2026-40706

Hetvi Thakar (24):
  python3-grpcio-tools: set status for CVE-2023-33953
  python3-grpcio-tools: set status for CVE-2024-37168
  python3-grpcio-tools: set status for CVE-2026-33186
  python3-pyjwt: fix CVE-2026-103001
  python3-pyjwt: fix CVE-2026-102274
  python3-pyjwt: fix CVE-2026-102269
  python3-pyjwt: fix CVE-2026-102267
  python3-pyjwt: fix CVE-2026-102268 and CVE-2026-102270
  python3-pyjwt: fix CVE-2026-102271
  python3-pyjwt: fix CVE-2026-101917
  python3-pyjwt: fix CVE-2026-102275
  python3-pyjwt: fix CVE-2026-101918
  wireshark: upgrade 4.6.4 -> 4.6.8
  nginx: Fix CVE-2026-40701
  nginx: fix CVE-2026-42934
  nginx: fix CVE-2026-42946
  nginx: fix CVE-2026-42945
  nginx: fix CVE-2026-9256
  nginx: fix CVE-2026-42055
  nginx: fix CVE-2026-48142
  nginx: fix CVE-2026-42533
  nginx: fix CVE-2026-56434
  nginx: Ignore CVE-2026-40460
  nginx: Ignore CVE-2026-60005

Jason Schonberg (3):
  c-ares: upgrade 1.34.8 -> 1.34.9
  php: upgrade 8.5.11 -> 8.5.12
  brotli: upgrade 1.2.0 -> 1.2.1

Khem Raj (4):
  squid: upgrade 7.5 -> 7.6
  srt: Match SRCREV to tag
  pcp: Add readline-native and ncurses-native to pcp-native DEPENDS
  frr: Fix native clippy failing to load libatomic.so.1

Leon Anavi (1):
  python3-brotli: Upgrade 1.2.0 -> 1.2.1

Markus Volk (1):
  fwupd: create the fwupd-refresh user

Peter Marko (4):
  libwebsockets: patch CVE-2026-78161
  nss: remove compromised eMudhra certificates
  grpc: update gRPC repo roots
  python3-grpcio: update gRPC repo roots

Primoz Fiser (1):
  opencv: rewrite build-tree paths in all CPU-dispatch stub files

Yogita Urade (13):
  redis: fix CVE-2026-23479
  redis: fix CVE-2026-23631
  redis: fix CVE-2026-25243
  redis: fix CVE-2026-66373
  python3-pillow: Fix CVE-2026-54059 CVE-2026-54060 CVE-2026-55379
  python3-pillow: Fix CVE-2026-55380
  python3-pillow: Fix CVE-2026-59197
  python3-pillow: Fix CVE-2026-59198
  python3-pillow: Fix CVE-2026-59199
  python3-pillow: Fix CVE-2026-59200
  python3-pillow: Fix CVE-2026-59203
  python3-pillow: Fix CVE-2026-59205
  python3-pillow: CVE_STATUS for CVE-2026-55798

 .../files/CVE-2026-40706_p1.patch             |    60 +
 .../files/CVE-2026-40706_p2.patch             |    34 +
 .../files/CVE-2026-42616_p1.patch             |    70 +
 .../files/CVE-2026-42616_p2.patch             |    79 +
 .../files/CVE-2026-42618_p1.patch             |    53 +
 .../files/CVE-2026-42618_p2.patch             |   221 +
 .../files/CVE-2026-46569.patch                |    62 +
 .../files/CVE-2026-46570.patch                |    42 +
 .../files/CVE-2026-46571.patch                |    50 +
 .../CVE-2026-46572_CVE-2026-42617_p1.patch    |    66 +
 .../CVE-2026-46572_CVE-2026-42617_p2.patch    |   104 +
 .../CVE-2026-46572_CVE-2026-42617_p3.patch    |    35 +
 .../ntfs-3g-ntfsprogs_2022.10.3.bb            |    12 +
 .../srt/{srt_1.5.6.bb => srt_1.5.7.bb}        |     2 +-
 ...{postfix_3.10.13.bb => postfix_3.10.14.bb} |     2 +-
 ...e-reference-to-nonexisting-directory.patch |     5 +-
 ...quid-conf-tests-run-on-target-device.patch |    12 +-
 .../files/Set-up-for-cross-compilation.patch  |     8 +-
 .../files/Skip-AC_RUN_IFELSE-tests.patch      |     9 +-
 ...-serial-tests-config-needed-by-ptest.patch |     5 +-
 .../squid/{squid_7.5.bb => squid_7.7.bb}      |     2 +-
 .../znc/{znc_1.10.2.bb => znc_1.10.3.bb}      |     2 +-
 .../recipes-protocols/frr/frr_10.6.1.bb       |     8 +
 .../net-snmp/net-snmp/CVE-2026-89147.patch    |   399 +
 .../net-snmp/net-snmp_5.9.5.2.bb              |     1 +
 .../zeroconf/zeroconf_0.9.bb                  |     6 +
 ...netlink_1.3.1.bb => mdio-netlink_1.3.2.bb} |     0
 .../recipes-support/mdio-tools/mdio-tools.inc |     4 +-
 ...dio-tools_1.3.1.bb => mdio-tools_1.3.2.bb} |     1 +
 .../tinyproxy/tinyproxy/CVE-2026-54388.patch  |    32 +
 .../tinyproxy/tinyproxy_1.11.3.bb             |     1 +
 ...{wireshark_4.6.4.bb => wireshark_4.6.8.bb} |     2 +-
 meta-oe/recipes-bsp/fwupd/fwupd_2.0.19.bb     |     5 +-
 .../libwebsockets/CVE-2026-78161.patch        |    45 +
 .../libwebsockets/libwebsockets_4.5.8.bb      |     1 +
 .../rabbitmq-c/CVE-2026-44235.patch           |    85 +
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |     1 +
 ...ryptsetup_2.8.7.bb => cryptsetup_2.8.8.bb} |     2 +-
 ...e-repo-roots-to-chromium-roots-42094.patch | 14387 ++++++++++++++++
 ...curity-Update-gRPC-repo-roots.-43699.patch |  2617 +++
 meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb  |     2 +
 .../perl/libdbi-perl/CVE-2026-73193_p1.patch  |    51 +
 .../perl/libdbi-perl/CVE-2026-73193_p2.patch  |    38 +
 .../perl/libdbi-perl/CVE-2026-73194_p1.patch  |    80 +
 .../perl/libdbi-perl/CVE-2026-73194_p2.patch  |    37 +
 .../perl/libdbi-perl/CVE-2026-73194_p3.patch  |    34 +
 .../perl/libdbi-perl_1.647.bb                 |     5 +
 .../php/{php_8.5.11.bb => php_8.5.12.bb}      |     2 +-
 .../{brotli_1.2.0.bb => brotli_1.2.1.bb}      |     4 +-
 .../redis/redis-8.0.6/CVE-2026-23479.patch    |    77 +
 .../redis/redis-8.0.6/CVE-2026-23631.patch    |   119 +
 .../redis/redis-8.0.6/CVE-2026-25243.patch    |   275 +
 .../redis/redis-8.0.6/CVE-2026-66373.patch    |    96 +
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |     4 +
 .../tmate/files/CVE-2026-4751.patch           |    75 +
 meta-oe/recipes-extended/tmate/tmate_2.4.0.bb |     1 +
 .../{c-ares_1.34.8.bb => c-ares_1.34.9.bb}    |     2 +-
 .../{libspdm_3.8.2.bb => libspdm_3.8.3.bb}    |     2 +-
 ...ve-eMudhra-emSign-Root-CA-C1-and-emS.patch |   272 +
 ...ve-eMudhra-emSign-Root-CA-G3-from-NS.patch |   143 +
 meta-oe/recipes-support/nss/nss_3.122.bb      |     2 +
 .../recipes-support/opencv/opencv_4.13.0.bb   |     6 +-
 .../recipes-support/pcp/pcp-native_6.3.8.bb   |     2 +-
 .../udisks/udisks2/CVE-2026-7867-1.patch      |   249 +
 .../udisks/udisks2/CVE-2026-7867-2.patch      |   208 +
 .../udisks/udisks2/CVE-2026-7867-3.patch      |    53 +
 .../udisks/udisks2/CVE-2026-7867-4.patch      |    40 +
 .../udisks/udisks2/CVE-2026-7867-5.patch      |   348 +
 .../recipes-support/udisks/udisks2_2.10.2.bb  |     9 +-
 ...proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} |     2 +-
 .../python/files/CVE-2026-101917.patch        |   311 +
 .../python/files/CVE-2026-101918.patch        |   122 +
 .../python/files/CVE-2026-102267.patch        |   223 +
 .../CVE-2026-102268_CVE-2026-102270.patch     |   113 +
 .../python/files/CVE-2026-102269.patch        |   133 +
 .../python/files/CVE-2026-102271.patch        |   136 +
 .../python/files/CVE-2026-102274.patch        |    63 +
 .../python/files/CVE-2026-102275.patch        |    82 +
 .../python/files/CVE-2026-103001.patch        |   128 +
 .../python3-aiohttp/CVE-2026-54273_p1.patch   |   773 +
 .../python3-aiohttp/CVE-2026-54273_p2.patch   |   177 +
 .../python3-aiohttp/CVE-2026-59881.patch      |   103 +
 .../python3-aiohttp/CVE-2026-69243.patch      |   307 +
 .../python3-aiohttp/CVE-2026-69244.patch      |   159 +
 .../python/python3-aiohttp_3.13.5.bb          |    14 +-
 ...rotli_1.2.0.bb => python3-brotli_1.2.1.bb} |     2 +-
 ...ngo_5.2.17.bb => python3-django_5.2.18.bb} |     2 +-
 ...jango_6.0.8.bb => python3-django_6.0.9.bb} |     2 +-
 .../python/python3-grpcio-tools_1.76.0.bb     |     3 +
 .../0001-Update-gRPC-repo-roots.-43699.patch  |  2617 +++
 ...e-repo-roots-to-chromium-roots-42094.patch | 14324 +++++++++++++++
 .../python/python3-grpcio_1.78.0.bb           |     6 +
 ...-54059_CVE-2026-54060_CVE-2026-55379.patch |   168 +
 .../python3-pillow/CVE-2026-55380.patch       |    62 +
 .../python3-pillow/CVE-2026-59197.patch       |    74 +
 .../python3-pillow/CVE-2026-59198.patch       |    57 +
 .../python3-pillow/CVE-2026-59199.patch       |    84 +
 .../python3-pillow/CVE-2026-59200.patch       |    82 +
 .../python3-pillow/CVE-2026-59203.patch       |    45 +
 .../python3-pillow/CVE-2026-59205.patch       |    66 +
 .../python/python3-pillow_12.2.0.bb           |     9 +
 .../python/python3-pyjwt_2.12.1.bb            |    10 +-
 ...dbus_0.14.2.bb => python3-sdbus_0.14.3.bb} |     2 +-
 ...ata_2026.4.bb => python3-tzdata_2026.5.bb} |     2 +-
 ...eug_3.1.8.bb => python3-werkzeug_3.1.9.bb} |     2 +-
 ...er-ui_5.32.14.bb => swagger-ui_5.32.15.bb} |     2 +-
 .../{apache2_2.4.68.bb => apache2_2.4.69.bb}  |     2 +-
 .../nginx/files/CVE-2026-40701.patch          |    74 +
 .../nginx/files/CVE-2026-42533_p1.patch       |   127 +
 .../nginx/files/CVE-2026-42533_p2.patch       |   381 +
 .../nginx/files/CVE-2026-42533_p3.patch       |   704 +
 .../nginx/files/CVE-2026-42533_p5.patch       |   254 +
 .../nginx/files/CVE-2026-42934.patch          |    80 +
 .../nginx/files/CVE-2026-42945.patch          |    47 +
 .../nginx/files/CVE-2026-42946_p1.patch       |    47 +
 .../nginx/files/CVE-2026-42946_p2.patch       |    92 +
 .../nginx/files/CVE-2026-48142.patch          |    42 +
 .../nginx/files/CVE-2026-56434.patch          |    71 +
 .../nginx/files/CVE-2026-9256.patch           |    77 +
 .../nginx/nginx-1.28.3/CVE-2026-42055.patch   |   108 +
 .../nginx-1.28.3/CVE-2026-42533_p4.patch      |   587 +
 .../nginx/nginx-1.29.7/CVE-2026-42055.patch   |   188 +
 .../nginx-1.29.7/CVE-2026-42533_p4.patch      |   723 +
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |    19 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |    19 +
 125 files changed, 44822 insertions(+), 55 deletions(-)
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-40706_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42616_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-42618_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46569.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46570.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46571.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p1.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p2.patch
 create mode 100644 meta-filesystems/recipes-filesystems/ntfs-3g-ntfsprogs/files/CVE-2026-46572_CVE-2026-42617_p3.patch
 rename meta-multimedia/recipes-support/srt/{srt_1.5.6.bb => srt_1.5.7.bb} (95%)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.13.bb => postfix_3.10.14.bb} (99%)
 rename meta-networking/recipes-daemons/squid/{squid_7.5.bb => squid_7.7.bb} (98%)
 rename meta-networking/recipes-irc/znc/{znc_1.10.2.bb => znc_1.10.3.bb} (94%)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/CVE-2026-89147.patch
 rename meta-networking/recipes-support/mdio-tools/{mdio-netlink_1.3.1.bb => mdio-netlink_1.3.2.bb} (100%)
 rename meta-networking/recipes-support/mdio-tools/{mdio-tools_1.3.1.bb => mdio-tools_1.3.2.bb} (99%)
 create mode 100644 meta-networking/recipes-support/tinyproxy/tinyproxy/CVE-2026-54388.patch
 rename meta-networking/recipes-support/wireshark/{wireshark_4.6.4.bb => wireshark_4.6.8.bb} (97%)
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-78161.patch
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-44235.patch
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.8.7.bb => cryptsetup_2.8.8.bb} (98%)
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-Security-Update-repo-roots-to-chromium-roots-42094.patch
 create mode 100644 meta-oe/recipes-devtools/grpc/grpc/0001-security-Update-gRPC-repo-roots.-43699.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73193_p2.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p2.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-73194_p3.patch
 rename meta-oe/recipes-devtools/php/{php_8.5.11.bb => php_8.5.12.bb} (99%)
 rename meta-oe/recipes-extended/brotli/{brotli_1.2.0.bb => brotli_1.2.1.bb} (79%)
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23479.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-23631.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-25243.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis-8.0.6/CVE-2026-66373.patch
 create mode 100644 meta-oe/recipes-extended/tmate/files/CVE-2026-4751.patch
 rename meta-oe/recipes-support/c-ares/{c-ares_1.34.8.bb => c-ares_1.34.9.bb} (93%)
 rename meta-oe/recipes-support/libspdm/{libspdm_3.8.2.bb => libspdm_3.8.3.bb} (97%)
 create mode 100644 meta-oe/recipes-support/nss/nss/0008-Bug-2083709-Remove-eMudhra-emSign-Root-CA-C1-and-emS.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/0009-Bug-2084101-Remove-eMudhra-emSign-Root-CA-G3-from-NS.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-1.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-2.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-3.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-4.patch
 create mode 100644 meta-oe/recipes-support/udisks/udisks2/CVE-2026-7867-5.patch
 rename meta-oe/recipes-support/xdg-dbus-proxy/{xdg-dbus-proxy_0.1.7.bb => xdg-dbus-proxy_0.1.9.bb} (93%)
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-101917.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-101918.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102267.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102268_CVE-2026-102270.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102269.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102271.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102274.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-102275.patch
 create mode 100644 meta-python/recipes-devtools/python/files/CVE-2026-103001.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-54273_p2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-59881.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69243.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2026-69244.patch
 rename meta-python/recipes-devtools/python/{python3-brotli_1.2.0.bb => python3-brotli_1.2.1.bb} (84%)
 rename meta-python/recipes-devtools/python/{python3-django_5.2.17.bb => python3-django_5.2.18.bb} (70%)
 rename meta-python/recipes-devtools/python/{python3-django_6.0.8.bb => python3-django_6.0.9.bb} (79%)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Update-gRPC-repo-roots.-43699.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-Update-repo-roots-to-chromium-roots-42094.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-54059_CVE-2026-54060_CVE-2026-55379.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-55380.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59197.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59198.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59199.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59200.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59203.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/CVE-2026-59205.patch
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.14.2.bb => python3-sdbus_0.14.3.bb} (83%)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2026.4.bb => python3-tzdata_2026.5.bb} (86%)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.8.bb => python3-werkzeug_3.1.9.bb} (91%)
 rename meta-webserver/recipes-devtools/swagger-ui/{swagger-ui_5.32.14.bb => swagger-ui_5.32.15.bb} (94%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb} (99%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42934.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch

-- 
2.55.0

