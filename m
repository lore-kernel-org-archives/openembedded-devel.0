Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FFEFC55174
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 19:15:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3553.1785525327672731449
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Jul 2026 12:15:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=p94Dsulb;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23015152B
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:15:23 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8D4F3F66F
	for <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 12:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785525327; bh=pZRRhDasAMMj7UJ+vSVyHwrOZPwemjtr7QGhBKgx2fg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p94Dsulbe1vvqyygA/6X2D3GK7DdMcRIoOBagc+toV6ypjLyCJHR7sqU0EyKFNaP3
	 DZ27RuivLjQxO1bzWA4FREScIb9STNDefB7M0BuxYLssBeP7yBM/f3ZlYS4XAATLP9
	 tLCiRKJCp+pkFmwMp3ZK+qMI4MCnUUNrPoP/inuw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] nushell: add missing build dependencies
Date: Fri, 31 Jul 2026 20:15:23 +0100
Message-ID: <20260731191523.2153901-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731191523.2153901-1-ross.burton@arm.com>
References: <20260731191523.2153901-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Jul 2026 19:15:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128592

Needed since our cargo class now stops the git2-sys and sqlite3-sys
crates from using a bundled copies of the libraries.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-extended/nushell/nushell_0.114.1.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/nushell/nushell_0.114.1.bb b/meta-o=
e/recipes-extended/nushell/nushell_0.114.1.bb
index 58205ee8c5..41f2bd87f4 100644
--- a/meta-oe/recipes-extended/nushell/nushell_0.114.1.bb
+++ b/meta-oe/recipes-extended/nushell/nushell_0.114.1.bb
@@ -10,12 +10,14 @@ LIC_FILES_CHKSUM =3D " \
     file://LICENSE;md5=3Dea22f3cfd911b3519505220cfc0ce542 \
 "
=20
+DEPENDS =3D "libgit2 sqlite3"
+
 SRC_URI =3D "crate://crates.io/nu/${PV};name=3Dnu"
 SRC_URI[nu.sha256sum] =3D "a840c40450e4ab0b95c81aa3ef965f31a5da47f6e6823=
f00da5edfe9fcdf05c9"
=20
 S =3D "${CARGO_VENDORING_DIRECTORY}/nu-${PV}"
=20
-inherit cargo cargo-update-recipe-crates
+inherit cargo cargo-update-recipe-crates pkgconfig
=20
 require ${BPN}-crates.inc
=20
--=20
2.43.0


