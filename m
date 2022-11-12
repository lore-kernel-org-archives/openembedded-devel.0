Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7787CC4332F
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 13:10:09 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.2428.1668258598894966700
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 05:09:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Ya4X7Qfk;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668258599;
  x=1699794599;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GExqrVlewYfDcfkSbKZUDm7lFhPM9MOE/nSJm44sWXU=;
  b=Ya4X7QfkuGD7Ua3qCcFGD8HQQ4iqCHPuQOTNw33CDQdA7GnIOTbiYfix
   SQ3QDW0yBgmW+/BxPElYIIF48qmnM1y7AvfoXOmHFB3DATCtpxC6w+ZAX
   cT5+oeg7Lvldq40cAOXLsPoy7mcWKQuQpp4yvMIfhv8OAQ2nsFNSwKmOM
   2eaAXljGDPIn43zxkuPfGYl/JFByE5Wsg+N6JsiKf9KisVFeAsdezQS5+
   MV1DFxKu7qt2I2SzD80Utp02I7dv7NqBXPJTvqgp59BxHaNoLDApjxi6K
   C0lVfi3SDDotxsBsXOgsOD8+Ao6X/i34fXoLXkeJVByeAkJqYOASmVfO9
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][langdale][PATCH 1/2] chrony: Make it possible to enable editline support again
Date: Sat, 12 Nov 2022 14:09:51 +0100
Message-ID: <20221112130952.2260933-1-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 13:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99562

Support for readline was dropped in Chrony 4.2. However, the
--disable-readline option still remains (it is used to completely ignore
all forms of command line editing, even though the only remaining
variant is editline). So keeping the readline PACKAGECONFIG and making
it pass --disable-readline when it is not enabled disabled support for
editline, and if it was enabled it instead passed --without-editline,
which also disabled support for editline. Thus there was no way to
enable editline support.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../recipes-support/chrony/chrony_4.3.bb            | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index d0e2c4b54..dad09f826 100644
--- a/meta-networking/recipes-support/chrony/chrony_4.3.bb
+++ b/meta-networking/recipes-support/chrony/chrony_4.3.bb
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
-PACKAGECONFIG[readline] = "--without-editline,--disable-readline,readline"
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
 

