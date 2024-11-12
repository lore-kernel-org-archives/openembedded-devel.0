Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E6EED42BBB
	for <webhook@archiver.kernel.org>; Tue, 12 Nov 2024 17:46:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.92617.1731433562533975621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Nov 2024 09:46:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DB9725E0
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 09:46:32 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B35B33F59E
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 09:46:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] tk: tk 8 needs tcl 8
Date: Tue, 12 Nov 2024 17:45:55 +0000
Message-Id: <20241112174555.1525173-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112174555.1525173-1-ross.burton@arm.com>
References: <20241112174555.1525173-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Nov 2024 17:46:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113798

oe-core now has Tcl 9, so Tk 8 needs to depend on tcl8 until we've
upgraded tk to v9.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb b/meta-oe/recipe=
s-devtools/tcltk/tk_8.6.15.bb
index 1438a05625..ddd7043c0a 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.15.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM =3D "file://license.terms;md5=3Dc88f99=
decec11afa967ad33d314f87fe \
     file://xlib/license.terms;md5=3Dc88f99decec11afa967ad33d314f87fe \
 "
=20
-DEPENDS =3D "tcl virtual/libx11 libxt"
+DEPENDS =3D "tcl8 virtual/libx11 libxt"
=20
 SRC_URI =3D "\
     ${SOURCEFORGE_MIRROR}/tcl/${BPN}${PV}-src.tar.gz \
--=20
2.34.1


