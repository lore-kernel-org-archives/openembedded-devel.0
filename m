Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B27C3DA4A
	for <webhook@archiver.kernel.org>; Fri, 16 Aug 2024 06:19:32 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.142240.1723789163215326740
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Aug 2024 23:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ui0GoLEm;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-268a9645e72so1146648fac.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 23:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723789162; x=1724393962; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1T8Dz0x8W710Y1i6Wc3UpGZpHTSKYqhFP1Ouf0mOyg=;
        b=Ui0GoLEmiN0NYPhDsusLD1PTsCy2lg++6NPLIQpZ/q+1JAudLCL93PC9jaoaGIRh9U
         T4BtdBaEmK3ouvKKilCNRGMxitUmGUcLP+Cp5IRaVG86wuzUV5CBWo4if1hsmW6x0IKe
         2SobXUo4xhHdmWNtJUEwkHutXr+FmWN/uHHMwC0DLRU2UlwMua+QipVzDPNrtW5nHyqp
         OjEbgpMYWllaBRRPXB5VASBte76lDdjbW+cU2eHtM9JKH6lcVVsEMv7QIETeipCmmS9E
         31QTTgLnPbvp5z7GruDVaR7/44jZ7VCeVmEEExnE+jjlJ7MJuYwCXb+pb6iCYqp68/sS
         m8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723789162; x=1724393962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z1T8Dz0x8W710Y1i6Wc3UpGZpHTSKYqhFP1Ouf0mOyg=;
        b=HClHgR6gLnNUczvWixbeaQGkW9DPtEPXx1tE6wJrEeBme3YL+C648eZ/VK1W9xGSRt
         eX5v0nLqU5qjPWEYCMnw/JtgHCLNUcOeZdGJG5wd9uVbxqSscvDdfTscz3oWr8BB4lvv
         6pl9CEXam/Wn7xiCSo1Xg2GQT0SOk2pi8pd3CsLjOUmkCbfODoC+mkmO/qeWqlqMIvUr
         zGk7XkXLK34el2vuOJhxpttYJJaga6nCs/tbvwNqy2xswq8SVj/HvWVM/dBidgPRXQl/
         fpB36+uU8HD5waQ+6o65b3KrnIruq9IXh/not0FoaAvgeIrL54YfARw80A5pWd1jrwka
         u9VQ==
X-Gm-Message-State: AOJu0YzCQew79XVCAaRKj70bMlH41J0hMX9JICoUMkRWPSUS197hHisG
	U7xm0B8zIZwFdI+ByMbcab2NOzVDqV1csBrtuqBPOspRlIfEyFHGybUZSg==
X-Google-Smtp-Source: AGHT+IEQdfOxNNUuOahkv7qBcEx17mxHmtahB+XvRn3M3qBVo+dDjk+bwHY+1GE1XPCZN5Z4466Q5Q==
X-Received: by 2002:a05:6871:4915:b0:268:a79a:be0d with SMTP id 586e51a60fabf-2701c5efffcmr2082109fac.47.1723789162043;
        Thu, 15 Aug 2024 23:19:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127af1be5asm2022940b3a.176.2024.08.15.23.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 23:19:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/6] python3-kivy: Remove buildpaths from comments in generated C sources
Date: Thu, 15 Aug 2024 23:19:14 -0700
Message-ID: <20240816061915.2095711-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240816061915.2095711-1-raj.khem@gmail.com>
References: <20240816061915.2095711-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Aug 2024 06:19:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111833

Cython does not provide a direct option to disable or customize
the metadata written in the generated C files. The metadata
includes information like the Cython version and absolute paths to
the original Cython files, which can be problematic for doing
reproducible builds

Therefore edit out these comments from the cython generated C files
they are nicely tucked between two known tags at the top of file.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index 6bd7ce8ba3..045ac23106 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -75,3 +75,10 @@ RDEPENDS:${PN} = " \
 # python3-kivy/2.3.0/git/kivy/graphics/cgl_backend/cgl_gl.c:4568:52: error: assignment to 'void (*)(GLuint,  GLsizei,  const GLchar **, const GLint *)' {aka 'void (*)(unsigned int,  int,  const char **, const int *)'} from incompatible pointer type 'void (*)(GLuint,  GLsizei,  const GLchar * const*, const GLint *)' {aka 'void (*)(unsigned int,  int,  const char * const*, const int *)'} [-Wincompatible-pointer-types]
 # python3-kivy/2.3.0/git/kivy/core/window/_window_sdl2.c:8781:23: error: passing argument 1 of 'SDL_SetEventFilter' from incompatible pointer type [-Wincompatible-pointer-types]
 CFLAGS += "-Wno-error=incompatible-pointer-types"
+
+do_compile:append() {
+    for f in `find ${B} -name *.c`
+    do
+        sed -i -e "/BEGIN: Cython Metadata/,/END: Cython Metadata/d" $f
+    done
+}

