Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5759BC76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 10:23:24 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4202.1680862999607752313
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Apr 2023 03:23:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=A8AK149z;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34613e1654=kai.kang@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3379mJLi024598
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Apr 2023 03:23:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-type; s=PPS06212021;
 bh=NVYHBvP/Qxn9jE4TAbToSzH1AgwNpeP+2o2rBqC26nA=;
 b=A8AK149z4Zm3O9y6SnUzt3/TjNvPldJHo3cX6eZv2uzP9SNzOQL7x0IzGKIpBxmooWcG
 0lrfOTw202AVYzAEux5R4i/JdVS3glnIGl+/W10haSn7tAIkiN3t7Lh1QlATXZEv1Cru
 zWA7Hyi1b8C+9JBW1C4qJSmEmevQXaTKwQpYN6/iELtwqJHf1iYjVMd0BP1yblOf0EvW
 N/Cb+Er/ozDbW5iTBUVn3PyPTB+OQWGT30IoGZ4lfC9vcFN9tZvPW5ub1u7ET4DQuHhW
 uZIN0ySjrDF8rIEmwnJTO7jb5u86RaiPmPHQydSrdOR7dok2edJYfC5xWsS8P+1CFqF/ NA== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ppfw6xqs9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 03:23:19 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 7 Apr 2023 03:23:18 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 7 Apr 2023 03:23:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] syslog-ng: not deliver syslog-ng-update-virtualenv
Date: Fri, 7 Apr 2023 18:23:02 +0800
Message-ID: <20230407102302.10870-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bAl3b8tGUwWVUgXUfwWdql1_GJXdEUp9
X-Proofpoint-GUID: bAl3b8tGUwWVUgXUfwWdql1_GJXdEUp9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_06,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 impostorscore=0
 adultscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070096
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Apr 2023 10:23:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101982

From: Kai Kang <kai.kang@windriver.com>

syslog-ng-update-virtualenv causes install conflict when multilib
enabled:

Error: Transaction test error:
  file /usr/bin/syslog-ng-update-virtualenv conflicts between attempted
  installs of lib32-syslog-ng-4.0.1-r0.core2_32 and syslog-ng-4.0.1-r0.core2_64

Since python support is disabled, not deliver it.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
index 4521593ed..650c7bd5f 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.0.1.bb
@@ -85,6 +85,10 @@ do_install:append() {
     # Remove /var/run as it is created on startup
     rm -rf ${D}${localstatedir}/run
 
+    # it causes install conflict when multilib enabled
+    # since python support is disabled, not deliver it
+    rm -f ${D}${bindir}/syslog-ng-update-virtualenv
+
     # support for systemd
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
         install -m 644 ${WORKDIR}/syslog-ng.conf.systemd ${D}${sysconfdir}/${BPN}/${BPN}.conf
-- 
2.17.1


