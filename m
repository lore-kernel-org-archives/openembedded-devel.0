Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web08.18095.1612687277592389327
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 Feb 2021 00:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=G467MSxO;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id o21so6890674pgn.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 Feb 2021 00:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2cACqlfM9fNicf/p3i2vj9j6U/9795sF0fzFNOrMpA=;
        b=G467MSxO0TFioS4hAI4SLSHSBZqh8pxsvsbasLoRzld30FMFfLBn1cmq6vMnGkBoDZ
         bIs2To5w3b6dtDSn/+3/O5uCdqOHL4djx7PF7vcIaRFif1UASemcJKYeOOh7zCjpV3Bj
         qa4tyGvdl9g35dPrcAwmeqkAAi6r2mizgzs5ruo05h7XtofUh4OTsBWh3Psg4jmERtHM
         x17g7WmTt7CLhy7gEIE/ynxu00kGN7GR8CUwkAIojHDCa2EQvfd8t/LH69GpFwBu1Qsf
         SQQyCKe9FvY73ttZZno4mhDRytnRCo3sORwJz+mM10QaXTlzNBkEYG1NKeGz4eJ4gkax
         +qgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=h2cACqlfM9fNicf/p3i2vj9j6U/9795sF0fzFNOrMpA=;
        b=RRds6gu0+jsCuU9/zwvFSQ1FKyRrFeD2WVPDdx5S/zCZ+EcNQBDyGdJUB0RsTvWLmb
         zxH6K9FzDx6+oPrvM3UNFJUqXDJCfrSBSZSH27cT3sx90EgYxfEnPUQU+YN0wRE6pSeP
         BTNbLvry2KyhjCQelMaAySo8OBlf8I+8ueE8CVRchwrdDIjkvwyIJd+MmRnVrrUJRxvq
         ak9Quu0ZfxDoEwDjZMCogMiq+855haruETwauksEekCqSx6FLiME0oHNUCDvP556a3No
         ryqN3NffsapDTALCy/nYyADiBeQ3c0iRRcca+MN6liO/xBcv7z7DwCy7YFDUjQGXh38O
         U7QQ==
X-Gm-Message-State: AOAM533dQmTDcUvNq3Fz+dji7jK8TsCuPkBTpIOjK8mX16oRqa6mct7x
	98davUQ9GSoeEVMqyyMjghnKgJwbepieNA==
X-Google-Smtp-Source: ABdhPJwKt/OeuLPRJj04W33KSrIMxffGev+lMtYJjSiAVxOF9Wz2dbPKhlUr1WiMNqel4C6pp4jiaQ==
X-Received: by 2002:a63:480f:: with SMTP id v15mr12524942pga.341.1612687276698;
        Sun, 07 Feb 2021 00:41:16 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id j3sm6013381pgk.24.2021.02.07.00.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Feb 2021 00:41:16 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] iwd: Fix build with ell 0.37
Date: Sun,  7 Feb 2021 00:41:13 -0800
Message-Id: <20210207084113.1165127-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ate-l_pkcs5_pbkdf2-call-after-rename.patch | 31 +++++++++++++++++++
 meta-oe/recipes-connectivity/iwd/iwd_1.11.bb  |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch

diff --git a/meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch b/meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch
new file mode 100644
index 0000000000..ab55b48b75
--- /dev/null
+++ b/meta-oe/recipes-connectivity/iwd/iwd/0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch
@@ -0,0 +1,31 @@
+From 9389f472bc724abb6c6a8db696efb132215783cc Mon Sep 17 00:00:00 2001
+From: Andrew Zaborowski <andrew.zaborowski@intel.com>
+Date: Thu, 24 Dec 2020 00:22:15 +0100
+Subject: [PATCH] crypto: Update l_pkcs5_pbkdf2 call after rename
+
+---
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=9ef3d51f8724c9b9f9fd4d4fffcc730f4bb1c806]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+ src/crypto.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/crypto.c b/src/crypto.c
+index f5f8e24d..563f17ce 100644
+--- a/src/crypto.c
++++ b/src/crypto.c
+@@ -552,8 +552,9 @@ int crypto_psk_from_passphrase(const char *passphrase,
+ 	if (ssid_len == 0 || ssid_len > 32)
+ 		return -ERANGE;
+ 
+-	result = l_pkcs5_pbkdf2(L_CHECKSUM_SHA1, passphrase, ssid, ssid_len,
+-				4096, psk, sizeof(psk));
++	result = l_cert_pkcs5_pbkdf2(L_CHECKSUM_SHA1, passphrase,
++					ssid, ssid_len, 4096,
++					psk, sizeof(psk));
+ 	if (!result)
+ 		return -ENOKEY;
+ 
+-- 
+2.30.0
+
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
index f4a237e033..2205b72fff 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
 
 DEPENDS = "ell"
 
-SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
+SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git \
+           file://0001-crypto-Update-l_pkcs5_pbkdf2-call-after-rename.patch \
+          "
 SRCREV = "355c2df97e1adfdaee4a67c1705bd76202384687"
 S = "${WORKDIR}/git"
 
-- 
2.30.0

