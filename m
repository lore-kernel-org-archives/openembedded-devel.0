Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437BFC87FCA
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 00:23:29 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.101723.1754094207125758988
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Aug 2025 17:23:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q45lJkVx;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so2379170a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Aug 2025 17:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754094206; x=1754699006; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsZqewl+E3yd8AcA4yr34t3fZPqcN4bxJiarv63Lyis=;
        b=Q45lJkVxoLwJl5D5ynF5PjjW5+SX4QhIelnuG7K7T4ERYHmiIz6zKoGGY3ra5lzG8N
         3dUaeEWUaaHBDHLeBYXmMK1d8g0je+5ATaKq6Q/48UwLi+ZIVBRXjccvurl5YHZm4lem
         r5P+ucfVkRn6V/mPAWMb7NIcftO8NDPp1qTTDh5CkUu0fh10rxMOKlcK2UCxrbgcUnnP
         ogs4xRW5nFLIBlGaUnkbZtMhg8zWOg6jFJwlT/g88Jr8kuXSuzdHGX+MfoGvMRFhBNrJ
         jU3BN7EB+oob5ChoRrgW1l4Ykgjtysw2yAfZS5BFYEYbsaJKuv/HPr2vsbg43AQ0/iLr
         0FdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754094206; x=1754699006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VsZqewl+E3yd8AcA4yr34t3fZPqcN4bxJiarv63Lyis=;
        b=GqS88otW/VUrKEgVJeCyb7cIItQ6ZqbqY3+GrhYEu91zWmpqJI5z6L9Q4QzUYkfMd1
         tBJImPttX4n+9dvNnV8Wv+c9eee7JPjy6rqrVpHJ4rvqvPK3b5zXqeh3dFnSEyoPNZtY
         aVjQLM3+cmanePe161vTKQOerkBbQ3+1MoicGv4Atalx4Zy7SSx2AoG8/7ZBCfNdw2u3
         wNo/6UyQ1fVRmFHf+xfyZb8MqB7ja6qvNeYY1wUgkWD6Y6jfewN1cbavvLkobg5xJNmH
         2nVFTAmXFB+U45/01OoFcX/dzN0MvPmDuSCfoVRSJmbx9XPmvSgKW9FyNxdKidimU8RJ
         XpBg==
X-Gm-Message-State: AOJu0YykZ+ZgDPVd47cBk4C8Di5mFS8qoxbPYp1HP7PIuCTR+eB62GVv
	7QJh0tKM4M+zkdqZCbRKRZuYQbYSs3y46/JflUPFVdC359SrZj2ok1Ld8mfvU6KVJwI=
X-Gm-Gg: ASbGncslZ8VJgoxRHxCYV5RKKjsFy2/+Uh1ObQ+XgmOJ2D751EAcjO2tDi9xGW/JN14
	Eb48emw5JUFm0vSF/UEnIpF7WxQ99ZA1i8oBMW32I/7bRQ2ntN8cEMd6PT6PZEkqE8z3O3QcPWM
	SRSfAMNCrPZ/At0QfuprR6dfkNqqKohHylZVnb3IjWc08qDIKcO6IGp+IXb4/qtLHdJPEC8CWR9
	uRHdpstTXmDsqquXNtuBSFNy5OI6jxbC7NGuCjwMjcY4v9GeM4oXFjGGekOXcHT8yao0BEU0CNX
	KqYd65dWLbLt2hildiIUHR4JlIZqwWjPPZXfnH+hG9f5nBSLihodxPJEv+Qh9R3lW+evsmU3SlC
	Wf9Bg2S4RH98x+g==
X-Google-Smtp-Source: AGHT+IH2/xRNY3QwVsOXMy47U42VkSNUGUrqeJLugs+o8W2gy5rih+IcERNfokCu2ijcBux3aWJrAg==
X-Received: by 2002:a17:90a:dfcc:b0:31f:12d:ee4f with SMTP id 98e67ed59e1d1-321162d62e0mr2084683a91.23.1754094206114;
        Fri, 01 Aug 2025 17:23:26 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32102b9022fsm1296005a91.4.2025.08.01.17.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 17:23:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] thin-provisioning-tools: Move out of clang dynamic layer to meta-oe
Date: Fri,  1 Aug 2025 17:23:22 -0700
Message-ID: <20250802002323.621998-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 00:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118828

clang is now in oe-core so it can live in its original place

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-core/packagegroups/packagegroup-meta-oe.bbappend   | 3 ---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb     | 1 +
 .../thin-provisioning-tools/thin-provisioning-tools-crates.inc | 0
 .../thin-provisioning-tools-git-crates.inc                     | 0
 ...-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch | 0
 .../0001-Use-portable-atomics-crate.patch                      | 0
 .../thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb   | 0
 7 files changed, 1 insertion(+), 3 deletions(-)
 delete mode 100755 meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc (100%)
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc (100%)
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch (100%)
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch (100%)
 rename meta-oe/{dynamic-layers/clang-layer => }/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb (100%)

diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend b/meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
deleted file mode 100755
index d3fc8d3254..0000000000
--- a/meta-oe/dynamic-layers/clang-layer/recipes-core/packagegroups/packagegroup-meta-oe.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-RDEPENDS:packagegroup-meta-oe-support += " \
-    thin-provisioning-tools \
-"
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index e58e2c73a8..8bc74b2f4c 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -876,6 +876,7 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "synergy", "", d)} \
     syslog-ng \
     tbb \
+    thin-provisioning-tools \
     tokyocabinet \
     tree \
     uchardet \
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-crates.inc
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools-git-crates.inc
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux-g.patch
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools/0001-Use-portable-atomics-crate.patch
diff --git a/meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
similarity index 100%
rename from meta-oe/dynamic-layers/clang-layer/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb
rename to meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_1.1.0.bb

