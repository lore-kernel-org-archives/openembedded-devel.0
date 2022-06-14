Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F37F4C43334
	for <webhook@archiver.kernel.org>; Tue, 14 Jun 2022 08:39:33 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web08.3855.1655195971537825994
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d6hdbKmM;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id b8so10530137edj.11
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jun 2022 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q1mYLDwdo2d2213Z9hvxuIo9JUaqu2BAXkFpHrnLq1c=;
        b=d6hdbKmMQLLe903wShU6+qKJ392QKEG5faKYnZS6HlEzx08JAdNBxKEU1QoH5TZ5hN
         +sPjGbI8GeD4PWe03eDOWV4FQi86KlqFPr9f6Ij5STf/l5sZpdn4oCVadrsQeIAuxYtA
         D1mefdOR3gV2S9SGPd9HtIW8+PdT4RGdvkSwaG81DtQ+SV87ODCh+GnDDlafkiIe4X1j
         8wtQEQcqNJ0aG99GjM+oFgSyNeVh8bFop1QEjKYCLqERWZf2hKCYEgMPAoUp7qHA5/LN
         k2TAcX8DdDs9L0FLkJAnm+HUrlYNoBO7AEpKuBPlQM/8tiepSi7OZVECdmdHBZ4lkXoK
         RFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q1mYLDwdo2d2213Z9hvxuIo9JUaqu2BAXkFpHrnLq1c=;
        b=jZT+NJ5wof3g+QuNGUeLYMhDLFx+tc17y/NwKhHLt7nx/NRsJ4w9dImWdcN54aaSTS
         x+TSMw0mF57pzRyWmcqTSwwQmeJEatDXlfGvJ5IouOkMENhhkCedHp3YjOzJ+6dk8nw6
         Bkj+xmphJNQGp7HYeBEuE+x53jtKkj5lEPgh/MnKAWrf/s2oC6ISa2OfqfOTox17jUid
         2fvPzK9j+QNKDNtEwMUH9fQgc3tFAfAVeC9nh6X46bX38poC0jrUbdu5/mSSWaBAHVQ/
         aL1nfzpm44Hab8BxCXXQ7oNnNxcp8BbJLu3a6fMdxI6u8ujgPoPWDxw9Z0d3iqbTqzRw
         rEoQ==
X-Gm-Message-State: AOAM530kLrpdh+ahgOjx3Fnmo/O6/uXX95+ZAr3bt1O70BFXRfQ8DiCG
	UcVZ2OK39z6ghUoYBmz4PFUtCP8JgTY=
X-Google-Smtp-Source: 
 ABdhPJyzoI+YGHWWoZTuYRfj5L2CE8aOkA9KNozewJhAFWaA+mFRLIPRQ5qg0z72LdwfE7oHkFsBsQ==
X-Received: by 2002:a05:6402:27cf:b0:431:54d9:28ed with SMTP id
 c15-20020a05640227cf00b0043154d928edmr4466714ede.81.1655195969897;
        Tue, 14 Jun 2022 01:39:29 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 vp5-20020a17090712c500b006f3ef214ddesm4772249ejb.68.2022.06.14.01.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 01:39:29 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mingli Yu <mingli.yu@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] bridge-utils: Switch to use the main branch
Date: Tue, 14 Jun 2022 10:39:23 +0200
Message-Id: <20220614083923.2515634-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jun 2022 08:39:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97509

From: Mingli Yu <mingli.yu@windriver.com>

Fix the below do_fetch warning:
WARNING: bridge-utils-1.7-r0 do_fetch: Failed to fetch URL git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git, attempting MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/bridge-utils/bridge-utils_1.6.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
index d693ae9a93..4b195ededa 100644
--- a/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
+++ b/meta-networking/recipes-support/bridge-utils/bridge-utils_1.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
 SRCREV = "42c1aefc303fdf891fbb099ea51f00dca83ab606"
 
 SRC_URI = "\
-    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git;branch=master \
+    git://git.kernel.org/pub/scm/linux/kernel/git/shemminger/bridge-utils.git;branch=main \
     file://kernel-headers.patch \
     file://0005-build-don-t-ignore-CFLAGS-from-environment.patch \
     file://0006-libbridge-Modifying-the-AR-to-cross-toolchain.patch \
-- 
2.35.1


