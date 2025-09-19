Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0281DCAC5A5
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 12:04:16 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web11.13032.1758277845092680613
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 03:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O3Ai2/K+;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2700; q=dns/txt;
  s=iport01; t=1758277845; x=1759487445;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2OPqvutPvLa7zyRjKnSAsF6VeKHQ1deY61vVauo3EKg=;
  b=O3Ai2/K+IJ3Epk3VlAi/v7x/fA/9T5ctgNv/k7vUY8sAypEaNeyE9phl
   BcOGDCZIEbx+FFbPLwVl3jzGpgSEBu+joULk9oR7/1g6a483SLbrzwGz+
   k6yyW878zKW3ZWXpuOmaiuOs6G2yk2aHnuMcs9FTgDIv98xtTB0oIFqgR
   FSUq5//IHy1AexVAql/buVmpB8NiqBr8ersmw227obDyUsNOftxNnAjRW
   NZ9uCOwHtQZ1Da0xIfkQFCSAPuAcz2EVAblkLfsbT44ajhizqdRn79/8A
   3Cvzjh8NIfIKm16ZS1U3Av/oIull+TxBNoTVOb+PhSsE6/x6EuOROhqSC
   A==;
X-CSE-ConnectionGUID: vlHobeRbRYWwLUXo5057rw==
X-CSE-MsgGUID: 8T45SfZVQpCugt53SnwxNw==
X-IPAS-Result: =?us-ascii?q?A0ANAACmL81o/4z/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF/BgEBAQsBgkZ7WUNJjHCJVZ4dgX8PAQEBDz0UBAEBhQeMOQImNAkOA?=
 =?us-ascii?q?QIEAQEBAQMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGTw2GWgECASoLA?=
 =?us-ascii?q?RgBLSwDAQJaIyGDAgGCcgMRtwSBeTOBAYMoATEFCQJDT9sqgUkBjUxvAYR3J?=
 =?us-ascii?q?xsbgXKBFYE7gi2BBYFcAQMYghOFdwSCIoECFJAxfYFeNIlOSIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBYwM1DAsuFW4yHYEng2GBKoQeK0+FAoRrJGsPBoEVg1sGhx5AAwsYD?=
 =?us-ascii?q?UgRLDcUGwY+bgeWFoMygQ4BK4IUGBGTFAmSRoE1n1kKKIN0jB6VORozqmuZB?=
 =?us-ascii?q?o4IllCEaYFoPIFHCwdwFYMiCUkZD444hWiDFL9rJjICOgIHCwEBAwmTZwEB?=
IronPort-Data: A9a23:Id70b6DLvm1mtRVW/3niw5YqxClBgxIJ4kV8jS/XYbTApD4l3mMCm
 jYfXGGFaa2La2fwL90jbIm/p0xTvsTWyIBhOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGdIZuCCaF/H9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357gU2thh
 fuo+5eCYA78imYuWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE3fFOC0s7B4ciy9loJVx+8
 qFAdW8XcUXW7w626OrTpuhEnM8vKozveYgYoHwllWqfBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY3BPjDS0Un1lM/AZ45muihnHTXeDxDo1XTrq0yi4TW5FEui+GwaYGFJrRmQ+0FohrFn
 Wz0wV3hKQwVKIHE8jya4lSz07qncSTTHdh6+KeD3vlyjVuew2YeBBEbWR63rOe0jma6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MuECSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXLIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:Lc4uha7raiRBLXUvRgPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBEDjexPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:o3NS+m9sy051+I8xJjSVv1AQOscvf0fX9kbvPGuFOWE0EODKU0DFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AaonERQ7fjWjcpLZqL8AjhwNrxow43/jzM04/r6w?=
 =?us-ascii?q?ekNSLKXErADGCnBKoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="573151384"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Sep 2025 10:30:44 +0000
Received: from sjc-ads-10055.cisco.com (sjc-ads-10055.cisco.com [10.30.210.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id 2A7C718000587;
	Fri, 19 Sep 2025 10:30:44 +0000 (GMT)
Received: by sjc-ads-10055.cisco.com (Postfix, from userid 1870532)
	id 98C6FCC1288; Fri, 19 Sep 2025 03:30:43 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [meta-openembedded] [scarthgap] [PATCH 1/2] libssh 0.10.6: Fix CVE-2025-5987
Date: Fri, 19 Sep 2025 03:30:34 -0700
Message-ID: <20250919103036.2907344-1-adongare@cisco.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 10.30.210.59, sjc-ads-10055.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 12:04:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119594

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
index 64835c5e08..1669155264 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-5318.patch \
            file://CVE-2025-5351.patch \
            file://CVE-2025-5372.patch \
+           file://CVE-2025-5987.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 
-- 
2.44.1


