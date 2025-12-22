Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87E41E6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 06:53:09 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75660.1766386380257153631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Dec 2025 22:53:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=B7DRZMvn;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=MlV75R4B;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5gVFf2190208
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4xNrfdWbKi+VinEAZZP2x1mVK289fMSfXs1
	j6i5/9/M=; b=B7DRZMvn3mYeuHV/8G/R1m4JRtIhKCeqOLS/dkEwhaK6Bbpq3j2
	qjKzMxBCvBCGBfAGBtQOSJGq7jKBvpd3cxb8X1utxjkJEZ2ikCrr+SGwbUSe1fi5
	dXH2HKdxP0TlRa/uaY2RCYFRjqmL/utJTsObGUjBpLna2ySYy0h372NxIHFYEN4s
	2d9lpR5xtP/gtvwNuX3enk1TeHAkBTM6WeWuhCnQDF6t45BkOfbADhADIyDdoTd3
	eWphRrwlv8SSc3TgbpD/rle29CXAgg58JYl5ZE9jkjXCclgdHlmO+IA8IA1zAt1/
	Kl5b25zUnV7BP7hpvtxRambUWsai3EQDcOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t86cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:52:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7ba92341f38so4153420b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 21 Dec 2025 22:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766386379; x=1766991179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xNrfdWbKi+VinEAZZP2x1mVK289fMSfXs1j6i5/9/M=;
        b=MlV75R4BztrIgj6iNGAFbDMMwUSnpqADG+6VQQ9YcAdCwWsq5eZZbHVaU8Qg2+7nV/
         BmnN+pylg3J2SEzyJ1HRcOXEoURVws5L1/tSBswud04uAMRcfPFyWltgkVjzy6bwYdsX
         VFP+aXsYX165/cC4kSIBf9CYxyrE+ZNMJTVZ0pxLl/hAYGjxv8wTasDy/10v69JtHl7F
         WGhYEqxZNP4BIpQBrsa83W/6saW8yas9inwD23ttql2trIzxRByV7qyn6lP7vyXDuyyk
         lvp13KH4cYcEEqoWXM5OSGPzc8ng5uJAvko6bLWmtbUUZZ6qEaT/0xiv4Fzb4L0/RNWH
         E21w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766386379; x=1766991179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xNrfdWbKi+VinEAZZP2x1mVK289fMSfXs1j6i5/9/M=;
        b=GiK+4lf1vH0qIufEogYG44/Z31BhfW4M1VdnXPhKL2IB+kE6DSg5WGJgYUieuvxMtS
         KSNUuPlwHJfxDTUapHkEcmOPY+NIjUaau59EONQ7PsQxOprpCdQoENAVnnpm0KW30Vyd
         VesZfZQWJCmnb5LpJMIT1CVlUAFDD94f/n84q7RZ2dwmlwiwqEqqJTe0sG7USSw7XKpo
         A4vpeg/YgiK+qoKiV65HZCHHhysLILcWetY+xfDHetLl1ixY/l5fJ8d7izQx++fk3K4X
         XYCGu7alKH/Dobls0VPoPn3ApHjOHz4k1K9+h+L7gRRyo2VmqF/SMd5OUBMKj9FSY1ti
         Z3dw==
X-Forwarded-Encrypted: i=1; AJvYcCWe5wt/8MHjUF5KAVH10RW+UbzGR7T5gCsgoktbMSWnF8JFC/GbptV3wtmqkTrxV+okr3fce/9eIuUhWtAzM+Ov/TI=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwZjHyzXSemQTIe/D2zZEspmw9N4VrNHhzuG0Vjnrb1r9EmRQTJ
	Z9OmbvsfsfbpbMC4WuOcXfu3nNJnaR4LgLHiIb+QGMt0JCrbi97b8ENDhJ9an6aw+qrrVBS9myO
	DOHtFl1X8UMoIsIKjATpN2K5YTcTjPSylz1pKuKU/mTlVNUdH9H3ID9Z8eUiys3Yn4/xlypxuXm
	VLHGyNA7lr
X-Gm-Gg: AY/fxX4L5Ggie4WlYTg1J0EmwhArsBlyL2SHnuRnIaXFCBLbpqlMh9TasVyB0mxbvg+
	2RIdmF6iL5qhnuVTkPoJzW+dWk7lk9R2oKdYNgASa3agWXc6efzOXuLAvJJcSr86Ukk5EZmCAIX
	HyT6Hs690EoKQTNrlIzw4832nDekDeFl3Qq5YTbM+hMDmn3P5jAhunIut4wHIPuxAVa3TiGeb0l
	Zysb4BUiMtIwUT2l6sw4UKrotCh27TMHhfF8URr8lMOmLcPSs9JfuumYChIG9FNbsXVWciMV26F
	JSXS6NFmcuqBzTcSTrWF8SybW1nK9E00/Ah+7Gg8QSGGMidZ3ZL/g3tz5wBCoW28tDJmf5yqlGX
	bn8qcePVOTWPxAUhVmf6G/mLS/8N9epQkXYbCswoE
X-Received: by 2002:a17:902:ce92:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a2f2836dfamr90716705ad.41.1766386378994;
        Sun, 21 Dec 2025 22:52:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgssLJWfCt3MyJe9DR6HDD85nSTECLtLPNFvx+XhpE5e+r631xBXQv+rAUtecLTgUP6xWy/A==
X-Received: by 2002:a17:902:ce92:b0:295:3584:1bbd with SMTP id d9443c01a7336-2a2f2836dfamr90716595ad.41.1766386378516;
        Sun, 21 Dec 2025 22:52:58 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm85802235ad.21.2025.12.21.22.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:52:58 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/13] Scarthgap pull request
