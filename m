Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B24EC3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 17:01:50 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.60878.1722272502751396738
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 10:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ARtr605a;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4280b3a7efaso19155705e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 10:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722272501; x=1722877301; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dUzZacnirzKLGJtQhWQdn1WPYH1Gt27B9okzAeAiQE=;
        b=ARtr605ax3Svx3iG13ar2ONzplDEPRo41BUFsKfXfonSbVR+bCP9P5VfVzZPMctBfA
         ZbqZIA5B3hVIczoNYC+vqUZef0EMe3SbYcfoafKsxrIIVTEdneCe2ngmOADv+yI9Zyez
         Uzo/j+gd5irlrwsxhRpTt86y/gcwN6gH9uCAvUoHz2zB0fjXOBxtcdnCRYgsRIfcPeQp
         obd3vrb9DlWPEhzIViXB0mfub879sA1wFGBOzA6ovcEDWZY/o6pOxvua3CjNNCX+glI8
         PSqLzH97Wx54P3xbt4Hg58A90SlKtGv/0RZ+Hpn93WEU1vhpRPiNxoj+IuydbVec9TJ+
         E/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722272501; x=1722877301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dUzZacnirzKLGJtQhWQdn1WPYH1Gt27B9okzAeAiQE=;
        b=MYRjij1eOyhQmohn8e56ZB59FyDrOaeliB8ciLQFdbsW7bDziAAghpG7CV8+LpDRTf
         L2bhAGz9HFe1nK4Eaqla0zGMA52rexcZcMH4n4JLyy8d8pUnR4cVcA+YSvE5wmPd2WNz
         HMOdkDt0UK8UR7d06zJgvMmFjoVC0SbDl3gVPVFuTb3u6iZlMks8I3aKW1vpQN3DqQvP
         kA5PgE9mux82WbR4NUmMFhlx749MsiHHiVCKd5a5NpF9q47szNBug+8EGKj0U9oQc/Fj
         E4wVQYxs6QC2AoUAeOWPqDqDDYAz45XURnEDwNdPluABODvwPo0HM9bg5zOOXSLbKFB+
         GOAQ==
X-Gm-Message-State: AOJu0Ywzn1q7JxBhe6ORJ+XsDTwvQEL6yLjX/cANVgQgxESBHOBuhouC
	aJ2E8odyibQONLGpHt5d0i39alLKzNVXrVlvbDjcFN/QjcagGCBShgDZWg==
X-Google-Smtp-Source: AGHT+IEpyXwbfS5GFYCvRCpU5n0/RXvvK3KjCXObeolgulupbncThjTqQipCtLDPSGbl+JmVOeQBUQ==
X-Received: by 2002:a05:600c:4690:b0:428:1007:6067 with SMTP id 5b1f17b1804b1-42811d96223mr67914355e9.9.1722272500580;
        Mon, 29 Jul 2024 10:01:40 -0700 (PDT)
Received: from toster.lan (bl15-243-112.dsl.telepac.pt. [188.80.243.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4280573fd83sm184763845e9.19.2024.07.29.10.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 10:01:40 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH] ostree: Upgrade 2024.6 -> 2024.7
Date: Mon, 29 Jul 2024 18:01:26 +0100
Message-ID: <20240729170126.2580244-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 17:01:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111464

$ git --no-pager log --oneline v2024.6...v2024.7
4941d9cd (tag: v2024.7) Release 2024.7
4b96359e Merge pull request #3277 from cgwalters/karg-disable-composefs
e226c876 prepare-root: Add `ostree.prepare-root.composefs`
5378fe2a Merge pull request #3276 from cgwalters/parse-bool
65ff4041 prepare-root: Gather kernel cmdline early
26abca71 keyfile-utils: Add API to parse tristate strings
47edd1a2 keyfile-utils: Add API to parse tristate strings
97fb1112 Merge pull request #3275 from ueno/wip/dueno/glib-2.44
a0bd1894 libostree: Remove compatibility code with GLib < 2.44
d7eb9a10 Merge pull request #3273 from cgwalters/drop-library-printf
772801fa sysroot: Use journal rather than printf()
9b977e28 Merge pull request #3265 from lukewarmtemp/2023.8-3-coverity-scan
e99693c7 prepare: Create global var for tmp_sysroot_etc
d528083c repo: Fix `dir_or_file_path` memory leak
20d5bc84 commit: Null terminate `target_buf` var
dc9eaef1 tree: Fix `name` memory leak
0ea7d2e3 Merge pull request #3269 from cgwalters/fix-ordering
1db6911e Merge pull request #3270 from cgwalters/bump-runners
0153abe4 ci: Bump bootc e2e to latest ubuntu, drop docker
1544d205 Merge pull request #3268 from ueno/wip/dueno/composefs-doc-fixes
b0ab531e remount: Drop `Before=systemd-sysusers.service`
371540f9 repo: Remove leftover OpenSSL includes
023888d8 docs/composefs: Fix reference to `ostree sign`
f280b121 Merge pull request #3266 from ericcurtin/if-file-missing-on-relabel-continue
e25ca809 remount: ignore ENOENT error during SELinux relabeling
8f559e94 Merge pull request #3261 from cgwalters/validate-xattrs
e19f7324 core: Validate that xattr names aren't empty
ac6ba439 Merge pull request #3259 from cgwalters/c9s-buildroot
3ef9ae95 ci: Add buildroot to c9s build
114118e4 Merge pull request #3258 from cgwalters/prepare-comments
f63b7512 docs: Describe `/boot/ostree`
b6052306 Merge pull request #3253 from cgwalters/prepare-comments
a2ae2879 Merge pull request #3252 from cgwalters/checkout-cfs
f041e025 prepare-root: Cleanup comments
c0a715f1 checkout: Add API to directly checkout composefs
e84dc966 Merge pull request #3249 from ericcurtin/add-webos
1ab70be7 Merge pull request #3250 from ericcurtin/minor-bootloader-doc-change
bee18edf docs: make /ostree/root.X clearer as symlinks
fef5feca docs: add webOS as users of libostree
64a09da0 Merge pull request #3246 from jmarrero/release-2024.6
32bec27a configure: post-release version bump

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2024.6.bb => ostree_2024.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2024.6.bb => ostree_2024.7.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2024.6.bb b/meta-oe/recipes-extended/ostree/ostree_2024.7.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2024.6.bb
rename to meta-oe/recipes-extended/ostree/ostree_2024.7.bb
index 7f30dbfc5..8cecf5334 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2024.6.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2024.7.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "8b61c856697aa412f2f1724322ada40bdd7b1bf9e7783e2c594faa7a594f868f"
+SRC_URI[sha256sum] = "72451efffe5a10acb4cfdd6eb849db97fa9e61a81e4113fc656eece77eb93355"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.45.2


