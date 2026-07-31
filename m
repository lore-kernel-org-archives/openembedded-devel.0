Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C26C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 04:21:22 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4050.1785471680199724922
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2026 21:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ltqTDK31;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=II/3Efii;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V2Oep42910044
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 04:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rFDprARhpMaDWgJ8WpFjhq
	fThe9BMCU8JfCbCh39D6o=; b=ltqTDK31pvMN8bDF5etUiVlY5PxuGW4CDRzgC+
	4Bi1kvcUYO/0oN48jjv2uh+nOL0/LJHRZSiETHscTGgiPDUabPl6lDcTAfw9e2+y
	HO/hHjBNBVPe1YT23CljLvoGG2WUN/MKcpvcawXuAhzIEwYQk9EI7VmBJ42O61TM
	HZcpNHBFyeDxsCWDiVJqqReHmx8Kh5ZeYIoBcam/x7XrvrEjImLWbUO66nCmck1x
	bUppjKYFGpOyaHUS6gQbbz3HpaYnBNmVbv1cO1oQLt/VWM6RKNyT+e3to3Bu603i
	8RY0BAb61zSx2Amgd3HjPN1IJnSt2cWVGn/LN32RbuYjfB/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frjw7gc3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 04:21:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6dd278512so361858a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2026 21:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785471678; x=1786076478; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFDprARhpMaDWgJ8WpFjhqfThe9BMCU8JfCbCh39D6o=;
        b=II/3Efii4T6UYOHWEMAFA0f4KrFLkVK6dTo6l4K13xr6rzgVZ5MQwZIv23Q4ABWzz5
         LLV8IOyAn+0b4MFDPtnlHf4l8MMvYD2KrpQMySYGfTFAekeDwg57zpOP9cRZgQGwUK04
         6vXBnd+3mUREcbtKK7MfMG/5t4L5eEaXMoBaZdNIQcA+2XxXdw6064lDF1vfW23e49hD
         MGomToXTK0WRKaJYIvU+EhzgnYC0nhIM1vhXW63LBOdvR1RCMiGtZF/mtHN6Cp9unzO0
         wgem2+Lb5dNTCqvCUin4j60mh9B7+ySaR1odRHMm/HMJ5wEdhtv4FBxmqNpWVXP8dElU
         t4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785471678; x=1786076478;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFDprARhpMaDWgJ8WpFjhqfThe9BMCU8JfCbCh39D6o=;
        b=WNi31s5kGb17yrNOTauls9zFfkmvQ/kSP6qpD/AfGYf385Y3Wtn2AyJhqbTdHZYn1I
         dAk7KIu9jNVQyJsEcFQFxGms26T6Lj4YmQ/oe4Zcrs3sMOvct3em2tVR/WdySJQEaOBg
         Wxyz01gfgtoTfS7n/0A6TjRSECMzg/7Opn3NnaAU7htZ5svSzkkVEWfSYZlXMePuROpK
         Sd4sWxqfXRbt4/tjNFgBf5nXAtETJVMHpS6YQ1nVk5zv3xoiX6RwLGgtUfon4H91+nox
         rmrgia07sPgpGSZsZBSJHKqzQNvONOX6kxWhJJw3OVcZyckWfWiLNUJXixSJYTcTWjtQ
         uifQ==
X-Gm-Message-State: AOJu0YwLK6FjJzupeT/22mN4tAnloPymmVB0zPFh0h3aa6kdw+IcvgYy
	Ai7l/qIHT/QwqBY1Cbo2c7+A/bA6gN6pFnPBq4D7s4mNEclTDJIMUP1FuanWQgGY/vXvhFP+6xR
	FG0vS5ipbEvq4zBFiYO+hUp6t9P/Oz/fRd++JMaQBkbz4ZQ+6bv9Sa11dVrFofPMI0Jct0H1BXn
	yO+enjF4er8PQUE4vEj00=
X-Gm-Gg: AR+sD13CB6IhaODh/lUyKAxhKBwKSbgEkV27xherav57MhZ9dmAgBaC+iptYGqynmPL
	FLYt9Cp6QFXYUZdhG/X3TmcOACYZmzlRX1FEflOz+xvWEfraatDoS55MtrbmeM4J7PORSVYxAgu
	md/iIpcCeikkAslYAm0V/Eqsr5aC58rIBwF0ukRdFEGP4RAkDLBufXzPrg3DdWPPvczv3R8SJEW
	fs7cNe/fMpx2EvMQ1ytkrhEEaf3vG4D3mjfl5ZHmtm0lrz5zLqFn/H+4ZMunebkDBNtnhbSlkgj
	XVoNgDaSn//cFcHYBZcUeoledszvtBZcNvjuZMRUg5OR4GVLZru3ltb4k9nC66WhUc5lrvhAsKQ
	oe9VJverk2lR69LK45ibia9Lp+MsG7u4=
