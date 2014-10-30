Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E6B0D70A0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Oct 2014 02:50:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9U2oU83003672
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Oct 2014 19:50:30 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 29 Oct 2014 19:50:30 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 30 Oct 2014 10:50:31 +0800
Message-ID: <1414637431-19689-3-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1414637431-19689-1-git-send-email-rongqing.li@windriver.com>
References: <1414637431-19689-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3][meta-webserver] phpmyadmin: fix for Security Advisory CVE-2014-5274
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
 .../0001-Bug-4544-additional-fix-for-4.2.x.patch   |   29 ++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |    1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch
new file mode 100644
index 0000000..e23f94b
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch
@@ -0,0 +1,29 @@
+From 304fb2b645b36a39e03b954fdbd567173ebe6448 Mon Sep 17 00:00:00 2001
+From: Marc Delisle <marc@infomarc.info>
+Date: Wed, 1 Oct 2014 08:09:12 -0400
+Subject: [PATCH] Bug 4544: additional fix for 4.2.x
+
+Upstream-Status: Backport
+
+Signed-off-by: Marc Delisle <marc@infomarc.info>
+---
+ libraries/TableSearch.class.php |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/libraries/TableSearch.class.php b/libraries/TableSearch.class.php
+index a0b3fa4..b7eb42f 100644
+--- a/libraries/TableSearch.class.php
++++ b/libraries/TableSearch.class.php
+@@ -992,7 +992,8 @@ EOT;
+             $html_output .= '<td>' . $properties['collation'] . '</td>';
+             $html_output .= '<td>' . $properties['func'] . '</td>';
+             // here, the data-type attribute is needed for a date/time picker
+-            $html_output .= '<td data-type="' . $properties['type'] . '"'
++            $html_output .= '<td data-type="'
++                . htmlspecialchars($properties['type']) . '"'
+                 . '>' . $properties['value'] . '</td>';
+             $html_output .= '</tr>';
+             //Displays hidden fields
+-- 
+1.7.10.4
+
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
index 447b778..49ca7da 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
            file://0001-bug-4504-security-Self-XSS-in-query-charts.patch \
            file://0001-bug-4505-security-XSS-in-view-operations-page.patch \
+           file://0001-Bug-4544-additional-fix-for-4.2.x.patch \
            file://apache.conf"
 
 SRC_URI[md5sum] = "0dcd755450dac819f33502590c88ad29"
-- 
1.7.10.4


