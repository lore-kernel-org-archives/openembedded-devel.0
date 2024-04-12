Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98362C4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 17:27:05 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web11.52578.1712942821182554907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Apr 2024 10:27:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fglt5Yi+;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ee13f19e7eso958877b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 10:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712942820; x=1713547620; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggcL+dR+0dl5rr9Zj0tksg8RShr+gvfSpV3eC13NJSM=;
        b=fglt5Yi+HyM0DnZhjJbHKf1ADGLveb/1A/kYuLfaGWCajj0+6R2E/iitHmsaGh6U/q
         ds9Ta2c30XWdeG0+IoNRk6Cm51xwGTLHafgqHwzNqPsC1sKgE3tqrQHYHK/FvFVomA0Q
         2NPMBv0FKrcxJ+CLGRlgdXP731dDV7La79ygaHpUo1xC9lpOPmAWnKzQb7zCwb3Nhjyu
         7ijJJ3WiW7/vJ7uGN4N9503NTSFibffdFeG4QqN26AVkuRaJ8CoFvtfTll8pRupZfThR
         IFCEqBPN68Uja4hZeznqW1hzpR6IweTna4EJjLtu0Zf2/oVauufcki+YSSCFtVgD5loF
         bCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712942820; x=1713547620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggcL+dR+0dl5rr9Zj0tksg8RShr+gvfSpV3eC13NJSM=;
        b=HIXf0ARo2XjMj0LyLisXJ0s5BAPB1GgtzCteW3WopsG0lKHQyTC6zdQCfIw1XcwU9E
         UKGndXhw/bH1lEXiw2qdWAtJhuUBu7vzVBuEPbt+V/5iNKU0nub3HbNeYj1xNffbrRyQ
         1miqDqu9cILfX4p6bfl5drpyt8eWesY9AO59OgYoEI3siLZ3SqoT8QlBcW/OwHrtUjAD
         J2/veWqAXzofPPr257eyoFvwIZ+D4iYAZCrggnbIPNpBw0H5ek5ylDVdaxStyqjYZgRo
         +wKB2FJ0U0L4aofti2DgqSMc3VzVHEJF8yfxgKfgDF3HEweZfWP5i/Ak/CYPDckVRDHe
         pAiQ==
X-Gm-Message-State: AOJu0YwJsoZiTJHsRxw+6fEfX+h6Ckuo5y86dlMXE4QKx5VTBk5R8gwx
	gnH/0ypXslI9OhRDEhIg+reKRyX+bv8NnzcCNzwdUbUqLu5Gq33N9xog7HLM
X-Google-Smtp-Source: AGHT+IHmWSPaFBEOOwnZqGK86hHN/L0de774bQJL06V+x4UG7/o5SKx+VeWZgGP9PPMKDTGfMz8c0w==
X-Received: by 2002:a05:6a21:498a:b0:1a7:56d2:66c1 with SMTP id ax10-20020a056a21498a00b001a756d266c1mr3817606pzc.29.1712942820248;
        Fri, 12 Apr 2024 10:27:00 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id f9-20020a056a001ac900b006ece7286c68sm3108258pfv.41.2024.04.12.10.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 10:26:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Jose Quaresma <quaresma.jose@gmail.com>
Subject: [meta-oe][PATCH] ostree: Add missing dependencies for ptests
Date: Fri, 12 Apr 2024 10:26:57 -0700
Message-ID: <20240412172657.638653-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 17:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109944

When running ptests using meta-oe-image-ptest-ostree image
these packageconfig/soup3 and utf8 locale is needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Jose Quaresma <quaresma.jose@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2024.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.5.bb b/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
index 0e098109c8..2ea92f190c 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
@@ -45,6 +45,7 @@ BUILD_OPTIMIZATION:append = " -O2"
 PACKAGECONFIG ??= " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'selinux smack', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd libmount', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'soup3', '', d)} \
     glib \
     gpgme \
     curl \
@@ -192,6 +193,7 @@ RDEPENDS:${PN}-ptest += " \
     diffutils \
     findutils \
     grep \
+    locale-base-en-us \
     python3-core \
     python3-multiprocessing \
     strace \
-- 
2.44.0