X-Received: by 2002:a05:6a20:914c:b0:3bf:6c08:2b2d with SMTP id adf61e73a8af0-3c91b380940mr382639637.53.1785471677600;
        Thu, 30 Jul 2026 21:21:17 -0700 (PDT)
X-Received: by 2002:a05:6a20:914c:b0:3bf:6c08:2b2d with SMTP id adf61e73a8af0-3c91b380940mr382562637.53.1785471676233;
        Thu, 30 Jul 2026 21:21:16 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e045016sm846169eec.19.2026.07.30.21.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 21:21:15 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [PATCH 00/21] Scarthgap pull request
Date: Fri, 31 Jul 2026 09:51:08 +0530
Message-ID: <cover.1785461355.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAyNCBTYWx0ZWRfX3uMuqtRpURbA
 /xtyycVroF/UCeFmlz0nxfDql2/sHfYV3Ozhep/WTzaxvOsN/Hc6Ibcy1b2ojSE/IQ7smGGnF6h
 q3xx+grZ293sKPkiATbWaLr/kI9X96QNAc4E6Crh0xSgirMRPbWzxoL+bWtUoe1RxUJWmE0ex+Y
 NjabAchvTuq2RisO4X4vx7bwFJ391PpNOgjmbgMMZmSW5yl6+8qA/lMLViQKkDTGCS4ahIzsnJU
 tFfipa4kkywdqVbqW7pLp3xZ7otUsgd2UMszeD79mDcw8d3qCAnbWMlZHO582j4Fs2vsEq6gjYP
 LjBKlQrC/fvHbq3pqj7RhNV1hTHNvVZdhMSl0JDwEtZ8twKBzzNtrfm9HNLn1fupjaM/xN1cn3z
 IkZN/ddjNKfeuKeZ5MXgyY8+njDOCAsuKIIEvuVm/naF/QarecNtB2LBuSjNJcBHba+Y9gKCbny
 kI/eQfRKnJdyt/LjJtg==
X-Proofpoint-ORIG-GUID: 3Zy4GkHCH2HAXeKHDyI4Xx9utvqoVOOX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAyNCBTYWx0ZWRfX+2wZ1cEIz+Wr
 oTGE3iZecJdH2c8HR6ZzYVnGJo6Fn87UcnHYcULyhqj/F9Xsh510qiJtlUXyfvbR5FCTs1ji2Bm
 1R7Io12BgCNb4DO1yViQMyK5bbDzDzc=
X-Proofpoint-GUID: 3Zy4GkHCH2HAXeKHDyI4Xx9utvqoVOOX
X-Authority-Analysis: v=2.4 cv=H+3rBeYi c=1 sm=1 tr=0 ts=6a6c22be cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=2dwgUA42GyM2YDXeM2UA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_01,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 04:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128577

Please merge these changes in scarthgap. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1679

