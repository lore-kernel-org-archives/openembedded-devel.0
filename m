Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B56CA100B
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:25:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5885.1756880707105082278
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:25:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NiWYpROD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341c1fd9b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5835Ojg73721974
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 06:25:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=dcnsWhx2Bx15w1LdEzaG4qitGXgi52ZGRG6gCYoYPAA=; b=NiWYpRODkZ3a
	Gi9EHc0VDrLWqslc08ZWpHtkrEz73jcxXA/8zijEummN90AgIs1dqGMbmJtB57Hj
	s+0RqUfCLRlflHj4XrFN5C4dsC4pjTpl82mEuAzKY8t84h+L8Q0fKWckBYldT5xq
	u7mrvxB93//WauNLtsadqrJIc/hcmrUf4XU0MPYBXItpeIrxGM0Y5O1ckJlAJeNF
	bwAPMLzOXJa1JTeKL1N6/j9uib6b6NazJyLQwEtANavgfWq01W2604klxQR13fTN
	7z+rSpCO5SgRoLjG9rtnefsfJdH9U1cvUybatErFTy9YGF104r3S4Rz6OzFwQcxF
	L4jemUEsjQ==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgykqc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:25:06 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 23:25:12 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 2 Sep 2025 23:25:11 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 3/3] cheese: require distro feature opengl
Date: Wed, 3 Sep 2025 14:25:03 +0800
Message-ID: <20250903062503.122121-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903062503.122121-1-hongxu.jia@windriver.com>
References: <20250903062503.122121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA2MSBTYWx0ZWRfX+51u4eQFbzP1
 NmCJazkB6JAT4olBRtyQBUmx2O/wy6EPK6R2a+PtAVmaOXtooknQffGK0yLORQLgZsFcveNoksI
 1dQ5PzRWMHikvEEBta554d4LhRTH2leUdcFEk+m6HRDRpnmkwbhAoDMRIlrXPVLdM40ZB/cZreC
 WcqR9MXOMIMTU+GMMSiPWp+xB8Zgf1VZo1FVNeCMlQ2iff89zNp4y+YrEXt/CQUxgLLRkwxK0uL
 XqjJ6EMYmt8un0y+56TgZXqHKgm08T198/EyE3jiYWaEJF3+cB7UENT3VHs4iP+E5efj2HQy7gN
 r69j7+5nzt8MwCXTKbhnZqVj2VA/4HzODLhhOWVJEDJ87Mxb5VxTq6Q4H6UD5E=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b7df42 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=5UOs06Z43ZsVegBrOqIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eNV-LruMeHsGfod3ssJJ9p10GN54mvnm
X-Proofpoint-ORIG-GUID: eNV-LruMeHsGfod3ssJJ9p10GN54mvnm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119192

Make cheese require distro feature opengl. Otherwise it fails
to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
...
|ERROR: Nothing PROVIDES 'clutter-gst-3.0' (but meta-openembedded/meta-gnome/recipes-gnome/
cheese/cheese_44.1.bb DEPENDS on or otherwise requires it)
|clutter-gst-3.0 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
|ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'cheese', 'clutter-gst-3.0']
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
index 180f3f6319..8e78162991 100644
--- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
+++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a17cb0a873d252440acfdf9b3d0e7fbf"
 
 inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gsettings gnome-help gtk-doc
 
+REQUIRED_DISTRO_FEATURES = "opengl"
+
 SRC_URI += "file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-incompatibl.patch"
 
 SRC_URI[archive.sha256sum] = "5f2185c4c99e54ddf2b8baf60c82819950e54952e132e8639875f3edcbf8f68e"
-- 
2.34.1


