Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5D5A272272
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Dec 2014 01:04:22 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id kx10so9991446pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 30 Nov 2014 17:04:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=V7fVPToxaVusK+m+7XwBjRsmcz9gc5fhoTMP9oyjSBE=;
	b=sEW/Hi/9oH/GnvwTQi4xLGkRT9ysx2gsXEesNa+C9fPLYHhXZ0Q1/HzCxyio3jLNC5
	JdMx2h+xWkta3Dk5s7VbG4OZdVDfB+LybVJsXcGOjDaCOf4jqeSveIa+LwX50NED0vvw
	PmqcDxCdaJYUuZNsi1+yA/JeJVVz4Ff062w4d1yyvD7jE7BBJy3sWMa29eqWI6MwkFok
	ysZuCtCFumnvOlFFWvKfTqxaIFq1965fRHpPFDjrIc9qLK+i5u09igo23OMCebRrKQsd
	Z/vrDCWuvV6cKZd7Q/NijmwchnaxCFhRpITOgW4yBmlugbIlIX1wkThySKU5vyaftP+R
	/iWA==
X-Received: by 10.67.14.71 with SMTP id fe7mr95047650pad.27.1417395863323;
	Sun, 30 Nov 2014 17:04:23 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id v7sm11872248pdl.5.2014.11.30.17.04.21
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 30 Nov 2014 17:04:22 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 30 Nov 2014 17:04:03 -0800
Message-Id: <e2b03e9992fc261ef0b7139d9b6443d6eda300a0.1417194166.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
In-Reply-To: <cover.1417194166.git.akuster808@gmail.com>
References: <cover.1417194166.git.akuster808@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [PATCH 01/15] phpmyadmin: fix for Security Advisory CVE-2014-5274
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
X-List-Received-Date: Mon, 01 Dec 2014 01:04:30 -0000

From: Roy Li <rongqing.li@windriver.com>

Cross-site scripting (XSS) vulnerability in the view operations page in
phpMyAdmin 4.1.x before 4.1.14.3 and 4.2.x before 4.2.7.1 allows remote
authenticated users to inject arbitrary web script or HTML via a crafted
view name, related to js/functions.js.

http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-5274

Signed-off-by: Roy Li <rongqing.li@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...4505-security-XSS-in-view-operations-page.patch | 43 ++++++++++++++++++++++
 .../recipes-php/phpmyadmin/phpmyadmin_4.2.7.bb     |  1 +
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
1.9.1


