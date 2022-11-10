Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDE0C4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 08:47:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.5081.1668070028751558245
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 10 Nov 2022 00:47:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZiYLLmzS;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=83133c4ff4=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AA8ISvV024773
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PPS06212021;
 bh=MhzTnXXWmhlfWFwDrd0808LeiLREmlLqvUKpGhvD0ZA=;
 b=ZiYLLmzS11kp46QJoJajXH2LehiPhOAuoUukGuJmQ9V+FRw9IKt++hgeeeQqR4T8zRHV
 8g51CvhpHH/KHjoimr0yAk7ndcaKIHDWcItyjaWrD7PU/v9Y4VFcfu05YDRXWIYoCvA6
 bRZ06+2AQTnkXjpiO9ooo3lqI4JHardPuKivvvw9TBXOUwhjszyaJWzUwI+ZtPccVf3R
 zoy2Jvkc5+G9FLSSCoza4kh7GpJ+akb03+K+hcKBzhhZhIxdOBG54GB1hQQ7+NRUypvv
 SmaNReAhkRk6H37FLeql4ywOAcNEDwg53C6u2sZfe3EoS7yTuxOy+vPo8TBnLi162//Y xw== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3knet9mfvs-6
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:08 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 10 Nov 2022 00:47:07 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 10 Nov 2022 00:47:06 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 10/14] ibus: add opengl related check
Date: Thu, 10 Nov 2022 16:46:51 +0800
Message-ID: <20221110084655.1714051-10-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110084655.1714051-1-mingli.yu@windriver.com>
References: <20221110084655.1714051-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: BzIXFn8yPk-r4rHAHnKTvkAo7ftpuJ6v
X-Proofpoint-ORIG-GUID: BzIXFn8yPk-r4rHAHnKTvkAo7ftpuJ6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-10_06,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211100065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 10 Nov 2022 08:47:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99541

From: Mingli Yu <mingli.yu@windriver.com>

Add opengl to REQUIRED_DISTRO_FEATURES when gtk4 is configured in
PACKAGECONFIG.

Fixes:
  ERROR: Nothing PROVIDES 'gtk4' (but /build/layers/meta-openembedded/meta-gnome/recipes-support/ibus/ibus.bb DEPENDS on or otherwise requires it)
  gtk4 was skipped: missing required distro feature 'opengl' (not in DISTRO_FEATURES)
  ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
  Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ibus', 'gtk4']

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-gnome/recipes-support/ibus/ibus.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-support/ibus/ibus.bb b/meta-gnome/recipes-support/ibus/ibus.bb
index be43d0d50..715608149 100644
--- a/meta-gnome/recipes-support/ibus/ibus.bb
+++ b/meta-gnome/recipes-support/ibus/ibus.bb
@@ -8,7 +8,7 @@ DEPENDS += " \
     iso-codes \
 "
 
-inherit gtk-icon-cache bash-completion
+inherit gtk-icon-cache bash-completion features_check
 
 # for unicode-ucd
 EXTRA_OECONF += "--with-ucd-dir=${STAGING_DATADIR}/unicode/ucd"
@@ -19,6 +19,8 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd wayland x11', d)} \
 "
 
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'gtk4', 'opengl', '', d)}"
+
 do_configure:prepend() {
     # run native unicode-parser
     sed -i 's:$(builddir)/unicode-parser:unicode-parser:g' ${S}/src/Makefile.am
-- 
2.25.1


