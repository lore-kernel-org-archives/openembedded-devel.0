Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC655CD4F28
	for <webhook@archiver.kernel.org>; Thu, 13 Nov 2025 06:21:25 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17735.1763014878993780059
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Nov 2025 22:21:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f/nLNpTB;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b4933bc4bbso414161b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Nov 2025 22:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763014878; x=1763619678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfCyvUJENUdMcLoSRqJSsYJIt0ozb5oWIjUpei+Dgbc=;
        b=f/nLNpTBaRAfSa42bK38dv6xk3GrJgNSfm7XeoOtdtDiFrIeB8ACOkFSuKJBs+PZn4
         Y9XoGygKSIs83ikDTD7dUPb0i0w7lTWIcGjX2vhtlTje1/LUMOUnTwwaZVSMo/xSgBuA
         QIxFgGusMQRHJMabGylZfQYekZHT/zIqv28uJOLhmKfgSosomYFaXOWUQWUDfhMZrX3F
         2eGJUzkVpCmOJsDx1sf5qvSN4ieTKgDe4byuXXmNptD2f3vBFxvQJz77cJkdtTM25Dqn
         T0y/1y/C4ABFycF4F3/Ze0NUHW7806RtI0ItiGWptGHET3sOVNHAbaaICCriU4tnG4+4
         mCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763014878; x=1763619678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xfCyvUJENUdMcLoSRqJSsYJIt0ozb5oWIjUpei+Dgbc=;
        b=PSAvj1GHl1XHOQbRiGFEWr7P5hbKL4crbLAE+nqNZgPZkTKVCjknlbvchvsyccxyeU
         Vx5dA2NHkT3oL7auisMFlfJApqRCAHaNSou6CpDWkiqhuPJMo2zRjKPrY64DBv/IsJGi
         wDXl0IfuoxD5kVbr3Mdsrzl3UOdErncaQwn4Lw6aIu13+uNHn8I7arwbc92SrG4nAS7Y
         Lq8B0UjNOUjWskvIhf3jVeywumdq678DcDpXSILgpr9MZcnWOU1l4oxLlzIoaYe4sw9V
         IzsSmXizTIqkb6OyPakQHcDzPpSHZRbpdFtcb+OHsxOVN4xZ5OPsI1ZuqA2nVckOHQZT
         gUlQ==
X-Gm-Message-State: AOJu0YzWdtz2dl7x17Wa7Q3qRu0ap/bju76lx3L0DJy5AZvyiFJ9T+4o
	eK8GFI3e2jZPhTwseYI47AaO/MG+RTA8FCHAGDWswr6LYdgi4ZDbPl4QwyBCgA==
X-Gm-Gg: ASbGncs8sRQ9EnmYRWF4tPJMJ0ivWCwr1k26qQ1E2O+yatBUAASUV2kVB/t5bgMov5q
	oKs+0AE50j3Qim0zxeSz1aOoBj6z5ubOyc/CIiXb3RU8Kovx/0w9Iunc7yCnNrMfDL9WNpP9ByZ
	IVoAFC94hJrS0HOFmaoethPNwHi+8x3/1KCKZLkkCXxK8jlwQ9qEgaT+mWlDvKWqNCnG9TFG2DL
	gcRdU6SM1+lpgBFo3GObVuzIV6Tvt1WkZZj1Mump4vQ/zGTPmq3n05s8C+zxbhVYGIRbQSaPoTI
	ElwZsD0nyCoBhRirbKmEBRrTeiZgWYSzSoPHasT/xaGWyPJ/GG7AqrWekQ6UZDOq0/YaExdALZ1
	g98nvUfe/KWW1KyLx/fs1wnz2ov2oaTiXO7UWvpmbTKx3cQdZ+Bnv4dELuWgXUxFisdMHz/PlAl
	fmWRzWq0rxgPrlUQ==
X-Google-Smtp-Source: AGHT+IHBR0Lg/cS3N7EoNfBltWMF0kp7qGMy4+bOqzE9ire1AEN/PQVmGPMrHuGssYR1xNvuQjZblg==
X-Received: by 2002:a05:6a00:23c2:b0:7aa:d1d4:bb7b with SMTP id d2e1a72fcca58-7b8e224bb86mr2990912b3a.16.1763014878250;
        Wed, 12 Nov 2025 22:21:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b927d1c413sm1000454b3a.69.2025.11.12.22.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 22:21:17 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 38/38] botan: patch CVE-2024-34703
Date: Thu, 13 Nov 2025 19:19:13 +1300
Message-ID: <20251113061914.3756301-38-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
References: <20251113061914.3756301-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Nov 2025 06:21:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121636

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-34703

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../botan/botan/CVE-2024-34703.patch          | 38 +++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_3.2.0.bb   |  4 +-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch b/meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch
new file mode 100644
index 0000000000..e3fadc4818
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/CVE-2024-34703.patch
@@ -0,0 +1,38 @@
+From 59d92780f79c73d735c71620adef40bb13a87ce2 Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Tue, 20 Feb 2024 06:30:10 -0500
+Subject: [PATCH] When decoding an arbitrary elliptic curve, set an upper bound
+ on length
+
+Otherwise it's trivial to send a very large prime, which can take a
+significant amount of computation to check.
+
+Reported by Bing Shi
+
+CVE: CVE-2024-34703
+Upstream-Status: Backport [https://github.com/randombit/botan/pull/3913/commits/fbe9ec578a8548958677224d2e60d2c2c838bc9a]
+(cherry picked from commit fbe9ec578a8548958677224d2e60d2c2c838bc9a)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/lib/pubkey/ec_group/ec_group.cpp | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/pubkey/ec_group/ec_group.cpp b/src/lib/pubkey/ec_group/ec_group.cpp
+index eb4ed90e2..beaeedd51 100644
+--- a/src/lib/pubkey/ec_group/ec_group.cpp
++++ b/src/lib/pubkey/ec_group/ec_group.cpp
+@@ -357,8 +357,12 @@ std::pair<std::shared_ptr<EC_Group_Data>, bool> EC_Group::BER_decode_EC_group(co
+          .end_cons()
+          .verify_end();
+ 
+-      if(p.bits() < 64 || p.is_negative() || !is_bailie_psw_probable_prime(p)) {
+-         throw Decoding_Error("Invalid ECC p parameter");
++      if(p.bits() < 112 || p.bits() > 1024) {
++         throw Decoding_Error("ECC p parameter is invalid size");
++      }
++
++      if(p.is_negative() || !is_bailie_psw_probable_prime(p)) {
++         throw Decoding_Error("ECC p parameter is not a prime");
+       }
+ 
+       if(a.is_negative() || a >= p) {
diff --git a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
index 1fdda65a05..3c603a9b26 100644
--- a/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
+++ b/meta-oe/recipes-crypto/botan/botan_3.2.0.bb
@@ -4,7 +4,9 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://license.txt;md5=f5254d3abe90ec5bb82c5694ff751546"
 SECTION = "libs"
 
-SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz"
+SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
+           file://CVE-2024-34703.patch \
+"
 SRC_URI[sha256sum] = "049c847835fcf6ef3a9e206b33de05dd38999c325e247482772a5598d9e5ece3"
 
 S = "${WORKDIR}/Botan-${PV}"

