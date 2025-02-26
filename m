Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5F1FC19F32
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9141.1740585030017523899
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BD4CFEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:45 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5318E3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:29 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 06/23] zsh: enable out-of-tree builds
Date: Wed, 26 Feb 2025 15:50:03 +0000
Message-ID: <20250226155022.1989209-6-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115658

This appears to work, so use it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.bb b/meta-oe/recipes-shel=
ls/zsh/zsh_5.9.bb
index e867926f79..b0961fd789 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
@@ -13,7 +13,7 @@ DEPENDS =3D "ncurses bison-native libcap libpcre gdbm g=
roff-native"
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
 SRC_URI[sha256sum] =3D "9b8d1ecedd5b5e81fbf1918e876752a7dd948e05c1a0dba1=
0ab863842d45acd5"
=20
-inherit autotools-brokensep gettext update-alternatives manpages
+inherit autotools gettext update-alternatives manpages
=20
 EXTRA_OECONF =3D " \
     --bindir=3D${base_bindir} \
--=20
2.43.0


