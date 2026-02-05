Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63105EA7963
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 04:05:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13345.1770264299550811482
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 20:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=C83mIt4w;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Zag5C2eq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6153dkxH2639675
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Feb 2026 04:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bnw+abm232nnL6hrWkoZb/
	S5ygsrxHSUvKOzTCqpwVQ=; b=C83mIt4wpS2KZO3G91YaHm/3X803LTU7C83BYu
	LdD4i2lxsFqba7D7q7dRT4R6W1CafQ6nDmq/H2YW5vlKp1GLXO0k91IYQaPFar3S
	Aa+c+7JO5ODCyLthBKeSOICfVV+oDW3Rncf8q3yf0jR+PJbRjEf5g8Mpal/BUZ5C
	Ke7+nyD6eJUmKlZW7daxhLksJAQl7WFymZ8AKBd+r5KtrsR9dPoPpr+8RQYCd57d
	X3YfF53anZxmNYBTjoQ5AIn0YjhGzu4WAGLGd3wIcxyWd0igQVL+XHrYvYx/VJs3
	iCZkekC0NEU3IQd9Sp/031CKrMlw5a9tA2em4bXL43iBzkiA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qva9e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:04:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c6310f81285so827913a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 20:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770264298; x=1770869098; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bnw+abm232nnL6hrWkoZb/S5ygsrxHSUvKOzTCqpwVQ=;
        b=Zag5C2eqeFTpVusACuEcaSbBHNrm48DJBDWQemU7m6ZzD+sPZ0Rgawl2lPXslwp8tY
         5U3uMOGFwhJMQwE2pftUTLs4kxISk+9ZEAbjUDvfL7rhF0zIG6WtLs8lWvRAPf74HZai
         SCHEq9ACI0rqg4hgn1d5PM++BpTD3XoLsjdMI1gEFGN4hTfLp+2FFke/O1uoPBRN4oD6
         6+KmcuuYK+YGEn0duVLXhoPEZ58GbLpQoK3a9P8SywAksDDNLJe4ThSIATEkuDNuPIrv
         8khBrcPLLWUMdFC0Jh27pZZp2lDpMZOR0DdVEx5k6AUPnQXPEpVPO5tIJT8R/9+deBdw
         m4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770264298; x=1770869098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bnw+abm232nnL6hrWkoZb/S5ygsrxHSUvKOzTCqpwVQ=;
        b=foGh0c3GIZHnnkVJdcOBFQ37P3QWgPE3xmNlsJ4PTN1DgnPM/QBc4iOPnpFU985hWM
         /7aktAaRcdNNmUN9TcaTmKnnlZb6XbT3iyaJThA806XluVYmyTPD5yKpcYasEIjJb47T
         hL8Xb7/JZSI2W8GURaUBUDlbATthM6Av+Sws3utWWaV0nFktcsEuGOn0jlbEDckusd/p
         tWUGnU4jcrYZKUDwWdb06LVcLC01G1XZROXBQ+8KPBGL24lNpJe5eXxgyEv1O+I+4T1F
         ORUmtfJALFi0PW3aQ0Z0mQzK9qm9jfvArRAI+JPQATeN5B5SyozdJAJAThJ4xlELbKAg
         Qnbg==
X-Gm-Message-State: AOJu0Yy8qjlsX396psYMvcU5IaIe1o/1J93kXONt2qsDd2569GaXuhng
	kZ63uHtitriv0HWSpBJ6OJ1xyA5Qpd1ubVLrNsbytVA56xEJt2Y09v/94QbpjBw3eZ0bckqwXML
	7x3BOjasIQdIyyNXTUTHUc8MjbCsJq51T8OUP55xAubVLk63g7jXilffGA5TPsIgh0OHe+Dey/7
	G5rAAINvAZj0Xdsl0IZQE=
