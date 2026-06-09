Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CD0CD6E79
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 09:25:38 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75307.1780997131071014359
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 02:25:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sr8u176j;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-36bb43a58c7so485285a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 02:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780997130; x=1781601930; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XtihX0H6VWFmWvZEttFfjIWuKnz2XMOuuUzgEWaAY6I=;
        b=Sr8u176jkAbrA8V4CfEw9s62AS/qH9T8iCR+M2+bIUVFAc1UKLu9m44CI4TBCSIZXo
         EtoZ/t8n7ifz8ZRjIs+h1vB86npNRY9ZCo9Gme4VtyPsGwZMToJLTax0/Hv1DiXXzhBx
         RhwSUcjnlR+l9taCZeBIeBEMphgsKV+OsyQ1wKRlZvOovcFoxkAbjlRuRsmEf4VyUMF9
         LLc6Hko8PBKkkkcgSOdg4/1FZ3Q9OR+NwWoGFSI43nC+uVJTuwie93FIajKQOiNdqbwq
         ZlzpgMKMx1EAFCQAuOdgIrLITIzPaafZ9fRCheI58QnVedfGSv5WLo1qgEMLXZWEfhqR
         dXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997130; x=1781601930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XtihX0H6VWFmWvZEttFfjIWuKnz2XMOuuUzgEWaAY6I=;
        b=mX3VhuGhHEbW5mFNo0szoLaaHrjvEpR/18EkNg0dw/LhMcQZuhBLqugLkN/+NbHl30
         bR93XYGfEEHgSF/XGoB+arVIFht+LqAf2Zf3Qb6VaBNR79DuzG7QQqIwRMoAexInvMbj
         d5Ypg1a8a++4JYlfj8WNu3dEgKTgj7o6Xr2o4nuDoMB8vO1SlmG2bZKfi5aaDvMjKom9
         PNSOFSNc/HjPZNWvrZOQdl7uCDFdlZOCTdpYk/ThwrqcWDrZ+WLVCQRuR/qoSFh04dwA
         +aOiMv5SaOJaAzR4V1SLHDD4APheqfNbL8BwYX0BQE3+ljNapzL7lKAh+opP4JP3CESW
         oUgQ==
X-Gm-Message-State: AOJu0YwD4HEsmLN18rD5xZN9e7j0Mzkq0/L0u+ijbMZWcl/hg+LN4IeP
	8U4UbGNJX5aCxNJJutT1cr9bw/NOKtf/eP3XHZnY2sn19IDyGTggMuASnlRLed3eMz2kZw==
X-Gm-Gg: Acq92OE1T7M77eJaGmNGwGdq1KReqhNvZBwPi9Mr+ZBOLDgWoynbLVW5H7G0SbYRlQ1
	KqP1QY+gakc/ROtsLc/1MPzZgYMVN3AbIhnkXAS7aCYwqGtx4abDGG3MgYBe9Jd508lihiyN1sr
	lC9EZsgpac8GlG4kqmzMTgAn97J6k1U8VSRB6QUCYcOQM4JhIeZ5kdNs7FLFdw+3iKl5A0Dtx1Q
	wDKOVxq7tqKdhZhdQz1GWyAe9X98el+fMx1ynGmxztBfQeIAOL3mPI/22Yxr2QkKP1MtpjOVdWG
	MO1EDKwOb3AA6bzQVbdSxIdkvdPbz4uvH58iErx7OVjrT9eFSuVir61fmZl+M/i5tC4HN5GTU5U
	b+jLTu8ZUF99E0PeIgU5Ol4tYI0LRZcMbJJ6qOdYUvNFEEoum6yXbBi/99ZgImKo4Hsw4g3Bwbe
	GaNo2MKjTRDhruBW8Y/Pazgtdx2X1v2vZ7+T0dAiHUr65ck9BTsTfMk7rFOsRVng==
X-Received: by 2002:a05:6a21:6f89:b0:3b4:6f05:8301 with SMTP id adf61e73a8af0-3b4cd48fbd0mr10651249637.7.1780997130301;
        Tue, 09 Jun 2026 02:25:30 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df043223sm16496633a12.8.2026.06.09.02.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:25:29 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH V2 2/6] strongswan: Fix CVE-2026-35329
Date: Tue,  9 Jun 2026 14:54:03 +0530
Message-Id: <20260609092407.893299-2-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
References: <20260609092407.893299-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:25:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127447

Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/8dae5605a79666c6def907efd8c872c91d93de5b]
                          [https://github.com/strongswan/strongswan/commit/4da84019ccec87fea161797af2901244fa5f170e]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...d-NULL-pointer-dereference-when-veri.patch | 58 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch b/meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch
new file mode 100644
index 0000000000..c2e730bc54
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch
@@ -0,0 +1,58 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 25 Mar 2026 10:28:45 +0100
+Subject: pkcs5/pkcs7: Avoid NULL pointer dereference when verifying padding
+
+Can be triggered via empty PKCS#7 encrypted- or enveloped-data content
+in IKEv1 CERT payload.
+
+Fixes: 4076e3ee9121 ("Extract PKCS#5 handling from pkcs8 plugin to separate helper class")
+Fixes: d7aa09104f08 ("Implement PKCS#7 enveloped-data parsing and decryption")
+Fixes: CVE-2026-35329
+
+CVE: CVE-2026-35329
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/8dae5605a79666c6def907efd8c872c91d93de5b]
+                          [https://github.com/strongswan/strongswan/commit/4da84019ccec87fea161797af2901244fa5f170e]
+Patch is refreshed as per the source code version 5.9.14
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libstrongswan/crypto/pkcs5.c b/src/libstrongswan/crypto/pkcs5.c
+index e48a9ad..134ccd3 100644
+--- a/src/libstrongswan/crypto/pkcs5.c
++++ b/src/libstrongswan/crypto/pkcs5.c
+@@ -113,6 +113,11 @@ static bool verify_padding(crypter_t *crypter, chunk_t *blob)
+ {
+ 	uint8_t padding, count;
+ 
++	if (!blob->len)
++	{
++                return FALSE;
++       }
++
+ 	padding = count = blob->ptr[blob->len - 1];
+ 
+ 	if (padding > crypter->get_block_size(crypter))
+diff --git a/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c b/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c
+index 8b26bad..3d601d6 100644
+--- a/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c
++++ b/src/libstrongswan/plugins/pkcs7/pkcs7_enveloped_data.c
+@@ -182,10 +182,17 @@ static bool decrypt(private_key_t *private, chunk_t key, chunk_t iv, int oid,
+  */
+ static bool remove_padding(private_pkcs7_enveloped_data_t *this)
+ {
+-	u_char *pos = this->content.ptr + this->content.len - 1;
+-	u_char pattern = *pos;
+-	size_t padding = pattern;
++	u_char *pos, pattern;
++	size_t padding;
+ 
++	if (!this->content.len)
++       {
++		return FALSE;
++	}
++
++	pos = this->content.ptr + this->content.len - 1;
++	pattern = *pos;
++	padding = pattern;
+ 	if (padding > this->content.len)
+ 	{
+ 		DBG1(DBG_LIB, "padding greater than data length");
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 6fbc345923..ac4bc5380b 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-25075.patch \
            file://CVE-2026-35334.patch \
            file://tls-server-Prevent-infinite-loop-if-supported-versio.patch \
+           file://pkcs5-pkcs7-Avoid-NULL-pointer-dereference-when-veri.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


