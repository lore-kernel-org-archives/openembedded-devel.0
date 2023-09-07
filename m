Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DBFEC8750
	for <webhook@archiver.kernel.org>; Thu,  7 Sep 2023 18:43:35 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.21469.1694112211063588085
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Sep 2023 11:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=s3KjJsN3;
 spf=pass (domain: gmail.com, ip: 209.85.216.45, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-26b44247123so1002857a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 11:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694112210; x=1694717010; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6pFTJYWd5fBi4CeCNmiX3v4/yMZMK1t22L5sRVMggvM=;
        b=s3KjJsN3WOGZHcXWN0SW0KIRSaeV+q1pu6XP0SxlSVkl4AIyu8I+HI2mzfEuhoGVws
         BvEjBzSrGDGsfKatu8YndEyItcyCbhzZ6fz9zt/pY/L0khk15jEim5zD5SPN1XZcdmTY
         zONSn1YUebSR7WlNrwxvvUTRQXhlwi/Icnel93jzy2cP7NIKotO07f2ItVGZAVSxNaKc
         /K7Ilueb5kCHoCGx1UJUrlts94BnMGW9TteiLc/WJp4KhGuQ1sn5hvzbRwFpP+An32YP
         OcXpLsVVWNGo1HtRraEtFC9cs/pG2YPOzJCIQ5Nu1JlB8IlU6zZD0zhRU3CC6r6bbmS5
         scBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694112210; x=1694717010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pFTJYWd5fBi4CeCNmiX3v4/yMZMK1t22L5sRVMggvM=;
        b=psTosiatpKe8C1ewK0FXFcOUzMNa49NXXPD9P+F0I46Rj4O9JUG2t+x54TarBN+69D
         /Fcjh630Q2U5NpFAkWgqf5wckJaHxtE4Ks/RKKooV1vPYy7o2xdzta2MIU/apVQ3e/UF
         fOTE9IpFQQXddZmklct3ncJktI+d/WW25RngaklL3uChXf2KXgOpz9tpIAQOp3TDz5lg
         4gP9OjD0Nbr0RmvXpRGXB89+qtEgTV80X1Xi+lDb+NxqN2HoIqWzRjZw+B4ynOFdMqi5
         usKMqc5dqC1CMCLgz321fOWTp2rTqPJDqbwbLTKa7IQSxPn5ymK9uA8ilqU6BPhk9lpF
         SxVQ==
X-Gm-Message-State: AOJu0YzXjQ7OndjJAgkDFuRIJb7DwpqkMB84fr7Dz8WCZ6gZ4fVjEb9+
	xyw0+/RII1QAQPZkwvJmscIARkcCJRIHNQ==
X-Google-Smtp-Source: AGHT+IF6GE1EzcOua28WcOpnH2N3jx2cad8o8lkCtniEKS3LRty6Dbd3+D9Z8yc1EIBScqDijd/IUw==
X-Received: by 2002:a17:90b:1645:b0:273:dad8:7404 with SMTP id il5-20020a17090b164500b00273dad87404mr179484pjb.16.1694112210101;
        Thu, 07 Sep 2023 11:43:30 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id v6-20020a17090a458600b002680dfd368dsm1562pjg.51.2023.09.07.11.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 11:43:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/2] openconnect: Fix build with GnuTLS v3.8.1
Date: Thu,  7 Sep 2023 11:43:26 -0700
Message-ID: <20230907184326.498115-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230907184326.498115-1-raj.khem@gmail.com>
References: <20230907184326.498115-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Sep 2023 18:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104795

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...g-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch | 43 +++++++++++++++++++
 .../openconnect/openconnect_9.12.bb           |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch

diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch b/meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch
new file mode 100644
index 0000000000..9dd3da75ad
--- /dev/null
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect/0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch
@@ -0,0 +1,43 @@
+From e4ea64134cfe3763332c16dcac52dd894b935880 Mon Sep 17 00:00:00 2001
+From: Daniel Lenski <dlenski@gmail.com>
+Date: Tue, 22 Aug 2023 12:02:19 -0700
+Subject: [PATCH] Shim for renaming of GNUTLS_NO_EXTENSIONS in GnuTLS v3.8.1
+
+The constant `GNUTLS_NO_EXTENSIONS` was renamed in
+https://gitlab.com/gnutls/gnutls/-/commit/a7c4a04e (released in v3.8.1), and
+then a backwards-compatibility shim was belatedly added in
+https://gitlab.com/gnutls/gnutls/-/commit/abfa8634, which has not yet been
+released.
+
+We need to re-add the constant ourselves in order to build correctly with
+GnuTLS v3.8.1.  This should fix
+https://gitlab.com/openconnect/openconnect/-/issues/650.
+
+Upstream-Status: Backport [https://git.infradead.org/users/dwmw2/openconnect.git/commit/7512698217c4104aade7a2df669a20de68f3bb8c]
+Signed-off-by: Daniel Lenski <dlenski@gmail.com>
+---
+ gnutls-dtls.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gnutls-dtls.c b/gnutls-dtls.c
+index 3fd78e95..50a4bb4e 100644
+--- a/gnutls-dtls.c
++++ b/gnutls-dtls.c
+@@ -39,6 +39,14 @@
+ # define GNUTLS_CIPHER_CHACHA20_POLY1305 23
+ #endif
+ 
++#if GNUTLS_VERSION_NUMBER >= 0x030801 && !defined(GNUTLS_NO_EXTENSIONS)
++/* XX: GNUTLS_NO_EXTENSIONS was renamed in GnuTLS v3.8.1. A
++ * backwards-compatibility shim was added in a subsequent commit, but
++ * not yet released.
++ */
++# define GNUTLS_NO_EXTENSIONS GNUTLS_NO_DEFAULT_EXTENSIONS
++#endif
++
+ /* sets the DTLS MTU and returns the actual tunnel MTU */
+ unsigned dtls_set_mtu(struct openconnect_info *vpninfo, unsigned mtu)
+ {
+-- 
+2.42.0
+
diff --git a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
index f2650e0eb6..7d0e5f2052 100644
--- a/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
+++ b/meta-networking/recipes-connectivity/openconnect/openconnect_9.12.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = " \
     git://git.infradead.org/users/dwmw2/openconnect.git;branch=master \
+    file://0001-Shim-for-renaming-of-GNUTLS_NO_EXTENSIONS-in-GnuTLS-.patch \
 "
 SRCREV = "59f2e59eb3e436364ef82e630e5a2f88f32acd58"
 
-- 
2.42.0


