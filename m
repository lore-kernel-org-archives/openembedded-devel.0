Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2324CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:50 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33284.1792043143682757557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HUceQUSu;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e82462a3f1so9771395ad.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043143; x=1792647943; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FF3VdqW/SLEoZqSMcWv0EcoTA/jQYH8gb2/wzSxnO2U=;
        b=HUceQUSuBlrloR/ULYXHWJ4zcuRckZ4eKxl2Qrmjxzc87TiLN4ZZbpNt1aEwsaM6/C
         h3eOrsD7k1jk3WsoNtNdWXnYMZUvHIRKnajzCrHF0uvAlzUpT4nZKIVqUVza30WekO3v
         hguJ5QZANWaldJZTg95DdSnt/LmD/QkW1cx9KbTlgDyG0X4lWwYAaaF4fdUupbOGwuar
         KHBRd3ECBIwWcc0oNcNVlkWCaTUaRORPvSs+Nv2gxWFfnQ5w71tQqU50HFYCQVXnKw3a
         iCR4rRZ3Cclc2TVhdWPa0ni3QxxhRbJERhN0EQEAcjK+FQmp7rhqZnc37ePkRwegFUO/
         9rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043143; x=1792647943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=FF3VdqW/SLEoZqSMcWv0EcoTA/jQYH8gb2/wzSxnO2U=;
        b=HM8qlYxDuPsErq+TKkX4Oq//fcEJpJVF+J+WASZCjHflNr2pIkaWbO8EkP2ksoaKgK
         YWlIoc/fpBSZ+L/PNQSHN8FBVTLZtD4RzqB4xCR+RHaNo+RlMW6Zo/GK9SBXQ4H9RkEf
         Zpn7vDNPmo3HQfKeEpXUND68EUiq58Ca1EdH2RbsEFDiJ2oz/WYYFsjq7OaNZpI4WicK
         +hEM0lzgvt1vuUwTo4CDP7uQTv+lvR8+X4zh0Sztb4afJV8bZ6PPjb2zRMvUvyz+ctP1
         boqJQ6ZXWGNZCoDRu1WilEMRAjPtIDkZYoDY3EtCveWAgUCToEyyT+UZfe54YrfXat35
         ANMQ==
X-Gm-Message-State: AFq9FYLIuXr+dq3K2rWrhQQ38ldbmL7tbPdsL6yYeA65xlhN3t4ILTpq
	vqgYCZPAizExgIRlXAoGSu5EyDTW2np7ZdDChEO680WTBbSrakjAKEqHyHKs5Q==
X-Gm-Gg: AYBFou3cLQ0STnMONd9jdbdARpq9Whkv+Lxnhi1qV2YFiJ9aolGFlHOjka2ub36QDoR
	1zkOWoG2XYPKRX69gdBWedulRhILVr8xhr9wQVWGfeniKbo5o3nHSVDm3pscPYyNK1FlglNKDLF
	NrxlOQrNbnElSm4P+/gmGxT51QB4K7vnTr2ZzNOcNPhWaNWuZfi9MXGHtMtE6L1LYuEewRbaRB2
	gdRVUIKiRp6Gpq4+boxJ2iV6B/IITDXvSJjjC5JeujfXlzqDsIFrIHr8p04g1we71sqFaM0kBui
	p8cVnmPq2JKchq1YjRO5pjc69/1S3ZExXzh++TJ3msep0amPEogOhqirRJsSYurifvpDSU5MW6B
	B+CntjTQAoTXfctPlR5ongD5xAA60CrCcYoMtoIVqoo3u4HkO777JNSSgfKhtwISyxXvWOhPb11
	m1SQ93odko/SWiSr4muqs+9O8ILB5IX5ZBPY0dscBCwgumqiilnNpkVKnGBLwXo/qvy8clK+4a3
	zyobqqedvGarpvyvGE4X/M=
