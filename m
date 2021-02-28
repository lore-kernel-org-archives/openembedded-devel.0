Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web09.6904.1614522677260972316
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Feb 2021 06:31:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.81,213,1610380800"; 
   d="scan'208";a="104951495"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 28 Feb 2021 22:31:15 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E7D624CE72EE
	for <openembedded-devel@lists.openembedded.org>; Sun, 28 Feb 2021 22:31:11 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Sun, 28 Feb 2021 22:31:03 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] iwd: upgrade 1.11 -> 1.12
Date: Sun, 28 Feb 2021 22:31:00 +0800
Message-ID: <1614522660-90523-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E7D624CE72EE.A46CA
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

From: Wang Mingyu <wangmy@cn.fujitsu.com>

0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch
Removed since this is included in 1.12.

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...ate-l_pkcs5_pbkdf2-call-after-rename.patch | 31 -------------------
 .../iwd/{iwd_1.11.bb => iwd_1.12.bb}          |  3 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch
 rename meta-oe/recipes-connectivity/iwd/{iwd_1.11.bb => iwd_1.12.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch
deleted file mode 100644
index ab55b48b75..0000000000
--- a/meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9389f472bc724abb6c6a8db696efb132215783cc Mon Sep 17 00:00:00 2001
-From: Andrew Zaborowski <andrew.zaborowski@intel.com>
-Date: Thu, 24 Dec 2020 00:22:15 +0100
-Subject: [PATCH] crypto: Update l_pkcs5_pbkdf2 call after rename
-
----
-Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=9ef3d51f8724c9b9f9fd4d4fffcc730f4bb1c806]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- src/crypto.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/src/crypto.c b/src/crypto.c
-index f5f8e24d..563f17ce 100644
---- a/src/crypto.c
-+++ b/src/crypto.c
-@@ -552,8 +552,9 @@ int crypto_psk_from_passphrase(const char *passphrase,
- 	if (ssid_len == 0 || ssid_len > 32)
- 		return -ERANGE;
- 
--	result = l_pkcs5_pbkdf2(L_CHECKSUM_SHA1, passphrase, ssid, ssid_len,
--				4096, psk, sizeof(psk));
-+	result = l_cert_pkcs5_pbkdf2(L_CHECKSUM_SHA1, passphrase,
-+					ssid, ssid_len, 4096,
-+					psk, sizeof(psk));
- 	if (!result)
- 		return -ENOKEY;
- 
--- 
-2.30.0
-
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
rename to meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
index 2205b72fff..ccdc65ac6c 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.12.bb
@@ -6,9 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 DEPENDS = "ell"
 
 SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
-           file://0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch \
           "
-SRCREV = "355c2df97e1adfdaee4a67c1705bd76202384687"
+SRCREV = "bde3e0f6e3364e9c884b6b93a944d8138345b8e5"
 S = "${WORKDIR}/git"
 
 inherit autotools manpages pkgconfig python3native systemd
-- 
2.25.1



