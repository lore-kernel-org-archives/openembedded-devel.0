Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 006F9CD4F4B
	for <webhook@archiver.kernel.org>; Sun, 17 May 2026 08:24:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20208.1779006251547801838
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 May 2026 01:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=LfOKXDrA;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=jHyxurYq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H5FX002645858
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UobtR0aao9c
	UyI9oDK8Jd1x30eHKb+njEvyP/vZdD28=; b=LfOKXDrAYlItnWVBgknBnoqKQ/M
	q02viJI5BC9VjPHXwQsSxkbRfns8vd2P00WevAeIsG+jN91yZdtLT/b9En6Hg+1i
	uFc7GgjQgeBNcosYoMR+ArQl4VGHuCkInOMiRiPB2dYOC5pjbg27fSwNOYiZfMlT
	kRIlUg+oMqBxoxKyjz4WznqyA2rJ/JRhm+3kKzxMkP5zmuM/XhnqKmSHGQrPLksr
	+jJM0Hrsx3ym0Xz3Zoc3HuJRgADgytp30o5r71Dx/c00FavOonyY5JrSme8rVY/M
	//pIFlOtNMbT63CdKiwHJanA4jVn6YTZBXRFCuRDGIYXeXBNTphLUXGxkZA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gx6tf08-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso3058186a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 01:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779006250; x=1779611050; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UobtR0aao9cUyI9oDK8Jd1x30eHKb+njEvyP/vZdD28=;
        b=jHyxurYqvsonjU0W+0+YblEOoHEcxTjPRSEUegfdR7VoHlAbgJJa+vwU0pz+kdRl0C
         g2VIGTzbiOgAb2m2tOqSek0i0KoVsavFTWpejhfp2cmh7toqUdPIkzPXQLkY+RApR3O0
         LAA8ByFJ9h5nEIxPOvY3Dbah7gx/9g6ZhjPmSgozQbQN19JyIjpgj9Ech+662Q/gWJkm
         jX/K4Z0o4UsVDlSCkEoxqJX3ErWqpwpnyDCfaplQCVIov1zQkJDDHx4zT6jyvkXqSgaS
         1gfvigqUnaKaMYe/frpqRvH0WbaiMICiCoW7X75tlbeYRJ1saZXQid9KjosueBnXw29A
         Ul9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779006250; x=1779611050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UobtR0aao9cUyI9oDK8Jd1x30eHKb+njEvyP/vZdD28=;
        b=tQugKz8cCeOONu9xcjIolTc70nT0jqnMutL5K6cfNbo8o55BkmRYLCc5HM74sl5zq3
         /lv5UWcpMzWziH8Bnkawbh+R5mYCqb8XLeIRs/EPQfJK6Avi+LyiBTs2B9/qFVaWQX+c
         xuWbZFwh6OITXSDcyBaAUfI8pDHc2HDdZ3Fnr4Gj8a7rPKPG+bBAMFM0Diyl9Kc5hPx8
         /jidBimlnIXPdA6lMSwvx/RRzDaeTL2KmeA8b2gl/R0QziF2EGAGK8dYT/kbIT3FxKDD
         aDlVsRIheDhdhIAwp2eIOrPU6yog/eTxxGm3W82zFEIyXMbD5GgZ/UsVLNsY9fh9NblJ
         S9EQ==
X-Gm-Message-State: AOJu0YxAWyY8wTBD7AYfJd254zEshlMAktYIm4zXxjadnrDNE7nBWsv9
	7KNZR116zcGizysA08ohMrLHUKm7ciFBUE6dak9Z197nscQOSpDaePcuAwxRTkgoDYVjxR2hhz1
	3dE9qZLN9eg4BFFWMJrCJqycvGpWo2xacw4W5W32QM5Ts7mMLyrijvQfEgpVoU9JVRHSmnEF0vr
	N0reZG57+S3f8nBhOcDVUbYw==
