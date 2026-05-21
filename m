Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FED1CD5BB4
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 22:36:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5845.1779403007241224617
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 15:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Sy8wv/4O;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-839dc688d6cso3012248b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 15:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779403007; x=1780007807; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oDjQg0bbcqUAv14RpFEph4btt8IbShddXltFtFiAYug=;
        b=Sy8wv/4OiyHdiAGjwBWTFbfRVY+JbjD0Au3cwlPY7iwXAxE6NdbzUqlMWe+PEl2hpO
         txgS7aD6fT811xcSdNO4ZvThVLWlHEAYaGGq7rnEkHkhOZyX8br+qur8ik9BPvT1w7+1
         OtMCiuG6WauUGUx6LvzOm5pRHnaYILIZMhGOSNBEKpmP0CMyxgYVPPBmTl0qVgVfQqBi
         4rFhWvQclevjDgxzWvWj1dykhhE7FAgdDwaK0AWGkWcl/GpjwV36Nn29y/kV5cqtvoRV
         n/RPX9+3JsZ4fl7Lxqq4WXnAnIc0ntvMkR1rFk02rfk7bSAxexqvJq67vr1qWtQyRoRh
         zNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779403007; x=1780007807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oDjQg0bbcqUAv14RpFEph4btt8IbShddXltFtFiAYug=;
        b=a/SxdVvF8/K9UG46xRKy4qaegwTL1IvvKNy5kEXPSEBpzyOEqxU1kNY9A1VpQOBKhH
         Ylg7oC614EgGgLxyMERfVFzTbOmDzbAkRYXNtBpqvfpjqHCY+aBBRa2UGVrGLIpTEAD+
         GaJS/319TpQLcTcKvCuGTF+1SCU9Qc5TSiuRikRXizwoYOpxujvAA1iCr8ClC0Wxa3BD
         39SCixCxtc1cNHJYy4weAyZw0u63mznTOIuQJGsc8MxXXE0v0PfnFkOllJ3qb2+sCicz
         OzlYMHTjBhy7ElQgPHGk16fDTH/IdwlnL+XeeWwYmwHIqhtoY43M2g13nC2I/ve1d05N
         LLhQ==
X-Gm-Message-State: AOJu0Yyb7yOVBLuSxfzacYnOR4XFGTLmEOcG7OqA72s4Q67SQIYAy31W
	vBcdXXCFfVQyJdBrneJiELs8VAFndznI3XESQ5LbN1ggF4U6WVCCgRhZvu/XaD96
X-Gm-Gg: Acq92OHeWD9sbZX6jnARoGusN/EJXEwrwBfSv2bcEQ6/Jd+tNWbWdvRuAtdEJbpoiDk
	2ZjXJy8gxcULYzzNqYyQddPizILLN2qW+69tJ8UZrifN4xMgxhrheHIqgz+eSfKju1TN8WOdsp8
	lpNYKABm+S4crwMoucaAmBnB6rA8vVoJpkjxT+Z9XKPFt+qHAO8cFy+BTBNV8eGJ2RZQLst5s6a
	PfDJTrg+Oen6h+ixdp6XS2GC6olKeG7YB4QM27A+XeuybKtKkYd8oe/gNl26HLzltw8hCvvBBzI
	IWRfvnmpe/lXoDpB0SjZ9f4d89+vHPNFa3g8WS3vuH3dB6OIx+6Xdtdw/WE0JN2XYqvMMH0MMPL
	5ZrJbnKpjYti6aND5/2XYMJVC5p7RRJuFUhhW1fcaeZotS/Er6Dkfop7JqOz6/hEtKdKgiWbbM+
	PmvVSsLQYLehC2FXXtBiF0oibBfR2iAVGjL/CY
X-Received: by 2002:a05:6a00:1ca8:b0:837:6bb9:acd5 with SMTP id d2e1a72fcca58-8415ef52165mr1007801b3a.0.1779403006599;
        Thu, 21 May 2026 15:36:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84162879230sm124505b3a.33.2026.05.21.15.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 15:36:45 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 4/5] freerdp3: upgrade 3.25.0 -> 3.26.0
Date: Fri, 22 May 2026 10:36:22 +1200
Message-ID: <20260521223623.1335832-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
References: <20260521223623.1335832-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 22:36:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127143

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

https://github.com/FreeRDP/FreeRDP/releases/tag/3.26.0

PTEST passed:

root@qemuarm64:~# ptest-runner freerdp3
START: ptest-runner
2026-05-21T21:46
BEGIN: /usr/lib/freerdp3/ptest
...
...
DURATION: 41
END: /usr/lib/freerdp3/ptest
2026-05-21T21:47
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/{freerdp3_3.25.0.bb => freerdp3_3.26.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.25.0.bb => freerdp3_3.26.0.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.25.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.26.0.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.25.0.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.26.0.bb
index e71f2e213f..054d0e7aa3 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.25.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.26.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "90e7f064dc3ab8672b8ec714059d8cd51be0743f"
+SRCREV = "3f6d7cb1f8973cc84c66b258a9a61c4e2b2f30a6"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 

