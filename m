Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDF7C88E58
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:38:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14064.1769409476903829842
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ill7pQc9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Sa/UEDDZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKsLbJ344832
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:37:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tY4upZT++uvHcTiqDPrZs4
	2zBmj2IUda8jtpPHOQAEU=; b=ill7pQc9viik9ILyC2QSXSS5jF9UQ6RPK+5gXR
	4ppn4eit28ZJqcrj05o2JsEboX6x2LeHcC6QAQ/VMNeI5IVXRI+g4bVLnizn4BO8
	3Jb2w45R8P7EqO420IBjXOTHAw4Jl4YB9JNgs30iujjBy0uy39V1WwB7ltmq16Wr
	v1EUXCRt86YRaVEJiYLYl5lWz1LLM/vBvhpLhB2EMW7hZfgWtJwrp7zF+aqXy1I1
	E+nOfzzOKXuIeQ5QJ63hNn9z+qRQAzz2UUA2aUv+GsvaanWcQtx60wCE7Lfcrodq
	YTaR1ZVE2Y5xFHjmMGFJEW2POluaVF48LYlpd6Z3Axr+kpFA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tukkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:37:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a79164b686so45763295ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769409474; x=1770014274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tY4upZT++uvHcTiqDPrZs42zBmj2IUda8jtpPHOQAEU=;
        b=Sa/UEDDZbh0sAi0+j9HW58Wp35HOJ0OZuFQgcxfPONMXxH91pXa4eqinXTX9jFCqEm
         Lhk0nCqGNuJhkGGfboWpN0ZYfC8pazErlO1aeS2jJhrFziCPqgVX2Eadq/z6hxqEyxP5
         kXD8at9b5sh0xtO4PvwJDTHj4RYY+mdKZPEFVAuRdrVz3oQDeRDKc6fGENmy2VW3qUuk
         xWSbl3oRBX/Xpz0sePwK6/gYX0xXr91IVul+O+6k6+j8mthKJ1w9yqSzbY0ikpiaUT4D
         fKe4Zh8vsqTufL5zak9MA/Xohgm3dgKqTENh8xcDhmZ6aKBQ1MH9SmiSINJWe6h0HSxW
         LLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769409474; x=1770014274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tY4upZT++uvHcTiqDPrZs42zBmj2IUda8jtpPHOQAEU=;
        b=C8uXtaRsLZhJNsOM74pQ0EDhRTfMO0EtRyWdbpKVcD2aWzPZ6H0Oj9c6LIxyZoI5f+
         HR7Lf5/aw8PsLPUVGBq4qg6nrEBPkWfe4ltfcwwZYBIKQy5m1MDMSrxCO0A4N6E9Qtez
         5SnT6ft6Utq4xrmxwT1yCLX4iJU7SbBxY5uz6vb221tWbH/XYOC85AEM+qEwU51LB2aj
         cICv3mRlPWxGkp0KvrTKwLWE4UyvC8c5DSpbu6jEzfMXUMH7G7LDzVAJYa1VgSwjG79W
         Q7oZ0yT4RGKUp2aaCey+IeLnoneJ30nLZCx9JLXKPF5IYGRHCYcVqlBDphpP5VLwybS/
         1X4A==
X-Forwarded-Encrypted: i=1; AJvYcCX4mFyvE61KYlRTQ8gHV8GqsgA3UcpLTjpe4XIdbyjPFEl7z4cG7PkOYdRrt8dDHkevtHiepsM84fZzaZLp0vJ6fxM=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwCsYB1hJw3CeoPiHR5FN3yOh7ZKB0dth5pWLheJTYjuNtQxwbE
	Mxboz/unuaJ4Nb0TeVquUoADALlZxsjiggqgjkz4+PARbMdw1B4RtvZHND/wEqaJPz+APFtlqIg
	plgUrGswSsdNKufzb5bOvkBbf1NYwdX5pXVpUooS24q76i8ciIBF7+KCgwBQPWznToMdY+iKNAS
	RdyLiSTfOW
