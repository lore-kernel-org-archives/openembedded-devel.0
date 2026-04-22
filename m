Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FBF9F9B5EA
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 08:56:11 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75591.1776845895235983271
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 01:18:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GhvjNmHn;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=PdAEUkPN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: bartosz.golaszewski@oss.qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5CIii3730720
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 08:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=NB5i1LuanslQpwpDiQ0Ffx+3b76yl0x7tAY
	nEPUelLU=; b=GhvjNmHnxNthYMAEh4IdOtDbhV01ek2H3Nhq5U+5hfNaN0FkAKX
	tEvo7iIV52Iapb2ooNA4Za48BD2SYBMdHOG6FhE0m8ZlYrfWphkgKLXZbGDDFAQ4
	zcZjJSUyCI71QD+3NTLiiKGNbalrJ7iQT8ah/imWmk1ZCXPsVySR1PSvAtOFuCpx
	esFBNKnquqOM2T9AZK+9JAxdW9NmHPMWJM4djFi396RGiI4M6xMP5tuP8ZuMa/xQ
	xAOD6lujXrcs3JQsX0A33Ri+E7kuKjsU4WRQSVHj7IhPSwq4G+9KMTISWIsqrL4Z
	1KVbmQUEt+reRy+dmB0o4Um//Le28LUb6OA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenftdhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 08:18:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b4b81c632so119463701cf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776845893; x=1777450693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NB5i1LuanslQpwpDiQ0Ffx+3b76yl0x7tAYnEPUelLU=;
        b=PdAEUkPNDJCODrqdy/DWy10rnMSJeXOcVWI5JwLGSfRzVN0f7OzMkzn9kkClKQDgUU
         ZiMkPUudJXqSu8M6W8mO2HgeyRbdGMhOjh4z+U/0qkV+qcqyvSBOZGglLCQuvIATSVH8
         yC4fZWQYoydL0wwdI3x9JIJaZjoYwlia4tjt3Z5zrQ4roQNZWdl8Cx0J2Ho9mr0m5Hkf
         TzQYcCfUKrpqqTQH+LArSu/577UHjXqbWxq2dukVHvj48uvNM7QioRct4lZgTDzq9HF8
         GffP1Jg09Iv30q1Igh6GS7HqdWo8C1iZ5uuttX9TGeOEWzesnvUIfEI7cyfyRY6uLtII
         tieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776845893; x=1777450693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NB5i1LuanslQpwpDiQ0Ffx+3b76yl0x7tAYnEPUelLU=;
        b=NIoCsl1093w7Im6h/Y57WDGr9TOAqxm5bSRED1N/p+oEgItUfsZjd8+VZhOTFa/HjE
         4e7/FT+f10Mcgrnl+Gx1qa00y4XNZd4HaTKDaHdA0s8ob0geTsV4zJbwNVaLF8ztDrsS
         3D9WzFAjjMgoETq2Slebx7aqPB0iqRZq+9dt8A5tTPtt6WlQT81iX/Hp4/vqgnpzu4aN
         ZSQWmNYz0fVlCkjZWHQJNtmKm0vrNNr6syJ33fSSYL6zowPpJl2DCeSZ39rJCmhwzJao
         mTpbv/E46USSAxz3YVbJQrm//wWDfn78Cr9bMTt+DL1l13qCyj0ApVjTkuD2q3G4FMm/
         MrXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FaHZgSjeDR/gpaNAgVPuhAYydgeRPb4+BsLoLYfy5cu645Elcgz63pT1lf9z+tblbFRjeZsjJ1fBOEdcc24Pfyx8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxS67oXT3ks9v2dxgvjMdcNIWXtz8zpyjfKzbh4dlSWvB5kSmoj
	+yeBquu7rNm3WxGoEK/iYQV5F21m7WFXSjGjdlDyuYQX4QjYm29zy/YwcOwP6dO+LKYeh5Icwz/
	DcK53fMKLPWRRAzF0GIFPFbgiwKf53KcvOiF4249E9uolHSOOkm2YBFpIByQeLjcKbFHrVTTE08
	2Cc+gkNxSc
