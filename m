Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B1FC433F5
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 05:29:32 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.30010.1642310971763490622
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hxTtGS+B;
 spf=pass (domain: gmail.com, ip: 209.85.215.173,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id i8so6585053pgt.13
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Jan 2022 21:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Fx9iuevlFXilhdkIVZvdLMDO97+f1GfSX7inFXIRWRA=;
        b=hxTtGS+BQoO1/ldOInLuyQBIVCeLjM4905qv60+yXix6TLTB6h9DDDjzVdZksy1yXJ
         ROMmxo9b+1txaqxJBYF8MMpK3VqGIwfbzIk2JdHwOYeskGcWe79VrN5ckR60xXSJt4y+
         VLk021WZPRijg7dv40CB9iOtRvQRw+GtYgZBRkSBCR7kj4PIyLAjbsYo1if9pKyatrXa
         SHG1+UMTTXQFijLM1MwoTlbLWIFnWO7prR18rylXxdnizuBHHZFStvdYJDgYWJsTL3xn
         z1hX1JGkfnAT07ppg+YXux/MJVtEn0a5svgVxOgivcgwq8tiBrRrrbCp919byVplpqJG
         Q/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fx9iuevlFXilhdkIVZvdLMDO97+f1GfSX7inFXIRWRA=;
        b=mY/KnKXM1cjsmcaWFb/raeZR56N1dJE/N0Zv+y7ELUKF2irWsX2emx98/bt0JEvldV
         3skF6DJrEPj3vmlNCk74ouSFlxOVVztti6WM3K9y0UaWzkT8UaWIXGgHedOlKt8MPSSv
         Hy+HjAsQaPZrVM0+bDph934iG2gay9ms4ye0nm+sv46FZwJPVHdfFwbWkk0NcOv15fYj
         XrmFt2aK9ofcg9i/A/4dRVvlkrsfAtNYZXJh7P+h8CgpIntxI6oTtYpYEjOSe2nFlTNj
         wXCzC/8mHMbQwHNm3RwGOwVVfcn2P+TjEdTyx1VJQgX1A1klQAJgApSvVCwCTP3bMCnr
         QCvw==
X-Gm-Message-State: AOAM5322kYP2OOFPL5C8IAQe0CbcpyA0D0eKmGEpu9HQaAAZajgeTRCr
	UhuQXOg90/wjyLuHZAwoaeWjzrmuNbnzgg==
X-Google-Smtp-Source: 
 ABdhPJw3BX/pZJnmf5oO6Rg60MkK6zG2j8dMMBoFligIRHIme+ZmH+Yzf+EdZf4GfxJAFYEcT+60EQ==
X-Received: by 2002:a63:1e0f:: with SMTP id e15mr33565pge.577.1642310970940;
        Sat, 15 Jan 2022 21:29:30 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:bfd3:7196:2716:eb37])
        by smtp.gmail.com with ESMTPSA id
 l11sm10062146pfu.115.2022.01.15.21.29.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jan 2022 21:29:30 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 3/7] setuptools3_rust.bbclass: setuptoools Rust
 plugin
Date: Sat, 15 Jan 2022 21:29:00 -0800
Message-Id: 
 <360dbafb5ca9b4cfd646a1ee1f63cb5d85b3a974.1642309436.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1642309436.git.tim.orling@konsulko.com>
References: <cover.1642309436.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jan 2022 05:29:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94878

setuptools-rust is a plugin for setuptools to build Rust Python extensions
implemented with PyO3 or rust-cpython.

Compile and distribute Python extensions written in Rust as easily as if
they were written in C.

This class inherits pyo3.bbclass (and therefore cargo.bbclass) and
setuptools3.bbclass to make it easier to build Python modules with Rust
extensions.

Need to call pyo3_do_configure to properly setup the PyO3 environment
for cross-compiling.

Need to call cargo_common_do_configure to setup cargo_home/config so
that the linker properly finds e.g. crti.o and crtbeginS.o

It is strongly recommended to provide crates needed for your recipe
using the crate:// fetcher. This can be helped with the cargo-bitbake
command [1].

If you choose not to use the crate fetcher, bitbake vendoring will not
work with setuptools-rust, as it errors out immediately because it cannot
find pyo3 or some other crate. The (strongly discouraged) workaround for
this is to set:

CARGO_DISABLE_BITBAKE_VENDORING = "1"

[1] https://crates.io/crates/cargo-bitbake

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta-python/classes/setuptools3_rust.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/classes/setuptools3_rust.bbclass

diff --git a/meta-python/classes/setuptools3_rust.bbclass b/meta-python/classes/setuptools3_rust.bbclass
new file mode 100644
index 0000000000..fb11f08f89
--- /dev/null
+++ b/meta-python/classes/setuptools3_rust.bbclass
@@ -0,0 +1,11 @@
+inherit pyo3 setuptools3
+
+DEPENDS += "python3-setuptools-rust-native"
+
+setuptools3_rust_do_configure() {
+    pyo3_do_configure
+    cargo_common_do_configure
+    setuptools3_do_configure
+}
+
+EXPORT_FUNCTIONS do_configure
-- 
2.30.2


