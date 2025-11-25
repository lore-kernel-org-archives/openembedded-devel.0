Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8647ED0E6DF
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 12:53:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16318.1764075199133646528
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 04:53:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=oVvj4oUA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Lee/ZyhH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP9xuGe1847612
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B33bpoln1VLgXx34ZD6USMUSOR8M1oLh6CH
	ab/Ima7M=; b=oVvj4oUAngGQ54wQs1tjkOY8ETgwtvED/OLyUJsKYFiJ96YmnBa
	ezi3b4tAYU0hXWHIdLPZ1FYzsssKMJMfZmFI3sjd01xrpyi0rGDJblHurLYp+ClG
	6Mjg9y7qNrY8tPTY/R8GbEwoaqAN44Tdg2lTUplR6aNXkfhMTMzrE6T8696nwbIJ
	XEcsUZhtJthCPPI0mA528OED/FtsHQDnbdwkKHwfZDnQTuf080QDzywijxeWdBWS
	1cgzN6BvN+HOXPqT9SRozUl0xns97PK8xz9SDVTf8Rt8sZwIILg00pZpURYozUYw
	GpcH+az+dZEVA9yYw+fGF/Zjo40GlC3bx5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qb51c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:53:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so11077823a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 04:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764075196; x=1764679996; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B33bpoln1VLgXx34ZD6USMUSOR8M1oLh6CHab/Ima7M=;
        b=Lee/ZyhHGGZMzcgY70I9DLLF+QvebLzBcyLpfKbxm10X6t7W/g6KcENf+eRey8Tn7S
         qIio/LjG95zJ5lK1/LeNGyOcVZQLIIDPeYFaXUcDcFebrD6QVTHFxmHZcullAh5POImp
         uYjSQfH2cED8+t8+9XCejTOPDfa4bjP2JSsukU01YvqiY2chYOJHWeBKfQ9WLuW9N0yU
         +NxOp3jIZjMz1KF3o0ZahzskRDYaPTohU2UIa2NOma3iJCLOkjDRKwer0tmr10/S1XjA
         TT1+6Nz6y9TD9JK3teGLLZ2pe3Y+IlJVMeGy/xY85PzqSo+XJ6EPC4MzAr5tX4u7pYUV
         1EHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764075196; x=1764679996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B33bpoln1VLgXx34ZD6USMUSOR8M1oLh6CHab/Ima7M=;
        b=TQvAwvIoz627qNTKM5l5DDvZvY6mO7W9ZmAHMvfJfAUZx1Qb4saJ598nLxXbbuVeyV
         BbyGCK4mjY6aFzCebkMtGHhd8/pd8+UrL1AU5slob9BJVtyRG8wZ3J8wG2aPRF4S5GSg
         EmlvhkqFbLocY/7T9Sfl+fnoZboBPCtDCtwc7Y+PENHwLm5gIkrGTu1DpoOzao4xQgcv
         YneEAJCnD+ptXqG5gUWi0hx7oHcMO3kPJNHnfv++KbRygcQON988kIQ6p6EcwNyC2Cnl
         4aYmyWyO2KaaOgNqSKNPD7GRs6RJ9JVOWp6zxV8HaJPHaefdjYeAY37eZf9/pSRgRxcQ
         q1GA==
X-Gm-Message-State: AOJu0YyxsZ3+5IDwVaJqwGJEvoPnfksRWgNCOM6r4uIa2bemlhLKE0l3
	20TcEQjwEQVf5rlfQwg1ohwPW2u8TOGmXsf1jXHuMaOQT4Rb9eH+7qLUYDmL/3q04ysducZuppz
	NZLsF87mzZVEl8fT924x0In2zwQQAI7oThR8edsXliyBSG/62gQsbPJ9G4ccRW60CpTGPikw9eB
	KaOi+/henlaCpIlyPR3XI=
