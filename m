Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0797C52D6F
	for <webhook@archiver.kernel.org>; Wed,  7 Aug 2024 09:24:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.29472.1723022658141425588
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Aug 2024 02:24:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89493cfaed=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4777DGti011371
	for <openembedded-devel@lists.openembedded.org>; Wed, 7 Aug 2024 02:24:18 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0hv8854-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 02:24:17 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 02:24:17 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 02:24:16 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][master][PATCH 1/2] pavucontrol: update SRC_URI
Date: Wed, 7 Aug 2024 17:24:14 +0800
Message-ID: <20240807092415.287599-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: nsIkaP2NRRkL-Vo0yqONtwgm-Bnkkz5x
X-Proofpoint-GUID: nsIkaP2NRRkL-Vo0yqONtwgm-Bnkkz5x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-07_06,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 mlxlogscore=820 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408070065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Aug 2024 09:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111604

From: Changqing Li <changqing.li@windriver.com>

Server's https certificate isn't valid for freedesktop.org without www
prefix, refer [1]. Update SRC_URI to fix do_fetch warning

[1] https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/1537

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
index 012fc3a94..29500bdb9 100644
--- a/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
+++ b/meta-oe/recipes-multimedia/pulseaudio/pavucontrol_5.0.bb
@@ -14,7 +14,7 @@ inherit autotools features_check perlnative pkgconfig
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI = "http://freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
+SRC_URI = "http://www.freedesktop.org/software/pulseaudio/${BPN}/${BP}.tar.xz"
 SRC_URI:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-pavucontrol-remove-canberra-gtk-support.patch', '', d)}"
 
 SRC_URI[sha256sum] = "ce2b72c3b5f1a70ad0df19dd81750f9455bd20870d1d3a36d20536af2e8f4e7a"
-- 
2.25.1


