Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4909BC19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 14:18:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.12610.1660054680356715460
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Aug 2022 07:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QyhLrSGK;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1660054680;
  x=1691590680;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ts0KMF+DFqUDA8K2F6BOg22jYe0Snta17KsNKsgX/+o=;
  b=QyhLrSGKhmXS09u/jsO8inlmls3BKvYNmtUsLUdhPz2pXpcxWUyxZoaK
   q3Ckj+lBCUjAeDH6jJo4n5tXPHhrY+7oi4+NqPFR4NrRYiU/7vxWm6GWL
   aS5mvDDF0yjDzm0H+AXG7E1sH5T3o/cbNiRBReNu66Ad7TwJKMKYqPg1X
   zD+rsyqNr3vrz03IRVi/WxzTuL7i5Je+a3QGiOfaTmK7wnIkAEUM6xRws
   XFefEo2U1ACJAHPwijHL7GAGc4yh6l6rrnoNo2bSEi109F4FIf/s3NgXB
   o/BJF2sAfQ97Y2gVRDKjm8KRjJHgDT4vHfrsXWU+/EnO+7GEcVgn/6cEc
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: Armin Kuster <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][kirkstone][PATCH 2/2] cryptsetup: Add support for building
 without SSH tokens
Date: Tue, 9 Aug 2022 16:17:29 +0200
Message-ID: <20220809141729.18587-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220809141729.18587-1-pkj@axis.com>
References: <20220809141729.18587-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Aug 2022 14:18:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98181

Cryptsetup SSH tokens is the only feature that has a dependency on
libssh. Add a packageconfig to control this dependency.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb b/meta-oe/recipes-crypto/cryptsetup/cryptsetup_2.4.3.bb
index 8f9f663a3..4f8bbf035 100644
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
@@ -69,6 +69,7 @@ PACKAGECONFIG[nss] = "--with-crypto_backend=nss,,nss"
 PACKAGECONFIG[kernel] = "--with-crypto_backend=kernel"
 PACKAGECONFIG[nettle] = "--with-crypto_backend=nettle,,nettle"
 PACKAGECONFIG[luks2] = "--with-default-luks-format=LUKS2,--with-default-luks-format=LUKS1"
+PACKAGECONFIG[ssh-token] = "--enable-ssh-token,--disable-ssh-token,libssh"
 
 EXTRA_OECONF = "--enable-static"
 # Building without largefile is not supported by upstream
@@ -78,6 +79,14 @@ EXTRA_OECONF += "--disable-static-cryptsetup"
 # There's no recipe for libargon2 yet
 EXTRA_OECONF += "--disable-libargon2"
 
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

