Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08517C77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 09:17:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.3357.1680859051929116302
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 02:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LBTBvo4z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34613e1654=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33790onP018143
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Apr 2023 09:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=PPS06212021;
 bh=JP6OY1ZakPzia1z8y93mDoszdHYGjj4pXsvZxLBjNPY=;
 b=LBTBvo4zvgMilZ64iUM4JXrfebPu28YFfCKAAwHonY0/bzs3YnS1BgyB+auHhRHHJWXV
 DXPlV+SYzulRslsYISPu5b0fp7mQFlZpnjU74SuXfK5DpUd61qJNMMEohCfoe0vhksOp
 XaMaP/OL9XllayrrVNcXDIvMy3jE7uP80MH3Iavh/2ziVDei7l1WC8BtQMgJxZO8Kg1J
 tRVMmrDou54FkHk1hfW9/H3buNZ31Y0kv+tkuZTYup+9A+2cdV1BtyEGIrzpKYlwDz4M
 8m9pscbW6/F9DIBvhmAfogVSIVKk5UkWDRLdY0+aQ59o4A+NjemEh16cUtQXBGHfb0nw ww== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppbkbptb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 02:17:29 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 02:17:29 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH 3/4] xfce4-terminal: 1.0.0 -> 1.0.4
Date: Fri, 7 Apr 2023 17:17:21 +0800
Message-ID: <20230407091722.5576-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230407091722.5576-1-kai.kang@windriver.com>
References: <20230407091722.5576-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: cQAUCgOgC1LgaBT6dGX2_M9S2wtT7nki
X-Proofpoint-ORIG-GUID: cQAUCgOgC1LgaBT6dGX2_M9S2wtT7nki
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_05,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=835 phishscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070086
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 09:17:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101980

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{xfce4-terminal_1.0.0.bb => xfce4-terminal_1.0.4.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-terminal/{xfce4-terminal_1.0.0.bb => xfce4-terminal_1.0.4.bb} (80%)

diff --git a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.0.bb b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.4.bb
similarity index 80%
rename from meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.0.bb
rename to meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.4.bb
index 85b0812ed..edb0c614e 100644
--- a/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.0.bb
+++ b/meta-xfce/recipes-apps/xfce4-terminal/xfce4-terminal_1.0.4.bb
@@ -10,6 +10,6 @@ FILES:${PN} += " \
     ${datadir}/gnome-control-center \
 "
 
-SRC_URI[sha256sum] = "593b6a7bd9b18851e51854e075990109b7896a22713b5dd8b913b23f21db6576"
+SRC_URI[sha256sum] = "78e55957af7c6fc1f283e90be33988661593a4da98383da1b0b54fdf6554baf4"
 
 RRECOMMENDS:${PN} += "vte-prompt"
-- 
2.17.1


