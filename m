Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466A0CD4F3D
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:30 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20200.1779006264530043116
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LC7x6yUX;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=fi0i3d6n;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H1vapb2576629
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Shiul80dbmj
	ZQ13k/i0qYiWhPiFvaUMvnX0bp3Lqhmw=; b=LC7x6yUXR0gcghvFJpDBu2m6zBK
	Hd/EDw84E+IM7ivjXwc+VQzvAPtx0eyjG7cH+Zy5NFe98Cm4xX8y65X2uMazB3G3
	xaiBvruJfBYHNrAlROc7tO3ckzpI11X5sRGv7i1p5HNvArpRWM4BUbw6xIaj7Y/K
	cNJfRwUjYHBHeHXvJUsYU+t5G6A7EpzNUXpL8sn3lEo3jCORsvqDmCSQrbwAdrLP
	ijr+QDxoRzdIXQ0+TCOF94GXw3Cu+brOdsZiOcP9H7DIveJ/zv0SciJ0HZrc4KN9
	cBWx+5FlWvKMsvNkuM6tB5Xbj4hrRZTmYdVkmBqIFpZxAKcfMXIf9Xb4+4w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qafr3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so1161367a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006262; x=1779611062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Shiul80dbmjZQ13k/i0qYiWhPiFvaUMvnX0bp3Lqhmw=;
        b=fi0i3d6nALaS4EGPWO4mI+E+DuBHR+tnhIhsdS5M2IJwmAT+i1w4VcZjbGXL5MTfIy
         jh+j3rYPrl0VrfjBc2fGn9yMCyBDjr7gPj4SoR1DFNR8UqlMSYEXsImsQ7ByR/h6IQqf
         vycPd0OeDsycUekH/5RaH1aESGwezGbfojLib8kEUDuv7Gyico+yi7PEketc9P6Cn/H9
         VrIsMHC53SRuhvcNmfDVjs3vklOZ40UfGTUvWkIi+qZaB4nWVp5xpKUZXYmmDvjuI89X
         MXv5PLsq9021Sfz40nSbaCtASJnGOyDWqTrUPg8mjuWpwc6kMcAb3BF2cQh8cVfNeRad
         rElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006262; x=1779611062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Shiul80dbmjZQ13k/i0qYiWhPiFvaUMvnX0bp3Lqhmw=;
        b=ee2pMT0b7YurNksuL4rHGvB2tXHaNH3MmCXs68Pigci9jZSPF84NZS8eVdNucwZADT
         TuAJRQZiV6TgSQX8wq3nKTf6I9nWJWEOSoqWq/S9gdhpAmn8Oz4CD++aJCo9w1mqXyOr
         U01quXH/6ANqqrL7/rNbAmmgFuHtzz52meECIckHSBownB43tiT0l3NiGj1HZcunpxJa
         irlhpI/8Bnsu99DAmYLDE4Jtw71lG41i+7bGlZrHYnfCWxSYWem7TkjBRSbn72L5BPqO
         /QpDVL8nZC8Vgzgh2NMxJ8ZzFleswll9y0IZhIenlU+lvyphVEXraw83r4TCPXtcdhUQ
         lCuw==
X-Gm-Message-State: AOJu0YxhQIBTqfxUTovMGsOogW7O9akmoU/G7Q38LzcqgI0Suzjpt+RM
	gbsQQhyNDSeIcqfseHCA1Z9MLy+76ht8iBDx50y0Q7iz6XTLhmopIuRISwtihP7eBdKhJNDQNSY
	zrd7Rqd8NYKa2HppG5+G5MnB/+8E+MkT8kpyGD+27oGUwNNBRaucrNrlhEmg6rdCHSRS3Aq9Q1Z
	cGkJNI0YEsk1Zj5bvQogYb1A==