X-Gm-Gg: AZuq6aKtOyIf6yPlaCSYGdcx5hJTuPhy96HUNUrx7pLIffZW7wCEyMVwUOdVDHrFiKT
	7lxljl4oAxx9SpwYnQK1Hwhh5Kj0Pw68g4iB0fpM1FiTPXlF0rrZN+eLBxKEhAnnbC1ConMiTe+
	L/qMqPEp65VZzTLlnQW41Euuyj9EYQNCfIJjAQBhOnEqSkNb3+0TSNgRi7CSfjmVgsLYBOl61m5
	GMWYut8ywxYtNzbiPiDwF13jslYSyHI33tlYZ+6MbKbYPFoi/kikiWSA3fLrM6nnwsEuzWl16uI
	LKlDPPbXoU95kOQiEpdHLfWLREKjzKkgHQpIXXWLxagI4ccfH47tcjbQ7qFLRq5EB0MCGpWHVrp
	p4+RTDEOkjtUvTN6TiuLQcz2FS9uSuUCc/HfAyYQI
X-Received: by 2002:a17:902:f647:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a8452bc4ccmr37392725ad.31.1769409474428;
        Sun, 25 Jan 2026 22:37:54 -0800 (PST)
X-Received: by 2002:a17:902:f647:b0:2a1:2b5f:d16b with SMTP id d9443c01a7336-2a8452bc4ccmr37392525ad.31.1769409473905;
        Sun, 25 Jan 2026 22:37:53 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdb322sm79882555ad.89.2026.01.25.22.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:37:53 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/18] Scarthgap pull request
Date: Mon, 26 Jan 2026 12:06:44 +0530
Message-ID: <cover.1769409126.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1NiBTYWx0ZWRfX7kztJzriBKU/
 ZwrS7h6/h1UmE5VoRmaqngASfKNjUh9OLWFyfgi7Ms2dDD9wnIlBY8QbRZG2vxeFRA2IwBvmmE7
 4c/oG8GoC5rsYurIiavshCVoHMBVPC3zN1xvE1OtZOX+W3s9Rs0W4QzEuRKzyXP9sIhkS6XrK+L
 QHJudhiNgKTfRhmE5X3jBzDehBAFs3d/QSODwC/fYcwxyDSEK73uICS0Ofobq/rbFPKhKVIMGfI
 SyaLIiFWGVtfDEniV7hXb/fWrrlELkb226ncnBO5MughirTAl6IE+RXNSSIGlkI6p0wDWCvIyW/
 kLKKUnisD9X7YuXnS+6PpcnfqTPCQZBygf4TSYtRXNezT9lPsTKUFp6q74fbUE2bsHofjYdMbF8
 LqskB67gzlkmpZwPAdQ+5lhbdbGR5osdK+Z+JFTYFjMCMWlT/bU3D73R0IYJHg2mkYaM2VqUEWQ
 kCPhm3dmNvChCQJ9ONg==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=69770bc3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8
 a=nwI38xdf5BYmQuqt35MA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: 0TGMls-MAPpoo59JAK4VfdH47SQl_AwB
X-Proofpoint-ORIG-GUID: 0TGMls-MAPpoo59JAK4VfdH47SQl_AwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:38:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123858

Please merge these changes in scarthgap. Tested locally and on
autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1269

