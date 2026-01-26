Return-Path: <anuj.mittal@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82FEC88E50
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 06:21:53 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13953.1769408505726412650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jan 2026 22:21:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=cXiN5eKS;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=LffInjzp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: anuj.mittal@oss.qualcomm.com)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLiNdS1021885
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WrEc46Uqmgl
	DsunCbx11XTubRFwjgN9qq+vM6OUbJ9U=; b=cXiN5eKSL5u1uFisDTnfCVvtYnq
	WEMzLNaxDjU3RvnMktmrD5LS44vR6y/FyoZxD64hZh3vZ8wd037tUS/3JGtwPqVG
	TPkMW3mIimzAuuh9fY9vroY3iiOoLEsONdkoVm96lmCSpElx0m59FwWDCLzA4rCO
	uBOD4gmYVQz8iIwbb34M1UtKqUysFuGsM1yWMt/9b1rcweFF37MSUPGq6HjeORUX
	J/wzW8l0MjeT8wTccy3A64prKlybvZ/+d1qAtwieX8ZbgYyGEVXPtcZY/gBmNPUc
	eez2RbRW3encvMCheKhfxLUPnkTM+BiYlCFHE+TCYMOWL4dlIimiYGbbBTg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtyb2ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a76f2d7744so37879035ad.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 25 Jan 2026 22:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769408505; x=1770013305; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WrEc46UqmglDsunCbx11XTubRFwjgN9qq+vM6OUbJ9U=;
        b=LffInjzpCvK6dhWnO8TnGZ02KB4ngNVUs8CYSim4xNYFU+LKNgR1nbg+/YlLXpebSo
         /FMRGM3zD8DQexnkb1L5EL6FqFrwueIJxs6xEezYJG7OSJrkZkweKHDTWeSAI7MXgf9k
         qyaLGQtZWQ8mYJZyF+kBtzKb78G3/7BeIjt0/p6SXC2GQtj8OCssDJFWTheU/4EioRUc
         SiV4C+J3uqSiYKMD4Ju39yM9zJRuPKDHaOzTLxOL2v/D6FqlV3Op1634y1SmS6yzQwbQ
         UTJAKo7UItzDtwvjSVRBbRt3iLyWFP0YwvYXbCqdNtWYqsw95dneHt+vDU3jeD9T/byk
         fDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408505; x=1770013305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WrEc46UqmglDsunCbx11XTubRFwjgN9qq+vM6OUbJ9U=;
        b=tTF+uMlP70nR6IVnby5trWGL5vQgP765NcwS96vEpS8qAMNGK7m3HpbTv0Hu8iAU0h
         UUMfh4jZV+ZLPQITpHCatifGQ5ZV1sRRPRT5VIbBEPW2XlvnvwpbHpudtdkqDeZbMOzV
         2iGWFZe4X8s18FLXxY6Dwj8o6gj15L3s86J6uityMaV+Vet6G4Wtg2WRjQOA6aq37ASn
         VdSqe4yz6D/yNi6ar8ri2Z+wuq8Fmt/tnwt5yBaBrKvvZBQrd3Y/hwu7znTKW0Vdx5E8
         WxxlhixwOcWAZObZ5yG4e6bmvWDZFfLjlWI+i76EGeeXnIza6stf0L+83cXEG+1zsy3f
         eHTg==
X-Gm-Message-State: AOJu0Ywp7ALQDlPmRieB/ayyr8f7xRH70T/Jzqm6ejDooLBp8qzPkmiz
	dNnppx5TTNegnJh+NgxJaYoJ/AK+0/tGh1Wt8QSh4p1ckb+Jo8sKKyd6NWMbad6PJ1/j8H/3Npb
	j+TRWwpOhEu6GvYXKdKnc6LOyTdYMzyTjCJOkL+rpCyma5Sn9xHtQ0IslKvcEblD1pWh0Q/kJJX
	7tvvAvD+/+7WoIYdu9jNg=
