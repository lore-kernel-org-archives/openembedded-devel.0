Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40B5CAC5BC
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 02:40:41 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.45260.1759113632418664534
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Sep 2025 19:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=FMXjF/zA;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58SNDqE8019481
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OrZf+1OOO+x8MACiaDJFQaHn2Y+WBBEdmFP
	Dg1vUK58=; b=FMXjF/zAwATlmL2zSwmIRB2yK2/nVB+AxnoL+8vUMEZXzCBmOar
	HCMEGtdWDl32L+Hx/YLlZqPRJin3osXny76EPs8GwQ+gw8GoOVgk40ySSZC4QlTe
	bn8yKwSHIo+vOvU1zB7+OVFqr2zB2gBnwTt7qnc2UqCEtc7RXaLdD1O/8ANeTPEV
	EhKnlwwvsGBM+1NOwZMD21cZAX086krKIPjR61U1Ma+7O2LyqqUs/bDqzVJ/VYLr
	xc2JhCG0csUBKDxTN+Smfl8X9arX0ucUzyWMgUnSbs+qaTuW9MJivNIBF+zWV/l6
	PqdQOcnfupBCft25mKAoLwMqApk6K5wBeEA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5umwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:40:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4de36c623f6so60977171cf.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Sep 2025 19:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759113630; x=1759718430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OrZf+1OOO+x8MACiaDJFQaHn2Y+WBBEdmFPDg1vUK58=;
        b=C683blWWhiCnVNPejC6N89HV4YGEfDWB7/7WzP8AjgA8Z9+EQUZSwRKwXdXBj9wsQd
         d3REv44IP2jb1XXl8KyHXwpHCum/9Do4f6M1EJ/7uKoJ62z9kH7pEqJiMEUP89PR5ni2
         Yz9ER3dJB+dA/mIJGwyyWvPZ7I68+X+dtbnxzbTT1EMuVt5x0ikr/sqRP4aiTTCAYuxv
         fNI197U3Zjh9PXrOqzX1iIcoNramSLTQTZoRZmPWfTr6oKmAUapV81fr10TZm4yt7aVc
         itZy96keZ5wh9CwSrmhNKoipZ83jGh1a7r9ubc1Wuynh5x+ZjHIzGky7gGlrkK7ghRgE
         XeVA==
X-Gm-Message-State: AOJu0YwA2Jtk28OHXvONO1MYNIhEfaehRgl7YuleRe5ZneOI0uWABjCw
	4PQ2UTxCjGKTSWIMAWkdGPEAOOfGit6UnKBbzV/TtuECVlHcwGfmXvknZ7Xlj1QYCWJOSVLTj4o
	Xv0pT4jgSjvkEZkv+veoFcLwIk96QvXsb2QEJN4QOBJVRFBZ5FqirA5xFzFCEMydQ+bL7aQfkdk
	iV8pYv14Qre/N8PwsmTwbmFA==
X-Gm-Gg: ASbGncuD2fydJJmLtsznBCWwQMbTea/WZaDahtu606TRc2lBDARa+8JkpdP8BKTOppX
	G9k9qv3Y1O0OfL4GiZSD05v+iefyRs3O680P4ABclCU10PyqMdfO7tQMPhh223XFxYtjtRYQC8B
	AKpgVvEHxDMzzQvo2rqkvVDIQB75m6Kj1YhoKIZX/zQWXKsZrPmAZdvZh+zeXiR03MsEtQKbgl0
	ONembIP94X9vPm5t3L6uf4AcxTQ8P3hrr8uh/7Np3eNRO+65+3nmm4m+3BoMlJaoQdyXrtAAcUM
	j5qyM/TvEGM0B9+9ibTcpvcPJXy4i7Nus72vum/l+XsVm+nYFE151au/K6lK+tJ6xxNjlOV4Qqv
	GGeqginc/us+RbkP4AmEW4UjjfdPlyzcwytHNn60zRFqU8U6+ip8S
X-Received: by 2002:ac8:5852:0:b0:4be:9bd8:96f0 with SMTP id d75a77b69052e-4da4cd47641mr194856841cf.71.1759113630342;
        Sun, 28 Sep 2025 19:40:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMBzYBvTHhVnk1GjxIE1+UVF5EWxax2lefCGWWSfnKN4njH/qCoyfhNHBquZyLnhkh7iYGLw==
X-Received: by 2002:ac8:5852:0:b0:4be:9bd8:96f0 with SMTP id d75a77b69052e-4da4cd47641mr194856651cf.71.1759113629723;
        Sun, 28 Sep 2025 19:40:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5882275f1fcsm306591e87.98.2025.09.28.19.40.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 19:40:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] opencl-cts: build SPIR-V files for the spirv-new test
Date: Mon, 29 Sep 2025 05:40:23 +0300
Message-ID: <20250929024025.3210337-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d9f19f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=eI8iLtjY0aaPX4BExaMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: fNeHs640E7jaeqxMo449gJtQ_HR_3CU9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX2Y9frgOIs4+4
 H7+3FZVpd0wNslyV9lH42n9Ekpe1frXsgErHAUuJiPzVrxz4Ghp7OyXQSCYhp1MOUhKY4eC7fRB
 PyDodbZEtvYb/xh2iSaBFieXS8kEq2OrCiv4xacB9HS6kwHEsxbGlchbqJbQQU7hY5XRD+v3YWk
 gcPB22hubfhcjrUKOpRfDWb9Zk2acsABxpcf1AAOdejCz0iO4mLFi7PLnEe6s3IG8Ux85QvFKtI
 9S+D+P/HF6GgDUogS3VVf7/dYS8W8gLLqG4EsMEvKEE0xE1aa274H+qsGN3wm0WHxJnC192JBuO
 QoiwvPhTbwC1OcNt/4z/vOcyNYHC7PU1kK9odd9uQQj1ZfvYTR6oq5u/JRwZB3Z1Re3upYzJ3dJ
 v1Eti3HVjrcoi2kCPYh18CU8jVu7hw==
X-Proofpoint-ORIG-GUID: fNeHs640E7jaeqxMo449gJtQ_HR_3CU9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Sep 2025 02:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120004

Pull in spirv-tools-native package in order to build SPIR-V files for
the spirv-new test.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
index 62b59ace138f..ebf83d1a1a2d 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2025.04.14.bb
@@ -7,7 +7,7 @@ inherit pkgconfig cmake features_check
 
 REQUIRED_DISTRO_FEATURES = "opencl"
 
-DEPENDS += "opencl-headers virtual/libopencl1"
+DEPENDS += "opencl-headers virtual/libopencl1 spirv-tools-native"
 RDEPENDS:${PN} += "python3-core python3-io"
 
 
-- 
2.47.3


