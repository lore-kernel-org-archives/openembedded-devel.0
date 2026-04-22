Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70646F9B614
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 10:45:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79741.1776854528180906132
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:42:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DUiWMvbz;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=OQIml9hE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAVrdK976183
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DIJRfrzpOYzS4wcUBGlvaAGCuoR3Shka0u7
	rPjWrVoU=; b=DUiWMvbzRi1/dYWWfw6zGLwpZYg4Pvwd5Ee2m2BROOVH+tRHGTc
	BmE02mc5S9vNY7zvjS1EZBvaib2H90S++bZzo9eBYkf2KshYXVlybLkBTCgD7gXu
	JBMnXofLJ4oMogrzJDRAlf4eZiulL5ITnrCUfsdjvuuGqu6xMj1DF044MZ2mYZXL
	A3ZT5QFGc+j2tRyr4JTemMKpWi7QjIYOpykm0lcpcwV4er2ywd2GlDFxSGTO/8tp
	BCo0CgW599cYWoetUv5pVg8mikQnXwSzoh68FS31KOlRXanKTL7PIGV/nqZ01L6N
	FTWPazmvd7KUcs1aHVQJSnNHEAa/DG1OrBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpeneb2qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:42:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50da31af14cso143217571cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776854526; x=1777459326; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DIJRfrzpOYzS4wcUBGlvaAGCuoR3Shka0u7rPjWrVoU=;
        b=OQIml9hEaI/dQv5d/Fxs3myoqz/xeJQomwkOVbnd1ynhTJJyf4bC5nue/aGAGewF75
         Cc4X5VZu0jcSBNMQlJU9afL+cUUxEPYr3tm85Z+t4TRtY28UrlOA9xB7RIe6QQQM58qA
         Xs+BDDBSJ2EKLQF9UXx1Ho1FrOsmm4BQqbuCQ5l8LgzK+vUagFTF0Mq9VuVDaxp/yNVa
         txYG9LspjbdekQReMhaeO0uNuEuaVpXy++8UTqIlYMM3eWvSXi3bEhvlZah9Y0eUXtCL
         AoOJLbVydwCfodVeoGXZN7BLyO92DAFS0jtkb/7g569jEmItHvrBqm/HVqPHEUDNdJIg
         NeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854526; x=1777459326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DIJRfrzpOYzS4wcUBGlvaAGCuoR3Shka0u7rPjWrVoU=;
        b=HNuT/De2FG77ifiIWfePm1t1WZtBspajUxTFvgSvPRoLmUieW9luR4X0fKwvN9mZWc
         7Zahx0mlCfFUAcZTZ7X6lIF9boyzFCXkaIp16R7mF7JB6YTjUY0xK4NBgOifGuUEmt9B
         tW83N0iIcS6FtO1MoHQ4ihJ79pRx3XhK+FEG2Qjn8YibF8ihnltZRQX3Kn/d5KCFmQxH
         fN+vo0TR9W5tL9W8wnK9p4/I9PcqnQiqcL+B0bBxfagxuH9Havlyp3S7CAH6z9LDFu1B
         QMx8DbEov8IFMsMRUUxrlwix1ujEfhJnG2OnvnrPDi+/IdIPc3G1HXdYJ98y0LttHXJ/
         vPhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Ex34xOHNfZeQrS2uHVR2ctbgYEf6wP/V9XIc0VrFdnnNosajJxAX3at4tOW67Bq7afG6L6sPdN4OLMD3/mbDBau0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwpID+tbgMviqLpqRp/7g5y6Oibwu6GTK0X/jYMbUdYi6CAwKPG
	m8C2NQJCYIDuYJZD6IUcvnh3rkhrhd62g2s8xcyoqifB8p/ljjnscoSlcVQmYl8B35Nmvbs31Rr
	r3eyU261OnF9LazxmO6T0+LOdf6tqpyySV5lRh/ZzW1Fxq1Fo2a0y6QYxQlftKln2g+wjHCkUhk
	c28vbkx4sC
