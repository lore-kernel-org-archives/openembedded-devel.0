Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5429EC282C1
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9155.1740585039126991469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8AE41516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:54 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 70DB03F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:38 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 20/23] tk: exclude aclocal so existing macros are used
Date: Wed, 26 Feb 2025 15:50:17 +0000
Message-ID: <20250226155022.1989209-20-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115672

This package has hand-coded aclocal.m4 so ensure that we don't run
aclocal.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb b/meta-oe/recipes=
-devtools/tcltk/tk_9.0.1.bb
index 6cf1eecad1..b898e047b0 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_9.0.1.bb
@@ -35,6 +35,7 @@ LDFLAGS +=3D "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
 inherit autotools features_check pkgconfig
=20
 AUTOTOOLS_SCRIPT_PATH =3D "${S}/unix"
+EXTRA_AUTORECONF +=3D "--exclude=3Daclocal"
=20
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES =3D "x11"
--=20
2.43.0


