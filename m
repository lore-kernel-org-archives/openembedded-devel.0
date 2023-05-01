Return-Path: <alexyao1@meraki.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDD7C77B7C
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 18:39:00 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.103139.1682966336288099212
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 May 2023 11:38:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@meraki.com header.s=google header.b=Z1Ez5PZk;
 spf=pass (domain: meraki.net, ip: 209.85.210.179, mailfrom: alex.yao@meraki.net)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so2191360b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 11:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=meraki.com; s=google; t=1682966335; x=1685558335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAFaWKG2Sg8jGUMknDcoV059vGiKoEf8Dsy6U5UePTQ=;
        b=Z1Ez5PZk1EMFnGESCYNSrYPQ38pQ7b2c3emJhytc3sBUHeLFdJhb/2ZFSL2YT/aZex
         bAPLrJmE8rjAWUP8m0XR1Hf9CGkqnGbyPF40Qvg2tNmOFE7OTZUQaJU9c68z+rUGKcHb
         8BZrhJvMEF+O2bZsMhG38ftjqM5SmHUqJOLKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682966335; x=1685558335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAFaWKG2Sg8jGUMknDcoV059vGiKoEf8Dsy6U5UePTQ=;
        b=INH3QVS5TyKnBvX5guyccZQLwhMpln2X4R5s9Ywvk4dB77QcLDPoQZCtQ7kvThwssd
         qXGVTo2EyE1yY2jebS6lpAgZ9hXncTTB42Bo7SrR2gj+57AePJLaBN40yKR6xu8X0Klp
         BwBAu+k+1vC18vickv2g1NRcX+rpzX9KLa627Y9RPRjdD4xmLZ/rLTVEWKn4ILz70glU
         82JoKJJ7lwuQwJS+bgqNT4FPdTUSHmtMDPWF0Cc1UXwmGZbKIlY9duCQBjhFoyfvXwIR
         s0XUPAr3QXvfOQRpCY3pyTEQEjG6GDCZCEjuwYCurGyLWrpP2YzGTu447C4Oco/IceVC
         A5Kw==
X-Gm-Message-State: AC+VfDxIfeJC6z3gDeEJwERMCcb5AWMTwryqAqKFxWkZT08Hd/by69r9
	0o0dAEtJWdxhtkX1gLthmmpMQU+Tcu3ftvx0BDw=
X-Google-Smtp-Source: ACHHUZ7SPrHHezpug00UFoDiK6w7lCnassEuBnbx+QztMCzLadas5qC8twfKtvsN2DJX6CM96cf8vw==
X-Received: by 2002:a05:6a20:8e22:b0:ef:e017:c60f with SMTP id y34-20020a056a208e2200b000efe017c60fmr19594766pzj.51.1682966335557;
        Mon, 01 May 2023 11:38:55 -0700 (PDT)
Received: from sdg988.meraki.com ([2620:12f:c000:115:d2e0:42ff:fe54:2ce8])
        by smtp.gmail.com with ESMTPSA id u10-20020a63234a000000b0050be8e0b94csm17063294pgm.90.2023.05.01.11.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 11:38:55 -0700 (PDT)
From: alexyao1@meraki.com
To: openembedded-devel@lists.openembedded.org
Cc: Alex Yao <alexyao1@meraki.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] lcov: Fix Perl Path
Date: Mon,  1 May 2023 11:38:52 -0700
Message-Id: <20230501183852.1214-1-alexyao1@meraki.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 May 2023 18:39:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102245

From: Alex Yao <alexyao1@meraki.com>

Fixes an issue where lcov is using the system Perl rather than the yocto
provided Perl. This causes packages to not be found during runtime such
as PerlIO::gzip.

Signed-off-by: Alex Yao <alexyao1@meraki.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/lcov/lcov_1.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-support/lcov/lcov_1.14.bb
index 0cc8b31b3f..5e8fb938cf 100755
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
2.40.1


