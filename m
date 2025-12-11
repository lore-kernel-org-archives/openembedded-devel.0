Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECEED41C3C
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:05:32 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9907.1765461930058827551
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:05:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ID388cCF;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=QOl5gJv3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BBCIiln1593213
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 14:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I/iMiH+SlIBcpg72MbyxWD6jgvrxmJsRYbk
	4AUh9FUI=; b=ID388cCFa+2APWD3C/MT+LYqYPNrslbAyATzznOSPDS3zOhG4a2
	US+nLttrVUcjxUeFINMYLWNynR8DOtEAaaOkSM/FI30K4ZHhgqnt7LrpbAnqBG2h
	7bT9wON3VcQavH69I4ZKgDEv6tvceLzeJdBuKMfydjOa/l+WecI+a6NYrPnTFzCj
	SqOYwuE0sdiSNs+vO3vZsCIqlWU/ch4LbmfBVDZQUaXXTZCG5mOlAaglkUXKRIfv
	CACFl/uIE+TpkLqdhjlUrES9IXn99fqszaIUknVCVmpCcws+A4nIhM5VgO3f3xZ7
	ScttPW85tKRrFguSdiq6waUVekbjXuJrgFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ays4qhb9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 14:05:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34943cc3221so136674a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 06:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765461928; x=1766066728; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I/iMiH+SlIBcpg72MbyxWD6jgvrxmJsRYbk4AUh9FUI=;
        b=QOl5gJv30i9vxMHz5AGY+LiAnKCXwHsaWZPqJI3wkRq1jgLygoG8XNHi6SByQCHBuM
         aCdfl2GAbqMTtlEK9hp74tcYzwYJjFAvzZN53F5vwxcNTWZ0vs3gIygNYxI31RATjpy2
         nslJjAmYlfu2kyd5bm/riDewWRA415Qg86XfoQgbY27ukQFwHP1FKpHuBg63+G8Q8v+x
         Cg1iPK0QzaQcUr3LE4fLXQ5un81zc1reatwA2xIzYGJnvpcRxIuMOS0GvRYxpM5Wz4kZ
         529+3bQBlKcDtBIRr8YskKpD1IdOGC8xugO/QuJXpRcU2LAs2ibLLF958WyikHfL23Bj
         VeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765461928; x=1766066728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I/iMiH+SlIBcpg72MbyxWD6jgvrxmJsRYbk4AUh9FUI=;
        b=mnrB+YCeBH0JToFFyMnmRduEAOCl0+4z22zBwFfL8BQfraquT53fx7gniql/BPYwVD
         fWUROHCDxxeDitdyrrYFxY5zhnJx66yVk7UMBpK1RSAtXI+DAK1dBkh0nRVDw7Ygx+LS
         FhSpj/X+x99u7gxGCVqoRTIz2F7O8MOfqbJadIoTqkflJ6WR9NaIbFo7KyvV7+2n5DxP
         okomlbJMjfBbbJUTf/m4ybwGkfx0ZS5lYhe9pWfDesG6jsI87dEMEhdDIXRkjR7oTYrY
         i927i5luvSv52McZoBLrO8ama282IxnEMNpShJ7EYY7AbV1SbPoXI8usMX66/Lgk4t8+
         6VtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWdaqXX+URpS7YFPw+EzkNPKZaFAJgCZ40VyYqVmD8G0lcap7+7d/6VX1Q/zMusWeslI3B1sSEiijiPurQfDsvYuM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzJTm3SNndtdX5HT8gSKmMRxqJ8VAiZoOzbdfVEKRGtOCSL7eE3
	BSk9XQA9n7Bqm3T910ewrRDcX31jOJORMWE2YvOlj643bZwOjIdu0q+5QMxJjljGk2ZfInB0EHt
	MDUatjjM5kN2G0EGEtZQFWqAhJ29ixpbVLghhQm4cTEpSBkIhpXCWS4b9q3eyOxbvzerYVOKTfJ
	KH8fbcoGz4
X-Gm-Gg: AY/fxX5RYuDDJAydLxezoh9TAml6S9FvrkRNQYIMq5yUc9ydSpBdAFxoHlUmi0aJCNG
	6dKVBXjf3PtgVvuqLrPHmVCUO1mQNzqjBKus4QysRjVcoOxVEgtGHWiRGRTkmd4PKvBZHLZQ3UC
	bJEJCGWNKaTQXWFTJecGmXx8vkZp9Oc+jbgwk7lhEV0FbfAy5KqF6RoZ0kti+blQ1cZsYsCdFno
	/poJ9wAUbThZkqXbvBL+rQAkIVIBgrjPZdzLCVAievm+mA98rFMf7vC9/hx/XvtpGOP4v5LWbJd
	TJ2VaIvrwp8gRhZafIy/xbJu0D2M8T7rNdWzNyGYNx6wlrcyN3cdReg7VyMyZcF/NM6DV44W4OA
	Ucntf0ihUpLU2ImA9tcsGH7De6wxXWyy0pLoiOSZS
X-Received: by 2002:a17:90b:2541:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-34a72809b50mr6175475a91.3.1765461927639;
        Thu, 11 Dec 2025 06:05:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqut5eXGyqu2kRI3KyTItKBQfSNjIuKTQ4+bgYTYuZ6BfmK1MVhkNhpfT/hs8/wQIZlUNX/w==
