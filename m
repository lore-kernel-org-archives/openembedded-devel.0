Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC75D5CCBB
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 15:14:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.17322.1730301256762948091
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Oct 2024 08:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Bwb5nuC0;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso65494835e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 08:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730301255; x=1730906055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrJF6zKOdHXKScgDJl3inpFZarjjxmn3bJg7yEu5mzM=;
        b=Bwb5nuC0M8jgjioIX5Hr+Y9d2lr+ZZtd4VwNpiU+HgBQ/nDuNUzXIhZ0i2PV6bYDP6
         LA3oJfxNLnUpFvigCCP45L4AzvsAAAIFGt9WiRw28tlwKW8TatNgkp3tzDCSXqHnT7AB
         ZTp9yuUCxCPVzKE4aKXbWTJhDHktzrXIudQySxpUs1q9Q36oljKSh4uk0CuStHOH4ozw
         y0A9CfRSiFooCQTSbctK6EoNuN4vklIxhtE1obKmFoswOEO+eccdpcXbjAbvOywKYzzd
         U+n7mufBChp6RMM2KpSMTTxm2DwPbyD79IrZshuSmmjujhB5WUOsMT1WdiuQOJOWxOyp
         AeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730301255; x=1730906055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrJF6zKOdHXKScgDJl3inpFZarjjxmn3bJg7yEu5mzM=;
        b=KxMm4B6KxvBLZy1ae4LruL0LG4i5eJ+1K2NDPhs1+FQJNq7VAVB8C9iJWRSr60X42N
         qYRWHY5/sOGMetva8sfk96I8H9SJp2DGYC+20Tx+zMhV7DLSLNJVKYvt2BNvEvtR7zbL
         +3yPW6A2vGo3SPP2oM0rVjCULGbneF/vJWJ2UuCZpRbl2CEpaxiqxzR8rAK506RZ5jK7
         5SR11fL33ArtvibcITIUM3kHk5XXtvi17AL9PLlLwj0hZThz/+qJ6qoK8vsfNskD/xTc
         My0Hl7LnckmbEwsW0t9UhDWM3bDixK1cm8ha3XvFvp1aAHCeoX5vcibwJg12nqpkJ+Tf
         chGA==
X-Gm-Message-State: AOJu0YyO41+lhvmVyyOVzYyeQaxNdg3s4dD2QVif3NphmDVXm5+Aq/ws
	VRtH6DiX/eGgAt2q9Ka4UVA9l3uk43BXcQ1eFaXD0p+h91OiqTGNtRwZcA==
X-Google-Smtp-Source: AGHT+IFuFtWEq4jz/Qe2JJ/a72VbFq3SUvFa8FnZBROFX+nXXi/KsWv8KFT2nFWsF1nb6nC6NUOIgw==
X-Received: by 2002:a05:600c:4f0b:b0:431:4b88:d408 with SMTP id 5b1f17b1804b1-4319ac6e80dmr138998945e9.5.1730301254982;
        Wed, 30 Oct 2024 08:14:14 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917f0bsm23855225e9.17.2024.10.30.08.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 08:14:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] libgpiod: drop wrong S assignment
Date: Wed, 30 Oct 2024 16:14:09 +0100
Message-ID: <20241030151409.208066-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Oct 2024 15:14:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113344

* the default from bitbake.conf:
  S = /
  works better, because it points to correct directory even with e.g. when
  building lib32-libgpiod with multilib

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
index 3d9758e27a..00252dfe64 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.bb
@@ -17,8 +17,6 @@ SRC_URI += "file://gpio-manager.init"
 
 SRC_URI[sha256sum] = "ee29735890eb1cc0e4b494001da5163d1a9c4735343201d22485db313601ca07"
 
-S = "${UNPACKDIR}/${PN}-2.2"
-
 # Enable all project features for ptest
 PACKAGECONFIG[tests] = " \
     --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-glib --enable-gpioset-interactive --enable-dbus, \
-- 
2.47.0


