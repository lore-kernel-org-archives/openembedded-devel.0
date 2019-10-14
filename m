Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 46A1C6C0EB
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2019 06:23:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9E6NU0v010693
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2019 23:23:30 -0700 (PDT)
Received: from localhost (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 13 Oct 2019 23:23:29 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 14 Oct 2019 14:23:27 +0800
Message-ID: <20191014062327.5873-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [128.224.158.164]
Subject: [meta-networking][PATCH] freeradius: fix CVE-2019-10143
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
X-List-Received-Date: Mon, 14 Oct 2019 06:23:29 -0000
Content-Type: text/plain

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2019-10143

Patch from:
https://github.com/FreeRADIUS/freeradius-server/commit/1f233773962bf1a9c2d228a180eacddb9db2d574

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-to-radiusd-user-group-when-rotating-logs.patch | 104 +++++++++++++++++++++
 .../freeradius/freeradius_3.0.19.bb                |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
new file mode 100644
index 0000000..5859dc7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
@@ -0,0 +1,104 @@
+From 1f233773962bf1a9c2d228a180eacddb9db2d574 Mon Sep 17 00:00:00 2001
+From: Alexander Scheel <ascheel@redhat.com>
+Date: Tue, 7 May 2019 16:04:29 -0400
+Subject: [PATCH] su to radiusd user/group when rotating logs
+
+The su directive to logrotate ensures that log rotation happens under the
+owner of the logs. Otherwise, logrotate runs as root:root, potentially
+enabling privilege escalation if a RCE is discovered against the
+FreeRADIUS daemon.
+
+Signed-off-by: Alexander Scheel <ascheel@redhat.com>
+
+Upstream-Status: Backport
+[https://github.com/FreeRADIUS/freeradius-server/commit/1f233773962bf1a9c2d228a180eacddb9db2d574]
+
+CVE: CVE-2019-10143
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ debian/freeradius.logrotate  | 3 +++
+ redhat/freeradius-logrotate  | 1 +
+ scripts/logrotate/freeradius | 3 +++
+ suse/radiusd-logrotate       | 1 +
+ 4 files changed, 8 insertions(+)
+
+diff --git a/debian/freeradius.logrotate b/debian/freeradius.logrotate
+index 7d837d5..a8d29b7 100644
+--- a/debian/freeradius.logrotate
++++ b/debian/freeradius.logrotate
+@@ -9,6 +9,7 @@
+ 	notifempty
+ 
+ 	copytruncate
++	su freerad freerad
+ }
+ 
+ # (in order)
+@@ -26,6 +27,7 @@
+ 	notifempty
+ 
+ 	nocreate
++	su freerad freerad
+ }
+ 
+ # There are different detail-rotating strategies you can use.  One is
+@@ -45,4 +47,5 @@
+ 	notifempty
+ 
+ 	nocreate
++	su freerad freerad
+ }
+diff --git a/redhat/freeradius-logrotate b/redhat/freeradius-logrotate
+index 360765d..bb97ca5 100644
+--- a/redhat/freeradius-logrotate
++++ b/redhat/freeradius-logrotate
+@@ -9,6 +9,7 @@ rotate 4
+ missingok
+ compress
+ delaycompress
++su radiusd radiusd
+ 
+ #
+ #  The main server log
+diff --git a/scripts/logrotate/freeradius b/scripts/logrotate/freeradius
+index 3de435e..eecf631 100644
+--- a/scripts/logrotate/freeradius
++++ b/scripts/logrotate/freeradius
+@@ -17,6 +17,7 @@
+ 	notifempty
+ 
+ 	copytruncate
++	su radiusd radiusd
+ }
+ 
+ # (in order)
+@@ -34,6 +35,7 @@
+ 	notifempty
+ 
+ 	nocreate
++	su radiusd radiusd
+ }
+ 
+ # There are different detail-rotating strategies you can use.  One is
+@@ -53,4 +55,5 @@
+ 	notifempty
+ 
+ 	nocreate
++	su radiusd radiusd
+ }
+diff --git a/suse/radiusd-logrotate b/suse/radiusd-logrotate
+index 24d56be..be5a797 100644
+--- a/suse/radiusd-logrotate
++++ b/suse/radiusd-logrotate
+@@ -11,6 +11,7 @@ missingok
+ compress
+ delaycompress
+ notifempty
++su radiusd radiusd
+ 
+ #
+ #  The main server log
+-- 
+2.7.4
+
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
index 9da15e0..8c95bba 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.19.bb
@@ -26,6 +26,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x; \
     file://freeradius-fix-quoting-for-BUILT_WITH.patch \
     file://freeradius-fix-error-for-expansion-of-macro.patch \
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
+    file://0001-su-to-radiusd-user-group-when-rotating-logs.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
 "
-- 
2.7.4


