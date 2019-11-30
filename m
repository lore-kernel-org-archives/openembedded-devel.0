Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id C0E687F898
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 18:11:00 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id s35so1456091pjb.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Nov 2019 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0EvVlRGyIHb3CLPOLrF+jgdcniwJFmClNf1xzkQCZ+A=;
	b=S0RmM9tfisrBICq+pnnh38zEpC/fldMwz4XfqlFPvqiSdB7JDE4saCPX6Y1HT8C1KY
	YgqqxbXBhTX7Cverf3N5OR+x55+pS+MEjoSaDhZhETh84lL5dxOQUDlNr2AE2OxB8hWi
	guh8mxZ3OhAvNQEydTSGOB+CQGCMnodZGXVZW+VFnQ5RSA+5f/hLpRH/Vd4HzAJ47ONJ
	i3QqUyTl97oVND3HkAUby9Eoi6S1ihttH8ICl1KRRh/ftK1ya1u5CUQpoOFkxtWi9B/d
	2c+D8aqmlwF22gRMYZ4eYPFZpSYEK5NreCpXz7BCaCuewDKb1ERCY+UZLEEVr76+FH8S
	83fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0EvVlRGyIHb3CLPOLrF+jgdcniwJFmClNf1xzkQCZ+A=;
	b=tGv6fEr3hV1CTvvD8rx1tGBqtyE0bV49wfI/+wToO047hGde76FjRKQLBZpXWAbgqX
	sJ0/elXUCQUifpK5kZhiM+vpAakqqAbchI2QV/bGIOtBTU1I2nlRsI0Uv6eoiJX3oIG7
	KZaeazr4irBRsbo3n4a05SUYuitlrokJepxmWdEYZmrkDB6xwqSBzMph7koxga3lQsJn
	r9d8Alvngi8LLj6AzODxB/J5Owr1O/GJDQi+leArUzCl2CcWqGxpPdI6SLcW6XyIICrV
	hMc+7HtyRGGMb692DAT97UZw1hkOHfI0dK4Y2+jzk4KJnwRwydvmqzu+sze8bBIl/VGg
	zEFA==
X-Gm-Message-State: APjAAAUt2KCtFT11UTsLdGw1Gt1ibyq0mgmjERiFGzBYpxgNVDUJh66A
	phe0D6CstuMU6YKYsJADK83UlWY7
X-Google-Smtp-Source: APXvYqzjmRlv0lyXeSov1uWDMMXNeg3WRwaDKI3LVATeIf1VWRGzd0w6btU6WfZmjFL5zmJ81OA/Kg==
X-Received: by 2002:a17:902:7784:: with SMTP id
	o4mr3254070pll.176.1575137461714; 
	Sat, 30 Nov 2019 10:11:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:c050:b516:8fc6:8cbf])
	by smtp.gmail.com with ESMTPSA id d6sm490762pju.8.2019.11.30.10.11.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 30 Nov 2019 10:11:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 30 Nov 2019 10:10:44 -0800
Message-Id: <df851c3e35f42b9ec2d2dc216ec7bb5d3a078af9.1575137343.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1575137343.git.akuster808@gmail.com>
References: <cover.1575137343.git.akuster808@gmail.com>
Subject: [PATCH 14/15] freeradius: fix CVE-2019-10143
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
X-List-Received-Date: Sat, 30 Nov 2019 18:11:00 -0000

From: Yi Zhao <yi.zhao@windriver.com>

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2019-10143

Patch from:
https://github.com/FreeRADIUS/freeradius-server/commit/1f233773962bf1a9c2d228a180eacddb9db2d574

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
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


