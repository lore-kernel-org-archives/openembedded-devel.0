Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47994C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:48:54 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web11.27496.1747763330503361494
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 10:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=QJbfh9T8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGdlQP024639
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6Kk5wU0Kq+eG+6QBlYXR4/2kK8/CcJQEV/h
	HbwDFzTk=; b=QJbfh9T8ge8w4Ax7RSOzXhBRtB7D/H9oyT9u1o85xMqFNqPjTTr
	Z6t0weuhWR3V1Y+b7K5bhrYpD8Me4OnEWDKXWLGnWPqAAYal2C+lMyO1Ue0kKqMG
	7Xga8Tod4fmkoSUHOvpqxIJDCLxZe+kNJWwQUV5c9zPQRXtVmw1MWpLHvj17eZfV
	CduATXnlJ1bzvWf4WP6UQ7xYHuiRKjuws5VavogVWYvUac4jMYDgT4PQFUaj304C
	zGeREF14TTNkpTNvvfPP4/sy5Cw8kfQceJSRuN0z7NXXtDwFtt+BGIFxsc7bRO+D
	T3Ibb6D4fw3UwjWWJUsV6Oows3hwLyaqvrw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf306ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:50 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so56291846d6.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 10:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763321; x=1748368121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Kk5wU0Kq+eG+6QBlYXR4/2kK8/CcJQEV/hHbwDFzTk=;
        b=Iq8gpp8a2hM6s19TFp67nucnI8HLes5QHcbjgJmlOEC/T1fqbNquGZTmH34wuMe432
         oG36vV40/LZIRgldHUx2GPbMwnp8nhq9joRlcq+yTZoKwHi/B+ThiCFLUSm8/2ok2wyR
         kQzVTVXp0IOi2qBshD6pURJhVhAWERWHreuyR/8pp2cj1denCJVfJ1G4VANVZtp/CdhH
         gfPXLcBoS7sW+9MuI6jsBkbcwpLQU8l12q6OGPpL8Zs4o4aB43eCSUoMahXaKytBw77o
         I8EUz2/k621ebP7g1HLd1i8U9wN/oM/zKbIBuRkV72JIyuY4aUMxUfiueNlzxc0qdr+r
         ZXcA==
X-Gm-Message-State: AOJu0YyPeUS8EZ0AbGMk7TlmQsCQy/wRzfouALDQv6lha0rH4v3z68+c
	5C9UlNlRaVSlpwOhTfn0sNvrjXrgIJWTSfeStd6whBKKhw9EWW/Q4A/PAqKBE+UaKYXrC9Og/aL
	GCPBvJ0MdAoZjBa/8F8RXrTmp1aEOXiyI35T9Khk0KkaiQFQeHVEp1F2fTVfoKt/9+4q417UfFc
	aGf+bQ8JhJLv2NQM3udE8=
X-Gm-Gg: ASbGncsS/WzuS/ZGgrXf2qopHI6O8LmMaIXcUbySvIG1fMnLHwfHb4dOhQmfX5VULa/
	tBV5ZY8p3GvS6BsyBq3nDdU+2ybkgwg050yBtGtmrwjLOTqNGMWYXY+Fns00crIBWDa7kB4jvvR
	WKNRX+Yd6e8xdbekWpxztAUSjauhTmHCFm+sN0EbPa4Y17KWwh69c/j+b4SMpI0BkqsUC+Ll+cb
	HhOqDYLpw+i1qHNLuJwgtTcfYPn4i+vn25EuIXTyl5G6p18GFsc5N9YHX4RB+ZRmJVOW48I/igU
	lL8+sGgyicfG4yWy5XGbz5jFm/p6gO5zwp7QXx02b7U65bZn8uZbWGjEVN7wNxY1sEl5MtiC3bL
	Tb0dwIdeRRiGx97/TxNJAfx//
X-Received: by 2002:a05:6214:c68:b0:6e8:f5db:d78d with SMTP id 6a1803df08f44-6f8b08bca57mr303265876d6.23.1747763321243;
        Tue, 20 May 2025 10:48:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2kWyiVAyEXjq8K3vTjUcCnqbH1Q8VAKvWbs11EOJyf9VsksAL4XQuBOhYksqctT5jjuH6QA==
X-Received: by 2002:a05:6214:c68:b0:6e8:f5db:d78d with SMTP id 6a1803df08f44-6f8b08bca57mr303265446d6.23.1747763320715;
        Tue, 20 May 2025 10:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6e0sm2441815e87.223.2025.05.20.10.48.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:48:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 1/3] libglvnd: provide virtual packages
Date: Tue, 20 May 2025 20:48:36 +0300
Message-Id: <20250520174838.1187294-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8eHVyTv_JTyG5KsECUKTsPuJpMi5r8ob
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OSBTYWx0ZWRfX3vnwP3svkLPR
 plIFISJ9JZYiHzMaHJ2pbTYfUejHWgD5osbZgBslxnaMeBkoZSdKfS599pHVIfTZ9teDbDyYtll
 ctYR4bhy/WvqZaOsQ8k3s1c46Zn6WhleTTKilQ8K/ALrB0fNWaS7+iwifVmg/AtBCR009wsx0d0
 0AUwlqEJ4Kcrkch39IEFaHcCNOY+RvLrwLNLORSdM3beM/x9f9JiA/uAFj6jmxLwuTkZ+yzS6Cg
 NuAM4FUDDXAb8quHrMjIVlx5JbFz7r26InJgZALKlNMpGNoFXDVZNAGwrvZcKvX2ezS/etlvqLo
 2cb9msBoAm83uxQmf8eA9X6B3lQSV/g4O4YwOy5vSCNsga1eTvImCgECJfDhU9PYFWWota7+q30
 BDfwyfDvThjnkjeREHHB0n/djG3Wm/5iAe8Xo5xfAm4okY6QJVKZPMjB/6Ud5kEleTxwXEE6
X-Proofpoint-GUID: 8eHVyTv_JTyG5KsECUKTsPuJpMi5r8ob
X-Authority-Analysis: v=2.4 cv=a9kw9VSF c=1 sm=1 tr=0 ts=682cc082 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=WTgTeb579mi9al7FRlIA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=877 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117521

Add corresponding PROVIDES in order to let libglvnd declare that it
provides corresponding libraries.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index 4094aa4fc613..1c0d3253d8ec 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -28,3 +28,10 @@ PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
 PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
 
 BBCLASSEXTEND = "native nativesdk"
+
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'glx', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles1', 'virtual/libgles1', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+"
-- 
2.39.5