Date: Mon, 22 Dec 2025 12:22:52 +0530
Message-ID: <cover.1766372942.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=6948eacb cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=19nTJ9dhY_1vgxqP9oYA:9
 a=IoOABgeZipijB_acs4fv:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: ar2dIrkDfgQR-BNSJl7QLVKSRvWGCPL2
X-Proofpoint-GUID: ar2dIrkDfgQR-BNSJl7QLVKSRvWGCPL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA2MCBTYWx0ZWRfX4d+dWLgBFp1E
 WNjVQ9jVpJ0vVrsq1O3EjXWQfV3lVTeLQ9SsfRyH/ZFUq/yHnmGAtU0QP1YkA7BPuy79T5z65jr
 tHR2aQvRczJRPlZWtPlFujeHfq36NKYzHzncL/Xn2Lg8gklItnV+jeYfBogWtL5H4ZX8HNZg0z9
 uDIc6GDZGYMcl031HEkqJboUpILPtK3+kURFBy1oz5crOxS6f5V+HYrPZX16Pi1MUkONKqZz3K0
 4qax6vWRSBqplJxO45T5IJPLLHEz+39zNqISHQC0T3PXaqSO4JaMDWw6FUF8aATLPOocQkiKmaP
 +D0uLfh8wBrVxhSZLGJydPxK2xxqJuH7iiDERkZmM8mTJwv6E/vFt/+MrZ15F/6zdI72TZx+ZIK
 qcl8i3BacwEm9cmEI1lTZJI8QWs/xva89JMObA5X7oB0z3+WNjP02k8UdERyLmx1DqQVPoacqW8
 HSIaIK2BcILXc4TfMuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220060
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:53:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122784

Please merge these changes in scarthgap. Tested on AB and locally.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1196

The following changes since commit b4812b18eec77e9f0286bd6b81a5c3032ac0d3be:

  proftpd: Fix CVE-2023-48795 (2025-12-11 08:02:03 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Ankur Tyagi (10):
  jasper: patch CVE-2024-31744
  libcupsfilters: patch CVE-2025-57812
  flatpak: patch CVE-2024-42472
  editorconfig-core-c: patch CVE-2024-53849
  civetweb: patch CVE-2025-9648
  fetchmail: patch CVE-2025-61962
  unbound: patch CVE-2024-43167
  unbound: patch CVE-2024-43168
  openvpn: patch CVE-2025-13086
  openh264: patch CVE-2025-27091

Archana Polampalli (1):
  tcpreplay: fix CVE-2025-9157

Deepak Rathore (1):
  redis: Refine CVE-2022-0543 status description

Kai Kang (1):
  mbedtls: fix CVE-2025-47917

 .../openh264/openh264/CVE-2025-27091.patch    |  28 ++
 .../openh264/openh264_2.3.1.bb                |   1 +
 .../civetweb/civetweb/CVE-2025-9648.patch     | 254 ++++++++++++++++++
 .../civetweb/civetweb_1.16.bb                 |   1 +
 .../mbedtls/mbedtls/CVE-2025-47917.patch      |  52 ++++
 .../mbedtls/mbedtls_2.28.10.bb                |   1 +
 .../fetchmail/fetchmail/CVE-2025-61962.patch  |  51 ++++
 .../fetchmail/fetchmail_6.4.38.bb             |   1 +
 .../openvpn/openvpn/CVE-2025-13086.patch      | 157 +++++++++++
 .../recipes-support/openvpn/openvpn_2.6.14.bb |   1 +
 .../tcpreplay/tcpreplay/CVE-2025-9157.patch   |  44 +++
 .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
 .../unbound/unbound/CVE-2024-43167.patch      |  46 ++++
 .../unbound/unbound/CVE-2024-43168_1.patch    |  29 ++
 .../unbound/unbound/CVE-2024-43168_2.patch    |  57 ++++
 .../recipes-support/unbound/unbound_1.19.3.bb |   3 +
 .../editorconfig-core-c_0.12.6.bb             |   5 +-
 .../editorconfig/files/CVE-2024-53849_1.patch |  54 ++++
 .../editorconfig/files/CVE-2024-53849_2.patch |  48 ++++
 .../flatpak/flatpak/CVE-2024-42472_1.patch    | 169 ++++++++++++
 .../flatpak/flatpak/CVE-2024-42472_2.patch    |  44 +++
 .../flatpak/flatpak_1.15.8.bb                 |   2 +
 .../recipes-extended/redis/redis_6.2.21.bb    |   7 +-
 .../recipes-extended/redis/redis_7.2.12.bb    |   7 +-
 .../jasper/jasper/0001-Fixes-381.patch        |  30 +++
 .../recipes-graphics/jasper/jasper_4.1.2.bb   |   1 +
 .../cups/libcupsfilters/CVE-2025-57812.patch  | 129 +++++++++
 .../cups/libcupsfilters_2.0.0.bb              |   1 +
 28 files changed, 1221 insertions(+), 3 deletions(-)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/CVE-2025-9648.patch
 create mode 100644 meta-networking/recipes-connectivity/mbedtls/mbedtls/CVE-2025-47917.patch
 create mode 100644 meta-networking/recipes-support/fetchmail/fetchmail/CVE-2025-61962.patch
 create mode 100644 meta-networking/recipes-support/openvpn/openvpn/CVE-2025-13086.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-9157.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-43167.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_1.patch
 create mode 100644 meta-networking/recipes-support/unbound/unbound/CVE-2024-43168_2.patch
 create mode 100644 meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_1.patch
 create mode 100644 meta-oe/recipes-devtools/editorconfig/files/CVE-2024-53849_2.patch
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_1.patch
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/CVE-2024-42472_2.patch
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-381.patch
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-57812.patch

-- 
2.52.0


