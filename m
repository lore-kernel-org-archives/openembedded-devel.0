Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB95CAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:57:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=M+bzEifa;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628665; x=1790164665;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=VYoqVT4u0ExckCOF8KXv7+FdGTR1DEQD+IIYxyXAHv8=;
  b=M+bzEifa4zHQAnjgXnIVHkEOizhssJ4n/M1uazHqEspivmqgTpdsq6Gl
   Xizs62E2G0Y3BKolwTuA+BZckoIFWRCiAOz0sTEirWDyXau/ZFsWlPS7f
   aiYOHzMnIYztLTDZYtlmCFEI3wehokh9iSExmd4S5N4l2VsszpvXCF/6T
   sFCDpOgKPnphYBiUi8c+1oGl4iM6cCtMkj5Noqdreui8y9fDCbSVntYF8
   bZNAqWHjL0Ap8zPcTv8FtW4R2UcONp2CurF0DRjhbGEgq+3uHpr+iEDap
   RN3MORM3MmIJnLXI0ueKDQuV/TT8O/mNsVHWYOWX+32OeMQWaoYrQ5LG/
   g==;
X-CSE-ConnectionGUID: j05V/HaKS02sUn3fa5lSmA==
X-CSE-MsgGUID: 826gE+w7Q4G3cpUbQCe7yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821777"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821777"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:44 -0700
X-CSE-ConnectionGUID: AIdW1BD3TI2s3XJMvhtIKA==
X-CSE-MsgGUID: hm17l6gbRfCF3WdhsM8BTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875125"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:57:43 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 02/24] libssh: fix CVE-2025-5987
Date: Tue, 23 Sep 2025 19:57:05 +0800
Message-ID: <3702195a7ebb1947c8dfc9bba1196d6b42ae6253.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:57:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119691

From: Divya Chellam <divya.chellam@windriver.com>

A flaw was found in libssh when using the ChaCha20 cipher with the
OpenSSL library. If an attacker manages to exhaust the heap space,
this error is not detected and may lead to libssh using a partially
initialized cipher context. This occurs because the OpenSSL error
code returned aliases with the SSH_OK code, resulting in libssh not
properly detecting the error returned by the OpenSSL library.
This issue can lead to undefined behavior, including compromised
data confidentiality and integrity or crashes.

Reference:
https://security-tracker.debian.org/tracker/CVE-2025-5987

Upstream-patch:
https://git.libssh.org/projects/libssh.git/commit/?h=stable-0.11&id=90b4845e0c98574bbf7bea9e97796695f064bf57

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libssh/libssh/CVE-2025-5987.patch         | 37 +++++++++++++++++++
 .../recipes-support/libssh/libssh_0.10.6.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch

diff --git a/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
new file mode 100644
index 0000000000..08395e0e7d
--- /dev/null
+++ b/meta-oe/recipes-support/libssh/libssh/CVE-2025-5987.patch
@@ -0,0 +1,37 @@
+From 90b4845e0c98574bbf7bea9e97796695f064bf57 Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Tue, 6 May 2025 22:51:41 +0200
+Subject: [PATCH] CVE-2025-5987 libcrypto: Correctly detect failures of chacha
+ initialization
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+Reviewed-by: Andreas Schneider <asn@cryptomilk.org>
+
+CVE: CVE-2025-5987
+
+Upstream-Status: Backport [https://git.libssh.org/projects/libssh.git/commit/?id=90b4845e0c98574bbf7bea9e97796695f064bf57]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ src/libcrypto.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libcrypto.c b/src/libcrypto.c
+index 76e067d3..69a850de 100644
+--- a/src/libcrypto.c
++++ b/src/libcrypto.c
+@@ -771,9 +771,9 @@ chacha20_poly1305_set_key(struct ssh_cipher_struct *cipher,
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
+2.40.0
+
diff --git a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
index 6932da5175..bf91e69bc8 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.10.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://git.libssh.org/projects/libssh.git;protocol=https;branch=stable
            file://CVE-2025-4877.patch \
            file://CVE-2025-4878-0001.patch \
            file://CVE-2025-4878-0002.patch \
+           file://CVE-2025-5987.patch \
           "
 SRCREV = "10e09e273f69e149389b3e0e5d44b8c221c2e7f6"
 

