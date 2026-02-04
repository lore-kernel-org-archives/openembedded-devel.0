Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F77BE8B393
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 02:51:33 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10798.1770173491474599837
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Feb 2026 18:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=F0xpGR9g;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=acss/r0O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613IlgGa2962743
	for <openembedded-devel@lists.openembedded.org>; Wed, 4 Feb 2026 02:51:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PPsrskcwhvS
	JX26UPC6K8cIjENGSf14NVP9xyDf9o6M=; b=F0xpGR9gSr9l/yRMf7RNDKFqAzb
	orCL45+Xz5g3cIuxvTyHp6jdMU60qbEkzYuNO9cXAxLvKmAUMYjBv03CPMO+tg+x
	7tF+xpoPrMEVNG+wzQiWRCTvXOgBKHEPj0/kz3WuJnPO/8KDJVkaj5uaipRIfqRC
	Pv2grQ0gGtZvoPebAf8pl/MHfnFnvaTDwQ8cGijl11wzKJdih0ojj6mjWN6/OUvi
	6gpAE4pQSbYphGYZ5zp7IJDbro2jMKEZJwXYrBvmJ+IX3Exo5LT2tFf+99RMYX17
	bXSL67rIUOEG/xznzgQgg4bq0osWbBzp0RU9nDcoNGCvntsil+PQDlxMMxw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ne7sn9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-352de7a89e1so5396740a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Feb 2026 18:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770173490; x=1770778290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPsrskcwhvSJX26UPC6K8cIjENGSf14NVP9xyDf9o6M=;
        b=acss/r0OlUUHtycLQ0dUw5vLjspmSFLnSMLKfAD35QoxDbKMl/6aQvvl0uxJPUqMdj
         RL/7iYAvRmC0c5TMaTNItIgjCZmi+vxfT8UxN2OB80Z9teX8HtdQOIVHhrO05DayAplf
         a39G76GGSPNRPAQLSBhznK8fkhYES1QkvjWXQtFq+mVAK9wcvRCQvGxdPzx4Nd3zPNFo
         JQ3LjEamffWghppjQBpg8uj8A/57pnHsRPstCThdTXOsEJ0Cf7b846nGvXP7NW+VZea2
         psmD+gNCEaD7BF/UIsBJjZ2Y+54nU23zZiTGGAF7sNk7U8hlf7jJVwwMuA9oyJlEWf12
         SsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770173490; x=1770778290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PPsrskcwhvSJX26UPC6K8cIjENGSf14NVP9xyDf9o6M=;
        b=wu+fGVrBxzTmwCjXMuAa1wc4DCtkSSRkxsuJQuK9av7E+Aq8zvXum0QdnRTT/6pANA
         usYjkTTXPByQ7LgJmOLpBP2gfZ6I2CFi7BnzTCFXDDXb1CIjtFKD5O0xEmZ+cxXDrvrY
         mN2EeatQYBoHIOseCwuND+SIWObkv1Uin2zUr43ydxu4VuwnGhLaS6t6sO25CVyBAMcR
         jGoPGV3ATy44u5L7/aTeGoHDNFGlJ3S95wSApsASU2MVnd3dNtcLWIXKby1Zr/jUYQvW
         S+ZK983HvdCp9q43HNK7tP3ITduMl+JXvt4Zhx2l02fDexLJQ+lfhNAXzYFfvQejWdQN
         xmmA==
X-Gm-Message-State: AOJu0Yy87m3aW+yNLMH7Riv6CxjX3G9o9K0uTGcBuh3dMha0l30A4sz/
	2O1q6PxGr0ngNdQAR2N3X3oS6HE3jEUKIN5hNF1GCxAorLM1soUIi+hvUJh2C1CdaT9MdB9LpDJ
	VbjFpxGepdF8yP1Bdhv6Dy2xotva8P8gacBNpRSjxU44bx4y3TJ870OfNcsQpX/n829HlLa8rIN
	4iV4XyCl+z3faWwIxAhwM=