X-Received: by 2002:a17:902:e88f:b0:2dd:ad74:ac29 with SMTP id d9443c01a7336-2e842ac8b20mr168493205ad.27.1792043143002;
        Wed, 14 Oct 2026 22:45:43 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:42 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 81/82] apache2: fix build with OpenSSL 4
Date: Thu, 15 Oct 2026 18:42:09 +1300
Message-ID: <db22543b542fa8742751450dc9291869bd93d896.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131001

From: Markus Volk <f_l_k@t-online.de>

ASN1_STRING is opaque in OpenSSL 4, so mod_md fails to compile in
md_ocsp.c. Backport the httpd 2.4.x commit that switches to the getter
functions. The fix is part of httpd 2.4.69, which master gets through the
upgrade.

Upstream-Status: Backport [https://github.com/apache/httpd/commit/6cd9ea8dcb5bf68a195e90578c7f05e12eba5468]

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...mod_md-Add-OpenSSL-4.0-compatibility.patch | 47 +++++++++++++++++++
 .../recipes-httpd/apache2/apache2_2.4.68.bb   |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch

diff --git a/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch b/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
new file mode 100644
index 0000000000..ee127681ec
--- /dev/null
+++ b/meta-webserver/recipes-httpd/apache2/apache2/0011-mod_md-Add-OpenSSL-4.0-compatibility.patch
@@ -0,0 +1,47 @@
+From 6cd9ea8dcb5bf68a195e90578c7f05e12eba5468 Mon Sep 17 00:00:00 2001
+From: Rainer Jung <rjung@apache.org>
+Date: Wed, 17 Jun 2026 09:48:52 +0000
+Subject: [PATCH] mod_md: Add OpenSSL 4.0 compatibility
+
+* Use getters instead of direct member access.
+
+* Struct was made opaque in OpenSSL 4. Getters exist since OpenSSL 1.1.0.
+
+* Keep OpenSSL 1.0.2 compatibility.
+
+Merge from icing/md:
+https://github.com/icing/mod_md/commit/9fd90380db0722f0ccc14ff1c4da0ca21d4da75c
+
+Backport of r1935161 from trunk, [mod_md CTR]
+
+
+Upstream-Status: Backport [https://github.com/apache/httpd/commit/6cd9ea8dcb5bf68a195e90578c7f05e12eba5468]
+---
+diff --git a/modules/md/md_ocsp.c b/modules/md/md_ocsp.c
+index aee799a7b39..2e7f14dff31 100644
+--- a/modules/md/md_ocsp.c
++++ b/modules/md/md_ocsp.c
+@@ -533,13 +533,23 @@ static const char *certid_summary(const OCSP_CERTID *certid, apr_pool_t *p)
+     serial = issuer = key = "???";
+     OCSP_id_get0_info(&aname_hash, &amd_nid, &akey_hash, &aserial, (OCSP_CERTID*)certid);
+     if (aname_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)aname_hash->length;
+         data.data = (const char*)aname_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(aname_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(aname_hash);
++#endif
+         md_data_to_hex(&issuer, 0, p, &data);
+     }
+     if (akey_hash) {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+         data.len = (apr_size_t)akey_hash->length;
+         data.data = (const char*)akey_hash->data;
++#else
++        data.len = (apr_size_t)ASN1_STRING_length(akey_hash);
++        data.data = (const char*)ASN1_STRING_get0_data(akey_hash);
++#endif
+         md_data_to_hex(&key, 0, p, &data);
+     }
+     if (aserial) {
diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
index dc8c0df12d..f178007ab7 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.68.bb
@@ -16,6 +16,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
            file://0008-Fix-perl-install-directory-to-usr-bin.patch \
            file://0009-support-apxs.in-force-destdir-to-be-empty-string.patch \
            file://0001-make_exports.awk-not-expose-the-path.patch \
+           file://0011-mod_md-Add-OpenSSL-4.0-compatibility.patch \
           "
 
 SRC_URI:append:class-target = " \

