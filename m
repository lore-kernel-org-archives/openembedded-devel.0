Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8414AC3DA7A
	for <webhook@archiver.kernel.org>; Wed, 13 Dec 2023 07:07:40 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.30705.1702451256435204684
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 23:07:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XKr6AZfL;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ce6d926f76so4723412b3a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 23:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702451256; x=1703056056; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=azGNOypR2S4tlZoM+2vr6cguP2SOlxJz6ibZQZECLao=;
        b=XKr6AZfLo2Dk1tlmVBG0e+wj0U9WyVUtn7vi8llr0GCq6kiVkW+lzjJCmI9G0lxr05
         juzA+eU5WX8O+xFG/85vj318KkZx1DhuXOe6JoEkU7sC6kp7LZ/ldvejczm8CXW3EAdT
         ZDqvZsmgY3n/5gmbSFeH3fbSGmbXh2Y8fhOEm194geFK0cO/Z0enkMVmxpCUf1EyJr5J
         nBWgAWJmGRi3teeXEuSt4ep91+2L4R0ziNB+P6NYHYkJldNVml9rBf0ZQy2gChaZbLfx
         cDSctkCPclyMMS5atft4yQsGXy4MRSwb/OC6Z/IHCLsYsaulUINgrW1CNjpFd/I/NMYg
         J7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702451256; x=1703056056;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azGNOypR2S4tlZoM+2vr6cguP2SOlxJz6ibZQZECLao=;
        b=kGYuVcp3Rbobyk3tinbH4XSmKJKz2OUKYVpz7ZUuU7tGrMBoWdncmWoEy8TEGxamIT
         cV0W5m+4mJGu1X6puIGR1GU/Zg3i7ex06UkAldPIKYY047PTbpoMxpPqF/NRNMdrgM/p
         ftoGw1twlUFGXbBsIRfg4wZMuBqo2y0EiuVc/8uv7piJfVbcl40JvV8SVGXUuN974otm
         ZQRuQPrNQOAdgA4SjPJzcJcf6bAzG9Z9MfXk+2O4XbV7Cqlhbou+PdhFzk7ddDtEq5pf
         MEZJG4Rov1T8dX50KvRIt7QgnUNjAvLHWAwwXQED3DK8jpVaqlW2l2nNHQOxqIeeBnqW
         464A==
X-Gm-Message-State: AOJu0Ywl4v2trWpJOSkhksXd8EEPU4P+loQuGj4YXBz7SMDQ5MKXLXOa
	Nu0YlEK2pItlEbAtk5f0on3CuVjiJHI=
X-Google-Smtp-Source: AGHT+IEVEV2Nb9+OSVvzW/9mUiiY0BiIlNFyHNVmQJGKd8HdKlheoocF6Tj6djkETqjiazBDcEmVhQ==
X-Received: by 2002:a05:6a20:3c8b:b0:190:2f5f:f44a with SMTP id b11-20020a056a203c8b00b001902f5ff44amr10601662pzj.3.1702451255593;
        Tue, 12 Dec 2023 23:07:35 -0800 (PST)
Received: from apollo.localdomain ([2601:646:9d80:4380::4b6f])
        by smtp.gmail.com with ESMTPSA id v29-20020a63481d000000b005c19c586cb7sm9218151pga.33.2023.12.12.23.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 23:07:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
 Jose Quaresma <quaresma.jose@gmail.com>
Cc: ricardo@foundries.io, Jose Quaresma <jose.quaresma@foundries.io>
In-Reply-To: <20231207182023.357897-1-jose.quaresma@foundries.io>
References: <20231207182023.357897-1-jose.quaresma@foundries.io>
Subject: Re: [meta-oe][PATCH] ostree: Upgrade 2023.7 -> 2023.8
Message-Id: <170245125426.133993.11611316089417276962.b4-ty@gmail.com>
Date: Tue, 12 Dec 2023 23:07:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Dec 2023 07:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107374


