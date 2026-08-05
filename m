Return-Path: <ghidoliemanuele@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28A28C55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 08:33:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35926.1785918795911839915
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2026 01:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EZiwU59q;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: ghidoliemanuele@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fdd674e17so398209f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 01:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785918794; x=1786523594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcYKtiwQsyfUCiejhNHKSnzpHPRP9EvQFjFNFkUH7SE=;
        b=EZiwU59qOTXB5BU2U/dMOkvlM9nRNlwb7EKYGET6Dpyy6HXrmkbph53lBFSv+QajhM
         G/w7AxIGuuNsiPZl9uwbe8ctbSdmpLTI6wBVZmcHY/NRcyfulXaCpbioDeSTe/IZ6Ok1
         OR6k3lB5eBqZD7wqEryirtAyr+mBgZ+s0lb/c0Ih2Pqr5/gY0RcP5pySaC/G1gT1YRe6
         xUtYaQNdiyZ0m7ZearqL86gKJjSTpN8sRG6/25JjKLxff9RCDqKpBpTMl9ypZ1YncwdR
         4HhVus60IcYU2oZcuIB7LztVCysCj5F7QXO3DGNM1oILWi7nrKqyjIKX76xE3NFhsDzf
         YS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785918794; x=1786523594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcYKtiwQsyfUCiejhNHKSnzpHPRP9EvQFjFNFkUH7SE=;
        b=LK4v27VeN1/vbafzSfE/HbPB/WqUfraabeK/3KZ1HzjmC7BAEp4p2OLnCaDu9huWj5
         MbBWrw584gXok74YHfcSkWRdYItllAsUMQD2M06j93tCPs7L87xqGvI7hJqRut0DNKOX
         dizBmr5BuykJDI7yP0ey6dV/tfw4Pmis3lx54ltoRugdQTAgfJUt/l+34KXOm5thuo5t
         zUrbohyFv0OevEkpZp7aM3uhr68iSnMC2FqPYeSaVPa9zHcWdTlyHzV++PlL9CO0lyxM
         icVbpivLDnIcqKlWgvQVHTHSQ5dadCW0UKxT8XYPoY3l4vP6cL5S+TuKa/1Yv+YZeSPW
         AVlA==
X-Gm-Message-State: AOJu0Yxq6AUvnJ5B3Jh3+UfbReStECH4ZPue4h3MxSosmnyxjXcTMaVu
	g5f/wtkMruuOiIFQYjvV4LiOQXTpHi5LiQp0E0hLwqgRmhcOzLuAQN1nHsuUDA==
X-Gm-Gg: AR+sD12X4YJNWOUBxwwMoXgZaL54ZuJueojZPoDHOCYT8abnHUzqavpCH4JvnWKlFGu
	8N7Sxap+s9m5+mXV2TsLeKY0Sw7MKj+prgiR/SAVWU/AWQCZbLrOfswiOUzVh1QWtD5sAzNi/1t
	qeS9PIQlilx/S03VNgLv09en43151FnXP3l2BYUToQhGdUPWlWgaGKyHteg+CPdJCttI4xffOLq
	dJBDq/pZtHk36Mzp0oRWRP72NtjYZ/08qTAKelBB6h/hRUfk/PkKA8V1wLKA2VPrSp2seSj2hoe
	6Iij7dTMox7hUpIXcTC561i5DkAkrcNHBXYcTPvtOwiah924hWDwPPrHlKGo7V8VZhXP1lrjEmb
	ln3DP31hWSmhbEH1VxwfWMdbyrhe7CpBgNtqEspr3QC69hUWbHE8L+AEu7hbR01hpo/kyWaMlO4
	dz44zxFNwC/jQMo9xWb+M8+FpX2nnzsbodJhJ4BNIODVlYa+PwJ1MkQ0v5gbJ11b9JquW0MRcj5
	npUTBnp5lPdfgb3WclO7rX6GcuukJfGsijEDS6vA/ZF
X-Received: by 2002:a05:6000:4810:b0:47f:e9fd:80d8 with SMTP id ffacd0b85a97d-47fec62e9bbmr7955390f8f.21.1785918793876;
        Wed, 05 Aug 2026 01:33:13 -0700 (PDT)
Received: from emanueleg-nb.. (host-87-5-153-198.retail.telecomitalia.it. [87.5.153.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febfe5d7csm7338318f8f.15.2026.08.05.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 01:33:13 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Darsh Kelaiya <dkelaiya@cisco.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>,
	xe-linux-external@cisco.com
Subject: [PATCH] jq: fix build broken by the CVE-2026-43895 backport
Date: Wed,  5 Aug 2026 10:32:53 +0200
Message-ID: <20260805083256.2499546-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2026 08:33:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128803

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Since da15df26e62b ("jq: Fix CVE-2026-43895") "bitbake jq" fails with:

  cc1: fatal error: src/parser.c: No such file or directory

That patch is the only jq patch touching both src/parser.c and
src/parser.y. git orders the diff alphabetically, so patch(1) writes
parser.y after parser.c and the shipped pre-generated parser looks
outdated. Maintainer mode is disabled, so make runs the no-op '.y.c'
rule; having "rebuilt" the target it stops resolving it through VPATH and
looks for it in ${B}, where it does not exist.

Touch the generated bison/flex sources before configure so they are never
considered stale. This also covers any future patch touching src/parser.y
or src/lexer.l.

With maintainer mode enabled bison will no longer regenerate parser.c,
which is fine: the CVE patches update the .y and the generated .c
consistently.

Fixes: da15df26e62b ("jq: Fix CVE-2026-43895")
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 meta-oe/recipes-devtools/jq/jq_1.7.1.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
index 4327a25311a2..66883ef4a0ee 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.7.1.bb
@@ -47,6 +47,16 @@ PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind"
 # Gets going with gcc-15 but See if it can be removed with next upgrade
 CFLAGS:append = " -std=gnu17"
 
+# The release tarball ships the bison/flex generated sources and maintainer
+# mode is disabled by default, so make(1) must never consider them outdated.
+# Patches touching src/parser.y (or src/lexer.l) make the shipped src/parser.c
+# look stale, which fires the "NOT building parser.c!" no-op rule. From then on
+# make looks for the file in ${B} instead of resolving it via VPATH and the
+# build fails with "cc1: fatal error: src/parser.c: No such file or directory".
+do_configure:prepend() {
+	touch ${S}/src/parser.c ${S}/src/parser.h ${S}/src/lexer.c ${S}/src/lexer.h
+}
+
 do_configure:append() {
 	sed -i -e "/^ac_cs_config=/ s:${WORKDIR}::g" ${B}/config.status
 }
-- 
2.43.0


