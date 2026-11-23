Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54394.1795443275222950243
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 06:14:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=U+j943d9;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=DZBOxUq9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKvDM3329315
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IB5tY4HDCNZ
	Crp7/QFRb9H/LqAwJ0dIKLuMXO7tUyys=; b=U+j943d9FdKRGe/LPsxLrASHBXR
	xHwQb1YdKTOZTLET0icO3EnoAyZFvhP17V8R6yykTcraCBKFbN5AyT971OaTTYsq
	pDx1R0JbLXefj6Zw7YB4vAFFNPJJ0R+uD8x2kOojBgDrsFO3kLfqrJ9LAiJ6/kX0
	IQEhhbfsrl+Laded+z60zf2vHUzHVQrBQjBW6nuFs6OJyu2/dkjkY3SJGugc5V/W
	tO+etMf3iJgZvRNJ9/20udz9hEWL+6dY1C1FfC5N4aU5mlahn5kk460+ZnQTLq+q
	cIF/AoO13MrnPUfqCXYbun1ra2uoDuyZg9NUwLsdcao7O5ycQRBZ+6f+kWg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd1rqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3817a0ffd5eso4289131eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 06:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795443274; x=1796048074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IB5tY4HDCNZCrp7/QFRb9H/LqAwJ0dIKLuMXO7tUyys=;
        b=DZBOxUq9LVIllbdnUlVqo9reTr4FShD5ul/nlBO4KNLKAJd1TAtn1BZamTPOr9NWy0
         u09Dwm/2/TopyjmL/6N2vFYTIl98wrnoj3UgSFx57jGIbu5UCzIUAWRdLyW6dBp7L8oD
         +Nuo98907UvWx0cst968wrA6CyrNKJsH3wZhjnvy8sfA1qGwfB4ilfqRyce0Uq4q94Hf
         bjhwVGwq/CtUehCG/d5+vWA2Qj9S2NjHLo99OKuIuQ4QA+NdDPtvZpageB+k/hV2pOQz
         IvrVo5jLpDr1kQudlJNdUk31WS70ULFkcLcNpFuwf82Ne/ny/n1bdHrhSRbfE18pKU6R
         nY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443274; x=1796048074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IB5tY4HDCNZCrp7/QFRb9H/LqAwJ0dIKLuMXO7tUyys=;
        b=ijm2hR9NFbVyC/iON0G08Z2KSMAvNmxTMRozZkKYNBM3jPCmTLyQYWBKkIuH+J7Hds
         3aW6wA9b3jAF/7Zs8cSdqJkokMvhmocJZEwkzbUOAFqBReVHcNpM4ryAMXVJisX92ziw
         Ksvo1Kmo7F+i96T72GscYR51kAn6c9l/9vd7G1QSn/jlync31qxq2USp7Er7K5Z2jCUb
         anXSE0cwOyF+BmTdW2lEeMMkyXLgRtOStdxKRD3kfWLEGilOF3QC7UhFYMn/9XM3giDw
         X/LMXdVnUHn006aD5WvnxkgSeWkD380srdLsGHZp8HQyMmpIT501ne+Ar7ovUjBF1By1
         IKqQ==
X-Gm-Message-State: APuU4Z8Dpayp89gySVhMfPMxVf4H5nAH0e90Iprx8qokHsE38t9VrQFL
	coAqtis4xvuJzSwsaumqOti4deevLMwhP6S1GKz9vJC8SnS4k3UAbEjTk+uBO6cov+DdItYsOVs
	t1+g3RWtSy82l9B7WDc/Jbz7e+2R5Yv0HfqRI9LOQFjvuSWH9Jm2TWj9ddNOA2MQ4Hdh8QwQecf
	UIhsptGkgGYqoKApxT
