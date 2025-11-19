Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100B1CF3191
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 10:53:46 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3955.1763549620210402170
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Nov 2025 02:53:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fTZFoICV;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-343514c7854so783855a91.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 02:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763549617; x=1764154417; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ALkpu7oiaWO0cwB4a14v1HFitSxBGlatYDf0hfx0e2w=;
        b=fTZFoICVFaWaZWvOX0aXSlRMY+dM4G2a/bFDWhQkEOsHeuekyEbyjaLFFuktcjqqLX
         eKtxp90vdyQRomAvOnZNZ+BWNws+DiC+ZOAX0Qfv0EVuZb9YqTUZ9mvU+thCHCftzfP4
         Uz62bg8b2irFgkOel8EL2megvyf6F2c2o/jK5UysF269cANgZPXp22iSecoaMfPMQ+R6
         VqLZQvm/cW9I0Yn3X/URKwMriktHmKU2x8810yqcf6fkMDkickXZzZNFquucPDIaeSF5
         Gw+g0XBKSV8H2u3NWje8FknFbF9k2WlGDhpOe/V2Ql31Qen0x2BUsEQSRdU0vDdiGBhz
         9Wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763549617; x=1764154417;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALkpu7oiaWO0cwB4a14v1HFitSxBGlatYDf0hfx0e2w=;
        b=HwIy9ouZZohAP3BLlYCa/JnB48ycaIadhqxA2nZGSb6cKnnbp8VPkxCcc02f4Zb6u8
         aeRownaNCGQU/JTj28N57o9Hefx9doEMcbF2YkDHmXwnTbKFrURrVIgqU22mxXenu5tk
         mey5umOlZwurTC5sLjzUIeqSi5EYDZiofhJ7reBBJtubpTQBqrAQSr7uxVyjZ9U4vvFG
         7zpOpSFNY3wFhiwcQdACCu230Hz2HxdVNUiTtOuP/2FvQgRGoqTQ9T33C26M+YnQOzVN
         NT87Xk8O5fWidYuFVC+oPNNZ3mwmXWjIKPREQfh75a+jdQ6jrPUgZY8Oocwe2ZvTZgiJ
         YdQQ==
X-Gm-Message-State: AOJu0YzcxCt0wpYhHnDRA0LpYRaNY7JRWYPalTATC57m6rD0QghtEgiY
	lIZlmCD8dD41TNkHxxgOpaIziYqsuTq8K2uU/I7dbBcDuISc6Vu/sVmcBsaOnA==
X-Gm-Gg: ASbGncvnwz5PeisHLbmsABgCVUzk5zfD8mKXm55PHBbqy96EnmFhKgWPswmn/3HnQ60
	D+8LjoCRw90XWnCK9WE3ZSiV8zpx4GLpLyF1p71oGGKvD3i7rz050mkl3N5C43cU7iByP10MPTa
	rLdsSmnqZJEfF64JQpIn76yKi856nJ5u2dCclFHSPp2cfSxBi/fdbeTYc9aODi4dVpXDfsb+fJ/
	s4UjGvVfkl/O4/C/AOVRG2cC58BfhP1l0+HKPrjAeErDG2YseGSpwfe3oy/VH4GKoBCeD+T7RNW
	FeZEdliXb6HHLLxsiCexiIloy/JB3d1dnRQOBZCkmHEUUxdLT9dXchRFyIc+DcQNlF5R7iX/C61
	tHLtuRcAk1pVz73rdTRqigYfGIx6KFppJhxvrhO/E035CvIjzjkRy1C8rDJqbzFRpxaq5cZ+fwj
	/9EA7NGTOprPDh7JIHojIMWj3agm0Yk034X6k=
X-Google-Smtp-Source: AGHT+IGK6wwckzsSghZ+zgsTEO4zkw7wyL3TXsxOY0O5ph/XtlyT0wC9PdOGUcZVNQLsQyQF/2n1MA==
X-Received: by 2002:a17:90a:dfcb:b0:343:87b3:6fbb with SMTP id 98e67ed59e1d1-345bd18bfa6mr2011557a91.8.1763549616899;
        Wed, 19 Nov 2025 02:53:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([167.103.126.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aed60bsm19383078b3a.4.2025.11.19.02.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 02:53:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/6] cli11: upgrade 2.6.0 -> 2.6.1
Date: Wed, 19 Nov 2025 23:53:23 +1300
Message-ID: <20251119105328.2849176-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 10:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121892

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Release Notes:
https://github.com/CLIUtils/CLI11/releases/tag/v2.6.1

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../recipes-support/cli11/{cli11_2.6.0.bb => cli11_2.6.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cli11/{cli11_2.6.0.bb => cli11_2.6.1.bb} (95%)

diff --git a/meta-oe/recipes-support/cli11/cli11_2.6.0.bb b/meta-oe/recipes-support/cli11/cli11_2.6.1.bb
similarity index 95%
rename from meta-oe/recipes-support/cli11/cli11_2.6.0.bb
rename to meta-oe/recipes-support/cli11/cli11_2.6.1.bb
index def32b7a6b..b6c1ac56ba 100644
--- a/meta-oe/recipes-support/cli11/cli11_2.6.0.bb
+++ b/meta-oe/recipes-support/cli11/cli11_2.6.1.bb
@@ -8,7 +8,7 @@ DEPENDS = "catch2"
 SRC_URI = "gitsm://github.com/CLIUtils/CLI11;branch=main;protocol=https;tag=v${PV} \
            file://remove_tmpdir_from_test_binary.patch \
            file://run-ptest"
-SRCREV = "3914826ef81208f37dc5843fa16f491d7f8c0829"
+SRCREV = "bfffd37e1f804ca4fae1caae106935791696b6a9"
 
 inherit cmake ptest
 

