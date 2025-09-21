Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01527CAC5A8
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 11:43:30 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web10.24598.1758437579338480991
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 23:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=E24zVkiC;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2700; q=dns/txt;
  s=iport01; t=1758437579; x=1759647179;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y3CpBCvLwfi2VfGd6KmkHcgoY4q2jVALOEwMf3ZPp7w=;
  b=E24zVkiCv+UMqB25eqX9ee/qzb8i4UpzZ9NhfovfAbzAAXtJk6pQsmQv
   YCWfxjbkZfSzbhakF+bkyW4tGqDEe1+7NTz6eiAdXrvzDGrqaTVUbw6kg
   5L29/IOz/u50GQkdEZBGGRnR0kzsN9aCNCEl07kHoBpp9c6OpFXIoS1x2
   yJQ4tG+utrjmB7/YNLE8k6McXNPBhsCJJIY5csngVwwt8k6k6jLHcMlJI
   UJoiuxgPZ+WYU5oB/XoYZjTaMZ76h4aT9HGPfiNw5fsfodtaWRJSZ4p1x
   f8ego6wAo/mzsYCYzcVAtbW08AnLnQh2I4EnMGIlMrMD/vSeHFMfMHe59
   A==;
X-CSE-ConnectionGUID: VplwznPJSs6ih/0Lmbb5Dg==
X-CSE-MsgGUID: +ZsibL7CRyu4kUqjHjfNGQ==
X-IPAS-Result: =?us-ascii?q?A0ANAABLoM9o/5EQJK1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF/BgEBAQsBgkZ7WUNJjHCJVZ4dgX8PAQEBDz0UBAEBhQeMPwImNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECASoLA?=
 =?us-ascii?q?RgBLSwDAQJaIyGDAgGCcgMRtS2BeTOBAYMoATEFCQJDT9sqgUkBjUxvAYR3J?=
 =?us-ascii?q?xsbgXKBFYE7gi2BBYFcAQMYghOFdwSCIoECFJAxfYFeNIliSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBYwM1DAsuFW4yHYEng2GBKoQeK0+FAoRrJGsPBoEVg1sGhzFAAwsYD?=
 =?us-ascii?q?UgRLDcUGwY+bgeWJoMygQ4BK4IUGBGTFAmSRoE1n1kKKIN0jB6VORozqmuZB?=
 =?us-ascii?q?o4IllCEaYFoPIFHCwdwFYMiCUkZD444hWiDFMIuJjICOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:NE0Bn65qjNXyIzFkS497rQxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jBOWG+COf2DNGanft11ad7i908F78KDz9RkSVdqrng0Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH3dOG49xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr86UzBHf/g2QpajNOs/rYwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eA5Uc5fRxOUN17
 qIZKHdVShWJjb+az+fuIgVsrpxLwMjDNYcbvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCN3w2MlKZP0An1lQ/UPrSmM+hin75fDRCpXqepLE85C7YywkZPL3FbYeLJI3VHZwJ9qqej
 iH05GXzJk4xDs2ClTm463CMhOHpshquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:MxEBa63nQ8iwtnXgsDi5pAqjBLkkLtp133Aq2lEZdPWaSKOlfq
 eV7ZEmPHDP6Qr5NEtMpTniAtjjfZq/z/5ICOAqVN/INjUO01HHEGgN1+ffKkXbak7DHio379
 YGT0C4Y+eAaWRHsQ==
X-Talos-CUID: 9a23:yfpMgmE/AeDLCZHVqmJZ7EoLCMYdUEbGknbQZBecDGxjFZGaHAo=
X-Talos-MUID: 9a23:j5i9JQuJFjGAOE52g82nxwN5Nc1MvI+UGV1RkqgfuemGOwpfAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,282,1751241600"; 
   d="scan'208";a="556697014"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Sep 2025 06:52:58 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 52E7818000743;
	Sun, 21 Sep 2025 06:52:58 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id E7BFACC1288; Sat, 20 Sep 2025 23:52:57 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH 1/2] libssh 0.10.6: Fix CVE-2025-5987
Date: Sat, 20 Sep 2025 23:52:52 -0700
Message-ID: <20250921065254.3548083-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 11:43:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119626

From: Anil Dongare <adongare@cisco.com>

Upstream Repository: https://git.libssh.org/projects/libssh.git/

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-5987
Type: Security Fix
CVE: CVE-2025-5987
Score: 5
Patch: https://git.libssh.org/projects/libssh.git/commit/?id=90b4845e0c98

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../libssh/libssh/CVE-2025-5987.patch         | 36 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
new file mode 100644
index 0000000000..1df2d85dc6
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
@@ -0,0 +1,36 @@
+From 6da35fadb8af6ec6fec7f01c2054e10caf233d77 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 6 May 2025 22:51:41 +0200
+Subject: [PATCH] CVE-2025-5987 libcrypto: Correctly detect failures of chacha
+ initialization
+
+CVE: CVE-2025-5987
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=90b4845e0c98]
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+(cherry picked from commit 90b4845e0c98574bbf7bea9e97796695f064bf57)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
+---
+ src/libcrypto.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index 4f945d90..911b3630 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -777,9 +777,9 @@ chacha20_poly1305_set_key(struct ssh_cipher_struct *cipher,
+         SSH_LOG(SSH_LOG_WARNING, "EVP_CIPHER_CTX_new failed");
+         goto out;
+     }
+-    ret = EVP_EncryptInit_ex(ctx->header_evp, EVP_chacha20(), NULL,
++    rv = EVP_EncryptInit_ex(ctx->header_evp, EVP_chacha20(), NULL,
+                              u8key + CHACHA20_KEYLEN, NULL);
+-    if (ret != 1) {
++    if (rv != 1) {
+         SSH_LOG(SSH_LOG_WARNING, "EVP_CipherInit failed");
+         goto out;
+     }
+-- 
+2.43.5
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 48cb47d4c0..dc8904fada 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-5351.patch \
            file://CVE-2025-5372.patch \
            file://CVE-2025-4877.patch \
+           file://CVE-2025-5987.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.44.1


