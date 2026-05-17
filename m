Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04660CD4F3D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:51 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20208.1779006281567639591
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=f2Zz7NVy;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=JaHf+9m6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GNRYew3188415
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nUv1ILTNbtq
	VekZaI10RH2AtEFFXSPGCSSWJBVO4jdA=; b=f2Zz7NVy3zbxZK6s8NoRolGmlvO
	JRigyjyA78fgLrjGTHMoDK2pQ/zBmANi91qAmbRRiPxQd9H3RV0dlGTEcdyqzNx2
	x1LFD1jNxCl3aJsK2jTBI7iqSMd2lzSunxm+z/LgxAUmyxLYRVlcAb0e+4eV63W6
	oaZQ8uCV2YEi3he5/XPOuEt41Sr9a7VriZEnRv0x/iWZD5BJy5g8sSBNnUd6mIZD
	5fQOrR82BKU/Aj3uOYNoT4l+sOC3csx1DBewOdjcjOIffTCGjwsjmzp/R1KKyEgj
	U0VosZymy337zjEY4HytSEhTujo0BhvvrmE+3oTcy859HYNHoJbMjgmqFpg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvytghq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3692f395339so1100339a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006280; x=1779611080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUv1ILTNbtqVekZaI10RH2AtEFFXSPGCSSWJBVO4jdA=;
        b=JaHf+9m6K6TfMA3ztZUcNPyOAYzqCAUz4LUnXtcwJlRJuC+/qSUuFgyOOHd6u6cuiO
         eaEfkQrX0ShoLj+eInneluFn1YGP7yuklzdJyFXQlnoSKt98q9ixZZMzOECb13oN4v4/
         nHYt23hPlZblyxoCldpOOtgxRuZ9dsavEDx+13/671XyqINkxmEOV673Uuw/D11gPJH+
         AKtNZjKfzuzqAsUopdlnVo089c6NO3O+6R61PC9xNNRM6nCo1LEOhPCTlrAumIW9K/iL
         h3z6GX3i6QRPLsTv5YMKSsrhFqBFoksUjhcNUMgLu21PU13Z7Py2PF4IljTM090JYNqN
         GBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006280; x=1779611080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nUv1ILTNbtqVekZaI10RH2AtEFFXSPGCSSWJBVO4jdA=;
        b=KFuODilogzJP05q7IdBl9YG3wlQMXZPAHXuNSfEZu+/xTiXrUzC0+EMA/QqMVgTXQ1
         Y/1LUm77yH1x1Rio9uZmjLkrLFCofk7GmZQ7d3ZYq4UM0YkjBY1+KeHi1iKKdkNh4Hqj
         uq6MsvDy0ZwOzVv0cFWotmrICguZhg0a/kX3zHwEr+LxWzgf2T17NJcm3DSxH60U9uT1
         YUMlnT+4xeuC3yI9safIVc6YUrHtLV3Pvqe4EwX7l3+LxM90nusf1stCHED6pC5EZPIO
         WB0jZlOdGKIFiS0WImvluEIVNVNoDHskm8asv758eMiUe31nPTgQ4qkAPamoKfAuEfTr
         YxpA==
X-Gm-Message-State: AOJu0Yy0lz/zS61FkliQtOpPCkO7oQVMRsQP3dG+2RjA0nrMocAFBLNS
	R2RdUVn/k1R80lM9vi0g1tRbJYwyjatGWQUAhVpQD8M1oWyG/3ZkkQOz0vJM6vdzKohVl8AfIY5
	SOS3sq5giRkk1zQPwlVjecb0R7StOnQ2YrL4vz9ZMl674vgrx9zp2kXXVZ3bSVHZ9OS6aJUgHb4
	4LdT573wsNQ5LmNmjD6zaHAQ==
