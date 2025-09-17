Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30760CAC5A9
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 14:02:23 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.web10.23824.1758117733741132378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Sep 2025 07:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=c2L3G6TU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XY28026824
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 14:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YVBrSwCIRMH
	Uh0rkCtS40T0hgA5bXqV6gToTpQKxQ2E=; b=c2L3G6TUqYbCVTK8k9PTd9L/uHR
	VktKn0XgHRQsu8uN6tEqJkK8sYv/boPvh3WnK/WJBr/8z55D17VabfJXP0Ox5gO+
	OqTA70X+Pq8OB3gowdb83x+eEpqkerrsmb1MkiDeZKgMwhnmI2l+UMNxlsCYTyu1
	LCND4h+7xWv4Q+yzLpJd3osxFIpjFnxDE0HIeorxcqOAJV30dp/210BRCFfxdumq
	gOnmPWfmyUsBHxVs6K86h9Yby0uJVrkVABs1SJKsEVjE/GB99EYhHyixmH+ZTN4y
	AK4MYKe+zScyh1dXV1rEy5lK++QW0GVPqAPopNQtfuE+MJhCfwBibV1ktdA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt2ks2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 14:02:12 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-4190d8f16c3so79475335ab.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 07:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758117730; x=1758722530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVBrSwCIRMHUh0rkCtS40T0hgA5bXqV6gToTpQKxQ2E=;
        b=A0F/XO2jsc6WabFzeu8QanRZCIykHE3DlPeOBGexynN0YBavtsYxe/Aq5SxrJUPJFk
         ewp53YsI2joQZEx/N59NP8L91M9+12eyD6E+OPlHJWKUdBZVT+Yvf2HYUCwQetWj/pmo
         IE+2Ng57iy4VeBxP21JgDJtE/QeCwajGzQK2lFhSDxShWRHU2UXEI4YJ9iElkF0qdwmW
         fMvlEIrwGN9b2Ot6Mtb5wOy4t+AJ7x2/Hq9LpG4gquiLK/YNx5ORF2xX3zKYgfLpJoEt
         qFTnpfOT/IkStSVxT/Hraj1x/KfZPcKjUpA459FbyIcfwWH43AgnNQQ1xQt9m3ptMvVe
         CEdA==
X-Gm-Message-State: AOJu0YwZA1F3RqJEgmcYTMXuNHIVQE9sgrYYrOP54liz0I/x7JBxkHTR
	PhsfZ57DczfZ+lQ1Vsokr+gVQvFMQdN3yFFLtVRfJuEf+gU7OkOZvGbZ1qrnlL7lIieWHh+JfUg
	z11SjAJPRjd5V1U1zNKPZP93yY3oLKLJRId8X7ek1xQqvFy7BWZoef6voRuFaHNZwdaIeXBlsf2
	tKPwjIAoCYEglrd5gw
X-Gm-Gg: ASbGncsD5qpO1kqmmW0aPHONVyKFpDs1+Bj3ugrhGcC4RAblXAtPD83XsnzBtLdyMeh
	6FPjTNaPz6RlWmfJs1olVoeX7NEMwW0f4P4DlHrGP6RxslRLokXc4kn3kZOhpL2eJzwm0a8LTl3
	OaC8UHr7IrG1GzK75SkLF4CHoEsTzVcn3iHG6zJgCdFX+fwneIVb+RZ6JxT+hfVISStezARt0AA
	nFiqTAaG3HfuL/JcJ9KABJQJlKHIWX8/DxjZPM3fLetJwsJlMiWLWfzx/sOJ9xbMzcCvssgP6YZ
	hnERBeATlGA1MPlb8F0+/5V556zN9eBJZ6cfmDIecF+9JoqbosigSu6aEtdFBwFRmNgES8tgMAN
	AWKrQkoBa9r6rMQ8WDnwHJv6MPCobYDKSsVLtISZy0UQzP2KM6Srs
X-Received: by 2002:a05:6e02:1549:b0:423:fcd6:548d with SMTP id e9e14a558f8ab-4241a51231emr21839105ab.21.1758117730000;
        Wed, 17 Sep 2025 07:02:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBGYRtSe+oHmKGoctAkGsupg9RuvD0SFjnQom1YPVdHgcTnGbOoX8lTJw3VFIMMIWGkqTIow==
X-Received: by 2002:a05:6e02:1549:b0:423:fcd6:548d with SMTP id e9e14a558f8ab-4241a51231emr21838235ab.21.1758117729177;
        Wed, 17 Sep 2025 07:02:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5730a572b8csm3152302e87.133.2025.09.17.07.02.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:02:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] opencl-icd-loader: make use of the 'opencl' DISTRO_FEATURE
Date: Wed, 17 Sep 2025 17:02:03 +0300
Message-ID: <20250917140203.895760-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250917140203.895760-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250917140203.895760-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bHBVo0EGPR-gC4sKfpUDdOGnluLznjK-
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cabf64 cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qgMKZAfDhnPwrW0A1AUA:9
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9JPjgHqsjp0L
 TpaMCO7Wc4gc4PuEyQICwZa38dH12+VWRo11K/HHxK2Y25RSLVJbwUfbBya1+0V8u2Mf/t3bsWX
 132Ce+EWZ1IEYV9S3YXYxugp690fVccPNVfouptdm5KCMFHbcrUppFJ4eGC3/HKDyq6Bscf+rGV
 3delB2BtcQEGUqeLXjGN4WRy/PbS6EtqaolVWUDx/KkeSQn3xOZcWMFw0e+U6lKA3SPBYmaL1DL
 fwkBSykpbdRypQs4VuEGMLcxzE9X3VeMQp00RZGA5RO3y7ijRr7/ydjCQc7VFXTbknQZx+U14yj
 z9eQUmYC59LsCfwIHSt2AToVtbDvFpm1+FAh4b3H53b04vh3UIenDZVeY8I3HsO7pWqXwjQjtwx
 yBTV5r+Y
X-Proofpoint-ORIG-GUID: bHBVo0EGPR-gC4sKfpUDdOGnluLznjK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 14:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119484

Currently packages like Mesa list 'opengl' and 'vulkan' as required
DISTRO_FEATURES, disabling GPU support for non-graphics-enabled cases.
However in the modern world it's a perfectly fine usecase to have a
headless box with GPU being used by OpenCL only. The OE-Core has added
the 'opencl' DISTRO_FEATURE, making it possible to specify whether
OpenCL is enabled or not and also making it possible to enable GPU
packages if only OpenCL is required.

Follow the example of GLVND and vulkan-loader and disable OpenCL ICD
loader if corresponding feature is not enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

---

Note, this depends on https://lore.kernel.org/openembedded-core/20250915232557.536762-1-dmitry.baryshkov@oss.qualcomm.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
index 16c070e4b538..8c8f1ae7dbe0 100644
--- a/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-icd-loader_2024.05.08.bb
@@ -4,7 +4,9 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 SECTION = "base"
 
-inherit pkgconfig cmake
+inherit pkgconfig cmake features_check
+
+REQUIRED_DISTRO_FEATURES = "opencl"
 
 DEPENDS += "opencl-headers"
 
-- 
2.47.3


