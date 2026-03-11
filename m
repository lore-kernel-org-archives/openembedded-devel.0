Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8463F1125803
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:14:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21114.1773234758297826345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:12:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=IuQAIBKW;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=EBr3JA6e;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B9DEP71572935
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 12:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2xxH38y2K7KXLeqgsH/zSE9jEMX2uSXmFzI
	Izy+iMbs=; b=IuQAIBKWeUNeAT8ktXD8f0SXpNx/QvMEt/Gyh9LhphXhRzzxKRK
	7szVqqLISYduIYB0FTABkcx+vofgL2rvRuDov4aSGyoWk+aD+r5suSZFKlswPABo
	27KMGD+slkORPZl1ZRTtKVGFBnEtB7kKWf7NbhnUKMeBXjY9XRmQ7ifg4Sy3v4sh
	8HhZqSVqWa3qw5qPH/y/tcwPNUHi9TkXF0aUEvWf7HGdeZzTEg83csa9Wsl8ceSY
	fdlFR+yzIagQOV6nkjtsnsvufbv3dHoW0Qh7+diBEQ2n+nxu9M1v20OK5yLGO/iP
	iMnGbEeneqe/Z4L4DF5OXUwLUROSI3vSyJQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctqgkbhud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 12:25:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so2038854885a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773231907; x=1773836707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2xxH38y2K7KXLeqgsH/zSE9jEMX2uSXmFzIIzy+iMbs=;
        b=EBr3JA6eEuaOTPnGea4brSY6j3JkqRj54C4z8HYMiBxsbcCNSr39ytpNls4wJP3yWN
         Ym7LokT6yA7N17nTWdyqh+8ICDECRRzfWVXkNEg6LixlBCU6tolwn5ItfyWBomcb4W09
         Gx+gg1kctkXh3aN7F0XueDbKsFcBQzh4xoke9nVaghGvcy6ZZQRIzQQUQiHnnufrLl9D
         BfHNKjPaRJ0oZVY5zlLDUw4BVPjIbGQxtGwsffJuIgs6f1vuj88vmVr+VbvsWfm+D64e
         7RRSD23SuXA/SjwRXwW/7OdHBxRghTKWPkhPEDKOqWeoABhAegij4zFdmppOBW6nfnk2
         LAzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773231907; x=1773836707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xxH38y2K7KXLeqgsH/zSE9jEMX2uSXmFzIIzy+iMbs=;
        b=CKip4YB6/dhcEOU4+GvmFKLuCeoSwc9UhOLrUk8lwzQRhDAaaM9uU+UlWyHiDtbAX/
         iSlla5vw5jHl+/96pMg2Z+ouv9QbApzEF1T6f946OzVQAMCqx7Qt6rX30zVVRj7OOwg1
         w9G5JsNPg9/X78mE8rnNScSn8q1Qb0l21MxUN7SpcMLJJCnpuFzqApPv6sYEALAnJ3US
         mElli12f5SKZNI/TAr4gOwS/RZH/NvZHI72j9PhOOOMRNX0SCYGO0H9HdLLekYMTv3xC
         cgsNKmoiy+GGnp+j9cIJGmVkD2IMMYrz97iJ0hv9ZSLriAZvAPW/2IDKnoPkFn6SegzW
         X/rA==
X-Forwarded-Encrypted: i=1; AJvYcCWtjSkqYyjSZtJR3fJwnXUusZvVeKfKwOWXAeoCR7fDWwy2xgxjUr0Gn0OHpDUQ9dBU0SmellBzIFwrEtuBnltMCUc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzSBv3akFhRRb4E4o4CsWtbZKZVptUZzra1oPAzYa1fhVHWat07
	9F7YMmxoxRSc4pozP8gx8B0F2M+pj+5Zmf1FsAizbVahFv3zMZFZ+CzQe5hfvew6zpg/4jno54n
	pVeapDa+odyJdOPx8sAp1Na0v6ZHvqE21p56lvlVFS14IaYY7Gn5Z9sVFjokQcYJJXg045r8Wm2
	gCu5tK+lwu
