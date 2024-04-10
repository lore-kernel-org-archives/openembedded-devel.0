Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8539CD11C2
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 22:53:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.4306.1712789604622710897
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Apr 2024 15:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bS4dgj+w;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6ed20fb620fso3487757b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 15:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712789604; x=1713394404; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wk2kyksyEQJTjTvL4E6HO5q0U7OGnAnAqvHZhOvzdhc=;
        b=bS4dgj+wgR2JjlkR/2uQQpqiKJPuwI5U2pPDz0wCXUGT75c1sDxSgx248lq+t9VWwK
         tug4EEnO3Jrh6nBAjrLkbkHaJE4OkjvwZLOhx/z/F96awe2cVrNYLR9P5MbkAjASol3C
         KwKoPXiTae+omw4o8rgP7awTHV91mUyVbd/kxCLjHXaC2fCrlBjmSODwKF4pusVg3XMC
         5ZrybF8V+++FBmUaxgTUb7kTdg2E8mr5VzZwcmwmPEQ3t96NQZlCDPpMmnpk37zqc/Ny
         VJZoPj1qbjkIE6K8eN/qJEa2BoLxZQ5Dq/UtAtFM5Z3XxbZ82ysY2JoRefE/S4IH5HyB
         Ajww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712789604; x=1713394404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wk2kyksyEQJTjTvL4E6HO5q0U7OGnAnAqvHZhOvzdhc=;
        b=IudjO7PTg7o0SKAN71R7AUURfO+xc/wSA4GiRI7TZru9oxqlW9d9yzCRc5/mbANP3p
         XQ+VAfv0aBx6rFvV50kq0+FwZjGh95xc0kebWToB1nqEAv8oHmeqh6tbOHusCZK1lbXy
         ENXtg9csy2R5gLXGybtB0zymRV9gBQwXkjYff48gzQGuBQXdMO748G2G5rz07POcE3s1
         WYBH24thyHqiZ4CI1O3XKnk862fh/FptHidXhvvNTuELT6titMTM3h1C7M9HzsLmCOmw
         7sq5vUuS9jo3RAxTVbOjqMfwsOk2LEo7LjZvW5xO+UQBZQU7a8v+CgpAxehiJGNBltbe
         9Vtw==
X-Gm-Message-State: AOJu0YyasCnAZfenVqHN846emYJBW7hob/Iv/FIYvJPSLJIyezWSbV5i
	gF537d+pdGI6+MnVKleY1naQoA3AWV6v6kdccJaxzjx/fLQft5BprqADnlHy
X-Google-Smtp-Source: AGHT+IHSeEcC1mDit2KGLp/6uSjZaieiENppm68yME/XkOEbB07P1TaaRS25aNMp4nu9+LezPpcTBw==
X-Received: by 2002:a05:6a00:244e:b0:6ea:b1f5:1134 with SMTP id d14-20020a056a00244e00b006eab1f51134mr4230547pfj.27.1712789603753;
        Wed, 10 Apr 2024 15:53:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::d35b])
        by smtp.gmail.com with ESMTPSA id t8-20020aa78f88000000b006e7243bbd35sm168181pfs.172.2024.04.10.15.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 15:53:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] nftables: Fix ptest runs
Date: Wed, 10 Apr 2024 15:53:21 -0700
Message-ID: <20240410225321.2353966-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Apr 2024 22:53:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109914

It gets OOMs with memory < 2G on x86_64 qemu
Export NFT variable in run-ptest script its used by few tests
Add required runtime dependencies for ptests to pass

This also requires changes to kernel config
features/nf_tables/nft_test.scc and CONFIG_VETH

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../images/meta-networking-image-ptest.bb     |  1 +
 .../nftables/nftables/run-ptest               |  1 +
 .../recipes-filter/nftables/nftables_1.0.9.bb | 26 ++++++++++++++++---
 3 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
index f458b761f2..295da982ec 100644
--- a/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
+++ b/meta-networking/recipes-core/images/meta-networking-image-ptest.bb
@@ -27,6 +27,7 @@ IMAGE_ROOTFS_EXTRA_SPACE = "324288"
 QB_MEM = "-m 1024"
 # If a particular ptest needs more memroy, it can be customized:
 #QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
+QB_MEM:virtclass-mcextend-nftables = "-m 2048"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
diff --git a/meta-networking/recipes-filter/nftables/nftables/run-ptest b/meta-networking/recipes-filter/nftables/nftables/run-ptest
index 363a1ee25a..32ddf9f455 100644
--- a/meta-networking/recipes-filter/nftables/nftables/run-ptest
+++ b/meta-networking/recipes-filter/nftables/nftables/run-ptest
@@ -4,6 +4,7 @@ NFTABLESLIB=@libdir@/nftables
 cd ${NFTABLESLIB}/ptest || exit 1
 
 LOG="${NFTABLESLIB}/ptest/nftables_ptest_$(date +%Y%m%d-%H%M%S).log"
+NFT=nft
 tests/shell/run-tests.sh -v | sed -E '/I: \[OK\]/ s/^/PASS: / ; /W: \[(CHK DUMP|VALGRIND|TAINTED|DUMP FAIL|FAILED)\]/ s/^/FAIL: /' | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g" | tee -a "${LOG}"
 
 passed=$(grep -c PASS: "${LOG}")
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index ad99a80a6d..7718922742 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -37,8 +37,6 @@ SETUPTOOLS_SETUP_PATH = "${S}/py"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3', '', d)}
 
-RRECOMMENDS:${PN} += "kernel-module-nf-tables"
-
 PACKAGES =+ "${PN}-python"
 FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python = "python3-core python3-json ${PN}"
@@ -66,7 +64,29 @@ do_install() {
     fi
 }
 
-RDEPENDS:${PN}-ptest += " ${PN}-python bash make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux"
+RDEPENDS:${PN}-ptest += " ${PN}-python bash coreutils make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux"
+
+RRECOMMENDS:${PN}-ptest += "\
+kernel-module-nft-chain-nat     kernel-module-nft-queue \
+kernel-module-nft-compat        kernel-module-nft-quota \
+kernel-module-nft-connlimit     kernel-module-nft-redir \
+kernel-module-nft-ct            kernel-module-nft-reject \
+kernel-module-nft-flow-offload  kernel-module-nft-reject-inet \
+kernel-module-nft-hash          kernel-module-nft-reject-ipv4 \
+kernel-module-nft-limit         kernel-module-nft-reject-ipv6 \
+kernel-module-nft-log           kernel-module-nft-socket \
+kernel-module-nft-masq          kernel-module-nft-synproxy \
+kernel-module-nft-nat           kernel-module-nft-tunnel \
+kernel-module-nft-numgen        kernel-module-nft-xfrm \
+kernel-module-nft-osf \
+kernel-module-nf-flow-table \
+kernel-module-nf-flow-table-inet \
+kernel-module-nf-nat \
+kernel-module-nf-log-syslog \
+kernel-module-nf-nat-ftp \
+kernel-module-nf-nat-sip \
+kernel-module-8021q \
+kernel-module-dummy"
 
 TESTDIR = "tests"
 
-- 
2.44.0


