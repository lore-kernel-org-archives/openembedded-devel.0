Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 327D1D3C529
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:44:22 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12685.1765363451778690846
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:44:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=jMJuWa9o;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: prvs=24394d3a2e=pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA9iNQ6087450;
	Wed, 10 Dec 2025 10:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=j7HOAvr9ICylWkh4XVrMhBYucVZiw+bTgJ1ySWcTgSo=; b=
	jMJuWa9o81PIOOZcmysyfsINY7i8ub1ygYltOyC6wK7E8M1mBJ8EcniW0gD6lIGW
	1rcq0vOxI7P3Ns/sRxjLiwFKFoKxS0Jl95RS6bOxc+87fWmHTK+2PijO2dwpCTA5
	f5V2CNPUTwGWBzhDSk+dmTBkzBmrKVP8of7EXkUJWUupc+qWtHiPxb3R7IVaNfSa
	FkACZFiWnXpVBl1vq3+Up8se46dhVww1nZP+NGue1QFeux1TY5W62FsAG/olS7Eo
	khVo6KFOeIjydc0eFksShbCDgtARwvPF24WR4vAh51a0j2JBkXEN+gTVl8E43izp
	GN82gfWtCfsskL1iPn7TFQ==
Received: from tut-ex01-pv.kstg.corp ([62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 4axts7sx15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Dec 2025 10:44:09 +0000 (GMT)
Received: from TUT-EX01-PV.KSTG.corp (10.0.10.190) by TUT-EX01-PV.KSTG.corp
 (10.0.10.190) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 10 Dec
 2025 11:44:09 +0100
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.190) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 11:44:09 +0100
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <brgl@bgdev.pl>, "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [meta-oe][PATCH v2 8/9] can-utils: Add HOMEPAGE variable
Date: Wed, 10 Dec 2025 11:43:24 +0100
Message-ID: <20251210104325.175100-9-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
References: <20251210104325.175100-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: -VYLi7e3stMyzjQIELWz2KPaGJ_QQYYM
X-Proofpoint-GUID: -VYLi7e3stMyzjQIELWz2KPaGJ_QQYYM
X-Authority-Analysis: v=2.4 cv=N9Ek1m9B c=1 sm=1 tr=0 ts=69394ef9 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=n9SCklZpAAAA:8
 a=k7wnS1qkdw-vfq6QgNAA:9 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NiBTYWx0ZWRfX+dh/hmAf16tx
 4r7Ehze/x10Z8Vx8wgahYfZ1MuOFCatwQmPRcoUdWQM0e2CRdB7yu4NQxtmgUCef7ULOCKRPA7a
 UaSllMaJHyZBQbMHxrlxmIFVPS8E7PtjVZvf5W2Lqj2PesB4dInpq9BWbVjF7WlT6PMG2oXzokE
 Da7IEoCD6TZ7GsPcoQIs2kwj+lXFAjdvCoFm2Qx+FkjF3jldPmEuPJ7u+ano3k1w46us2aujQrb
 4lC9qcp3cTiddvO0f4SiLDRavsMNeMHdjmE1Q1KZNO9fKrmut9IuP2l/cNOUv3wuTL37q4CNwFl
 MI/LC+wz61E4O6sjcW2EV8L+gSa01m/TMLDZOsMlvFRj3gSWIcZ52n/F65BgkO8sQ/oFNJZiwJ4
 nqlAL+kWsXRyNdN5H9fUX7mCqq1+KA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 10:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122503

Add HOMEPAGE variable to can-utils recipe.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
index 5dc41bcb93..9d55f324bf 100644
--- a/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
+++ b/meta-oe/recipes-extended/socketcan/can-utils_2025.01.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Linux CAN network development utilities"
+HOMEPAGE = "https://github.com/linux-can/can-utils"
 LICENSE = "GPL-2.0-only & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://include/linux/can.h;endline=44;md5=a9e1169c6c9a114a61329e99f86fdd31"
 
-- 
2.50.1


