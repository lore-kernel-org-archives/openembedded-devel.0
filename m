Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E133BC19F2E
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9143.1740585030653832709
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44774FEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:46 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02BFF3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 07/23] zsh: modernise autoconf use
Date: Wed, 26 Feb 2025 15:50:04 +0000
Message-ID: <20250226155022.1989209-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115659

No need to manually write do_configure, the config.h.in is generated
with autoheader so don't disable that, but disable aclocal as that file
is hand-maintained.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.bb | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.bb b/meta-oe/recipes-shel=
ls/zsh/zsh_5.9.bb
index b0961fd789..dd960856e0 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
@@ -15,6 +15,8 @@ SRC_URI[sha256sum] =3D "9b8d1ecedd5b5e81fbf1918e876752a=
7dd948e05c1a0dba10ab863842d
=20
 inherit autotools gettext update-alternatives manpages
=20
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
+
 EXTRA_OECONF =3D " \
     --bindir=3D${base_bindir} \
     --enable-etcdir=3D${sysconfdir} \
@@ -39,16 +41,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
 ALTERNATIVE_PRIORITY =3D "90"
=20
-export AUTOHEADER =3D "true"
-
 # Needed for manpages.bbclass, but they're always installed
 PACKAGECONFIG[manpages] =3D ""
=20
-do_configure () {
-    gnu-configize --force ${S}
-    oe_runconf
-}
-
 do_install:append() {
     sed -i -e '1!b; s:^#!.*[ /]zsh:#!${bindir}/zsh:; s#/usr/local/bin#${=
bindir}#;' \
         `find ${D}/usr/share/zsh/${PV}/functions -type f`
--=20
2.43.0


