Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6754C46467
	for <webhook@archiver.kernel.org>; Thu,  5 Jan 2023 00:54:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2077.1672880072421966213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 16:54:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=eIRGGVm7;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=036985b30f=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3050T5Vm007819
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Jan 2023 00:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=q49Lg8T2K4tr5lM57gS0e0+96bRS8oJgJ4d6CiCB1zE=;
 b=eIRGGVm7BPby9nH9HUcMUctf6JkAHAs/W37pXtMhjnYqrHf0SSsHzXf+JtBkEN27tied
 GSmRP14zyVZHhnljtOarVCFj47PA+1JS1dOiNENHetu/1ASl3mNgJn+/iLOnFSa5B3Xi
 xcNcorY463GBAZiNgL+gquMdv0x+F4YtUFr3tI3jDk7ayOxQutFxTLYYyZg210KSsu9N
 4LbDBeAVtaJkDp7TqTwGtSXSzVkEnwhoNNl1Iha0NeFsYreXKc5g9vLN8ovroaRc19SY
 o6Vr1YLz3G2ciRM+ENIelg1Mjf8eg0V+PRZvfDDPDTQcjIGtk6Bh0gXwUZ+nbxB0MDPP Hw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mtaa2ju6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 00:54:31 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 4 Jan 2023 16:54:30 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 4 Jan 2023 16:54:29 -0800
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [kirkstone][meta-oe][PATCH] zabbix: fix CVE-2022-43515,CVE-2022-46768
Date: Thu, 5 Jan 2023 08:54:29 +0800
Message-ID: <20230105005429.1197627-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: TdSGxK1D-THDhjqMfwUwrwv8AKEGkoNw
X-Proofpoint-GUID: TdSGxK1D-THDhjqMfwUwrwv8AKEGkoNw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050005
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Jan 2023 00:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100406

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../zabbix/zabbix/CVE-2022-43515.patch        | 37 +++++++++++++
 .../zabbix/zabbix/CVE-2022-46768.patch        | 53 +++++++++++++++++++
 .../zabbix/zabbix_5.4.12.bb                   |  2 +
 3 files changed, 92 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-43515.patch
 create mode 100644 meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-46768.patch

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-43515.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-43515.patch
new file mode 100644
index 0000000000..6028520923
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-43515.patch
@@ -0,0 +1,37 @@
+From 6b5dfdb31aa503bb0358784c632ff3a04e7a8ff4 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 4 Jan 2023 13:51:03 +0800
+Subject: [PATCH] [DEV-2301] fixed spoofing X-Forwarded-For request header
+ allows to access Frontend in maintenace mode
+
+Upstream-Status: Backport [https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/50668e9d64af32cdc67a45082c556699ff86565e]
+CVE: CVE-2022-43515
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ ui/include/classes/user/CWebUser.php | 6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/ui/include/classes/user/CWebUser.php b/ui/include/classes/user/CWebUser.php
+index e6e651e..bfacce7 100644
+--- a/ui/include/classes/user/CWebUser.php
++++ b/ui/include/classes/user/CWebUser.php
+@@ -231,13 +231,11 @@ class CWebUser {
+ 	}
+ 
+ 	/**
+-	 * Get user ip address.
++	 * Get user IP address.
+ 	 *
+ 	 * @return string
+ 	 */
+ 	public static function getIp(): string {
+-		return (array_key_exists('HTTP_X_FORWARDED_FOR', $_SERVER) && $_SERVER['HTTP_X_FORWARDED_FOR'] !== '')
+-			? $_SERVER['HTTP_X_FORWARDED_FOR']
+-			: $_SERVER['REMOTE_ADDR'];
++		return $_SERVER['REMOTE_ADDR'];
+ 	}
+ }
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-46768.patch b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-46768.patch
new file mode 100644
index 0000000000..debd0aaa8e
--- /dev/null
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix/CVE-2022-46768.patch
@@ -0,0 +1,53 @@
+From 7373f92c80eb89941428468cd6b9d5c8879a7f93 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 4 Jan 2023 14:23:34 +0800
+Subject: [PATCH] [DEV-2283] added validation of the scheduled report
+ generation URL to zabbix-web-service
+
+Upstream-Status: Backport [https://git.zabbix.com/projects/ZBX/repos/zabbix/commits/fdb03971867]
+CVE: CVE-2022-46768
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ .../zabbix_web_service/pdf_report_creator.go   | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/go/cmd/zabbix_web_service/pdf_report_creator.go b/src/go/cmd/zabbix_web_service/pdf_report_creator.go
+index 391b58b..8452a3d 100644
+--- a/src/go/cmd/zabbix_web_service/pdf_report_creator.go
++++ b/src/go/cmd/zabbix_web_service/pdf_report_creator.go
+@@ -29,6 +29,7 @@ import (
+ 	"net/http"
+ 	"net/url"
+ 	"strconv"
++	"strings"
+ 	"time"
+ 
+ 	"github.com/chromedp/cdproto/emulation"
+@@ -123,6 +124,23 @@ func (h *handler) report(w http.ResponseWriter, r *http.Request) {
+ 		return
+ 	}
+ 
++	if u.Scheme != "http" && u.Scheme != "https" {
++		logAndWriteError(w, fmt.Sprintf("Unexpected URL scheme: \"%s\"", u.Scheme), http.StatusBadRequest)
++		return
++	}
++
++	if !strings.HasSuffix(u.Path, "/zabbix.php") {
++		logAndWriteError(w, fmt.Sprintf("Unexpected URL path: \"%s\"", u.Path), http.StatusBadRequest)
++		return
++	}
++
++	queryParams := u.Query()
++
++	if queryParams.Get("action") != "dashboard.print" {
++		logAndWriteError(w, fmt.Sprintf("Unexpected URL action: \"%s\"", queryParams.Get("action")), http.StatusBadRequest)
++		return
++	}
++
+ 	log.Tracef(
+ 		"making chrome headless request with parameters url: %s, width: %s, height: %s for report request from %s",
+ 		u.String(), req.Parameters["width"], req.Parameters["height"], r.RemoteAddr)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
index f5d89d6c3d..d72d3b1122 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_5.4.12.bb
@@ -26,6 +26,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.4/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
+    file://CVE-2022-43515.patch \
+    file://CVE-2022-46768.patch \
 "
 
 SRC_URI[md5sum] = "f295fd2df86143d72f6ff26e47d9e39e"
-- 
2.25.1