X-Received: by 2002:a17:90b:2541:b0:32e:4924:6902 with SMTP id 98e67ed59e1d1-34a72809b50mr6175280a91.3.1765461925799;
        Thu, 11 Dec 2025 06:05:25 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c0c2bfa0845sm2508050a12.28.2025.12.11.06.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 06:05:25 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/10] Scarthgap pull request
Date: Thu, 11 Dec 2025 19:35:10 +0530
Message-ID: <cover.1765460789.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9kfHQuoAgGIMhmG_B1QgBKVvuAVnCXBh
X-Proofpoint-ORIG-GUID: 9kfHQuoAgGIMhmG_B1QgBKVvuAVnCXBh
X-Authority-Analysis: v=2.4 cv=B/S0EetM c=1 sm=1 tr=0 ts=693acfa8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=F0GqM6MxzMfmm7JvySoA:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMCBTYWx0ZWRfX5Uh+aTiP8OXT
 Iy3jGZwTXIRKRAvJyPaq/BgbI/gbN/PhqZc5eQOQXF5AuL/1CPQpH/IQ/z/RHA1jck9qn/mvh2j
 Yh24tYvl9Gh5fpXYgl7Wrw/WM+/PmIW9FqlmMR5cnO2mvKU4lg2EFFTTLj3OEUMBzmsErzsthVV
 QUN08lbR8cv/P57QrRswWQT6QydyjK7QIi+rUXvh2DhF91+NGef9ZqR9LDOcKTh2XPhvIgV0vm8
 GhDuRb4tIvx91TyxtjkOHDf+5B43SW0q1aO6A7j/1vGxoNRDTHgoAjzVLjfyU2fqTfuhyTcH+1u
 bRbCrR22wa9q0OqAjxOoM0BnBB/2NeqCPDQ/9BkaPGe+2GQbYOUxjndAx/ZPfRRa6fTmjj8AH/P
 D5bu5uQ2X5I+jDIZzm0vAe7DGWzfiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110110
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Dec 2025 14:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122586

Please merge these changes in scarthgap.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1172

The following changes since commit 7ed4330bcf1ecd4aa34bfbe1fd7079381b62b1e7:

  net-snmp: Update Upstream-status in the net-snmp-5.9.4-kernel-6.7.patch (2025-12-05 17:46:29 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Ankur Tyagi (3):
  python3-django: upgrade 5.0.11 -> 5.0.14
  smarty: update CVE_PRODUCT
  libavif: patch CVE-2025-48174

Hitendra Prajapati (1):
  wireshark: fix CVE-2025-13499

Peter Marko (1):
  nftables: remove python dependency from main package

Sudhir Dumbhare (1):
  hdf5 1.14.4-3: fix CVE-2025-2912

Valeria Petrov (1):
  apache2: upgrade 2.4.65 -> 2.4.66

Vijay Anusuri (1):
  proftpd: Fix CVE-2023-48795

Viswanath Kraleti (1):
  gflags: switch Git branch from master to main

Wang Mingyu (1):
  corosync: upgrade 3.1.9 -> 3.1.10

 .../libavif/libavif/CVE-2025-48174_1.patch    |  27 +
 .../libavif/libavif/CVE-2025-48174_2.patch    |  31 +
 .../libavif/libavif/CVE-2025-48174_3.patch    |  27 +
 .../libavif/libavif/CVE-2025-48174_4.patch    |  72 ++
 .../libavif/libavif_1.0.1.bb                  |   7 +-
 .../proftpd/files/CVE-2023-48795.patch        | 785 ++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.7f.bb |   1 +
 .../corosync/corosync/CVE-2025-30472.patch    |  69 --
 .../{corosync_3.1.9.bb => corosync_3.1.10.bb} |   5 +-
 .../recipes-filter/nftables/nftables_1.0.9.bb |   2 +
 .../wireshark/files/CVE-2025-13499.patch      |  45 +
 .../wireshark/wireshark_4.2.14.bb             |   1 +
 .../recipes-support/gflags/gflags_2.2.2.bb    |   2 +-
 ...atch => CVE-2025-2913-CVE-2025-2912.patch} |   3 +-
 meta-oe/recipes-support/hdf5/hdf5_1.14.4-3.bb |   2 +-
 .../recipes-support/smarty/smarty_4.4.1.bb    |   2 +
 .../python3-django/CVE-2025-26699.patch       | 100 ---
 ...ngo_5.0.11.bb => python3-django_5.0.14.bb} |   4 +-
 .../{apache2_2.4.65.bb => apache2_2.4.66.bb}  |   2 +-
 19 files changed, 1007 insertions(+), 180 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_1.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_2.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_3.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif/CVE-2025-48174_4.patch
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/CVE-2023-48795.patch
 delete mode 100644 meta-networking/recipes-extended/corosync/corosync/CVE-2025-30472.patch
 rename meta-networking/recipes-extended/corosync/{corosync_3.1.9.bb => corosync_3.1.10.bb} (94%)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2025-13499.patch
 rename meta-oe/recipes-support/hdf5/files/{CVE-2025-2913.patch => CVE-2025-2913-CVE-2025-2912.patch} (94%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-django/CVE-2025-26699.patch
 rename meta-python/recipes-devtools/python/{python3-django_5.0.11.bb => python3-django_5.0.14.bb} (65%)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.65.bb => apache2_2.4.66.bb} (99%)

-- 
2.52.0