X-Gm-Gg: AZuq6aJ0nKA5pqPve4hz9TiDI3uyLFWHC/EzFwsykDQMa4asmtmnCMMtG9I47qQOzpO
	xg+L35dCX54t9TlPZY7fjLxBEAcpK93RCN9tuwYbv1uhZk8eqgtDu19q8Jb4Ce7lSkzk6I8mVlW
	ErKb2Vx4DR7V63Dd/NW3Jpwe8rghiwvaaBPkyrKKxMqpObjE1rdM0/uaozljccuWhOpwJoLK6tI
	JltWX80z0A2klEV7q8tJml3QZwKoKOYTSAsesdgngXn7jE0J5tQdaSGzH6xwAH6PQhT6qYpouAm
	hkSL37pa4RXOhD63sE+F1leveK7BDGNZKjbErsUVglUGhSOLtxduArbtviZKeYDHzXs2KdgnKzQ
	se9jtR9RnwnaHutAsoSjLR4z+NGhI3JUrc8IKE9e8
X-Received: by 2002:a17:902:e547:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a8452ec3demr37860565ad.49.1769408504583;
        Sun, 25 Jan 2026 22:21:44 -0800 (PST)
X-Received: by 2002:a17:902:e547:b0:2a0:d4e3:7181 with SMTP id d9443c01a7336-2a8452ec3demr37860345ad.49.1769408504092;
        Sun, 25 Jan 2026 22:21:44 -0800 (PST)
Received: from hu-anujmitt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802dcfaf7sm81079675ad.34.2026.01.25.22.21.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:21:43 -0800 (PST)
From: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][meta-gnome][PATCH 3/3] gnome-keyring: set CVE_PRODUCT
Date: Mon, 26 Jan 2026 11:51:28 +0530
Message-ID: <20260126062128.1437811-3-anuj.mittal@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126062128.1437811-1-anuj.mittal@oss.qualcomm.com>
References: <20260126062128.1437811-1-anuj.mittal@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MOzaXG1e2bsNbE7FyNq_ARnR_Ueya7Bn
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=697707f9 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=mX2GSK45Nza8xnEDcj0A:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: MOzaXG1e2bsNbE7FyNq_ARnR_Ueya7Bn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1MyBTYWx0ZWRfX0SvwbYHCjp3H
 bOvoc0B+0LFEAOI9GFcdIT2fbdNTvLXYyBVUrJDDL8VQzVAMAUKKyjVqSQ9l06AbAjZpd6gqcCq
 vJu2Uf5ReXyYdxxADjhGqp3ADqw/j4B9iJKQQzUVTf7Tve87cQQNqizN5QXmlBfkWt8Ki2ITXIP
 k5KA1/t4QDHi2M40YZ5mvZj7oOOORRUhH/vcv1/DRQERg7VMf8APEMHGfDKwaeZkVU9BdwI9f6c
 DwITNn9SwWKfy+4V7B9KlcaGJXl/GN2ycn1Alv0o51i4cH1dRUmqHxBs5qYei6V/dWcP+6HrOyK
 TQlJ+pKpuvLEHS/eOHFPJZHKRT/DPkBb2N/ofQRHZv/tbv/jNPggvk5cRXKBRRvdQaBh4GaPjKg
 XFTqqS6fTU7Ben6RDf4z7jmz79Wlo0M+9n+SebZwgia4eOwwTMfMp2VNOV2UUtNLeZNqj0uGMuL
 PgyNSfdEBYe2pnlnYGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260053
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 06:21:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123857

From: Gyorgy Sarvari <skandigraun@gmail.com>

The underscores and hyphens in the product name are used randomly in the CVE
database:

sqlite> select * from PRODUCTs where vendor = 'gnome' and product like '%keyr%';
CVE-2012-3466|gnome|gnome-keyring|3.4.0|=||
CVE-2012-3466|gnome|gnome-keyring|3.4.1|=||
CVE-2012-6111|gnome|gnome_keyring|3.2|=||
CVE-2012-6111|gnome|gnome_keyring|3.4|=||
CVE-2018-19358|gnome|gnome-keyring|||3.28.2|<=
CVE-2018-20781|gnome|gnome_keyring|||3.27.2|<

Set CVE_PRODUCT so that both versions are matched.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4fdeb484c27282c85f7606bfce5e4158a860affa)
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
---
 meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
index 8df3710e6a..41f1f164ed 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_46.1.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
 "
 
+CVE_PRODUCT = "gnome-keyring gnome_keyring"
+
 DEPENDS = " \
     glib-2.0-native \
     gtk+3 \
-- 
2.52.0


