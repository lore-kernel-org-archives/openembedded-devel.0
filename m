Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E50EC27C55
	for <webhook@archiver.kernel.org>; Mon, 10 Jun 2024 11:38:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17275.1718019507323165453
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Jun 2024 04:38:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=68916c8570=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45A7pK1B003809
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:38:26 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwsjyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:38:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 04:38:25 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 04:38:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] xfwm4: fix gcc -Wincompatible-pointer-types
Date: Mon, 10 Jun 2024 19:38:22 +0800
Message-ID: <20240610113822.3231543-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: QBGS4GplFPMa4KJQH14QLqVhd98R0ufL
X-Proofpoint-ORIG-GUID: QBGS4GplFPMa4KJQH14QLqVhd98R0ufL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_02,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=883 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406100088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Jun 2024 11:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110796

From: Kai Kang <kai.kang@windriver.com>

Fix xfwm4 incompatible pointer type error with gcc option -Wincompatible-pointer-types:

| ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing argument
      2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type
      [-Wincompatible-pointer-types]
|   139 |     sn_startup_sequence_get_last_active_time (sequence, &l_sec, &l_usec);
|       |                                                         ^~~~~~
|       |                                                         |
|       |                                                         long int *

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-fix-incompatible-pointer-type-error.patch | 34 +++++++++++++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb  |  2 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointer-type-error.patch

diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointer-type-error.patch b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 000000000..eb8fa7c43
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4/xfwm4-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,34 @@
+Fix xfwm4 incompatible pointer type error:
+
+| ../../xfwm4-4.18.0/src/startup_notification.c:139:57: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
+|   139 |     sn_startup_sequence_get_last_active_time (sequence, &l_sec, &l_usec);
+|       |                                                         ^~~~~~
+|       |                                                         |
+|       |                                                         long int *
+| In file included from .../usr/include/startup-notification-1.0/libsn/sn.h:32,
+|                  from ../../xfwm4-4.18.0/src/startup_notification.c:33:
+| .../usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: note: expected 'time_t *' {aka 'long long int *'} but argument is of type 'long int *'
+|    84 |                                                            time_t            *tv_sec,
+|       |                                                            ~~~~~~~~~~~~~~~~~~~^~~~~~
+
+Upsteam-Status: Submitted [https://gitlab.xfce.org/xfce/xfwm4/-/issues/790]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ src/startup_notification.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/startup_notification.c b/src/startup_notification.c
+index 2a08cad..05434ca 100644
+--- a/src/startup_notification.c
++++ b/src/startup_notification.c
+@@ -136,7 +136,7 @@ sn_collect_timed_out_foreach (void *element, void *data)
+ 
+     sequence = element;
+     ctod = (CollectTimedOutData *) data;
+-    sn_startup_sequence_get_last_active_time (sequence, &l_sec, &l_usec);
++    sn_startup_sequence_get_last_active_time (sequence, (time_t *)&l_sec, &l_usec);
+     tv_sec = l_sec; tv_usec = l_usec;
+ 
+     elapsed = ((double) ctod->now - (tv_sec * G_USEC_PER_SEC) - tv_usec)
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
index 839f1c870..2770829e9 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.18.0.bb
@@ -8,6 +8,8 @@ inherit xfce update-alternatives features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://xfwm4-fix-incompatible-pointer-type-error.patch"
+
 SRC_URI[sha256sum] = "92cd1b889bb25cb4bc06c1c6736c238d96e79c1e706b9f77fad0a89d6e5fc13f"
 
 PACKAGECONFIG ?= " \
-- 
2.34.1


