Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FF6CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:45:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33270.1792043104418364205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nWj4ZA0/;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e831e86ebfso9643435ad.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2026 22:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792043104; x=1792647904; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Kl4iyfn1rSLP8mcMOluUdNGkgVtSTu7Y/Di6Nt6CjxI=;
        b=nWj4ZA0/VBMyjMxK4dpng+/S2DJQlqHuwPwpnMdtxNGBX6ympCfDrRv2U5Ensr6HHV
         FmrHcmIJ8Dgwql2TcH2jKBgrA3owyIyBd4WzK24sb2Z1S4TYtHNNf2NDG28B7kiL/OHS
         ibDgV9/QK2WNWen5XCi9c40kMeJHEQkMUeShyw/C+fde+DaqZWiWXDVAXUropnVGECaJ
         1gWMv79MjOJB6qfQLaayyAmruoJyb7H311cf13yYkdBPPtsL5242LViHDn9mebLup0uh
         xDZxbRUzRm4fOJvuXiiyrx8wrTTGvj2f9/pQcTci27QDONN0G6oWllkurNLdyt8VhmxV
         iajQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043104; x=1792647904;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Kl4iyfn1rSLP8mcMOluUdNGkgVtSTu7Y/Di6Nt6CjxI=;
        b=Wzid4EQlEy8e1g3fYrZBhi/r0ZyZuCqKhx0JgZmUOZywzOTdfjPfdle77J7a629EhU
         BVJm2iAaLAzSBKFgkCJ9LI1Y9NxECI57GAqCORqxu1eGzzHnBD00TvR/kzk3ekt6qZCl
         WuzwM3o/VjLY+8HaruJcR3gJ5rvNIshzKqpuMUnrNsQ0t0VI1lI8gaX0CT4GPdBTOHzh
         cV0sblyC2FLmYsf9tY4VgqzJT6jNhXvYOluAAddRzC6+RRBorMR2hAirYjnMaate7rY3
         kTz6m0yq1GWEXFmztLwvy64k+sqCYVEiLf6q0sAVNoi66ZgBW5QTGfgSf+xvEUNURfph
         jkLQ==
X-Gm-Message-State: AFq9FYKrU9y7EoGFkBzINx0hwCXcd20aZRnJPtiQAzMC9AelEw2Md0a5
	fiYy6zvVhXVZSFEe+57FClAxxapOETz/j/ex0tv6NvDDeks3AEAAiZ5HPYXB3g==
X-Gm-Gg: AYBFou3fd7J+CXGLAk9K7oG/g/zMGotb69QcOXEdTFPLJrObqD2rLlgLYh7pozyWT/w
	QxQZa/erZ9bi4pWxtEl+lGOt10QAWvpXjymEVO7l/ggQAsh4pn55cRQ9+sGkuIBwtuM33PWcmBW
	GvHaFjXqYfc4FZi/z/W1cQ0vNJpg3uReXtt5f5Pgmrn243nm3F3JaQLS90cAOB8xs9NVchU5qBu
	u/W/1nS4xouh89nVNm3aIxkdlIEkit0PY9rQRYrc0M4WRyJ62zGmhM5UJn30jzB6dwAcICzVnlw
	V6PiMB9GrUnt3Aa/nRmJ+SZmjQn7TCIjLszh7/9hChkC84njTZv8tmhSOZZ9xJ0axsjDhdZLANU
	hjEXlaFPtlluY6qCPeGnx2YOob3XX0kH/vTCuQVVejNTP1k9C9TJ06rl5OEejtsrj8vH5CGBdn1
	+1ctUbIXTn6U9L3rr4jYd3i4X89HVlGUtvpjldSQS8sq9I9Mbt0lO20FONAbK05S5mjS29exS/c
	gJr83VaCW9ELwp/NZ7c3z4=
X-Received: by 2002:a17:903:110e:b0:2e9:2a1a:8b69 with SMTP id d9443c01a7336-2e92a1a8ba7mr55271995ad.55.1792043103710;
        Wed, 14 Oct 2026 22:45:03 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e967875e58sm549125ad.36.2026.10.14.22.45.02
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:45:03 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 63/82] strongswan: patch CVE-2026-78124
Date: Thu, 15 Oct 2026 18:41:51 +1300
Message-ID: <a6397902bab1c2e4b547db15a19711b76091a478.1791945956.git.ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791945956.git.ankur.tyagi85@gmail.com>
References: <cover.1791945956.git.ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 05:45:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130983

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-78124

[1]https://download.strongswan.org/security/CVE-2026-78124/strongswan-5.0.2-6.0.7_openssl_pkcs7_certs_leak.patch
[2]https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78124).html

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit dd0ba33ed20b4245c82c19b19c55b3710384ce52)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-78124.patch           | 34 +++++++++++++++++++
 .../strongswan/strongswan_6.0.7.bb            |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
new file mode 100644
index 0000000000..5e37ed671a
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78124.patch
@@ -0,0 +1,34 @@
+From 36ce778a76b4b912699a52cf1109394fce109c83 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 15 Jun 2026 16:02:01 +0200
+Subject: [PATCH] openssl: Fix memory leaks after enumerating certificates in
+ PKCS#7 container
+
+This can be triggered via IKEv1.
+
+Fixes: 04884be3b5f7 ("Implement openssl PKCS#7 certficiate enumeration")
+Fixes: CVE-2026-78124
+
+CVE: CVE-2026-78124
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/49bf0725fa61198d1e29d5b4c2651c9190b2c10c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libstrongswan/plugins/openssl/openssl_pkcs7.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+index b15c8d7..cefe1ae 100644
+--- a/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
++++ b/src/libstrongswan/plugins/openssl/openssl_pkcs7.c
+@@ -132,6 +132,10 @@ typedef struct {
+ METHOD(enumerator_t, cert_destroy, void,
+ 	cert_enumerator_t *this)
+ {
++	if (this->certs)
++	{
++		sk_X509_pop_free(this->certs, X509_free);
++	}
+ 	DESTROY_IF(this->cert);
+ 	free(this);
+ }
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
index a7636554a6..82cd4738fb 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.7.bb
@@ -10,6 +10,7 @@ DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss',
 
 SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
+           file://CVE-2026-78124.patch \
 "
 
 SRC_URI[sha256sum] = "e518e34e159514f4c6ba80d1f926cb151e0dd4e3a1d94213171234b8b9ae6f55"

