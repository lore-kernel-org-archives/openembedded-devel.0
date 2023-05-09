Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9CDC77B7C
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 07:07:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.25909.1683616031657207240
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 May 2023 00:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=fa1pcUqi;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3063891d61aso5169953f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 00:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683616030; x=1686208030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCSZn9YL97TGwLp3r//6n7mV32k7Zdu2knh/u3i5To4=;
        b=fa1pcUqi5N+OdyKc91VLevdN1vryRZx8sN+xSQESqc01BoVtAOCWR3HtDyfbs2X4b1
         AS3pJpO9i4Y0mip4EnqzYrDFE9XpNUVRnoTL53rs5zqw1gK+x0BX84bvH/A1j3b/AV8B
         2pgMh1psg1y4LAL3t9P6T6mf5fK2+6YX7O0x9j/ukXqys75jIx4EUvMKJ3WPb4IZfwIs
         nlzt/Taz6tro6nIVAEQEv51cFlJZ6NDZ3RfjlLep06o0Bj8+QYwJLqh767mKWC8ZlSJ2
         RJ7tZupwSYyqm2cneG+cKx7J3VMHc6rhAkjaFSRIFUQJXd6xJPdsCEotAMvRpVILYIVa
         PMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616030; x=1686208030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCSZn9YL97TGwLp3r//6n7mV32k7Zdu2knh/u3i5To4=;
        b=bxDNkm5jrTIP/fpr8IAna70d+XZQ//u0O3zSDP04X3W8V2C+7+bN6l2MhrR3CBy3Ju
         c/8bOm/CIl2RWl4qviZlzBOLrWY/51KpE3lDOAvKWGvZLQfkeQmhPPN+WdANtsq8znHq
         DTWXWeDWhONOv6wok/QUDXsUDoWmcgYZ9M5g4VQDM9zswEejA4e9TCqZK6eYZzQgCIS+
         H9IHD50xhIAoWOfsLwUzH8/l/IFtq+dX+rcNTdy03fDT3MFF/+HwpQLkQ6pi8Rbsrp5p
         300FwJo02E9vhHvG7ccN1ykCFFAXBswr+Ij703ReDKGARPgZ+povwZCs7hlxNam80vPG
         sjCQ==
X-Gm-Message-State: AC+VfDwbxmiCiulUYXHNS1FWZHiB7FTQJiWnVquzvt9tuZn+bXB6Z8wk
	prDb/ZHj3KS1hyXq5SDuswZ8wdWzBLs=
X-Google-Smtp-Source: ACHHUZ5855USbk546JOsb+wOtLelgrvLX4tkcwlQtSuUFrbzxgxc6KZLf7M7yKolLmtB/UMRSQTXAA==
X-Received: by 2002:a05:6000:11d0:b0:306:2b8d:baa4 with SMTP id i16-20020a05600011d000b003062b8dbaa4mr8538612wrx.9.1683616030195;
        Tue, 09 May 2023 00:07:10 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d4dd0000000b003062ad45243sm13326307wru.14.2023.05.09.00.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 00:07:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][mickledore][PATCH 15/16] nv-codec-headers: fix installed-vs-shipped with multilib
Date: Tue,  9 May 2023 09:06:54 +0200
Message-Id: <20230509070655.70784-15-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230509070655.70784-1-Martin.Jansa@gmail.com>
References: <20230509070655.70784-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 07:07:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102483

* pass LIBDIR to install ffnvcodec.pc in right directory

* fixes:
  ERROR: QA Issue: nv-codec-headers: Files/directories were installed but not shipped in any package:
    /usr/lib
    /usr/lib/pkgconfig
    /usr/lib/pkgconfig/ffnvcodec.pc
  Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
  nv-codec-headers: 3 installed and not shipped files. [installed-vs-shipped]

  when libdir is /usr/lib64 with multilib

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../nv-codec-headers/nv-codec-headers_12.0.16.0.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
index 5ef7ead810..4bff4f24b7 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-headers_12.0.16.0.bb
@@ -10,7 +10,7 @@ SRC_URI = " \
 SRCREV = "c5e4af74850a616c42d39ed45b9b8568b71bf8bf"
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D}"
+EXTRA_OEMAKE = "PREFIX=${prefix} DESTDIR=${D} LIBDIR=${baselib}"
 
 do_install() {
     oe_runmake install
-- 
2.40.1


