Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C7CC47F2E8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 13:30:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46K3Pz6yZ1z2Y
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2019 15:30:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1567085416;
	bh=xIJVF4XpTGAw2B+v9BJQIsfke6Va/tsWIJBM0S9ldtg=;
	h=From:To:Subject:Date:From;
	b=OEU3RUioudgS5i4ldk0Dzc308r+auPRwt9bnB4C2WK0x0VeBXLyt+XRV5v1/IDDjQ
	Ah1SpRi5SvvMCSSpigPDSBHmT+bZXLS36ER/T55Zm5kIgJi6+NSnZzlQd+Wip+nO1o
	F/FW9c5/gs7SA3ds8+WV4dx1pyza///c2HlFQMWQucmNH8XzRUxAPwzEt4MXU3lF/S
	TSldnycrESnjqFzL1pdm+FJhYHRiKrDtwYTdi0HSwqmmKLi7bhReDuUmOZaQxoOFLa
	nSIDQ8qAQwrB3p7X2EOrhA1mf/zp9EmDwMfk1QjLK/taY83LEO9qKYje6elgjwmvtr
	IbptQLVmbuhvZDOns+jR1nUzB6CIKSZ9rBYpSroZK1BY1FCL3HvSPicUb65x9yzqOZ
	Slw7PfmvEj8Tev9gV6SEuwn3d7+D0z2PtY7dOhuo1GC2xDwQ2M27g0C8DJxyCMbEua
	A8iA55oPx/eVZ0t7ZeO4dQYCgrp2/hMTWcybETZMSS4a5zUnPJhQ3JuN9l9uYUatMl
	FT3c5nqmkr6sisHwi8CZzQAqp9x0x+lA7g7n9Mu5kOhoV78momGosYKgLi6Uk7Vcpy
	Jaksz0LhB0Bdd5kO4VXDyXWZsW6Mz4d9rj8mm3OvDYlD70SITdQpAVXdyzHeHkxoWy
	na8Wr9YTxAeTsxw2TdYlNfwg=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2019 16:30:15 +0300
Message-Id: <20190829133015.29574-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] Adapt to the lsb -> lsb-release change in OE-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2019 13:30:17 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta-oe/conf/layer.conf                                         | 2 +-
 .../phoronix-test-suite/phoronix-test-suite_8.8.1.bb            | 2 +-
 meta-oe/recipes-security/keyutils/keyutils_1.6.bb               | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 4ddef29a3..896a5d6f8 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -49,7 +49,7 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   phoronix-test-suite->bash \
   phoronix-test-suite->python \
   phoronix-test-suite->php \
-  phoronix-test-suite->lsb \
+  phoronix-test-suite->lsb-release \
   phoronix-test-suite->util-linux \
   phoronix-test-suite->busybox \
 "
diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
index 873384496..c4df1a90b 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.8.1.bb
@@ -29,7 +29,7 @@ do_install() {
 SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
 
-RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release lsb"
+RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release lsb-release"
 
 FILES_${PN} += " \
     ${datadir}/phoronix-test-suite \
diff --git a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
index 4d3a96f29..dca86f3c6 100644
--- a/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
+++ b/meta-oe/recipes-security/keyutils/keyutils_1.6.bb
@@ -46,7 +46,7 @@ do_install_ptest () {
 }
 
 
-RDEPENDS_${PN}-ptest += "lsb"
+RDEPENDS_${PN}-ptest += "lsb-release"
 RDEPENDS_${PN}-ptest_append_libc-glibc = " glibc-utils"
 RDEPENDS_${PN}-ptest_append_libc-musl = " musl-utils"
 
-- 
2.17.1


