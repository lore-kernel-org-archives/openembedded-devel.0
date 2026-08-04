Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589EBC55ABA
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:40:31 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24967.1785872423845641388
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=FqcZN+6m;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ceb096e675so3182835ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872423; x=1786477223; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4khimgQJPj+pEQTyiasWmq/XWa9eTiUc/iRlMJwwwr0=;
        b=FqcZN+6mdULceP+6y+QF48Zl7IDTi/yWgHx0TsCzRVEfuWNXgHnbYWOD3mQKeBRawD
         JHzPMM6zd7Hy+KDxAW9MzuP0ovO1NHQYofshVu0KN7MQKaEhgI43IjpE54vZhBZc+V+E
         dFcnaZW9ib2jNB78T3ZfjODiftnAWLkPVjuL2yhujBHiV53DYlIjJAbQMvWmFtJr9vTk
         Mi/Ln0+AGrrqCA/rVGiwxAfj0d42MmVkHHgCzokGhPnHkpxhA7mmkL9yFCHziRFV+la0
         nPscT7uzfc0/1FU2A6lfbYtC4U5sJr3Rjl2fTceZ6MB3qnPHQfll4l4dSwbTw872FGgB
         fH5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872423; x=1786477223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4khimgQJPj+pEQTyiasWmq/XWa9eTiUc/iRlMJwwwr0=;
        b=dZtJXOadHdkbJMIhLJa+h8clbfWqGsPEKk6XYVgiYKDFZFjZWRh65EKcRB88rzOePc
         HylX2jJLvhFo3Et1mZKoF11TaVIxxbLkwbx5ptU0l4kKU5rqZuORN7ZjL04esZ6Tprld
         5Yxe88eloF767jU4HYmOgdiUyDa/ZOYJFzdVRfFTkWpCnvHhnt710Moj0KEe8LVRbXwG
         tLzVGyxR42E77jQYC+1NHBOYB42JUd3+eQJXyzIIFdaMY7HeEdpcaj+5c+Ks2JIYZ1ai
         jO4UFhxLNfsZ6PnqYP7INlltrS8W/xULKAYZFRN4Q14eRHHerKGN30g0U9uglDzSYCNY
         0OYw==
X-Gm-Message-State: AOJu0YyS+p1UfdcPIHPfsSDL7qKHLV3QGyC5oyBLSSSGSILEAl8MlI6G
	fqBwPQd1y0Qlpa/quuPS7lRxQEapcVt1/glanPIx7zFo8nGU4X/0o4w3E8MKwMCM
X-Gm-Gg: AR+sD13ZSjVO7votHQLdPSfihjTB4B6s8y8URu+DlLemXde2T0GZG4GbTKIk0PO101Z
	q2pU2mWJ2DLZYEbT+jFY08/3r9WMieuziQM2iucEBhToNlc+NVlHQSC7GfbHd9xMcmTq9AfgagP
	7Xa78O2983mpk8IGlcwk07/fVk/y3ZqkNywZfZAnMlwgZVysWIha1QR//btlq1Z92XpVylcVB9V
	s12inZyY+ZKou6RZgAmbDBOm5iHr8nxPCnlOnjJOgHuBMYgcxRhWlSf934raNYHYGBfS41rimf/
	bgO4CWeS014OB4QB8jx49TfVhcnYY0hKNVurbj6icGGK8n5V3n4sG4DGEnPCEIaiKqlfT87XmRZ
	XrwfKveuwTLIfqWJe230nrKvA7RR//zoYwI7+jvOb/sASMFWCRHhsKtVOZVo7aS67r+8QoJpQ0o
	RPdMLI+Ik/iXHXtyNhfJ6agzrFrMj2GG/c9e4c2GwH60xPTpV1jAQCWllLp7JeBsn636ObwfwKR
	w==
X-Received: by 2002:a17:903:946:b0:2cf:82e6:a5 with SMTP id d9443c01a7336-2d0ca7f8ec1mr12288145ad.13.1785872423082;
        Tue, 04 Aug 2026 12:40:23 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:40:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][wrynose][PATCH 5/36] strongswan: patch CVE-2026-47895
Date: Wed,  5 Aug 2026 07:39:32 +1200
Message-ID: <20260804194003.3158916-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128752

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Use patch[1] provided by strongSwan as mentioned in the advisory[2].

[1] https://download.strongswan.org/security/CVE-2026-47895/strongswan-6.0.2-6.0.6_empty_id_clone.patch
[2] https://security-tracker.debian.org/tracker/CVE-2026-47895

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../strongswan/CVE-2026-47895.patch           | 92 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  4 +-
 2 files changed, 95 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-47895.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-47895.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-47895.patch
