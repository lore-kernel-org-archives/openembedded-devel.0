Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E8C0CD8C92
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 12:49:56 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.78750.1781009395095713770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 05:49:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DRr42f1q;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=V8xnI3j8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClZnk2706236
	for <openembedded-devel@lists.openembedded.org>; Tue, 9 Jun 2026 12:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XIB+sBnxR59D715IG9iVPqA+Iaa2Vqujo+g
	MNDRUeXs=; b=DRr42f1q7fg0CbIxnPBBKMCXPe3esPZVPzi6Jq+KdPemBPYZCNj
	2pSunvLz4pIy71rsPYU/6jw3OWRUzDr0VOWzdnXIsMmWtsMxvgZsMONpzJowQmEh
	FyLvMuG5pG05O06CmA9vVdcos4/kuvEcQ2/P8PdH/wpv6I02X/PeEjCX3YIfVssJ
	wHowgU/u3qSBF3ZRsx+zw0IG8Kg2rWN7UTP1BNUNTd4YgZVvXlurLZcIa10c2nbO
	biyjrZWgKb9Rb+lqZWVx+Pjl027bE+WNfn+bVtWZHxIz4p9Ojbh6obTJ8hLrL2yJ
	ELVsBa2voaaG5mTWWGFNSHrVFyWZAObuzYA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epfdt1290-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 12:49:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0532a6588so52710235ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 05:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781009392; x=1781614192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIB+sBnxR59D715IG9iVPqA+Iaa2Vqujo+gMNDRUeXs=;
        b=V8xnI3j8/81BFSVlwCTSGlK2rw0OWIi+ORt4b6BOo9D+A0AJ66BcDV54zOKajCduRL
         iHJkVgxgkzEAaZvFOBdRh7Syqo8wW5qv6/UTddvmEqk/L8sdhYY6yzXGv1nTuwIoJ/rl
         y1R5unrQm1UODS3sG6ZU9OPHM5cNsxLalz3Ra6E33yPSiApr/ZC60oittsjsHn5ws54w
         4Eu0/3zpTsE2i8ST6PFfIHA7tyL10HWfg1d+6S0cPRp87Jka2ye6IORy/KLmM2gzyT9J
         qkdXKEAL8PnXYn9ueTo8MdYirwDLF2w9572WDgzWJdUVQteqmfBfO36g2ylVmUTSjEow
         YRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009392; x=1781614192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIB+sBnxR59D715IG9iVPqA+Iaa2Vqujo+gMNDRUeXs=;
        b=OAYaiY0krz0J3QrPg83bHyKAYsu3DVC1ImOlsA9/KOTPxb0rll3g5gPioqCmGj9ZfI
         I8nZDtdvKY+UuO9fRj9p2dpD7veXjckDagUOQRWczCRW81EJfBB6Hvp5zkdecSF52tFK
         Q3Cmg391nHT5hRrrDOVVhpS+SryKbQlbH2KkPEPA/IH4yxFaLgxHaXA8q6Yub1F8887J
         YGkLDtNhCe9l2f6aLNwDgmod5s2rJFc1UA/+Gv6irHHnn+yx6Wf85xh/FMUT2UMKH49Q
         lmaEQntfMUiy37TfBx8IpER4vzXAW1sjbTgWFXONUkw0MDkAzAo0cWOWbcVr0ILZNQZf
         TzOA==
X-Forwarded-Encrypted: i=1; AFNElJ+SLhkEiVtO1SFiT6MrOrpnKmmps6l+npBUh+dM86AJeyHddE3fS0mck6zdukXNKc9GhKChjjPeN+XeV0UjZaOBPAo=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxiLDHbYtV6/2R9skw7CzVrVi7WKoGtFOjUXbgBXsNM1WMN1sko
	tXnhkOvTduHhuU4RaL+JJCShITQVKJBdCiJyR4EMMu8boS5GDJowRj2Jv8upxc6AY9cgrQGTo8J
	AFAz0OMoafe2rRM3XdvmCrOFSHTLwnSIG39oD3dHW7c4mbWxTaZVxVRs5UiEu/D5H5mRXWF+6j1
	tw4JsSIc42
X-Gm-Gg: Acq92OGHR0Tdpj6aXcf/4YMu4wUHEX9IaZx18PPtQMcQwAY20e3grnyk06xtwocMLMZ
	x6j00nyneU+amvMnkeBcheBBtaWNxnwA1C/iu/m5vHCYpl/CmUa2CooyZ+OnfNA6Yqd4xThLg/6
	M1EHmmqe6V0SyC1balTIjj1Pjr7QK/cAKKxCmEOl/6kznOtHf7fxI4zTYlchUyjGo3PW5UD4akx
	TPEJ/PdsUMebJiGmU7NBbauglVMNV7w+jkhOKArFukXMgmbFPKN/MHg+ITLOj97dPZVNXXAX32a
	8ed01Bz7AfzvpQPm+XiscE3ECMA8RYovkQbIflgN8PoFDeYf21SEx3IXCsT632ig8l+EjwbAv/z
	bHshf3xTxSW3KFJqw/x2hZxlNUFSrcnAAN8zNGDWRMzyNm48f/4ADYkFnuQ4LP5w=
