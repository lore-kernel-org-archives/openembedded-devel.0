Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.9851.1618998030493460152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 02:40:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13L9eTSk017815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Apr 2021 02:40:29 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Wed, 21 Apr 2021 02:40:28 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Wed, 21 Apr 2021 02:40:27 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] freeradius: check existence of openssl's commands in bootstrap
Date: Wed, 21 Apr 2021 17:40:24 +0800
Message-ID: <20210421094024.38108-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It calls openssl's commands 'dhparam' and 'pkcs12' in script bootstrap.
These commands are configurable based on configure options 'no-dh' and
'no-des', and may not be provided by openssl. So check existence of
these commands. If not, abort running of script bootstrap.

1. https://github.com/openssl/openssl/blob/master/apps/build.info#L37
2. https://github.com/openssl/openssl/blob/master/apps/build.info#L22

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...eck-openssl-cmds-in-script-bootstrap.patch | 38 +++++++++++++++++++
 .../freeradius/freeradius_3.0.21.bb           |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch

diff --git a/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch b/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
new file mode 100644
index 000000000..fcadae93a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/freeradius/files/check-openssl-cmds-in-script-bootstrap.patch
@@ -0,0 +1,38 @@
+bootstrap: check commands of openssl exist
+
+It calls openssl commands dhparam and pkcs12 in script bootstrap. These
+commands are configurable based on configure options 'no-dh' and
+'no-des', and may not be provided by openssl. So check existence of
+these commands. If not, abort running of script bootstrap.
+
+1. https://github.com/openssl/openssl/blob/master/apps/build.info#L37
+2. https://github.com/openssl/openssl/blob/master/apps/build.info#L22
+
+Upstream-Status: Denied [https://github.com/FreeRADIUS/freeradius-server/pull/4059]
+				 The maintainer commented in the pull that the script could
+				 be run on a host which provides these openssl commands.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ raddb/certs/bootstrap | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/raddb/certs/bootstrap b/raddb/certs/bootstrap
+index 0f719aafd4..17feddbeeb 100755
+--- a/raddb/certs/bootstrap
++++ b/raddb/certs/bootstrap
+@@ -13,6 +13,14 @@
+ umask 027
+ cd `dirname $0`
+ 
++#  check commands of openssl exist
++for cmd in dhparam pkcs12; do
++	if ! openssl ${cmd} -help >/dev/null 2>&1; then
++		echo "Error: command ${cmd} is not supported by openssl."
++		exit 1
++	fi
++done
++
+ make -h > /dev/null 2>&1
+ 
+ #
diff --git a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
index 864a4e944..a6df2aeb0 100644
--- a/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
+++ b/meta-networking/recipes-connectivity/freeradius/freeradius_3.0.21.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/FreeRADIUS/freeradius-server.git;branch=v3.0.x;lfs=0
     file://0001-workaround-error-with-autoconf-2.7.patch \
     file://radiusd.service \
     file://radiusd-volatiles.conf \
+    file://check-openssl-cmds-in-script-bootstrap.patch \
 "
 
 SRCREV = "af428abda249b2279ba0582180985a9f6f4a144a"
-- 
2.17.1

