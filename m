Return-Path: <dmitry.baryshkov@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43955C54756
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 17:48:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.27491.1747763327790657023
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 May 2025 10:48:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ebGFobjK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: dmitry.baryshkov@oss.qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGgF07013444
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hcj3u/jcgvz
	R9sQlPkihBLfrDGUmkE8WNSxzZHaA4RM=; b=ebGFobjK4sXgnV4Gw+/a3aWrJdr
	dcdjIF36wv5YiAO+YLrEsfKa+Aj8wRCOmIjI6O+LIVDxLvCLqTWqXAfJeYS71ENQ
	oacWYnpj0DCdbeiI1ul6IIK8aSwyLpbFDALyS9GhZEbaY1M2hbj/vjqGjiU55GxV
	0MLtWHCr1pXUmpYhaE/PBYsGUpNR2ZwfAnKGAhav3KNesode6lqGR3IeytF5SHTX
	NF+ljw4bYf+xzPGnZ3gfHE6XJWhtFsbF9rmXuHszSrNMCcL4t5zG0A752PFn5C/p
	ptq0Qbytvp8xfn0dN5JyE9Xspx1+ErOHyKKY0LKKn3k3rAybCLloMuLeIsA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6g6eb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:46 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8dd95985dso48408206d6.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 10:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763322; x=1748368122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hcj3u/jcgvzR9sQlPkihBLfrDGUmkE8WNSxzZHaA4RM=;
        b=U9hM7h+p5LasRd26xEKc0obr1lraOFQPIhHukQiUMhnzrLG4/SfH2TOPhyXPorL8LQ
         9N4YF4UTF34hb9Yncknn97GyOItWIF7O8gfitcI8Ocyzdc9SHHf6HL+EFWdbIW/evF1Z
         XcYOdnfL+A5pui7NHgZD7SA7PUu3v1E1DxEyzF6QjaSCVxKdX87F14+/q8N3u4I+z4f/
         KWtCXoM3gkpld1u8ZfHqtqW+aYoWUQci6prKOEXMU2X9C1uL0f4NTB1NsN6pTDmTO7gZ
         +jmqBPkOGnxD1xGlCKLTS6Lp222rNIgRI1BehQCE+MiGtlKOhcw7Jn0ozowxp6tuvCJk
         gIIg==
X-Gm-Message-State: AOJu0YwnRa+C2pxSNgxclBi8whWXJWU4ksNk1JFH7+mcoBs+SIYtJqsD
	Lo//z8SolCcHR52ae1kfzFJhIBWMCmDOxBlRkFFJgC/nhlcEk2NwL/0p0eatlvdPN8QPbu9TGBW
	uZuDgdjiNy44bG5dcXZkBAzEllGEkUs6DjFkLWtYNJgvrblxHNFl4AggDiSLdtlZ7xwOdGSu4nP
	ZaqP8YpYayClo4fpEEzwc=
X-Gm-Gg: ASbGncsc73nm3rUMyhetZ90JT1+xjs2c81/QkeqtK/SMcYRjcnLcg68HY1/2FA60YTk
	g+9NCx32rSmGjeSAxwM00MgeWZtzGMDtfrNtpqjxe9JwN1/nnhEijOE9pTfC8Asvbp6eUqMR5Gx
	XqecfG0IHgQiipSvdjtwbZOmhLkODwMNHGkMNEu6FENdLpemcVeCMVVRiVq3pj42TJlVvN8iQxW
	3TEG7rl//XU6k7NENACY30EQF3eZhMJPqPkmBx4ACuduwARGd6XuvIH2AOxUKM+ltAVSS8YGK6Q
	OxdzbrXHp2OifAcMOGhyyqMY2lry3dISY8Rt5ejrxX/VbVF+Tiv7GKz59xktBtPkmk8ppDykws5
	KHou0Nc3dhIRlbw9QoGHlNUyF
X-Received: by 2002:a05:6214:248a:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f8b2d0d9a0mr256734796d6.29.1747763322558;
        Tue, 20 May 2025 10:48:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTBC2VmMvHhaAFd4d2DjxnME0mgDG7D40Wgdl0z6CKZ8UdgTrRa7S4ENA0QkP1ncNLekxDgQ==
X-Received: by 2002:a05:6214:248a:b0:6e4:2dcb:33c8 with SMTP id 6a1803df08f44-6f8b2d0d9a0mr256734356d6.29.1747763321919;
        Tue, 20 May 2025 10:48:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6e0sm2441815e87.223.2025.05.20.10.48.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 10:48:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2 2/3] libglvnd: RPROVIDE libegl
Date: Tue, 20 May 2025 20:48:37 +0300
Message-Id: <20250520174838.1187294-2-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250520174838.1187294-1-dmitry.baryshkov@oss.qualcomm.com>
References: <20250520174838.1187294-1-dmitry.baryshkov@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VL/dn8PX c=1 sm=1 tr=0 ts=682cc07e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=aR16PxjQAAAA:8 a=EUspDBNiAAAA:8 a=pXe0YPzJT124VR3A5wcA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=zbFvvTOBjyH4ze5LlUjX:22
X-Proofpoint-GUID: 0DbKnxLGP7Ff2IMuhX5Df4tpsa2YH3vN
X-Proofpoint-ORIG-GUID: 0DbKnxLGP7Ff2IMuhX5Df4tpsa2YH3vN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE0OSBTYWx0ZWRfX3QMTmgjLJTpD
 Va08TrOX0I3qES6xq6cpw4wHfeAoazuPXp8Vu1E5UxefkXZumVwDLF42dW4hQc+M85oMhQh4jbi
 JfHwEpYMLFLVM71ZKxcd8P+xz4PRF1P3QImsfDS2JweUKwlMH8yMnD4SV10jsJMOB/MYOgxpsGD
 5IIik+scMFHwQ5nUc8bzTzZHtToFnT3ivgKqm7QHf8UEF+jrsBkbOVGoodqYE6iNUfIpFnvAAg+
 HqK8iq1kjP2UP9yu7v7bWZ0cCsPsceLNB7eKk0EPHuealE/EMBPhUYhIw3NBGK81Xtk3YopTJyM
 ZHytGTkSkrToXGRLp/GTqo3C5TL6KXQRab5NuVaojAJcSVd1982goEzC/wvuK+eiCvJ8CgN98wA
 4uJURUf7Fyd+R6m7cEv7DM0IUuLi94/+3eA7pBxausuKrvHiFoWllNlKrfnl5ZTK3WJFAf77
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_08,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=809 clxscore=1015 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200149
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 May 2025 17:48:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117520

Some packages (XWayland, X.org) add runtime dependency on libegl in
order to let it by open at runtime. Make libglvnd RPROVIDE that package
name too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
index 1c0d3253d8ec..8f8035896376 100644
--- a/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
+++ b/meta-oe/recipes-graphics/libglvnd/libglvnd_1.7.0.bb
@@ -35,3 +35,5 @@ PROVIDES = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'gles2', 'virtual/libgles2 virtual/libgles3', '', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
 "
+
+RPROVIDES:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'egl', 'libegl', '', d)}"
-- 
2.39.5


