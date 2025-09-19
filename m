Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01488CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:04:16 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web11.13034.1758277846685004668
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:30:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EfUMKIhb;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3265; q=dns/txt;
  s=iport01; t=1758277846; x=1759487446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LpXwuIFgxrcScSX3J68h8SHDDD1xRfmEFdMZqGLILOA=;
  b=EfUMKIhb6jUcblm4qI4lIQGcVZ9BEuo2VlosYxx2B/o6AajNP1sy7oBw
   mU4Da8nu3tta0fskgR9nxpeF+xUzhdHF2ZGLZ2jRR0X+pjC92IcVSArQu
   KSVbIC/QA/7O0ZD/7wzDc+VW8viOZOw7PAQ01ABesSAp1LrnSpmnCFYeD
   rhudnjSxulqmsT0f56ZJAeJ8JGjZlEp7qPlUwgB0pefJBX4EAO9Pcyide
   56lnO7DwesVVAipZZ8s7Fp/f3w3CYmxZ9hi9HMEp+IBSfmX2RzwDMEoCD
   oKufre68k7jC1S9VbPBzZY5Fmup6/TPWTQu8Tx+1LI8l+gfa7Z7lDAEVf
   g==;
X-CSE-ConnectionGUID: ZloIe+HERViWhF2CBi0UMQ==
X-CSE-MsgGUID: 9LDBjORIRq+gJGXT0T2QQA==
X-IPAS-Result: =?us-ascii?q?A0AHAACmL81o/5P/Ja1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBggAEAQEBAQsBgkZ7WUNJlkUDnhqBfw8BAQEPPRQEAQGFBwKMN?=
 =?us-ascii?q?wImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GW?=
 =?us-ascii?q?gECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnIDEbcEgXkzgQGDKAExBQkCQ0/bK?=
 =?us-ascii?q?oFJAY1MbwGEdycbG4FygRWBO4ItgQWBXAEDGIgKBIIigQIUii+GAn2BXhsZi?=
 =?us-ascii?q?U5IgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdgSeDYYEqhB4rT4UChGskaw8Gg?=
 =?us-ascii?q?RWDWwaHHkADCxgNSBEsNxQbBj5uB5YWgysHewkKASuCFBgOA5MUkk+hDgoog?=
 =?us-ascii?q?3SMHpU5GjOqa5kGjgiWUIRpgWoBOYFHCwdwFYMiCUkZD44sDAuFXYMUv2smM?=
 =?us-ascii?q?gI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:RMDiAquiA42b1ThuzWrjq8HG1+fnVAZfMUV32f8akzHdYApBsoF/q
 tZmKTiAP6qPMzT8fd93Ptnl9U0GuJ7Ryt9mSVNu/3hhESNDgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav676yAlj8lkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuGaDdJ5xYuajhJs/Pa+Us11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwyOJwIGwN1
 dEiFjEybj7ZrMi3mI+ec7w57igjBJGD0II3oHpsy3TdSP0hW52GGv2M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtIYH49tL/Aan3XejFfrl2cv6cf6GnIxws327/oWDbQUoHXGp8OzhbE/
 goq+UyoJj0wNvul6ACcsX2Oqd/zxR+hYbs7QejQGvlCxQf7KnYoIBoOWF22pPO0hkKzV5dTJ
 lIZ/gIqrLMu7wqsVtT7UhiyrXKIsxJaXMBfe9DW8ymXwabSpgLcDW8eQ3sYMJottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvpUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:9iK10qNs6xvJrcBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZq/z/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: 9a23:PTAPwG2evoO5l2aESTzX/bxfKMQiU3Ce7FrqHU6HCUgzY5eUEWK1wfYx
X-Talos-MUID: 9a23:w3/qoQbeZqAnM+BT5hvArjNFDuZS+uehKm89rc064fC9HHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="557238840"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Sep 2025 10:30:45 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id A241D18000278;
	Fri, 19 Sep 2025 10:30:45 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 26D58CC1288; Fri, 19 Sep 2025 03:30:45 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH 2/2] libssh 0.10.6: Fix CVE-2025-8114
Date: Fri, 19 Sep 2025 03:30:35 -0700
Message-ID: <20250919103036.2907344-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250919103036.2907344-1-adongare@cisco.com>
References: <20250919103036.2907344-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 12:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119595

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://git.libssh.org/projects/libssh.git/

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8114
Type: Security Fix
CVE: CVE-2025-8114
Score: 4.7
Patch: https://git.libssh.org/projects/libssh.git/commit/?id=53ac23ded4cb

Signed-off-by: Anil Dongare <adongare@cisco.com>
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
index 1669155264..01ee1859c9 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-5351.patch \
            file://CVE-2025-5372.patch \
            file://CVE-2025-5987.patch \
+           file://CVE-2025-8114.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.44.1


