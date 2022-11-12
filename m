Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A8BC43217
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 13:10:39 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.2324.1668258634190410906
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 05:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jH0AqCTv;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668258635;
  x=1699794635;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=75fbKO+G589kv9KkJGoJihmBduI2r5maVYIyCa73SSc=;
  b=jH0AqCTvapGJXoFPVVb7F4ImoV+oeeA7mmMPn29lL32rdN6ufGwCQ5P8
   XKstz3di1T848FUc9NMQyC1HX2Zas+lFqCsE6Gq+gkGAHvwD/VQ7sPb+N
   296vSgXaPTo/Bgu6eu1zwFeb9cK4aUoTlGKF4G8yNgB/nq54C0rLSBsL/
   jxwLY7vKCrF11QRMfLgaldFrdGAZSiQcOnkpXURsd0sDDAZBChLjJPFKk
   eNSiV3R9RhSbvEaaPuA92aAQECyvpqB28uzJDywHchfcJGQGcuGu71AnR
   XwBggddRAnYCRmHzi5UMK2Bn1IH2cg+ZzI53b/eOwAMjxsvKljZLRgD2L
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][kirkstone][PATCH 1/2] chrony: Remove the readline PACKAGECONFIG
Date: Sat, 12 Nov 2022 14:10:27 +0100
Message-ID: <20221112131028.2261126-1-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 13:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99565

Support for readline was dropped in Chrony 4.2. Enabling the readline
PACKAGECONFIG would result in no suppport for command line editing as
only editline is supported and it would be disabled.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

This is similar to the corresponding patches for Langdale and master.
However, since the readline config in Kirkstone didn't break editline,
the commit message is different.

 .../recipes-support/chrony/chrony_4.2.bb            | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.2.bb b/meta-networking/recipes-support/chrony/chrony_4.2.bb
index 8ce9e1db5..dfa1ed86f 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.2.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.2.bb
@@ -53,14 +53,6 @@ USERADD_PACKAGES = "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '${PN}', '
 USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--system -d / -M --shell /bin/nologin chronyd;', '', d)}"
 
 # Configuration options:
-# - For command line editing support in chronyc, you may specify either
-#   'editline' or 'readline' but not both.  editline is smaller, but
-#   many systems already have readline for other purposes so you might want
-#   to choose that instead.  However, beware license incompatibility
-#   since chrony is GPLv2 and readline versions after 6.0 are GPLv3+.
-#   You can of course choose neither, but if you're that tight on space
-#   consider dropping chronyc entirely (you can use it remotely with
-#   appropriate chrony.conf options).
 # - Security-related:
 #   - 'sechash' is omitted by default because it pulls in nss which is huge.
 #   - 'privdrop' allows chronyd to run as non-root; would need changes to
@@ -70,7 +62,6 @@ USERADD_PARAM:${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'privdrop', '--sys
 PACKAGECONFIG ??= "editline \
     ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
-PACKAGECONFIG[readline] = "--without-editline,--without-readline,readline"
 PACKAGECONFIG[editline] = ",--without-editline,libedit"
 PACKAGECONFIG[sechash] = "--without-tomcrypt,--disable-sechash,nss"
 PACKAGECONFIG[privdrop] = "--with-libcap,--disable-privdrop --without-libcap,libcap"
@@ -79,6 +70,10 @@ PACKAGECONFIG[ipv6] = ",--disable-ipv6,"
 PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 
+# This is left for backwards compatibility, to avoid breaking existing
+# configurations.
+PACKAGECONFIG[readline] = ""
+
 # --disable-static isn't supported by chrony's configure script.
 DISABLE_STATIC = ""
 

