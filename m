Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70351C282C4
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9156.1740585040470126690
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 187A61516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:56 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C2D163F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:39 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 22/23] cgdb: fix autoreconf
Date: Wed, 26 Feb 2025 15:50:19 +0000
Message-ID: <20250226155022.1989209-22-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115674

autoreconf needs to be told where to find macros as the Makefile.am does
not do this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb b/meta-oe/recipe=
s-devtools/cgdb/cgdb_0.8.0.bb
index 922dfc7763..fbd3618b4f 100644
--- a/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
+++ b/meta-oe/recipes-devtools/cgdb/cgdb_0.8.0.bb
@@ -13,6 +13,8 @@ SRC_URI =3D "http://cgdb.me/files/${BP}.tar.gz \
            file://0001-cgdb-Do-not-search-for-cgdb.txt-in-build-dir.patc=
h"
 SRC_URI[sha256sum] =3D "0d38b524d377257b106bad6d856d8ae3304140e1ee240853=
43e6ddf1b65811f1"
=20
+EXTRA_AUTORECONF +=3D "-I config"
+
 CACHED_CONFIGUREVARS =3D "ac_cv_file__dev_ptmx=3Dyes ac_cv_rl_version=3D=
6.2 ac_cv_file__proc_self_status=3Dyes"
 EXTRA_OECONF =3D "--with-readline=3D${STAGING_LIBDIR} \
     --with-ncurses=3D${STAGING_LIBDIR}"
--=20
2.43.0


