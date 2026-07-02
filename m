Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C55C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 10:45:30 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66067.1782989126275842015
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 03:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Oi11EZKR;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ts3DR4Rq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662AaK1n3591072
	for <openembedded-devel@lists.openembedded.org>; Thu, 2 Jul 2026 10:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1yqtSjpCyppj0jYgA1JWmCLyB3crpfdCLo9
	5JqrzNK4=; b=Oi11EZKReOikESfoyh0uQC/xqQW1kkuTF96Q72z4Zmf4nZ/vvww
	ChpyEVER4dR//6R1q2u70qtwvAc70AbMKBFzRZnvukMBAG9idy/4/DvBxVNgPXxj
	BpFyLl1iFwZnfR2H9Zd3XW0lt2q4FAU17pOvYSuO9ze7YsNTGUVDaIhjd4BWh51n
	a9zNzwQSIau+de9wK1rd7P7xzLjrdgfb3Pe3EgyZqF1EZaCypR2aML9k1ISMpNhz
	07ylwJKD+4y2blwR30a0RKc5EeEuq+ndxy9tC6LcV/fXTWoutG9uD764/G63x250
	ww/qEUhOu07DVU2BpGbLNsfCEFfnPSwGocA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9aaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 10:45:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so3156866a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 03:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782989125; x=1783593925; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yqtSjpCyppj0jYgA1JWmCLyB3crpfdCLo95JqrzNK4=;
        b=Ts3DR4RqH8vcG/Cd7EC/SJL8yYALovfkwkCo8nM86TG6iVVPGRnGoVjFwX6OGoGwoO
         EtRpL2DV7GV5yRxff8ptWYdRsteEZlyiRxSgh/Xq5Oxm3iUjSqfW9TVQzgCKnfeocQli
         lnIEOf9akfPLG99aJWf0nBZx+0eWrRWsDrChAswjJw8ekXlV3gzG8M6QrGcb5scmBKfh
         UgoFmyAWmNfn+48vXbjSKYPQ8CE7Qi1hNkMn22zr2BesuUU+N0IYPetldU0IPcgD1EHd
         l72lqXwmIECodkVVgB89Syzhb2tNxXCZX+Y6uXAxMGR4OHlo2K10/njAQknKqM3X8la2
         WvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782989125; x=1783593925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yqtSjpCyppj0jYgA1JWmCLyB3crpfdCLo95JqrzNK4=;
        b=nqChU6fPx0dItFCST8/Qytgol9Ru9FWY3AWWqvOmH5zSyAdGrY167t5PfiLi/678Yg
         cX0CKRpxIe5eVO0+SeiWp8MGOrr9s6il9DrdUyEKj80uDnqXS3Xafh6nYnF+ZIE8YL7Z
         5zxVy8Tp1ttl3iLeuMFoBU+7TvtomsnjIASVnKTSe/GTBJH964HdnDfzlhFZxaInCY1C
         2q7tnZQlhJkE1JNMVdTdpKsoAi98YL9/jNIJ/vYzXvv7wV70xnUqjqEMGs9ycVVw4qji
         jEpECw+SpLhOzPNfgqZI+/iMlKPABkix1FXtacH9qwLHorKtArvhhvZlRMU03Nq/Mrc1
         fhqQ==
X-Gm-Message-State: AOJu0YzpQzU3IF2RUX/6I1h9Z4c+ty5wy1LgHGd3vNm0n+JEG7jeFL9i
	d41PSTHmuLZviCp4C4BCngqCgCxRayb3mbCMIoGcLprgLuY0W0yLuk1l1iKLXpr9pCC0zwyEHZ4
	6HZFDeJs2X5i9F/D51MIVQXNDfntF6GI0GZTcUOhasvm59OG1itf7VBezZPw1W7aq4dwaaJgluh
	GPtXDmdejNMHYmyI8NJ38=
X-Gm-Gg: AfdE7clj0LkDjyxnhk2/MSrQ26Y6s1zcBjYJBrVlpBrYLrTU5h75Ku2ioNMVTssxf9+
	3eF4zNH2Grzu9wjW+khb0JX1GYslTw+MIrtjfmBJTjk9p1Vy+VmghWIX4WXs3697uxqG5AR0Bpt
	41tnFHWRjK6BkqrwOkMHLjl7dV9EG0Z8fvVonR5Yx+KnNtJMVAE6/suqdhsoraEvabkVsTtTnRj
	YmiXwrIxKY7BLF3JwvaW3yhwd6l0W2qWE6NumXjV1KKZnhy3LgtYfrPke8YOmfqRiPZ7HPQiX6p
	MYFSUp8ebF+s+1/E9b3GIN2IN5UMMzO/vAR3hyDc2RjTq9LNKGW5+LHOYabfxK/HXRJWmOer9Ii
	O08icQf5Wxqf5gHYc+t3D8xtF635NRjeUikp2LI2XmA==
X-Received: by 2002:a05:6300:4045:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3bff42ddef8mr5318781637.51.1782989124600;
        Thu, 02 Jul 2026 03:45:24 -0700 (PDT)
