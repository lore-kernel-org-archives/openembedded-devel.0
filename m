Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36082.1793161581274369533
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Oct 2026 21:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zeXENa3T;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so276130a12.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Oct 2026 21:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793161581; x=1793766381; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qH93jwhvZJyHUAbhW12B/pfHM99JoC6WKuPR4kR2qi0=;
        b=zeXENa3TJ1uwup6cc/7MyyFEOYWugq10rSOiCrdYGUw0QqGo9tGKlhYVXAOTOxZm1y
         AVzwK3DbajzX3wVslRk8TgXKisB3JkTXZKFWzSUNI22zfvc7PJPBROZBuKAXMwAxg/xY
         rbIdBgyJCvHF4VhFDOPa0SreXQi/u1m1GwMI4TOlVELd8YI5BD0f+2olIEe6ZnvW80JF
         E7taHlodZXhRWdkiO2OoQ/v1tsNsj3fSIXnkNjFpnJ+Xth5omwJUwvqt2WlK17aEXf4Q
         5em4XOBWfhJChROOo24m7asbDLPV6JEFeysVy7YK8BbHdfbFyBCFir4r0TBfOZ6kRzDM
         mkTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793161581; x=1793766381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qH93jwhvZJyHUAbhW12B/pfHM99JoC6WKuPR4kR2qi0=;
        b=dx5klRVrJYBLRFFE3dvCa+hKbsoa+pEHvlvssHgL2HbaJQO4yMubn1o1lAYfd2wvXU
         0QfrN2g0HIHAJGVX68K8oUTqE6nHDvhHm5TbLShfuU20EHKq86ltUEQ6R4/gfOYPhqVS
         4ePHEQfKJEzyR4cPHvRhw+iP6Vp6FpzjM06Qdpy0RIufHRf3gnlh7P/pIygzHNqMntnT
         MiD0rjmv5hXVvaPDk8eePNkhvdF2vANhWe+R9mfx4rAFVw6ihiFHI7kgkPG5J3/t5+xm
         EqBUZjJeg5cWjOcjXFDOlUl59DYFB07D0hbPfsCJwXZ6Fdn6RnG4FvV68gDiBdpmqj8A
         Tg8A==
X-Gm-Message-State: AFq9FYL3rvEqj/mBZXs3ZqSL/m+PRdqztB8WSQZF38uqHjU9/NcK/YRV
	Vx5rThWNF3gX52yGrau5uafUCqBVUT0HozQPDJYFlZgMPgAsa0O74n1MsuMD2g==
X-Gm-Gg: AYBFou3tx5NNuQBAMVFLpuNfPbSRreysXSvxffA+3FsiAiC/haQhhhANJWVDEYuZCrG
	wTzHPw38Sole1gJoJ+KN95DUfEayjewGP6TtGLD/MSxJ3Dskwlp5l1MzNUUdOneCDfbAY/ZUAmj
	EITS1uZ6A1RQABizmAeZQ1eQxDuM2jaKKvuVOvIVj9UpRhunotmn9dukjHpJyMI1YnzvRZ5CMDp
	uKLCkLH9MKveyTFilq60oUG9vYbrDRKV6oZZMhvBsJIHGmMdh+T8vydsZCk4WlR0quZrKzyER3f
	JnuTpfrq9seiXcyfEK/f8GSvO7pZAlWl45mOatmd1IO1dpXawaxs0qzzxkV74M8OPxuKIchC1OE
	8GNfbET0kMjAbK6yaeXWMu3cyW/tpFK1kPnUum+KPj1zKK/T4DVlUxXfh+Eu8g29yyosITib2N8
	R8ZsQPswvri+zLGxR5etTxaEI+efQzkPlZ34PX4dNnWghgo6qXEaqoi9BdtjZ7bNxOvCiYFlIcs
	bhcrnSE4qEx37v5J3bhD+dkV2Z9WBZRFkAAUoMYkn3FvLMnFHonh1oPsBo99IHHHCwfcEXew89+
	QxtRrdFc0PZWnaxEn0kawa9oplGppm0bc3Z5t6npxma3JQLm4ri/SiFaS0XiMg==
