Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00354CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 11:43:30 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web11.25005.1758437580702241367
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 23:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GNEGPMTe;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3265; q=dns/txt;
  s=iport01; t=1758437580; x=1759647180;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R0va2R9u3tnyL8L6QuLoFfkxd4lVqEd+pP04XvZWBl8=;
  b=GNEGPMTe1dbwA22yCEIINGfIBuNxlZD4CR6H2rxuN2XOYAQlMf+Lwmke
   2esZmnpfyLopRjH25u05WmAOiU8TMG8px7YuLlwSZ9q1jD7n5x5eB2m4/
   e+SbemRHmIqGNQLWeFA8Z+lXCwbG9dUAtakQMaq9Q33BKrawgONA3LgbF
   LhCVOYNR7v6g7O9ee0ASuIchKsIRbNY6ZkpKL/eVXm6m/1yqAuPvX9oLe
   GyJIpNqEql3cV6nnBtKSzTPeOOJ3wRC9Y9YF8P+kX3aEl7JQ4G+h/nLxB
   P06OGwsLQlyygxc5zehL28ieYRME65rs7bveVfzhs2gJ095utM7/VXwm0
   A==;
X-CSE-ConnectionGUID: VK0cYxbhTCStOwuD/RfBwA==
X-CSE-MsgGUID: mlRPO8HvTBSyqZJsp+LvJA==
X-IPAS-Result: =?us-ascii?q?A0AHAABLoM9o/5AQJK1aGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBggAEAQEBAQsBgkZ7WUNJlkUDnhqBfw8BAQEPPRQEAQGFBwKMP?=
 =?us-ascii?q?QImNQgOAQIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GW?=
 =?us-ascii?q?gECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnIDEbUtgXkzgQGDKAExBQkCQ0/bK?=
 =?us-ascii?q?oFJAY1MbwGEdycbG4FygRWBO4ItgQWBXAEDGIgKBIIigQIUii+GAn2BXhsZi?=
 =?us-ascii?q?WJIgR4DWSwBVRMNCgsHBYFjAzUMCy4VbjIdgSeDYYEqhB4rT4UChGskaw8Gg?=
 =?us-ascii?q?RWDWwaHMUADCxgNSBEsNxQbBj5uB5YmgysHewkKASuCFBgOA5MUkk+hDgoog?=
 =?us-ascii?q?3SMHpU5GjOqa5kGjgiWUIRpgWoBOYFHCwdwFYMiCUkZD44sDAuFXYMUwi4mM?=
 =?us-ascii?q?gI6AgcLAQEDCZNnAQE?=
IronPort-Data: A9a23:3XiWXajoYo3D3BeXXH9l73o3X161MREKZh0ujC45NGQN5FlHY01je
 htvUGCFb66IMTf8L4t/Pd++9U5S7ZTczNBgGgU/pXo0QitjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOKn9CAmvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZSPULOZ82QsaD9Muvjb8EgHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUm2b58MHFE9
 cAzEywqcQ2vwNi46q2SH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbHOPB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQTZj/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKIJ4zQFJgLzx3wS
 mTu+mDDOjZKFMKj4wGU60COnfeMuT3ZcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmEHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn2891te5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:cHhRnKjXhBNLjLsDwdKL/61l9nBQXt0ji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4aXLfDtHZQKQ2njALz7mq+P3lpyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ATOUc1moZ67kCOcagF4HPmVTmUf4GKnbs3H3QH2S?=
 =?us-ascii?q?DFUF2VZHSc1G654oxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A+CyzkA/ehGnXG9yhKFAngMKQf8Js2ZyJWGATrb8?=
 =?us-ascii?q?9qtC2FzdoeBODrh3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,282,1751241600"; 
   d="scan'208";a="558295693"
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Sep 2025 06:52:59 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id B1E8218000344;
	Sun, 21 Sep 2025 06:52:59 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 5899FCC1288; Sat, 20 Sep 2025 23:52:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH 2/2] libssh 0.10.6: Fix CVE-2025-8114
Date: Sat, 20 Sep 2025 23:52:53 -0700
Message-ID: <20250921065254.3548083-2-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250921065254.3548083-1-adongare@cisco.com>
References: <20250921065254.3548083-1-adongare@cisco.com>
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 11:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119627

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
index dc8904fada..afe131ccbc 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-5372.patch \
            file://CVE-2025-4877.patch \
            file://CVE-2025-5987.patch \
+           file://CVE-2025-8114.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.44.1


