Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21CD8E9A767
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 10:53:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16736.1774349605042822793
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 03:53:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0AD91688
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:53:18 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3F1E53FAF5
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 03:53:24 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/2] xmlsec1: disable ptests for now
Date: Tue, 24 Mar 2026 10:53:18 +0000
Message-ID: <20260324105318.2150394-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324105318.2150394-1-ross.burton@arm.com>
References: <20260324105318.2150394-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 10:53:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125553

oe-core just moved from pkgconfig to pkgconf, which has broken the
ptest buikd due to how fragile the compilation was.

This will be revisited to build the tests properly, but for now simply
disable the ptests.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb b/meta-oe/r=
ecipes-support/xmlsec1/xmlsec1_1.3.9.bb
index e0888f1ff4..e178fc2125 100644
--- a/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
+++ b/meta-oe/recipes-support/xmlsec1/xmlsec1_1.3.9.bb
@@ -51,6 +51,9 @@ FILES:${PN}-dbg +=3D "${PTEST_PATH}/.debug/*"
 RDEPENDS:${PN}-ptest +=3D "${PN}-dev"
 INSANE_SKIP:${PN}-ptest +=3D "dev-deps"
=20
+# The ptests are not buildable now that pkgconf is being used, disable u=
ntil fixed.
+PTEST_ENABLED =3D "0"
+
 PTEST_EXTRA_ARGS =3D "top_srcdir=3D${S} top_builddir=3D${B}"
=20
 do_compile_ptest () {
--=20
2.43.0