X-Received: by 2002:a05:6a20:1c8f:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-3b4ccd66679mr23104226637.15.1781009392552;
        Tue, 09 Jun 2026 05:49:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:1c8f:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-3b4ccd66679mr23104187637.15.1781009391916;
        Tue, 09 Jun 2026 05:49:51 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0b26bbsm18276455a12.23.2026.06.09.05.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:49:51 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: raj.khem@gmail.com, openembedded-devel@lists.openembedded.org
Subject: [PATCH 00/13] Scarthgap pull request
Date: Tue,  9 Jun 2026 18:19:42 +0530
Message-ID: <cover.1781009217.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hyeSX8VnZ2S27Oyyw9LLC7jV1JjCAcVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyMSBTYWx0ZWRfX8+d3f0/DtAmX
 7jCU8YHIerj++CCltmOfKKmD8JlBGGxYh9+2vMePBz+EB1v3fH/on6ReSJYmrMEyOV6tUiENv9V
 Xq4DxOvUPKILErtYCfaBUrG9wBvTWm0iO9+kxli98HqOOijbQo5gvfKRRROVL/GAHaxHTYv7S3a
 Rl+Xm5m70worg141IibHbcx78GKzFR+GsPdOqMhxF5OKoJaPGBB47MTR/g35ULbIOPyWZkoK9tJ
 wUwL1cfwO8QKlaVcoRWtLeIwSBjnCB69HdCdtKCIiblWBt4GAgo77YemLcUr1+PVagxpzPOHoB2
 zQ+SPbcLEMGkded1roKebK1Sug9dK9DEMkXtWcy17VT/obILjQD4PjZDuBVwck5ALQSeD5VZqRw
 IvHY4JLzhUhXd8nvmtCuC14++7ZNYRe8NszU7jxGFwvaNj1OSHHoIqiYh4hsQcveaiKooZIypU8
 po0Njhc7tMk9zwlMMIw==
X-Proofpoint-GUID: hyeSX8VnZ2S27Oyyw9LLC7jV1JjCAcVF
X-Authority-Analysis: v=2.4 cv=doTrzVg4 c=1 sm=1 tr=0 ts=6a280bf1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=iGHA9ds3AAAA:8
 a=Q4-j1AaZAAAA:8 a=n1GMlNAwJno9LhPVhoYA:9 a=1OuFwYUASf3TG4hYMiVC:22
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 12:49:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127486

Please merge these changes in scarthgap. Tested locally and on autobuilder.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/1547

The following changes since commit d8cc4e44001c7257273d290ce8c4496e93d32841:

  postgresql: upgrade 16.12 -> 16.14 (2026-05-25 08:05:43 +0530)

are available in the Git repository at:

  https://git.openembedded.org/meta-openembedded-contrib anujm/scarthgap
  https://git.openembedded.org/meta-openembedded-contrib/log/?h=anujm/scarthgap

for you to fetch changes up to b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9:

  nginx: backport fix for CVE-2026-9256 (2026-06-09 11:37:19 +0530)

----------------------------------------------------------------

Ankur Tyagi (1):
  postfix: upgrade 3.8.16 -> 3.8.17

Gyorgy Sarvari (4):
  python3-paramiko: set CVE_PRODUCT
  python3-priority: set CVE_PRODUCT
  python3-pydantic: set CVE_PRODUCT
  python3-supervisor: set CVE_PRODUCT

Naman Jain (1):
  libssh: ignore CVE-2025-14821

Nelson Garcia (1):
  nginx: backport fix for CVE-2026-9256

Sudhir Dumbhare (6):
  python3-grpcio: Fix CVE-2024-7246
  python3-grpcio: set status for CVE-2026-33186
  python3-grpcio-tools: set status for CVE-2026-33186
  python3-grpcio-tools: set status for CVE-2024-7246
  python3-grpcio-tools: set status for CVE-2024-11407
  python3-tornado: Fix CVE-2026-31958

 .../{postfix_3.8.16.bb => postfix_3.8.17.bb}  |   2 +-
 .../recipes-support/libssh/libssh_0.10.6.bb   |   2 +
 .../python-priority/python3-priority_2.0.0.bb |   2 +
 .../python/python3-grpcio-tools_1.62.2.bb     |   4 +
 .../python/python3-grpcio/CVE-2024-7246.patch | 206 ++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |   3 +
 .../python/python3-paramiko_3.4.0.bb          |   2 +
 .../python/python3-pydantic_2.7.4.bb          |   2 +
 .../python/python3-supervisor_4.2.5.bb        |   1 +
 .../python3-tornado/CVE-2026-31958.patch      | 262 ++++++++++++++++++
 .../python/python3-tornado_6.4.2.bb           |   1 +
 .../nginx/nginx-1.24.0/CVE-2026-9256.patch    |  63 +++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   1 +
 13 files changed, 550 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/postfix/{postfix_3.8.16.bb => postfix_3.8.17.bb} (99%)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/CVE-2024-7246.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-tornado/CVE-2026-31958.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-9256.patch

-- 
2.54.0


