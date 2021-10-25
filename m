Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE28C433EF
	for <webhook@archiver.kernel.org>; Mon, 25 Oct 2021 14:37:57 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.3])
 by mx.groups.io with SMTP id smtpd.web10.32948.1635172676633476023
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 07:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tFuREOC5;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.3,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1635172674; i=@fujitsu.com;
	bh=6yNhmgAiB4PTUENHBj0ar+/VmIl2N6xp+5uHE7TefSM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tFuREOC5QOo1PuNZ2Hni079bg4xnJ5xKnbSO6hFhOehGNrIm3zxwX7SKJwtkTddME
	 KqxmfI/6S5zbvbJgRvIbrpEYlmGI3zcwpEyps6tBymi19EBB1QdEmhRIf5w2hTdMZC
	 Nd7S2aFNEkfIAXcnb5QHSU/PuQAflzmGDwNSokpBGJZT4NqIa/CsSt9DSHpWqP6Ag5
	 O0QNKPyUo4YOCgvYRcGkxmFlGP8qvaShCVhhsRbDI1TTK3T776NYtF6rogwPbE/EwP
	 KP852GSw8s74WXmKKCcDZqnzSy68OPVSR9928arEcmkHJffcAa4JDpfULIFB+M3rCc
	 v5w4hBewZxRgA==
Received: from [100.112.195.206] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.symcld.net id 18/A0-17143-241C6716;
 Mon, 25 Oct 2021 14:37:54 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrAIsWRWlGSWpSXmKPExsViZ8ORqOt0sCz
  RYOM/RouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPyzZSC7ZIVOz++YWtgfCzaxcjFISTwhFHi
  9IejbBDOBSaJp7PWskI4Jxglrk5tYOpi5ORgE1CTmH7rBiuILSKgL7F09h5mEJtZQEXixe8ed
  hBbWMBJonH+BUYQm0VAVeLVzyNgcV6geN++V2D1EgIKElMevmeGiAtKnJz5hAVijoTEwRcvoG
  oUJWZfbmaBsCskZs1qY4Kw1SSuntvEPIGRfxaS9llI2hcwMq1itEgqykzPKMlNzMzRNTQw0DU
  0NNI1tDTWNTI20Uus0k3USy3VLU8tLtE11EssL9YrrsxNzknRy0st2cQIDMiUgoOvdjCufPNB
  7xCjJAeTkijvmflliUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeLftBcoJFqWmp1akZeYAowMmL
  cHBoyTCe2oPUJq3uCAxtzgzHSJ1ilFRSpxX5QBQQgAkkVGaB9cGi8hLjLJSwryMDAwMQjwFqU
  W5mSWo8q8YxTkYlYR5y0Gm8GTmlcBNfwW0mAlosZ9uCcjikkSElFQD03bu+25BBmnX78ut+lo
  sJP3JKNeA6c7Jzvc1XTrHNTgez7C85l1Vw91UmpS88EHDDPlZ328J/Y4I2sVp2f6t/F9uIuOM
  oz6zkicvc1LJLXNTqZ9aunXHQc0Xrzndcx9f5337+kP4z8NLkuT/+i5af251drrJfZcd3p8NL
  x43+vtDIGLrk+/3Q49N1VEs/H/Si98n8f3uCA+rG5/9mPbrN+Y8M+N89+ei6BMlHfYsP1bmJx
  pqPZ7nbjJ2dn+tVhAKfeG/MuLbgs/Kiv+S5k3Zydq75V/9mxuKmz6/9Fzn7fru2IPoZUcW/GQ
  3Sp7ZKa8trbVxiX5b74bj31e9/sRxpTxK/iPjU5231lPEfu411FRiKc5INNRiLipOBADgTOU5
  QwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-265.messagelabs.com!1635172673!1506028!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27296 invoked from network); 25 Oct 2021 14:37:54 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Oct 2021 14:37:54 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 91F6610022D
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:37:53 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 85D9D100225
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Oct 2021 15:37:53 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 25 Oct 2021 15:37:32 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] cryptsetup: upgrade 2.3.6 -> 2.4.1
Date: Mon, 25 Oct 2021 22:37:20 +0800
Message-ID: <1635172640-18457-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Oct 2021 14:37:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93563

Cryptsetup 2.4.1 Release Notes
==============================
Stable bug-fix release with minor extensions.

All users of cryptsetup 2.4.0 should upgrade to this version.

Changes since version 2.4.0
~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Fix compilation for libc implementations without dlvsym().

  Some alternative libc implementations (like musl) do not provide
  versioned symbols dlvsym function. Code now fallbacks to dlsym
  operation for dynamic LUKS2 token load.
  It is up to maintainers to ensure that LUKS2 token plugins are
  compiled for the supported version.

* Fix compilation and tests on systems with non-standard libraries
  (standalone argp library, external gettext library, BusyBox
  implementations of standard tools).

* Try to workaround some issues on systems without udev support.
  NOTE: non-udev systems cannot provide all functionality for kernel
  device-mapper, and some operations can fail.

* Fixes for OpenSSL3 crypto backend (including FIPS mode).
  Because cryptsetup still requires some hash functions implemented
  in OpenSSL3 legacy provider, crypto backend now uses its library
  context and tries to load both default and legacy OpenSSL3 providers.

  If FIPS mode is detected, no library context is used, and it is up
  to the OpenSSL system-wide policy to load proper providers.

  NOTE: We still use some deprecated API in the OpenSSL3 backend,
  and there are some known problems in OpenSSL 3.0.0.

* Print error message when assigning a token to an inactive keyslot.

* Fix offset bug in LUKS2 encryption code if --offset option was used.

* Do not allow LUKS2 decryption for devices with data offset.
  Such devices cannot be used after decryption.

* Fix LUKS1 cryptsetup repair command for some specific problems.
  Repair code can now fix wrongly used initialization vector
  specification in ECB mode (that is insecure anyway!) and repair
  the upper-case hash specification in the LUKS1 header.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{cryptsetup_2.3.6.bb => cryptsetup_2.4.1.bb}           | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-crypto/cryptsetup/{cryptsetup_2.3.6.bb => cryptsetup_2.4.1.bb} (95%)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.1.bb
similarity index 95%
rename from meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
rename to meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.1.bb
index 806a05e8f2..7f7c350a63 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.3.6.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.1.bb
@@ -14,11 +14,14 @@ DEPENDS = " \
     libdevmapper \
     popt \
     util-linux-libuuid \
+    libssh \
 "
 
+DEPENDS:append:libc-musl = " argp-standalone"
+LDFLAGS:append:libc-musl = " -largp"
+
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}/${BP}.tar.xz"
-SRC_URI[md5sum] = "504d1ab22cbc4d1a59a8d8c7ee5ed3bf"
-SRC_URI[sha256sum] = "b296b7a21ea576c2b180611ccb19d06aec8dddaedf7c704b0c6a81210c25635f"
+SRC_URI[sha256sum] = "a356a727a83a464ade566e95239622a22dbe4e0f482b198fdb04ab0d3a5a9c5f"
 
 inherit autotools gettext pkgconfig
 
-- 
2.25.1