X-Received: by 2002:a05:6300:4045:b0:3bf:6c08:2844 with SMTP id adf61e73a8af0-3bff42ddef8mr5318747637.51.1782989123964;
        Thu, 02 Jul 2026 03:45:23 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bb843fasm8246397eec.18.2026.07.02.03.45.22
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 03:45:23 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/16] Scarthgap pull request
Date: Thu,  2 Jul 2026 16:15:13 +0530
Message-ID: <cover.1782985880.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX8ZDeF9cgPoRz
 QgE2AryWntFZscDWHMje3XiOoE/qDdGF7LyrJ0WmZnTn5AyUhwkRAIMzb8/k4heeb2vVaJJOSyy
 5c88qMadGMSn3tO+9GRWn6KLDdTL6jw9wVdOpc5hlW4ID/WHSxv4kxqxS1DSd8+3cMw8aTi+apO
 FLCUmlZdxKNkPFtVkJZVBkXTfIewFHlNiiFEy4eGXaT+4vNIqn8/yNL3EyYBTxRyMqOYDIvnJij
 d2MyBLA6avRgdfGGl37yA+smaD6zcG1eGpoGtgdZwau4Eh2YDnYt1QpUraR0RiICfIrsEcXpXkG
 zUwLxif43rhPdZDN9BSZdQQQW6I0XyuoZtHPr3ZD4OrWFUg2J80kJeGUZrEd7tMSIOYUhfydie6
 XTDknm0M8V5cVRkU3229dTaqrkHvbMoORbmPVAUe7hROtgUcCidbMbKgYU44td7LvqgLojjNzHC
 lXT8K+N9lrCAKA+04Nw==
X-Proofpoint-ORIG-GUID: xejxJO2T7td1FPDDvdQOp-5IcFacrnuA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDExMSBTYWx0ZWRfX792nSVaDElRR
 hEGwBgY3vNs6MRGNc+M6/WlEwY3AFKvXukxEG3OEqI9gXVBixt8+lZf45NrY39tc3C7IHBu3uS3
 EY1MgAiFVCWbfjKSHKVjFY7KN3zU500=
X-Proofpoint-GUID: xejxJO2T7td1FPDDvdQOp-5IcFacrnuA
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a464145 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=xkxJLLpOR5ntF-FZ-aAA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 10:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128000

Please merge these changes in scarthgap. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1592

The following changes since commit b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9:

  nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to 29a044218285fdc7fcdd63d5f0929cb3a27b6fed:

  python3-matplotlib: fix build (2026-07-02 15:08:44 +0530)

----------------------------------------------------------------

Anuj Mittal (1):
  python3-matplotlib: fix build

Li Zhou (1):
  haveged: upgrade 1.9.18 -> 1.9.20

Nitin Wankhade (6):
  strongswan: Fix CVE-2026-35328
  strongswan: Fix CVE-2026-35329
  strongswan: Fix CVE-2026-35330
  strongswan: Fix CVE-2026-35331
  strongswan: Fix CVE-2026-35332
  strongswan: Fix CVE-2026-35333

Shubham Pushpkar (5):
  jq: Fix CVE-2026-40612
  jq: Fix CVE-2026-41256
  jq: Fix CVE-2026-41257
  jq: Fix CVE-2026-43894
  jq: Fix CVE-2026-43896

Theo Gaige (Schneider Electric) (1):
  nginx: patch CVE-2026-48142

Venkatasainath Ravikanti (1):
  syslog-ng: update config version to match installed binary

Wang Mingyu (1):
  haveged: upgrade 1.9.20 -> 1.9.22

 ...-insensitive-matching-and-reject-exc.patch | 176 ++++++++++++++++++
 ...-undersized-attributes-in-enumerator.patch |  41 ++++
 ...t-zero-length-EAP-SIM-AKA-attributes.patch |  54 ++++++
 ...d-NULL-pointer-dereference-when-veri.patch |  58 ++++++
 ...accept-non-empty-ECDH-public-keys-wi.patch |  51 +++++
 ...nt-infinite-loop-if-supported-versio.patch |  42 +++++
 .../strongswan/strongswan_5.9.14.bb           |   6 +
 .../jq/jq/CVE-2026-40612.patch                | 153 +++++++++++++++
 .../jq/jq/CVE-2026-41256.patch                |  54 ++++++
 .../jq/jq/CVE-2026-41257.patch                |  57 ++++++
 .../jq/jq/CVE-2026-43894.patch                |  56 ++++++
 .../jq/jq/CVE-2026-43896.patch                |  97 ++++++++++
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb       |   5 +
 .../{haveged_1.9.18.bb => haveged_1.9.22.bb}  |   3 +-
 .../syslog-ng/files/syslog-ng.conf.systemd    |  11 +-
 .../syslog-ng/files/syslog-ng.conf.sysvinit   |   9 +-
 .../matplotlib-disable-download.patch         |  34 +++-
 .../python/python3-matplotlib_3.7.2.bb        |   4 +-
 .../nginx/nginx-1.24.0/CVE-2026-48142.patch   |  43 +++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
 20 files changed, 938 insertions(+), 17 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/constraints-Case-insensitive-matching-and-reject-exc.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-40612.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41256.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-41257.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43894.patch
 create mode 100644 meta-oe/recipes-devtools/jq/jq/CVE-2026-43896.patch
 rename meta-oe/recipes-extended/haveged/{haveged_1.9.18.bb => haveged_1.9.22.bb} (93%)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-48142.patch

-- 
2.54.0


