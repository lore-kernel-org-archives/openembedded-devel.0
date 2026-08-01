Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DED3C55184
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:45:46 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13731.1785620737673491421
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=sFwEqjEQ;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso21012595ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620737; x=1786225537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RxFVwqFucY/Brb5fhIc0RuPMoCjXqhbcm9cjz4Fe4v8=;
        b=sFwEqjEQGaia6NvhumMwSkehYV3RYGW5sTTY6cxJ876U4z1dpTbazKSMvzHC9/IHWJ
         r0hF+1wCnBsECJqoGAuEixs5wRRS5DunYVF7Fze7t2epe7M4+jpAGJh2lrB1DzeKiLfw
         0fcbclEiejzC4HLF+9bwXe5zaQ4fcQQOrZbAp5VkRGkUGv6FXlxmPDDkB6x1oUiqRi6c
         h/Ip8unM839H5Varw9TcWN1jpVMC1o3MAcXXmvXRaruXR7+17Dxnm+fZMLSe57CH2gse
         LdbQvdniRb4QuVCb5/1l3tT6pc9kXspQuqMdoBI95usIpirPtHITur7EXesVJ6zLdHeS
         jYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620737; x=1786225537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RxFVwqFucY/Brb5fhIc0RuPMoCjXqhbcm9cjz4Fe4v8=;
        b=caYsxlufK+GkxYlNi3JWfA1p6oyk4G7dQ49XJJXNuAzZz1qvTrMGI1JxABDE8/wfme
         TuKJzNUAzv1Xy1VMumAzSILn1mojqF1pcUlYCG+ogDmaG3RUQdzYDSb1iTNEwu79/l25
         NOmRKsAgRJtsWJJ3L72068JJSasupsXxiQh8VYvKiZpr96Mprj0/FCLPY2QwIfqQotBG
         CxOYcv9t8Aweub5Q2w9PnNh4B/tOnp4dPSOOuo9LfaMvnPLZTzxZND5KezzcsMf2YHgZ
         sN4kx4WLyLwigVotdDesq+Zva8dvur3JpGlDqjJqUiUqhxCNXKbfd7/qP9Fh0mMJYPDR
         uCwQ==
X-Gm-Message-State: AOJu0YxedyvB7g3XlmW0yS9Ryge9/WI07q6iLvARngSkvT8mK1l3sX1Q
	L7wAtT6DBWEuSvdaI4g8HG/9yLbOPrwZADVr6ZqF1Wkf6/huMFKFj0nrnchzsmcf
X-Gm-Gg: AR+sD13PLU8eb391kjX47H554TNVjKaK15SVl67SpYNgkZrkl4wk+/zODSPUDPlDBFg
	e6Y+QbVKMPlrITrWhKkG2KRoHCiCSwLoH7/UU63HmmvSttJCRi92ophjnd7zquj5z2Sn+Ku9Vhi
	KH4UXfvJr8YiDfEIVS/HykmWL90Sd6FW7DpEyYMHJqoLrUTGrndtuiE1FMD5/IjLCVnZGwrAR5S
	7lpj0YXgdvprJPKfOx+vhqcJveK5aoKqD3Mx+J2Ky7DvTkuOJfA6W/12HycMatwg6Tiof3vVlaX
	Q+z+Yp8fv8un7OS7aG/jpqyJANph5vLrEA0Nqtl1VDE+XjNbY/UxZzZ7QDAfOq0hxj0tTofqEV6
	DBD9rRL1maRaq1tNmDa2mLyODtvBgSTyoTOf21Zb+PQcbl4fBU+nSwyQut7cdqWFRp8Y5/zM1dW
	isoz9c4saBh6P+m49qS8L6fqz9lrnammXSTRDfdtmLOouzjmp1kaI/Ra1qWHYVak4rYU4Af+FeB
	pPMRCL8ixFKt9ODj+9FvFGYHkzniiiYV8/yX5HodsVfkIP/2OFjpZT6DVp6npAnFQmvcCKrtB6b
	v2O8E0tuTY/SsM3aE0zBwZiCzl6Vkm4lQzp9FLGW8LhIo3AirRHNNKVpUHqervM4Ih4SXJOZvZM
	Qkw==
X-Received: by 2002:a17:902:d986:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2d05219f70cmr53084035ad.3.1785620736949;
        Sat, 01 Aug 2026 14:45:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 09/31] libupnp: upgrade 1.14.25 -> 1.14.31
Date: Sat,  1 Aug 2026 14:45:04 -0700
Message-ID: <20260801214526.788343-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128626

Upstream changes (ChangeLog):
 * 1.14.31: fix for CVE-2026-41682.
 * 1.14.30: revert an inadvertent API change (25d4bd0b).
 * 1.14.29: CMake builds from the release tarball now work.
 * 1.14.26-28: SONAME/CMake build fixes and assorted portability fixes
   (e.g. OmniOS POSIX asctime_r).

Version-only bump (git tag release-1.14.31); recipe unchanged.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libupnp/{libupnp_1.14.25.bb => libupnp_1.14.31.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_1.14.25.bb => libupnp_1.14.31.bb} (94%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
similarity index 94%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
index bcecfd3b8e..6ba21971d0 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.25.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_1.14.31.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "da7cf950f22357545061961b7e5610e08690b0cf"
+SRCREV = "79ff958ed1012e60faba84981481f76cea43c7f2"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=branch-1.14.x;tag=release-${PV} \
           "
 

