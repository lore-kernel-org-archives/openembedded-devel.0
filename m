Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB99DE77199
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 14:00:48 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.20734.1736258447701289111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 06:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=khbiz9KC;
 spf=pass (domain: konsulko.com, ip: 209.85.218.42, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aaf60d85238so1040447066b.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 06:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1736258446; x=1736863246; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YsfJ9Mswrw3nMrb3qLYwXNAFg09h+ZUZFHrpoLtFiAM=;
        b=khbiz9KC+EiF2u5nVCp+QTefg1IONN5ZVbA0ebcse2X6wq4Axm5WarcrdWwEIGzMZO
         XtKoWU1yepnFKKJ0ZqsendDPuRcrCRRqLQLDBFk7Rebdjp8iY8kuqdNkSNxjJNC3Pe08
         2YMzJiAzZYQiXgHPe63Oxux3/ZnN1Ak/Jxsqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736258446; x=1736863246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YsfJ9Mswrw3nMrb3qLYwXNAFg09h+ZUZFHrpoLtFiAM=;
        b=L1I5oxZcPUUmuZx/6FEpGexQ5qp04t+0SGUFHiqx3pCg5KTx6OOYnic5w7JqHjzOXV
         SMUq3RvSduwZBsaXcNyPEph8FuDLYSBA5Fzzac+Jv3u74zoFg2Yqva4dign3aV6gyDw2
         tTqIWkxr3aihOHLkjuwh7FmtbIKbJ5BA5RQl2dzK69m/Xc2fVATan7LYG68mSeo9u+tw
         m/LviE3D1JWKl8eDBC/ANbTck05x3tX7/ORt9HsxajxD1UvodB3Jzsdc9Uox6OefJnr5
         H/vVkLOoKQQST9RdjOUt2N9a7EQKumnas4xk+wLmUsPnTLuv0W0lIm+fonXP4dmv62e4
         QtvQ==
X-Gm-Message-State: AOJu0YyalwlbpCHNAKK937lW6CiZXutEBsG5fdn7jGUwHGkg5HeizkoT
	8XmYgzy0kggkD4lJ9XdXtk1sr2AtoL+ewmCCDhLZcbpuvjqvpQYj7xQaMdXvBg6bmFIzHOKaLd6
	a
X-Gm-Gg: ASbGncst/PaTR75w20GvUARiJsxKO+iBpb0FoK//EvLWF/DsZf6ptxNU4/hJdXsCDh4
	00qqMPPALbtfVT+x6BiovI86utiJhYolNnITDabVd6eO2Oo7jHnuGUTNXH/kPhPkWv3DNfvFJUT
	LaL2LNkJAbeMBO9pAqXrmhhASpUrZ+9hh/RykrlUZoVJzwVeIgf0TRYay2tdBB/zwtZTIfr1Ta1
	PpLt24bJU7EnPwmLszdx176ySvBIF+F7+uo1hBRKa/IZ4ezA0de9JKy8x3sQGI+A2PlYv4=
X-Google-Smtp-Source: AGHT+IFx8fKnufUFo82TvJ2bWwrcdV2IhXVpY4GB/kRee3Ae8FnbTx6FtLTEA9GxpK5q3OSIiDMyow==
X-Received: by 2002:a17:907:96a7:b0:aa6:3223:19e6 with SMTP id a640c23a62f3a-aac345fabc9mr5032198166b.60.1736258445652;
        Tue, 07 Jan 2025 06:00:45 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe4b6bsm2403422166b.93.2025.01.07.06.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 06:00:45 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/5] python3-git-pw: Upgrade 2.6.0 -> 2.7.0
Date: Tue,  7 Jan 2025 16:00:39 +0200
Message-Id: <20250107140040.3330151-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250107140040.3330151-1-leon.anavi@konsulko.com>
References: <20250107140040.3330151-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 14:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114702

Upgrade to release 2.7.0:

- Add support for Python 3.13, drop Python 3.8
- setup: Use summary for package summary
- tox: Use pre-commit for 'pep8' target

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-git-pw_2.6.0.bb => python3-git-pw_2.7.0.bb}       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-git-pw_2.6.0.bb => python3-git-pw_2.7.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-git-pw_2.6.0.bb b/meta-python/recipes-devtools/python/python3-git-pw_2.7.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-git-pw_2.6.0.bb
rename to meta-python/recipes-devtools/python/python3-git-pw_2.7.0.bb
index c0b6a60814..07fd98ddd8 100644
--- a/meta-python/recipes-devtools/python/python3-git-pw_2.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-git-pw_2.7.0.bb
@@ -3,7 +3,8 @@ HOMEPAGE = "https://github.com/getpatchwork/git-pw"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=26e1a171d943c64f00c51f90c256b9d4"
 
-SRC_URI[sha256sum] = "e118e31bbe259ed9ae540d627cc563a6ece553d02aed11b1a92bbac408a0da0e"
+SRC_URI[sha256sum] = "99cb0b4a603386127c8205358d9780428a0468f8b1cb73ace804a5a466a28ef4"
+PYPI_PACKAGE = "git_pw"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.39.5


