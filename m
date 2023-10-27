Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456D9C25B67
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 09:14:15 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.3015.1698398053483754308
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 02:14:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GnT+L3zi;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507973f3b65so2828359e87.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 02:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698398051; x=1699002851; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NK65GZHDZVlCmdvpeIt6tFWc+BblGzspvEjDxls0lZs=;
        b=GnT+L3ziHY7rZwGL9YFSEm0ShWZgBMrg15gVmzxL5DhaBLIzzmJKfIL8bvI1yjO5Jr
         x1BQe+2ByVsD+4zaRGZJgJwZN/IMt4L4TfwhFOwj8mNMUt12BcPPRRTulwUAdhywl8WU
         Q7jSmx7r1eRMNsFJPquiouN7TZj9dwvCb3vi6KkjVoc7tpb28z4rQzsVQc0UebK581dz
         +YM0zLvTxvwPrutFggOVWjPJ9yK9bYcTv9In4+IQQoHtPfo8NAfN66KDnc1O2zaM+l12
         Wf7qUwEoy34JmwSW8eKbNj+votqWauFpmPnupLh6GhypX/Acms3lZMGUdHoozBg4qIUW
         qyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698398051; x=1699002851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NK65GZHDZVlCmdvpeIt6tFWc+BblGzspvEjDxls0lZs=;
        b=Jja8olis6fjkWVG0RINMHCMhjY1dJ9hat7OE9l/vwIWFitNMDmE/xatHLz9I9CSRRz
         mmV6wJ+YbIyGqW+QuMloja9yMK1id4f4h+rm8eQ5Kl4oIMd7TOPDrmwm2/SU20us12Se
         WU8pyLzh1AEbUOGPvMJaKFDeM72lH/bLov/P/O+/zbb1JJ4hKFqA/SSTYPAmVZS0FDuF
         e61XX7tOmjhJhWF1xrLKTY8NQ1QGMGJxljreEQ8VlOkKWPxGAh+GUxr/yadGSJReO/zM
         /b1sPVgJXoI1G/O9uXB1VuVeLSIS1vKMIiwhfhZq8GSrrugNKNmZHv2e19waaEQcde25
         ZaDg==
X-Gm-Message-State: AOJu0YxABVo5J0rAZFHfwbpJsiGPgskRkykBBN3dL9DEdQ1WjF1p7EVD
	marV9qg33pkb+wd2hrrn1aLaZR8a/YRQMQ==
X-Google-Smtp-Source: AGHT+IHGDFzKUyBoN2bgVeyOMyax1qLSGH/9aLfCV6sJqJ2+aVgq/g0fuz0RclBEZnQRc3iEwfcI+A==
X-Received: by 2002:ac2:5f4a:0:b0:507:8c55:39f9 with SMTP id 10-20020ac25f4a000000b005078c5539f9mr1231597lfz.49.1698398051019;
        Fri, 27 Oct 2023 02:14:11 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d6185000000b0032da40fd7bdsm1332855wru.24.2023.10.27.02.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:14:10 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH 4/4] ostree: Upgrade 2023.6 -> 2023.7
Date: Fri, 27 Oct 2023 10:13:53 +0100
Message-ID: <20231027091353.1700511-4-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231027091353.1700511-1-jose.quaresma@foundries.io>
References: <20231027091353.1700511-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105774

