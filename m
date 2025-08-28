Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F977CA0FF2
	for <webhook@archiver.kernel.org>; Thu, 28 Aug 2025 04:55:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.13582.1756356892032693655
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Aug 2025 21:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oVAiFBCr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=03356deeff=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57S4jcRt3160620
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 21:54:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2fF5OvQwhJEMvwpYRr/h
	AkyultYxe9JKpDX8nVdoYXc=; b=oVAiFBCrDMvfAiTDdSFvTdKX0jJyD/gXggBs
	czmDVn+k3XL4wqjcyY6nU2wkgIjAAWOorAS0vSjhpxs6Oms+mKtZVkXzWIDPB1A5
	2XqXpHEvrqK68ZT8I6ZZURb3jmsJ6hfr38jWSgo0g5Q+Q8tyu0ENUB/A1v/A4z/r
	HmZbu/INEwMUraLjVAIN5HCo/Tx2Z8CLRmd9g9e5+LOLRR8R/3BQJVJ+H6UTHgKK
	wxQ1DsTmAdznwP2nbOeMnyvBsavBuPJy0DABg7c+VODgSoQa2oLZ0uaKTR6gM0KK
	jm8laH5Q9cnZBj8n5hi3Nt+IIJGz6ZrmB8noE5nFkGDvd/lbRQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x25a80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 Aug 2025 21:54:50 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 27 Aug 2025 21:54:50 -0700
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 27 Aug 2025 21:54:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome][PATCH 1/2] libwnck: fix build failure for lib32-libwnck
Date: Thu, 28 Aug 2025 12:54:47 +0800
Message-ID: <20250828045448.3704256-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: blqUAG8zU9l6L3Ch_0ACEGg88z5QCK6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDAzOSBTYWx0ZWRfX439erVnBwFKt
 AABmcOkmor8nNTt4HNJggq6t2LvI/UwC078oK1j1DF0W5X1jWSdE4gkRsYd74EsBkGFrKvj2Hfp
 Z/No0w6ylg+nuXtAvGyj+zb1fXQSEkWVaGtHbPHzTCY9LPzrxsjPVPhGqQy8V49W8cFiBX4Z8EZ
 06mJBUR8VLw7M/N0h1hugBiT65076Ze/Tbj1O+vXuYitf59B8/4b++z7d2hsNjklAV7bcQB8wVx
 4E8rRBPhRGtPHLxbABvGbb2ymlZJuFwMsEkSxg37bQ282Yy2B7BMmM2NhEYU9/mCkh4IqWDvH0d
 cIOdnXr9GniEMBtW00jxrktsUY2TxAInlSsN7E2qfzF5sgkRqWc7ZGouLZ9q2o=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68afe11a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=3zWaOi4xM0j_92VHmIgA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: blqUAG8zU9l6L3Ch_0ACEGg88z5QCK6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 04:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119125

From: Changqing Li <changqing.li@windriver.com>

Fix the following compile error:
../../sources/libwnck-2.31.0/libwnck/tasklist.c:4355:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
 4355 |                                                 &tv_sec, &tv_usec);
      |                                                 ^~~~~~~
      |                                                 |
      |                                                 long int *
In file included from /build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn.h:32,
                 from ../../sources/libwnck-2.31.0/libwnck/private.h:36,
                 from ../../sources/libwnck-2.31.0/libwnck/tasklist.c:40:
/build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: note: expected 'time_t *' {aka 'long long int *'} but argument is of type 'long int *'
   84 |                                                            time_t            *tv_sec,
      |                                                            ~~~~~~~~~~~~~~~~~~~^~~~~~

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...ix-Wincompatible-pointer-types-error.patch | 42 +++++++++++++++++++
 .../recipes-gnome/libwnck/libwnck_2.31.0.bb   |  2 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch

diff --git a/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
new file mode 100644
index 0000000000..4e23f613aa
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libwnck/files/0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch
@@ -0,0 +1,42 @@
+From 01d9add9f9c25442329879d1c3513c68ed14a749 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 28 Aug 2025 10:29:59 +0800
+Subject: [PATCH] tasklist.c: fix -Wincompatible-pointer-types error
+
+Fix the following compile error:
+../../sources/libwnck-2.31.0/libwnck/tasklist.c:4355:49: error: passing argument 2 of 'sn_startup_sequence_get_last_active_time' from incompatible pointer type [-Wincompatible-pointer-types]
+ 4355 |                                                 &tv_sec, &tv_usec);
+      |                                                 ^~~~~~~
+      |                                                 |
+      |                                                 long int *
+In file included from /build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn.h:32,
+                 from ../../sources/libwnck-2.31.0/libwnck/private.h:36,
+                 from ../../sources/libwnck-2.31.0/libwnck/tasklist.c:40:
+/build/tmp/work/core2-32-wrsmllib32-linux/lib32-libwnck/2.31.0/lib32-recipe-sysroot/usr/include/startup-notification-1.0/libsn/sn-monitor.h:84:79: note: expected 'time_t *' {aka 'long long int *'} but argument is of type 'long int *'
+   84 |                                                            time_t            *tv_sec,
+      |                                                            ~~~~~~~~~~~~~~~~~~~^~~~~~
+
+Upstream-Status: Inappropriate [ Latest master don't have this code ]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ libwnck/tasklist.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libwnck/tasklist.c b/libwnck/tasklist.c
+index 4f0c6c4..758fc5f 100644
+--- a/libwnck/tasklist.c
++++ b/libwnck/tasklist.c
+@@ -4340,7 +4340,8 @@ sequence_timeout_callback (void *user_data)
+   WnckTasklist *tasklist = user_data;
+   GList *tmp;
+   GTimeVal now;
+-  long tv_sec, tv_usec;
++  long long tv_sec;
++  long tv_usec;
+   double elapsed;
+ 
+   g_get_current_time (&now);
+-- 
+2.34.1
+
diff --git a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
index d7f47002f8..5552d2e2b9 100644
--- a/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
+++ b/meta-gnome/recipes-gnome/libwnck/libwnck_2.31.0.bb
@@ -12,6 +12,8 @@ GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gobject-introspection features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://0001-tasklist.c-fix-Wincompatible-pointer-types-error.patch"
+
 SRC_URI[archive.md5sum] = "f03e1139296e2a3a92e3b65a3080cd32"
 SRC_URI[archive.sha256sum] = "83f732d20781fc88b22cdc6aaf2d4f388db6d3d4ff28d1a8fd45be9fb7743a9e"
 
-- 
2.34.1


