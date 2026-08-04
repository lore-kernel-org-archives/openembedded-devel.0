Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC00C56201
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 19:41:12 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24814.1785872462751754362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Aug 2026 12:41:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TNGsBAA7;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso1034525a12.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 12:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785872462; x=1786477262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwd78dHGVlMspF76DoCYWdwNF4tjJnf7n3qXaDQLoew=;
        b=TNGsBAA7459RvqaQhowvOJYkvWsJTAs5khq4ikOE8cJpQvKumILguIuFBf0/nN3WXj
         XnbFqXm+52vZfvb/cj3IkDdfPhekQ/HwATx04WJloCFbncDXTlgFfTcRlqcvX4dXk1f9
         11ujPRAjXncRJJ3dv0vyYc5n71wjyfUOEgAieWxiCBChqoPcP4b1T9+r3NC8Q603oObS
         BTF3GXejJndybhzxqmKCXAoHA5Rm8Q1o8OeXCUWD1w/lkBoaqXJv0QHyT9ACyPfngMV/
         2hk9EkVclSDQ54GZ+GwTAVVmpTvIJnVgCKayq+UdDh1VQcnDyeRzNHZ/xVZD2YRWbSEK
         eaVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785872462; x=1786477262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwd78dHGVlMspF76DoCYWdwNF4tjJnf7n3qXaDQLoew=;
        b=dfd3WheV3iNE88ig7lYu7KDYbv6f8RoggmRjO/bCjLhgtd+vGZjWyQbdQPAzpUZ6H9
         Ou4vpa0bcfaj3LXe025UusLfKaJghXXsL+zfryTJd13sFbt81zo/hZl0nZD2CPx437yw
         6xFgfD/SY1TKp4TCmQ7Xk5CoOklsuVk1TpWvyrayHCnpvoxe8o8vIjlQ/2V3SjGKD9T9
         pNpdZULnCcfGRzJtrZNCyOR+A9srry1VFHcyHuf0r1GYYvbDFgxgdj476dJDAGQ2i4dJ
         FbuUdnX7S+Rd8Gc1E4YlAdUX+LtT9CYmb1GPx3hhPHM6vEQXfRO04XkpTJaYGzMTiXa1
         2Olw==
X-Gm-Message-State: AOJu0Yz/vjW3DVzWwXHkO0xrfqX4xTscv7FAxWJmGoZVZr5xbraP7x10
	rl4I0jZyapKL7h0FSAtgAxKf+bgsPzQwIoVcdISmQ/LyeEshYLU/QqskcMOQNgm0
X-Gm-Gg: AR+sD121FR7M2k23WIq1BZpMU1ckA2FlgD2qlumG2gUwGhMzOF7LRuVQk3mryR7lvKt
	1/I0Mh+LNTURCiTDeykZdgMYXmnzAvZLLvPqjZBThQFGjoau49R0r3LMunsJRc57xHdIS69ZyOY
	XmuUehoqHvnah/Z6LcCj5sq/xRQr3UvMubtisXpsjqN+/86+k7O4p3B6YXZb5gphn/BcpzNjmm2
	xTEWdLM1UO0x1/HrelOT/mpmOLpP4aERl/Zc9LoqApXh7fzqfOjrnLn4Fg0gxX0NU+huUx8+gKJ
	3Tko6Ugf/yZ/BDcsdAagnAbiM5pIicXJ/w0YybT0x9E/mzTFx9fbn5d8vWWio8cPm13zaZUfcZL
	bsZk29VkBiFAmu45TVw2m6nB9T6XVk2UvDd4iy9yBjQpnnNHxDe4XbSl8g136EbCRq1zd3gG4Fb
	VB4s8Dsfz0kGpn3SHob+Y0z21PXpCvcym6L3qW0h/qElXiM+XVZFh40FmwxEqIjKZBc3WR69sXX
	w==
X-Received: by 2002:a05:6a20:d80c:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3cb83fa28a7mr1940926637.12.1785872462099;
        Tue, 04 Aug 2026 12:41:02 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7f4sm8156417eec.17.2026.08.04.12.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:41:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [oe][meta-oe][wrynose][PATCH 21/36] cjose: upgrade 0.6.2.4 -> 0.6.2.7
Date: Wed,  5 Aug 2026 07:39:48 +1200
Message-ID: <20260804194003.3158916-21-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
References: <20260804194003.3158916-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 19:41:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128768

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.5
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.6
https://github.com/OpenIDC/cjose/releases/tag/v0.6.2.7

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 568b12546c4f58826264bd0b27aede64dc2df055)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cjose/{cjose_0.6.2.4.bb => cjose_0.6.2.7.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/cjose/{cjose_0.6.2.4.bb => cjose_0.6.2.7.bb} (88%)

diff --git a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb b/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
similarity index 88%
rename from meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
rename to meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
index eb1db40705..b35cf349f1 100644
--- a/meta-oe/recipes-support/cjose/cjose_0.6.2.4.bb
+++ b/meta-oe/recipes-support/cjose/cjose_0.6.2.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7249e2f9437adfb8c88d870438042f0e"
 
 SRC_URI = "git://github.com/OpenIDC/cjose;protocol=https;branch=version-0.6.2.x;tag=v${PV}"
 
-SRCREV = "8d94c3ad3237ab6a83d2e92fa541542b1b92c023"
+SRCREV = "10af8915a666b50caa5500cdc3f2523b916be720"
 
 DEPENDS = "openssl libcheck jansson"
 

