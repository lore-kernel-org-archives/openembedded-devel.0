Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADFDC7EE2E
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 17:24:11 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.26077.1683134644930206481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 May 2023 10:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=jRKp4Elq;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f178da21afso37528545e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683134643; x=1685726643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFl0bMwfz9CPu2SQe6GBs9aCHS8ffwzBHlE+0QCUIT0=;
        b=jRKp4ElqcuJnNFLg0MbOeOZ2dYoH+/OPLwu7ZfsiHDYT7KsTKZvBQRAajVMAVxz1wb
         NtMwVSw5VEx9KoZT7NviMtIZ5St/OGw+QA59AwiBFGCIrHBL6y/oOxidoF4Lhb9qS5gA
         FRNXAkpeqReM3JJqPz4pDiG33/3LeV4jnu9u7TKM6PuX6N2N9x6eAXPPjsTB1ZPSNhhA
         uMyfIGaxwvhx6lguBVKTsO4QOWqPF06hofcO1TtGKrpB6JsBdmfttztj//V6hLHqOOHS
         0DHFpHwRSS/e8TlOSYgibuuZhTrBuznzqiEJJ1lZ5k8VVePSU6T6kVwo/5kON8IP9uc4
         n4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683134643; x=1685726643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFl0bMwfz9CPu2SQe6GBs9aCHS8ffwzBHlE+0QCUIT0=;
        b=Is2g8eWOjCT4ylBBNk9EjhK5wtV/sUZWOwECdfPX24Rla/hbIMxI1wAUOwvHCZc6Sz
         FPL6pCSJxQ0IcYlp9zbft33FLPL5TxyffzUwN3uyKlU0vSzzg/f+tAVnl6hDv+LoBo6W
         snTTI7HX9eUGLGQGbtrBahb3UMYDMnAcbOGJZBqmEqjxUPjaWe3v4vfXisChS0HQmwpW
         U3kOfSeOXDYb0f06zmpq7AhkSWxPtk9z2mQ9MwLvqOz7rZSVlo+gx8xvt78tkIoriWGJ
         aMFouSH9Byj1nL+catv3vcamib9nQolGDkOlTH5muxn8Vx/xQpMt82KHVIPwJOcgWTlD
         76wg==
X-Gm-Message-State: AC+VfDwzncjcQzYXj5+aXMfypAbiNHqkYdbtQkaBwlEgQnR3ImV/UL9t
	wSg7wPaFhi7V1m3NyPi5Q4Ej47jmEBw=
X-Google-Smtp-Source: ACHHUZ55H0FwY0LzT15omgD/cKlMixmo2USdaUPwadk1c5LCkeJRlYkq7UNYuSYdEHnJGi+6oOuFQg==
X-Received: by 2002:a1c:4c03:0:b0:3ef:acf6:f815 with SMTP id z3-20020a1c4c03000000b003efacf6f815mr15638051wmf.32.1683134643218;
        Wed, 03 May 2023 10:24:03 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id q7-20020a1cf307000000b003f18b52c73asm2438912wmq.24.2023.05.03.10.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 10:24:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/7] ostree: fix build without gobject-introspection-data
Date: Wed,  3 May 2023 19:23:52 +0200
Message-Id: <20230503172354.1439352-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
References: <20230503172354.1439352-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 May 2023 17:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102295

* add --disable-introspection to UNKNOWN_CONFIGURE_OPT_IGNORE to fix:
  http://errors.yoctoproject.org/Errors/Details/702779/
  ERROR: QA Issue: ostree: configure was passed unrecognised options: --disable-introspection [unknown-configure-option]

* add glib-2.0-native to DEPENDS to fix:
  http://errors.yoctoproject.org/Errors/Details/702787/
  glib-mkenums \
    --template ../libostree-2023.2/src/libostree/ostree-enumtypes.h.template \
    ../libostree-2023.2/src/libostree/ostree-fetcher.h > src/libostree/ostree-enumtypes.h.tmp && mv src/libostree/ostree-enumtypes.h.tmp src/libostree/ostree-enumtypes.h
  /bin/bash: line 2: glib-mkenums: command not found
  make: *** [Makefile:9990: src/libostree/ostree-enumtypes.h] Error 127

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2023.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.2.bb b/meta-oe/recipes-extended/ostree/ostree_2023.2.bb
index 2990122959..7eeb77474f 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.2.bb
@@ -9,6 +9,7 @@ LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
 
 DEPENDS = " \
+    glib-2.0-native \
     glib-2.0 \
     e2fsprogs \
     libcap \
@@ -28,6 +29,8 @@ S = "${WORKDIR}/libostree-${PV}"
 
 inherit autotools bash-completion gobject-introspection github-releases gtk-doc manpages pkgconfig ptest-gnome systemd
 
+UNKNOWN_CONFIGURE_OPT_IGNORE = "--disable-introspection --enable-introspection"
+
 # Workaround compile failure:
 # |../git/src/libotutil/zbase32.c:37:1: error: function returns an aggregate [-Werror=aggregate-return]
 # so remove -Og and use -O2 as workaround
-- 
2.40.1


