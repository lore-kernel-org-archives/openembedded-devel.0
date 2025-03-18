Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE66C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 19:26:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web10.1048.1742315093214832962
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Mar 2025 09:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=CkPtI74L;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: koen.kooi@oss.qualcomm.com)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9akus013293
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 16:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=DSlMHaBALqEjbfTHnAM5ykJNK8ecDNWOmNE
	LYg7tGi4=; b=CkPtI74LO74YM55qLrU4BMa+nPdt+sqNA7FVp0M+1vwpnSUs1VU
	pKoYYPeIGgJjt/colRhouy4s/4OW0YICidpBssgbZEwS8mUFyny1bGNLf87Dq4/q
	WfISki4vX18dXHXzeuWWZNoF2/lf1h0sKrGpOl5tIXJ0qi2u0qut1fJn+lur/EuZ
	Bu4qH5TT+UUbM1h1mR99RL4nEMpFXqaLRi8KPC8Lq8y8q8thY+EusZpxVI2tHPWV
	MLiVbkIbCiFTtPHskSP9ufrfjTKIVigp4paocIcbB70/BnhB+ZvMEc8faPp6If24
	AxlnjoxW6Vf3KX7yAvhMlHprUBk4YrOp+rg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu0u3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 16:24:52 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eb0ee99252so42621076d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 09:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315091; x=1742919891;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DSlMHaBALqEjbfTHnAM5ykJNK8ecDNWOmNELYg7tGi4=;
        b=DmzkC9gi6369AnUBPMG355D0KsdiZQSidGuNBMPVB70B7aWmHP2AFeFnlGAc8bbZ3W
         3RFCk8CV8LSwad8KVzX/miMso3g4zW1MNZEHbDk+vSTQY78FnHZvgL13+3bO5G//D++/
         w5jAOGwZryTWU2lCc85/iPGWVB1IHm62H1LjZq57VlDuRV8r7Wl53bddVsOmJ/v+Mw7y
         nnIyXyHnviejf01MOyxo+atEmkiiXYhejeH3gDwqh6t/NK54kNBZADyjb/Fq/+GoWOnV
         8i/uyFDAqTUG1o8gysQYgUdbDVqZGBXsmQsJvGnpxibfIoR10PQV1R/tsNjUFbdyKC0r
         XkZg==
X-Gm-Message-State: AOJu0YzJPiQXl5siUD5PNX/fK7wAW1TxiqW7YutKuby1TIpbPMynVBpK
	3X9qB/F8d0Yzs6KJ++qoj8qPSh/U3KOhstWDvAedU1JwoJRmeIv5Jk3XRhE4oWTy01ex8w1D9V4
	nLmoI7v8nTxD0EmtMzi7aZfyTtBLTyEKGEBy7AIBq5SVd9ZjB6EYon1eMdzH4rKfevm6E1ovoHK
	Y1v9SI6cdPRssWHVk=
X-Gm-Gg: ASbGncuZDKwXUUQEJWTKnXMAv9i7dFPW+Wv+kbkABVhhGKiGhIKPphCbnhbS9uEC3EA
	HcEwk4y4TjKsw2Xpd6NK2GSvzMN2cpfwyi45deNG26HEh1wRrGRwL19FZ4Awx+2ohE+mX4XDMth
	IE1nGIfrg6SPScDmQJT9Xk1f8dwiRYd6ksUrkqDElACm3Cm57bQlDrjN4BCPxk8lu6TO3UJ+ySj
	u5ojBabFQdAQ7NLz0ZlONxG3EVA2Z8xiTzmk2mLFii4n0puuel16BwavF3pDKsWhjrWAASgVxWq
	CLMd234ODmuvpveWG3xrh4dDS6JosHkmF6ZKX2U=
X-Received: by 2002:a05:6214:76a:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6eaea9eda58mr212473186d6.12.1742315091293;
        Tue, 18 Mar 2025 09:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYqTNuMuAWSy49yDFBnRvxw/opBqcbXcnmbGplnFCoDAW1WGjqN5y29U3I0BbMNQRFfCPdJw==
X-Received: by 2002:a05:6214:76a:b0:6e8:efd0:2dad with SMTP id 6a1803df08f44-6eaea9eda58mr212472796d6.12.1742315090856;
        Tue, 18 Mar 2025 09:24:50 -0700 (PDT)
Received: from hu-kkooi-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad3914sm7892659a12.64.2025.03.18.09.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 09:24:49 -0700 (PDT)
From: "Koen Kooi" <koen.kooi@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH] libcamera: add support for DNG files
Date: Tue, 18 Mar 2025 17:24:43 +0100
Message-Id: <20250318162443.2274637-1-koen.kooi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67d99e54 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ZUClY4TkZ6IoiiERboEA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: bYvta9rKLtij_Q7gkmUoixyOZlFf9AV-
X-Proofpoint-ORIG-GUID: bYvta9rKLtij_Q7gkmUoixyOZlFf9AV-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=795
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1011 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180120
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Mar 2025 19:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116061

The 'cam' app in libcamera will turn on DNG support if it finds libtiff,
but it has no way to explicitly disable it. Add a 'dng' PACKAGECONFIG to
reliably enable it, disabling it will take more effort when using
gstreamer.

Signed-off-by: Koen Kooi <koen.kooi@oss.qualcomm.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
index 682e56739f..ef424c84e6 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera_0.4.0.bb
@@ -25,6 +25,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native'
 PACKAGES =+ "${PN}-gst ${PN}-pycamera"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[dng] = ",,tiff"
 PACKAGECONFIG[gst] = "-Dgstreamer=enabled,-Dgstreamer=disabled,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[pycamera] = "-Dpycamera=enabled,-Dpycamera=disabled,python3 python3-pybind11"
 
-- 
2.34.1


