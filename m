Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AB5C04FFE
	for <webhook@archiver.kernel.org>; Fri, 17 May 2024 14:18:15 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.41824.1715955491720737445
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 May 2024 07:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cWSQD765;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-420298ff5b1so1976595e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 07:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715955490; x=1716560290; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fHAazeHDVOc/YTrOEUxvWyeJx1tY6IThAQcpF6c3Np8=;
        b=cWSQD76538L0XS9JS7IZVHS0gLdJSnDoESAdNsblxyuv1iJWAsEq1f0cFaFI+KYRcD
         r8wcIYyGEPRfMrZNR7HBjNZsHJBCKZcr1mh2XYrq0PP/jvbd37A5iEK2LDYSHylDdjBN
         qmWzPFARct+r6M7ABSleVZBY+HmYhz8tf2oiXBa42xrR8RC80138foC27tt0CetAHoA7
         ICgvF/ZHscRzRpcjE1e6GN1cdJqQx4HSyU2kfiDH4JadFpxZZJXh/yKDsyZSulC84Y8x
         DfoEvoRx/NgOQvB2I+/clKOkSQWQ124HVz8waLEDmBgYMTjQ/wvNELryplFdP98us6ec
         LK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715955490; x=1716560290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fHAazeHDVOc/YTrOEUxvWyeJx1tY6IThAQcpF6c3Np8=;
        b=TuB7asvK3nIRNZszzC7IJQXW5j+PdfBQAvIrRS7CmpqtNwP9yCKcphqo4LKycx58tm
         2/zYy4zT78wtpNQT+sXkz2aWAKv7CVDTz/SVbblddbWSA7BnkIm7ewt+WSB3LRrLSg16
         SjmoB+zuUlUgnU7xyfGAOe3sU9YcGzuUivPxjX0itukvwDLL7QQQxcbBP04wfhn8IBvC
         kEWpX8unDa4+ictFcw1t8+tIsQh2sNLKvSLAdH5acZqjCfQEh8cjfGuHK58mmVX4e+w+
         pVXIo1AXiP4Iqwub5ks9GXKFqWh2SoTcKIgiSVpMm53veX5DV+vCHi5GZwcQcJkKRdGn
         uUCA==
X-Gm-Message-State: AOJu0YwdCo6S1uxegg3yqX4+7j1FWpjvRYh2VaaqVWnuUMs7av0ZyL6h
	oiiw+ttVQRlGjORkkZc/7FhxD6e7vp2UKbO0DVIl0PDn5bh6mkvDQVqUa2AKa5I=
X-Google-Smtp-Source: AGHT+IFjwl2tSr2ZCPMVvsycQSwuoJFgWmVnjgbGUD/Y5AsEgNBG+/CFh0fkhu7Uth5p93h+F9dsDQ==
X-Received: by 2002:a05:600c:2042:b0:41c:8754:8793 with SMTP id 5b1f17b1804b1-41fead790ecmr174010145e9.41.1715955489631;
        Fri, 17 May 2024 07:18:09 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fccfe1277sm299357145e9.42.2024.05.17.07.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 07:18:09 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] ostree: Upgrade 2024.5 -> 2024.6
Date: Fri, 17 May 2024 15:18:02 +0100
Message-ID: <20240517141802.1575421-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 May 2024 14:18:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110430

- Add composefs packageconfig knob

$ git --no-pager log --oneline v2024.5...v2024.6
d4a7a8d9 (tag: v2024.6) Release 2024.6
4ed4d618 Merge pull request #3245 from cgwalters/doc-offline-deltas
37b3c767 docs: Describe offline updates with static deltas
664116f0 Merge pull request #3244 from alexlarsson/fix-fsverity-supported
92f2abcb Merge pull request #3243 from cgwalters/loaded_ts_fix
083eacd6 Fix _ostree_ensure_fsverity reporting of supports in early exit
ee066d79 sysroot: Handle `/ostree/deploy` having epoch 0
f911d40b Merge pull request #3234 from jmarrero/state-root
cb70e406 ostree-sysroot-deploy: check if deployments are in the same stateroot.
a00062bf Merge pull request #3238 from cgwalters/force-container-env
3d3f0b8d ci: Also skip if we detect /run/.containerenv
64ab0982 Merge pull request #3236 from cgwalters/clang-format
a33c7d23 ci: Only run clang-format on ubuntu-stable GH runner
cb13977a Merge pull request #3232 from ericcurtin/aboot-bootloader
fa720d15 Merge pull request #3233 from dbnicholson/sync-summary-times
60f4592b repo: Make summary and signature mtime match
ffbeff6c tests: Correctly skip single fsverity test
9e51fb16 docs: Fix spelling and grammer
998a0ab5 docs: More accurate diagram in bootloaders documentation for aboot
c8c436e5 Merge pull request #3231 from alexlarsson/fix-aboot-non-ab
6ac8c49a prepare-root: Handle non-AB aboot properly
99ef9806 Merge pull request #3230 from cgwalters/initfs-epoch-2
818af91d Merge pull request #3108 from cgwalters/use-external-composefs
eb54a441 Switch to external composefs
8a9f067d ci: Drop `SKIP_INSTALLDEPS=1`
3647395f tests: Skip composefs tests without the feature
74a3d2da init-fs: Add --epoch=2
0c0b6cee Merge pull request #3229 from cgwalters/init-deploy-0700
38f6b9b3 init-fs: Add --epoch
3c2e9d09 Merge pull request #3227 from alexlarsson/fix-fsverity-error-check
374fb05d _ostree_ensure_fsverity: Properly check for errors
d05c48b7 Merge pull request #3226 from ericcurtin/rm-rhivos
24c0c1c4 README & docs: Remove "RHIVOS" acronym
3c25a93b Merge pull request #3220 from jlebon/pr/on-failure-isolate
05b3b662 ostree-prepare-root.service: add OnFailureJobMode=isolate
dc4d4b55 Merge pull request #3218 from cgwalters/policy-allow-none
b96b4ff4 Merge pull request #3216 from cgwalters/mirrorlist-retries
45453b73 sepolicy: Add missing `(nullable)`
76ab8621 curl: Also map HTTP errors for retries
7fdc792f Merge pull request #3215 from cgwalters/release
1bc7d207 configure: post-release version bump

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2024.5.bb => ostree_2024.6.bb}              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.5.bb => ostree_2024.6.bb} (97%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.5.bb b/meta-oe/recipes-extended/ostree/ostree_2024.6.bb
similarity index 97%
rename from meta-oe/recipes-extended/ostree/ostree_2024.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.6.bb
index 2ea92f190..fcfc5401e 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.6.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "bc12d8493db64152093ee5be77cf62a29cc67a4a9e430dc987103e78aada4a6f"
+SRC_URI[sha256sum] = "8b61c856697aa412f2f1724322ada40bdd7b1bf9e7783e2c594faa7a594f868f"
 
 S = "${WORKDIR}/libostree-${PV}"
 
@@ -69,6 +69,7 @@ PACKAGECONFIG:class-nativesdk ??= " \
 
 PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
 PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
+PACKAGECONFIG[composefs] = "--with-composefs, --without-composefs, composefs"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
 PACKAGECONFIG[ed25519-libsodium] = "--with-ed25519-libsodium, --without-ed25519-libsodium, libsodium"
-- 
2.45.1


