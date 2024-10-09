Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19934CF0454
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 11:16:00 +0000 (UTC)
Received: from h3.cmg1.smtp.forpsi.com (h3.cmg1.smtp.forpsi.com [185.129.138.162])
 by mx.groups.io with SMTP id smtpd.web10.13741.1728472557251835175
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Oct 2024 04:15:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=K2Jd7fmy;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.162, mailfrom: andrej.v@skyrain.eu)
Received: from lt-aval.. ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id yUfDsjQXpeqGtyUfasycPT; Wed, 09 Oct 2024 13:15:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1728472555; bh=8uZutYm6E+VQ5AulHYJ06KPcErUrH0nDeSzYllPb+B8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=K2Jd7fmyqpQau543L5N3riIXoEuIM7ukExd9MnFRxhpV2uqBMPRXZNijldl8+qKx4
	 mcASmkeaCH21y0R9Ii8ywmFNdpnLDIBQJFIaKWYQRSApieXVsT47jOb7dd+GJohQvF
	 egli3SOiFVP2+UNFIlmvajdj8sstBqEYCm9H2+2V+4GnZ0QvnYDOCyv6Ho4qGOu07k
	 +eufBZxkTAsmhTuXX6Af4gb5tMYoOhJE5qwewaSxKG1B+3vuYKI1MrngSNBgk2Th2c
	 7QcWiKDZoCRwX4J7Rk4yTvf4DKmwj0ttQzGGW/zl3p+bKKvnWflu8MaFDShdNOK2Ry
	 Pb/t7MOAPay3g==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe][meta-oe][PATCH] externalsrc: fix support in various components
Date: Wed,  9 Oct 2024 13:15:16 +0200
Message-Id: <20241009111516.352095-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfFwFANyv8IqDzCXO5742G+Yk0LMx6CK2ljCgCqieF71L6jYtEmc89ukGhuVloZyrc2udPgcaz7if/TWSJuxrTBkwcrhHrbxeC/bCBrjqtj+RvGtJ2PRS
 grFu3kLgfMxHQ2tn9vpEKTuu3wBazA0YWPdFcEjcwJCRvtglP49hoMTPlz5r5EXvF5rJEkPdKRU4j/1PbPJUJzhA20OH5kRrstB8WcGmx0ToejfhCXsDCm/x
 HKMUquyZ4uGmnxjGmnfYsA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Oct 2024 11:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112725

Affected components:
 - cpupower
 - intel-speed-select
 - spidev-test

When the externalsrc class is used the tasks listed in SRCTREECOVEREDTASKS
are deleted to prevent them being executed. If externalsrc is used for
the kernel then this will include virtual/kernel:do_patch.

Signed-off-by: Andrej Valek <andrej.v@skyrain.eu>
---
 meta-oe/recipes-kernel/cpupower/cpupower.bb                     | 2 +-
 meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb | 2 +-
 meta-oe/recipes-kernel/spidev-test/spidev-test.bb               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-kernel/cpupower/cpupower.bb b/meta-oe/recipes-kernel/cpupower/cpupower.bb
index 18e363805..453ebe8c7 100644
--- a/meta-oe/recipes-kernel/cpupower/cpupower.bb
+++ b/meta-oe/recipes-kernel/cpupower/cpupower.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/cpupower"
 
 inherit kernelsrc kernel-arch bash-completion
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 EXTRA_OEMAKE = "-C ${S}/tools/power/cpupower O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
 
diff --git a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
index 23ea0d8aa..3b5866180 100644
--- a/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
+++ b/meta-oe/recipes-kernel/intel-speed-select/intel-speed-select.bb
@@ -13,7 +13,7 @@ COMPATIBLE_HOST:libc-musl = 'null'
 
 DEPENDS = "libnl"
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 B = "${WORKDIR}/${BPN}-${PV}"
 
diff --git a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
index 2e8c5cbb8..7b87dd28d 100644
--- a/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
+++ b/meta-oe/recipes-kernel/spidev-test/spidev-test.bb
@@ -6,7 +6,7 @@ PROVIDES = "virtual/spidev-test"
 
 inherit bash-completion kernelsrc kernel-arch
 
-do_populate_lic[depends] += "virtual/kernel:do_patch"
+do_populate_lic[depends] += "virtual/kernel:do_shared_workdir"
 
 EXTRA_OEMAKE = "-C ${S}/tools/spi O=${B} CROSS=${TARGET_PREFIX} CC="${CC}" LD="${LD}" AR=${AR} ARCH=${ARCH}"
 
-- 
2.34.1


