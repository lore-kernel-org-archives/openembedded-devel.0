Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8C84C982FA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:41:14 +0000 (UTC)
Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4266.1790160070724947168
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Sep 2026 03:41:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kiCdJC2L;
 spf=pass (domain: gmail.com, ip: 74.125.228.40, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc7641d03a5so67240a12.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 03:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790160070; x=1790764870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k0BDQUyjQL8FParzXempzndDMUeJIJq6BsD3VEsPJs0=;
        b=kiCdJC2LbUj4uQVV2vwloPe/pLhxTZxyAYYoumcbVoLrW9s+Lh3D2xPk1tiEdABRxj
         wp0HKLSZJEhzLRLUoHEn0x/uuGVG7nGM3L+V/5PMX63UtedTqdAc1tZ3zJcdis8dosmF
         LjUawH5EoIMxJ+HZyFUvVjc8xWp3Fq3Ui4V5Ax9Lxa8m+4yPRWGtKii5rfPa4CAJAn0h
         Q8bnNCymxGiXACsVrx7c3s+KfjAaYFE0uBJGCFQjm9byFEt2pCewMOcQLcJKX9XZj2XI
         veT3zWK0/Sfo5W1PSpKulUAjcXWdRRl47B0fhyn+7FEq2lTzAuCTp+/ggVJsimrQBW5L
         tbtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160070; x=1790764870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0BDQUyjQL8FParzXempzndDMUeJIJq6BsD3VEsPJs0=;
        b=PaExvKNcFCVkiUCCvCVDDexkkoDrRvtCPVQY4CCcGRS78G8KlNvva5G/gbZwnFukkU
         XhfVxAh6u9Uk+nB9ANEQsSe+7sHsttBQX3o/LJAu/p/PirLtipoosqwO/lR98sfM6rfU
         e41mVfaKwnqqU7dYiQKhsBzqLQAYeKisWk+vtYjIxdvFsCOBaMbm7pqWMLO3YtP9VabI
         lXf4z9ePfjQXmbI6fc5Sg/nl88pdaW0sP0k2BfFQkb9twFIYWtMOmSqZpd+xIWXAdcCU
         nl0h3Ele3EtM0uojqvVA6U94B2ZVsEMSK9WdjlXpXHjVG43UIa6F2gg6hJ3SW70BeI+x
         eHBg==
X-Gm-Message-State: AFuF++nQ/uYz1+vlHRWlzEGxqnWizyfWdOTwWR9Adop1sRhA0aNXMQwL
	bBDRBEVPz/IrTHhCiM+miK9q7ANt7wKjh43ZHjy8uFzjwRK6hzytCXkUHUQu7Q==
X-Gm-Gg: AYBFou2zunWKxDbMeiG0bwmA0qcKs/+69Qejb5u+E+rb6JNB7HmId5UrnHVVFOnFPyE
	qPd+JCV2aYfm3AvyZPhtNnJvoRZjsEJiuZuxIDmBnEdePRU7qs5s0/M+4VtzZQ4bQUGAmtQSXIC
	7/MZkIsqjMK+UK5uqB9EauQc24Jiw6YUq2SK6ezmwadPfflJiTEGbBSUyVUOXN24CZ2uF2LnKqq
	jUjXFvQBk/EA9UviwZGEY20w47r0PQofydIeGE8B4osxpfCJqS3wP/303QK623KTHbQNhbOCszx
	+W5DtMBwm07m4oAqFld3F5xOaUxdh3qw6+7ui7iHFxKyUahr/QKsaxGpSKlbdGjntnyBbaW0iul
	I4DlW/Vsl3yReIrmLv+kzj+NgiuRKvQiLvZI+fxoAXn6FI4h5v4krrvD5g2jGVmvUGdeqcAnAdi
	YKZjYVjQhZWrtUW5OqgWlrd9hawRO4/6+r9om93A0u84/r0xbmrkhF7L3pIbDAkGWXCt1DUxAX9
	rDKNuPDMvO0TQMM+xc3stip++qrj4q3zw==
X-Received: by 2002:a05:6a20:7d8b:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3ddf7caac5dmr2436133637.6.1790160069818;
        Wed, 23 Sep 2026 03:41:09 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1d5c1646sm1035870b3a.30.2026.09.23.03.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:41:09 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/42] flatcc: patch CVE-2026-90786
Date: Wed, 23 Sep 2026 22:40:19 +1200
Message-ID: <20260923104056.457360-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
References: <20260923104056.457360-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 10:41:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130192

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-90786

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../flatcc/flatcc/CVE-2026-90786.patch        | 40 +++++++++++++++++++
 meta-oe/recipes-devtools/flatcc/flatcc_git.bb |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90786.patch

diff --git a/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90786.patch b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90786.patch
new file mode 100644
index 0000000000..a1e6b16695
--- /dev/null
+++ b/meta-oe/recipes-devtools/flatcc/flatcc/CVE-2026-90786.patch
@@ -0,0 +1,40 @@
+From bb5238cd959e88c590b413d3b105562e6d1c5114 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Mikkel=20Fahn=C3=B8e=20J=C3=B8rgensen?= <mikkel@dvide.com>
+Date: Tue, 4 Aug 2026 19:53:26 +0200
+Subject: [PATCH] Fail early on duplicate symbols to aovid triggering unhandled
+ assertions in release build (closes #387)
+
+(cherry picked from commit 8b19ba4e992ebcad7f5970704d1afc5507fa5205)
+
+CVE: CVE-2026-90786
+Upstream-Status: Backport [https://github.com/jimjag/flatcc/commit/8b19ba4e992ebcad7f5970704d1afc5507fa5205]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/compiler/semantics.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/compiler/semantics.c b/src/compiler/semantics.c
+index 6c56c37..21ff948 100644
+--- a/src/compiler/semantics.c
++++ b/src/compiler/semantics.c
+@@ -1351,6 +1351,8 @@ static int process_table(fb_parser_t *P, fb_compound_type_t *ct)
+             id_failed = 1;
+         }
+     }
++    // Ordering assumes there are no duplicates so conservatively abort on error.
++    if (P->failed) return P->failed;
+     /* Order in which data is ordered in binary buffer. */
+     if (ct->metadata_flags & fb_f_original_order) {
+         ct->ordered_members = original_order_members(P, (fb_member_t *)ct->members);
+@@ -1821,6 +1823,10 @@ int fb_build_schema(fb_parser_t *P)
+ #endif
+         }
+     }
++
++    /* Semantic analysis assumes no duplicates so conservatibely abort on error. */
++    if (P->failed) return P->failed;
++
+     install_known_attributes(P);
+ 
+     if (!P->opts.hide_later_enum) {
diff --git a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
index a4bdda162d..a6bf3c1cf4 100644
--- a/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
+++ b/meta-oe/recipes-devtools/flatcc/flatcc_git.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
            git://github.com/dvidelabs/flatcc.git;protocol=https;branch=master \
            file://0001-Check-for-C-standard-version-23-for-__fallthrough__.patch \
            file://0002-allow-build-with-cmake-4.patch \
+           file://CVE-2026-90786.patch \
 "
 SRCREV = "1653ec964730ec7d9892a08a1695ada6d20f5196"
 

