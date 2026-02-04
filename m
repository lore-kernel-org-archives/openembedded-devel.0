Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E4BCE8B392
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 02:51:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10797.1770173490291918292
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 18:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Dp8mgc6U;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RDdtACwC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Im25M2055113
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Feb 2026 02:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hYPEQRCFSNJsmRAYpi0H3jQa8w1f0jJygdi
	bGbVdfTo=; b=Dp8mgc6Uv2ZMQkb3RDtIEKpWU1KdI4wW+/F600fUaB49TFqZRHs
	zkWzOBo91GvgKy/Tkp3YmK7H17RUOyrBigpWKYB4PuIKh3QO+T3saHD0KxraGZ27
	0dNv/dhspbVjHfmoG3Z2R5+gsQhvaCxmlIHwHTNpUvBPoVUoxZRR54YaYGCUaI/k
	aqTxC/ZOUcAMQAA6UAIsVneJATXMGDZWmS60G1U4h687eIo+OvNCYKXXF9jWYjnt
	aTnv/Y8oL2+IWCSCZ7qFJb3ZNYm6CmQFK0PBGNaL32k8rCWhXI2omaoGdRUkRdv7
	TZoDZKNIG8IMl242HEhu+9AqyvJAFB41cfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exkb347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c6e05af6fso5726859a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 18:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173489; x=1770778289; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hYPEQRCFSNJsmRAYpi0H3jQa8w1f0jJygdibGbVdfTo=;
        b=RDdtACwCXOemGC1NmLJZAd4LmdhVDSCpHjuTY0F6skCyk65Dro2iF8Ztn9HhLLoBh6
         tr7ZIj6ALkKouP4eA9/Urf0mH+uoy3Qk4jdKY7Wrgh4Kn4e+PrW03nfe5YG7odCazabO
         4M3NYZPLQWqyd9y00TBE3vxM4Nkeyx8tR/vYMTgkWLx9nxSJep82UFJHICAjtt8A64Cf
         4AEfAJX4KwipeDNqxdJLtR9nH4z+8amVAUQ72WnDfgLF2M0TnSj5f+cN50Frzgj8f4u3
         Sqq/RRRshSk4vMnwHfOMFjsXMvoUfaxrL2WefHumBve0wLXWqnyAszIsI9ALjzlVlm9Z
         cm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173489; x=1770778289;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hYPEQRCFSNJsmRAYpi0H3jQa8w1f0jJygdibGbVdfTo=;
        b=Rh+zEZeXmCMdEAbtMR8anFqePcvAApABrutNhVVWlfhrXTsFWOzftWPRtnVrAOctMR
         E5deVDNM5DK2jf7TysgKYdSrreu1iMF91479d/7Q8eZY4SLH//qcxSs5EAsQFpVh8SQU
         VCKQeQWnT9uErB9WCnV95CyYhi9rMtXzCO3BjlqIc0pTrvPm2P16/AxsCqhXvQD65diI
         ybSUiepQ10t3ZKq7f5CJPQbcxbY+Cz9aHsZOt7qqP72pC0KLsJwsLqof3EhSB0HhfUs7
         PoTE0f+CcJg/uWY715/tKQ4yRcPNfrajsxbdqkmhU9cPCG6IFzoTUzhB3y9xhOHZvQ9k
         Yw0g==
X-Gm-Message-State: AOJu0YylxUu3YKOqWcBg3En/nyfnkkvKR1/3iGhMOZYnoLS0TznaRD7W
	4x/ydrn4C3kUR3dKp5fhukt2RQ8M9VUen0x0TJALi7x2WGc/dkBoxpb4e4bVrrgtCnXptUSnfmC
	MsQ7vOkFKEZngnNS+WgDxQc2RylgagCFTcUGdgyKsrPUS1anjHHaV0XoJifyuCJXgTJOx949ts9
	jsD7IMpNYN7Agn0Osxm7A=
