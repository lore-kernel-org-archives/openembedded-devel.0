Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39905.1793009958382724568
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Oct 2026 03:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=CYOo+7cM;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06ca6e8f4so1951276b3a.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 03:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793009958; x=1793614758; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qH93jwhvZJyHUAbhW12B/pfHM99JoC6WKuPR4kR2qi0=;
        b=CYOo+7cMlrBfXpkAg7Y7Ebb5RtsXkbvBU1zyvtcuewwt+VN7nXCD6NHFspMSR01vLJ
         dk3I/mcwhsyN9hhlpRV5DwAz7bljWE1u3eI1WDYREqG6Hs84AjYTqDkBpLJikpDxpjAF
         /xZX+B/076GX50yzRjy3Cg06wjBmzAkD9yiqnEnrpeYBQn9UwoM41Q2T5jRi2iqoNq1k
         C70Kb140xjy+RNTjxYt0A5npGq7DTOfWRr69YE6LA4tlSUIQoFlauS0LTi2sDaI2JUex
         aszBh2s2CBTCG33zr2Z2HQdwnvDa2G3HjrgwRPi2ZHssps/KTZEwRVGzlejRGqj7uhdQ
         ZgEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793009958; x=1793614758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qH93jwhvZJyHUAbhW12B/pfHM99JoC6WKuPR4kR2qi0=;
        b=ic2j9KuPm8FY8Qf4MMowCOSkDndB4DM3oZNALxYjspCFHh5cJBxv7DLRPGUcW7xfzq
         3n5dlnxNDnevB9UTWJ7h2AV1MPM8WS0a/i0J61pBVs/fCRazyvi1/c7OQhAvVHpnyDYd
         Dd3H2kyA5zKa1UOKUMOn+ZFtmLBdh/J8cO/g7JKk9QwMfduG57FR6PToFeUR2862gGmu
         siT64vIzfXQOAYRexZo3b5JEfpmxGD4l3iYP1rE62ExLJA3J3ZIMdZ5trh+Yo7e8otsN
         o8fXPpOot4Zd71+PJtDUWfaV8LBEc84H4j6Adw05UJHZ+oBt3UvO2eXUTkHT2QUb40Ug
         hWWQ==
X-Gm-Message-State: AFq9FYILJ7+J4FDOIpjhU1F0aYPZ0yYzPGh0SlQWx3GoTT92qqCybWVS
	vOQCRbt81/s99dmGoSD47anN+Fb9nm2XJDP96dHRww9nWbgE7DUOfoa4tgjOdw==
X-Gm-Gg: AYBFou3fF9R1G1iceMtDsPsALQr+XBR/hfN5ckgB5GzfJAURrXiDjZqkUbOiBhTc1lZ
	7xUcjYYqYo4SQ42SnrDhIaQ1HugE/3AZaVv7vYP6/NnixhzfoGINM094NAxbpEN79MNFhEqfTqa
	dtEfkpEKye+b3vzRz7z7hTsct8yquEx5Up6ZAhZkcrG7huUelK3VryFzo0bNTaijktOqsJuTPAR
	XKNKcWDnV+ShaPqT+06qIzXBTAq814bVPlbTBeBuB3JK82Q33lenhod3/d5PcmzWITFVJbwbxS0
	WFYOrSS+wvKViI/S62qaVG28HAw5LtkdM1aXvHpN6CpXBTKixFI6nlwhDxYJTRhIvxVr7SG9Fk8
	yi6d7hy41sTwGraQhaGovkA4rbZ9u+P/Xc8ohGHFkcCLlMfvAdBU3KA8TgvFIsv7fC8weZQfwas
	qhWzeGhSaLb19JDP6ZQUQpAmGOYVPnXY4/bRm0tCim79mmlivbSZFOUUwsmGfue+4AjsT+mHxtZ
	E+D4YbWm3XrESNkkoLR/kIiiRaYv/3OPr0VzOHnDz7b0EzvOaoBhsdNmuBGeM+cpwBFFceHfCeq
	jngYNXGeYDZejMvrogYdgvWnq3haCACZ3KTHuunBbRZmv8R86eFX
X-Received: by 2002:a05:6a20:3c8e:b0:3e2:3ce:4ebd with SMTP id adf61e73a8af0-3e7cd58c8ffmr5800392637.49.1793009957660;
        Mon, 26 Oct 2026 03:19:17 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc4648dsm1383583a12.14.2026.10.26.03.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:19:17 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-webserver][blacksail][PATCH 6/10] apache2: upgrade 2.4.68 -> 2.4.69
Date: Mon, 26 Oct 2026 23:18:46 +1300
Message-ID: <20261026101850.1470035-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
References: <20261026101850.1470035-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 26 Oct 2026 10:19:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131428
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
 