X-Gm-Gg: AZuq6aJYg+O1HmTakqf+jeY95uhq8/O/OqpoY+HVqlGioyb8ohxQJjjhL+WIdAL+1e0
	ZzUlvybM9C/8JOfYSHLUuTrSu+thEdWSX5szS/A1EomhNozsyuptzHqfsHy/YByISn264IFjNT4
	ZSDTva+XKsgKGpBNS4SVTrCqrJYXCE3TjVQXmQo+rMruDoZucAb3UXDuV78gasxU8ljTd46tRwe
	imiiF2SZ8tXinFQXXxzI3YKP4ehFBaYRRnyDSfYYumn3X9E0H8PEgS0GRCNL+Oc7x5mH2XA4Q4i
	X5dGorCtZnXTVIpXRMiikcCIbBGO+C9AjLcHFeQcGEEWmGd4hB70F/79Jz+hbEfmxR+gPyUS8Ka
	XMfYC871TDnmYsaVH6boW96zwrai4qp94aaeqq5Et
X-Received: by 2002:a05:6a20:7486:b0:38e:9c64:bd29 with SMTP id adf61e73a8af0-3937240570amr4652472637.50.1770264298225;
        Wed, 04 Feb 2026 20:04:58 -0800 (PST)
X-Received: by 2002:a05:6a20:7486:b0:38e:9c64:bd29 with SMTP id adf61e73a8af0-3937240570amr4652455637.50.1770264297668;
        Wed, 04 Feb 2026 20:04:57 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d434f17sm3916502b3a.41.2026.02.04.20.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 20:04:57 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [PATCH 00/45] Whinlatter pull request
Date: Thu,  5 Feb 2026 09:34:38 +0530
Message-ID: <cover.1770263721.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=698416eb cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=O24Aq5uEAAAA:8
 a=bBaki8JrksI_8fc6wP0A:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=SYBONWESK5muIIdMMRMZ:22
X-Proofpoint-GUID: L59gsd3GMFE5_JfFmYAvxIYgaQ5g6bwO
X-Proofpoint-ORIG-GUID: L59gsd3GMFE5_JfFmYAvxIYgaQ5g6bwO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDAyNCBTYWx0ZWRfX0Nbi6if1SXXi
 D9VfjWRt3CYRhNbLAvQq7b5jUaNhep0ZcGverFTgmkawpvDK97nOoc/a0O/31O8kczFm5cVw+J/
 IjkaRQsAhlqp/t0Y5spECU3EHX0dvypRmTIXzcO2PlIa29rNh1Gug4ofMwt5RGvVsvwPrX3EjyS
 euALHEvzdU1siaeli83j8+ivg+x5EPEAfdqXBZ57AAGqDZJpa/mdjCYbrrsbJuOYgSww4Sps8P/
 OzBva2k602xVWVd2Svx1g7ZvWpq1lh5B7kCUzzyMyVqfdu7fadwCjiIpb0DeyimRv6U1BqkMRdK
 sVFiVIENJdsVe5Ck9x/LIWYXA5zfK/91hh1Zdke8I96Jko/66sQQfOAu1e5QoB8oT/8O1yE5s/Y
 DAohMoWJVvKe4gkK/JbXE22x1KU/yWiOPvN2NY/uXlNHS2Os0YyZXh+T0AjgBVHijEBAQrylRl0
 3QRp0IIBDVspvYrmMPQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_08,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 04:05:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124150

Please merge these changes in whinlatter. Tested locally and on
autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1294

