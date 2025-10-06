Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C32CAC5B8
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 11:08:18 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.31347.1759748892811560219
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Oct 2025 04:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=eNdJBdCD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59607BVo013320
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Oct 2025 11:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=38pS3a7Ig7a4IcKV2OSVAjiGDObjSDoJI34
	eJLBsFYs=; b=eNdJBdCDsnK1iNMlxD0bUxqZMZSajECUT5zsWW15R1LWyefBxCF
	n9ap4ImomfBO6wcggVOpmb/dbPxqE2CkCMdLo71bhfARYQYoWQse6qnOCwWbi7JZ
	k8NedBLIhmPreOMCsKImQ3oT1kmxKrzu5nOscvcLRi26WYht7uyvTbzTkdE7zNw4
	FxiiZScLzR+3XoCCiTp2Ditoa5SnWEQgo+vQg1EGcP7mHHfhp9PPdTdrokIyZsl9
	O4MlgnnO7J7vZ/vED2VexZMuJicejLza/b29XSZm1LtoKif1AbDkHsk3HK6+M5qX
	YmC/QjViZ+/n0l+XGwapsN3tbnT4ZMaulEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtwgkr24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 11:08:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e576157d54so74803341cf.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 04:08:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759748890; x=1760353690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=38pS3a7Ig7a4IcKV2OSVAjiGDObjSDoJI34eJLBsFYs=;
        b=m3Sr6RV7iOk14uNbycU5GtXH7vBePBIT6mKgThsPLIoqxG1F8jG2uBqm/t002vGqnL
         MnhOofWYokPibU+KZk3xwdzxKiyG1vKpjhu6GiMl+Sr9gnR8KUdR8p6HiwK581dozJtk
         asjVRYEFCwzMaNEVDdb4cGLr0b4cpChj0U9k3kGItoQBHUgIFH8M+mLhadfU3iIlq4PF
         hTr+EWIrlK7kJ/ySq4eG5jeAW+mbk+lyDPEeb9KDxCYYh0qH1TEC67sI8FhMK9EAkTJR
         4SO6XE/tUcsOk/iHTUao7JqmKwJ8skSSx4cIiSOqyHHFOukEk0D14Wm12yNPZYLBzXR7
         5eyA==
X-Gm-Message-State: AOJu0Yx7/yxyqYojPtb7mZzbe0TPJJDssVRenprBIWlqeWvu/XRg3Zh0
	6f3nBMO9YkGLbHx7TEL8fTKYSRAOzT1J6wXH6hcYqH6TSo0YT5cRuIGoSTs/DeIRisJ8ovjrRT0
	nNOuTQx/uzsxWowVGnreaeaawaGSCVw84qwCr5/aTtu34jE9ktm60zEsNK8QY0QXMnX56Y2h4Xb
	HsGaxeX47Xn7AFQ8EX
X-Gm-Gg: ASbGnctwQ16XsrC3WyHDNU6EPKM1n6uud1/ZsdMwGizFLV23Dle+oVnOeOLyrIRKgy+
	UpOrbAipGy3egL1E+mVYdz9oGcyAWzLu/7ql7rtvDeLn/9ghgwmOoxCPJfT3SQSZWlJVCIX4fsg
	yAvg6YOzhSliMZ+Uqj4W92puJypulxjQwCCsM7nid9bUG4hsypYReVdTq/jpcu96Nld3I8AvuAk
	wPzbunz0tmtrMufg4XcawasNZW7h8X863X1hWfXwYOvxpfWTh19MfDLdRRqEtHJ6VXapMY/OVpG
	0QOAkCKCV6/i5hqZAy0NPfXMHHv4Of+p3i/KkE8lGttT1HLnUWkM5HESKC6Ru+/7xFaJIkHofnX
	OCZ77jV6R19Jry+eGGZ1LNvIrEENyVsqdCvW1MzUpJGII3NbqdtV6I/1UaA==
