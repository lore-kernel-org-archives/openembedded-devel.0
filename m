Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3DE9C7EE2F
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:10 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.25850.1683616025634687242
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=qW7aUUZb;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-306dbad5182so3409080f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616024; x=1686208024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EFl0bMwfz9CPu2SQe6GBs9aCHS8ffwzBHlE+0QCUIT0=;
        b=qW7aUUZbqStyFGwyy2YDMwYe5LALZEPpbzvneVoxac8Y4ebOVYedXQXmCI1OdnRoYC
         qVSzlzyOR9UfsiUH8qsrN4viceUYBFmahOATUgzbUe/Lm8HW/TCRlovdkBHBibqsrVEZ
         Liwem0qKDS0zyPUUBtstyKSBxI9C/v187Lbw0uNsdsTNnejNDRiWbREsSORHkwSx91tf
         MNIWpYaNdAK2GpfbqQRI5WyWmGLz5Al2s5r90/zoOOy3NQ+gmrPbsXVnTk46boD/rE11
         8hyO69ckJX2qGQFzrwywFuEHAKhxW298yPBE0hFfL/gcxb5WLf03kdBFuaTPenqrEgxY
         mALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616024; x=1686208024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EFl0bMwfz9CPu2SQe6GBs9aCHS8ffwzBHlE+0QCUIT0=;
        b=UQKHEVD46Bof5lRZ++8zs6FGN2TN+I0l74XVvtgTPWXVs6SAbIvnJ4djx5dUgfQSXf
         acdETpMz2gjvMw/Wn4zynvdYxAj3b73uOiMRxtXZ1GFoiUpbwt7jvsMh7WX0T9tpvcy5
         ZqvGFtcBOUrtdHHZGDQC2H3wiPjricHK9YZ0ogTiAhfd7r/+6qRYzfItkVFi/DofFLup
         f6VezTrmPN0+CDz/Y24NucFK2hKByjFShDMyjjteqZi6CU2DqGWA80pM69eN0WgewqZQ
         +PLMnhKxeRnTgLOk4gjVoXT/v+yDmbYED198mOFVzOW73UutjYJXgN7GVcJdk9NI54bK
         ZkhQ==
X-Gm-Message-State: AC+VfDwl3xbX6C64eYhQJixR+fAI9j5TQcEwATngVbLuD7SZienal65q
	W7xDTs6nbK3hC67fqF6zIhsW3BNyfwk=
X-Google-Smtp-Source: ACHHUZ7rjwyrtDwcE/fngygP9S9PfAkaU1NAWAlBncvkxWaKBOISG1PitPF7R2BSjWJdEIi3ai5nFg==
X-Received: by 2002:adf:e991:0:b0:307:a58f:5f7b with SMTP id h17-20020adfe991000000b00307a58f5f7bmr589357wrm.64.1683616024230;
        Tue, 09 May 2023 00:07:04 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4bc8000000b0030631f199f9sm13217601wrt.34.2023.05.09.00.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 07/16] ostree: fix build without gobject-introspection-data
Date: Tue,  9 May 2023 09:06:46 +0200
Message-Id: <20230509070655.70784-7-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102475

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


