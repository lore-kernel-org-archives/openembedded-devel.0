Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E750BD3C929
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 16:14:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.852.1765383272460445149
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 08:14:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=J9WxZBzU;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=dYQGMwAF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BAAUH4u1604806
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ruif3gdNHliypUeTXroam3nFmTuJ018YI7J
	7BXALgq0=; b=J9WxZBzUbJBcIHQGgfRZ0m1UCAnLufNOJZOHJAR+tPNqSpwId4k
	eDyV7d4P0DplJcm+5BBnCB5xvAwuSPwKaYuJBx92tBBmx+Z2khSbOVZ763mAw43I
	4lEcFtTFqukNguwV8SH7CIQfdeM0Wprs8OpfRmemt2WyAJeYBxA3q9SCRwN4v4TV
	CEj6/OE9DXpUUgVUVlKHA0Z4PLAevi8aXcn55xKxHfu7BxhlJLoVEeEafWw76/yV
	jJ6nqy1xZNRce1EOU9YxlcdM7nic00Dk8jjuNhX3JUyWXkGdEgSzxIM8idEqmjRM
	K44D2G8sd7ZnBlGfNrq9j35CjEb0pAyJyhw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay75q92cw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:14:31 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8823acf4db3so159494796d6.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 08:14:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765383271; x=1765988071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ruif3gdNHliypUeTXroam3nFmTuJ018YI7J7BXALgq0=;
        b=dYQGMwAFncG4Zuq7e8MykK3BUjkR8tJYchqL/P+0Ci7/T2n6NyGJ00LAZd97eOCJC1
         CRjUOz5kEMebEbt6j8f4y4X+G/Lj6WqVczNDZWBvsmqQT3nj684Bvgw9bELuBDfl40T0
         oQNyTdKIxEeQSvQU0BJ4T7/9/9kviXFRxUXne/nNFce+pcXPqzai7JtjrF45lCqcMQ+e
         lAhILEc/O1zt34jkvmO1ydic2H7+8avYdQbDZ6o2wu9Mzn637B9AbSNP1AinE40zKd+V
         5PfW7X2t9zt+zVkyI4zBF4CGrbhpP+p3L75XlcQnLO1pmaxP0U7mD+n/E+3DSwgriV/7
         IGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765383271; x=1765988071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ruif3gdNHliypUeTXroam3nFmTuJ018YI7J7BXALgq0=;
        b=WcntkCcbj/qhMddqOOS0Ffdc8iBE4KVEM/xWU6m4XBHuvRTB9zpTNN6+4oUue9E7dF
         dmL3eeATGe/BiDc/0nyZe027OwfCs6MNrUCg5+IdPxGnkxqcfA6wEzD26VN3VR2AwJg7
         XX49szo1E2mXLXzy0KZTBczT1cZ4az2SUj6oBl5gPaauluSG56oG5CrrYcU+eagAS7v2
         s6PZ8iFxnH8tuTF3uiSKK/L22oe4RhMNcDVbavyHe8JhLjMaXR7sWlRZXtcBaprqvhNk
         u9SpeHStaIABU6m5JfjPEXpOVdALq3ub4+kUyKd4vmfcuBcwTWY4lgTy+jgdAIw6+yS1
         cYDw==
X-Gm-Message-State: AOJu0YxY9oFD5vv/0TWmjn/cFIWvQL0K2uCJIv+YB3QJoWuQf4ZcCbX1
	oQNteOxpDdbVyX1nUKdF8QAdmxo4skC0UZ5yWUP5HpQkgleVPp0toecw/b6DuVEOhzqyo0UERJU
	EPXM4Ms6EC6z2i4AAGWSuvQLOachPj4jhwne7BMRhZEKMYK+oa90sNMn2EtYDEQHY3pk0tERrgB
	KoLYXX0vKQgmqaBvgx
X-Gm-Gg: ASbGncsmz3/j3Z0akOE7BzDLcpon1BKqEl4jRF95PphwiuYkPfhAhI8Z5EG1H9TMSB7
	ufofhayYBwrYtG9GRpB7cRT/BAgr9qdR6/C//urVTBbftQKntExMLEluizOUt9cYypWqQ2Rvcec
	jY7+PEk3HiDIKM4IwOMQLwNqpNzuZ7YG8XQiukJu/Y8y96ge+3Ir2jFZoIcZMIcOfObII/wk/Nt
	4sIWRrcZLXB0Kso/TR8sdfg3x6PVt5z0CthA0VI3JZDnzh9j/6z/wKGslWsAOR9Sxe/OuZfPpRo
	u8gyhd3nDGGIB7m6OY4j6gFG5DX3IrPVLUgCcpBj/2zoWAyzOO1NMttdo/w0WtY01rFuuUzhaga
	jfga+jRUvTuBn8LNgA007XQi7bgyNf1IEZS3WVLbTdPhiCg2sne2zI8TvbLt2Vjl+y/h+rnAAln
	YuKv+ql4YZhiQnBQiqsijEPVY=
