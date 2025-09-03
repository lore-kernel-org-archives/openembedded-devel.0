Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB8B2CA1011
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:25:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.6087.1756880705618607371
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:25:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mokS1amp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1341c1fd9b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5835OvkM3722475
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 06:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=EvVXN2QVXX+Z6QVgVts4ZoLvZTwfXJnE75344QQ1GXM=; b=mokS1amp8a+6
	mgZsq7GQKxHQ7M86lccqaKn+swJHYx0jashwjtHtvxIN4FocYSZVubXAmZx3De+3
	x7h6j3Qmf6BUlKvdq6caVVNG155d4laBLq7Numf7W9gRMo2QcygGStgKx9QK152Y
	s/b3HDX6qB+t+rY5FxAczODGSW54Qr6vVWQDL3kc4d2WQs0Ap+NbDnOFFm/y/+Ck
	Cr6WaNygHBbAG6ajUmck8ACWNiFs8Z3lSKqp9mrfQGXe5j7Sy4vkIUkZwCZm+MPS
	iRAU5XklZfRD6PyNjg0JNlru2jH0xIzigxR0kDaI7HwkVgZIRKInfMF3LB4Ex+V/
	1tvVu7Vl6A==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48upgykqc0-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:25:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 2 Sep 2025 23:25:11 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 2 Sep 2025 23:25:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 2/3] libpanel: require distro feature opengl
Date: Wed, 3 Sep 2025 14:25:02 +0800
Message-ID: <20250903062503.122121-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903062503.122121-1-hongxu.jia@windriver.com>
References: <20250903062503.122121-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA2MSBTYWx0ZWRfXzgBQkabfjo/U
 j702Bcf9u9dZJJVQYaZJQfoc7CqTaQEnZHUYY/IcJToGVT7p2v3ok/nebqnsh5GJMvAvKLc7EFb
 YXTT024bPNBXwpvwZDEzxfdbcuY4BB7IFU269aP6Tj2SRppx983YSO4yFM/ThSTJmSyaXke1WNC
 XL0MSNEOXCZKN10FFHJLIUjRmYcK1e1acCKXFL5XOWk8ZSwOsM4XlGJApB0vTaurzc9GxCknFKN
 JmVTulQlujllIpgvJ4hBv1Aw4J4WOhI4fNxarzS/IVRPHTk5pkU+urYzVJKL2HSL5KT5SLJFirr
 OcazgoskbEbjo1/1ZNpe1SWiTDV1KggpXako49Us6xXCpL2SnAUUFcAw7YOUt4=
X-Authority-Analysis: v=2.4 cv=eubfzppX c=1 sm=1 tr=0 ts=68b7df40 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=vZMcqXWAytbxDcEyTs8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: djYxNtvrAv3veS75h4r0ppitsXe4PAZV
X-Proofpoint-ORIG-GUID: djYxNtvrAv3veS75h4r0ppitsXe4PAZV
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119191

Make libpanel require distro feature opengl. Otherwise it fails
to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
...
|ERROR: Nothing PROVIDES 'libadwaita' (but meta-openembedded/meta-gnome/recipes-gnome/libpanel/
libpanel_1.10.0.bb DEPENDS on or otherwise requires it)
|libadwaita was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
|ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'libpanel', 'libadwaita']
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
index da47288cf8..ddf183a7f3 100644
--- a/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
+++ b/meta-gnome/recipes-gnome/libpanel/libpanel_1.10.0.bb
@@ -19,4 +19,4 @@ PACKAGECONFIG ?= ""
 
 EXTRA_OEMESON += "-Ddocs=disabled  -Dintrospection=enabled -Dvapi=false"
 
-REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data opengl"
-- 
2.34.1


