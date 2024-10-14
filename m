Return-Path: <andrej.v@skyrain.eu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3645FCFC500
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 07:49:13 +0000 (UTC)
Received: from h4.cmg2.smtp.forpsi.com (h4.cmg2.smtp.forpsi.com [185.129.138.189])
 by mx.groups.io with SMTP id smtpd.web11.49521.1728892145360938552
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 00:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skyrain.eu header.s=f2022 header.b=O3YvTwAz;
 spf=none, err=permanent DNS error (domain: skyrain.eu, ip: 185.129.138.189, mailfrom: andrej.v@skyrain.eu)
Received: from lt-aval.. ([62.197.243.174])
	by cmgsmtp with ESMTPSA
	id 0Foyt67NYTNCy0Fp8tw4Uo; Mon, 14 Oct 2024 09:49:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skyrain.eu; s=f2022;
	t=1728892143; bh=8uZutYm6E+VQ5AulHYJ06KPcErUrH0nDeSzYllPb+B8=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=O3YvTwAzdMxxDfsXC3axl+PDRrn+kzfLl/FKJ+2KwsLw5buZ+lMNlxgZiBVSQzP01
	 leAU/t4si7sm/u8Rb9r/NfuqwW5VaJgPk8PgSTuYBjLeIaJdnQgdA83iWUkwuZUsi6
	 /BClywe/xUYoIR7kXEztmjHL2RIkBKpCoFFXvyCISGEAdu38tNc8qlIkMEnbIwsAV4
	 IVmP5RR4+SyqIDFa/PtSBtHQ6+cPqtFSnEuHsRJFBzrEOY6zCMMlS61bnIVEBp7BNj
	 pGKoVjc+54r24Z1rsMNxRc2IzLafJYVSXOWk37wC48KgxWRbOt5nOhyjZWZr6bNvoP
	 wNfl6lVxwtzbA==
From: Andrej Valek <andrej.v@skyrain.eu>
To: openembedded-devel@lists.openembedded.org
Cc: Andrej Valek <andrej.v@skyrain.eu>
Subject: [oe][meta-oe][scarthgap][PATCH] externalsrc: fix support in various components
Date: Mon, 14 Oct 2024 09:48:48 +0200
Message-Id: <20241014074848.268438-1-andrej.v@skyrain.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfDP7iNeJGXoC7IL8xlbUQe7qoK44EEdiQNGzoFcS48gogsQhwH60+yKadIH+bar16kOVZW+SasFTCdiqWNq8EkWgQOpH2kV8lVBFophhQRdwTL3AECQh
 JoLMfY46Gn5DgKmYCNdBJPscEPb+h5+4FTozZ5ivdTPF5aA1Us7IT6/JY48zOi8HnVlMHY1L0vLxOIpui71dEEbGdK3u81vGsEvJUqnmCqeQ83M3SQKRk3+f
 ryW0eJA/a+DWmbjJ9YiJ9g==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 07:49:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112849

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


