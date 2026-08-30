Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB5AC61DD6
	for <webhook@archiver.kernel.org>; Sun, 30 Aug 2026 00:50:30 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.992.1788051028890512996
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Aug 2026 17:50:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YF0KwGIw;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-398ba166ce3so501218a91.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788051028; x=1788655828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgHsVDBph2fXpOqlXB9Jo7bjRQ6FfZDx7tGwxDDXl9w=;
        b=YF0KwGIwozNUVQWVu+hqKdvmpiJSFaM+x970PyunOXxig+MMPLMihGtlqeY0UIXMRW
         YwXTZNpAmXJzBF1L665AW5ecm9YGWOHo4uYpB2YxIJXTQY1K7Zyb74MMIGp9VTv6tSCj
         nfFv8L6wDAkiggEa6QJjG4T1xE3zZg9WAPWpVhtF9GAXzgM9/wi0bFypaYqjwCWKp+nO
         Ejmme2mjp2VDOkA02595pTUHB+o3feemcoY0JzIU98X1KizsDo1uUFMILUJJJqkGLgmK
         eq4PHhikKlBpvkIoyQtWVS1XATXVDV7RJtW6p5nEquDYAXb4seJSmG3ARgqTlLLvglIe
         5XfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788051028; x=1788655828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgHsVDBph2fXpOqlXB9Jo7bjRQ6FfZDx7tGwxDDXl9w=;
        b=keRKLlh9InQbqmhpcFpIgSw7HDlAt+ZzPqL9dHx7cAMQfd9C3SqyGQNrMJ4/WCcP4T
         ekqZ8UqX+byN+B9vPdYDKDO4Mbvton0Pf1YtH+zOCZ8oY0pMcFv8HDtkmrMKhqoay8wu
         pPWbSSIH7vaViVhbLS5UsrGcO2hIRrj/zI2PUm2AHf/jb0kogYwn/PQ8vUIsWbMp6y4p
         /Bq2WvAU2r730/4qlWyf/0Hmy02qiv+gEHZhwplTX6aOeloYWG2JNU9LzxdIUzXAlmrh
         iAmQ2qtDy2jEsre5SuWWcHmGCDKB399z2iD/rnoTsGeTS+DiaVbUuOkSUkJeu57ZkEfd
         fE8Q==
X-Gm-Message-State: AFuF++nv/71pvgJS8hRSRGw9sZ3yu2uSonNlpVZHYvHygtwnyu3PEIlZ
	vPU/zZz4r7hnmGECNW9EdlLNV8tdQdfrj/awf3t480AY+C5c3aKGOam/DTNpDByA
X-Gm-Gg: AYBFou3O4nygUrGIG+PXtCjzqtSbrZtWAZupK7omwk39PnVoKCBJ3GxPm82j+NQChgo
	QUQa0QlSV1EXs2h3DoQgHBH6CzbXuqnN1BBuXep/rwa30r0wXj7alI3zWbzZ31Fyetiq892ypub
	4vbAxtg8RuQkgJsa0+pIFz2jLghn7ANUoJ7/IRy4Xc9t0ZcGx4EI6Y9CcQ3sur6kASn5dfavFMi
	Zbii3aGlyCWaddTlYmlF1rq/9JjdF8YCtjfk0H1v1AdAC2Xhz2X62iHhGsvu3lg5zjIZWRL1vqU
	ph8CA6/2YpT8CXkn5ukBbk30JHXuQ8XS7QHZ2XXoxI+7f0RnRZl7kJj83GYEx2atJIxsBoCy3CA
	+CRvWL1YVIa7XCRNy12+fpxachiaV2935vHw15d40eIzqoE3lM6uQXLNIxzzzV7uSEutzcKM5Gz
	uUF2bwaYQ24cK9pfErVP9HsWzYIiiN9elFjEKu0Jc3wSzTb2nsREYe05u1AZnY9TsqGnktEOkH
X-Received: by 2002:a17:90a:38a3:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-398d6e8ffbamr210723a91.9.1788051028110;
        Sat, 29 Aug 2026 17:50:28 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b0ea808csm13561826a91.2.2026.08.29.17.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:50:27 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 3/11] dovecot: upgrade 2.4.4 -> 2.4.5
Date: Sun, 30 Aug 2026 12:50:07 +1200
Message-ID: <20260830005015.2555347-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
References: <20260830005015.2555347-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Aug 2026 00:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129584

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

License-Update: Simplify and standardize copyright handling[1]

Changelog:
https://github.com/dovecot/core/blob/2.4.5/NEWS

[1]https://github.com/dovecot/core/commit/2a5809c115ed270c26fdca5c9b0c29a369706210

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../dovecot/{dovecot_2.4.4.bb => dovecot_2.4.5.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/dovecot/{dovecot_2.4.4.bb => dovecot_2.4.5.bb} (96%)

diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
similarity index 96%
rename from meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
rename to meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
index a0ac6d5f09..2f4981bee1 100644
--- a/meta-networking/recipes-support/dovecot/dovecot_2.4.4.bb
+++ b/meta-networking/recipes-support/dovecot/dovecot_2.4.5.bb
@@ -7,7 +7,7 @@ installations. It's fast, simple to set up, requires no special \
 administration and it uses very little memory."
 SECTION = "mail"
 LICENSE = "BSD-3-Clause AND LGPL-2.1-only AND MIT AND Unicode-3.0 AND LicenseRef-PD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=cb805cc6bdb95ba8fc2398a55fd50877"
+LIC_FILES_CHKSUM = "file://COPYING;md5=6c8f8f4ffb5ada82caf5dd7004cbfe95"
 
 SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-configure.ac-convert-AC_TRY_RUN-to-AC_TRY_LINK-state.patch \
@@ -16,7 +16,7 @@ SRC_URI = "https://dovecot.org/releases/2.4/dovecot-${PV}.tar.gz \
            file://0001-m4-Check-for-libunwind-instead-of-libunwind-generic.patch \
            file://0001-adapt-lua_newstate-to-new-api.patch \
            "
-SRC_URI[sha256sum] = "670f98d55a29b02ae6a97281e51374e553b94496480ab0a07439571ab30ca8c3"
+SRC_URI[sha256sum] = "868c2686a61b5f8e00a3e4721789b1ab46e6528fd773a5fbed07a6ecba7731e6"
 
 DEPENDS = "openssl xz zlib bzip2 libcap icu libtirpc bison-native"
 CFLAGS += "-I${STAGING_INCDIR}/tirpc"