new file mode 100644
index 0000000000..b7cd22d0f7
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-47895.patch
@@ -0,0 +1,92 @@
+From ca03401ccf1c22966619d2c54176c78a647f9ce0 Mon Sep 17 00:00:00 2001
+From: "R. Elliott Childre" <elliottchildre329@gmail.com>
+Date: Mon, 18 May 2026 00:53:24 -0400
+Subject: [PATCH] identification: Fix double-free when cloning empty IDs
+
+The clone() method was missing a branch when there is an encoded chunk
+of length 0 that still needed to be cloned.  Otherwise, the destruction
+of the clone frees the same pointer that the original owns.
+
+This double free was found with an improved `fuzz_ids` fuzz harness and
+a two byte input to create an identification from "@#" or [0x40, 0x23].
+It can also be triggered with `<type>:#` e.g. `dns:#`.
+
+One of the problematic constructors is used to parse EAP-Identities,
+which are cloned before storing them in the auth-cfg.   So this can be
+triggered by an unauthenticated attacker.
+
+Note that while the length check was already added with 418dbd624363
+("cloning %any ID without zero-byte memleak") and identities that trigger
+this can be created since 86ab5636c2c9 ("support for @#hex ID_KEY_ID
+identification_t"), it was the referenced commit that made the length
+check problematic.
+
+Fixes: 2147da40a5d7 ("simplified identification_t.clone() using memcpy")
+Fixes: CVE-2026-47895
+
+CVE: CVE-2026-47895
+Upstream-Status: Backport [https://github.com/strongswan/strongswan/commit/075323d895f574424cfc4a5f491a1d388cdfda37]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ .../tests/suites/test_identification.c        | 23 +++++++++++++++++++
+ src/libstrongswan/utils/identification.c      |  2 +-
+ 2 files changed, 24 insertions(+), 1 deletion(-)
+
+diff --git a/src/libstrongswan/tests/suites/test_identification.c b/src/libstrongswan/tests/suites/test_identification.c
+index e7a4d4493e70..bb756399958e 100644
+--- a/src/libstrongswan/tests/suites/test_identification.c
++++ b/src/libstrongswan/tests/suites/test_identification.c
+@@ -1608,6 +1608,28 @@ START_TEST(test_clone)
+ }
+ END_TEST
+ 
++START_TEST(test_clone_empty)
++{
++	identification_t *a, *b;
++	chunk_t a_enc, b_enc;
++
++	/* this produces an empty but non-NULL encoding, which previously caused a
++	 * double-free when destroying a clone */
++	a = identification_create_from_string("@#");
++	ck_assert(a != NULL);
++	a_enc = a->get_encoding(a);
++
++	b = a->clone(a);
++	ck_assert(b != NULL);
++	ck_assert(a != b);
++	b_enc = b->get_encoding(b);
++	ck_assert(a_enc.ptr != b_enc.ptr);
++
++	b->destroy(b);
++	a->destroy(a);
++}
++END_TEST
++
+ Suite *identification_suite_create()
+ {
+ 	Suite *s;
+@@ -1670,6 +1692,7 @@ Suite *identification_suite_create()
+ 
+ 	tc = tcase_create("clone");
+ 	tcase_add_test(tc, test_clone);
++	tcase_add_test(tc, test_clone_empty);
+ 	suite_add_tcase(s, tc);
+ 
+ 	return s;
+diff --git a/src/libstrongswan/utils/identification.c b/src/libstrongswan/utils/identification.c
+index 322c2c95ed9a..35837237c6c7 100644
+--- a/src/libstrongswan/utils/identification.c
++++ b/src/libstrongswan/utils/identification.c
+@@ -1722,7 +1722,7 @@ METHOD(identification_t, clone_, identification_t*,
+ 		clone->encoded = chunk_from_str(strdup(this->encoded.ptr));
+ 		compile_regex(clone);
+ 	}
+-	else if (this->encoded.len)
++	else
+ 	{
+ 		clone->encoded = chunk_clone(this->encoded);
+ 	}
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index daa6552899..d6176f000e 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -8,7 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "flex-native flex bison-native"
 DEPENDS:append = "${@bb.utils.contains('DISTRO_FEATURES', 'tpm2', '  tpm2-tss', '', d)}"
 
-SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2"
+SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
+           file://CVE-2026-47895.patch \
+"
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
 

