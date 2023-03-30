Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 849D7C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 12:04:41 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.23214.1680177879089869611
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Mar 2023 05:04:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=nXqHLpg2;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id e65so23066915ybh.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 05:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680177878; x=1682769878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coIj0arjS9ssCtAFr5qOryTlhYqyJOA6uJVrAA0WxzU=;
        b=nXqHLpg2hLf0UwWWQfgZav8v0yorP8amx8/FjSirMWWfCoCCkcv9ROvnO3t5uKz1RU
         XWv4HXuWg/hwXJJdWHJeYM+0sdEbB2xUJKgWThBiASlTkgQYZ+Bp6PVU2eXcO1alLAI7
         onvi0QytiR+LM0NTS/F5tLrpAsgTB+Q4deQAr2vW4tamYutIJxueTgKSiaxC4/DRl5ES
         POr+N8d9cZhL3AErYL+50gkUsw8fl9ZWYFD6SzZQS5zsoyqMHQ0NNsd23KqdDkfTJQ+d
         a/zdtiNcKoPof4oK+zjG85iDyPMJsVyySegyYSWbOAcGPGqCDqOvEk5z8uMQGNdKugUn
         r8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680177878; x=1682769878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=coIj0arjS9ssCtAFr5qOryTlhYqyJOA6uJVrAA0WxzU=;
        b=gugvNdTVng3zJvcssd5yTivzyG797h0MqrRG+Osdhl98+sfEywXkUzcHA0xrikRd+5
         kVrtJ/UQVXN5XSSkNt7Awts641pFny6Duum2eB5EIbFJLwgv+GJf0S+2GjLV+KTGd2pP
         q1sLoLg3BXOieKWUlyuCdjUWULP25f5e3JSRM/gYtT/E22x9qB+7EZWYtiXy3VYuf5c2
         5nPpTcyCp1D9mjIMWhktOsMdw7NY+U12lSQ9RKnMvSEO3qeIm1mhhGTDorQV/FFIxIx6
         uk5W8vWb2S1HRXgXOjHN3V10IF2sCI5BZPNirC+ZMpendMDvjRtKxCkCduaQckslV8wA
         SSCw==
X-Gm-Message-State: AAQBX9cQdvV9UZIPW91I2wkN7zr8PzpjIRw4k1b1SkbkSkWNhUeaNdj4
	vaWtzdEMYZZXGoNNZaUswBRsW+KldBL50g==
X-Google-Smtp-Source: AKy350YzSrhJzf2s6qdu8H+qiItp3cI4brCYACFEFQVpM1mxkNkOfP0Cn5NhL7wg5RfPffK+BmxOTw==
X-Received: by 2002:a25:b30d:0:b0:b6d:80ab:8b0f with SMTP id l13-20020a25b30d000000b00b6d80ab8b0fmr22253906ybj.62.1680177877984;
        Thu, 30 Mar 2023 05:04:37 -0700 (PDT)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:4171:fd90:b516:41ed])
        by smtp.gmail.com with ESMTPSA id eh17-20020a05690c299100b00545a0818491sm1435286ywb.33.2023.03.30.05.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 05:04:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: wangmy <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 2/2] libcrypt-openssl-rsa-perl: upgrade 0.32 -> 0.33
Date: Thu, 30 Mar 2023 08:04:36 -0400
Message-Id: <20230330120436.2884051-2-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330120436.2884051-1-akuster808@gmail.com>
References: <20230330120436.2884051-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Mar 2023 12:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101833

From: wangmy <wangmy@fujitsu.com>

0001-Fix-for-Issue-31.patch
removed since it's included in 0.33

Changelog:
=========
- Update for windows github CI
- Remove duplicit 'LICENSE' key
- Remove EUMM Remove version check
- #31 by removing reference to RSA_SSLV23_PADDING (removed from OpenSSL starting from v3.0.0)
- support passphase protected private key load
- fix 'unsupported encryption' error on old library versions
- Clarify croak message for missing passphrase on older cyphers
- More structs opaqued in LibreSSL 3.5
- Use a macro for dealing with older SSL lacking macros
- more CI fixups. Drop testing for 5.10 and 5.8. Something is broken upstream.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit a97f771d35d85dfa0a428fbeea7405ad9754a5f8)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Fix-for-Issue-31.patch         | 37 -------------------
 ...2.bb => libcrypt-openssl-rsa-perl_0.33.bb} |  3 +-
 2 files changed, 1 insertion(+), 39 deletions(-)
 delete mode 100644 meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.32.bb => libcrypt-openssl-rsa-perl_0.33.bb} (86%)

diff --git a/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch b/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
deleted file mode 100644
index a5ea43f88b..0000000000
--- a/meta-perl/recipes-perl/libcrypt/files/0001-Fix-for-Issue-31.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 5e8202458e41ba1f7801746c503fe7c60ae340d5 Mon Sep 17 00:00:00 2001
-From: kambe-mikb <77083885+kambe-mikb@users.noreply.github.com>
-Date: Tue, 28 Sep 2021 17:40:18 +1000
-Subject: [PATCH] Fix for Issue 31
-
-Fix Issue 31 by removing reference to RSA_SSLV23_PADDING (removed from OpenSSL starting from v3.0.0)
-
-Upstream-Status: Submitted [https://github.com/toddr/Crypt-OpenSSL-RSA/pull/32]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- RSA.xs | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/RSA.xs b/RSA.xs
-index 46cb199..4f65dfc 100644
---- a/RSA.xs
-+++ b/RSA.xs
-@@ -640,12 +640,16 @@ use_pkcs1_oaep_padding(p_rsa)
-   CODE:
-     p_rsa->padding = RSA_PKCS1_OAEP_PADDING;
- 
-+#if OPENSSL_VERSION_NUMBER < 0x30000000L
-+
- void
- use_sslv23_padding(p_rsa)
-     rsaData* p_rsa;
-   CODE:
-     p_rsa->padding = RSA_SSLV23_PADDING;
- 
-+#endif
-+
- # Sign text. Returns the signature.
- 
- SV*
--- 
-2.33.1
-
diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
similarity index 86%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
index fd92c8a8db..aa8d138f2c 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.33.bb
@@ -4,10 +4,9 @@ LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz \
-           file://0001-Fix-for-Issue-31.patch \
 "
 
-SRC_URI[sha256sum] = "adc74f0ae125c77f65d5dd32abb9c3429300a79543bf263494f333f9c0b62a61"
+SRC_URI[sha256sum] = "bdbe630f6d6f540325746ad99977272ac8664ff81bd19f0adaba6d6f45efd864"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
-- 
2.25.1


