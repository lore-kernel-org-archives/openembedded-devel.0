Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581E6CCF9ED
	for <webhook@archiver.kernel.org>; Sun, 26 Oct 2025 20:51:28 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.18159.1761511883884723066
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Oct 2025 13:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NALc9qtI;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso3578894f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 13:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761511882; x=1762116682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I46qut/pEpEgcaG/IAS0x4XLDBvEc6VpJ5gK983XDI=;
        b=NALc9qtIUnbfq4j+P8KhXqFBUKeX39sTomw6UzyzfEtEYnO1yKI8hKmT1ReVz+athK
         gVLYxoQ+aLNrd18N8airU53ZqyW6FTkfl05RDJfnjDqB12cAO8AJ3QcGWrtdm7iqyFZ5
         lo3FUz08/SvdiacBgcoA+1a2DcVg+5uIcRNE/6zNAAXYHsjylXJ1Xz1PQeLsaf7kpj3S
         zJDqnQ95G0PLok4FmZVDoYeqIixGSRz49yBZDc2XHmOxColnljBtRnvHI3YblNNTg1wn
         IEBOVV3JGhYTQQE0haP3cwLM+8rTVPbeZagkI3DjSVlJX/5Q1fg1m2WTl6v/o2PFWSVX
         gRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761511882; x=1762116682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0I46qut/pEpEgcaG/IAS0x4XLDBvEc6VpJ5gK983XDI=;
        b=YUZgMD1WSfflzGOWLN2uxHCw59sEZf6sBKMq+vxKL++xDeAJf4ah8xmk8SsJWE7Bsp
         GYbFA6IASnOzhsVNZ6gbBMwcLpvCvMK0xWh4dhjkAEol8ydiT259o+jsOKjirt0jveXv
         XQ6Pk0jsCPnLRRn5bTZ4lb++i3st19H11w0tqJJmkB/yVxJ2pBH85OlKrz2sODlOgoK6
         ZJiaG4kLLzonptQg14zKy16HoTUjav1azYsv8sNydg5sMLSS2eKVotEyFIO3N+iN0Y+I
         X4R+sFV+5Y/RN3hyUOYOawnd4lOtsYGHAsJcKprZVih3kNhMkJADImXSaKA1znLUGAH5
         JwrQ==
X-Gm-Message-State: AOJu0YyoFE949Iw5GSy+NXKST7Pozn6l62/mtJwz/sLzmFfRUB/spCdU
	g8sn8NnLEpG2laoSdjkCcNFSPnlvlPJvsHVYp+opl2CMsFm0U+adMohCER6kvg==
X-Gm-Gg: ASbGncsO4bRqhSZ0Fr1fNGaQruwKygEDym40zeuviAkOEdln+psI0Y9G5E2Ow8eJCBi
	8xKqoC7PHz/IZOrNgPU78JZdY/GvJq4o08H09BvpP3Rp705wqkOnU3bVNkVsPEExcVMacxzvgHJ
	GNtQnfdIjPYN8d+cOs5OOYaTrVkrTVK75ZeX9Vje59JcsCS1UL/2sKRU09Os2SNt4muLgpHzNqA
	XAV0U8AIgk/PiG+6gTlFxLOS2QFmGBXxmaAjXDRh3xV3tKx//9nBkLT1x2esfcpQKLL7Y89oqXf
	jEQf+Gl0NSSltPLpbatswHDY/eqpAqLpiCvz5EUkAurDVxsgggP4CmuuZd+uaKDaTFj/l0pK8T8
	GqZF/vxo7Pfz8ZjRc78uW5eH2xjYl4ohMhkREQUEGD+uwgyO2y3iGnjeEAz36/dt3GBrsQ/BdcA
	==
X-Google-Smtp-Source: AGHT+IHhfnDTF677LOh4PmvBFDXsvWAtEOlvM0jMkf1hlU9Hb8unbbIwLFxpYaDJbQfD8qDcFY5Srg==
X-Received: by 2002:a05:6000:4024:b0:429:91ca:70f1 with SMTP id ffacd0b85a97d-42991ca720fmr6002111f8f.57.1761511882091;
        Sun, 26 Oct 2025 13:51:22 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952da12dsm10484113f8f.29.2025.10.26.13.51.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 13:51:21 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 3/3] nftables: fix ptests
Date: Sun, 26 Oct 2025 21:51:18 +0100
Message-ID: <20251026205118.2439308-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026205118.2439308-1-skandigraun@gmail.com>
References: <20251026205118.2439308-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 26 Oct 2025 20:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121017

