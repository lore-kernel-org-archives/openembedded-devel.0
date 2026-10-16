Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31EDCCA473
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 04:08:05 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14396.1792123679369449647
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 21:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=g5xY17Nn;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e5fb79ce82so34566345ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792123679; x=1792728479; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wzz0hcAvL+TyoSxim3TwHHje7sMt8f5EYUsJClBYJfg=;
        b=g5xY17Nn46ifpOrcxiBa4GrSYQbdp05VpxKLfp2b19fxdjo0IXDvU5SY9zIQDAPomn
         uGN94dk/s9HS19yEBgMrlqbjQvYilcTGaxw/Jh9sc/a3gvweW/HUhjoALYxcWknMqh05
         EMfN9OIS3BFk6WK+9ofF2wMHaLHyyKvNtxfoV4fjjBGS83MB5ti9LF21elzSXpjoc5y/
         jX97XyCPhSju0z9ehbJ5b/XBIwiUNNUEYh1KaDnZNsdMI/HrH4Pg485BPi6OCL58wkCV
         8ANkTIP127rRoIFGtVym6BeQUYXBmvsO6K78FicRqz9e+hz2h3NOIsrkybQRpCaOIQPq
         hSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792123679; x=1792728479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wzz0hcAvL+TyoSxim3TwHHje7sMt8f5EYUsJClBYJfg=;
        b=Is6vIKuHru2ln8Pl0s1CJnY9UHI2DiYQa6k/0iDiZofDHRx2sOTI/qoaS4orXlLon6
         1u0zOW0CaFyDEbtLBgX7l4dMVV23Obh/pukI9mGlIB2t04QVMnzRyuQsbAPdugdZ48SR
         wG5zksMLWIQO/Qe93RdjF6xs5DdDgPpsPQ25S/GRQ6uUhO0nLLQrpo8hzR70yemfpKS5
         a8ROJQGf4Mj+g6WoKcPdMRNVmQGeIPT9X/2yptu76FftiVT1ix2DOwZvKV+f02r3DpG9
         vlg4z10CD7aLNtiPd0fOypkE+iyEmGST4A25D1Wb4IYZfQ/t9XOncoUy6pKU1DYNkx0V
         H70Q==
X-Gm-Message-State: AFq9FYKytPF5NSecbFt4nm3DjkueyDQ/sEmpMxBcqMQlqMJzQG5boZ6m
	t/r4MYAIwm9jbX6fjcoEJEnAnBBXR0Q61l+aFBxs/ZB016uwLRVgL0QIh3/jZQ==
X-Gm-Gg: AYBFou0R1tag3Q9/PZnrqdu7CCfiCUZrbux8kIDrT2r/vr4MSZGZxD29JPzkhDLUM1E
	4VrPhFG9eiBlMt7h7fGJd1X9WZ+YkmU51wv6viJHeKpvm6kbIjVo4nUAKndBUtWr+ZtfgXLrOEj
	J5IGEIDlZTwQcmk4XomcNp7T2SnRaXbnRicaJV8JQrSTsNg9w82Xi4YSf6722LLNOIOybGt0JUQ
	9nFQ33ubuHf/KMacUe4clK54vS0yo+LaBs1t8W/WNChNI0OCEj+Co1VbupTsDIuyov7UgtgJp05
	WBDpemtk/Zvumfk9gXnT6IsFrplgK7Mw/NjI3kmthFEWgsJTgJBVCZq68kE67u0oou0nrMrvBjR
	0WcZ+oSRWetej++scfTK2tX8/aKVdW0Tm1bo8Fq+YIvzNYyBcJ6hZCXMRMW7FNBNYw5M3nCjM9p
	5ZiBh65OxE/bSyyfo8w8z6i1JKp36E2b6JB+yY4RZb+KhNXaKZs5tUWpfv+x8LZoDd6GV77j/3H
	jk9EOrbwJ/cSK55cu8z/rJ8laTwPOIOpJlMOq3zItvKCi1EPA==
X-Received: by 2002:a17:903:38cd:b0:2e9:660a:793a with SMTP id d9443c01a7336-2e9660a7b0bmr37674115ad.36.1792123678556;
        Thu, 15 Oct 2026 21:07:58 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e83498csm3796335ad.35.2026.10.15.21.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 21:07:58 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-python][PATCH 8/10] python3-pyjwt: upgrade 2.13.0 -> 2.14.0
Date: Fri, 16 Oct 2026 17:07:32 +1300
Message-ID: <20261016040734.1499287-8-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
References: <20261016040734.1499287-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 04:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131044

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/jpadilla/pyjwt/blob/2.14.0/CHANGELOG.rst

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyjwt_2.13.0.bb => python3-pyjwt_2.14.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb b/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
index 1b018f605b..a2cb84587b 100644
--- a/meta-python/recipes-devtools/python/python3-pyjwt_2.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyjwt_2.14.0.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/jpadilla/pyjwt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e4b56d2c9973d8cf54655555be06e551"
 
-SRC_URI[sha256sum] = "41571c89ca91598c79e8ef18a2d07367d4810fbbd6f637794879baf1b7703423"
+SRC_URI[sha256sum] = "77283c83fb56ecf566a886c757a714bc83668e38156de2cce8263302f42e0b86"
 
 CVE_PRODUCT = "pyjwt"
 

