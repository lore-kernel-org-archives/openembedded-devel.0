Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E34A6C83030
	for <webhook@archiver.kernel.org>; Thu,  3 Jul 2025 08:42:24 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.17666.1751532143183706521
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jul 2025 01:42:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CHef8UGs;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae3b336e936so497783866b.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751532141; x=1752136941; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7l1g2WY912luM4ntVGLrFu1kk/se497DYwdLnL9l/cE=;
        b=CHef8UGst0P9C1sp9c/bMXgl3Jm4dIrVZbigxWqspKjlCG5AeiUA20aUGUD//KJTR3
         pMFnhYfx2Qq3FEWGtrQiu3HWb0t6kZR+RS0T5XT5aZDwZ+aOzEFZ4MhxlvgG2ytmJFSD
         pqAcA9PPHtR4WHfO5pgLqzaS8QNXHB8fark5aQe7vNDOZljl5dPxPjswTNbdJpH5E3Uq
         Utxdifwhywq7LoOVPjw6DbKWsp4OnYHiZ1VwkZQNL1+xeiBOMVCIgYv25X1kWhpwYjsM
         SM2EAvjLt/kJdj3LckEBuqq/I0uIcwGlMFJ+EyOt14P+PMQmrk/9ZB1HWMQHggtO+Dye
         1Zow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532141; x=1752136941;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7l1g2WY912luM4ntVGLrFu1kk/se497DYwdLnL9l/cE=;
        b=bF7gdQLnF9d1vMGbDHqZj5q/A40EdgDcy5yamlh1pX++BgUDXj0rr4JdLX3gdqbbyW
         m8xPGwHEthl64sEyYKI6pYZ7TwbLmA+DSh3oFfRF8PPk/uSDtPein4gASJr3u2BDt8bf
         QFHfVjE4+fM5O67Mp8Dv3QUYA2J682M4BfQyvsuncgDu7y/ryuEV2yQIiWmN9yocKGb7
         WlMpUIR4o0c3qQHl2NB2QvhhAyDZhSZK7hWojB/M3dYWhSta76gFsnYXRavlFz9CJvVz
         uEC+w+U1pgCmsdVMch0mQgFGExLV0Zk7RbUouUDCZTMYNlXOggERVNGTbdYwzHOymi0b
         INYw==
X-Gm-Message-State: AOJu0YyXIXG0ekSApIqkGPafeqHz77b8BxBpX9DFJEeuQxWU9gKHPu9r
	Dx5E1OuimVyYAVt+UZlasTdMJQPXF+kwCBmM/kQt8AuNJ9JHaWyf68bBYjiTTw==
X-Gm-Gg: ASbGncskLKQs9yKSt039cse6K7CBzgarGRJqjeNYxdoSzbH9396a1wAIUkC3dVttgFs
	960A/3HUiD3I4kxswCrg9iEF2+Y3a4N/0tSNx4xAzYwTzktatDM6CpQ2sHvtW4kPIcs+ysxzhPz
	Xn3Hu/SFhBt01U649/Iy1t9ASskf8G7nozIQyydClp1BseIUvQ/dGc1Pshev8s6Vl3EcBBp1WFW
	7+/RF19FVz0X6QB/iGylTzWKx+IboGsFPLwkklYMm137g+Nsre9/SOMniUQfItyGgL2cOJ7P9ZF
	a6MdMjtlz1qMKiGsx6jCSQfpXqDyhg9tmzEeLSW/gexnNX5om7mq0FUQQBc=
X-Google-Smtp-Source: AGHT+IG1BK5/+FxkeKvyDr9lhxV3wtbQYjv9zUQsKXBV4bGnA5BPYaGqtWaNABWrdb9kqBg6ybnlTA==
X-Received: by 2002:a17:907:2d91:b0:ae0:d78a:2366 with SMTP id a640c23a62f3a-ae3c2a904efmr639477466b.4.1751532141020;
        Thu, 03 Jul 2025 01:42:21 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c014fbsm1212023166b.86.2025.07.03.01.42.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:42:20 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs-128: avoid using build host's rust toolchain
Date: Thu,  3 Jul 2025 10:42:19 +0200
Message-ID: <20250703084219.268506-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Jul 2025 08:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118213

mozjs uses Rust to build parts of the application, however it doesn't leverage
the cargo class, as it uses a Makefile to build.

Due to this, only Rust class is inherited in the recipe, so the toolchain itself
is available. The Cargo class is not inherited, to avoid the Yocto specific Cargo
build logic.

However in case Cargo class is not inherited, some Cargo specific environment
variables are not set (most notably CARGO_HOME, CARGO and RUSTC - the latter
two are derived from the content of CARGO_HOME, unless they are set explicitly),
and Cargo tries to guess where the Rust toolchain is.
Usually it guesses correctly, and uses the Yocto toolchain. However in case there
is no CARGO_HOME environment variable set and the build host has a Rust toolchain
available, and a ~/.cargo folder is present, then its toolchain configuration has
a higher priority than the toolchain in the PATH[1], and the compilation fails
due to the incorrect toolchain.

To avoid this, make the CARGO and RUSTC environment variables to point to the Yocto
toolchain. That way even if CARGO_HOME not defined, the correct tools will be used.

[1]: https://github.com/rust-lang/rust/blob/master/src/tools/rust-analyzer/crates/toolchain/src/lib.rs#L28

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
index ceb81d07e5..e327cd7723 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -57,6 +57,10 @@ export HOST_CXXFLAGS = "${BUILD_CXXFLAGS}"
 
 export AS = "${CC}"
 
+# ensure that the correct rust binaries are used
+export CARGO = "${STAGING_BINDIR_NATIVE}/cargo"
+export RUSTC = "${STAGING_BINDIR_NATIVE}/rustc"
+
 export MOZBUILD_STATE_PATH = "${WORKDIR}/mozbuild_state"
 export RUSTFLAGS
 

