Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A643065DEB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 02:50:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9U2oTqO009664
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 19:50:29 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 19:50:28 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 10:50:30 +0800
Message-ID: <1414637431-19689-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1414637431-19689-1-git-send-email-rongqing.li@windriver.com>
References: <1414637431-19689-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3][meta-webserver] phpmyadmin: fix for Security Advisory CVE-2014-5274
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
X-List-Received-Date: Thu, 30 Oct 2014 02:50:31 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Cross-site scripting (XSS) vulnerability in the view operations page in
phpMyAdmin 4.1.x before 4.1.14.3 and 4.2.x before 4.2.7.1 allows remote
authenticated users to inject arbitrary web script or HTML via a crafted
view name, related to js/functions.js.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5274

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 ...4505-security-XSS-in-view-operations-page.patch |   43 ++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
new file mode 100644
index 0000000..164a072
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
@@ -0,0 +1,43 @@
+From 0cd293f5e13aa245e4a57b8d373597cc0e421b6f Mon Sep 17 00:00:00 2001
+From: Madhura Jayaratne <madhura.cj@gmail.com>
+Date: Sun, 17 Aug 2014 08:41:57 -0400
+Subject: [PATCH] bug #4505 [security] XSS in view operations page
+
+Upstream-Status: Backport
+
+Signed-off-by: Marc Delisle <marc@infomarc.info>
+---
+ ChangeLog       |    3 +++
+ js/functions.js |    2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 7afac1a..cec9d77 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,6 +1,9 @@
+ phpMyAdmin - ChangeLog
+ ======================
+ 
++4.2.7.1 (2014-08-17)
++- bug #4505 [security] XSS in view operations page
++
+ 4.2.7.0 (2014-07-31)
+ - bug       Broken links on home page
+ - bug #4494 Overlap in navigation panel
+diff --git a/js/functions.js b/js/functions.js
+index 09bfeda..a970a81 100644
+--- a/js/functions.js
++++ b/js/functions.js
+@@ -3585,7 +3585,7 @@ AJAX.registerOnload('functions.js', function () {
+         var question = PMA_messages.strDropTableStrongWarning + ' ';
+         question += $.sprintf(
+             PMA_messages.strDoYouReally,
+-            'DROP VIEW ' + PMA_commonParams.get('table')
++            'DROP VIEW ' + escapeHtml(PMA_commonParams.get('table'))
+         );
+ 
+         $(this).PMA_confirm(question, $(this).attr('href'), function (url) {
+-- 
+1.7.10.4
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
index c267d89..447b778 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://0001-bug-4504-security-Self-XSS-in-query-charts.patch \
+           file://0001-bug-4505-security-XSS-in-view-operations-page.patch \
            file://apache.conf"
 
 SRC_URI[md5sum] = "0dcd755450dac819f33502590c88ad29"
-- 
1.7.10.4