X-Gm-Gg: AZFdTZcoz8OaTf/SNKgANUCaa801tWczz1LMrFvEKdDtDhKMjWukQ1TbVNaJ1DVZ6Ii
	/+RWKghAEiuEQClf5QbgPf3HlGsGlc8UTwGbR2nD/y6fNUNupzhH4gaYYizKtQ3HgAO2TUtmLmo
	sPmxA1FGuSC1e9U91F7e1rYor1pjvw7FfMfSNVHNyZxRoROGXwyRPc4GmXYKKtoVtYz46x/BTok
	u048H2SngDQZupUg9dLabwaNHiPVNnzEL7T5oT7PP6CpV5g2lxsm7jRT6UiHc5ZQRQC6N4yxrvU
	kS3hluzIi3zW1R+dN4Ih4X2sB5PahddSs7HE+qJ/ueusuo5yiUWowMoBg8eanyellYdf+fsR4nu
	5gkaHRKtDrPttxRolhymdKCHO28M/V94JOHrO4yxxp6mwuoo55Of0zEpWmzEOmFShRSzTOSoA6Y
	M0C/7X
X-Received: by 2002:a05:7022:7f14:b0:19d:233:989d with SMTP id a92af1059eb24-1b5568ff754mr10549276c88.14.1795443273501;
        Mon, 23 Nov 2026 06:14:33 -0800 (PST)
X-Received: by 2002:a05:7022:7f14:b0:19d:233:989d with SMTP id a92af1059eb24-1b5568ff754mr10549261c88.14.1795443272931;
        Mon, 23 Nov 2026 06:14:32 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm33218644c88.7.2026.11.23.06.14.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:14:32 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-python][PATCH 3/5] python3-ldap: correct python-ldap CVE_PRODUCT mapping
Date: Mon, 23 Nov 2026 19:44:17 +0530
Message-ID: <20261123141419.1377088-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
References: <20261123141419.1377088-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QBlz3YJ6rKuG_nbTuFjmHcb2_Da6UDqm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX09N6v63yeMwG
 jiM1mgNDmNcJHf74bs1PEuAszsC+3KSaHDqKntsYSgiDPWaV/MJQWj6ODHrYffXWaac15worsRg
 ypCraZ9YwzxhsFCN3rFN1xCGeJ0Ls2MJPN1oRmMNNq9oKvZ7hgJqTSNUJ6yusvZOyk8612qCcTm
 ti39itFLE7D/FI+aOzJtWRBITw8SDj+O48caw5YBcu/uiYRMMddpECV4qhJaTqjvU/iyPmH3AY5
 R7YJWko5tBI344Q5nOePyn6zhJGqwj5XdI4c96C8VB6juCfRvEsv7yvcVyCNGPJDfaEY/yxEsYX
 V1g6+zCoeYkMv8o4PaBwwC44wdsnlAn/SYjOD3J+PO9ahpPn3Iml08XlHShoucAtxhYfw43grIq
 xgPEyYIxMV1Ko1PAijzH/fzlr6No4dutg8LSBbjCp2yyHfBBt3kf5LXWrDiPQ1o4XB1zfbTcH88
 kVCiyJaZtbckmeRJ5hQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NiBTYWx0ZWRfX9JcFh3C9Yj6P
 NHeje6cvAyKpzggE8a6GhHb62YxDPq7/2K9pJKGWmq5fxjFbKJdrv0GWmNC2mhC5tLdEa5ELyd8
 Ynm/NMFrbIoOq9wd7j1rFwvSjqEGrGs=
X-Proofpoint-GUID: QBlz3YJ6rKuG_nbTuFjmHcb2_Da6UDqm
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b044a4a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=AUd_NHdVAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=7Cf4TabL-YR1zNIufV8A:9
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230056
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 14:14:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132897
Content-Type: text/plain; charset="utf-8"

From: Devansh Patel <devanshp@cisco.com>

The current "python-ldap" mapping generates a vendor-wildcard product
identity for the packaged Python binding.

Use "python-ldap:python-ldap" so it matches the NVD dictionary CPE and
configuration identity. The generated product identity changes, but
sbom-cve-check 1.3.3 reports no CVE delta with the pinned databases.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit ffc1c4a3184e5bb55f3be713363eeffb33fd8e82)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit c980cdbfcf165733e9c36d1599cf8c78f7747d41)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-python/recipes-networking/python/python3-ldap_3.4.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
index bbec490c23..bf8b0ef260 100644
--- a/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
+++ b/meta-python/recipes-networking/python/python3-ldap_3.4.5.bb
@@ -29,4 +29,4 @@ RDEPENDS:${PN} = " \
     python3-unittest \
 "
 
-CVE_PRODUCT = "python-ldap"
+CVE_PRODUCT = "python-ldap:python-ldap"
-- 
2.55.0

