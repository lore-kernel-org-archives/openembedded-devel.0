Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1416BC77B7D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 05:26:14 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.62388.1684041965114504955
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 May 2023 22:26:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Xy8LhHwQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-643bb9cdd6eso9308324b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 May 2023 22:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684041964; x=1686633964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DZqUfiA4yfbxvoNFIMRlJvypS2LQJnZYa7Nnv64HvgU=;
        b=Xy8LhHwQZcOR4TiwK/4bT1ocit/wGZBj5kVGtFPunbmyuFFCwP3BCk4byEdPhEZlnO
         XWFKpzf6Vs3ypAE75l6cFU0uiROJfBM6l4jKfP2TILI8opBsBVpjsBro5wHwCSeBcblS
         u3arqLLkgcOilKoy2U/Q+fBFEX+iB87lGWeEGIRdqYxkvN+xIEoZQYe5OkUb72GXRqTl
         IgjICJWGP1BI4TCzzI7l6Iad+STNC/7ZJqmb6aWMwYhcwoO0UlVCnpgXIh5wBSxQYlUK
         KpFq/7PdfGOqUC6jhalhZuVLlVBqoOBhpwHrAr1yasRDqwePvxVWDxk/WJJxhG32yhd6
         T+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684041964; x=1686633964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZqUfiA4yfbxvoNFIMRlJvypS2LQJnZYa7Nnv64HvgU=;
        b=fObSjGEAPg5zT3p1Kozne1wtAwpI1mf5jNO1YfeTHENflXT4u9Rmze1DqHR4if9rw8
         HaZrTrjcQNSoZCRX+AFWJwZGhDAjMpUPapowSaPBJZbSBwk+GB3Mo9CWtrXJ5UJ15jwC
         DN4hStCsTaW8oOTHRqYQ5uF81RG/h2r4Ayn+hro+MJjnEv00wNnuHL4biftGhwTKSM2a
         BOV+aSmZTZjVEiXyLtfqiMcUaP5a0ZOvh7J8NCqCgUgslOmT/m+mlTAhYPbLcG2ncelW
         LkOlvgASdyicEeCX5rpQPlXvunFmQk4vRrmSKFnkDTKMK0hRoMsuSS2Mm0mFIZ4YWJnC
         2ZsA==
X-Gm-Message-State: AC+VfDwyOU/GkzfqW29G4kPQEGc0Ck6iyIGTBxS7llEyjt4Jlwgwn895
	QW0UjYyauCMN+w7EVOrX50OGArpyUr2yTA==
X-Google-Smtp-Source: ACHHUZ5phbqlUAZnGQu+QTkwONWszb/Szhw2i75GVB/CaTKdR1YfsIhpwRBD7bLoLHEpu3NQGlGKiw==
X-Received: by 2002:a05:6a20:4426:b0:100:24d7:545b with SMTP id ce38-20020a056a20442600b0010024d7545bmr31637335pzb.10.1684041964268;
        Sat, 13 May 2023 22:26:04 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::298a])
        by smtp.gmail.com with ESMTPSA id 19-20020aa79213000000b00640df8c536csm9792229pfo.12.2023.05.13.22.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 22:26:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] lmdb: Pass CFLAGS to Makefile
Date: Sat, 13 May 2023 22:26:01 -0700
Message-Id: <20230514052601.1580453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 May 2023 05:26:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102564

This ensures that __FILE__ macros is expanded correctly without
buildpaths

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
index a76d388d70..35242bedb6 100644
--- a/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
+++ b/meta-oe/recipes-dbs/lmdb/lmdb_0.9.29.bb
@@ -21,11 +21,11 @@ inherit ptest
 S = "${WORKDIR}/git/libraries/liblmdb"
 
 do_compile() {
-    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}"
+    oe_runmake CC="${CC}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" XCFLAGS="${CFLAGS}"
 }
 
 do_install() {
-    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" install
+    oe_runmake CC="${CC}" DESTDIR="${D}" prefix="${prefix}" libprefix="${libdir}" manprefix="${mandir}" SOEXT=".so.${PV}" LDFLAGS="${LDFLAGS}" XCFLAGS="${CFLAGS}" install
     cd ${D}${libdir}
     ln -s liblmdb.so.${PV} liblmdb.so
     rm liblmdb.a
-- 
2.40.1


