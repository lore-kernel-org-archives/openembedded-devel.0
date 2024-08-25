Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FD9C5320E
	for <webhook@archiver.kernel.org>; Sun, 25 Aug 2024 18:27:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.37053.1724610470876007898
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Aug 2024 11:27:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8967a4d043=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47PIRorS013223;
	Sun, 25 Aug 2024 18:27:50 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4176g8s51v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 18:27:49 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 25 Aug 2024 11:27:48 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Sun, 25 Aug 2024 11:27:47 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] gtk+: Fix CVE-2024-6655
Date: Sun, 25 Aug 2024 18:27:43 +0000
Message-ID: <20240825182743.975774-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Gs4Q+V1C c=1 sm=1 tr=0 ts=66cb77a5 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=yoJbH4e0A30A:10 a=t7CeM3EgAAAA:8 a=PYnjg3YJAAAA:8 a=GHR8O2WEAAAA:20 a=20KFwNOVAAAA:8 a=n1dRnMMuAAAA:20
 a=h8Vg5cyLtMIz1cnDB1gA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=96-UuAdfYG6OSYlHWuPe:22
X-Proofpoint-GUID: 0KNDNtDqyhBB-sRZGIZBjNO6QUbvaTEn
X-Proofpoint-ORIG-GUID: 0KNDNtDqyhBB-sRZGIZBjNO6QUbvaTEn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-25_14,2024-08-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=707
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408250148
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Aug 2024 18:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111935

From: Soumya Sambu <soumya.sambu@windriver.com>

A flaw was found in the GTK library. Under certain conditions, it is possible for a
library to be injected into a GTK application from the current working directory.

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-6655

Upstream-patch:
https://gitlab.gnome.org/GNOME/gtk/-/commit/3bbf0b6176d42836d23c36a6ac410e807ec0a7a7

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../gtk+/gtk+/CVE-2024-6655.patch             | 40 +++++++++++++++++++
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch b/meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
new file mode 100644
index 000000000..dfa54f2f3
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/CVE-2024-6655.patch
@@ -0,0 +1,40 @@
+From 3bbf0b6176d42836d23c36a6ac410e807ec0a7a7 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Sat, 15 Jun 2024 14:18:01 -0400
+Subject: [PATCH] Stop looking for modules in cwd
+
+This is just not a good idea. It is surprising, and can be misused.
+
+Fixes: #6786
+
+CVE: CVE-2024-6655
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gtk/-/commit/3bbf0b6176d42836d23c36a6ac410e807ec0a7a7]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ gtk/gtkmodules.c | 9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
+index e09b583..e75810c 100644
+--- a/gtk/gtkmodules.c
++++ b/gtk/gtkmodules.c
+@@ -225,13 +225,8 @@ find_module (const gchar *name)
+   gchar *module_name;
+
+   module_name = _gtk_find_module (name, "modules");
+-  if (!module_name)
+-    {
+-      /* As last resort, try loading without an absolute path (using system
+-       * library path)
+-       */
+-      module_name = g_module_build_path (NULL, name);
+-    }
++  if (module_name == NULL)
++    return NULL;
+
+   module = g_module_open (module_name, G_MODULE_BIND_LOCAL | G_MODULE_BIND_LAZY);
+
+--
+2.40.0
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
index 5eac641cf..8b9f6723d 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -11,6 +11,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://strict-prototypes.patch \
            file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
            file://0001-Fix-signature-of-create_menu-function.patch \
+           file://CVE-2024-6655.patch \
            "
 
 SRC_URI[sha256sum] = "ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da"
-- 
2.40.0


