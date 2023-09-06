Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E11EB8FCE
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 13:22:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8529.1694006555478237808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Sep 2023 06:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A/51OHYd;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=76132f5a4a=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 386BrKnN029025
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Sep 2023 13:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=ehbgf
	UwgOQWMg4rOrjSROnHIf/tZzP79kYadkAO4t+8=; b=A/51OHYdxR8j0KV+U2MQB
	aYVoNaYRMAELVCAss3lqnzpwWZc8KKaYOGnjJlecXQGCRLcOZMa16Im5BjlAwwEy
	rDWkYmWwL2JCoI4i72u3EvoxtjR8WPFDX7FmJD964Ob0nCP2uY/B6o1xJ3it1u3A
	Rtprbw8TDOS7cxzGDn06dM+eiIWnBsov9KnjRCtzNU4dCo7f3ijF8ncZD2E1tZFK
	UW+kdgPC6MBKtrqNQ6j/+z6DpdZBIYgOvtyE6Uz+GGPT35eQBaDhfPa58vbNNrWI
	/2I4/MnT/pbir1CERYx62yAj7JBN5vD5jXoeTLxKatUkHQNKOgBWGuDZq+fGJUGT
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k2dp5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 13:22:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 06:22:31 -0700
From: ssambu <soumya.sambu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe][meta-oe][kirkstone][PATCH 1/1] rabbitmq-c: Fix CVE-2023-35789
Date: Wed, 6 Sep 2023 13:22:04 +0000
Message-ID: <20230906132204.1041225-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: 3ToApXxXdylTC1M3aZiwyedy1HFC2CoV
X-Proofpoint-ORIG-GUID: 3ToApXxXdylTC1M3aZiwyedy1HFC2CoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309060115
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 13:22:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104779

From: Soumya Sambu <soumya.sambu@windriver.com>

An issue was discovered in the C AMQP client library (aka rabbitmq-c) through
0.13.0 for RabbitMQ. Credentials can only be entered on the command line (e.g.,
for amqp-publish or amqp-consume) and are thus visible to local attackers by
listing a process and its arguments.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2023-35789

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 .../rabbitmq-c/files/CVE-2023-35789.patch     | 135 ++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.11.0.bb           |   4 +-
 2 files changed, 138 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch b/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
new file mode 100644
index 000000000..93949fc21
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/files/CVE-2023-35789.patch
@@ -0,0 +1,135 @@
+From 463054383fbeef889b409a7f843df5365288e2a0 Mon Sep 17 00:00:00 2001
+From: Christian Kastner <ckk@kvr.at>
+Date: Tue, 13 Jun 2023 14:21:52 +0200
+Subject: [PATCH] Add option to read username/password from file (#781)
+
+* Add option to read username/password from file
+
+CVE: CVE-2023-35789
+
+Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/463054383fbeef889b409a7f843df5365288e2a0]
+
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ tools/common.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 66 insertions(+)
+
+diff --git a/tools/common.c b/tools/common.c
+index 53ea788..35b2b9f 100644
+--- a/tools/common.c
++++ b/tools/common.c
+@@ -54,6 +54,11 @@
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
+@@ -161,6 +166,7 @@ static char *amqp_vhost;
+ static char *amqp_username;
+ static char *amqp_password;
+ static int amqp_heartbeat = 0;
++static char *amqp_authfile;
+ #ifdef WITH_SSL
+ static int amqp_ssl = 0;
+ static char *amqp_cacert = "/etc/ssl/certs/cacert.pem";
+@@ -183,6 +189,8 @@ struct poptOption connect_options[] = {
+      "the password to login with", "password"},
+     {"heartbeat", 0, POPT_ARG_INT, &amqp_heartbeat, 0,
+      "heartbeat interval, set to 0 to disable", "heartbeat"},
++    {"authfile", 0, POPT_ARG_STRING, &amqp_authfile, 0,
++     "path to file containing username/password for authentication", "file"},
+ #ifdef WITH_SSL
+     {"ssl", 0, POPT_ARG_NONE, &amqp_ssl, 0, "connect over SSL/TLS", NULL},
+     {"cacert", 0, POPT_ARG_STRING, &amqp_cacert, 0,
+@@ -194,6 +202,50 @@ struct poptOption connect_options[] = {
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
+@@ -269,6 +321,8 @@ static void init_connection_info(struct amqp_connection_info *ci) {
+   if (amqp_username) {
+     if (amqp_url) {
+       die("--username and --url options cannot be used at the same time");
++    } else if (amqp_authfile) {
++      die("--username and --authfile options cannot be used at the same time");
+     }
+
+     ci->user = amqp_username;
+@@ -277,11 +331,23 @@ static void init_connection_info(struct amqp_connection_info *ci) {
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
+--
+2.40.0
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
index 304171c88..1cc4ada3b 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.11.0.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=6b7424f9db80cfb11fdd5c980b583f53"
 LICENSE = "MIT"
 
-SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
+           file://CVE-2023-35789.patch \
+          "
 # v0.11.0-master
 SRCREV = "a64c08c68aff34d49a2ac152f04988cd921084f9"
 
-- 
2.40.0