X-Gm-Gg: ATEYQzwfrORW57Lg5aiqTF/vwauNrrUkV9IdtQb32MSUsKiBJOlJGiEyxVEH0eYHnWs
	R/krOIr2VpC4ako7BYC61TIk3j+AQkkwZKTibVD9MNh1sUwDfE/Tw907z6fosNvREBJVWqUyxdU
	VQlSnY7kcYc3CxsX8KyvSWti9LRxf0Z1MNiTQg3+94X3U6md9Ea5e75B0NwfgVIhvomqjbwGokA
	PvHv56i/h+obnxRAyC8oCsb1qlqXyUL+V8JsX65UtZuklm34gB6qD/d/gP8IP84s6f6y4tZM8kK
	qhzjAAB8sat4bugM4SSiD8XLJY8Qz2+sD9xm3eGl7CUf7Rk6RfWiN2dTPQTyuGLXnhirPwlvHox
	gF0ov83e7UUXLNxQNwUy7OfYIJKXhyj9I8s2c9wNzvqcWcdYJL1I=
X-Received: by 2002:a05:620a:1906:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cda1a1afaemr264678785a.51.1773231907154;
        Wed, 11 Mar 2026 05:25:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1906:b0:8cb:4c79:b44f with SMTP id af79cd13be357-8cda1a1afaemr264676085a.51.1773231906733;
        Wed, 11 Mar 2026 05:25:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4de1:a251:cb8e:f0b6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f81acc22sm6049371f8f.16.2026.03.11.05.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:25:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH] python3-gpiod: update to v2.4.1
Date: Wed, 11 Mar 2026 13:24:52 +0100
Message-ID: <20260311122452.6142-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-GUID: -wHr4UlMrr7TrNmUprVnTC1rqSiCqiGQ
X-Proofpoint-ORIG-GUID: -wHr4UlMrr7TrNmUprVnTC1rqSiCqiGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNSBTYWx0ZWRfX6/Cl8DQnSVzd
 4n7gZffHfF/J66etvqgg9/NNJqwfr+m5DDJrh8jNdcHgIAx65gH3IUerhWwvaAhe48FYp+L69gz
 4wNKlh3nAvmc+ZNDuMlvv3CNHdtveNdKVlwzktltwpCE+z9djNjJAcOYGtdYuC0AZN7nVIT88i4
 4OK2WM8mY8Ul4LkDz3mvZByx+5izoi90riSZXv2JL2tEJ6SjH+kj/Lf1wZCrgMfOzPvb6F9SL1f
 Ampywu0wZBh6PO6mKiareVQG2z/x3M+YUQ82kH0Nju3KDtU+KV+e593J7xBDagJMHE1v7kuVmq1
 98dThZ6cPMRak1OO7PABhhF6MCIrT0nzT7evlgw8H0Y4E6GE9WVeUJK0FDLxCMpMbHyEWWiVnDv
 JzEiWwIJuIrlXvmpOvYlrRvirsUPWPtJOJ/JAN5ZlgxF0NEA79eb2FkrtMtJE/YJaJizrTck4V5
 i47gxTvmDJYr84GKthg==
X-Authority-Analysis: v=2.4 cv=M4JA6iws c=1 sm=1 tr=0 ts=69b15f23 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=MTs7VYI6zFN0M-x-ceQA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110105
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 13:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125087

Bug-fix release addressing a memory leak and a couple minor issues.

We now ship the license file with the dist tarball so update the recipe
for that as well.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gpiod_2.4.0.bb => python3-gpiod_2.4.1.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
rename to meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
index 405951fe0c..986146dd5c 100644
--- a/meta-python/recipes-devtools/python/python3-gpiod_2.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gpiod_2.4.1.bb
@@ -3,11 +3,11 @@ SUMMARY = "Python bindings for libgpiod."
 LICENSE = "GPL-2.0-or-later & LGPL-2.1-or-later & CC-BY-SA-4.0"
 # The actual license files live in the upstream libgpiod from which the pypi
 # package is spun out.
-LIC_FILES_CHKSUM = "file://pyproject.toml;beginline=13;endline=13;md5=0fbc720d3e48432ee239eedb6adb0f07"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4b54a1fd55a448865a0b32d41598759d"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1"
+SRC_URI[sha256sum] = "d29a1e8b2a065f7ed82f00a96009bc1486fc705bb2ad25820a8ae962ec6d7688"
 
 inherit python_setuptools_build_meta python_pep517 ptest pypi
 
-- 
2.47.3