Add missing kernel module dependencies, fix a script that is trying to
run python instead of python3, and add a patch that fixes a test (submitted
upstream).

There are 2 notes:
1. For the tests to succeed the kernel must be compiled with CONFIG_NFT_TPROXY
2. There is 1 testcase that seems to be flaky: 0002-persist testcase randomly
   fails. When it is comparing the test output with the expected output, sometimes
   there is a comment present, and sometimes there isn't. Couldn't get to the
   bottom of this.

The second point is the reason why the recipe remains on the
PTESTS_PROBLEMS_META_NETWORKING list.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../0001-fix-typo-in-test-script.patch        | 35 +++++++++++++++++++
 .../recipes-filter/nftables/nftables_1.1.5.bb |  7 +++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch

diff --git a/meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch b/meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch
new file mode 100644
index 0000000000..c0d1e33b5e
--- /dev/null
+++ b/meta-networking/recipes-filter/nftables/nftables/0001-fix-typo-in-test-script.patch
@@ -0,0 +1,35 @@
+From 956e7d89865b497f889483c90bc7fed9bec4e030 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Sun, 26 Oct 2025 18:55:06 +0100
+Subject: [PATCH 1/2] fix typo in test script
+
+While executing the test suite from tests/shell/testcases folder, a lot of errors
+are displayed:
+
+tests/shell/testcases/maps/vmap_timeout: line 48: [: : integer expected
+
+Looking at the script, a non-existing variable (expires) is tested instead of
+the existing one (expire).
+
+This change corrects this.
+
+Upstream-Status: Submitted [https://lore.kernel.org/netfilter-devel/20251026204107.2438565-1-skandigraun@gmail.com/T/#u]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ tests/shell/testcases/maps/vmap_timeout | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/shell/testcases/maps/vmap_timeout b/tests/shell/testcases/maps/vmap_timeout
+index 8ac7e8e7..55d1c1b9 100755
+--- a/tests/shell/testcases/maps/vmap_timeout
++++ b/tests/shell/testcases/maps/vmap_timeout
+@@ -45,7 +45,7 @@ for i in $(seq 1 100) ; do
+ 		expire=$((RANDOM%utimeout))
+ 
+ 		expire_str=""
+-		if [ "$expires" -gt 0 ]; then
++		if [ "$expire" -gt 0 ]; then
+ 			expire_str="expires ${expire}s"
+ 		fi
+ 
diff --git a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
index a1954c0814..a2c6ce0e23 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.1.5.bb
@@ -12,6 +12,7 @@ DEPENDS = "libmnl libnftnl bison-native \
            ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '', 'gmp', d)}"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
+           file://0001-fix-typo-in-test-script.patch \
            file://run-ptest \
           "
 SRC_URI[sha256sum] = "1daf10f322e14fd90a017538aaf2c034d7cc1eb1cc418ded47445d714ea168d4"
@@ -67,6 +68,9 @@ do_install() {
 
 RDEPENDS:${PN}-ptest += " ${PN}-python bash coreutils make iproute2 iputils-ping procps python3-core python3-ctypes python3-json python3-misc sed util-linux"
 
+
+# For ptests compile the kernel with CONFIG_NFT_TPROXY
+
 RRECOMMENDS:${PN}-ptest += "\
 kernel-module-nft-chain-nat     kernel-module-nft-queue \
 kernel-module-nft-compat        kernel-module-nft-quota \
@@ -79,7 +83,7 @@ kernel-module-nft-log           kernel-module-nft-socket \
 kernel-module-nft-masq          kernel-module-nft-synproxy \
 kernel-module-nft-nat           kernel-module-nft-tunnel \
 kernel-module-nft-numgen        kernel-module-nft-xfrm \
-kernel-module-nft-osf \
+kernel-module-nft-osf           kernel-module-nft-tproxy \
 kernel-module-nf-flow-table \
 kernel-module-nf-flow-table-inet \
 kernel-module-nf-nat \
@@ -102,6 +106,7 @@ do_install_ptest() {
     cp -rf ${S}/${TESTDIR} ${D}${PTEST_PATH}/${TESTDIR}
     sed -i 's#/usr/bin/python#/usr/bin/python3#' ${D}${PTEST_PATH}/${TESTDIR}/json_echo/run-test.py
     sed -i 's#/usr/bin/env python#/usr/bin/env python3#' ${D}${PTEST_PATH}/${TESTDIR}/py/nft-test.py
+    sed -i 's#exec python -c#exec python3 -c#' ${D}${PTEST_PATH}/${TESTDIR}/shell/helpers/json-pretty.sh
     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }

