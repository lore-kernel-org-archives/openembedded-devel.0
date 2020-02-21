Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id F1FF36174D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 20:49:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48PNqX4q5jz40
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 21:49:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1582318168;
	bh=SclTLlADbTlqiJV1V6vDLzIiFAV/b5+6MAGcs8rLhuA=;
	h=From:To:Subject:Date:From;
	b=VxDTkpW0EDJxs2d09TWrOQk2RIxezxvmVIcg1d5JoNbV7U42tc5pB+hulNH5xsngV
	5pqJZ/4/MLM76X/LyXLYHkJu4YFAmXZFl34DOauwFeq1zIauKveTdO5LXeSuhwqJzz
	1Trv8iW8V6kQW6UleWA3Zp9UsmRdsBkQTVRmeD6dJWGc2ABXdHIootifk+iSrdMGGo
	F1q//0cPQyLjg4V03hU+W92TRXXQ1m5urHz+iVN+P5ZX5ixmR8b2f6YEA4guNX81Br
	vmphcbwk9k7YQp89RSIAWjGTduKSn2P0FgmmTeLyA8Jakei2RaWmZn9CzYmrLwujUT
	h4F9xa7tHDcIDZQl5Ut8B1f1/hIdoD5N6i90l2VG5s5nAacrNAFHd2K+lsOwMPhENa
	bOgL5kKMJ0adE9xqHkbCzmsdL2a1j/H/GyJwX8h2yZiyD3MXu98go9oScqiVJWTIId
	0otcurryBPuL+dqUI0BoDdyQfpVRPsOOJXcvObQSXZPLqO81qmD9YeTXt1We35Lda+
	vwAQkLrB+ZnusWBtg5FssnK1QPQ2oF9tPDmqO5JDu4sswFxpuw5JiR/m6m0acJv2og
	AJm6PsNBxJAnXcKit1KzZSz+tOYzU6VvsViL/DfbCqNW0piuINX0EMPHO01WH9pcAQ
	wfOkaADd99Wj4RPTdAfKZbzM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 21 Feb 2020 22:49:25 +0200
Message-Id: <20200221204927.13293-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][warrior][PATCH] freeradius: fix CVE-2019-10143
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
X-List-Received-Date: Fri, 21 Feb 2020 20:49:28 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2019-10143

Patch from:
https://github.com/FreeRADIUS/freeradius-server/commit/1f233773962bf1a9c2d228a180eacddb9db2d574

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...adiusd-user-group-when-rotating-logs.patch | 104 ++++++++++++++++++
 .../freeradius/freeradius_3.0.17.bb           |   1 +
 2 files changed, 105 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch b/meta-networking/recipes-connectivity/freeradius/files/0001-su-to-radiusd-user-group-when-rotating-logs.patch
new file mode 100644
index 000000000..5859dc7ed
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
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
index e0b04c110..ea71eb225 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.17.bb
@@ -27,6 +27,7 @@ SRC_URI = "ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-${PV}.tar.b
     file://freeradius-fix-quoting-for-BUILT_WITH.patch \
     file://freeradius-fix-error-for-expansion-of-macro.patch \
     file://0001-rlm_mschap-Use-includedir-instead-of-hardcoding-usr-.patch \
+    file://0001-su-to-radiusd-user-group-when-rotating-logs.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
     file://0001-freeradius-correct-version-number-of-libssl-defect.patch \
-- 
2.17.1