X-Received: by 2002:a05:622a:5c6:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f1b1a1ac4cmr33412461cf.28.1765383270517;
        Wed, 10 Dec 2025 08:14:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEuHW0mKuPouUaoANOWofjz9PdPOpVAlpGA8bjNFn/MqyIQdOtuKF7gEf6SAjDhHOHqkbVRw==
X-Received: by 2002:a05:622a:5c6:b0:4ee:7ee:df72 with SMTP id d75a77b69052e-4f1b1a1ac4cmr33411091cf.28.1765383269010;
        Wed, 10 Dec 2025 08:14:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c2eb84sm6429608e87.100.2025.12.10.08.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 08:14:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Pulkit Singh Tak <ptak@qti.qualcomm.com>
Subject: [meta-oe][PATCH] opencv: fill in missing FastCV gaps
Date: Wed, 10 Dec 2025 18:14:26 +0200
Message-ID: <20251210161426.3443562-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jmoyCZu6dXqvyWiroRqvzrFLhNI1FmC8
X-Proofpoint-ORIG-GUID: jmoyCZu6dXqvyWiroRqvzrFLhNI1FmC8
X-Authority-Analysis: v=2.4 cv=NtrcssdJ c=1 sm=1 tr=0 ts=69399c68 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Selk-fcwuKjAfKUjrewA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDEzMSBTYWx0ZWRfX3TWTf7qgGxKJ
 xqwz4fDiUSMP69QDQ1UX38AuQwwSMQ5LQaarD/NJ37gfE2G6ck2Ix0f0jkf+Lt0Nyjcc4qgKHVx
 0Q81OlKqpp5tK03S9R4uupWeFbebt7yQXU2j399YJBzItum8LNCXac+fVlmJlcDV+4iK7ITnZ1O
 y8PKT4CrhTzV4Qw8nIENKrz3qg5yShTyMLdErhXvsGRgk7Qd/IhRKJipudd8vgmDbZ0c7Ikjb8K
 FLLYkgQw8k0axIj4aISvokkKaJ03jvZnCn+n1x8vDGBi6eMb+ocmo3P+vIPRyAv+NbTIPcxm3dc
 c9meGXEFP94RIA654pO6SPMayafbgF85u4Uvx296v3bnk5cWPYFJxVzzUpi9XFF8M2JQNDXNKCW
 LnJzIlLPUcQzuBBuAT5d4bG1AJOEXw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100131
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 16:14:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122558

When OpenCV is being built with the "fastcv" packageconfig, several
OpenCV libs are linked against the libfastcv.a. At runtime this lib will
dlopen(libfastcvopt.so.1), providing a fallback to slow algorithms, etc.
However as it is dlopen() rather than dynamic linking, there is no
runtime dependency.

In Yocto, if we enable a feature, we expect that all runtime
dependencies are pulled in. Utilize the qcom-fastcv-binaries recipe
provided by the meta-qcom layer and pull in libfastcvopt1 package as
required.

Cc: Pulkit Singh Tak <ptak@qti.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-support/opencv/opencv_4.12.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
index aa11d3da43fd..c0b657f1039a 100644
--- a/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
+++ b/meta-oe/recipes-support/opencv/opencv_4.12.0.bb
@@ -122,7 +122,7 @@ PACKAGECONFIG[tests] = "-DBUILD_TESTS=ON -DINSTALL_TESTS=ON,-DBUILD_TESTS=OFF,,"
 PACKAGECONFIG[text] = "-DBUILD_opencv_text=ON,-DBUILD_opencv_text=OFF,tesseract,"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff,"
 PACKAGECONFIG[v4l] = "-DWITH_V4L=ON,-DWITH_V4L=OFF,v4l-utils,"
-PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,,"
+PACKAGECONFIG[fastcv] = "-DWITH_FASTCV=ON ,-DWITH_FASTCV=OFF,qcom-fastcv-binaries,"
 
 inherit pkgconfig cmake setuptools3-base python3native
 
@@ -165,6 +165,11 @@ python populate_packages:prepend () {
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS:' + metapkg, ' '.join(metapkg_rdepends))
+
+    fastcv_pkgs = ["libopencv-core", "libopencv-fastcv", "libopencv-imgproc"]
+    if bb.utils.contains('PACKAGECONFIG', 'fastcv', True, False, d):
+        for pkg in fastcv_pkgs:
+            d.appendVar('RDEPENDS:' + pkg, " libfastcvopt1")
 }
 
 PACKAGES_DYNAMIC += "^libopencv-.*"
-- 
2.47.3


