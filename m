Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54393.1795443274683668295
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ACzxdfQC;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Oo26O0OE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDLN0x445712
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FCJ433gGiTi
	yB9ng+i3GkgrJmxIZVL/8+IjUxmMPRIw=; b=ACzxdfQC+qDblZxWUXtnaA13CCN
	6NEx4OLkFH5zLkJApgpWktSCcG40jp/FqcJpiVq6kd2agepJ9N66X2wWLs6cnP7x
	bpOh0uTfOyni13/RrwLcWa/6BquVM1lGoHgA8wzG2GrH24j53gZLe9dZtozHuR05
	jZNyVUNLPvtak+yto7RH/5nlfg82Jh1MdFCQqTOq2f+yiMg6BJDEewH+mAc6RrIx
	5xC7DYcR4dF7UalbIC51/uwEMCV/olrxRJYKNn6QiM4PIa84tfa3jjaZpEsNefDq
	+0mpwDOwfqWqpdn001TBFMo4AP0fX5JfhA1BJxGCv22u/W/usFUSotFaNjw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g741qrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-383ec96a7deso3839263eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443272; x=1796048072; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FCJ433gGiTiyB9ng+i3GkgrJmxIZVL/8+IjUxmMPRIw=;
        b=Oo26O0OENL8MQlbl5vhaKTCQSWRnAjIF6tQatFngP1Py4QX3Y3BBtaz18WdHGBAhVn
         NJQ/sSttIHt2BmmtHNILK44ZQAIK5oqLR74fSytEM1c3uri/vsX1dVE+S7popo6ZEU/t
         iAYmQ0/EyqRGi6z9pmeJYHUN39Xd03IR3tvRaPNJeryrOE+RqLgZR1WOFwHXD+x/7qEj
         s/mmxSrqZTD2WGAnIIvOjtuCfCrbl6DZjDVTZbBj5ebkQNMdJ+HlY5NxxrzVJBX9gN4Q
         TiGPU096fJ4ru4mBOnjm7/B2w3gAmgEKLKcNJ8BOWR5w5BMsIDHt0i4RIrHj1ild4Z6R
         sv+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443272; x=1796048072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FCJ433gGiTiyB9ng+i3GkgrJmxIZVL/8+IjUxmMPRIw=;
        b=l2NtVfkVTpbAnD00INtDXqAKMBCB7n5UxpZHXBEgnAvZc7Xu3oW+9j805G37cl2kUc
         QYOv9mehhWQOHuBtJIAobvH7KLdzdSLnIbjNigKvgjk06fPA/LgSRWtfihIGtnmc2VpX
         Q/b6IswgBlh8CKmV1Ux3q2YF1UFOhN6pUiM79Wax7LZ/bElUfJ8jKmAg/t989NLj1l8V
         YHzsRSLVU4DDHcVEXO92YEyoicH3ls91658h5HoVyG6m7CuV2dc9FKazQw1k10WURk0Y
         E1Soy8Z3MsZ4mEQsVlZRj1u7e4OUetgQMJnTyOaRqwsDNzBDWWsQr2SbGauYom6yB2gH
         iliA==
X-Gm-Message-State: APuU4Z+yvx8Y/ewt6y9+LNUvKuo00NaQZvSFtWmFK3EwSXp6Z695PJuF
	Blsx9u7zYcK6lZo2SxX9d2YaTECZEZ5T0PZCqXT+rY4YLs2HjV2Nd0Zjzi+T+SqYDH1ML4ILSEh
	BGGVEOPftMQWP1XsQ/czH+V22+7yay3PoNQloAoQKT3EsvCxKJzetvFBrlLap/dQKTtZ3UI6p+s
	YkkEpa3UhVPqkTXE4t
