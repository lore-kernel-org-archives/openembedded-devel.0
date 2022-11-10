Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9114BC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:47:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4909.1668070032509772912
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:47:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=qLLaK1gN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA7K8aT003579
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=wf1y5ctmTjDDE3zR73k16UslUbHG27xNBZimYWw2BhQ=;
 b=qLLaK1gN0cl9douGeohZjNwRr8VfdTNu3tEoaaG3en4ciz3O5H2sI65CrVVCs7yW7Ux0
 kPatzWcxjgeQVn2sk8OrJuHkfhYwmZ5Bwm+T9U4Mk9gJaR/HT5Jpkak0PyyfdpVgxbFk
 wGCEyGGjfKTW0jzpOAqOdcC9WQSMs2boUIjxvClp0ASscP8oNtAzPmlKuEVdOjRQ7GwQ
 XJYCqRyq2wlA7eZThMK8j0OHy6hE5jrWoY81jAM7EptmZPUQr3iVktmGwV/rlySNBD3W
 75miPXCAlpH01UI3R6WZ2LXP5FaQ+oAAPvbpJuv/o8ge/Fp8W2C2AITtlfl+CVW8z8TI Yw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knd21mj7h-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:11 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 10 Nov 2022 00:47:10 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:47:09 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 13/14] evince: add opengl to REQUIRED_DISTRO_FEATURES
Date: Thu, 10 Nov 2022 16:46:54 +0800
Message-ID: <20221110084655.1714051-13-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110084655.1714051-1-mingli.yu@windriver.com>
References: <20221110084655.1714051-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: fFxKmZvqSv4qVc_WqQ5v7eE-XsxsGeHL
X-Proofpoint-ORIG-GUID: fFxKmZvqSv4qVc_WqQ5v7eE-XsxsGeHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=652 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99544

From: Mingli Yu <mingli.yu@windriver.com>

Add opengl to REQUIRED_DISTRO_FEATURES if x11 is enabled in DISTRO_FEATURES
as it needs gnome-desktop when x11 enabled.

Fixes:
  ERROR: Nothing PROVIDES 'gnome-desktop' (but /build/layers/meta-openembedded/meta-gnome/recipes-gnome/evince/evince_42.3.bb DEPENDS on or otherwise requires it)
  gnome-desktop was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'evince', 'gnome-desktop']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-gnome/evince/evince_42.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince_42.3.bb b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
index 0c97f75e9..5f35d5b33 100644
--- a/meta-gnome/recipes-gnome/evince/evince_42.3.bb
+++ b/meta-gnome/recipes-gnome/evince/evince_42.3.bb
@@ -19,7 +19,9 @@ DEPENDS = " \
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gtk-doc
+inherit gnomebase itstool gnome-help pkgconfig gsettings gobject-introspection gettext mime-xdg gtk-doc features_check
+
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'opengl', '', d)}"
 
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
-- 
2.25.1