X-Gm-Gg: AZuq6aK5hayoKmxc5RIZcwbfEIZfOQqvWp7LUM91zynuf0dK4aV9oEc17Hsd8VFu+1D
	mAPRG5S/5vtJpFKPOX+f17r4hLZ6ve6bU1n5Jz2KIX1o5JebPuXDcNR4851dMFRwYHZpWvalPQL
	rewVqXLIHufXQFWqCAMiNMB8bB5kRC4bsW0WKlaY1+cxf7/NmpvUZvks8nUtSGEatBGCbnQAUHw
	lOAwzgRpBbXt/szxSBfpBTnIcUfhriYnNpNySZSde5wo2T/oEgcOTIvpGjtATPULfLTNxizhKn8
	b9Or1IUbNw+h6m9aFfhVrePxlW10PwysuGCbQ11oi5a2fEjKf5WXRTFlc8HjAiIUSnIFgnNKpwc
	2o/XDho86kv/IMVfrSh58T53G+C106KQG84swNJTr
X-Received: by 2002:a17:90b:3dcc:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-3548722d725mr1248699a91.37.1770173488985;
        Tue, 03 Feb 2026 18:51:28 -0800 (PST)
X-Received: by 2002:a17:90b:3dcc:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-3548722d725mr1248681a91.37.1770173488437;
        Tue, 03 Feb 2026 18:51:28 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548630f6desm812490a91.15.2026.02.03.18.51.27
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:51:28 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-oe][PATCH 1/4] sblim-sfcc: fix SRC_URI
Date: Wed,  4 Feb 2026 08:21:19 +0530
Message-ID: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX2iT11kOA/dL6
 Evb2Ao9Brp5LK+WZM31mtIZRZM4buIftRhVf+u2YdlVWNqy8fHl5JNF59GDZd0znmTDQFdpsyye
 o1aEnmOglwvIAARkWK4XZqqsBhyY9KCJQaFM1Eql/GS1agTVnDnul8iKvP9waYIjq0S/IIHAgej
 vZ14DDIidVkKVaU8K9guZnnnxFyqL2AYSowWdBw0n48CHJ63TBfgI7InsyW4MILf4LTz8MBTs0q
 f1N1ohS3Z0H8ZOHew/n3/CH+fep8/6MmJ9w2TeEqc/NLSQAIUzNoLDcWl0iD+xwicRIkCsvmH7r
 w8zvK4uA/s3vglqyLv98Zcjs8B3VQ5oVbtnwEGyX5QzjVQvtuph0rtfKZbIqjFOA3QD6Mpdxi9o
 LbkBH4UUxr5ogBY/CsghM9uEeRZjXi6sdj7ykIo2lf6L18qkCxuKccYZzdUKb59I+uJ6ctN3sJO
 jVpCPIufnHnz367hBwQ==
X-Authority-Analysis: v=2.4 cv=XfOEDY55 c=1 sm=1 tr=0 ts=6982b431 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=605wjYLnAAAA:8 a=FP58Ms26AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=N5QvOlMQDPfRKD568_wA:9 a=mQ_c8vxmzFEMiUWkPHU9:22 a=j1lDgNfC3SmH_CWLM7Tv:22
X-Proofpoint-ORIG-GUID: mrAhetIVwSe8lj8bOArIZSgvll5B4cIq
X-Proofpoint-GUID: mrAhetIVwSe8lj8bOArIZSgvll5B4cIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124115

From: Gyorgy Sarvari <skandigraun@gmail.com>

The old URL is gone - set a working mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 47efd1f9b8c61d4516cc4f6937431e004c5de856)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
index 733cddc88b..dc6e12fd80 100644
--- a/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
+++ b/meta-oe/recipes-extended/sblim-sfcc/sblim-sfcc_2.2.8.bb
@@ -2,7 +2,7 @@ SUMMARY = "Small Footprint CIM Client Library"
 DESCRIPTION = "Small Footprint CIM Client Library Runtime Libraries"
 HOMEPAGE = "http://www.sblim.org"
 
-SRC_URI = "http://netcologne.dl.sourceforge.net/project/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
+SRC_URI = "${SOURCEFORGE_MIRROR}/sblim/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://0001-cimxml-Include-sys-select.h-for-fd_set.patch \
            file://0001-Fix-implicit-function-declarations.patch \
            file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
-- 
2.52.0