X-Gm-Gg: Acq92OECKIZYRk6qKLjqI+mQT6C3inRvK0zo9um1IJ+tVSaz20vZeaJuAGdE47tmkyF
	9KfFYoL0ZNDcLdUATUlO13xu9yVS5pAu+8bHzyMuNPGdFC5sxC4JZQIj3KHx7eAjpfrkLH+gENa
	GJ4NkJeMa3yuJ2pxSwsFeeoEosJwCmj58UjtEuIsY7p09bfKE+W+LijpbvLuy7l9AkYOYzRiSjW
	x+FmrrlS80oi3cVM/LlghVguanlAmguSTv1ooiV7mkWvt4bvR+6eMXfHm3J6rT11S0VxrAsrTfw
	o2aLx6A7xAyQVxvbI2Y9O/Ie4XAuygBbOYgNXzHfSLlEOzxsslPd2p3xGxMpfJjAUAnTPBewDLz
	f08xta9rW7Gu/euEiHIXonsPVQoYJUoE4otGAOMxEq3XsMIceO8It
X-Received: by 2002:a17:90b:3ec5:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-369519c3215mr10628099a91.8.1779006262553;
        Sun, 17 May 2026 01:24:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3ec5:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-369519c3215mr10628088a91.8.1779006262006;
        Sun, 17 May 2026 01:24:22 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:21 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-oe][PATCH 15/29] cryptsetup: update udev package config
Date: Sun, 17 May 2026 13:49:43 +0530
Message-ID: <ec3fad00a2a1e9e9eedce663b872ae64b815da3d.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: s3bCsduDQ2cih6LX5LjMQWBGTx32MV-O
X-Proofpoint-GUID: s3bCsduDQ2cih6LX5LjMQWBGTx32MV-O
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a097b37 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=a_U1oVfrAAAA:8
 a=EUspDBNiAAAA:8 a=2BBeydMQKU3Z9S_sIOIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX9kNI6EbR3n9+
 Mf4kdj7gx2t8rmJjt9t95daRWUoSi6gT+f6w247icn2UeTXeSiocjLm8DMSwdNKjV+WE1AXfsgD
 hrYCZxR16hejZn/WlaK1PDQ8jI/SrP1pReTCjYMsAHbFsdU+RRf1he2t+3ncXUq3g2ERuiCFdCe
 X3jCemQ8wlninTg1prdzG41N/KFrSqSzik6gxARdmRGRYPvi0it+MgDEzdxMVeiL+03PVVeoiuC
 cdvjJEWdq11Gk80P2MYCbNHDPI9EXo3nG6fJ6WgBlOoTJzgxAW1x9xrHkf6GibPynfr4vOKaJcE
 qUtCZVz8mQlbQv/2YJslPF46kbYcKophkHB07wrVdsHeQbi1yyDxOD5LJ7FDfAsuBiJTToFjpuR
 8uySuWN547pxTclqaOptYWTjSaP7HHga9sZCUDAsC9BFlLzRJWVp37VD3116h7adbGaP5RCVmxB
 9SiER9Q2SfivbPnUtWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127028

From: Peter Marko <peter.marko@siemens.com>

Commit 1ca8df16af411871e10f268064570146cdef54cb fixed a build problem in
wrong way. Relevant rules from lvm2-udevrules were merged into
libdevmapper (which was previously pulled by the rules package), however
instead of that, the whole lvm2 package was added as dependency (which
then pulls the needed libdevmapper).
That is a huge package completely unneeded and due to that, this new
dependency was later changed to recommendation.

Switch to libdevmapper instead of whole lvm2.
Keep recommendation for now as it gives more flexibility.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit a5e9c8141a0533545e87f69d57d399acc2b3910b)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
index c74b7a1f35..c754131e3f 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.8.6.bb
@@ -57,7 +57,7 @@ PACKAGECONFIG[veritysetup] = "--enable-veritysetup,--disable-veritysetup"
 PACKAGECONFIG[luks2-reencryption] = "--enable-luks2-reencryption,--disable-luks2-reencryption"
 PACKAGECONFIG[integritysetup] = "--enable-integritysetup,--disable-integritysetup"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux"
-PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,,udev lvm2"
+PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,,,udev libdevmapper"
 PACKAGECONFIG[kernel_crypto] = "--enable-kernel_crypto,--disable-kernel_crypto"
 # gcrypt-pkbdf2 requries --with-crypto_backend=gcrypt or the flag isn't
 # recognized.
-- 
2.53.0


