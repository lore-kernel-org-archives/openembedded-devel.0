Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF59C5DF77
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:18 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24490.1786747567758899309
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=d4eYhRE4;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1153369a12.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747567; x=1787352367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwF4I/mFVVMYAgKGA3S2lD3AIGLCGnkqaH4c5CF0HDU=;
        b=d4eYhRE4a1GUyo29zQ8jx8gt7r31nX4xAGbDR08ZaT5/pToBydLh/1oFHZ+rbyoFNR
         rUwiiC7u1gdvcmvmswWT36CixMiAQ+dPCy8m5cNADpK2t3QyDSvDjRc/dOnvOpAUZ64e
         sfgTv81irPXe73LdS4RCu4KaSvilsF3GYngshVk0d9qONZb7otQz9f5+pAJ5YN5y1FHq
         yAar3s1pOM/udt9pdTwJAuswIv9h5vRih4VrQ0g3SCokFhL5ZhBX8FOLd3jodeiPLRdB
         vXRcdZX8rGEMasB31BVTTO6oHvDlPmctW+8qJLdlH4CUECWvxRfNnUyAkn39acSrJ/YJ
         WEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747567; x=1787352367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwF4I/mFVVMYAgKGA3S2lD3AIGLCGnkqaH4c5CF0HDU=;
        b=YA2gC98GcBPe/yy3v0eqxUc4kuNSSFGHxzNkJ53SZIPjNq811TiyjeexJgXX10wyeK
         83OoBW42PDHFbkG7RBmM854SajmCOGHrye9qCV29ljNku0o43aFw54YNe1xsLUSXrn9X
         xsJtDubAoYgGiLvMj3LFrInDYGhfFU23gCKDeZP7cKTF6h8DqmEXU05pewEnaSD7zUFv
         BLpOGOCDNF8zK6NK5GNVDu3pLw7A+QNfbz62ossb4OqKoAcNAIvTaEnfYtcLTCs/7Dl0
         DjjDtkbGXsGNFzMHnI/669DpoE8iTFjU5jFxWdWZ/wWQyQY4jJwn0DEmNCGG5dyZiADS
         BZJw==
X-Gm-Message-State: AOJu0YygpVO2hPdZB2rXqI5UWi7voy/o6OHbXDRBjKgO/CkOKFx9Ihe4
	WIYcWfn9PSSdC4dK0oaOnLT7Ce1jMi0wbqyn57AKIVp5n6do8PE1PhohJ9M0vujg
X-Gm-Gg: AR+sD12D9+WyKZxD1/gG7Aey+OJuay81McAIiJL4N9iVgF9o0nXdVwjU1034lv24LCl
	US8bseo9QT81DBbXGnDWxF4zX4rMLRdamNqaUpX5scccvRie9fy831dAsk+QvyFuD4O2Uq48dXN
	sCWMWwzUf7DXTgz8EiWE92T+RIgLoKFPQM4+dRT+NoPn2Lqe8IDy9ImpZ+14dPSnZLdFsQMi8Yv
	TMkTbMpTLkg6j66nYa1PrwimqlSrDcSveMCO7nlj0B4f+VasKY+p3/b53IrOkPHDln0DXy9Hw1t
	STi536X3x8OHAylruuqG6ORQq8rVfIQuPkCsjcYMlqwkOsvydEG16s5KSW79UhjQRocX2br/hy7
	kZwFQR1BvfC/hDHtmQ6LvBC+GU5ud5gzogRL18A24xiqAoGrziEfWouNiXzktimHhko8kRYZJtt
	+vEbXpc/oLcp8e6spyyDeIpVVvU40YspD+0olM7n0Cupfj1bcur3wvX/4BSLDcb1Tm+xRSrWuSQ
	bSnNip3uViv+tekWUpNIkUZwZ4Z1g4oJPLogZ57avbK038/U/CPUrErNIzsrYOinNlZ7Qvd9exw
	EQc6am1O9D9xmEpbdZ+qBUzWVMtTI1u5ZtYACxQwFz9LboiCD6rX11FMfX6DRdAzbyTu7qbjg6p
	xE+QIkpT28zukvr5ZmCuSGQuBOorFyRG8rSZ+D2+AgI8FGw==
X-Received: by 2002:a05:6a21:178a:b0:3bf:e761:6285 with SMTP id adf61e73a8af0-3cc71de3fa5mr11819146637.29.1786747567068;
        Fri, 14 Aug 2026 15:46:07 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:46:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 022/109] cfengine: upgrade 3.27.1 -> 3.28.0
Date: Fri, 14 Aug 2026 15:44:08 -0700
Message-ID: <20260814224539.1523174-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129086

Minor release; see upstream release notes for details.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../cfengine/{cfengine_3.27.1.bb => cfengine_3.28.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/cfengine/{cfengine_3.27.1.bb => cfengine_3.28.0.bb} (97%)

diff --git a/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb b/meta-oe/recipes-extended/cfengine/cfengine_3.28.0.bb
similarity index 97%
rename from meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
rename to meta-oe/recipes-extended/cfengine/cfengine_3.28.0.bb
index 53d1e55f5b..77a2e9fbef 100644
--- a/meta-oe/recipes-extended/cfengine/cfengine_3.27.1.bb
+++ b/meta-oe/recipes-extended/cfengine/cfengine_3.28.0.bb
@@ -18,7 +18,7 @@ DEPENDS += "attr tokyocabinet bison-native openssl libpcre2 librsync"
 SRC_URI = "https://cfengine-package-repos.s3.amazonaws.com/tarballs/${BPN}-community-${PV}.tar.gz \
            file://set-path-of-default-config-file.patch \
            "
-SRC_URI[sha256sum] = "878e52c4a6cc3bd28048b527a920fba86ce4cd99c5760adc42417a811efa6e6b"
+SRC_URI[sha256sum] = "03722ab589c00b4e823ee22eb0afef5611b82e4f764fccc37ad3b18a3732c49e"
 
 # The S3 tarball bucket denies listing, so track the release tags of the
 # upstream git repository instead. Tarballs are published as

