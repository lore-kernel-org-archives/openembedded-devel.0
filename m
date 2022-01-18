Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC58C433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 18:57:37 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web09.1339.1642532257008060888
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:57:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GTa41cs0;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 m8-20020a17090a4d8800b001b4f361964fso179083pjh.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Jan 2022 10:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5kx8j5ZtZlan3ioFUT+AcQK/IYzKrNYvRmiYPa7QW5o=;
        b=GTa41cs0WnmU5rC1dOYedFIb8qw93tNbCfUy/EkhSjdRgPvgG8mJZMLFT4OLAzDFa/
         2m2hC+3aqR++BI83SsqHbNsxsd6DlI3VAaIdrTcPnbIe7goI9mInNc3MLP7ZxA1XiIyp
         RF6PmrYoaAqjhspxP5Hakeh6FSNezHSYP4A7FvvcQmDNTgk+IoDetyPPykJbitReVRIC
         wGg/uWXQ8QVMqVlqhL9Q5uXxmFz3K6URTq6L4T7leok9xUGxKsfym87E1D3Ur2PkuRml
         QysizQ/BAJvRHR3hsje8mmFhAwTChvZliIzp7J3YWCvj0qSNuxOZd21hVNxdjTQw1pST
         3Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5kx8j5ZtZlan3ioFUT+AcQK/IYzKrNYvRmiYPa7QW5o=;
        b=dD9niCib3qst+ltiXdRxthUytaEidHbyYaab9GFV7305MPJrYvLvXNrM4/qRPw7BZV
         JbhqqbruWHbfNGTtOzP2HKVyZ7QScJ/hjEGj6VEyI3MxETY9fDE41gEiJ5r4o7Uvg7++
         d2dS8FiL6OEh5GTOE+IOW9YAW3dDIu9LyDIYbGJHaZ4dXNqXCtBJxgbufGVGtR0iQBIL
         BF/kD4pp7DIZf/c10+2RaRYQ78FaXSFHejVD25+5Lu/DSlKz0HadTBrSs19Mkzu5FAVo
         waEk+NZur6EpStXQnSo6Ce+GW45o4gKZbS+NxD+9p+PaS0K598oUN6+huOKbPGvTyf9U
         fX1Q==
X-Gm-Message-State: AOAM531s/Ut6i1IDAxgurfrZaMQoXFvSIW96CFiTIfiRkgFbeiY8vUA7
	NCeEscbcl+voduukyeJayRQoEftGz4uKkQ==
X-Google-Smtp-Source: 
 ABdhPJx9mnOZGxwlh0kJOJeuXzNr5aStdoiXkE1Xj5SW8s/L9cD5WM++nLTQA0W9ZWK0l1BkzFy4Mg==
X-Received: by 2002:a17:902:9887:b0:14a:199:bc51 with SMTP id
 s7-20020a170902988700b0014a0199bc51mr29290449plp.39.1642532256196;
        Tue, 18 Jan 2022 10:57:36 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:53de:4e73:9ed8:2550])
        by smtp.gmail.com with ESMTPSA id
 rj1sm3613580pjb.41.2022.01.18.10.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 10:57:35 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2] python3-pyruvate: disable 64 bit atomics for mips
Date: Tue, 18 Jan 2022 10:56:52 -0800
Message-Id: <20220118185651.580658-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jan 2022 18:57:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94920

Use the same approach as librsvg to disable 64-bit atomics on platforms
which have 32-bit pointers or are otherwise not supported.

https://github.com/crossbeam-rs/crossbeam/blob/master/no_atomic.rs

https://doc.rust-lang.org/std/sync/atomic/#portability
"PowerPC and MIPS platforms with 32-bit pointers do not have AtomicU64
or AtomicI64 types."

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---

Changes in v2:
  - add the rest of the fixes from librsvg... mipsel, riscv32 et al

 .../recipes-devtools/python/python3-pyruvate_1.1.2.bb     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
index 835cf9a93d..dad18b78c2 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.1.2.bb
@@ -14,6 +14,14 @@ S = "${WORKDIR}/pyruvate-${PV}"
 
 inherit pypi setuptools3_rust
 
+# crossbeam-* -> std::sync::atomic AtomicI64, AtomicU64
+# not supported on mips/powerpc with 32-bit pointers
+# https://doc.rust-lang.org/std/sync/atomic/#portability
+RUSTFLAGS:append:mips = " --cfg crossbeam_no_atomic_64"
+RUSTFLAGS:append:mipsel = " --cfg crossbeam_no_atomic_64"
+RUSTFLAGS:append:powerpc = " --cfg crossbeam_no_atomic_64"
+RUSTFLAGS:append:riscv32 = " --cfg crossbeam_no_atomic_64"
+
 SRC_URI += " \
     crate://crates.io/aho-corasick/0.7.18 \
     crate://crates.io/atty/0.2.14 \
-- 
2.30.2


