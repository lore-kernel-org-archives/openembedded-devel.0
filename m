Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB3F4D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 04:05:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1211.1768881928510555214
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 20:05:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=hrLJ/rbR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=cuoXSI+z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JMCYZH2411126
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4x21bHrw/e/1kiUfTDR7cFIUxtNZi16Wuz0
	tFg61M6g=; b=hrLJ/rbRtVj7hzzYwqB1S6b60drZM2dOz2yGvYdWw1XnH9FjgEm
	bLWFQF/60RychsbTS2ftLkpYp+UYLfKV2XeefO3KvvsbdcDnImIcME55Y/tHKMcz
	p+P7LxnX5MI3b5SeIpKqXRYF6yO7N8XguR0kvthmq8Tistj3zl//0//IHigPXHqg
	/NsR2gUPdqO2bDpH4FyzjMUXrkb+P+5e+izAzUAzMYU+ZrOl1unNd2hTXVO6NUla
	9CKb7qRRa18qB/YUNSs1Cnqc5mjEzpqtFtmEsIjwR4+82YGIDsGFnDHMVOL/iNeW
	8USRLz9qLQV4uII273TgVWsKzIdc4Ez4nQA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsnpdht40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:05:27 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so9217784a91.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 20:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768881926; x=1769486726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4x21bHrw/e/1kiUfTDR7cFIUxtNZi16Wuz0tFg61M6g=;
        b=cuoXSI+zZdKen0jIVeJlfGnWUQnzk/N0y3+R5vyv8LNkuhtX3mv83ZN5Cti2CVvhAx
         1uk6b+trCGZP8FQFbxDT7F22QucBln6ePa5w5B9ct5YnUq7Y0a6Blj/Q4P4YZJrCdG2u
         4XX2iqTqA+1QbVOftTVr+Vx5xjXeKsWXewfl9QS7oYZRKbonjxZ0haJeSPjhy7WoIuqf
         Z0dwZLBExSx55Ztos78h92YjCD8xhmhbrnGp3vtMZn/r8Xc3tupNpRLZjq9sPqN/G0WH
         jOtWw53WMcD9I1MAnxgbrcNG/WCTCZZLxqYGQG4GJ7UnaBiv4mae84B1L7eMy/pLwQSv
         Mrhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768881926; x=1769486726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4x21bHrw/e/1kiUfTDR7cFIUxtNZi16Wuz0tFg61M6g=;
        b=Nikf0aSe0ZmpiL4OI5JFvhVjSwHlbEny7S3qwpdztchCNn9doQZy5IVRmpkvHwHI4+
         wtQQt2Hv/qmiD+DZ7AdQtAXX5BqKP4hPCw+WOXhBqyVBnqY1vON8r6LHJA5B4wRLm72m
         o/VjnbWP6wA2kBlsnQj3eIQQ/TPjiIwHiP6lG0JHv3Mm/wVnY9VB+9AjJVSlPhLnMttw
         lflJalliTCykQzduZH1OI1s0AxCnET9n+MQrF1kgCXn9qPq1CzuIuvzad/YK9r24oXDo
         A2Yux6RerQJyDnCgOTTfs8mYHCdVRV5ms9yKItaL+/hA7E96xVPk2YzVq7YTRaoy4x3W
         LZhQ==
X-Gm-Message-State: AOJu0YzzvdbZIXmzv/NGxCEmthC4kkcvyKzQ2N4ssiajG75NWuPutL8Q
	6uOXG+WlJmFXCYtZgV/z0tzgVoLrBBS0Z0G3mFzI7gb2s/yEX3gfUmG0Bax+kU1it8ZIFoSJWkl
	NpApZCwxWptSd54SDca1BhWSysIHRdhH4iRRarE4UVx9uC3OF8jqTNZTWXtH2hJBq/aCzdkgIsv
	LxigjCY4/V5kKUQe3uXbE=
X-Gm-Gg: AZuq6aKH7J7Np7049vq6bkKTHfw1fX4LGx6PM+lffyWuf87eje7zo0hqMzFO13PUbNy
	lQ3PVl9ZP0J0w+OtVObtzFdd+4ox8tsKokhdsOn7SGws5YOA0TtJiyo45xizgX3XhKfmlEfpgoE
	fkokaR4TpsU+x4+Ath0V291rrMLPRzclC6PkXFZuP/+kVWeWbIyfvd8eqE1+rGlcm3EBwYJYfRN
	JiWueGtiCyaRrdPDZNh53PWOsRfoPE28h2o73luhqHgU959H4aUO4uRlQqtzo84fVANTqcYn6Zo
	QFpHRruv1typlhilnN4Vb4iTX1poT61HPkBYwleQ7lwy5odDT8MOsnr+H/bj/DmFaEMmGWfqrqy
	yceh+xnfFDPy9Kcpb4UWby5gKqVDRNxqw8aBgA51z