The following changes since commit 16cd5b1b8d06d979f4f191aa95133a90c843c03a:

  libowfat: update SRC_URI (2026-01-21 10:28:20 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib stable/whinlatter-next
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=stable/whinlatter-next

Gyorgy Sarvari (37):
  frr: patch CVE-2025-61099..61107
  xrdp: patch CVE-2022-23468
  xrdp: patch CVE-2022-23477
  xrdp: patch CVE-2022-23478
  xrdp: patch CVE-2022-23479
  xrdp: patch CVE-2022-23480
  xrdp: patch CVE-2022-23481
  xrdp: patch CVE-2022-23482
  xrdp: patch CVE-2022-23483
  xrdp: patch CVE-2022-23484
  xrdp: patch CVE-2022-23493
  xrdp: patch CVE-2023-40184
  xrdp: patch CVE-2023-42822
  fontforge: patch CVE-2025-15279
  fontforge: patch CVE-2025-15275
  fontforge: patch CVE-2025-15269
  fontforge: patch CVE-2025-15270
  gimp: mark CVE-2025-15059 patched
  gpsd: patch CVE-2025-67268
  gpsd: patch CVE-2025-67269
  libcdio: patch CVE-2024-36600
  libcupsfilters: patch CVE-2025-64503
  ndpi: ignore CVE-2025-25066
  ez-ipupdate: patch CVE-2003-0887
  proftpd: ignore CVE-2021-47865
  sblim-sfcc: fix SRC_URI
  anthy: fix SRC_URI
  ttf-vlgothic: fix SRC_URI
  linux-atm: fix SRC_URI
  gimp: patch libunwind detection
  python3-aiohttp: patch CVE-2025-69224
  python3-aiohttp: patch CVE-2025-69225
  python3-aiohttp: patch CVE-2025-69226
  python3-aiohttp: patch CVE-2025-69227
  python3-aiohttp: patch CVE-2025-69228
  python3-aiohttp: patch CVE-2025-69229
  python3-aiohttp: patch CVE-2025-69230

Jason Schonberg (2):
  nodejs: upgrade 22.21.1 -> 22.22.0
  Use https when accessing archive.xfce.org

Liu Yiding (1):
  python3-protobuf: upgrade 6.33.1 -> 6.33.2

Markus Volk (1):
  gimp: update 3.0.6 -> 3.0.8

Peter Marko (1):
  python3-protobuf: upgrade 6.33.2 -> 6.33.5

Tom Geelen (1):
  unicode-ucd: adjust to correct checksum values.

Trevor Gamblin (1):
  hdf5: fix shasum, downloadfilename

Wang Mingyu (1):
  imagemagick: upgrade 7.1.2-12 -> 7.1.2-13

 .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 --
 ...ind-header-detection-on-non-macOS-pl.patch |  51 +++
 .../gimp/gimp/CVE-2025-14422.patch            |  66 ----
 .../gimp/gimp/CVE-2025-14423.patch            | 106 ------
 .../gimp/gimp/CVE-2025-14424.patch            |  34 --
 .../gimp/gimp/CVE-2025-14425.patch            |  79 ----
 .../gimp/{gimp_3.0.6.bb => gimp_3.0.8.bb}     |  11 +-
 .../ez-ipupdate/ez-ipupdate_3.0.11b7.bb       |   7 +
 .../ez-ipupdate/files/CVE-2003-0887.patch     | 158 ++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.9.bb  |   1 +
 .../frr/frr/CVE-2025-61099-61107-1.patch      |  40 ++
 .../frr/frr/CVE-2025-61099-61107-2.patch      |  80 ++++
 .../frr/frr/CVE-2025-61099-61107-3.patch      | 293 ++++++++++++++
 .../recipes-protocols/frr/frr_10.4.2.bb       |   3 +
 .../linux-atm/linux-atm_2.5.2.bb              |   2 +-
 .../recipes-support/ntopng/ndpi_4.2.bb        |   3 +-
 .../oe-npm-cache                              |   0
 ....21.bb => nodejs-oe-cache-native_22.22.bb} |   0
 .../{nodejs_22.21.1.bb => nodejs_22.22.0.bb}  |   2 +-
 .../sblim-sfcc/sblim-sfcc_2.2.8.bb            |   2 +-
 .../fontforge/fontforge/CVE-2025-15269.patch  |  35 ++
 .../fontforge/fontforge/CVE-2025-15270.patch  |  44 +++
 .../fontforge/fontforge/CVE-2025-15275.patch  |  33 ++
 .../fontforge/CVE-2025-15279-1.patch          |  41 ++
 .../fontforge/CVE-2025-15279-2.patch          |  34 ++
 .../fontforge/fontforge_20230101.bb           |   7 +-
 .../ttf-fonts/ttf-vlgothic_20200720.bb        |   2 +-
 .../libcdio/libcdio/CVE-2024-36600.patch      |  32 ++
 .../libcdio/libcdio_2.2.0.bb                  |   4 +-
 .../gpsd/gpsd/CVE-2025-67268.patch            |  97 +++++
 .../gpsd/gpsd/CVE-2025-67269.patch            | 158 ++++++++
 .../recipes-navigation/gpsd/gpsd_3.26.1.bb    |   2 +
 .../cups/libcupsfilters/CVE-2025-64503.patch  |  47 +++
 .../cups/libcupsfilters_2.1.1.bb              |   8 +-
 meta-oe/recipes-support/anthy/anthy_9100h.bb  |   2 +-
 meta-oe/recipes-support/hdf5/hdf5_2.0.0.bb    |   6 +-
 ...ck_7.1.2-12.bb => imagemagick_7.1.2-13.bb} |   6 +-
 .../unicode-ucd/unicode-ucd_14.0.0.bb         |   6 +-
 .../xrdp/xrdp/CVE-2022-23468.patch            |  34 ++
 .../xrdp/xrdp/CVE-2022-23477.patch            |  38 ++
 .../xrdp/xrdp/CVE-2022-23478.patch            |  85 +++++
 .../xrdp/xrdp/CVE-2022-23479.patch            |  83 ++++
 .../xrdp/xrdp/CVE-2022-23480-1.patch          | 356 ++++++++++++++++++
 .../xrdp/xrdp/CVE-2022-23480-2.patch          |  54 +++
 .../xrdp/xrdp/CVE-2022-23481.patch            |  46 +++
 .../xrdp/xrdp/CVE-2022-23482.patch            |  69 ++++
 .../xrdp/xrdp/CVE-2022-23483.patch            |  65 ++++
 .../xrdp/xrdp/CVE-2022-23484.patch            |  31 ++
 .../xrdp/xrdp/CVE-2022-23493.patch            |  33 ++
 .../xrdp/xrdp/CVE-2023-40184.patch            |  73 ++++
 .../xrdp/xrdp/CVE-2023-42822.patch            | 304 +++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  13 +
 .../python3-aiohttp/CVE-2025-69224.patch      |  93 +++++
 .../python3-aiohttp/CVE-2025-69225.patch      |  49 +++
 .../python3-aiohttp/CVE-2025-69226.patch      | 134 +++++++
 .../python3-aiohttp/CVE-2025-69227.patch      | 148 ++++++++
 .../python3-aiohttp/CVE-2025-69228.patch      |  47 +++
 .../python3-aiohttp/CVE-2025-69229-1.patch    | 111 ++++++
 .../python3-aiohttp/CVE-2025-69229-2.patch    | 255 +++++++++++++
 .../python3-aiohttp/CVE-2025-69230.patch      |  85 +++++
 .../python/python3-aiohttp_3.12.15.bb         |   9 +
 ...f_6.33.1.bb => python3-protobuf_6.33.5.bb} |   2 +-
 meta-xfce/classes/thunar-plugin.bbclass       |   2 +-
 meta-xfce/classes/xfce-app.bbclass            |   2 +-
 meta-xfce/classes/xfce-panel-plugin.bbclass   |   2 +-
 meta-xfce/classes/xfce.bbclass                |   4 +-
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb       |   2 +-
 .../vala/xfce4-vala_4.10.3.bb                 |   2 +-
 .../diskperf/xfce4-diskperf-plugin_2.8.0.bb   |   2 +-
 .../netload/xfce4-netload-plugin_1.5.0.bb     |   2 +-
 .../xfce4-dev-tools/xfce4-dev-tools_4.21.0.bb |   2 +-
 71 files changed, 3416 insertions(+), 353 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-bz2.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson-Fix-libunwind-header-detection-on-non-macOS-pl.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14423.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14424.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
 rename meta-gnome/recipes-gimp/gimp/{gimp_3.0.6.bb => gimp_3.0.8.bb} (92%)
 create mode 100644 meta-networking/recipes-connectivity/ez-ipupdate/files/CVE-2003-0887.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-1.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-2.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61107-3.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.21 => nodejs-oe-cache-22.22}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.21.bb => nodejs-oe-cache-native_22.22.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.21.1.bb => nodejs_22.22.0.bb} (98%)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15269.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15270.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-1.patch
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15279-2.patch
 create mode 100644 meta-oe/recipes-multimedia/libcdio/libcdio/CVE-2024-36600.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-12.bb => imagemagick_7.1.2-13.bb} (98%)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23468.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23477.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23478.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23479.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-1.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23480-2.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23481.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23482.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23483.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23493.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-40184.patch
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2023-42822.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69224.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69225.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69226.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69227.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69228.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-1.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69229-2.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-69230.patch
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.1.bb => python3-protobuf_6.33.5.bb} (95%)

-- 
2.52.0


