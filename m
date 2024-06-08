Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 516D6C27C6E
	for <webhook@archiver.kernel.org>; Sat,  8 Jun 2024 16:51:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.1604.1717865477279034261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Jun 2024 09:51:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=688978f826=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 458GcZKB013509
	for <openembedded-devel@lists.openembedded.org>; Sat, 8 Jun 2024 16:51:16 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ymcgwrduu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 16:51:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 8 Jun 2024 09:51:15 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sat, 8 Jun 2024 09:51:14 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH] libwnck/libwnck3: fix incompatible pointer type error
Date: Sun, 9 Jun 2024 00:51:12 +0800
Message-ID: <20240608165112.760050-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7FIEv33H2DLlfKYSB1Il5uxLYxW4Cw4P
X-Proofpoint-ORIG-GUID: 7FIEv33H2DLlfKYSB1Il5uxLYxW4Cw4P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-08_10,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 bulkscore=0 spamscore=0 mlxlogscore=819 lowpriorityscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2405170001 definitions=main-2406080127
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Jun 2024 16:51:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110780

From: Kai Kang <kai.kang@windriver.com>

Update tasklist.c to fix incompatible pointer type error:

| libwnck/tasklist.c:4355:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time'
     from incompatible pointer type [-Wincompatible-pointer-types]
|  4355 |                                                 &tv_sec, &tv_usec);
|       |                                                 ^~~~~~~
|       |                                                 |
|       |                                                 long int *

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...-fix-incompatible-pointer-type-error.patch | 29 +++++++++++++++++
 ...-fix-incompatible-pointer-type-error.patch | 31 +++++++++++++++++++
 .../recipes-gnome/libwnck/libwnck3_43.0.bb    |  3 ++
 .../recipes-gnome/libwnck/libwnck_2.31.0.bb   |  1 +
 4 files changed, 64 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/libwnck-fix-incompatible-pointer-type-error.patch
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/libwnck3-fix-incompatible-pointer-type-error.patch

diff --git a/meta-gnome/recipes-gnome/libwnck/files/libwnck-fix-incompatible-pointer-type-error.patch b/meta-gnome/recipes-gnome/libwnck/files/libwnck-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 000000000..59a4c09e6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/files/libwnck-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,29 @@
+Update tasklist.c to fix incompatible pointer type error:
+
+| libwnck/tasklist.c:4355:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time'
+     from incompatible pointer type [-Wincompatible-pointer-types]
+|  4355 |                                                 &tv_sec, &tv_usec);
+|       |                                                 ^~~~~~~
+|       |                                                 |
+|       |                                                 long int *
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ libwnck/tasklist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
+index 4f0c6c4..d3bdf96 100644
+--- a/libwnck/tasklist.c
++++ b/libwnck/tasklist.c
+@@ -4352,7 +4352,7 @@ sequence_timeout_callback (void *user_data)
+       WnckTask *task = WNCK_TASK (tmp->data);
+ 
+       sn_startup_sequence_get_last_active_time (task->startup_sequence,
+-                                                &tv_sec, &tv_usec);
++                                                (time_t *)&tv_sec, &tv_usec);
+       
+       elapsed =
+         ((((double)now.tv_sec - tv_sec) * G_USEC_PER_SEC +
diff --git a/meta-gnome/recipes-gnome/libwnck/files/libwnck3-fix-incompatible-pointer-type-error.patch b/meta-gnome/recipes-gnome/libwnck/files/libwnck3-fix-incompatible-pointer-type-error.patch
new file mode 100644
index 000000000..9ccd18d70
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/files/libwnck3-fix-incompatible-pointer-type-error.patch
@@ -0,0 +1,31 @@
+Update tasklist.c to fix incompatible pointer type error:
+
+| libwnck/tasklist.c: In function 'sequence_timeout_callback':
+| libwnck/tasklist.c:4922:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time'
+     from incompatible pointer type [-Wincompatible-pointer-types]
+|  4922 |                                                 &tv_sec, &tv_usec);
+|       |                                                 ^~~~~~~
+|       |                                                 |
+|       |                                                 long int *
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libwnck/-/merge_requests/56]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+---
+ libwnck/tasklist.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
+index b773247..f195074 100644
+--- a/libwnck/tasklist.c
++++ b/libwnck/tasklist.c
+@@ -4919,7 +4919,7 @@ sequence_timeout_callback (void *user_data)
+       WnckTask *task = WNCK_TASK (tmp->data);
+ 
+       sn_startup_sequence_get_last_active_time (task->startup_sequence,
+-                                                &tv_sec, &tv_usec);
++                                                (time_t *)&tv_sec, &tv_usec);
+ 
+       elapsed = (now - (tv_sec * G_USEC_PER_SEC + tv_usec)) / 1000.0;
+ 
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
index c7f798911..34944f45e 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck3_43.0.bb
@@ -19,6 +19,9 @@ inherit gnomebase gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
+
+SRC_URI += "file://libwnck3-fix-incompatible-pointer-type-error.patch"
+
 SRC_URI[archive.sha256sum] = "905bcdb85847d6b8f8861e56b30cd6dc61eae67ecef4cd994a9f925a26a2c1fe"
 
 # gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index d7f47002f..82900a8f4 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -12,6 +12,7 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://libwnck-fix-incompatible-pointer-type-error.patch"
 SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
 SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
 
-- 
2.34.1


