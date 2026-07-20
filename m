Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73402C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:31 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11387.1784590706808252118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qS4KNtCf;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc73e322dbso125215455ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590706; x=1785195506; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOSX9Xy2sck0djCC/9VDb2HCflUpCKUXrTwL2S9gE0g=;
        b=qS4KNtCfs9KvTPJIN469LeMeJ12jhZ/EJgAgTSxD8hl1q+z2A9+gz4LwiYf2KKwnvK
         BBoFDSB27UmazRPmGA0RcUCI8wjjrqD55FDngmDLD8ufFMDG6LzFmgrh8YUZQqsPhZGV
         KwwPW2JPU0iiM9CJmvINtFNUUHNbcKfSMja6QsFeK+cjyeGfjAR47TjeiPJjKKaLh4zP
         TSmZVqSscSh+nCGGFxem0njc1O8AaQU5QfttDHVNAJb7tb9q8ZCvDICl9xyFUaX/UgQq
         Sb57KECe6/q4PDeIE8qHC9yD4HC2yjrPyqD2Qho/95L8FgFTM8WNxmE2xm99QR/hzYYR
         Sc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590706; x=1785195506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOSX9Xy2sck0djCC/9VDb2HCflUpCKUXrTwL2S9gE0g=;
        b=Emkx/4X+2+vwjO2qluaorRGe2XCXrSj8UhJn6eD9forO0cjZ3foa6nVSICYaCjsxxI
         Zb8nqaviTsw3W22sPe8D8UslCEWQP7aDceAbaMpz5jJr3rWkO6e+GjAF1np9niEyVNCo
         04vQHhHqWQWAOrNKXcoEnS89tKzrFkRpbMs7/ZtPhSbTeQax4zHQz4P8LD0Vl2dX4JPp
         KD9gfr/fszrmKGGuYFQCKAVYfrXPM2jZKm8QlvjnIJuGtOylhDiXEML4XE6zPXMDg5GA
         U9fzvYg3SpEieh8ushFc7GTxqgzPwuWJCXzreh/pVpJf9Ae9ECc50oBwk+/baZ5rWBzW
         n46A==
X-Gm-Message-State: AOJu0YxKhtEakf9zg2FXRCqVfoFaLMn6VYrPNA6NBEHpAHS3DIGOuxOE
	av611xhsxCN3o+DHdqV0ewE296QACEa+gcsu7S79H2PWE6rq+xThWDM8IvW0NQ==
X-Gm-Gg: AR+sD12l6nRXN0orWfmwhFkXki9xECJIw44X+dvGO2D8keaEPp1+wJPBMUzhP546IpT
	tYRi0sVw/n422AiVwuffDhStv//PnSMTxCP8JGtcThJT9AIELREZFxIEvGrNGohHu1t+JPnUz02
	L3fiepS2ANktCUVP5yNNredO+9YxH36GqPnD0fFc519509+BGR2wm925Si3O2WnfkBf2gKDo1Y1
	kSPkgXoGP+U+NoF7gE4zP0eo1BCwsL4nwmbLvPjgFUpx53pMU+jUdoV4VujuyNF1x0MzNnX2TBB
	iexIFT1CcCa8o/Jj4xjq/ZXKbT+9SNkZArtVujQkFG61u2irnCrrhaAZyVfqX3TynC9QeGDDw5t
	W+3aLgBiPrdNxLXUFUbP7xZm5NoI5EJJ2BGrqWtIiu8cuMoh5SSPIDw59VW93fCgheRANoZjSTV
	wD4byiwDVD9kkR21Y=
X-Received: by 2002:a17:903:1c7:b0:2c8:1f56:9fc5 with SMTP id d9443c01a7336-2cf349fb45amr171478665ad.35.1784590706213;
        Mon, 20 Jul 2026 16:38:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:25 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/30] imagemagick: upgrade 7.1.2-25 -> 7.1.2-26
Date: Tue, 21 Jul 2026 11:37:43 +1200
Message-ID: <20260720233811.2324493-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128303

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 1078fc88a3a06902b8c1207821fe51e26651aa93)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{imagemagick_7.1.2-25.bb => imagemagick_7.1.2-26.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-25.bb => imagemagick_7.1.2-26.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
index 4a0cc0e1ff..fa4a6dfef8 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-25.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-26.bb
@@ -17,7 +17,7 @@ SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=htt
            file://imagemagick-ptest.sh \
 "
 
-SRCREV = "04a04eaaa22f721f204c4bf4c6b24b08b1afe5c5"
+SRCREV = "38ba210c5e5a660013d632a3d33c431e658befcc"
 
 inherit autotools pkgconfig update-alternatives ptest
 export ac_cv_sys_file_offset_bits = "64"

