Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB894EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 06:10:00 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web11.1409.1689142191873149309
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 23:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=FvKmK/R/;
 spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689142191; x=1720678191;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1S6tWh2YbqPQcs1oCSylr1VejZgtvkZjpu8Ytn8UyYI=;
  b=FvKmK/R/1JSDA4vEXzwxUDsgjdegLKJiL0JpEroc+C7n7XoCYGCkXpYz
   GrPSIzUGcFwwByj3cQiObBYbgUOFumgXSHcMs9Puw7NeDFD1jAiPzVU8d
   sGQwa3Ch5QJZDQrJzVBAeQ03A2AwVczGFEJuGMU3TY7wUscIDVUvaZNg6
   3q5aiHXm2ooyelsawUoBKwzlmdIeZmwONpsRoUF7jPQndibHL3dd5lwd8
   ySEMCX7zKcYHHT+yePCzwZT0vkdU7kP+l4+mYeQ8q4BNOJD4PGm6XLVkb
   +MOEt3aEq2+JZxQIk1FWyE3mqMitYmg/OK6p3tjqTgasJQjzk6HVzr+VO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344412087"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="344412087"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 23:09:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="715438899"
X-IronPort-AV: E=Sophos;i="6.01,198,1684825200"; 
   d="scan'208";a="715438899"
Received: from andromeda02.png.intel.com ([10.221.253.198])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 23:09:33 -0700
From: chee.yang.lee@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][mickledore] rabbitmq-c: Fix CVE-2023-35789
Date: Wed, 12 Jul 2023 13:57:53 +0800
Message-Id: <20230712055753.2221730-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 06:10:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103826

From: Chee Yang Lee <chee.yang.lee@intel.com>

