Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 51F1A727A0
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jan 2015 09:32:25 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2015 01:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,683,1413270000"; d="scan'208";a="645538422"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2015 01:32:25 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jan 2015 09:32:06 +0000
Message-Id: <3fbae728d857536c37c0ae80e8571aee04bc2e13.1420190530.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420190530.git.paul.eggleton@linux.intel.com>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420190530.git.paul.eggleton@linux.intel.com>
References: <cover.1420190530.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 11/11] phpmyadmin: update to 4.3.4
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
X-List-Received-Date: Fri, 02 Jan 2015 09:32:27 -0000

Drop patches merged upstream.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../0001-Bug-4544-additional-fix-for-4.2.x.patch   | 29 ---------------
 ...ug-4504-security-Self-XSS-in-query-charts.patch | 29 ---------------
 ...4505-security-XSS-in-view-operations-page.patch | 43 ----------------------
 .../{phpmyadmin_4.2.7.bb => phpmyadmin_4.3.4.bb}   |  7 +---
 4 files changed, 2 insertions(+), 106 deletions(-)
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch
 delete mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
 rename meta-webserver/recipes-php/phpmyadmin/{phpmyadmin_4.2.7.bb => phpmyadmin_4.3.4.bb} (75%)

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch
deleted file mode 100644
index e23f94b..0000000
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-Bug-4544-additional-fix-for-4.2.x.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 304fb2b645b36a39e03b954fdbd567173ebe6448 Mon Sep 17 00:00:00 2001
-From: Marc Delisle <marc@infomarc.info>
-Date: Wed, 1 Oct 2014 08:09:12 -0400
-Subject: [PATCH] Bug 4544: additional fix for 4.2.x
-
-Upstream-Status: Backport
-
-Signed-off-by: Marc Delisle <marc@infomarc.info>
----
- libraries/TableSearch.class.php |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libraries/TableSearch.class.php b/libraries/TableSearch.class.php
-index a0b3fa4..b7eb42f 100644
---- a/libraries/TableSearch.class.php
-+++ b/libraries/TableSearch.class.php
-@@ -992,7 +992,8 @@ EOT;
-             $html_output .= '<td>' . $properties['collation'] . '</td>';
-             $html_output .= '<td>' . $properties['func'] . '</td>';
-             // here, the data-type attribute is needed for a date/time picker
--            $html_output .= '<td data-type="' . $properties['type'] . '"'
-+            $html_output .= '<td data-type="'
-+                . htmlspecialchars($properties['type']) . '"'
-                 . '>' . $properties['value'] . '</td>';
-             $html_output .= '</tr>';
-             //Displays hidden fields
--- 
-1.7.10.4
-
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch
deleted file mode 100644
index 27eac77..0000000
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4504-security-Self-XSS-in-query-charts.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 90ddeecf60fc029608b972e490b735f3a65ed0cb Mon Sep 17 00:00:00 2001
-From: Madhura Jayaratne <madhura.cj@gmail.com>
-Date: Sun, 17 Aug 2014 08:52:05 -0400
-Subject: [PATCH] bug #4504 [security] Self-XSS in query charts
-
-Upstream-status: Backport
-
-Signed-off-by: Marc Delisle <marc@infomarc.info>
----
- js/tbl_chart.js |    2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
- 4.2.7.0 (2014-07-31)
-diff --git a/js/tbl_chart.js b/js/tbl_chart.js
-index 943d4ae..04c9c40 100644
---- a/js/tbl_chart.js
-+++ b/js/tbl_chart.js
-@@ -47,7 +47,7 @@ function PMA_queryChart(data, columnNames, settings) {
-         },
-         axes : {
-             xaxis : {
--                label : settings.xaxisLabel
-+                label : escapeHtml(settings.xaxisLabel)
-             },
-             yaxis : {
-                 label : settings.yaxisLabel
--- 
-1.7.10.4
-
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
deleted file mode 100644
index 164a072..0000000
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/0001-bug-4505-security-XSS-in-view-operations-page.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 0cd293f5e13aa245e4a57b8d373597cc0e421b6f Mon Sep 17 00:00:00 2001
-From: Madhura Jayaratne <madhura.cj@gmail.com>
-Date: Sun, 17 Aug 2014 08:41:57 -0400
-Subject: [PATCH] bug #4505 [security] XSS in view operations page
-
-Upstream-Status: Backport
-
-Signed-off-by: Marc Delisle <marc@infomarc.info>
----
- ChangeLog       |    3 +++
- js/functions.js |    2 +-
- 2 files changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index 7afac1a..cec9d77 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -1,6 +1,9 @@
- phpMyAdmin - ChangeLog
- ======================
- 
-+4.2.7.1 (2014-08-17)
-+- bug #4505 [security] XSS in view operations page
-+
- 4.2.7.0 (2014-07-31)
- - bug       Broken links on home page
- - bug #4494 Overlap in navigation panel
-diff --git a/js/functions.js b/js/functions.js
-index 09bfeda..a970a81 100644
---- a/js/functions.js
-+++ b/js/functions.js
-@@ -3585,7 +3585,7 @@ AJAX.registerOnload('functions.js', function () {
-         var question = PMA_messages.strDropTableStrongWarning + ' ';
-         question += $.sprintf(
-             PMA_messages.strDoYouReally,
--            'DROP VIEW ' + PMA_commonParams.get('table')
-+            'DROP VIEW ' + escapeHtml(PMA_commonParams.get('table'))
-         );
- 
-         $(this).PMA_confirm(question, $(this).attr('href'), function (url) {
--- 
-1.7.10.4
-
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.3.4.bb
similarity index 75%
rename from meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
rename to meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.3.4.bb
index 7cc3604..76068e2 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.3.4.bb
@@ -6,13 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=eb723b61539feef013de476e68b5c50a \
                     file://libraries/tcpdf/LICENSE.TXT;md5=5c87b66a5358ebcc495b03e0afcd342c"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/phpmyadmin/phpMyAdmin/${PV}/phpMyAdmin-${PV}-all-languages.tar.xz \
-           file://0001-bug-4504-security-Self-XSS-in-query-charts.patch \
-           file://0001-bug-4505-security-XSS-in-view-operations-page.patch \
-           file://0001-Bug-4544-additional-fix-for-4.2.x.patch \
            file://apache.conf"
 
-SRC_URI[md5sum] = "0dcd755450dac819f33502590c88ad29"
-SRC_URI[sha256sum] = "5d101dd88a99a869bc0c684a7f687cf290abc4bf306daac73337cbde2d7743e4"
+SRC_URI[md5sum] = "f811243e241ee81defb97e014ca713ef"
+SRC_URI[sha256sum] = "91258e07e04e25c5e49284b194ebff8ffa807ad38832fbe802cc6af3f7cb96d3"
 
 S = "${WORKDIR}/phpMyAdmin-${PV}-all-languages"
 
-- 
1.9.3