X-Gm-Gg: AeBDieuPb8V72StecUqeUHfJsGgV7yAkwna/+P4RoZMQYb8gJQzO+V/MSXBnjSz6cNt
	TMyE1BORczHDoG8OIDWBZfy8NaM7GS07EwPHagDn1MpaUcQWHo/ddGBQAG8WQ0CFuyO6HbvXpSS
	c49hURxqLMFL7s4laiPoG9gqlSHXzaYnbeDkXkwOBw0mbL67MyRx+4BRZaQ5SqSKbern5lntcxk
	n+lZQaGA0v2RmQ7i+0SG8SSTWztEQGJOgeH3kh9U+6L6Alnw2UFLcWx+9fskMC82Q/UOMqDX/oy
	Sscujkbc4PZboJb14qC2BxaLmuu0gEC8lwBp6c822lCryq1TwcFPYwJYyypgKl23GmISOCcI/3z
	LLExj7+88JvjBag5nYRsFpYWzinIUmkmIy5/RS7GZ7nlVeVbEQJnowOVyLWoX
X-Received: by 2002:a05:622a:4acb:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50e36820d28mr325364361cf.8.1776854526555;
        Wed, 22 Apr 2026 03:42:06 -0700 (PDT)
X-Received: by 2002:a05:622a:4acb:b0:50b:2eee:4b38 with SMTP id d75a77b69052e-50e36820d28mr325363931cf.8.1776854526081;
        Wed, 22 Apr 2026 03:42:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c39:7106:a16f:fd13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm43529912f8f.33.2026.04.22.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:42:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH v3] python3-pyfuse3: new recipe
Date: Wed, 22 Apr 2026 12:42:00 +0200
Message-ID: <20260422104200.23615-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwMiBTYWx0ZWRfX+XU3DsHLtgTt
 w0g21BpRxTNgKyhdOuYibMgqO5M29LNa9QsrTxuyuXSNQXdmg6Pf3x5jXVixSjHFdA7tD9XFFfU
 /v4P8spUkgIsIDctlLsRMolmmvXIFx3PRY1PkdLyVSHZ9ns9In5x8Tp6WX7SnQ6aJrUcbOSl8oW
 ahmXq7/fDMFuLYBv6hbFtV8B0dP5TTfaeT3DgnTGp1nXVuFgEVrKqQ2Gn+jYflPsx5C4okQ2UOK
 yy+foT9iodfyY8RDfZ8cD9RzTWr1uHI2kw66Gzi2Fp7+RdjdfVz3daB06OKjmAbYdrJinLPUevi
 pPnLzpdb7k9d3ET4ZZ1guo1QywZvIxSx0X2xquaN+AC4KhH75oSvSaoS3QVQyG65hHVntXh5Y1b
 f875f/ujVHp7FQppNa+3W0HozcJyrQcXkaevyK7vJvQWQS94hzI7WyNws/Lhepz8AW7aGwpXsw5
 rqngn3rCO41BLYKpxdw==
X-Proofpoint-GUID: Ret-KMR79PxhnXGlvyUtXFzy_XGk7kW-
X-Proofpoint-ORIG-GUID: Ret-KMR79PxhnXGlvyUtXFzy_XGk7kW-
X-Authority-Analysis: v=2.4 cv=RoT16imK c=1 sm=1 tr=0 ts=69e8a5ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=qZtxwWahQDo9n0FDmtUA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220102
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:45:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126547

Add a recipe for pyfuse3 - a python package providing high-level bindings
to libfuse3.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Sorry for the noise but I noticed I mixed up RDEPENDS and some were
still missing.

Changes in v3:
- add missing RDEPENDS

Changes in v2:
- move the recipe to meta-python due to dependencies on other python
  packages

 .../python/python3-pyfuse3_3.4.2.bb           | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb b/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb
new file mode 100644
index 0000000000..4b20c186a1
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Python bindings for libfuse3."
+
+LICENSE = "LGPL-2.1-or-later"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=622e3d340933e3857b7561f37a2f412b"
+
+inherit pypi python_setuptools_build_meta python_pep517 cython pkgconfig
+
+SRC_URI[sha256sum] = "0a59031969c4ba51a5ec1b67f3c5c24f641a6a3f8119a86edad56debcb9084d9"
+
+DEPENDS = " \
+    fuse3 \
+    python3-setuptools-native \
+    python3-setuptools-scm-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-ctypes \
+    python3-logging \
+    python3-pickle \
+    python3-threading \
+    python3-trio \
+"
-- 
2.47.3


