Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5904C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 18:20:49 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.91766.1701973239466679330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 10:20:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IP9O8hVb;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33348e711e0so1299226f8f.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 10:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701973237; x=1702578037; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3820WCcB6n0M+1tD8iwhifEhxEV9fa/qTEgJRl9M+Zc=;
        b=IP9O8hVbiwVXMszkqOVrSNULmA6Y3hBT2DAD3DR/kbAuWDD34dOiedDKkb10Ha+jVH
         wIxbJZSVNRNP79saAEXbddC8u3KBX3U6gk/B2KrPzBOzApFth6Q8Wvei0saFFDgRB66H
         w0/z0duSpGJAn5Q4lZcJSM9ku8gT72349ZKnrxx55NfwX3AxjLhuKeBWwrqUUD1bUqII
         FRRWqoO/hrlQzsynDKHx5kTLeAU3+N5AuxgS/j/LfSTpkUnQ/38ewLZ8TcHJEG+xuuRX
         OytfgfshB/Al3aJRTfvXepl9gVyoS2ryL8KkWqOy7P9qYBI7bQDlkipZvqvJWmitz2BY
         d3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701973237; x=1702578037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3820WCcB6n0M+1tD8iwhifEhxEV9fa/qTEgJRl9M+Zc=;
        b=w+QEriYIV7eYJKpJZ5Rz4fDvdRTXVUccOb9lPA1/Iyrvz1D8MqKuOMS7fSF7bDDEnf
         f/Bl1nsZpAliL+wZKiSh3dE/GzmGuINyu6gKdCf+uvBe3eCuTxfp/41IhT/D9mVyxuhY
         birLEFiBfRjLu1b/ZmNtbUQgb8Z7+LDv5om3T9nXcgfEV8GTnDLYdjpWE9y0mJdZc1cL
         ZH3WHQP4gklSeov2wcwcA6yS39odg5gkA0SLmLQuKXv1CRADFWc0Dx5JBLMdOw+2Of4/
         9baKR/vHoboX5oWbL33wLu7lLiqDXZ6uawibxe41rxxi4xrbblsSg7IbJzTq64jEjHEh
         gTHg==
X-Gm-Message-State: AOJu0YzSGVN6Gjl9UCDWKVAr9XQRjgukwyk/qFiGRr2SKvLXmyNrIq2v
	S6okrCUewokezb7Oo3wPLhClr7guu6nS2Q==
X-Google-Smtp-Source: AGHT+IG85PMYcWd3sgAOXfr3v2OZ2K+TI8WhTbJyXQ5bR5nrYzj8J8KHWU9AmXolImqSTAr6ZmdSjQ==
X-Received: by 2002:adf:f8c3:0:b0:333:3eaa:f67a with SMTP id f3-20020adff8c3000000b003333eaaf67amr1837383wrq.75.1701973237435;
        Thu, 07 Dec 2023 10:20:37 -0800 (PST)
Received: from toster.lan (bl23-105-200.dsl.telepac.pt. [144.64.105.200])
        by smtp.gmail.com with ESMTPSA id e18-20020a056000121200b00333404e9935sm245147wrx.54.2023.12.07.10.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 10:20:36 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: ricardo@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-oe][PATCH] ostree: Upgrade 2023.7 -> 2023.8
Date: Thu,  7 Dec 2023 18:20:23 +0000
Message-ID: <20231207182023.357897-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 18:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107289

$ git --no-pager log --oneline v2023.8...v2023.7
5b23804a (tag: v2023.8) Release 2023.8
6e303318 Merge pull request #3106 from cgwalters/commit-reflink
c3dff62e commit: Try reflinks for local commits by default
59b9f9a8 Merge pull request #3105 from cgwalters/sysroot-borrow-fd
09e32d61 Merge pull request #3107 from cgwalters/drop-userxattr-test
bab87cbd tests: Drop bare-user on tmpfs negative test
15d0777b Merge pull request #3104 from cgwalters/s390x-target
c3aa2958 bootloader/zipl: Run in target deployment as container if needed
aa635bf5 sysroot: Expose deployment runner outside of selinux
e794a0c0 Merge pull request #3103 from cgwalters/tmpfiles-factory-var
d3190dbf sysroot: Add a method to borrow sysroot fd
74456972 sysroot: Support specifying bwrap arguments
791337fa sysroot: Expose deployment container executor internally
66064d96 tmpfiles: Copy `/usr/share/factory/var` to `/var`
b0be2336 Merge pull request #3102 from cgwalters/deploy-cleanup-run
68cc1960 sysroot/deploy: Drop unnecessary g_ptr_array_free
31cbcc72 deploy: Use NULL terminated strv
5cc78fd7 Merge pull request #3100 from cgwalters/misc-finalization
d3de3a0a tests: Add a dedicated finalization test
d24714e3 Merge pull request #3101 from cgwalters/drop-redundant-includes
0c85e1ff main: Drop some redundant includes of `ot-main.h`
78905ffb man: Two finalization fixes
12cbb3dd Merge pull request #3090 from cgwalters/stabilize-locking
28cc7618 sysroot: Stabilize deployment finalization, add API and CLI
1ca4f02a status: Add error prefix for gpg verification
b6f435fe tests: Turn off gpg verification for dev builds
ff7e7f47 Merge pull request #3099 from markmc/man-sysroot-readonly
2cfa8aba man: improve sysroot.readonly docs
cd1728a4 Merge pull request #3098 from jlebon/pr/abort-concurrent
8002983d ci: cancel previous build on PR update
de22914e Merge pull request #3097 from cgwalters/symbol-cleanups
315cbdd3 lib: Don't hardcode year in sample symver section
76e4833d devel: Fix symbol versioning number
82392e3f Merge pull request #3095 from alexlarsson/fix-post-copy-symlinks
acb88600 Fix admin post-copy handling of symlinks
508443f7 Merge pull request #3094 from alexlarsson/admin-deploy-post-copy
accb1f06 Add `ostree admin post-copy` command
29973774 Merge pull request #3091 from cgwalters/fix-soup3
bc62fd51 unlock: Don't pass options again to overlayfs
331bc17e Merge pull request #3093 from cgwalters/rust-alias-stateroot
c668a8c5 tests: Work around systemd regression for boot id parsing
3535b58f rust: Add a `stateroot()` alias in the Rust bindings
ce2a33e8 build-sys: Enable libsoup3 by default if installed
2c774deb Merge pull request #3089 from cgwalters/fix-undeploy-parsing
c3cf5b23 undeploy: Parse integer more properly
e4b82c4a Merge pull request #3080 from nikita-dubrovskii/s390x_secure_boot
c3a9a642 lib/bootloader-zipl: Check for Secure Boot before zipl
67ccf6e0 Merge pull request #3085 from cgwalters/s390x-units
75c7e51a bootloader/zipl: No-op if run as non-root
cfb63b89 Merge pull request #3083 from cgwalters/release
36d96931 configure: post-release version bump

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2023.7.bb => ostree_2023.8.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.7.bb => ostree_2023.8.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.7.bb b/meta-oe/recipes-extended/ostree/ostree_2023.8.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.7.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.8.bb
index d91b0a303..0704c9162 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.7.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.8.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "19cda718705f7ac8c018c939c38b1bb8412deaaa04862da98cd9fe9243f073bf"
+SRC_URI[sha256sum] = "b6fffc267188e40d60755e6d7f2be65831795baa53b0fd9dd6c6809c7e54796d"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.43.0


