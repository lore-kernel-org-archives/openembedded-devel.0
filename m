Return-Path: <alexyao1@meraki.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A47C6FD18
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 18:27:59 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.87981.1682447278620268254
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Apr 2023 11:27:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@meraki.com header.s=google header.b=DaAb/lqp;
 spf=pass (domain: meraki.net, ip: 209.85.214.177, mailfrom: alex.yao@meraki.net)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1a66e7a52d3so47559105ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Apr 2023 11:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682447278; x=1685039278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=isMFQtBnD9bjPYETKS6tE4uFtHLdajU/pfcys2spAgQ=;
        b=DaAb/lqpz6fVh4flXTgffsnGVn8vIlNCLCoCcGDWy3Hsb+uAl8KO+h99jPG7KvTLFB
         NscxSdr8uT70vCKrjPYnzex+UC5V2k5HYQxAKtu7ubfpeOgWWgpQALK/N8NKo0mFB7Gm
         7hipg+wsBz6lO+JOiAkHhDNBZaSMCx0SAMMgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682447278; x=1685039278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=isMFQtBnD9bjPYETKS6tE4uFtHLdajU/pfcys2spAgQ=;
        b=RKpVkVeNa1R6B8hMRHHHoyPdCl/dB5u3VkXwoKQjuwaK8t3aVDHr7b3Mjg6Ewm5ekV
         1MsPbrGrVJo9HbLPP+SkdiIpscUUDv2+sXudBWDMjNXuORfEddwbhIeEwFttZdUXBfs+
         FnWL6JWbedJswVZYUvKwqNRncVfD3pGRzwbD7PrY7WnRotpzc3MQgtNY3zYI1kTDH0PP
         JRUkwBHAs1kT6fNedTD4654L0cpOAW5EBIsW/35GmmknNC5PyUcFbFAwRa0WLNCAof7C
         uvClBDA3pHKEocvyxzUdW7TR/CoGLvfLAkI6Q48r2yZD8OB4UuwudsYTa1iJmDdIjAgD
         fI3g==
X-Gm-Message-State: AAQBX9flJiQTa6m/+FF4xf9da8NV//+ygCLeM+AmbCE7XZwb4dt8aZIE
	2AUgqVeUbJ3HplemftCDPqkoaQFm8AHx/40TdrM=
X-Google-Smtp-Source: AKy350ZjCaCkNhFtQzBdI7kgCsyr2M0Xkjsh5A0u2OjtAfYGFQmycY40aixLOdAAsx7gSHOwXyoUWw==
X-Received: by 2002:a17:902:f988:b0:1a1:cef2:acd1 with SMTP id ky8-20020a170902f98800b001a1cef2acd1mr17115472plb.17.1682447277841;
        Tue, 25 Apr 2023 11:27:57 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id 3-20020a170902c10300b001a194df5a58sm8629266pli.167.2023.04.25.11.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 11:27:57 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-devel@lists.openembedded.org
Cc: Alex Yao <alexyao1@meraki.com>
Subject: [meta-oe][PATCH 1/2] lcov: Fix Perl Path
Date: Tue, 25 Apr 2023 11:27:54 -0700
Message-Id: <20230425182754.4146-1-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Apr 2023 18:27:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102190

From: Alex Yao <alexyao1@meraki.com>

Fixes an issue where lcov is using the system Perl rather than the yocto
provided Perl. This causes packages to not be found during runtime such
as PerlIO::gzip.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 47062cca5..f18c7b18e 100755
--- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
+++ b/meta-oe/recipes-support/lcov/lcov_1.14.bb
@@ -59,7 +59,7 @@ SRC_URI[md5sum] = "0220d01753469f83921f8f41ae5054c1"
 SRC_URI[sha256sum] = "14995699187440e0ae4da57fe3a64adc0a3c5cf14feab971f8db38fb7d8f071a"

 do_install() {
-    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir}
+    oe_runmake install PREFIX=${D}${prefix} CFG_DIR=${D}${sysconfdir} LCOV_PERL_PATH="/usr/bin/env perl"
 }

 BBCLASSEXTEND = "native nativesdk"
--
2.40.0


