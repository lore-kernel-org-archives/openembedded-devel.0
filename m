Return-Path: <viswanath.kraleti@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AE0CD5828
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:00:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2730.1767780032109859120
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:00:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DH0y7EFx;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RCPR/Qvw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6076tN4L2379157
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Jan 2026 10:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tN+cEqlTYik
	V+vfCa7eSdupwpjrCktSE3Q6j8s3C6/U=; b=DH0y7EFxEgvVvrPKEPZc7LqiASR
	Hgzsg212wdybblIhUA+23U/QvfRyCuQtugRTZ2qRW7mBQm1aS3seU0aYiNqx5iCp
	NJgQZoXlXyGoPYBDyiJtM+rfW1T4eOIiR/yH7HNHc771F/QtF2og/FbXvqnXARhC
	SIVuLHtvs0CAG95CmjFL/3GgOZ2UPtYuqXJatJTqMWycsrDDB9SSzFVrE0VfcTAQ
	Ef2NQiU9au3ayIucxdOhfkMQBGbDVB+/RAAsx3KfZWG04/0HkTrhdBElT8CbOZYx
	6WKnxy4UDh1MgnGgIZA9sNkNfFEwNIrsRfHcQHHss2KxN5yYKfy5MeiAJzw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhjn4rkqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:00:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-804c73088daso557099b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 02:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767780031; x=1768384831; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tN+cEqlTYikV+vfCa7eSdupwpjrCktSE3Q6j8s3C6/U=;
        b=RCPR/QvwifisgipXPJOqT6Ow7CYxfFhPHt94otZsG9WVQp+flsWyLLPy4fBv8PzQ5U
         xd2yrCfHwWq0u9R1bWPZAHDur9OIDEbtEY6zMOLuHLQ9HK93LtAOK9DsKtp2rlNsJByE
         Ws/uq01R7eZJNv7ri9Wjzq0WhXyXOG2TLMMfMsTExoGAIv1LIqxi+G1bKPx9e4hfd7Nm
         NS/6fYs0suwX9C+IE8nP2YFp2cDg4g1fOdR9XfxqnKt87QuOjpxa8vkcL2MUFzi33NnD
         DGLm8v2tHF2meHXaG6fqmAoo3m/mXiYSjASCOwLN80IMqJO5crt3B3tfRw7zXnqkfzDh
         eoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767780031; x=1768384831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tN+cEqlTYikV+vfCa7eSdupwpjrCktSE3Q6j8s3C6/U=;
        b=CnOo4PeQa1Hxqu6vueLZLa37DCnyLiFeowywPialmXwgYFRd9nSSG27nCrHFqA81Wi
         fMbtH/bzHDEtbn0+srLzP0RpPQeU1apNgSQkMDqtHvlGubTcv4vRZTUmdIo80ExKV0NY
         elGIwqt3IZ5XzWrqfYP3MENZke+Enc6/MJcId0+HLYFE2bLZlKk4OAXbgHODJ8MRkXRk
         AeGF1m4MGnRBhKnoY4UWYPAPwDcrXwV/5BIusyjasM0PIh1FTZcT6sNJie0FY4hQPQhk
         jc4jGR8UGJ3vALttbnpkxyyEaLZI9g/z32nMvXRdO/vRSRHTXK+icKencqKuELpzpc1i
         kD+w==
X-Gm-Message-State: AOJu0YzxZOZhF3GSpeDpdKGnkxp6xBNd9ww6hOfYgRR97DpiUCbkpqi8
	lc4MVvV4kFsCEMH5M64rr49cAUBpxyyNsb/SeoJk5HmBm1zqBFm/G+9iMDp6+5/G5m8901k55Zg
	GXExg+YJCCgPkZ09ispKwFk30zQd6CXYzFzTdasOxbm/a2b+cSCHfEySmkmtAWBCC1Z9EA6upct
	qE7dyo0eACoMiSMDLF
