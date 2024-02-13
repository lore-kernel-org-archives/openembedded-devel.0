Return-Path: <meenali.gupta@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B71EC4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 11:13:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9114.1707822806232890413
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Feb 2024 03:13:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=K/UDr3AT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2773b4e514=meenali.gupta@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41D7LZef032409
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 11:13:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=z1BwW
	JG/TCZbpBPLjMpHH/tkLEPHwr2D9tw/ImgTEhw=; b=K/UDr3ATme8rlJNtJsb2g
	EryMpPi1xHtlln0LMtiEzcE52iGKCFNUUecgZqQtPUJFjJPGzL40TokqMqDvyPKs
	RDVsF0Yk/cclKM4E6GLstUfAGJvNS7CWsbZVYVsLifNtETSoNN4A7n8pgFvdvz+m
	6jeIbNL9RCGoM8pbecuWGl8F62gKDeGKliH76oH3ZhaH7i0geIYERTbVrZCfxHmv
	EggL7GcjjYoK3DDrSuV8C4o3vQdJ3Wp1uIDo2XGSAzu6n2LeKm/HgmXj+GesgBwM
	OX8d/8jimaQX4YaStoOKD+FP5PTRZ8JNbZyHLNY30zawqXWaUG6BUmM1Z10QSIxQ
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3w6046tjs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 11:13:25 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 13 Feb 2024 03:13:22 -0800
From: mgupta1 <meenali.gupta@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH 1/1] graphviz: fix CVE-2023-46045
Date: Tue, 13 Feb 2024 11:13:03 +0000
Message-ID: <20240213111303.1248285-1-meenali.gupta@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: baIjHoKXoalLSZVEaacp335jFqDOQVzd
X-Proofpoint-GUID: baIjHoKXoalLSZVEaacp335jFqDOQVzd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-13_06,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 phishscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401310000 definitions=main-2402130088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Feb 2024 11:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108725

From: Meenali Gupta <meenali.gupta@windriver.com>

Graphviz 2.36 before 10.0.0 has an out-of-bounds read via a crafted config6a file.
NOTE: exploitability may be uncommon because this file is typically owned by root.

Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
---
 .../graphviz/graphviz/CVE-2023-46045-1.patch  | 38 ++++++++++++++++++
 .../graphviz/graphviz/CVE-2023-46045-2.patch  | 39 +++++++++++++++++++
 .../graphviz/graphviz/CVE-2023-46045-3.patch  | 31 +++++++++++++++
 .../graphviz/graphviz_2.50.0.bb               |  3 ++
 4 files changed, 111 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch
 create mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch
new file mode 100644
index 000000000..a48f8aa06
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-1.patch
@@ -0,0 +1,38 @@
+From 361f274ca901c3c476697a6404662d95f4dd43cb Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Fri, 12 Jan 2024 17:06:17 +1100
+Subject: [PATCH] gvc gvconfig_plugin_install_from_config: more tightly scope 
+ 'gv_api'
+
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/361f274ca901c3c476697a6404662d95f4dd43cb]
+CVE: CVE-2023-46045
+ 
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/gvc/gvconfig.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/gvc/gvconfig.c b/lib/gvc/gvconfig.c
+index 2d86321..f9d1dcc 100644
+--- a/lib/gvc/gvconfig.c
++++ b/lib/gvc/gvconfig.c
+@@ -173,7 +173,6 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+ {
+     char *package_path, *name, *api;
+     const char *type;
+-    api_t gv_api;
+     int quality, rc;
+     int nest = 0;
+     gvplugin_package_t *package;
+@@ -188,7 +187,7 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+         package = gvplugin_package_record(gvc, package_path, name);
+ 	do {
+ 	    api = token(&nest, &s);
+-	    gv_api = gvplugin_api(api);
++	    const api_t gv_api = gvplugin_api(api);
+ 	    do {
+ 		if (nest == 2) {
+ 		    type = token(&nest, &s);
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch
new file mode 100644
index 000000000..4c70b1a87
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-2.patch
@@ -0,0 +1,39 @@
+From 3f31704cafd7da3e86bb2861accf5e90c973e62a Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Fri, 12 Jan 2024 17:06:17 +1100
+Subject: [PATCH] gvc gvconfig_plugin_install_from_config: more tightly scope 
+ 'api'
+
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/3f31704cafd7da3e86bb2861accf5e90c973e62a]
+CVE: CVE-2023-46045
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/gvc/gvconfig.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lib/gvc/gvconfig.c b/lib/gvc/gvconfig.c
+index f9d1dcc..95e8c6c 100644
+--- a/lib/gvc/gvconfig.c
++++ b/lib/gvc/gvconfig.c
+@@ -171,7 +171,7 @@ static char *token(int *nest, char **tokens)
+ 
+ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+ {
+-    char *package_path, *name, *api;
++    char *package_path, *name;
+     const char *type;
+     int quality, rc;
+     int nest = 0;
+@@ -186,7 +186,7 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+ 	    name = "x";
+         package = gvplugin_package_record(gvc, package_path, name);
+ 	do {
+-	    api = token(&nest, &s);
++	    const char *api = token(&nest, &s);
+ 	    const api_t gv_api = gvplugin_api(api);
+ 	    do {
+ 		if (nest == 2) {
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch
new file mode 100644
index 000000000..4746265ee
--- /dev/null
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/CVE-2023-46045-3.patch
@@ -0,0 +1,31 @@
+From a95f977f5d809915ec4b14836d2b5b7f5e74881e Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Fri, 12 Jan 2024 17:06:17 +1100
+Subject: [PATCH] gvc: detect plugin installation failure and display an error
+
+Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit/a95f977f5d809915ec4b14836d2b5b7f5e74881e]
+CVE: CVE-2023-46045
+
+Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
+---
+ lib/gvc/gvconfig.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/gvc/gvconfig.c b/lib/gvc/gvconfig.c
+index 95e8c6c..77d0865 100644
+--- a/lib/gvc/gvconfig.c
++++ b/lib/gvc/gvconfig.c
+@@ -188,6 +188,10 @@ static int gvconfig_plugin_install_from_config(GVC_t * gvc, char *s)
+ 	do {
+ 	    const char *api = token(&nest, &s);
+ 	    const api_t gv_api = gvplugin_api(api);
++	    if (gv_api == (api_t)-1) {
++		agerr(AGERR, "config error: %s %s not found\n", package_path, api);
++		return 0;
++	    }
+ 	    do {
+ 		if (nest == 2) {
+ 		    type = token(&nest, &s);
+-- 
+2.40.0
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index 4c51af669..f06e2adb0 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -20,6 +20,9 @@ DEPENDS:append:class-nativesdk = " ${BPN}-native"
 inherit autotools-brokensep pkgconfig gettext qemu
 
 SRC_URI = "https://gitlab.com/api/v4/projects/4207231/packages/generic/${BPN}-releases/${PV}/${BP}.tar.xz \
+	   file://CVE-2023-46045-1.patch \
+           file://CVE-2023-46045-2.patch \
+           file://CVE-2023-46045-3.patch \
            "
 # Use native mkdefs
 SRC_URI:append:class-target = "\
-- 
2.40.0


