Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36541C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 18:27:07 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.957.1654712819641654757
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jun 2022 11:27:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Xr3le14L;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1654712820;
  x=1686248820;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QNGwv6x2QYGgMWceeY0RNOXYlNLDf4K6sEwC9ZZfaoQ=;
  b=Xr3le14LfBJffyHTXGUVkI5gVFvi1DJqs4F8QveOpZ6UHKDXn4EyOaCj
   KXgV2pz+a+xCrht/YY9XuW5wKDQJsIG8byRJLgArToFMAq6SD1LIKO6J5
   xPAV4OhW37E4BrVvGmWaYuIbLwmV90UJoh+ky2l79TgdHA7SAYwqmyIHm
   VA1TL+M9Mqx6lOS8t3L0KxVDVQkgl7NNEjcoMOKO4flcSwju2RcREGtZS
   yhLB/ZICJA0UnwJ8pHJ5aGdh76/1qpWDRdTpjvzC/2oBXrxW4UZSO1nBL
   jI/KK/fvQrUfIx2lze5s52ILe8y9rHIbWYhklklkLrE5XuMuDvEGmO1IG
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] cryptsetup: Add support for building without SSH
 tokens
Date: Wed, 8 Jun 2022 20:26:54 +0200
Message-ID: <20220608182655.10267-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jun 2022 18:27:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97446

Cryptsetup SSH tokens is the only feature that has a dependency on
libssh. Add a packageconfig to control this dependency.

Change-Id: Iac4f91e099ad2e3a79aab183734108f8bfbff57f
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb    | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 435b55477..652fd6661 100644
--- a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
+++ b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
@@ -14,7 +14,6 @@ DEPENDS = " \
     libdevmapper \
     popt \
     util-linux-libuuid \
-    libssh \
 "
 
 DEPENDS:append:libc-musl = " argp-standalone"
@@ -39,6 +38,7 @@ PACKAGECONFIG ??= " \
     blkid \
     luks-adjust-xts-keysize \
     openssl \
+    ssh-token \
 "
 PACKAGECONFIG:append:class-target = " \
     udev \
@@ -69,7 +69,7 @@ PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
 PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
 PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
 PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
-
+PACKAGECONFIG[ssh-token] = "--enable-ssh-token,--disable-ssh-token,libssh"
 
 EXTRA_OECONF = "--enable-static"
 # Building without largefile is not supported by upstream
@@ -90,6 +90,14 @@ EXTRA_OECONF += "--with-luks2-pbkdf=${LUKS2_PBKDF} \
     --with-luks2-parallel-threads=${LUKS2_PARALLEL_THREADS} \
     --with-luks2-iter-time=${LUKS2_ITERTIME}"
 
+do_install:append() {
+    # The /usr/lib/cryptsetup directory is always created, even when ssh-token
+    # is disabled. In that case it is empty and causes a packaging error. Since
+    # there is no reason to distribute the empty directory, the easiest solution
+    # is to remove it if it is empty.
+    rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/${BPN}
+}
+
 FILES:${PN} += "${@bb.utils.contains('DISTRO_FEATURES','systemd','${exec_prefix}/lib/tmpfiles.d/cryptsetup.conf', '', d)}"
 
 RDEPENDS:${PN} = " \

