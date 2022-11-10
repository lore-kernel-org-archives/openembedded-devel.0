Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A5EC43217
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:47:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4910.1668070033366413939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:47:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kGS+phJZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA88q3X008736
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=af3EhnRqZsg9aN85OPQsnqPrA+FjZZOLizYxVNMqeko=;
 b=kGS+phJZlxV7Ukx64Wp1BtOIsljOAFUgHOdwHyqOdXnmBeO9pUihHkMXhdbctqMhfxq6
 cfROqjYQzee5YuRslRd+gVCWgGw6DlYB7xycKvyex3o/OPSFLK0CqLMu4LTaL3hUoCPr
 d1xuWNLuzoHGTJ061T1u8lwPSQDphIoKUAdQJ2oRg67wJSLeH9E3UOqyivgbZnmUuIze
 LRMtp3IMuhltCQa10H+c3SNQ/8dUCBvjARxLATRzJ6QA6PrtV4Z2HW90EWBqFZ4seueN
 IhYBkkOZ3jpembAzBjRH+Rm42HXeTYEg4mW/f8+LdFtGMp1uKuXNKSBNAfXTFDBk6k2L Og== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21mj7j-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:12 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 10 Nov 2022 00:47:11 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:47:10 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 14/14] gnome-calendar: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:46:55 +0800
Message-ID: <20221110084655.1714051-14-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110084655.1714051-1-mingli.yu@windriver.com>
References: <20221110084655.1714051-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: IajKsZLzSzw2n_7Mo1dwTGsVF7dyNQZ1
X-Proofpoint-ORIG-GUID: IajKsZLzSzw2n_7Mo1dwTGsVF7dyNQZ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=763 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99545

From: Mingli Yu <mingli.yu@windriver.com>

Fixes:
  ERROR: Nothing PROVIDES 'libadwaita' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb DEPENDS on or otherwise requires it)
  libadwaita was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'gnome-calendar', 'libadwaita']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
index 7b32be611..5498bb6ea 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_42.0.bb
@@ -20,7 +20,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
 
-REQUIRED_DISTRO_FEATURES = "x11"
+REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
 SRC_URI[archive.sha256sum] = "b63f73f55032fc1390442f94cdf6b3cab9c91c774ddd2e5c61ecfec9d2c5e9aa"
 
-- 
2.25.1


