Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
 by mx.groups.io with SMTP id smtpd.web11.9940.1618388935664010086
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Apr 2021 01:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: siemens.com, ip: 192.35.17.2, mailfrom: andrej.kozemcak@siemens.com)
Received: from mail2.siemens.de (mail2.siemens.de [139.25.208.11])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 13E8SrWe015752
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Apr 2021 10:28:53 +0200
Received: from dev.vm7.ccp.siemens.com ([144.145.220.59])
	by mail2.siemens.de (8.15.2/8.15.2) with ESMTP id 13E8SqBk025089;
	Wed, 14 Apr 2021 10:28:53 +0200
Received: from dev.vm7.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm7.ccp.siemens.com (Postfix) with ESMTP id 524EE304E690;
	Wed, 14 Apr 2021 10:28:52 +0200 (CEST)
From: "Andrej Kozemcak" <andrej.kozemcak@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [meta-oe][dunfell][PATCH] fix(libupnp): apply cve-2020-13848
Date: Wed, 14 Apr 2021 10:27:21 +0200
Message-Id: <20210414082721.32763-1-andrej.kozemcak@siemens.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../libupnp/files/CVE-2020-13848.patch        | 56 +++++++++++++++++++
 .../libupnp/libupnp_git.bb                    |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch

diff --git a/meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch b/meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch
new file mode 100644
index 000000000..8a90942fa
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/libupnp/files/CVE-2020-13848.patch
@@ -0,0 +1,56 @@
+diff --git a/ChangeLog b/ChangeLog
+index 4a956fc..265d268 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -2,6 +2,12 @@
+ Version 1.8.4
+ *******************************************************************************
+
++2020-06-04 Patrik Lantz pjlantz(at)github
++
++	Fixes #177
++
++	NULL pointer dereference in FindServiceControlURLPath
++
+ 2017-11-17 Marcelo Jimenez <mroberto(at)users.sourceforge.net>
+
+	GitHub #57 - 1.8.3 broke ABI without changing SONAME
+diff --git a/upnp/src/genlib/service_table/service_table.c b/upnp/src/genlib/service_table/service_table.c
+index 98c2c0f..f3ee4e5 100644
+--- a/upnp/src/genlib/service_table/service_table.c
++++ b/upnp/src/genlib/service_table/service_table.c
+@@ -300,12 +300,11 @@ FindServiceEventURLPath( service_table * table,
+     uri_type parsed_url;
+     uri_type parsed_url_in;
+
+-    if( ( table )
+-        &&
+-        ( parse_uri( eventURLPath,
+-                     strlen( eventURLPath ),
+-                     &parsed_url_in ) == HTTP_SUCCESS ) ) {
+-
++    if (!table || !eventURLPath) {
++      return NULL;
++    }
++    if (parse_uri(eventURLPath, strlen(eventURLPath), &parsed_url_in) ==
++        HTTP_SUCCESS) {
+         finger = table->serviceList;
+         while( finger ) {
+             if( finger->eventURL )
+@@ -352,11 +351,11 @@ FindServiceControlURLPath( service_table * table,
+     uri_type parsed_url;
+     uri_type parsed_url_in;
+
+-    if( ( table )
+-        &&
+-        ( parse_uri
+-          ( controlURLPath, strlen( controlURLPath ),
+-            &parsed_url_in ) == HTTP_SUCCESS ) ) {
++    if (!table || !controlURLPath) {
++      return NULL;
++    }
++    if (parse_uri(controlURLPath, strlen(controlURLPath), &parsed_url_in) ==
++        HTTP_SUCCESS) {
+         finger = table->serviceList;
+         while( finger ) {
+             if( finger->controlURL )
diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
index 339c07cd9..828e351be 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_git.bb
@@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 PV = "1.8.4+git${SRCPV}"
 # release-1.8.4
 SRCREV = "d5a01fc9895daae98a0c5a8c7d3afce46add529d"
-SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https"
+SRC_URI = "git://github.com/mrjimenez/pupnp.git;protocol=https \
+           file://CVE-2020-13848.patch"
 
 S="${WORKDIR}/git"
 
-- 
2.20.1