X-Gm-Gg: AY/fxX5oxnB5XRbmkGlgptLusu/zy8tpI5/E+YEnFFMtH+psEE/4LHOkH+8xyoC0xBl
	BJmLBtxX89s5tyQ8DCiL3/vYc846+f3lPixyqZG1sQWH4XQfNkZjE8l+MxhPo3/MgRiyECRbJC9
	z5oWF+ausJWbBG/eMm9e/j2XSBh2EbWjlhM/y80kjNIJcxsYB0mlWnjT8basVoCF0+6Jb+1gMFf
	fgdWKg7PMDMgC7EbKK8kPXtz4gOOobLuqh4Q2429QEv7h00VTiYUQGfQJ79NuU3UvaiHNAJqdna
	7tr02PN++5F7r7w+k6GrOKjEnZnQkZbGPIkzMOEidg9nsjt+U3mwJ+ts6lke9ZMx23jZr4wMvGu
	2LCFSv3uIWvejlNoH37/bJpYjYICpBu+NSQENhDOW7MHVUPa3
X-Received: by 2002:a05:6a00:a91:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-8194dc38c15mr4860929b3a.22.1767780030696;
        Wed, 07 Jan 2026 02:00:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGcKo0iSF7ebgKH0Q9qknQzLVHAivxQChh6t14DYIWCShPuMhoRaBym7I5u/+UPiOByflQI7w==
X-Received: by 2002:a05:6a00:a91:b0:7e8:3fcb:9b00 with SMTP id d2e1a72fcca58-8194dc38c15mr4860886b3a.22.1767780030093;
        Wed, 07 Jan 2026 02:00:30 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de1a2sm4504161b3a.23.2026.01.07.02.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 02:00:29 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [oe][meta-oe][PATCH v2 2/2] modemmanager: upgrade 1.22.0 -> 1.24.2
Date: Wed,  7 Jan 2026 15:30:22 +0530
Message-Id: <20260107100022.2646251-2-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260107100022.2646251-1-viswanath.kraleti@oss.qualcomm.com>
References: <20260107100022.2646251-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=LJhrgZW9 c=1 sm=1 tr=0 ts=695e2ebf cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=RASuxCJZQsJVp6H_dTYA:9
 a=2VI0MkxyNR6bbpdq8BZq:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4MSBTYWx0ZWRfX6wyJmXuGozez
 FkFyZ75qRkgJSF6Zxwv36mLVkEwAK11yXABmLnur2jKWby9BrGIiwTfhJs4Xx222aW7Xg7dCNC0
 E4IbM3vlAPd95Fzng7wEaNkxj450yTt98qAd1RdZbFSNrvKE8J0y7fcCdkke2dUMDg+OH4atWWZ
 yuS+FlLL4W+FV+ckqRSwIrerdr4WM1tmslQPohgk0Nqy5tFSvR+Ps5dqNxVzW5/XokfCeb3LBEn
 SkgMoAOYHjqQM2L/ggOffSt8bjahW8CF6EpvdtlTj0RwkjI9utBbjgwQQuLttBtmIWdqCW8LNU4
 RRvYLBiePXm7g0uP/0H776j9e1Q0SOCCKtvrRiRezIPWzNp8WJ4PpK1XEUkpy96bAxms2Ao6Hub
 NiKPedsUsLsZO3NOtevG2oW8rJKxSVAErXeV3qZ5Pe3rP5nTpTxdfvPpgvI+Vgdp44G71/CyUEu
 Bch6p6mXif8tq8kRDNw==
X-Proofpoint-GUID: EmLkra8MjV-rIfibUjc6taLTRF8kAuMo
X-Proofpoint-ORIG-GUID: EmLkra8MjV-rIfibUjc6taLTRF8kAuMo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:00:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123197

Changelog:
https://gitlab.freedesktop.org/mobile-broadband/ModemManager/-/blob/mm-1-24/NEWS

Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 .../{modemmanager_1.22.0.bb => modemmanager_1.24.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.22.0.bb => modemmanager_1.24.2.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
index 82cc1167e2..db42c00a92 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.22.0.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.24.2.bb
@@ -11,8 +11,8 @@ inherit gnomebase gettext systemd gobject-introspection bash-completion
 
 DEPENDS = "glib-2.0 libgudev libxslt-native dbus"
 
-SRCREV = "03f786ce66360d67c669f4f122f8aa458e6f01ea"
-SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-22"
+SRCREV = "f2b9ab1ad78d322f32134a444b5b54c6e8160e19"
+SRC_URI = "git://gitlab.freedesktop.org/mobile-broadband/ModemManager.git;protocol=https;branch=mm-1-24;tag=${PV}"
 
 
 # strict, permissive