X-Gm-Gg: Acq92OFY2FtuZJGvHWsgJnIWdJt6I/s2SUR6M8fVYoPLKrTwhzEqGJWi6rqIArR17yy
	u/VW04sg6aHh5H6qA3KyhrsZQQeiL67IRSqNlLd9W1TYqj6+N+mhZhcs2x/tVf0VtYCVcLvrO4x
	nJKMDlgOk19j/lhM/NzldeOfcdC4aireDGFxusyJxPhyT6Cqsb0IuT+PnDlr6MbVMIs2uBokh+r
	/h+DplfcjKXUNuQXLmrRwYBSY+rwJdZi4qU/lNE+L0nAofM+rBXZ8n80NTYKbO0qlX3IkjiW8er
	w9y704+xUGqJrmnhZyGLUJWaHvyBCMUNENrCZ5D7f87goTkpewLuC/Y047uHuu9SA6OobyoICjX
	gkhQsHWOmJq+DdAxBdpKts0YI24fyl8xUFxMeOOcPQi6qfH4ZiK8q
X-Received: by 2002:a17:90b:3845:b0:368:763a:17b8 with SMTP id 98e67ed59e1d1-36951889325mr11019703a91.2.1779006280383;
        Sun, 17 May 2026 01:24:40 -0700 (PDT)
X-Received: by 2002:a17:90b:3845:b0:368:763a:17b8 with SMTP id 98e67ed59e1d1-36951889325mr11019687a91.2.1779006279856;
        Sun, 17 May 2026 01:24:39 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:39 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-python][PATCH 27/29] python3-ujson: upgrade 5.12.0 -> 5.12.1
Date: Sun, 17 May 2026 13:49:55 +0530
Message-ID: <f543c09d25561988afd231047131b30965e05bc1.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX6HdRx7bQk1fw
 ERwAvldMODCBhSaqbKn3aw+Ug9BnaMtEzykm8ST+V1/NdJNFFVrkR9qbuxf+RAo8sd5A2ItgRJS
 0TA8NZ20W4Jb5zGlzYUp1BZQG191xgnJaoafLnnx3PIShr/S+SppxkjYIJE0a7t60RoqURCYbTg
 TtS2roqhWH1ro+JV0jVSZcGJrldriPjKYxbvKRoEmRauxdLJAOhFrtIDZivnGOiRIhmD5gqjYUV
 Vk6l3gzGCI1q7LB38VtSUmtO5CV9FFlFFURzrm/cgb9hMNigMsslcP5Lf1uE5uNmjgFlr5sFU+7
 snwm7LZ8NOK3nEZlskMYLIdXCa1iObNbH/cN1NPUcHUZKyRTdrBFZ3VL9ZnD9bI/sKu+OE5Z3Tm
 obLD0k2gh3/ujX4hWBdFt/C0lAbCtwiM/X+VY30qf/Nwb/RzBicaPcUDkJRtexQsaRYObP3wG+b
 +9KQSVxHNocu9lFdxjA==
X-Proofpoint-ORIG-GUID: 5nLPDUc681ieKSp-sNNETbLhO5mCoFoI
X-Proofpoint-GUID: 5nLPDUc681ieKSp-sNNETbLhO5mCoFoI
X-Authority-Analysis: v=2.4 cv=X5Ni7mTe c=1 sm=1 tr=0 ts=6a097b49 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=omOdbC7AAAAA:8
 a=EUspDBNiAAAA:8 a=Ruxvy7UgvJ-Zmrh0SbQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127040

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix encoding ref leak with non-English character
- Fix memory leak when ujson.dump() is unable to write to its file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6887661fec82e3472553ec982c49fef36f8023cf)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 .../python/{python3-ujson_5.12.0.bb => python3-ujson_5.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ujson_5.12.0.bb => python3-ujson_5.12.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
rename to meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
index 14b8049f3d..8f8c6e23d4 100644
--- a/meta-python/recipes-devtools/python/python3-ujson_5.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ujson_5.12.1.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "UltraJSON is an ultra fast JSON encoder and decoder written in pu
 LICENSE = "BSD-3-Clause & TCL"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1e3768cfe2662fa77c49c9c2d3804d87"
 
-SRC_URI[sha256sum] = "14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4"
+SRC_URI[sha256sum] = "5b7e96406c301a1366534479a7352ec40ec68bb327c0c119091635acd5925e35"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-- 
2.53.0