X-Received: by 2002:a17:90b:2744:b0:343:66e2:5f9b with SMTP id 98e67ed59e1d1-35272f9271bmr11816985a91.24.1768881926279;
        Mon, 19 Jan 2026 20:05:26 -0800 (PST)
X-Received: by 2002:a17:90b:2744:b0:343:66e2:5f9b with SMTP id 98e67ed59e1d1-35272f9271bmr11816949a91.24.1768881925703;
        Mon, 19 Jan 2026 20:05:25 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35273102119sm10450081a91.10.2026.01.19.20.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:05:25 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [PATCH 00/32] Scarthgap pull request
Date: Tue, 20 Jan 2026 09:35:13 +0530
Message-ID: <cover.1768880370.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NtncssdJ c=1 sm=1 tr=0 ts=696eff07 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=SAMslf-K8dBsydj8rRgA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: c2svum3wVZyDod3pow3wiay8LXAb_AX6
X-Proofpoint-ORIG-GUID: c2svum3wVZyDod3pow3wiay8LXAb_AX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDAzMCBTYWx0ZWRfX0xw1vDjbYWMz
 7fSHQIElDHc0E5CndXBLkxPJUkmDnOMLUP+im2YF4EGVLS7AVCmyduWmeg9+5zr2h+Pq9NBmZaO
 fSBb6A0xi1AWINSBHdhCVWtw5x0YsN6eYwS3U6OBQXA1GnFTWr+YVisd+KUAGXYlIyECq3biyz/
 opI6rkD21+cgY98BUdzMZpG7j/bOHPYDX0GLc1eHy4nSFz5PPdrquMA/ISfbaJq4sngi0NnJ4kh
 hu6wwYQfPBnTkoWqFUQLFT3/I2HQWwk+25Y1k04Lky8dA3Zu79hymqRG+eew5t4ZKwrPJUg2dqJ
 PVfCoweVZ7/ARz5II66qpsWi6SqktshoxqJE16qkx2tI2khmKk+EroXkAWg/IRBhLagGzOn060p
 BQ5lj/7C8wYqi8eaI4jxZNasdZBlcEtqUgR3fvJ0T8QRk5Ln5rhpnCQq9rQGOc956oxejTXmWmG
 +Tfjs5muoEKLAzCfl2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-20_01,2026-01-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200030
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123652

Please merge these changes in scarthgap. Tested on AB and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1257

