Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CD13E8B38D
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 02:51:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10799.1770173493130218288
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 18:51:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ndp/vnF3;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Hqc8Qjc8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613Ilppv2613694
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Feb 2026 02:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=08rx9h7Ab5I
	i9rJz3onD+eZmySvWYisVPGOkzlgRIBM=; b=ndp/vnF3WE6i8DNBVEjiTMRAnRB
	/OFEsCZGNGetgz8bK5uE36APl4JVXXxE89lMStn8LNZu+jMA9Hxdjij8uUHTWbnR
	W6k2zgHMzskfIy3ZFLqS2Kt81fJ9i2BYZ5tNTCN9N8/aLwjfaFw+S+2Xpor9uUeB
	eefpZLKlI2DiVkUFa/LbCy4FsUotd1nXckLg56UectisAdr4UAiA5a+bLtiSpzEl
	SDBaJvhB7+FjUnOQGMy+vrwXCG5RoCNXeODeHPKRcn6ye8wi/lI0g/0aCTqfc+n8
	Qp4Kk+e8mz9vnxQyTlTnGEKbQ1D2ZweeT0wx+CNa098ovzRI4dzhG7oUlwQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3h07jnpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a75ed2f89dso55046415ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 18:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173492; x=1770778292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08rx9h7Ab5Ii9rJz3onD+eZmySvWYisVPGOkzlgRIBM=;
        b=Hqc8Qjc8Yd65ipcWx2+PjErChSWkV/Yybx7b81g+0NAT9PNIHzfR1PJO3iIbbOCW1S
         ZgxafxkY55mQWF3aSBT3cO2uk+HCAVtu6xgqREdgRwjH9YFw/lBmlb3zSpqaXQmO9OBi
         9KOuPDe7zgcbBZT0gji2cQu5lzf5Hs3Blbp5o9z7UGuA4TnNMBhD93KP/56Ur64Y/uwc
         HlJDn3aMspbG2CgjDtIF3KqYY+ZryZIswUxI+BN1z8msC7xZAElMCbd4uAFCDK8vce/E
         add6tboc6rdN2/p9yG6lPmL5sYZ5MPTMG2Etbhl0qfIi7jGzBVtZ/IxdPs6MKfBT1sI2
         XVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173492; x=1770778292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=08rx9h7Ab5Ii9rJz3onD+eZmySvWYisVPGOkzlgRIBM=;
        b=bT7R3IbkzDz1OAayAUhCRbVBj+/7yOaEofvCdYg3Npg9JQvJ90BMPq2LOVmOxhaflD
         elhFXNxO1olN6KAPLvqgAKrx2rCycqY+e2R27ZgtpefJkR84fYmPackOy1rQYHB+Q+q6
         MhnR5XGssvH+SC/hdWNFX/wsAI+ljnO+xEcmZ/Zhm2vLXD4LUwfQpXVS7atFES5NDbjJ
         96BnY7ltb+/6HUWurgODQ1ZJlxCE4uSTP+JiBXjbabgcLCk+9663Ovs4EoWzP0HjV+5u
         p7Bk66cJRNmbYwwyAhEp0MyGGwdTkmLNT7lzFskKvS/BS57uCSgL3n6h/yFbARmuBQIv
         lH6Q==
X-Gm-Message-State: AOJu0YwRA6SPUHx38GIEWyshrU941Xh+v7OHc2Am5vPP1nmDB9a4rdR0
	gEBMd5+lcDVyTAudqw7ccSCQWlparkjbx2h+LI6lzBhXmpmis+PlJ8BmbCScg36zgVCj+uUGWjq
	HLURKFk6I1HqWlF77nOxlO9sqNkI/0PvGpYewTkFV4tv9TXklwN2pWM0+uFra67OusoPybxe/46
	bMSoTxcVGPBgvXQC9Rouo=