X-Gm-Gg: AeBDievpYmX6ku0Bw7eb0mrlPl5TEP35AqpiscX+y8JQU5IGAQ0X/1AnIpk0Lo0aFgu
	wrSiRy4RKKijSyztLYmloiGq4uMbtdCMv4a5WM/iHqIbJPnesE+X6I+a7BIEnVVeBMZLXjjf6YH
	si6x+NcHiUq1G3H9O8BFdoMKs8XrydZJrDR/AWp9XYkwHWrZW8CEc29fDr1fp8w74lq1toDO0Ye
	zEy6+yDhLMbOWv88GZZN83A8ZTsYd/ikcK+Kvg+1c0dIN8aHQNBfR1QSJnAxDmIgbU9PCSYeQsd
	azGxlJxSIEeNr4Mdp9lr4QldX30VRznIlh96r0PcZJ2K3nUbifdguflS6hVTTtm+lkECmCO+ujq
	EOYC2FwQilt1oMjajwg8tRH6mFQQtq+PzUHAV59i/oPRzXlab3vRxNbR6It/w
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr82356891cf.22.1776845893424;
        Wed, 22 Apr 2026 01:18:13 -0700 (PDT)
X-Received: by 2002:a05:622a:59c9:b0:50f:b790:96ae with SMTP id d75a77b69052e-50fb790a502mr82356611cf.22.1776845893009;
        Wed, 22 Apr 2026 01:18:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7c39:7106:a16f:fd13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a55b8baaesm169973595e9.10.2026.04.22.01.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 01:18:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Khem Raj <raj.khem@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>,
        openembedded-devel@lists.openembedded.org
Cc: brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [meta-python][PATCH v2] python3-pyfuse3: new recipe
Date: Wed, 22 Apr 2026 10:18:05 +0200
Message-ID: <20260422081805.9147-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Proofpoint-GUID: ze5mZDTV_M3zAVrUcO4Q-6cAq7MY4Ub3
X-Authority-Analysis: v=2.4 cv=YJuvDxGx c=1 sm=1 tr=0 ts=69e88446 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=qZtxwWahQDo9n0FDmtUA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDA3NyBTYWx0ZWRfX1FTHxH+4IY5Z
 F8fMK3/7rROd4vzK93xg7+lsHuFMH7tlcQrll8zMjsCcU/xkAFpiNU86ErDGOiPSikBVEPN9P7z
 SM7E4QQSJ7wAVGWvpc2+mp3dfmoAGjSpIlRoZEgARl11zZxyOdlEO86ndJ1rfMiQibXf2r2xZx2
 oZ3fjqr86uy6asVYEMl/SRiQpuA1iwi3cC3oSQZq0Gw20AvPnQ3OJx01ogBdXEOHl4YAK3eO3gs
 8BbXFvYPqwhOrje0j7PZYwvpsae3Nc/NKY8B2LL52mS1jKcRYRvZ1Lw6lulaKyZyHiCrsNBvLru
 1Z5tDbrIcmpMs2vrnxMKjHDReK1iCmst0HnlkVhkoNkanlBnKhRqBifR3KRA/k3mFezhaVggyI5
 H1bJ1T1M6j6qD+LWSiWvKQoXxHLfjzcf61Le3ZkwgkA0GeMH7Nzv8hvhkaWqihPNV3rsLbcrhM8
 XbJlfJObgaSwzz5Ggog==
X-Proofpoint-ORIG-GUID: ze5mZDTV_M3zAVrUcO4Q-6cAq7MY4Ub3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220077
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 08:56:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126543

Add a recipe for pyfuse3 - a python package providing high-level bindings
to libfuse3.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- move the recipe to meta-python due to dependencies on other python
  packages

 .../python/python3-pyfuse3_3.4.2.bb              | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb b/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb
new file mode 100644
index 0000000000..8ef6780788
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyfuse3_3.4.2.bb
@@ -0,0 +1,16 @@
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
+RDEPENDS:${PN} = "python3-trio"
-- 
2.47.3


