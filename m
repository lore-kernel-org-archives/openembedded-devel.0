Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BA0C43217
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:18:51 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web09.25684.1651346326506302782
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pW1+NzeJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.182,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id g8so7064582pfh.5
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=oterpJg92IjtA5sAWWnfeit82QjYIJgnNj4W8iqExAw=;
        b=pW1+NzeJcO1vKmkV4ZJUa5b3qalVUsx79DjQP5J9pD6tXYjGDDgDsYpM0Hd1iLazpL
         ep1+kVeI0+MS+1gu9oKZzuSNA52UMvo6idJiXKvV9LgncdXL7aZXjhLx6Ode0ruy11ur
         HLxbX/s632mPdOHBLvoR7HW3KCRZnqx64MR1BxkyKhSvfRNF7rGh8jyrYt97pu5PAw9d
         a8XT7c4qJ5WSfaQnkrJhae/28SBkhyNkFpAlThltxUUXhuK4KandsRExM3ojGFIKq8V5
         dG4bbEpkm9UoRbeT6pdKk+41ORVnsjgTWn2BcaqMqsVft6oXYVFqdjN3LKlpkvuVDttd
         Gxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oterpJg92IjtA5sAWWnfeit82QjYIJgnNj4W8iqExAw=;
        b=Izsg/Q0mhhOjSJRkOAvE1lonioGvrtQtF9khcMxijMba3CqcF6tWHLqXoBYPdHhFq4
         nw36c8o6AYSaZfoq1hCTfMcqpNMMLd5axw1J+N3TG2Ci18/sxCRkjf8ZOL9w1pNrI0ZC
         XsGbpoOKX6QeCfrOYmI+fIjB0Z9Ux4gEpr6sqHXPos3BG1gFFiGYZaVUezdathntCFDZ
         ESrnUO2csdtscoiXwronkQK2b81Q250EDx/d425J0Yfk9diAfSbPJouQ6i3O7Wv01Nv/
         IUUmV87GeGqEw6VNNxfhCDFJxYJBkWb8Mp6jlLlgw+gAMfHeivQdHyRdmP4G1QYCCuWb
         FKVA==
X-Gm-Message-State: AOAM532jXl0J7ALleYL74jD3X9QW2ccuu6aJzj39ifWTUJYJ2nhpunD3
	OqCW66gA+aQIflS22DtLrbF0axEEMKPhUg==
X-Google-Smtp-Source: 
 ABdhPJwHBtWPBSNTbhX3VCyPFPJ8XlkkL66WDxSBPQb4aHnLtT4Kz3wWNMl7vRrQyNP4SI0pZCt9gg==
X-Received: by 2002:a63:8543:0:b0:3ab:5afb:200c with SMTP id
 u64-20020a638543000000b003ab5afb200cmr3939016pgd.402.1651346325422;
        Sat, 30 Apr 2022 12:18:45 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.18.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:18:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 13/39] mozjs: Use vendored icu on ppc/clang
Date: Sat, 30 Apr 2022 12:17:53 -0700
Message-Id: 
 <95f6027ced748860342aa7c98c74031dd0619a4a.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:18:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96880

From: Khem Raj <raj.khem@gmail.com>

This helps compile gjs, external icu is needed with gcc-12 but not with
clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 78180b6c21638b41a5bab9ed706211304d5f2552)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
index af9256860c..9b990ecdf3 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-91_91.8.0.bb
@@ -24,6 +24,7 @@ inherit pkgconfig perlnative python3native rust
 
 DEPENDS += "zlib cargo-native python3 icu"
 DEPENDS:remove:mipsarch = "icu"
+DEPENDS:remove:powerpc:toolchain-clang = "icu"
 
 B = "${WORKDIR}/build"
 
@@ -43,6 +44,7 @@ JIT ?= ""
 JIT:mipsarch = "--disable-jit"
 ICU ?= "--with-system-icu"
 ICU:mipsarch = ""
+ICU:powerpc:toolchain-clang = ""
 
 do_configure() {
     cd ${B}
-- 
2.25.1


