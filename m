Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA2FC5DF8C
	for <webhook@archiver.kernel.org>; Sun, 23 Aug 2026 11:52:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12926.1787485967410420294
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Aug 2026 04:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=cR4czxGF;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2049723a91.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787485967; x=1788090767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TxhTVO5Trt+JY2oTYXVB3/DuyJy5bTqTTojlWBK4DX0=;
        b=cR4czxGFLrjJjN8ejfHiIaQy4ll5y9If4N5w2hhdNiZtG1zS211LpgkwoAe2y5hjiC
         tOUSbQ9bMfsvM6u1wX0G0Syc93RaojgsKq2sqtH/pciSuh9/0RwzBBXvxnCgK/KzhK1j
         s/PehN7ZlfMYQryG/2GHG3oSra9MMdCQ2fM8RuaZXMA9wlhmZKhZUckseBeT8XF8l9Kp
         V2tInrlPZLtId07BInZkXV6dHOQazh0gZe/e7euBwHpjiu/NE1U2DE9lwjIfE4ggdvV4
         WD3KG7FKovxT6JkEAFfH2fXA9R8Hdew7DivkIW9mDfjufuI/RHkDcc9CWiHNyGIDNGXP
         yfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485967; x=1788090767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TxhTVO5Trt+JY2oTYXVB3/DuyJy5bTqTTojlWBK4DX0=;
        b=chAG7KmNxZzmq5BsEOYLmX7zVXgHgDkrf0k2zUChde55DKfmhk0Am5RMfC3waZPFJU
         X4SaxLoaTV5qyPE7np1upfJGPbmX57f0vRGNTjXGUPG01c1iaa8csCMlUtEkUX74fbOQ
         nB8A74mUPWLFN3W8OF4c5tgaW7GRIXycN2nIkLf9ppg4ijycGVOErimAImkOzWZ4SZj0
         wjLvXWpAjQB4BjFJ9ZVAuixhFZlZ1tlttWsNKVw2ulgS4pwerYjojeNQ1wXEBgVsjS18
         ALHqPvz9JcuhBkWxCud9gpieh8hKRlo78EsIREL22kwdRwUmKHaSprFmKz5yT7aogC8n
         Z/4g==
X-Gm-Message-State: AFuF++l+zphsOpd4Z2cEPZeNsjmTCCsiZECzVMXVRvsKRZGqvp3+9zMq
	KAN5MIr11KGg9Yu7IbKJfNwUmcyhnRIk+XuS0ipOCdCc7zRj4h95IeemUM3siw==
X-Gm-Gg: AR+sD107+yHJuroKGEQ8yLuA5hMmre61fqwwgCt96k0q1iffYfl0ecOfrZnyCnojZRu
	bqXS3UMV8F5agNNXfeqAaGjC9eA/OIwCB6xmdxQpy+x8ZDPrmWUHhDimXkxqjwssDtFIPnOhzVT
	YrPblNbI+qwtxx/NgRy9q7CR9zsi1UjqPwxu//kyidMghP9Du2dHgHMVd5ApAeeiXY01GtfY3db
	1Y/+zj6jGhTSl/pF7y88fOWdcXggel9C5RCk9icQW2LfPu1I7GxFMSbf+Nc2612xJd7F/xXVXdG
	fHKJ/Cm27ZGpjK7fpgVjeSetI9ssC3DFsC7msNY96iRfPcE1yPqdnZ0wWzTYAtcoZjSUVPF4YWn
	5//hEWkhslahiM7py+vRkGtBo45q4EUhfU1EY9A5hfLFuOJg9e9+Ja5EFJzTvUp+ughxXIoE5Zv
	lzLqA5fBly4MZVRqPxSzMIyqx8aNkMPBeoN8jjcZsLkq0dysqrQa0zkhc6+Us3ZNNUrpwueXJx0
	Tubwg7nmMKf
X-Received: by 2002:a17:90a:c88b:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-395c2f4b17emr36857116a91.0.1787485966732;
        Sun, 23 Aug 2026 04:52:46 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e494fa7esm5793398a91.1.2026.08.23.04.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:52:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 15/20] python3-psycopg: upgrade 3.3.3 -> 3.3.4
Date: Sun, 23 Aug 2026 23:51:53 +1200
Message-ID: <20260823115158.1582363-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
References: <20260823115158.1582363-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Aug 2026 11:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129449

From: Khem Raj <khem.raj@oss.qualcomm.com>

Point release with bug fixes and minor improvements.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 207ed0a78946921a2f0e2e240efa3f2fe3177256)

Changelog:
https://www.psycopg.org/psycopg3/docs/news.html#psycopg-3-3-4

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{python3-psycopg_3.3.3.bb => python3-psycopg_3.3.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.3.3.bb => python3-psycopg_3.3.4.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
index d6df529686..0c8b104d02 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.3.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.3.4.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "5e9a47458b3c1583326513b2556a2a9473a1001a56c9efe9e587245b43148dd9"
+SRC_URI[sha256sum] = "e21207764952cff81b6b8bdacad9a3939f2793367fdac2987b3aac36a651b5bc"
 
 inherit pypi python_setuptools_build_meta
 

