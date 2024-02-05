Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE8DC4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 11:18:35 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.60302.1707131910599955469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 03:18:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S4vwhGqF;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-33b40208735so331459f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 03:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707131908; x=1707736708; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLP6shor/eaLVYHGyvAScDOO7YMuaKGXAhI2AZpuQpo=;
        b=S4vwhGqFQZVuROtWo1jfuOYVgRvrV4JCTIYqWRg5VFT3N0cTjBvIL2EAVDgdkT0iI1
         cQNevTCELXYomFK3ZMdbL2NiaX+pPelDZa5Zvm0A1gotZJcsSbCaPLxhohH/LDQaPxCE
         09uIpTAh2YGE2BJlwal3CYfJyIZhl/KAzhF16H16Egtz8f7wGHruYnvnCCA60xfkYIHf
         KP90rxqBWDl3aeCH+i4WrD23dFpTlVR5IiEaPyXJl4qCBFyQo2+9MmL7UQfFsjquKLfo
         W/3JH3PdnADyHCgBZuse1vELANqt3L1biDQK1WG/1ksMuXYeO7gRIxHWspN/Do++vGIy
         2b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707131908; x=1707736708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLP6shor/eaLVYHGyvAScDOO7YMuaKGXAhI2AZpuQpo=;
        b=WWKfyrBV42VML7YOlt52Jme9Fjz9nBFCMCSqKuKU85lmYpNEbEa0jBLZqv1D4SH1PC
         oTCooxAYHIFvMA/paF+bFJNkCGbiNO5uibB+iYD2wLI9edST5PQNyUJqix95aiocytlV
         tnOuUIvwxOhj7GKVv5qCS5WhTwLVvcrzT+3SRKP69+wtnzco2mAEOKDX8nVKdO/xMCH9
         MLiuT+nPLwYxEgYiPuO2gyk220n5RcgQ1OSrTvdqxXbPrAZ23YfrXTfb/Hrvh2kEv+5R
         4vuIF/yFKJaJbRpfhr6SeMbHStWh2sieSIsbVE/ivTqOwq3Xs3G12Brv/ly7f98ITfmX
         H3Bw==
X-Gm-Message-State: AOJu0YxdjxpZa+f2r8bNPHBG7+XnJ3eqaYgKYK9b2sN4lnAJlbMSOo+7
	9y1UZRu9r4YELm2p9zjLoquImj5LegtcYTVirWbCpGeKUsbXdBYamn0MDyY5
X-Google-Smtp-Source: AGHT+IGO7fD5VyjLZnaU7GIHknd+MPDTt2t0S54cilFo54k1IF0Huzr+ai8z4GYMTCEZgbJGgZx/OQ==
X-Received: by 2002:a5d:628e:0:b0:33b:1494:e4cd with SMTP id k14-20020a5d628e000000b0033b1494e4cdmr8573957wru.3.1707131908193;
        Mon, 05 Feb 2024 03:18:28 -0800 (PST)
Received: from toster.lan (bl23-106-114.dsl.telepac.pt. [144.64.106.114])
        by smtp.gmail.com with ESMTPSA id m26-20020a056000181a00b0033afcf8925asm7855117wrh.24.2024.02.05.03.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 03:18:27 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] ostree: Upgrade 2023.8 -> 2024.1
Date: Mon,  5 Feb 2024 11:18:24 +0000
Message-ID: <20240205111824.2669133-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 11:18:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108565

$ git --no-pager log --oneline v2023.8...v2024.1
3b4f5e36 (tag: v2024.1) Release 2024.1
19cd8cf1 Merge pull request #3135 from ericcurtin/aboot-documentation
6031f1c0 Merge pull request #3120 from jlebon/pr/state-overlays
e233d023 build(deps): bump libglnx from `aff1eea` to `b415d046`
92b1a272 Add concept of state overlays
062cf603 Merge pull request #3136 from ericcurtin/pr-3134-feedback
477d472c status: Rename query-booted to is-default
b79a2e16 Merge pull request #3134 from ericcurtin/query-boot-real
87a0aba9 Merge pull request #3133 from cgwalters/boot-complete-rollback
46bae54b status: Fix --skip-signatures description
c13aef97 man: Add ostree admin status man page CLI options.
1397ee2b status: Introduce tool to quickly check if we are booted as default
cd308d57 doc: Add section about ostree and aboot
501a0775 Merge pull request #3132 from ericcurtin/query-boot
852db038 systemd/ostree-boot-complete: Start earlier
eb4fb917 systemd/ostree-boot-complete: Add `ConditionKernelCommandLine=ostree`
37971a9d status: Fix build without GPGME
ac8638f3 Merge pull request #3131 from cgwalters/status-use-remote
4d06e98e Merge pull request #3130 from jlebon/pr/autoprune-aarch64-dtb
e95109b3 status: Add an option to skip signature verification
24bf5b7d status: Pass correct remote name when verifying
cc5747a6 lib/deploy: Add safety margin in early prune space check
4982306e lib/deploy: Round to block size in early prune space check
9faf5569 Merge pull request #3129 from cgwalters/fix-unlock-composefs-compat
6a339ac6 Merge pull request #3128 from cgwalters/hotfix-composefs
dd33cc65 switchroot: use shared constant for unlock --hotfix
a1c1c0b5 prepare-root: Fix composefs + ostree admin unlock --hotfix compat
40b143f4 Merge pull request #3127 from cgwalters/composefs-doc-toplevel-chattr
ba12a168 Merge pull request #3119 from cgwalters/zipl-fix-nul-term
712eecad docs/composefs: Add note about toplevel dirs
888f29a6 Merge pull request #3125 from ericcurtin/explicit-sysroot-rw-ro-log
e5498b94 switchroot: Be explicit about what could cause /sysroot to be ro
02915a3f Merge pull request #3124 from cgwalters/rust-features
798893b3 Merge pull request #3123 from cgwalters/deploy-log-space
6722c55f deploy: Log calculated needed space
8b6e96cf rust: Add missing feature versions
41c56b37 Merge pull request #3121 from fwilhe/patch-1
1c4420ed Link to gardenlinux/ostree-image-builder in README
5c7f42b8 Merge pull request #3116 from jmarrero/bootloader-doc
ade0bd26 zipl: Convert to a data input stream
241597a8 zipl: NUL terminate buffer we're searching
e9a2a2cf zipl: Fix error handling for read
876ddd32 zipl: Use O_CLOEXEC
5466e98c doc: Add section about ostree and bootloaders
234fa2ce Merge pull request #3117 from cgwalters/doc-root-transient
8f4beb4a docs: Add `var.md`
a0f7b3c7 man: Document `root.transient`
071053d9 Merge pull request #3114 from cgwalters/root-ovl
8fbaebac prepare-root: Add support for root.transient
59cdd611 prepare-root: Add an autofree
6cb15c35 sysroot: Drop unused prototype
508b6ea6 Merge pull request #3112 from leonheldattoradex/main
3ff00e43 Update Torizon information
51a34a40 Merge pull request #3111 from cgwalters/release
56b268dd configure: post-release version bump

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2023.8.bb => ostree_2024.1.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.8.bb => ostree_2024.1.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.8.bb b/meta-oe/recipes-extended/ostree/ostree_2024.1.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.8.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.1.bb
index 0704c9162..d4ad765c0 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.8.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.1.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "b6fffc267188e40d60755e6d7f2be65831795baa53b0fd9dd6c6809c7e54796d"
+SRC_URI[sha256sum] = "152327fe804512d4f896fb9b9e9cdc84ad9b4c0b205b8625472147d5a28164af"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.43.0


