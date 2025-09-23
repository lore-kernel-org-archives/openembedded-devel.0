Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD44CAC5B2
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=KC2XeaQY;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628678; x=1790164678;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=HcsBD2Dd2f1RLlBn6PUQRSX8VS04N889tgdu3cKgk18=;
  b=KC2XeaQYfstvGeGwoFNIJxwHHGGkR1F9ak2RURgbnZNZXivMvjp5H2pC
   Dbckp8d012ZoMWVgYNkahhe6VLXC+1IYPuxzcnsKBRC7oRSlIguDHimMR
   cJv8ohZoiaT4i+SNKeR1P9X9szEbSAjIaL1/KRUWuqHA9+8srG+L/M3bM
   kPvuZ8QJkZKWjQcoO7rrjo6iqm99BBfoCJ7d5FDgB4FNXYb496hkt+Nok
   VffYj+bY4shcdoTSRGs49+RPiVTnybAtAYg7gp7c9ZkVzYvwBzwEO4pSL
   qix6EPxoiLXJkm+KtK7ziFuLcKapXK/bymbbcuIxlK0BL7vsAIpQzxcYD
   A==;
X-CSE-ConnectionGUID: rkhtL4hmRuupy7EvgEJlcg==
X-CSE-MsgGUID: mKlibM8xT62KIoGtqizo+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821789"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821789"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:58 -0700
X-CSE-ConnectionGUID: 1d1nvB5nTs+PBfHwePHEKw==
X-CSE-MsgGUID: QkcJft6LSwGp/gJAH7BvBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875188"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:57 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 11/24] libssh 0.10.6: Fix CVE-2025-8114
Date: Tue, 23 Sep 2025 19:57:14 +0800
Message-ID: <49aa81f2d5861bbae3c0886a2a0e39bdf7a16e18.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119700

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://git.libssh.org/projects/libssh.git/

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8114
Type: Security Fix
CVE: CVE-2025-8114
Score: 4.7
Patch: https://git.libssh.org/projects/libssh.git/commit/?id=53ac23ded4cb

Signed-off-by: Anil Dongare <adongare@cisco.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libssh/libssh/CVE-2025-8114.patch         | 49 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
new file mode 100644
index 0000000000..10bbbcb114
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-8114.patch
@@ -0,0 +1,49 @@
+From 5f4950367c027aa91fcea240df354a856a4a0025 Mon Sep 17 00:00:00 2001
+From: Andreas Schneider <asn@cryptomilk.org>
+Date: Wed, 6 Aug 2025 15:17:59 +0200
+Subject: [PATCH] CVE-2025-8114: Fix NULL pointer dereference after allocation
+ failure
+
+CVE: CVE-2025-8114
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=53ac23ded4cb]
+
+Signed-off-by: Andreas Schneider <asn@cryptomilk.org>
+Reviewed-by: Jakub Jelen <jjelen@redhat.com>
+(cherry picked from commit 53ac23ded4cb2c5463f6c4cd1525331bd578812d)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/kex.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/kex.c b/src/kex.c
+index fbc70cf4..b4bab277 100644
+--- a/src/kex.c
++++ b/src/kex.c
+@@ -1391,6 +1391,8 @@ int ssh_make_sessionid(ssh_session session)
+     ssh_log_hexdump("hash buffer", ssh_buffer_get(buf), ssh_buffer_get_len(buf));
+ #endif
+ 
++    /* Set rc for the following switch statement in case we goto error. */
++    rc = SSH_ERROR;
+     switch (session->next_crypto->kex_type) {
+     case SSH_KEX_DH_GROUP1_SHA1:
+     case SSH_KEX_DH_GROUP14_SHA1:
+@@ -1450,6 +1452,7 @@ int ssh_make_sessionid(ssh_session session)
+                session->next_crypto->secret_hash);
+         break;
+     }
++
+     /* During the first kex, secret hash and session ID are equal. However, after
+      * a key re-exchange, a new secret hash is calculated. This hash will not replace
+      * but complement existing session id.
+@@ -1458,6 +1461,7 @@ int ssh_make_sessionid(ssh_session session)
+         session->next_crypto->session_id = malloc(session->next_crypto->digest_len);
+         if (session->next_crypto->session_id == NULL) {
+             ssh_set_error_oom(session);
++            rc = SSH_ERROR;
+             goto error;
+         }
+         memcpy(session->next_crypto->session_id, session->next_crypto->secret_hash,
+-- 
+2.43.5
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index bf91e69bc8..602e01fce6 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-4878-0001.patch \
            file://CVE-2025-4878-0002.patch \
            file://CVE-2025-5987.patch \
+           file://CVE-2025-8114.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 

