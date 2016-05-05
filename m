Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFAF6FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 08:05:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4585Juv001944
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 5 May 2016 01:05:19 -0700
Received: from pek-zchi-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Thu, 5 May 2016 01:05:17 -0700
From: Zhixiong Chi <Zhixiong.Chi@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 5 May 2016 16:05:31 +0800
Message-ID: <1462435531-5587-1-git-send-email-Zhixiong.Chi@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] phpmyadmin: Security Advisory-phpmyadmin-CVE-2016-2561
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 May 2016 08:05:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Backport patches from phpmyadmin upstream
<https://github.com/phpmyadmin/phpmyadmin> to fix CVE-2016-2561
<commit 37c34d089aa19f30d11203bb0c7f85b486424372>
<commit f33a42f1da9db943a67bda7d29f7dd91957a8e7e>
<commit 746240bd13b62b5956fc34389cfbdc09e1e67775>
<commit 983faa94f161df3623ecd371d3696a1b3f91c15f>
<commit bcd4ce8cba1272fca52f2331c08f2e3ac19cbbef>
<commit cc55f44a4a90147a007dee1aefa1cb529e23798b>

avoid remote authenticated users to inject arbitrary web script or
HTML via (1) normalization.php or (2) js/normalization.js in the database
normalization page, (3) templates/database/structure/sortable_header.phtml
in the database structure page, or (4) the pos parameter to
db_central_columns.php in the central columns page.

Signed-off-by: Zhixiong Chi <Zhixiong.Chi@windriver.com>
---
 .../phpmyadmin/phpmyadmin-CVE-2016-2561-2.patch    | 49 ++++++++++++++++++++++
 .../phpmyadmin/phpmyadmin-CVE-2016-2561-3.patch    | 20 +++++++++
 .../phpmyadmin/phpmyadmin-CVE-2016-2561-4.patch    | 40 ++++++++++++++++++
 .../phpmyadmin/phpmyadmin-CVE-2016-2561-5.patch    | 20 +++++++++
 .../phpmyadmin/phpmyadmin-CVE-2016-2561-6.patch    | 20 +++++++++
 .../phpmyadmin/phpmyadmin-CVE-2016-2561.patch      | 29 +++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb   |  6 +++
 7 files changed, 184 insertions(+)
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-2.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-3.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-4.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-5.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-6.patch
 create mode 100644 meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561.patch

diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-2.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-2.patch
new file mode 100644
index 0000000..8be4fba
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-2.patch
@@ -0,0 +1,49 @@
+Subject: [PATCH] Fix XSS in normalization.js
+
+Signed-off-by: Madhura Jayaratne <madhura.cj@gmail.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: phpMyAdmin-4.5.0.2-all-languages/js/functions.js
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/js/functions.js	2016-05-04 11:02:08.167888778 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/js/functions.js	2016-05-04 14:08:57.427966930 +0800
+@@ -220,6 +220,24 @@
+     }
+ }
+
++function escapeJsString(unsafe) {
++    if (typeof(unsafe) != 'undefined') {
++        return unsafe
++            .toString()
++            .replace("\000", '')
++            .replace('\\', '\\\\')
++            .replace('\'', '\\\'')
++            .replace("&#039;", "\\\&#039;")
++            .replace('"', '\"')
++            .replace("&quot;", "\&quot;")
++            .replace("\n", '\n')
++            .replace("\r", '\r')
++            .replace(/<\/script/gi, '</\' + \'script')
++    } else {
++        return false;
++    }
++}
++
+ function PMA_sprintf() {
+     return sprintf.apply(this, arguments);
+ }
+Index: phpMyAdmin-4.5.0.2-all-languages/js/normalization.js
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/js/normalization.js	2016-05-04 11:30:15.767900544 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/js/normalization.js	2016-05-04 14:20:40.943971835 +0800
+@@ -638,7 +638,7 @@
+                 '</ol>';
+             $("#newCols").html(confirmStr);
+             $('.tblFooters').html('<input type="submit" value="' + PMA_messages.strCancel + '" onclick="$(\'#newCols\').html(\'\');$(\'#extra input[type=checkbox]\').removeAttr(\'checked\')"/>' +
+-                '<input type="submit" value="' + PMA_messages.strGo + '" onclick="moveRepeatingGroup(\'' + repeatingCols + '\')"/>');
++                '<input type="submit" value="' + PMA_messages.strGo + '" onclick="moveRepeatingGroup(\'' + escapeJsString(escapeHtml(repeatingCols)) + '\')"/>');
+         }
+     });
+     $("#mainContent p").on("click", "#createPrimaryKey", function(event) {
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-3.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-3.patch
new file mode 100644
index 0000000..149eba3
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-3.patch
@@ -0,0 +1,20 @@
+Subject: [PATCH] Fix XSS in normalization
+
+Signed-off-by: Madhura Jayaratne <madhura.cj@gmail.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: phpMyAdmin-4.5.0.2-all-languages/normalization.php
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/normalization.php	2016-05-04 11:02:07.139888770 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/normalization.php	2016-05-04 14:29:25.031975489 +0800
+@@ -72,7 +72,7 @@
+ $scripts->addFile('normalization.js');
+ $scripts->addFile('jquery/jquery.uitablefilter.js');
+ $normalForm = '1nf';
+-if (isset($_REQUEST['normalizeTo'])) {
++if (PMA_isValid($_REQUEST['normalizeTo'],array('1nf','2nf','3nf'))) {
+     $normalForm = $_REQUEST['normalizeTo'];
+ }
+ if (isset($_REQUEST['createNewTables2NF'])) {
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-4.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-4.patch
new file mode 100644
index 0000000..6b699f6
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-4.patch
@@ -0,0 +1,40 @@
+Subject: [PATCH] Fix XSS in database structure page
+
+Signed-off-by: Michal Čihař <michal@cihar.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: phpMyAdmin-4.5.0.2-all-languages/templates/database/structure/sortable_header.phtml
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/templates/database/structure/sortable_header.phtml	2015-09-25 19:55:50.000000000 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/templates/database/structure/sortable_header.phtml	2016-05-04 14:39:57.703979900 +0800
+@@ -51,16 +51,20 @@
+ }
+ $_url_params = array(
+     'db' => $_REQUEST['db'],
++    'pos' => 0, // We set the position back to 0 every time they sort.
++    'sort' => $sort,
++    'sort_order' => $future_sort_order,
+ );
+-$url = 'db_structure.php' . PMA_URL_getCommon($_url_params);
+-// We set the position back to 0 every time they sort.
+-$url .= "&amp;pos=0&amp;sort=$sort&amp;sort_order=$future_sort_order";
+-if (! empty($_REQUEST['tbl_type'])) {
+-    $url .= "&amp;tbl_type=" . $_REQUEST['tbl_type'];
++
++if (PMA_isValid($_REQUEST['tbl_type'], array('view', 'table'))) {
++     $_url_params['tbl_type'] = $_REQUEST['tbl_type'];
+ }
+ if (! empty($_REQUEST['tbl_group'])) {
+-    $url .= "&amp;tbl_group=" . $_REQUEST['tbl_group'];
++    $_url_params['tbl_group']= $_REQUEST['tbl_group'];
+ }
++
++$url = 'db_structure.php' . PMA_URL_getCommon($_url_params);
++
+ echo PMA_Util::linkOrButton(
+     $url, $title . $order_img, $order_link_params
+-);
+\ No newline at end of file
++);
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-5.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-5.patch
new file mode 100644
index 0000000..27ff9ff
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-5.patch
@@ -0,0 +1,20 @@
+Subject: [PATCH] Fix XSS in normalization.js
+
+Signed-off-by: Madhura Jayaratne <madhura.cj@gmail.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: phpMyAdmin-4.5.0.2-all-languages/js/normalization.js
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/js/normalization.js	2016-05-04 14:20:40.943971835 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/js/normalization.js	2016-05-04 14:45:22.223982162 +0800
+@@ -82,7 +82,7 @@
+             $("#mainContent #extra").html(data.extra);
+             $("#mainContent #newCols").html('');
+             if (data.subText !== '') {
+-                $('.tblFooters').html('<input type="submit" value="' + PMA_messages.strDone + '" onclick="processDependencies(\'' + data.primary_key + '\');">');
++                $('.tblFooters').html('<input type="submit" value="' + PMA_messages.strDone + '" onclick="processDependencies(\'' + escapeJsString(escapeHtml(data.primary_key)) + '\');">');
+             } else {
+                 if (normalizeto === '3nf') {
+                     $("#mainContent #newCols").html(PMA_messages.strToNextStep);
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-6.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-6.patch
new file mode 100644
index 0000000..4a58b4c
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561-6.patch
@@ -0,0 +1,20 @@
+ubject: [PATCH] Escape selectors
+
+Signed-off-by: Madhura Jayaratne <madhura.cj@gmail.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: phpMyAdmin-4.5.0.2-all-languages/db_central_columns.php
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/db_central_columns.php	2015-09-25 19:55:50.000000000 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/db_central_columns.php	2016-05-04 14:47:45.003983158 +0800
+@@ -92,7 +92,7 @@
+ } else {
+     $total_rows = PMA_getCentralColumnsCount($db);
+ }
+-if (isset($_REQUEST['pos'])) {
++if (PMA_isValid($_REQUEST['pos'], 'integer')) {
+     $pos = $_REQUEST['pos'];
+ } else {
+     $pos = 0;
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561.patch b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561.patch
new file mode 100644
index 0000000..48e1aac
--- /dev/null
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin/phpmyadmin-CVE-2016-2561.patch
@@ -0,0 +1,29 @@
+Subject: [PATCH] Escape selectors
+
+Signed-off-by: Madhura Jayaratne <madhura.cj@gmail.com>
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+Index: phpMyAdmin-4.5.0.2-all-languages/js/normalization.js
+===================================================================
+--- phpMyAdmin-4.5.0.2-all-languages.orig/js/normalization.js	2016-05-04 11:02:07.295888771 +0800
++++ phpMyAdmin-4.5.0.2-all-languages/js/normalization.js	2016-05-04 11:30:15.767900544 +0800
+@@ -128,7 +128,7 @@
+             $("#mainContent #newCols").html('');
+             $('.tblFooters').html('');
+             for(var pk in primary_key) {
+-                $("#extra input[value='" + primary_key[pk] + "']").attr("disabled","disabled");
++                $("#extra input[value='" + escapeJsString(primary_key[pk]) + "']").attr("disabled","disabled");
+             }
+         }
+     );
+@@ -153,7 +153,7 @@
+             $('.tblFooters').html('');
+             primary_key = $.parseJSON(data.primary_key);
+             for(var pk in primary_key) {
+-                $("#extra input[value='" + primary_key[pk] + "']").attr("disabled","disabled");
++                $("#extra input[value='" + escapeJsString(primary_key[pk]) + "']").attr("disabled","disabled");
+             }
+         }
+     );
diff --git a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
index ac32185..3be90ba 100644
--- a/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
+++ b/meta-webserver/recipes-php/phpmyadmin/phpmyadmin_4.5.0.2.bb
@@ -9,6 +9,12 @@ SRC_URI = "https://files.phpmyadmin.net/phpMyAdmin/4.5.0.2/phpMyAdmin-4.5.0.2-al
            file://Port-content-spoofing-fix-CVE-2015-7873.patch \
            file://apache.conf \
            file://phpmyadmin-CVE-2015-8669.patch \
+           file://phpmyadmin-CVE-2016-2561.patch \
+           file://phpmyadmin-CVE-2016-2561-2.patch \
+           file://phpmyadmin-CVE-2016-2561-3.patch \
+           file://phpmyadmin-CVE-2016-2561-4.patch \
+           file://phpmyadmin-CVE-2016-2561-5.patch \
+           file://phpmyadmin-CVE-2016-2561-6.patch \
 "
 
 SRC_URI[md5sum] = "2d08d2fcc8f70f88a11a14723e3ca275"
-- 
1.9.1


