Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BD0C1B0FF
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8938.1740585028706896373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51358FEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:44 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0903F3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 04/23] zsh: add missing manpages PACKAGECONFIG
Date: Wed, 26 Feb 2025 15:50:01 +0000
Message-ID: <20250226155022.1989209-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115656

If zsh is built with the api-documentation enabled, the manpages.bbclass
adds the 'manpages' PACKAGECONFIG but this isn't defined:

ERROR: zsh-5.9-r0 do_configure: QA Issue: zsh: invalid PACKAGECONFIG: man=
pages [invalid-packageconfig]

zsh doesn't have an option to disable the manpages, so add a stub
PACKAGECONFIG to silence this error.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.bb b/meta-oe/recipes-shel=
ls/zsh/zsh_5.9.bb
index 7940970e45..e867926f79 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.bb
@@ -41,6 +41,9 @@ ALTERNATIVE_PRIORITY =3D "90"
=20
 export AUTOHEADER =3D "true"
=20
+# Needed for manpages.bbclass, but they're always installed
+PACKAGECONFIG[manpages] =3D ""
+
 do_configure () {
     gnu-configize --force ${S}
     oe_runconf
--=20
2.43.0


