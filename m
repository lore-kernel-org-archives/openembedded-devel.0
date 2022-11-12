Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685D5C43217
	for <webhook@archiver.kernel.org>; Sat, 12 Nov 2022 12:59:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.2339.1668257986314669791
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Nov 2022 04:59:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=PMEV8Tmu;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1668257988;
  x=1699793988;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZLdBflKdrN2dRaFbgroc6J1OpnAAXRBy6fP2US2b+gA=;
  b=PMEV8Tmu3ML970c6IW6xcCbZ48qLRmO2kCcUIzrtsK2dyjtSG4eRzkDa
   jyR+Zx6xwybXpm3U4g8sS7TLrxpula0sTYw7edFeAbbilkBUFc7rL83Oq
   g1jDHPV/5LqACH1m086bbR11WxZPG6ePZkg5zh6XLl/7PGdybxLXdDyaB
   WlfkTTfHru0WgrNWfxb72QY9Ram3HxeEE5+vdBiIYZA47/g/GJzlTJg5H
   HfMVyD3LRG8EFP0Ig3QElR+Ujd498XvZLrbSXT5CFoOjnrNRhGJVdN8fV
   MHO0bVgARsTKbwu+W0DHN4Cpf+P3RYZB2pEZYE7wFO2xHZJVxMteThT2w
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH 1/2] chrony: Make it possible to enable editline support again
Date: Sat, 12 Nov 2022 13:59:38 +0100
Message-ID: <20221112125939.2258996-1-pkj@axis.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Nov 2022 12:59:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99561

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
 meta-networking/recipes-support/chrony/chrony_4.3.bb | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-networking/recipes-support/chrony/chrony_4.3.bb b/meta-networking/recipes-support/chrony/chrony_4.3.bb
index d0e2c4b54..b09a58b08 100644
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

