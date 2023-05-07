Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E27AC7EE2C
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 22:44:15 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.94679.1683499452181492960
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 07 May 2023 15:44:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ykygcah+;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-50bc22805d3so5957312a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 15:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683499450; x=1686091450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFl0bMwfz9CPu2SQe6GBs9aCHS8ffwzBHlE+0QCUIT0=;
        b=Ykygcah+ICyWXi1a0y+oVwhj1sG1LcrdrAKzbxLqddTwASYBOW6MWai3ylCcIaqIW8
         KAAjd5M+HE+OetfVKYlEtmqE8xL+Y8Ha0lP5sCH34raHX07IkSW5bACeLefflHwMal3T
         WXF6iw9b6RK98aK01QaeA+IhS0mqSWSjN6Fd45uN+enNdNaEd0GZad6vzi78ss1aVHIV
         HYZLrp02eBkqGemCqFaLRQ6hNhuRd19znm3iFobbKWe+wKxLQIShUT5kM0qcz+AVI9sv
         DgQ5D7MDPy1DhPl7JW1cL6NbDfGB+PL8y+esrZdMjFMOOP3w+62HhsB3Kw3EN9AEA0Tj
         O2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683499450; x=1686091450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFl0bMwfz9CPu2SQe6GBs9aCHS8ffwzBHlE+0QCUIT0=;
        b=hkCUnfW7gliFtTcs2Lx5BHE/uOLc9PGiqW3qhPqAnHUO+gLN5gfqkPcbtH4LBaeU6h
         eT6UHJyFe6K+Ry5zwoc/cg98HfrTs8lob8FsMvR+DXnqusH1ujlTKbLXLT7t0iHVefAU
         8wozXZMEb5cRSStaHE4zV6mmugplC8io/sGxBmNGv+7nKSlHYNmhfeNKpYkIp22p/Sqa
         L6rONm2ohsHj8B5v/jhC/TNcHkYZySrsVuaEPJ3X0UxEcJj0R/11q31aJ4OM/uLQNDYF
         7m6j6B/0grP9Rb+DYrLxPvKpULEMiLc/3C+fyajkIBZhCEatFubTIAM0mgG5RJlniPU2
         Sm0Q==
X-Gm-Message-State: AC+VfDzrey8VU175GsHpp2wwiLLmN1NGPkUUzHErjnVJieuEGnMRUoih
	6EecjOT2UAhdXQqn8ZvfrMc0lI1GEoI=
X-Google-Smtp-Source: ACHHUZ4mRPwsfF0O6fRx9qSjftAsZ/kDvhg3SbLrqeeUCl1VfCSk1CQss9DAxXYsk4ipOMTTny8bPg==
X-Received: by 2002:a17:907:961c:b0:94e:98da:ef97 with SMTP id gb28-20020a170907961c00b0094e98daef97mr8626936ejc.27.1683499450676;
        Sun, 07 May 2023 15:44:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id w19-20020a17090652d300b0094f5179540fsm4098474ejn.83.2023.05.07.15.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 15:44:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 07/16] ostree: fix build without gobject-introspection-data
Date: Mon,  8 May 2023 00:43:45 +0200
Message-Id: <20230507224354.1149327-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
References: <20230507224354.1149327-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 07 May 2023 22:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102370

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