On Thu, 07 Dec 2023 18:20:23 +0000, Jose Quaresma wrote:
> $ git --no-pager log --oneline v2023.8...v2023.7
> 5b23804a (tag: v2023.8) Release 2023.8
> 6e303318 Merge pull request #3106 from cgwalters/commit-reflink
> c3dff62e commit: Try reflinks for local commits by default
> 59b9f9a8 Merge pull request #3105 from cgwalters/sysroot-borrow-fd
> 09e32d61 Merge pull request #3107 from cgwalters/drop-userxattr-test
> bab87cbd tests: Drop bare-user on tmpfs negative test
> 15d0777b Merge pull request #3104 from cgwalters/s390x-target
> c3aa2958 bootloader/zipl: Run in target deployment as container if needed
> aa635bf5 sysroot: Expose deployment runner outside of selinux
> e794a0c0 Merge pull request #3103 from cgwalters/tmpfiles-factory-var
> d3190dbf sysroot: Add a method to borrow sysroot fd
> 74456972 sysroot: Support specifying bwrap arguments
> 791337fa sysroot: Expose deployment container executor internally
> 66064d96 tmpfiles: Copy `/usr/share/factory/var` to `/var`
> b0be2336 Merge pull request #3102 from cgwalters/deploy-cleanup-run
> 68cc1960 sysroot/deploy: Drop unnecessary g_ptr_array_free
> 31cbcc72 deploy: Use NULL terminated strv
> 5cc78fd7 Merge pull request #3100 from cgwalters/misc-finalization
> d3de3a0a tests: Add a dedicated finalization test
> d24714e3 Merge pull request #3101 from cgwalters/drop-redundant-includes
> 0c85e1ff main: Drop some redundant includes of `ot-main.h`
> 78905ffb man: Two finalization fixes
> 12cbb3dd Merge pull request #3090 from cgwalters/stabilize-locking
> 28cc7618 sysroot: Stabilize deployment finalization, add API and CLI
> 1ca4f02a status: Add error prefix for gpg verification
> b6f435fe tests: Turn off gpg verification for dev builds
> ff7e7f47 Merge pull request #3099 from markmc/man-sysroot-readonly
> 2cfa8aba man: improve sysroot.readonly docs
> cd1728a4 Merge pull request #3098 from jlebon/pr/abort-concurrent
> 8002983d ci: cancel previous build on PR update
> de22914e Merge pull request #3097 from cgwalters/symbol-cleanups
> 315cbdd3 lib: Don't hardcode year in sample symver section
> 76e4833d devel: Fix symbol versioning number
> 82392e3f Merge pull request #3095 from alexlarsson/fix-post-copy-symlinks
> acb88600 Fix admin post-copy handling of symlinks
> 508443f7 Merge pull request #3094 from alexlarsson/admin-deploy-post-copy
> accb1f06 Add `ostree admin post-copy` command
> 29973774 Merge pull request #3091 from cgwalters/fix-soup3
> bc62fd51 unlock: Don't pass options again to overlayfs
> 331bc17e Merge pull request #3093 from cgwalters/rust-alias-stateroot
> c668a8c5 tests: Work around systemd regression for boot id parsing
> 3535b58f rust: Add a `stateroot()` alias in the Rust bindings
> ce2a33e8 build-sys: Enable libsoup3 by default if installed
> 2c774deb Merge pull request #3089 from cgwalters/fix-undeploy-parsing
> c3cf5b23 undeploy: Parse integer more properly
> e4b82c4a Merge pull request #3080 from nikita-dubrovskii/s390x_secure_boot
> c3a9a642 lib/bootloader-zipl: Check for Secure Boot before zipl
> 67ccf6e0 Merge pull request #3085 from cgwalters/s390x-units
> 75c7e51a bootloader/zipl: No-op if run as non-root
> cfb63b89 Merge pull request #3083 from cgwalters/release
> 36d96931 configure: post-release version bump
> 
> [...]

Applied, thanks!

[1/1] ostree: Upgrade 2023.7 -> 2023.8
      commit: e7c94af6b2ef272616f888568601138bbb70a904

Best regards,
-- 
Khem Raj <raj.khem@gmail.com>