a87e9069 Release 2023.7
98f1501c Merge pull request #3081 from jlebon/pr/log-selinux-refresh
bdac515a lib/deploy: Log SELinux policy refresh
4085eee9 Merge pull request #2843 from jmarrero/retry
4fb6e6f5 ostree-repo-pull: add options to configure retry behavior
b9e73a38 Merge pull request #3078 from HuijingHei/karg-delete-array
67160862 doc: add `ostree admin deploy` option `--karg-delete`
003cb99c karg-delete: support multiple times
d788c5b5 Merge pull request #3075 from cgwalters/reenable-composefs
5d92407b Merge pull request #3077 from cgwalters/debug-finalization-lock
ac69c707 deploy: Remove lock when re-staging
833251cb tests: Use ext4, re-enable composefs test
824ac1af Merge pull request #3074 from cgwalters/more-errcontext-composefs
e75c5c6e Merge pull request #3073 from cgwalters/context-no-stateroot
4a3e43c7 composefs: Add more error prefixing
265b7f9e deploy: Improve error message for nonexistent stateroot
3894fe2a Merge pull request #3062 from alexlarsson/transient-etc
f617a341 Support transient /etc
cd0fc9f4 Merge pull request #3072 from alexlarsson/fix-whiteout-test
334f53d7 Merge pull request #3063 from cgwalters/label-usretc-as-etc
397a1176 tests: Fix whiteout test
81c08746 repo: Add an option to label /usr/etc as /etc
6cce2e23 Merge pull request #3067 from cgwalters/ci-composefs
734ea3ee ci: Disable composefs test for now
2f76b030 ci: Ensure composefs+openssl are is enabled on Fedora
befd8443 Merge pull request #3060 from owtaylor/export-hardlinks
3b2fd6e9 When exporting, use hardlinks for duplicated files
8c25452c Merge pull request #3049 from jlebon/pr/revert-virtiofs-hack
2363de71 Merge pull request #3059 from cgwalters/zipl-default-s390x
b8ce61ba Revert "ci: Run cosa unprivileged"
c4dcfbae Merge pull request #3046 from ostreedev/dependabot/submodules/composefs-cca8be4
e3d93a85 repo: Default bootloader to zipl on s390x
ec7bc823 Merge pull request #3058 from cgwalters/doc-authenticated-repos
d4adb795 docs: Add authenticated-repos.md
13be0786 Merge pull request #3021 from cgwalters/insttest-composefs-binding
46b7821d Merge pull request #3053 from ericcurtin/add_overlay_and_erofs_to_initrd
cecb59dd boot/dracut: Add erofs and overlayfs kernel modules
372cbd7a tests: Add an integration test for composefs signatures
cd606aa6 Merge pull request #3051 from cgwalters/rust-tests-update
87c43678 Merge pull request #3052 from cgwalters/switch-libglnx-source
01a847a2 gitmodules: Use github GNOME mirror
e3291ccc tests: Rework detection of trivial-httpd
878d6016 Merge pull request #3047 from ostreedev/dependabot/submodules/libglnx-aff1eea
ff73bebc build(deps): bump libglnx from `54ad67d` to `aff1eea`
7916cfb6 build(deps): bump composefs from `af86742` to `cca8be4`
92d25eb5 Merge pull request #3039 from cgwalters/rust-switch-include
26dcd4f5 rust: Switch to using `include`
b7e39eba Merge pull request #2054 from jlebon/pr/static-delta-fetch-no-scan
cd116a1e lib/pull: Drop static delta superblocks references
2fe88f80 ci: Run cosa unprivileged
fc5aef6f lib/pull: Don't scan commit objects we fetch via deltas
c8ed1c7a lib/pull: Fix miscounting of missing metadata
3c2587b6 app/pull-local: Add `--disable-static-delta`
0ac87956 Merge pull request #3038 from cgwalters/rust-drop-composefs
6a948567 Merge pull request #3037 from cgwalters/add-labeler-flow
2db17d21 rust: Drop composefs from crate
749857df Merge pull request #3035 from cgwalters/release-rust
12996948 ci: Add an automatic labeler action
1714e837 Merge pull request #3030 from ostreedev/dependabot/submodules/composefs-af86742
e52530b5 rust/sys: Also bump semver for this
4d3621db build(deps): bump composefs from `d085fbf` to `af86742`
00c04aef Merge pull request #3028 from ostreedev/dependabot/submodules/composefs-d085fbf
b0e32811 Merge pull request #3029 from cgwalters/bump-glib
aee1ab2c rust: Bump semver to 0.19
cccc0f1a rust: Port to glib 0.18
b60036dd build(deps): bump composefs from `597a766` to `d085fbf`
5fe050f5 Merge pull request #3027 from cgwalters/drop-cap-std-public
9121297e ci: Move lints into main build
242a9015 rust: Bump rust-version = 1.70
eec67ec1 Drop cap-std from our public APIs
e93ebd73 Merge pull request #3018 from ostreedev/dependabot/submodules/composefs-597a766
8d838230 Merge pull request #3012 from cgwalters/default-early-prune
d5cfbed5 sysroot: Promote the "early prune" behavior to default
c0014e00 Merge pull request #2968 from cgwalters/drop-global-syncfs-by-default
d976ec56 Merge pull request #3024 from cgwalters/clang-analyzer-fixes-5
0d7b8ebc build(deps): bump composefs from `1aed878` to `597a766`
52dbed4d Merge pull request #3023 from ostreedev/dependabot/submodules/libglnx-54ad67d
4eb3caca commit: Quiet clang-analyzer warning
5e1b6983 keyfile-utils: Quiet a clang-analyzer warning
3001ef28 build(deps): bump libglnx from `c02eb59` to `54ad67d`
03a19888 Merge pull request #3020 from cgwalters/less-return-if-fail-1
5837f27f Merge pull request #3019 from cgwalters/more-analyzer-fixes-4
886f5800 mutable-tree: Change some `g_return_if_fail` to `g_assert()`
db4ca6e7 mutable-tree: Quiet clang-analyzer warning
d001729b Merge pull request #3017 from cgwalters/more-analyzer-fixes-3
6538b170 repo: Quiet clang-analyzer warning
369e4ddd commit: Quiet clang-analyzer warning
5fc9eac0 commit: Quiet clang-analyzer warning
bfb7482a lib/commit: Quiet clang-analyzer warning
ee8c13b1 lib/delta: Remove dead code
3acdbac0 Merge pull request #3016 from cgwalters/more-analyzer-fixes-2
89e13a95 Merge pull request #2994 from cgwalters/refactor-composefs-warnings
0beaf5c9 pull: Quiet clang-analyzer warning
e2779a7c commit: Quiet clang-analyzer warning
5b40d4bb pull: Add assertions to quiet clang-analyzer
0cfa5e86 lib/repo-finder: Squash memory leak
f8549a9e Merge pull request #3013 from cgwalters/more-analyzer-fixes
7c13631a Merge pull request #3006 from cgwalters/misc-c99-style-5
1a16a7d6 switchroot: Use g_new/g_free consistently
d3ede20b sign/ed25519: Fix two memory leaks
a87789e8 commit: Drop dead code
d36bf35c switchroot: Lower config parser to otcore, add unit tests
38880bff composefs: Hard error except on ENOENT even in "optional" case
e952b1bf prepare-root: Fold together composefs signature cases
1d316e31 prepare-root: Init composefs options earlier
aa9b7c3b prepare-root: Drop redundant print about signature/digest
4dd3cb35 Merge pull request #3005 from cgwalters/release
97d83e62 configure: post-release version bump
cce1814c cmd/show-remote-url: Port to C99 style
116fdc3c cmd/log: Port to C99 style
e578c019 cmd/export: Fold libarchive error handling
88334b8f cmd/export: Port to C99 style
fa69eaac deploy: Remove global `sync` by default

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2023.6.bb => ostree_2023.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.6.bb => ostree_2023.7.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.6.bb b/meta-oe/recipes-extended/ostree/ostree_2023.7.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.6.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.7.bb
index e1172a579..d91b0a303 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.7.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "b43c4a373799681989bae12b3a1b94f453068dece6540b8e05a23b834c1037e2"
+SRC_URI[sha256sum] = "19cda718705f7ac8c018c939c38b1bb8412deaaa04862da98cd9fe9243f073bf"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.42.0


