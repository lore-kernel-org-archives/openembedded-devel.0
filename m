Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 75AE070F28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 05:37:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9U5bNVN011525
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 22:37:24 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 22:37:23 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 13:37:25 +0800
Message-ID: <1414647447-26316-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 1/3][meta-webserver][v2] phpmyadmin: fix for Security Advisory CVE-2014-5273
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Oct 2014 05:37:33 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Multiple cross-site scripting (XSS) vulnerabilities in phpMyAdmin 4.0.x
before 4.0.10.2, 4.1.x before 4.1.14.3, and 4.2.x before 4.2.7.1 allow
remote authenticated users to inject arbitrary web script or HTML via the
(1) browse table page, related to js/sql.js; (2) ENUM editor page, related
to js/functions.js; (3) monitor page, related to js/server_status_monitor.js;
(4) query charts page, related to js/tbl_chart.js; or (5) table relations
page, related to libraries/tbl_relation.lib.php.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5273

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...ug-4504-security-Self-XSS-in-query-charts.patch |   29 ++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch
new file mode 100644
index 0000000..27eac77
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch
@@ -0,0 +1,29 @@
+From 90ddeecf60fc029608b972e490b735f3a65ed0cb Mon Sep 17 00:00:00 2001
+From: Madhura Jayaratne <madhura.cj@gmail.com>
+Date: Sun, 17 Aug 2014 08:52:05 -0400
+Subject: [PATCH] bug #4504 [security] Self-XSS in query charts
+
+Upstream-status: Backport
+
+Signed-off-by: Marc Delisle <marc@infomarc.info>
+---
+ js/tbl_chart.js |    2 +-
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+ 4.2.7.0 (2014-07-31)
+diff --git a/js/tbl_chart.js b/js/tbl_chart.js
+index 943d4ae..04c9c40 100644
+--- a/js/tbl_chart.js
++++ b/js/tbl_chart.js
+@@ -47,7 +47,7 @@ function PMA_queryChart(data, columnNames, settings) {
+         },
+         axes : {
+             xaxis : {
+-                label : settings.xaxisLabel
++                label : escapeHtml(settings.xaxisLabel)
+             },
+             yaxis : {
+                 label : settings.yaxisLabel
+-- 
+1.7.10.4
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
index 0de3f6d..c267d89 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
+           file://0001-bug-4504-security-Self-XSS-in-query-charts.patch \
            file://apache.conf"
 
 SRC_URI[md5sum] = "0dcd755450dac819f33502590c88ad29"
-- 
1.7.10.4