X-Gm-Gg: AZFdTZcvCnnBhW5+nVgU6iTb/xKkX66rzkfzEUgugpi8PKlTcWZYfcAy4nRYFcBybMB
	A4Gcf1d2XH+PABwE+CtaREaXCSnC4x7vlQj5AWS5zqcgOg1d4/MJhlPoYxE7w2TEMG2L9eVmSQb
	6HQmXktPD4jx4kFpmO7nih0r8zZFsX3ColXLIt6+IwBYlI9iLhYNNEv3p7iVDmbDxkkasTpWI1/
	TNwBC9G4yrgqsldJz+4cJEn85DBf5TeUA2Q64miIazO0BhEs0R0fOZ1SJkdZbb8vEUralzFBm69
	p8tFvONDa7FlYdXbCMlelySsQHrzw1EpKd1RyLfiqMTLrniPE3w0ldVG8ik8H+ZKcRcqXLBixul
	2uctTxCr06ZIRiXTqSUHir+FtuCyfArBVoYF/Tqh1G1//iTEn96TfEhnCuvNwF1BFpLunAyy09z
	uqkQPg
X-Received: by 2002:a05:7022:5f08:b0:1b5:4ef0:7dc8 with SMTP id a92af1059eb24-1b5568df418mr11791746c88.26.1795443272114;
        Mon, 23 Nov 2026 06:14:32 -0800 (PST)
X-Received: by 2002:a05:7022:5f08:b0:1b5:4ef0:7dc8 with SMTP id a92af1059eb24-1b5568df418mr11791712c88.26.1795443271461;
        Mon, 23 Nov 2026 06:14:31 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33218644c88.7.2026.11.23.06.14.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:14:31 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-networking][PATCH 2/5] ncp: ignore CVE-2025-14577 and CVE-2026-35087
Date: Mon, 23 Nov 2026 19:44:16 +0530
Message-ID: <20261123141419.1377088-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
References: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kE88tNaLg0Hiu8UPaxsX0R3rYYU85Hhj
X-Proofpoint-ORIG-GUID: kE88tNaLg0Hiu8UPaxsX0R3rYYU85Hhj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX/wsGJqhQsFmS
 nsRU8bnOiCUm/5MBvZ70Ut2twbPv5rUzntRgLlUlon6xOBwDCTWYR8GLwDOp5dQJLu+l3RKP9c8
 1uzqYoXAEk1KRCjfkJ9Si43Ghwqnvhg=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b044a49 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=PYnjg3YJAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Sbq5qFVq4D2BaQD2XSYA:9
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX5clXFA2UbWAb
 nV3Qcm4HdfQ6xnZopZO6pkz8yFYRuZzxRV8xCtEYjuOjh354am/mlbsan9dz6jDiH2NFAdHW0OQ
 0zIuUdHD/ydePXrULe1GjqJKTeOcT9OwDrOEEtPt2969iERmBaL0zy0L7tp4FHXZulbBOgTE6gB
 wSo4tv5KcIefaO8ogWARDvgwrVut9XaWYS3RlDs9hanxpLtZpLet5t6K/m6fKmIW4TjkwVRg29N
 EtPTgaR99uDi2MSCqo/HHyV2aCTvJHeV8w1gFNRfTgzCmIHLJXP60SN4Fd7bIohjngWBj6J/fiU
 lCEbjGtrdipUG9MXbw2sMByw3ExXaPI48GdiBMg0ZnRsZZ8360fHe7ME629t8ShblbxGlSOElPS
 bhW8Mhyc5X8MPa+1Y2o3UL3ZMoLkh8Oc3YqJlUSOvoQbednoHDaudQ/9l/1gKAMJKJFLPEaGb+K
 GeBFLlZfGY4hNQ3sJcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132896
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14577
https://nvd.nist.gov/vuln/detail/cve-2026-35087

(cherry picked from commit 1bd5d1a7a69aa04d6339ba7d5ef2cd8b83ec25a4)

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 98e04f2bb7ba00dbb8b2c88f5d2874ca6c096ea3)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit e5bf373a234fda5cf96dbb5a88ca6072011abbad)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index 516beede5f..42106cd9e7 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14577] = "cpe-incorrect: This vulnerability is for Slican NCP"
+CVE_STATUS[CVE-2026-35087] = "cpe-incorrect: This vulnerability is for Slican NCP"
-- 
2.55.0