X-Received: by 2002:ac8:5796:0:b0:4b2:d865:3e5b with SMTP id d75a77b69052e-4e576af45d4mr141514291cf.68.1759748890153;
        Mon, 06 Oct 2025 04:08:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1YOFhms2LGj1K6LARvPFGETQ4bVN9uxAYDQn/FBhDtXJXYFHH5GFP2TjVLCyxoqjtDUftsQ==
X-Received: by 2002:ac8:5796:0:b0:4b2:d865:3e5b with SMTP id d75a77b69052e-4e576af45d4mr141513861cf.68.1759748889611;
        Mon, 06 Oct 2025 04:08:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0118d22bsm4936083e87.85.2025.10.06.04.08.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 04:08:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] opencl-benchmark: package NVIDIA OpenCL benchmark
Date: Mon,  6 Oct 2025 14:08:07 +0300
Message-ID: <20251006110808.2880301-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxOSBTYWx0ZWRfX1DMEvwnZZS3D
 YeDNLP+VRcp9mk0br3fhRLAkxTRwTzZonvT2wIJeem9BOiWPeVwkQ2ZOp7MXap5zYsnMKvhZ9nc
 Ju0v365rt1V95cvEBMDGS1JzeLi7si57JCwKgkBvegf+pRm92NIi4IQF8G//NhIht3KqFsjvD8k
 HQZS7WHpSIfImFhtn79HtzMKO4ELqmVz/wx4eZww6uhXjeDsgljeEtxHZjWyPJ4jEp3jrq3KJ6C
 bq9DWp3cmhEZjT5E8xDCJDk23yeFKV1x2cGPSRTxiY726qKl3m1m5Ia/ftqVk2lqSA7EtYjWQHU
 /me+UU2Zf1M5m+SfHLUSYtPs11j0FmpSEQ9TUoZyYBK1uEVc4Ls5jlRgLQ/qele8aZtRsn2drpP
 CvWK2Vy+HMaXFMnxkZKWNi1QUAckkA==
X-Authority-Analysis: v=2.4 cv=B6O0EetM c=1 sm=1 tr=0 ts=68e3a31b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=Twxob6C6j_Ruj8NmyfsA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 7nl7iYhj8G17Lfvut4INsm5UFjinH-_5
X-Proofpoint-ORIG-GUID: 7nl7iYhj8G17Lfvut4INsm5UFjinH-_5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_04,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 11:08:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120277

Add recipe to build a small OpenCL benchmark program to measure peak
GPU/CPU performance.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../opencl-benchmark/opencl-benchmark_1.9.bb  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-oe/recipes-core/opencl-benchmark/opencl-benchmark_1.9.bb

diff --git a/meta-oe/recipes-core/opencl-benchmark/opencl-benchmark_1.9.bb b/meta-oe/recipes-core/opencl-benchmark/opencl-benchmark_1.9.bb
new file mode 100644
index 000000000000..e0a9f332415c
--- /dev/null
+++ b/meta-oe/recipes-core/opencl-benchmark/opencl-benchmark_1.9.bb
@@ -0,0 +1,27 @@
+SUMMARY = "a small OpenCL benchmark program to measure peak GPU/CPU performance"
+DESCRIPTION = "A small program, allowing to benchmark OpenCL performans using GPU or CPU drivers."
+HOMEPAGE = "https://github.com/ProjectPhysX/OpenCL-Benchmark"
+
+SRC_URI = "git://github.com/ProjectPhysX/OpenCL-Benchmark;protocol=https;branch=master;tag=v${PV}"
+SRCREV = "3b669592e21e1deaa025b83953d85e41545dd949"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.md;md5=f7884ffa0d4385c62b5d649de8c4c8da"
+
+inherit features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
+
+DEPENDS = "opencl-clhpp virtual/libopencl1"
+
+# There is no Makefile, duplicate what make.sh is doing, while also enabling OE
+# build flags and building and linking against normal CL headers / lib
+do_compile() {
+    ${CXX} ${CPPFLAGS} ${CXXFLAGS} ${LDFLAGS} -std=c++17 -pthread \
+        ${S}/src/*.cpp -o ${B}/OpenCL-Benchmark -lOpenCL
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/OpenCL-Benchmark ${D}${bindir}
+}
-- 
2.47.3


