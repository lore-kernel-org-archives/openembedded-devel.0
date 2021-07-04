Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.3203.1625432966778091093
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 14:09:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GwQTH+ku;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id b8-20020a17090a4888b02901725eedd346so7553016pjh.4
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jul 2021 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uMkDQmqJ6UUceTDCwaFaxPF3n9EoMb2gfggGYqfcWQ=;
        b=GwQTH+kukNqUDvI2nlsTGYM24sPSLE0QB/Vr1/J11x0PaX5A2VyyGFx2KPVS7czjk7
         EOtTgxpn0PmxPkz715wAYot3IbtIPPg2QHFbvVwdkTJdUbgg/qfL5Rs4Vrzn0uVIuV2+
         z+DFu946hpcwWVYhelh+tLgDsdrr2xoMAtZS/d0TxOd4WpOvCHEf+qSGoEK4TEHtsyeM
         MFKBrEXRyyLI5dFSeEtxpzfDIK8wc5aTL4bIux9cSjcgdKx8PTS1XAt+Y8A1JwPLxlXM
         ewzosP+4IinmbabCELlgVgCj9v4ML3++/bWzWnitgK93fRxpP5LibJS+iquyedypcuXy
         Lzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0uMkDQmqJ6UUceTDCwaFaxPF3n9EoMb2gfggGYqfcWQ=;
        b=m/6UD9O+WT64Mtud3qpQxjYfC5CpdDMlbWbPAeQ/99nGfhKKV6vUsa7KLUQBh6Qsjq
         EOWPCUqu4t35mrWDuLvuddWbZlwcB2MXupiIAOQL6GJBYqGWC8QCnlXgG+c9LvouviBI
         FDrykfaPygQaExps7hO7PnBgJ1unSMFP34lrkkZZC3OZ8KllyUVaEN9VSctupvTftyoY
         9GISQRAkSWtcL641fdz2qIHkmrd69O/ptWY/aJ4V/AUtgbIgsC1/3hVe6QZRyAACvp1P
         IRs00s61qIv0QXvzyKo1XjL/50G5Bc544wLsjy27ROeCdcnUJNkabtuGZskyB0Qzougg
         5qFA==
X-Gm-Message-State: AOAM530RkJe2xeS1lwAdzb7Y9D0khW2Ke2vPsVN9bd6KgO9aY/YgsHQ3
	UW3ZGdNHObenrqcjbpepDCTZ0Mvdco5i5w==
X-Google-Smtp-Source: ABdhPJzPav8sEraYf+/sAS55rEnFsixeFQjflzSqPSw/SpiJju1t85T4kMjPmpGfa00mc+sTXcTlCA==
X-Received: by 2002:a17:90a:dc06:: with SMTP id i6mr11574619pjv.65.1625432966157;
        Sun, 04 Jul 2021 14:09:26 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1c2d])
        by smtp.gmail.com with ESMTPSA id l12sm10180414pff.105.2021.07.04.14.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 14:09:25 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] sysdig: Disable JIT on ppc64
Date: Sun,  4 Jul 2021 14:09:23 -0700
Message-Id: <20210704210923.597108-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

since luajit is not available on ppc64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-extended/sysdig/sysdig_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/sysdig/sysdig_git.bb b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
index f1b77070c1..a626e3b207 100644
--- a/meta-oe/recipes-extended/sysdig/sysdig_git.bb
+++ b/meta-oe/recipes-extended/sysdig/sysdig_git.bb
@@ -15,6 +15,8 @@ JIT_mipsarchn64 = ""
 JIT_riscv64 = ""
 JIT_riscv32 = ""
 JIT_powerpc = ""
+JIT_powerpc64le = ""
+JIT_powerpc64 = ""

 DEPENDS += "libb64 lua${JIT} zlib c-ares grpc-native grpc curl ncurses jsoncpp tbb jq openssl elfutils protobuf protobuf-native jq-native"
 RDEPENDS_${PN} = "bash"
--
2.32.0