affects <= 0.13.0

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 .../rabbitmq-c/files/CVE-2023-35789.patch     | 131 ++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.13.0.bb           |   4 +-
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch b/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
new file mode 100644
index 0000000000..dfd1f98759
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
@@ -0,0 +1,131 @@
+CVE: CVE-2023-35789
+Upstream-Status: Backport [ https://github.com/alanxz/rabbitmq-c/commit/463054383fbeef889b409a7f843df5365288e2a0 ]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+
+From 463054383fbeef889b409a7f843df5365288e2a0 Mon Sep 17 00:00:00 2001
+From: Christian Kastner <ckk@kvr.at>
+Date: Tue, 13 Jun 2023 14:21:52 +0200
+Subject: [PATCH] Add option to read username/password from file (#781)
+
+* Add option to read username/password from file
+---
+ tools/common.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+
+diff --git a/tools/common.c b/tools/common.c
+index 73b47e25..7efe557b 100644
+--- a/tools/common.c
++++ b/tools/common.c
+@@ -18,6 +18,11 @@
+ #include "compat.h"
+ #endif
+ 
++/* For when reading auth data from a file */
++#define MAXAUTHTOKENLEN 128
++#define USERNAMEPREFIX "username:"
++#define PASSWORDPREFIX "password:"
++
+ void die(const char *fmt, ...) {
+   va_list ap;
+   va_start(ap, fmt);
+@@ -125,6 +130,7 @@ static char *amqp_vhost;
+ static char *amqp_username;
+ static char *amqp_password;
+ static int amqp_heartbeat = 0;
++static char *amqp_authfile;
+ #ifdef WITH_SSL
+ static int amqp_ssl = 0;
+ static char *amqp_cacert = "/etc/ssl/certs/cacert.pem";
+@@ -147,6 +153,8 @@ struct poptOption connect_options[] = {
+      "the password to login with", "password"},
+     {"heartbeat", 0, POPT_ARG_INT, &amqp_heartbeat, 0,
+      "heartbeat interval, set to 0 to disable", "heartbeat"},
++    {"authfile", 0, POPT_ARG_STRING, &amqp_authfile, 0,
++     "path to file containing username/password for authentication", "file"},
+ #ifdef WITH_SSL
+     {"ssl", 0, POPT_ARG_NONE, &amqp_ssl, 0, "connect over SSL/TLS", NULL},
+     {"cacert", 0, POPT_ARG_STRING, &amqp_cacert, 0,
+@@ -158,6 +166,50 @@ struct poptOption connect_options[] = {
+ #endif /* WITH_SSL */
+     {NULL, '\0', 0, NULL, 0, NULL, NULL}};
+ 
++void read_authfile(const char *path) {
++  size_t n;
++  FILE *fp = NULL;
++  char token[MAXAUTHTOKENLEN];
++
++  if ((amqp_username = malloc(MAXAUTHTOKENLEN)) == NULL ||
++      (amqp_password = malloc(MAXAUTHTOKENLEN)) == NULL) {
++    die("Out of memory");
++  } else if ((fp = fopen(path, "r")) == NULL) {
++    die("Could not read auth data file %s", path);
++  }
++
++  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
++      strncmp(token, USERNAMEPREFIX, strlen(USERNAMEPREFIX))) {
++    die("Malformed auth file (missing username)");
++  }
++  strncpy(amqp_username, &token[strlen(USERNAMEPREFIX)], MAXAUTHTOKENLEN);
++  /* Missing newline means token was cut off */
++  n = strlen(amqp_username);
++  if (amqp_username[n - 1] != '\n') {
++    die("Username too long");
++  } else {
++    amqp_username[n - 1] = '\0';
++  }
++
++  if (fgets(token, MAXAUTHTOKENLEN, fp) == NULL ||
++      strncmp(token, PASSWORDPREFIX, strlen(PASSWORDPREFIX))) {
++    die("Malformed auth file (missing password)");
++  }
++  strncpy(amqp_password, &token[strlen(PASSWORDPREFIX)], MAXAUTHTOKENLEN);
++  /* Missing newline means token was cut off */
++  n = strlen(amqp_password);
++  if (amqp_password[n - 1] != '\n') {
++    die("Password too long");
++  } else {
++    amqp_password[n - 1] = '\0';
++  }
++
++  (void)fgetc(fp);
++  if (!feof(fp)) {
++    die("Malformed auth file (trailing data)");
++  }
++}
++
+ static void init_connection_info(struct amqp_connection_info *ci) {
+   ci->user = NULL;
+   ci->password = NULL;
+@@ -237,6 +289,8 @@ static void init_connection_info(struct amqp_connection_info *ci) {
+   if (amqp_username) {
+     if (amqp_url) {
+       die("--username and --url options cannot be used at the same time");
++    } else if (amqp_authfile) {
++      die("--username and --authfile options cannot be used at the same time");
+     }
+ 
+     ci->user = amqp_username;
+@@ -245,11 +299,23 @@ static void init_connection_info(struct amqp_connection_info *ci) {
+   if (amqp_password) {
+     if (amqp_url) {
+       die("--password and --url options cannot be used at the same time");
++    } else if (amqp_authfile) {
++      die("--password and --authfile options cannot be used at the same time");
+     }
+ 
+     ci->password = amqp_password;
+   }
+ 
++  if (amqp_authfile) {
++    if (amqp_url) {
++      die("--authfile and --url options cannot be used at the same time");
++    }
++
++    read_authfile(amqp_authfile);
++    ci->user = amqp_username;
++    ci->password = amqp_password;
++  }
++
+   if (amqp_vhost) {
+     if (amqp_url) {
+       die("--vhost and --url options cannot be used at the same time");
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
index f9c2b2c8a9..ea80ec3344 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.13.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7e12f6e40e662e039e2f02b4893011ec"
 LICENSE = "MIT"
 
-SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
+           file://CVE-2023-35789.patch \
+"
 # v0.13.0-master
 SRCREV = "974d71adceae6d742ae20a4c880d99c131f1460a"
 
-- 
2.37.3


