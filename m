Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B544C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 09:50:35 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web09.6097.1633081834607870250
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Oct 2021 02:50:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=U9HtjgMx;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id v18so32016699edc.11
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Oct 2021 02:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eMxeW1UhnCrVH5MOk5k4mStLGmzPUAtX87nlu5U5ihs=;
        b=U9HtjgMxYPLAty4ISx095Bc7CpOG45LbjzvmxWx83ZM4eD+wouTkM1niWavVxLPbyH
         fLPToDnSxnrd7BIm2WYt0oVFLzX8M8DbfGRjHpYKel92mnGa9uUFgW/qG+M+prUcHl8f
         rOj7WQX05y5EcjvjfK5ixKAo7HwbkD+VYWDsx4XWDod1fhL2ymYyeYX2xblTnWkwxz0Z
         C4I6j/ccPZNTfnvzX9xyIhUyQgIh1G/ZEgKEcn1mFDWhTN8WN15GbHH/VSXn/TqugRyb
         rHXaODAH9wErXvg558+PzftGvzn8pFK7DZqK30Mfvd12lza1vRYBCArPXxHd8qdsu6hM
         9iAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eMxeW1UhnCrVH5MOk5k4mStLGmzPUAtX87nlu5U5ihs=;
        b=x9yacNL5l2CgtR8NRzxuYpV1ToQmwmeMtcw9ExDOOSmOrheI9ce9k3yhFg1weG/4lx
         P/3yEYz6IAXrfUhGeSLz7tU24oFCoPKkRQiklHgBX0cz9y7Zes2jeW9IHPvVuwGSaxzS
         5fXWgPuU1A5dHAlJ4E2DzeUZAZOiEPQGIoSBF0T54XkKj3AkHzqtTces/dKo0/MDFDRx
         Y0RRJQ7tnys1IMBkH0eK7WOv5eJIKQXWtT9L+WFNarIXvZ2JBVnSmcAmkUtSizjUbsNn
         ZOHo412tFtusJ6L/th47sMEbBeCoGj1HEXVZbimRmBFBJGLGQiPWXK3QVkkFR4N/w+ld
         ZWOg==
X-Gm-Message-State: AOAM5302LdRcEZ/xNrnPK+U1LOYzZDS6G49LLTiUXj1zQe3PStzioUHi
	3R9Z20Y9aB98LIoLoJ1Lgmv1I3MDOBc=
X-Google-Smtp-Source: 
 ABdhPJzxrgE3gn6MfhEcp47p6Qh37E7fQHMR5iAHQX+M+NCAEeljen4vodf1uhRuAbI9Nt41ySCOSg==
X-Received: by 2002:a50:8282:: with SMTP id 2mr13033863edg.98.1633081832315;
        Fri, 01 Oct 2021 02:50:32 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id
 p22sm2668255ejl.90.2021.10.01.02.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:50:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] pahole: use MACHINE_ARCH
Date: Fri,  1 Oct 2021 11:50:25 +0200
Message-Id: <20211001095025.21588-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Oct 2021 09:50:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93185

* depends on MACHINE_ARCH libbpf causing:

  oe-core$ openembedded-core/scripts/sstate-diff-machines.sh --tmpdir=tmp-glibc --machines="qemux86 qemux86copy qemuarm" --targets=pahole --analyze

   === Comparing signatures for task do_configure.sigdata between qemux86 and qemux86copy ===
  ERROR: pahole different signature for task do_configure.sigdata between qemux86 and qemux86copy
  NOTE: Reconnecting to bitbake server...
  Hash for dependent task pahole/pahole_1.22.bb:do_prepare_recipe_sysroot changed from bfa7a0e0c59d99b0133ab295ebf7025a430242d4b8874d436d47cf8157192999 to e45ada248cd757d742872183d9fe426a7ce3b44a652b0900709ad3d0f3f64aa8
  Unable to find matching sigdata for /OE/build/oe-core/meta-openembedded/meta-oe/recipes-devtools/pahole/pahole_1.22.bb:do_prepare_recipe_sysroot with hashes bfa7a0e0c59d99b0133ab295ebf7025a430242d4b8874d436d47cf8157192999 or e45ada248cd757d742872183d9fe426a7ce3b44a652b0900709ad3d0f3f64aa8

  ERROR: 1 errors found in /OE/build/oe-core/tmp-glibc/sstate-diff/1633081392/signatures.qemux86copy.do_configure.sigdata.log

  oe-core$ bitbake-diffsigs tmp-glibc/sstate-diff/1633081392/qemux86*/core2-32-oe-linux/pahole/*prepare_recipe_sysroot*
  NOTE: Starting bitbake server...
  NOTE: Started PRServer with DBfile: /OE/build/oe-core/cache/prserv.sqlite3, Address: 127.0.0.1:38435, PID: 21321
  Hash for dependent task libbpf/libbpf_0.5.bb:do_populate_sysroot changed from 95bfd90e188d9ee6b4797736b07339d616655173a58a3f4f4f2ab4a5fa0bf3d8 to 9556bc318991640bba0eacc8f2102167bc7c389c13dadf08d69a9b864feae5c9
  Unable to find matching sigdata for /OE/build/oe-core/meta-openembedded/meta-oe/recipes-kernel/libbpf/libbpf_0.5.bb:do_populate_sysroot with hashes 95bfd90e188d9ee6b4797736b07339d616655173a58a3f4f4f2ab4a5fa0bf3d8 or 9556bc318991640bba0eacc8f2102167bc7c389c13dadf08d69a9b864feae5c9

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-devtools/pahole/pahole_1.22.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
index a56c5f728f..66f7761357 100644
--- a/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.22.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "elfutils zlib libbpf"
 
+# Depends on MACHINE_ARCH libbpf
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 COMPATIBLE_HOST = "(x86_64|i.86|aarch64).*-linux"
 
 SRCREV = "f02af2553ea58ae1186226af0d0ec835a248358f"
-- 
2.32.0