X-Gm-Gg: Acq92OEVaqtlB1Et87VBKuFPR+AaLQc24os8XARFqbc+gACOw1yB9Z//EoYOunK2J8S
	klgASLclwEDlFZNaQ9r46/rBz7Uy0wtnziJsmDxj2RAx8u12zQjw0DieGcy/8yApxbJ8n+uDnY5
	/MJC490rkA7L1PdRm4/MLu2nK/YBvbbQdfcI+G3mU60emAmprG5oyyU316AvIwkmQs/t0qPpT99
	5FC5jAeGcPJmJPUTMhys8t+MoUb+z2sm4YLJgPUbfWUwfy51NBeDbzbqTdDZSnG8HNUZDcXC6dX
	GN3b+Kz5etp2I/t1236fZtidiXYM6CKioKHbkd7DiyZvntSBdPhSmb4PqyMNY8QDSmU35rKcdwC
	iceFODpecUAbQg2v3rcsVJ2sPHFfGBFb2Mgzkbr5Mox+8Y/Wra+Gl
X-Received: by 2002:a17:90b:2f90:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-36951a0e8d8mr11036450a91.10.1779006250533;
        Sun, 17 May 2026 01:24:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2f90:b0:366:132:fda7 with SMTP id 98e67ed59e1d1-36951a0e8d8mr11036427a91.10.1779006250024;
        Sun, 17 May 2026 01:24:10 -0700 (PDT)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36956f3723bsm2765033a91.1.2026.05.17.01.24.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:24:09 -0700 (PDT)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][meta-gnome][PATCH 07/29] eog: Add HOMEPAGE
Date: Sun, 17 May 2026 13:49:35 +0530
Message-ID: <319382b8ef8ac398cabdf78a3098724f653b06ab.1779004358.git.anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
References: <cover.1779004358.git.anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KTXrF4va_Q8AOSlCcYyit9Pw1HgE9CrC
X-Authority-Analysis: v=2.4 cv=f614wuyM c=1 sm=1 tr=0 ts=6a097b2b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=GHR8O2WEAAAA:20
 a=omOdbC7AAAAA:8 a=EUspDBNiAAAA:8 a=LCLacslJWP9fc6zzvGcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: KTXrF4va_Q8AOSlCcYyit9Pw1HgE9CrC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA4NyBTYWx0ZWRfX575pCktC3j27
 TEf4Bkfhwq3nPItMNVDAv7Lcfp7N2Z20ks0rzhjYrn1cFcyChUVviusY/nUP/IF0TuNeWsZeB7V
 dg0FmUexbs91AbDcH/Q4HyowL8ngbcX+c+WiiECNzIt5jvSVfzrUHNiBlGpT4O/K9+Y/uYGJDz6
 Ym3OZmQmAjZ+fuhm8qYd/6SMZ3kxFW+znXzjVUW8QphPlT3s6ZXypLLyG/7knIu3czMK3hPiga+
 GWNlQHdH57KCdOR/MJ+CjfuHSAqqiMIWoKQiwB7wZamsKp8APT1g6gGYlJge495cVD87nEHzutr
 BrGsd9NW21HkIzifSr5fYg2vk0kKYUA6yDbsJvnaViF0GVcQf86Xo1Fpb7atkfg3WJW+EO//0ja
 DsT+4u1uiq6fOtO1vorVCrd76DyL5DI/Iu4Md58cLs+uKmtWj3B+5kA9bRqbukAX25hyza8OBtW
 O6CX33HlDMUxDIiDplw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605170087
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 May 2026 08:24:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127020

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 76b27162f9e612d8f117df312d39a56ad66ce589)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/eog/eog_49.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/eog/eog_49.3.bb b/meta-gnome/recipes-gnome/eog/eog_49.3.bb
index d67c3733af..eee6c14459 100644
--- a/meta-gnome/recipes-gnome/eog/eog_49.3.bb
+++ b/meta-gnome/recipes-gnome/eog/eog_49.3.bb
@@ -1,4 +1,6 @@
 SUMMARY = "This is the Eye of GNOME, an image viewer program."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/eog"
+
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-- 
2.53.0