X-Gm-Gg: AZuq6aKJ29cYD13cE2iOw5WDtzg3VXdmTJyPz2kqsPf9VoNCjaMYzqbIhvFdkVgi05H
	NyrVhlTJ8SkeppVM2eiqaEGXDKo1CRZvWNF1tC+CfWab6aCGpC8Ftk7r5zTXA51wHVGoAt3XIqJ
	3TMRfMCRbWLR9OtSpG58PjSop6IneptWYvfgMcC2j1DLJGRNuFOmTGHsiQZDITElLXQEz2AonVU
	83HT1WAnBCSQFH91ruRaSpvwtp71V400RTLnEe1z5YKH9d3MFij/BZI4b7xGYvFzo4nwixk0HMO
	7iVtVRUtpNUeg8w760F957mOCKy2fT4L0oAcaixDw0roiG9ZVSMhvgnqxGM9jks6siETPyN3Xui
	AsZUL5FDdJ+wfUhtG6ICJV6WkJ2SJOoZd4X3pPlIm
X-Received: by 2002:a17:90b:57cd:b0:354:7be4:a241 with SMTP id 98e67ed59e1d1-354870f9aebmr1266707a91.15.1770173490328;
        Tue, 03 Feb 2026 18:51:30 -0800 (PST)
X-Received: by 2002:a17:90b:57cd:b0:354:7be4:a241 with SMTP id 98e67ed59e1d1-354870f9aebmr1266694a91.15.1770173489856;
        Tue, 03 Feb 2026 18:51:29 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548630f6desm812490a91.15.2026.02.03.18.51.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 18:51:29 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [whinlatter][meta-oe][PATCH 2/4] anthy: fix SRC_URI
Date: Wed,  4 Feb 2026 08:21:20 +0530
Message-ID: <20260204025122.2928723-2-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
References: <20260204025122.2928723-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: EObvdZtkaBEDsSXazVUxVGRUJ6s2urxu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAxOCBTYWx0ZWRfX0nozMttKGqgQ
 5z2UJjmLiTE2h7pyddPvuk1iltt8vyIEHNCop913cC3PseyXoa0KrI/vSjJysN3crdeVtcZ7Q+r
 jBTFBadHaDIfTED+vEU/TbAHm3jUjv0WaiKo9n2zFDNQmoqEHmWm72hxyXTZXyzGu7urUWWxvcB
 alNxzFEH8nwIQszgGndgbUrVVNvJvfJqglTeU5PiDWjCruDcveCJvm3WhVg/JriARe3j5L/zIDd
 K/LL8Oe/ViNdpyKoku2EpCTFyfHFotX8GQArvgxlz9Vh9c65gok9+Fl1/ddO51ccv86W2iM5Mp6
 lz0jf7bxsSp+L2nuYCaNrsPrm/eF1bqeAaJPdohQgsoFuQLLTK4CwX2nYaxma25wfZQBiFHN4ju
 1M8wKjHFCCw2pLowNDLwcF5Nr+q/k20gqoPtVVfb/6euyCcvytD8hTZ+Kqy7D/HTrcp+ZzJ7VU4
 LyqUQTqbu9Gj34LNUBA==
X-Authority-Analysis: v=2.4 cv=TZmbdBQh c=1 sm=1 tr=0 ts=6982b433 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dnEwNotGAAAA:8 a=danhDmx_AAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=EIoCDO1COH-JH3eVIGcA:9 a=QRzjZtwMIBQA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: EObvdZtkaBEDsSXazVUxVGRUJ6s2urxu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602040018
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Feb 2026 02:51:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124116

From: Gyorgy Sarvari <skandigraun@gmail.com>

The old URL is gone - switch to a working mirror.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fd562c65c60edd774a36860b6daed485247d4bfb)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-support/anthy/anthy_9100h.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/anthy/anthy_9100h.bb b/meta-oe/recipes-support/anthy/anthy_9100h.bb
index 1826e91697..532829a53a 100644
--- a/meta-oe/recipes-support/anthy/anthy_9100h.bb
+++ b/meta-oe/recipes-support/anthy/anthy_9100h.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=11f384074d8e93e263b5664ef08a411a \
     file://alt-cannadic/COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b \
 "
 
-SRC_URI = "http://osdn.dl.sourceforge.jp/anthy/37536/anthy-9100h.tar.gz \
+SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/anthy/9100h-23ubuntu2/anthy_9100h.orig.tar.gz \
     file://not_build_elc.patch \
     file://2ch_t.patch \
 "
-- 
2.52.0