X-Gm-Gg: ASbGncufxIB2CkIqVkVAKMBv5LrVjqtlQN9ZFgqyMXpAZx9Dg90Qmkm5JWc5uwMUe2Y
	5HXYLAXWu0eC6+b49uYuDXacoYhp4XpkpgLsOKk+JJQcdBRjaYdsoAvFN27s4yEmRgyCeepZ3Cr
	eS7BPU3pf8zPg95DzJdqzKDrGI8D9XWmCw/lH9soHZNwFaLoYUfEXb4HZgOLIew3kxHKgCmB6el
	ifV9KEH7PLCWH+TlWrpfvWp5UlLMDbuJ/8y+tCodx5eKEbew/8b+Dj9bsc9GjYEh4+6yIXqhgPb
	0WiESVLZdY0Cz35tixqvSfQD/Tc96pKdoVKQaU6aE+HAP2UwRTUcJtqr0vG2yPZXRjvX4XWF/Yp
	v+XD5C0ZROCfZMV0rlGDVoxTGodOQGoTkx67zqG3Q
X-Received: by 2002:a17:90b:5112:b0:340:f05a:3eca with SMTP id 98e67ed59e1d1-34733f0c7c6mr16100612a91.20.1764075195666;
        Tue, 25 Nov 2025 04:53:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGANXELJY2bo1w+Rw5LkDCLET/o47G4EK4pLnAtww4rg3R2qmRqtxp+Ss7zY0AdPAghJZMTCQ==
X-Received: by 2002:a17:90b:5112:b0:340:f05a:3eca with SMTP id 98e67ed59e1d1-34733f0c7c6mr16100588a91.20.1764075195059;
        Tue, 25 Nov 2025 04:53:15 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f174d2c0sm17999975b3a.66.2025.11.25.04.53.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 04:53:14 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-networking][PATCH] ot-br-posix: Define config files explicitly
Date: Tue, 25 Nov 2025 18:23:07 +0530
Message-ID: <20251125125308.1540591-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ZqV14oXOEfYuC80QEz_cBbT7Y-xmS2RE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEwNiBTYWx0ZWRfX3O3YWiy300QR
 +SJj1PDqRbdPUSTjg1dZtxP8g5ncJhwlrdDBjFPveR5UDaJPP28lDgRmlyAp1lpqRBhMVMHT7kk
 5cdIglTtDAj+giNKFGyfiMsn0ZKZ4y7YWW4f0A0fPfYvfkQRnfTlyilOhl/6hduvSpfnwplT2C6
 SNJuAFJlhCNh0x/FJu8kmHxoPuR6lG0O2mHWeFfQPmcuSeIUocG4yLbiUQSWDTQNNmWJ/vsmCjy
 gcFAMKjN+I7EkXFMBDGonyUUHkdaGo+kUQhFGmBn38GPFoj4yahBsumP8v5SSdEg720d+ZFYBA5
 KEpJigei7aHa6N9nTiYrIifLd9e0XWS+KZY3lMEck2x31Y10b6nvYPV27Wuw1DOSaannf0Vcl86
 5B+hJnYvhHVDDCBbK0DOprUfgrD4jg==
X-Proofpoint-GUID: ZqV14oXOEfYuC80QEz_cBbT7Y-xmS2RE
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=6925a6bc cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=CBLoBMIveHPJ5sPbi4wA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250106
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 12:53:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122055

From: Khem Raj <raj.khem@gmail.com>

Otherwise it picks up from build area with absolute paths into builddir

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0439d42c556d97405b13deecc412605ca8fc202f)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../recipes-connectivity/openthread/ot-br-posix_git.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
index d7be1cd71d..af9cb17c44 100644
--- a/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
+++ b/meta-networking/recipes-connectivity/openthread/ot-br-posix_git.bb
@@ -34,6 +34,8 @@ EXTRA_OECMAKE = "-DBUILD_TESTING=OFF \
                  -DOTBR_REST=ON \
                  -DOTBR_WEB=OFF \
                  -DCMAKE_LIBRARY_PATH=${libdir} \
+                 -DOT_POSIX_PRODUCT_CONFIG=${sysconfdir}/openthread.conf.example \
+                 -DOT_POSIX_FACTORY_CONFIG=${sysconfdir}/openthread.conf.example \
                  -DOTBR_MDNS=avahi \
                  -DOTBR_BACKBONE_ROUTER=ON \
                  -DOTBR_BORDER_ROUTING=ON \
-- 
2.52.0