X-Received: by 2002:a17:90a:ec90:b0:3ae:2961:14db with SMTP id 98e67ed59e1d1-3ae580af9aamr882648a91.21.1793161580638;
        Tue, 27 Oct 2026 21:26:20 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48c2d3sm1010794a91.5.2026.10.27.21.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 21:26:20 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [blacksail][PATCH 53/60] apache2: upgrade 2.4.68 -> 2.4.69
Date: Wed, 28 Oct 2026 17:23:51 +1300
Message-ID: <496cb3f32736d1d1b1c84e331ce95ff682f44c6f.1793161233.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793161233.git.ankur.tyagi85@gmail.com>
References: <cover.1793161233.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 28 Oct 2026 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131605
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://downloads.apache.org/httpd/CHANGES_2.4.69

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit cf030e73b8e0fa463a81ace8f13c82a9f1281ebe)

Also dropped patch that is part of the upstream version.

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...mod_md-Add-OpenSSL-4.0-compatibility.patch | 47 -------------------
 .../{apache2_2.4.68.bb => apache2_2.4.69.bb}  |  3 +-
 2 files changed, 1 insertion(+), 49 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.68.bb => apache2_2.4.69.bb} (98%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
deleted file mode 100644
index ee127681ec..0000000000
--- a/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 6cd9ea8dcb5bf68a195e90578c7f05e12eba5468 Mon Sep 17 00:00:00 2001
-From: Rainer Jung <rjung@apache.org>
-Date: Wed, 17 Jun 2026 09:48:52 +0000
-Subject: [PATCH] mod_md: Add OpenSSL 4.0 compatibility
-
-* Use getters instead of direct member access.
-
-* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0.
-
-* Keep OpenSSL 1.0.2 compatibility.
-
-Merge from icing/md:
-https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21d4da75c
-
-Backport of r1935161 from trunk, [mod_md CTR]
-
-
-Upstream-Status: Backport [https://github.com/apache/httpd/commit/6cd9ea8dcb5bf68a195e90578c7f05e12eba5468]
----
-diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
-index aee799a7b39..2e7f14dff31 100644
---- a/modules/md/md_ocsp.c
-+++ b/modules/md/md_ocsp.c
-@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTID *certid, apr_pool_t *p)
-     serial = issuer = key = "???";
-     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCSP_CERTID*)certid);
-     if (aname_hash) {
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-         data.len = (apr_size_t)aname_hash->length;
-         data.data = (const char*)aname_hash->data;
-+#else
-+        data.len = (apr_size_t)ASN1_STRING_length(aname_hash);
-+        data.data = (const char*)ASN1_STRING_get0_data(aname_hash);
-+#endif
-         md_data_to_hex(&issuer, 0, p, &data);
-     }
-     if (akey_hash) {
-+#if OPENSSL_VERSION_NUMBER < 0x10100000L
-         data.len = (apr_size_t)akey_hash->length;
-         data.data = (const char*)akey_hash->data;
-+#else
-+        data.len = (apr_size_t)ASN1_STRING_length(akey_hash);
-+        data.data = (const char*)ASN1_STRING_get0_data(akey_hash);
-+#endif
-         md_data_to_hex(&key, 0, p, &data);
-     }
-     if (aserial) {
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
similarity index 98%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
index f178007ab7..fba4667bd1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.69.bb
@@ -16,7 +16,6 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
-           file://0011-mod_md-Add-OpenSSL-4.0-compatibility.patch \
           "
 
 SRC_URI:append:class-target = " \
@@ -28,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "68c74d4df38c26bed4dfbdb8f3baf1eb532f3872357becc1bba5d136f6b63c06"
+SRC_URI[sha256sum] = "c5e6ebc66e349b87d7fc6916ae7cc2a808ed348003de134cf9e9d89d3e2cc73d"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
