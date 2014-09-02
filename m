Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 839A76FE64
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Sep 2014 03:16:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s823GmDi012931
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Sep 2014 20:16:48 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 1 Sep 2014 20:16:47 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Tue, 2 Sep 2014 11:16:36 +0800
Message-ID: <be2914f68887041b65bea7140af6324a3bae34c4.1409626676.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409626676.git.hongxu.jia@windriver.com>
References: <cover.1409626676.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] proftpd: fix integer overflow CVE-2013-4359
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
X-List-Received-Date: Tue, 02 Sep 2014 03:16:48 -0000
Content-Type: text/plain

Integrate a patch from proftpd upstream to fix an integer overflow bug
described in the CVE-2013-4359, which allows remote attachers to cause
a denial of service (memory consumption) attack.

Refer: http://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4359

Signed-off-by: Shan Hai <shan.hai@windriver.com>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../proftpd/files/proftpd-sftp.patch               | 140 +++++++++++++++++++++
 .../recipes-daemons/proftpd/proftpd_1.3.4b.bb      |   3 +-
 2 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch

diff --git a/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch b/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
new file mode 100644
index 0000000..bdc0a46
--- /dev/null
+++ b/meta-networking/recipes-daemons/proftpd/files/proftpd-sftp.patch
@@ -0,0 +1,140 @@
+proftpd/mod_sftp: fix too much memory allocation bug of mod_sftp
+
+This patch fixes the too much memory allocation bug of the mod_sftp by
+ensuring both that a) the received response count matches the number of
+challenges sent, and b) that the received response count is not too high
+(as an additional sanity check); the upper bound is still set to 500.
+
+The patch is picked from: http://bugs.proftpd.org/show_bug.cgi?id=3973
+
+diff --git a/contrib/mod_sftp/kbdint.c b/contrib/mod_sftp/kbdint.c
+index 0271fb2..de651fa 100644
+--- a/contrib/mod_sftp/kbdint.c
++++ b/contrib/mod_sftp/kbdint.c
+@@ -1,6 +1,6 @@
+ /*
+  * ProFTPD - mod_sftp keyboard-interactive driver mgmt
+- * Copyright (c) 2008-2009 TJ Saunders
++ * Copyright (c) 2008-2013 TJ Saunders
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -31,6 +31,8 @@
+ #include "utf8.h"
+ #include "kbdint.h"
+ 
++#define SFTP_KBDINT_MAX_RESPONSES	500
++
+ struct kbdint_driver {
+   struct kbdint_driver *next, *prev;
+ 
+@@ -252,8 +254,8 @@ int sftp_kbdint_send_challenge(const char *user, const char *instruction,
+   return res;
+ }
+ 
+-int sftp_kbdint_recv_response(pool *p, unsigned int *count,
+-    const char ***responses) {
++int sftp_kbdint_recv_response(pool *p, unsigned int expected_count,
++    unsigned int *rcvd_count, const char ***responses) {
+   register unsigned int i;
+   char *buf;
+   cmd_rec *cmd;
+@@ -264,7 +266,7 @@ int sftp_kbdint_recv_response(pool *p, unsigned int *count,
+   int res;
+ 
+   if (p == NULL ||
+-      count == NULL ||
++      rcvd_count == NULL ||
+       responses == NULL) {
+     errno = EINVAL;
+     return -1;
+@@ -299,6 +301,29 @@ int sftp_kbdint_recv_response(pool *p, unsigned int *count,
+ 
+   resp_count = sftp_msg_read_int(pkt->pool, &buf, &buflen);
+ 
++  /* Ensure that the number of responses sent by the client is the same
++   * as the number of challenges sent, lest a malicious client attempt to
++   * trick us into allocating too much memory (Bug#3973).
++   */
++  if (resp_count != expected_count) {
++    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
++      "sent %lu %s, but received %lu %s", (unsigned long) expected_count,
++      expected_count != 1 ? "challenges" : "challenge",
++      (unsigned long) resp_count, resp_count != 1 ? "responses" : "response");
++    destroy_pool(pkt->pool);
++    errno = EPERM;
++    return -1;
++  }
++
++  if (resp_count > SFTP_KBDINT_MAX_RESPONSES) {
++    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_VERSION,
++      "received too many responses (%lu > max %lu), rejecting",
++      (unsigned long) resp_count, (unsigned long) SFTP_KBDINT_MAX_RESPONSES);
++    destroy_pool(pkt->pool);
++    errno = EPERM;
++    return -1;
++  }
++
+   list = make_array(p, resp_count, sizeof(char *));
+   for (i = 0; i < resp_count; i++) {
+     char *resp;
+@@ -307,7 +332,7 @@ int sftp_kbdint_recv_response(pool *p, unsigned int *count,
+     *((char **) push_array(list)) = pstrdup(p, sftp_utf8_decode_str(p, resp));
+   }
+ 
+-  *count = (unsigned int) resp_count;
++  *rcvd_count = (unsigned int) resp_count;
+   *responses = ((const char **) list->elts);
+   return 0;
+ }
+diff --git a/contrib/mod_sftp/mod_sftp.h.in b/contrib/mod_sftp/mod_sftp.h.in
+index 3e91390..c547be0 100644
+--- a/contrib/mod_sftp/mod_sftp.h.in
++++ b/contrib/mod_sftp/mod_sftp.h.in
+@@ -1,6 +1,6 @@
+ /*
+  * ProFTPD - mod_sftp
+- * Copyright (c) 2008-2011 TJ Saunders
++ * Copyright (c) 2008-2013 TJ Saunders
+  *
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -174,7 +174,8 @@ int sftp_kbdint_register_driver(const char *name, sftp_kbdint_driver_t *driver);
+ int sftp_kbdint_unregister_driver(const char *name);
+ int sftp_kbdint_send_challenge(const char *, const char *, unsigned int,
+   sftp_kbdint_challenge_t *);
+-int sftp_kbdint_recv_response(pool *, unsigned int *, const char ***);
++int sftp_kbdint_recv_response(pool *, unsigned int, unsigned int *,
++  const char ***);
+ 
+ /* API for modules that which to register keystores, for the
+  * SFTPAuthorizedHostKeys and SFTPAuthorizedUserKeys directives.
+diff --git a/contrib/mod_sftp_pam.c b/contrib/mod_sftp_pam.c
+index 6c32df0..81aa113 100644
+--- a/contrib/mod_sftp_pam.c
++++ b/contrib/mod_sftp_pam.c
+@@ -179,22 +179,13 @@ static int sftppam_converse(int nmsgs, PR_PAM_CONST struct pam_message **msgs,
+     return PAM_CONV_ERR;
+   }
+ 
+-  if (sftp_kbdint_recv_response(sftppam_driver.driver_pool, &recvd_count,
+-      &recvd_responses) < 0) {
++  if (sftp_kbdint_recv_response(sftppam_driver.driver_pool, list->nelts,
++      &recvd_count, &recvd_responses) < 0) {
+     pr_trace_msg(trace_channel, 3,
+       "error receiving keyboard-interactive responses: %s", strerror(errno));
+     return PAM_CONV_ERR;
+   }
+ 
+-  /* Make sure that the count of responses matches the challenge count. */
+-  if (recvd_count != list->nelts) {
+-    (void) pr_log_writefile(sftp_logfd, MOD_SFTP_PAM_VERSION,
+-      "sent %d %s, but received %u %s", nmsgs,
+-      list->nelts != 1 ? "challenges" : "challenge", recvd_count,
+-      recvd_count != 1 ? "responses" : "response");
+-    return PAM_CONV_ERR;
+-  }
+-
+   res = calloc(nmsgs, sizeof(struct pam_response));
+   if (res == NULL) {
+     pr_log_pri(PR_LOG_CRIT, "Out of memory!");
diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
index c154c6d..feaf05a 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.4b.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.proftpd.org"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fb0d1484d11915fa88a6a7702f1dc184"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://make.patch \
@@ -15,6 +15,7 @@ SRC_URI = "ftp://ftp.proftpd.org/distrib/source/${BPN}-${PV}.tar.gz \
            file://move-pidfile-to-var-run.patch \
            file://close-RequireValidShell-check.patch \
            file://move-runfile-to-var-run.patch \
+           file://proftpd-sftp.patch \
 "
 
 SRC_URI[md5sum] = "0871e0b93c9c3c88ca950b6d9a04aed2"
-- 
1.9.1