The following changes since commit 2df869df1c3fa74103098bba65c06e55d0d3664a:

  freerdp3: drop CVE-2025-68118 patch (2026-01-13 06:53:10 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Anil Dongare (1):
  php 8.2.29: CVE-2025-14177

Ankur Tyagi (22):
  gimp: upgrade 2.10.36 -> 2.10.38
  gimp: patch CVE-2025-14422
  gimp: patch CVE-2025-14425
  gimp: ignore CVE-2025-48796
  gimp: patch CVE-2025-5473
  python3-aiohttp: upgrade 3.9.4 -> 3.9.5
  python3-aiohttp: patch CVE-2024-52304
  python3-cob2: upgrade 5.6.3 -> 5.6.4
  python3-configobj: patch CVE-2023-26112
  python3-eventlet: patch CVE-2025-58068
  python3-marshmallow: upgrade 3.21.1 -> 3.21.3
  python3-pymongo: upgrade 4.6.1 -> 4.6.3
  python3-tornado: patch CVE-2025-47287
  python3-tornado: patch CVE-2025-67724
  python3-tornado: patch CVE-2025-67726
  python3-tqdm: upgrade 4.66.2 -> 4.66.3
  python3-werkzeug: ignore CVE-2025-66221 and CVE-2026-21860
  python3-virtualenv: upgrade 20.25.0 -> 20.25.3
  gpsd: patch CVE-2025-67268
  gpsd: patch CVE-2025-67269
  frr: patch multiple CVEs
  fluidsynth: patch CVE-2025-56225

Gyorgy Sarvari (5):
  python3-ldap: set CVE_PRODUCT
  python3-ldap: upgrade 3.4.4 -> 3.4.5
  boinc-client: set CVE_PRODUCT
  boinc-client: mark CVE-2013-2018 patched
  lmdb: patch CVE-2026-22185

Jackson (1):
  tcpreplay 4.4.4: Fix CVE-2025-9384

Peter Marko (1):
  gimp: ignore CVE-2007-3741

Wang Mingyu (1):
  openfortivpn: upgrade 1.22.0 -> 1.22.1

Yoann Congal (1):
  boinc-client: fix hostname reproducibility

 .../gimp/gimp/CVE-2025-14422.patch            |  64 ++++
 .../gimp/gimp/CVE-2025-14425.patch            |  70 +++++
 .../gimp/gimp/CVE-2025-5473.patch             |  38 +++
 .../gimp/{gimp_2.10.36.bb => gimp_2.10.38.bb} |  11 +-
 .../fluidsynth/CVE-2025-56225.patch           |  25 ++
 .../fluidsynth/fluidsynth_2.3.4.bb            |   1 +
 ...tivpn_1.22.0.bb => openfortivpn_1.22.1.bb} |   2 +-
 ...1102-61103-61104-61105-61106-61107_1.patch |  37 +++
 ...1102-61103-61104-61105-61106-61107_2.patch | 273 ++++++++++++++++++
 ...1102-61103-61104-61105-61106-61107_3.patch |  78 +++++
 ...1102-61103-61104-61105-61106-61107_4.patch | 119 ++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   4 +
 .../tcpreplay/tcpreplay/CVE-2025-9384.patch   |  38 +++
 .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
 .../lmdb/files/CVE-2026-22185.patch           |  31 ++
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.31.bb       |   1 +
 .../php/php/CVE-2025-14177.patch              |  84 ++++++
 meta-oe/recipes-devtools/php/php_8.2.29.bb    |   1 +
 .../boinc/boinc-client_7.20.5.bb              |   9 +-
 .../gpsd/gpsd/CVE-2025-67268.patch            | 214 ++++++++++++++
 .../gpsd/gpsd/CVE-2025-67269.patch            | 150 ++++++++++
 meta-oe/recipes-navigation/gpsd/gpsd_3.24.bb  |   2 +
 .../python3-aiohttp/CVE-2024-52304.patch      | 124 ++++++++
 ...http_3.9.4.bb => python3-aiohttp_3.9.5.bb} |   4 +-
 ...-cbor2_5.6.3.bb => python3-cbor2_5.6.4.bb} |   2 +-
 .../python3-configobj/CVE-2023-26112.patch    |  25 ++
 .../python/python3-configobj_5.0.8.bb         |   2 +
 .../python3-eventlet/CVE-2025-58068.patch     |  42 +++
 .../python/python3-eventlet_0.36.1.bb         |   2 +
 ....21.1.bb => python3-marshmallow_3.21.3.bb} |   2 +-
 ...ongo_4.6.1.bb => python3-pymongo_4.6.3.bb} |   2 +-
 .../python3-tornado/CVE-2025-47287.patch      | 232 +++++++++++++++
 .../python3-tornado/CVE-2025-67724.patch      | 118 ++++++++
 .../python3-tornado/CVE-2025-67726.patch      |  99 +++++++
 .../python/python3-tornado_6.4.2.bb           |   5 +
 ...-tqdm_4.66.2.bb => python3-tqdm_4.66.3.bb} |   2 +-
 ....25.0.bb => python3-virtualenv_20.25.3.bb} |   2 +-
 .../python/python3-werkzeug_3.0.6.bb          |   3 +
 ...n3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb} |  10 +-
 39 files changed, 1915 insertions(+), 14 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14422.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-14425.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.patch
 rename meta-gnome/recipes-gimp/gimp/{gimp_2.10.36.bb => gimp_2.10.38.bb} (82%)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
 rename meta-networking/recipes-connectivity/openfortivpn/{openfortivpn_1.22.0.bb => openfortivpn_1.22.1.bb} (93%)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_1.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_2.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_3.patch
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2025-61099-61100-61101-61102-61103-61104-61105-61106-61107_4.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9384.patch
 create mode 100644 meta-oe/recipes-dbs/lmdb/files/CVE-2026-22185.patch
 create mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67268.patch
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd/CVE-2025-67269.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2024-52304.patch
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.4.bb => python3-aiohttp_3.9.5.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-cbor2_5.6.3.bb => python3-cbor2_5.6.4.bb} (89%)
 create mode 100644 meta-python/recipes-devtools/python/python3-configobj/CVE-2023-26112.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-eventlet/CVE-2025-58068.patch
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.21.1.bb => python3-marshmallow_3.21.3.bb} (92%)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.6.1.bb => python3-pymongo_4.6.3.bb} (90%)
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2025-47287.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67724.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2025-67726.patch
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.2.bb => python3-tqdm_4.66.3.bb} (81%)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.25.0.bb => python3-virtualenv_20.25.3.bb} (85%)
 rename meta-python/recipes-networking/python/{python3-ldap_3.4.4.bb => python3-ldap_3.4.5.bb} (74%)

-- 
2.52.0


