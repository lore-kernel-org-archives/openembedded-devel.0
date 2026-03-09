Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D0EEA855B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 05:23:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7740.1773033813218204941
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Mar 2026 22:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Idq8zlwN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7528c4c72f=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6295JFOZ4055645
	for <openembedded-devel@lists.openembedded.org>; Mon, 9 Mar 2026 05:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=VmpHbk6oNxzZcGltBdJi
	ZaOECoXYkWVWLp/p2fQ5QmU=; b=Idq8zlwNDzEMqUd0jic1cQSLYlOf0eTXICTv
	vYTNUTwo/EqO3F+hYFoQuF0O4f9QKFmfJ4ycgXsqu9eUfor00D1C5HSmq6/xjuZy
	csehmbl7/E6S/KWOLNhU5S9DNg8kA4kUtClh3ERVX5ANUiA/MvqSqBq1VlyhVYRd
	gzzpiOSQxtW36g7m+MRNRJVkfuSp5XwkXzr+wYuEY6gQDY4uGSxtqm+80+biiKqm
	Qga8SOhwEUpf6x4lZKt1lG8V5sY/LOvAHsRfeVB/D7GXaZkhnPASOszTnx8SKPKx
	BPz7W61Kb7tzaPHvWfGw73pCOCvf+ZGzWiewdIcGpmFM6g+UYw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crb081f7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 05:23:31 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 8 Mar 2026 22:23:30 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 8 Mar 2026 22:23:30 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libwnck3: BPN -> GNOMEBN
Date: Sun, 8 Mar 2026 22:23:30 -0700
Message-ID: <20260309052330.220464-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: E2lrDjO8niFpwD4dJ-4o3Hmgyjfib0H2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA0OCBTYWx0ZWRfX0LHz2u+iJ3vl
 tiWjnZ1YIxDOfHVIENSOuFkrkDaWg/3Dg4/yBqMTeT/mY+7z0j1TVefTcU+m1ixjCd9JrRzH/Yj
 SsBL5YdBiomMtMT3iIfWAn82zHVXjF0yGJq/02IQlwtJRtuusYYjUwA13Y4v/DM497yU6fWt9xH
 r7BP+5d27/C/O7TubyWG5OCyjn22TqJR9Z0Qp3Ug+7BOSjfZhr6ZU0kxI8+h+vCO5/03MyLoY+k
 Jof54pku0oxUsiL/u4pwo5HW+m5JcdfQuZ7ZSjkNHLXZiqOtCiwJnp3nRKwQIoLKef4xEtnX3DD
 89Uv78XktyLV/TFOpl0qmD2/gJzAfSYG6RlK39wf1OoxNhw2wajAWfRba1pwn4ozMBI6m1xqzHk
 Gn9JHWqZGjr5lhmBp2e99MDITb1Puj+6d4VfLpj0EpY4wKZ3N54sxgOvQxDM2fRpT0OPReEpBLL
 Ma3EvJn8Mky+ITToBoQ==
X-Proofpoint-ORIG-GUID: E2lrDjO8niFpwD4dJ-4o3Hmgyjfib0H2
X-Authority-Analysis: v=2.4 cv=UahciaSN c=1 sm=1 tr=0 ts=69ae5954 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8 a=dZnWjnfi32WpXuXLpU8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_02,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1011 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090048
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 05:23:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124950

From: Robert Yang <liezhi.yang@windriver.com>

The BPN = libwnck is confusing since it should be libwnck3, use GNOMEBN to
replace BPN to make the SRC_URI work.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
index 4342325f11..db5a120caf 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.2.bb
@@ -2,7 +2,7 @@ SUMMARY = "Window navigation construction toolkit"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
-BPN = "libwnck"
+GNOMEBN = "libwnck"
 
 SECTION = "x11/libs"
 DEPENDS = "cairo glib-2.0 gtk+3"
-- 
2.49.0