The following changes since commit 7eb94107580092f79ff1b639a87762fe6f96aa12:

  nginx: fix CVE-2026-42055 (2026-07-16 15:49:44 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to ef3df29f2cfca6a9513b51ebcdccf82b6c8a836f:

  libdbi-perl: Fix CVE-2026-14740 (2026-07-30 07:53:25 +0530)

----------------------------------------------------------------

Ankur Tyagi (2):
  postfix: upgrade 3.8.17 -> 3.8.19
  haveged: upgrade 1.9.22 -> 1.9.23

Benjamin Robin (Schneider Electric) (1):
  dnsmasq: fix CVE-2026-4890

Darsh Kelaiya (6):
  jq: Fix CVE-2026-43895
  jq: Fix CVE-2026-47770
  jq: Fix CVE-2026-49839
  jq: Fix CVE-2026-54679
  dnsmasq: Fix CVE-2026-12725
  dnsmasq: Fix CVE-2026-12969

Deepak Rathore (1):
  ldns: fix CVE-2026-10846

Hetvi Thakar (5):
  libdbi-perl: Fix CVE-2026-9698
  libdbi-perl: Fix CVE-2026-10879
  libdbi-perl: Fix CVE-2026-14380
  libdbi-perl: Fix CVE-2026-14739
  libdbi-perl: Fix CVE-2026-14740

Joao Marcos Costa (1):
  nginx: backport fixes for CVE-2026-42533

Khem Raj (1):
  apache2: upgrade 2.4.67 -> 2.4.68

Peter Marko (2):
  libwebsockets: patch CVE-2026-10650
  hostapd: set status for CVE-2026-58374

Qliangw (1):
  libuio: fix FILE descriptor leak

Wang Mingyu (1):
  monocypher: upgrade 4.0.2 -> 4.0.3

 .../{postfix_3.8.17.bb => postfix_3.8.19.bb}  |   2 +-
 .../recipes-support/dnsmasq/dnsmasq_2.90.bb   |   3 +
 .../dnsmasq/files/CVE-2026-12725.patch        | 111 +++
 .../dnsmasq/files/CVE-2026-12969.patch        |  54 ++
 .../dnsmasq/files/CVE-2026-4890.patch         |  75 ++
 .../hostapd/hostapd_2.10.bb                   |   2 +
 .../libwebsockets/CVE-2026-10650.patch        |  46 ++
 .../libwebsockets/libwebsockets_4.3.3.bb      |   1 +
 ...onocypher_4.0.2.bb => monocypher_4.0.3.bb} |   2 +-
 .../jq/jq/CVE-2026-43895.patch                | 206 +++++
 .../jq/jq/CVE-2026-47770.patch                | 449 +++++++++++
 .../jq/jq/CVE-2026-49839.patch                |  37 +
 .../jq/jq/CVE-2026-54679.patch                |  74 ++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   4 +
 .../ldns/ldns/CVE-2026-10846_p1.patch         | 117 +++
 .../ldns/ldns/CVE-2026-10846_p2.patch         | 117 +++
 .../ldns/ldns/CVE-2026-10846_p3.patch         |  34 +
 meta-oe/recipes-devtools/ldns/ldns_1.8.3.bb   |   6 +-
 .../perl/libdbi-perl/CVE-2026-10879.patch     |  34 +
 .../perl/libdbi-perl/CVE-2026-14380_p1.patch  |  37 +
 .../perl/libdbi-perl/CVE-2026-14380_p2.patch  |  65 ++
 .../perl/libdbi-perl/CVE-2026-14380_p3.patch  |  27 +
 .../perl/libdbi-perl/CVE-2026-14380_p4.patch  |  56 ++
 .../perl/libdbi-perl/CVE-2026-14739.patch     | 170 +++++
 .../perl/libdbi-perl/CVE-2026-14740.patch     |  40 +
 .../perl/libdbi-perl/CVE-2026-9698.patch      |  43 ++
 .../perl/libdbi-perl_1.643.bb                 |   9 +
 .../{haveged_1.9.22.bb => haveged_1.9.23.bb}  |   2 +-
 ...ix-fclose-leak-in-uio_line_from_file.patch |  31 +
 .../recipes-extended/libuio/libuio_0.2.1.bb   |   1 +
 .../{apache2_2.4.67.bb => apache2_2.4.68.bb}  |   2 +-
 .../nginx/nginx-1.24.0/CVE-2026-42533-1.patch | 126 ++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-2.patch | 381 ++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-3.patch | 704 ++++++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-4.patch | 587 +++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-42533-5.patch |  55 ++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   5 +
 37 files changed, 3710 insertions(+), 5 deletions(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.17.bb => postfix_3.8.19.bb} (99%)
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-12725.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-12969.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/files/CVE-2026-4890.patch
 create mode 100644 meta-oe/recipes-connectivity/libwebsockets/libwebsockets/CVE-2026-10650.patch
 rename meta-oe/recipes-crypto/monocypher/{monocypher_4.0.2.bb => monocypher_4.0.3.bb} (85%)
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43895.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-47770.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-49839.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-54679.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p1.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p2.patch
 create mode 100644 meta-oe/recipes-devtools/ldns/ldns/CVE-2026-10846_p3.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-10879.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p1.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p2.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p3.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14380_p4.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14739.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-14740.patch
 create mode 100644 meta-oe/recipes-devtools/perl/libdbi-perl/CVE-2026-9698.patch
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.22.bb => haveged_1.9.23.bb} (94%)
 create mode 100644 meta-oe/recipes-extended/libuio/libuio/fix-fclose-leak-in-uio_line_from_file.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.67.bb => apache2_2.4.68.bb} (99%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-3.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-4.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-42533-5.patch

-- 
2.54.0


