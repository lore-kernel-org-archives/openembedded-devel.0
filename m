Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCF7ECAAD4
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 21:37:17 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web12.17951.1661895432877077374
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NdiN55C+;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id q63so11797576pga.9
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 14:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LvkCjMu49rjU0jYbwlP3F8luFYjQfe/Q576UshkcsDE=;
        b=NdiN55C+najqQ1vowUl7gt5utY/rQfIPuJaMAHLUxbmCkDDZgYbXp/SX5BaN31SLzs
         7scKljieX/w1+oxwCvjlcgl3wZrchQp9Y7HkJZgOwNxTYFHi6JkUQ9sSHP8ZFHyNhL8N
         aylNvss/yd8LmLumohfkkVopivqvVyi1pDumIvOLHdrMphrnqGPS8I/UvesTHnRIFXq9
         D5sNMex/sH8hzlkIrxXjnOZcdZ4AGkfKLzqTi8isKiVueSUjp6/p1pv+TJSZnb2u/8Gg
         sUvdwl39DX57fc+P0ntZl9UXNQye281nksXa5Y21bWepaNunRsJwK9tGR15TWTWyHyOU
         e/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LvkCjMu49rjU0jYbwlP3F8luFYjQfe/Q576UshkcsDE=;
        b=mE5w6UsjcV75K7+g3k7W9reWkLOqYA1opR+1jRKGiMS8mgN3axcO6ZbdvXDm41ddWj
         7TKb9xfOm8hArAaGQlmtoeEId0owKuOfOgm78uK92Xhu+Xlp5lhmZqHNEu1olKJ4/3wl
         rzwEPQ+5eErDeyN2ELHPzIyEoBD6EjmVBtFKuxhux5c2yNklA3dRhUbq9i17dM+fC9xR
         4P8AoxxmwVdPqLjZMGbAShb50dy1Vrd18JbzM4pJ4d+Avkn7RCN5VfBjLx93FUubmS4n
         Ng7A/YwI/7CPTOLY5rQljLUwBn+udM7oWWH6dMa6vGxR++92TgtvJOu7jYhVZ0rEcOgO
         j6xQ==
X-Gm-Message-State: ACgBeo1/Yl2WrKG26eA9uvebXbSbGAB2PAgbTs8O0HNqHAv8vtSoJxgY
	OmfSQjbMK9Qeds8xuyyrorDsRn4yjacoOg==
X-Google-Smtp-Source: 
 AA6agR5vO8tRv0zNoQpo34GezjB4dxy4kNB72bXCgVEValfqsYUb3QsZ/ucuwOndHR0/jkGs4stsng==
X-Received: by 2002:a63:109:0:b0:42f:f103:31e2 with SMTP id
 9-20020a630109000000b0042ff10331e2mr2741798pgb.12.1661895432034;
        Tue, 30 Aug 2022 14:37:12 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a622706000000b005385109fe5fsm4155250pfn.81.2022.08.30.14.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 14:37:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 3/4] folks: Disable LTO and
 implicit-function-declaration as error
Date: Tue, 30 Aug 2022 14:37:06 -0700
Message-Id: <20220830213707.1413842-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830213707.1413842-1-raj.khem@gmail.com>
References: <20220830213707.1413842-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 21:37:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98566

This helps in compiling with clang15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb b/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
index 51620bba8e..ad61ee610c 100644
--- a/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
+++ b/meta-gnome/recipes-connectivity/folks/folks_0.15.5.bb
@@ -8,8 +8,9 @@ DEPENDS = " \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
-EXTRA_OEMESON += "-Dtests=false"
+EXTRA_OEMESON += "-Dtests=false -Db_lto=false "
 
+CFLAGS:append:toolchain-clang = " -Wno-error=implicit-function-declaration"
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 GIR_MESON_OPTION = ""
-- 
2.37.2