The following changes since commit 2759d8870ea387b76c902070bed8a6649ff47b56:

  php 8.2.29: CVE-2025-14177 (2026-01-19 12:15:49 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

Ankur Tyagi (3):
  python3-aiohttp: patch CVE-2025-53643
  python3-cbor2: patch CVE-2025-68131
  python3-twisted: patch CVE-2024-41810

Archana Polampalli (1):
  tcpreplay: fix CVE-2025-51006

Gyorgy Sarvari (12):
  python3-django: upgrade 4.2.20 -> 4.2.27
  redis: ignore CVE-2025-46686
  strongswan: patch CVE-2025-62291
  python3-flask-cors: upgrade 4.0.0 -> 4.0.2
  python3-waitress: upgrade 3.0.0 -> 3.0.2
  python3-twitter: mark CVE-2012-5825 patched
  python3-m2crypto: ignore CVE-2009-0127
  python3-m2crypto: mark CVE-2020-25657 as patched
  openvpn: ignore CVE-2025-13751
  acpitool: update SRC_URI
  xerces-c: set CVE_PRODUCT
  gnome-keyring: set CVE_PRODUCT

Joao Marcos Costa (1):
  linuxptp: add missing prefix to CVE ID

Peter Marko (1):
  libmad: ignore CVE-2017-11552 and CVE-2018-7263

 .../gnome-keyring/gnome-keyring_46.1.bb       |   2 +
 .../recipes-support/openvpn/openvpn_2.6.14.bb |   1 +
 .../strongswan/CVE-2025-62291.patch           |  45 ++
 .../strongswan/strongswan_5.9.14.bb           |   3 +-
 .../tcpreplay/tcpreplay/CVE-2025-51006.patch  |  97 ++++
 .../tcpreplay/tcpreplay_4.4.4.bb              |   1 +
 .../recipes-bsp/acpitool/acpitool_0.5.1.bb    |   3 +-
 .../linuxptp/linuxptp_4.1.bb                  |   2 +-
 .../xerces-c/xerces-c_3.2.5.bb                |   2 +
 .../recipes-extended/redis/redis_6.2.21.bb    |   2 +
 .../recipes-extended/redis/redis_7.2.12.bb    |   2 +
 .../libmad/libmad_0.15.1b.bb                  |   3 +
 .../python3-aiohttp/CVE-2025-53643.patch      | 192 +++++++
 .../python/python3-aiohttp_3.9.5.bb           |   4 +-
 .../python/python3-cbor2/CVE-2025-68131.patch | 517 ++++++++++++++++++
 .../python/python3-cbor2_5.6.4.bb             |   1 +
 .../0001-lower-setuptools-requirements.patch  |  25 +
 ...ngo_4.2.20.bb => python3-django_4.2.27.bb} |   9 +-
 .../python3-flask-cors/CVE-2024-6221.patch    | 110 ----
 ...s_4.0.0.bb => python3-flask-cors_4.0.2.bb} |   8 +-
 .../python/python3-m2crypto_0.40.1.bb         |   3 +
 ...-41671-0002.patch => CVE-2024-41671.patch} |   4 +
 ...-41671-0001.patch => CVE-2024-41810.patch} |   6 +-
 .../python/python3-twisted_24.3.0.bb          |   4 +-
 .../python/python3-twitter_4.14.0.bb          |   2 +
 ...ess_3.0.0.bb => python3-waitress_3.0.2.bb} |   2 +-
 26 files changed, 922 insertions(+), 128 deletions(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2025-62291.patch
 create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2025-51006.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-aiohttp/CVE-2025-53643.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-cbor2/CVE-2025-68131.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-django-4.2.27/0001-lower-setuptools-requirements.patch
 rename meta-python/recipes-devtools/python/{python3-django_4.2.20.bb => python3-django_4.2.27.bb} (44%)
 delete mode 100644 meta-python/recipes-devtools/python/python3-flask-cors/CVE-2024-6221.patch
 rename meta-python/recipes-devtools/python/{python3-flask-cors_4.0.0.bb => python3-flask-cors_4.0.2.bb} (71%)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0002.patch => CVE-2024-41671.patch} (98%)
 rename meta-python/recipes-devtools/python/python3-twisted/{CVE-2024-41671-0001.patch => CVE-2024-41810.patch} (95%)
 rename meta-python/recipes-devtools/python/{python3-waitress_3.0.0.bb => python3-waitress_3.0.2.bb} (82%)

-- 
2.52.0


