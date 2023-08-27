Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89423C83F01
	for <webhook@archiver.kernel.org>; Sun, 27 Aug 2023 20:49:54 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web10.72.1693169389872644699
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Aug 2023 13:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=KpC6TuDe;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6bee392fe9dso2099414a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 13:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693169389; x=1693774189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hVpPyv+ODmeDwdyAH17oghRT8+DWLgI5joHuUAicTdk=;
        b=KpC6TuDeK/RHXI/kGbOt/GcLc21DcUWSUV2Js1s03vuwtpTRZN0htzMc1VQOmk4DD3
         yR4Xr/QNY9PLcmXeTVgEcy1dPLskf12BrgkYe9cTmvZTYD1NmqlWS5JF/tKl6PQJUi88
         e99g3CGT5XhGGjOXToraPsVgzyDBZIn9diI3wv6swNMk9Z7ba3xkxKZ0y3SLmOh3NHi4
         Gld7u++n8BEGY8vdhbuUEJ+TsTSPmzntT8T6IUXrWCpPb2ozXUq/ElkagVSRuhAjB/JP
         5fitSTuXCgMEBkQeCGgEEohGz9XQHjfsjzzx4518xGXzVVkTzrv7rJo922E9FFVpJ4q4
         L/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693169389; x=1693774189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVpPyv+ODmeDwdyAH17oghRT8+DWLgI5joHuUAicTdk=;
        b=Zczt0y+D3EPUa926eywFMny5EF2zHGLu0y46j21bcs8+nd5oewMazGKl1dMUoLBP/R
         CeAP1mHzSCNPYXB+vwIyaRvnG9Lai0GWNu1xilaKpks7UTENOXcPRmoNYheY88jqm/Yj
         ijtlbUT2Tfd01fQ47maliMNrxUY1W3iyGhPbCce1lj003HoXz4MMRcPAcq1SLm3BiwFQ
         DmWsR32xgzmfb54sUZ5E3UcszQmDB4z3WTlwB6l5UpddJz1CCEx4XrQ3a2yrr2cAZMT/
         8zwSETlLFOox4S/K7jgv5rjR8MfE0GLUpnJzHvxAYQSW78atxqUbxg9AvOfns6Fak5PE
         5BNA==
X-Gm-Message-State: AOJu0YwM6TIrFtdgnHD5l/NnwJLVZM3cPHShY485U7ot2cj6lvOhUgVz
	H6QqbdZYLLSd8cR2LzRN88bIYIeT4kKJHw==
X-Google-Smtp-Source: AGHT+IHCpuES5Qwf3BoMv2BquIEbjHrlZzmz6VtiK3IbxocpgsLPq1MTeoj3Yrw6AuoMwhuaZGm13w==
X-Received: by 2002:a05:6870:910d:b0:1c7:ebf5:b6d6 with SMTP id o13-20020a056870910d00b001c7ebf5b6d6mr10639496oae.37.1693169388854;
        Sun, 27 Aug 2023 13:49:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::71d2])
        by smtp.gmail.com with ESMTPSA id mq3-20020a17090b380300b002682523653asm5464369pjb.49.2023.08.27.13.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 13:49:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-m2crypto: Append architecture to SWIG_FEATURES instead of overriding
Date: Sun, 27 Aug 2023 13:49:46 -0700
Message-ID: <20230827204946.602950-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Aug 2023 20:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104629

For x86/x32 it was overwriting SWIG_FEATURES, its better to append it
like for other arches, in addition it brings essential options to remove
buildpaths from .so files.

Use OPENSSL_NO_FILENAMES define instead of overrding OPENSSL_FILE for
achieving reproducibility. Takes care of line numbers too.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-m2crypto_0.39.0.bb    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
index ac62773064..d47ec2bac4 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.39.0.bb
@@ -31,15 +31,15 @@ RDEPENDS:${PN} += "\
 DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR} -I${STAGING_INCDIR}"
 DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_EXECPREFIXDIR}"
 
-SWIG_FEATURES:x86 = "-D__i386__"
-SWIG_FEATURES:x32 = "-D__ILP32__"
-
-SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']} -DOPENSSL_FILE='openssl/macros.h'"
+SWIG_FEATURES ?= "-D__${HOST_ARCH}__ ${@['-D__ILP32__','-D__LP64__'][d.getVar('SITEINFO_BITS') != '32']} -DOPENSSL_NO_FILENAMES"
 
 SWIG_FEATURES:append:riscv64 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES:append:riscv32 = " -D__SIZEOF_POINTER__=${SITEINFO_BITS}/8 -D__riscv_xlen=${SITEINFO_BITS}"
 SWIG_FEATURES:append:mipsarch = " -D_MIPS_SZPTR=${SITEINFO_BITS}"
 SWIG_FEATURES:append:powerpc64le = " -D__powerpc64__"
+SWIG_FEATURES:append:x86 = " -D__i386__"
+SWIG_FEATURES:append:x32 = " -D__ILP32__"
+
 export SWIG_FEATURES
 
 export STAGING_DIR
-- 
2.42.0


