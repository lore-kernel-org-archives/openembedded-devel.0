Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D985AC3DA61
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 10:49:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.53618.1722250158753583965
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 03:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=89408abb87=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46T5sE92005770
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:49:18 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mp3x9nx6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:49:17 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 29 Jul 2024 03:49:15 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][scarthgap][PATCH 1/1] graphviz: fix CVE-2023-46045
Date: Mon, 29 Jul 2024 10:48:56 +0000
Message-ID: <20240729104856.1955362-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: xTLHrXmPcGRRG484qPe-ZikJxw0eY4Q1
X-Proofpoint-ORIG-GUID: xTLHrXmPcGRRG484qPe-ZikJxw0eY4Q1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407290073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:49:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111452

From: Yogita Urade <yogita.urade@windriver.com>

Graphviz 2.36 before 10.0.0 has an out-of-bounds read via a
crafted config6a file. NOTE: exploitability may be uncommon
because this file is typically owned by root.

CVE-2023-46045-0003.patch is the CVE fix and CVE-2023-46045-0001.patch,
CVE-2023-46045-0002.patch are dependent commits to fix the CVE.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-46045

Upstream patches:
https://gitlab.com/graphviz/graphviz/-/commit/361f274ca901c3c476697a6404662d95f4dd43cb
https://gitlab.com/graphviz/graphviz/-/commit/3f31704cafd7da3e86bb2861accf5e90c973e62a
https://gitlab.com/graphviz/graphviz/-/commit/a95f977f5d809915ec4b14836d2b5b7f5e74881e

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../graphviz/CVE-2023-46045-0001.patch        | 37 ++++++++++++++++++
 .../graphviz/CVE-2023-46045-0002.patch        | 38 +++++++++++++++++++
 .../graphviz/CVE-2023-46045-0003.patch        | 33 ++++++++++++++++
 .../graphviz/graphviz_8.1.0.bb                |  3 ++
 4 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0001.patch
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0002.patch
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0003.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0001.patch b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0001.patch
new file mode 100644
index 000000000..7b177370d
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0001.patch
@@ -0,0 +1,37 @@
+From 361f274ca901c3c476697a6404662d95f4dd43cb Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 24 Jul 2024 13:19:03 +0800
+Subject: [PATCH] gvc gvconfig_plugin_install_from_config: more tightly scope
+ 'gv_api'
+
+CVE: CVE-2023-46045
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/361f274ca901c3c476697a6404662d95f4dd43cb]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/gvc/gvconfig.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/gvc/gvconfig.c b/lib/gvc/gvconfig.c
+index d03de09..2f31b98 100644
+--- a/lib/gvc/gvconfig.c
++++ b/lib/gvc/gvconfig.c
+@@ -174,7 +174,6 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+ {
+     char *package_path, *name, *api;
+     const char *type;
+-    api_t gv_api;
+     int quality;
+     int nest = 0;
+     gvplugin_package_t *package;
+@@ -189,7 +188,7 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+         package = gvplugin_package_record(gvc, package_path, name);
+	do {
+	    api = token(&nest, &s);
+-	    gv_api = gvplugin_api(api);
++	    const api_t gv_api = gvplugin_api(api);
+	    do {
+		if (nest == 2) {
+		    type = token(&nest, &s);
+--
+2.25.1
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0002.patch b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0002.patch
new file mode 100644
index 000000000..fbab10bb3
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0002.patch
@@ -0,0 +1,38 @@
+From 3f31704cafd7da3e86bb2861accf5e90c973e62a Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 24 Jul 2024 13:39:39 +0800
+Subject: [PATCH] gvc gvconfig_plugin_install_from_config: more tightly scope
+ 'api'
+
+CVE: CVE-2023-46045
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/3f31704cafd7da3e86bb2861accf5e90c973e62a]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/gvc/gvconfig.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gvc/gvconfig.c b/lib/gvc/gvconfig.c
+index 2f31b98..ea0d81b 100644
+--- a/lib/gvc/gvconfig.c
++++ b/lib/gvc/gvconfig.c
+@@ -172,7 +172,7 @@ static char *token(int *nest, char **tokens)
+
+ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+ {
+-    char *package_path, *name, *api;
++    char *package_path, *name;
+     const char *type;
+     int quality;
+     int nest = 0;
+@@ -187,7 +187,7 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+	    name = "x";
+         package = gvplugin_package_record(gvc, package_path, name);
+	do {
+-	    api = token(&nest, &s);
++	    const char *api = token(&nest, &s);
+	    const api_t gv_api = gvplugin_api(api);
+	    do {
+		if (nest == 2) {
+--
+2.25.1
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0003.patch b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0003.patch
new file mode 100644
index 000000000..372f44efe
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-0003.patch
@@ -0,0 +1,33 @@
+From a95f977f5d809915ec4b14836d2b5b7f5e74881e Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Wed, 24 Jul 2024 15:02:06 +0800
+Subject: [PATCH] gvc: detect plugin installation failure and display an error
+
+Gitlab: fixes #2441
+Reported-by: GJDuck
+
+CVE: CVE-2023-46045
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/a95f977f5d809915ec4b14836d2b5b7f5e74881e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/gvc/gvconfig.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/gvc/gvconfig.c b/lib/gvc/gvconfig.c
+index ea0d81b..1eccc70 100644
+--- a/lib/gvc/gvconfig.c
++++ b/lib/gvc/gvconfig.c
+@@ -189,6 +189,10 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+	do {
+	    const char *api = token(&nest, &s);
+	    const api_t gv_api = gvplugin_api(api);
++	    if (gv_api == (api_t)-1) {
++		agerr(AGERR, "config error: %s %s not found\n", package_path, api);
++		return 0;
++	    }
+	    do {
+		if (nest == 2) {
+		    type = token(&nest, &s);
+--
+2.25.1
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
index 2700142e5..b3f02148b 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
@@ -20,6 +20,9 @@ inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
            file://0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch \
+           file://CVE-2023-46045-0001.patch \
+           file://CVE-2023-46045-0002.patch \
+           file://CVE-2023-46045-0003.patch \
            "
 # Use native mkdefs
 SRC_URI:append:class-target = "\
-- 
2.40.0


