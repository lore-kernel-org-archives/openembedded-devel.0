Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14924C3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 09:03:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9880.1672995833692653573
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 01:03:53 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0370ea45eb=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3068dPOW013652
	for <openembedded-devel@lists.openembedded.org>; Fri, 6 Jan 2023 01:03:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mth87ut0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 01:03:53 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 6 Jan 2023 01:03:52 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Fri, 6 Jan 2023 01:03:52 -0800
From: <mingli.yu@eng.windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 1/3] file-roller: add opengl to REQUIRED_DISTRO_FEATURES
Date: Fri, 6 Jan 2023 17:03:49 +0800
Message-ID: <20230106090351.692314-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 9sywmL6r4j3jwhrrOBIrUlntlYWGIV0-
X-Proofpoint-GUID: 9sywmL6r4j3jwhrrOBIrUlntlYWGIV0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-06_05,2023-01-05_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=661 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301060071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 09:03:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100422

From: Mingli Yu <mingli.yu@windriver.com>

file-roller depends on libportal which needs opengl DISTRO_FEATURE,
so add the required distro also for file-roller.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
index 603d4232e..6d0f1f746 100644
--- a/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
+++ b/meta-gnome/recipes-gnome/file-roller/file-roller_43.0.bb
@@ -15,7 +15,9 @@ DEPENDS = " \
     libportal \
 "
 
-inherit gnomebase gsettings itstool gobject-introspection gnome-help gettext upstream-version-is-even mime-xdg gtk-icon-cache
+inherit gnomebase gsettings itstool gobject-introspection gnome-help gettext upstream-version-is-even mime-xdg gtk-icon-cache features_check
+
+REQUIRED_DISTRO_FEATURES = "opengl"
 
 EXTRA_OEMESON += "-Dintrospection=enabled"
 
-- 
2.25.1