X-Gm-Gg: AZuq6aKNB+O773kFbqCPK1TiQBBLU98iMzUnuGFZ/lYvulSS8II4uZaWf6yelB5sXsJ
	8NEOUbfbUy73V90wKHtV03pv+BwJDguyrLlF0+xIGEdATyUSUtGdcWG801M3W1dMnDSXslSvinC
	SWiAMCaIGlRtO2Mh4lnkPi4097MC2Re6l4+DPciTh0MHkU/WrHqDiedhvmy8166T3CpYXUTwzfg
	dpeslEZhdAL5/8lnqFXBgDHuUxIsGKuGzI47UZ1TA/b9R2aEQ5io4TFK4o+p4np4L1cMUURGeUA
	DHg8s548DimKFGH7hALLNCFrp5KBZPLpS/kyaT5lhXg0y0gdIJa8j0C1TWHtsiJBUDbClu1HgNe
	XZfJg6pofpPhPPQPEazrBSYm8wBTeuaFrl7g0msQE
X-Received: by 2002:a05:6a21:718b:b0:393:7575:a8d7 with SMTP id adf61e73a8af0-3937575ca5fmr813414637.67.1770173491861;
        Tue, 03 Feb 2026 18:51:31 -0800 (PST)
X-Received: by 2002:a05:6a21:718b:b0:393:7575:a8d7 with SMTP id adf61e73a8af0-3937575ca5fmr813396637.67.1770173491282;
        Tue, 03 Feb 2026 18:51:31 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548630f6desm812490a91.15.2026.02.03.18.51.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:51:31 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-oe][PATCH 3/4] ttf-vlgothic: fix SRC_URI
Date: Wed,  4 Feb 2026 08:21:21 +0530
Message-ID: <20260204025122.2928723-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
References: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX9DabEr59F4Th
 A+zu0azNNYmjJOc3YpXKIbecDQY1O4CDVF2IsoQ8R6vJC82ZVAy/eNnnirnj7ayh6l6BESpc8yb
 LgsPEcuiBhqJm4LpriQkfSNoQp5x2XD0kHArw0ODHYcCz6BiE2rUbDkvGRPaK5cPb73BERHrhiZ
 U1Yjvb6PHEH1OjnzLmki3OBAyKHOZ0oOmYe7T7+rsGjrnl4hM223uN2NSiSMFre5m7Bd605MM1f
 vA30DQ+gn2xHxrxi2gairZbv8MtSTEG675bwqnSjuEBAuqIhFlVJEkykakXbNAJyzaieR8CfoAg
 U76lEPqLM2t0jj/AhRDOpNjCDnu7rMD49JkRjY1vqCTkAGmrcQ7O09+4eDQ/w0xHFfD1VRPKeSS
 RSI41nrm1SVRDcp8NntPsVU/elhiAYucMVih5xpSJAov6/2BsT/m6kq7dtL3L1B1OXZ5HxBJgK6
 z9f60sHlBR4u0wHZ0pw==
X-Authority-Analysis: v=2.4 cv=CMknnBrD c=1 sm=1 tr=0 ts=6982b434 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=SLc1Ml8jAAAA:8 a=danhDmx_AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=FFiGdf_hc2ueiQHHMf4A:9 a=QRzjZtwMIBQA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: WP8EkPrGZ78oRj6SpUDH_66py-0fAVbZ
X-Proofpoint-GUID: WP8EkPrGZ78oRj6SpUDH_66py-0fAVbZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124117

From: Gyorgy Sarvari <skandigraun@gmail.com>

The old URL is inoperable since a while - switch to Ubuntu's mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d99c82c0883b3bda89976af17f4114f292f71221)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
index c7be162b1b..e34770d520 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-vlgothic_20200720.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.en;md5=cc06b20e7a20bdf6c989624405378303 \
                     file://LICENSE_E.mplus;md5=1c4767416f20215f1e61b970f2117db9 \
 "
 
-SRC_URI = "https://osdn.jp/dl/vlgothic/VLGothic-${PV}.tar.xz"
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/fonts-vlgothic/${PV}-1ubuntu1/fonts-vlgothic_${PV}.orig.tar.xz"
 
 SRC_URI[sha256sum] = "297a3813675fbea12c5813b55a78091c9a5946515ecbf9fde8b8102e01c579f4"
 
-- 
2.52.0


