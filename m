Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E2CC10F13
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:32:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.25289.1702074751474365491
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A886E11FB;
	Fri,  8 Dec 2023 14:33:16 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AE8673F6C4;
	Fri,  8 Dec 2023 14:32:30 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 07/10] keybinder: disable gtk-doc documentation
Date: Fri,  8 Dec 2023 22:32:21 +0000
Message-Id: <20231208223224.1348651-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208223224.1348651-1-ross.burton@arm.com>
References: <20231208223224.1348651-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Dec 2023 22:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107316

From: Ross Burton <ross.burton@arm.com>

The API documentation doesn't build, so force it off until this is fixed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-gnome/recipes-support/keybinder/keybinder_3.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb b/meta=
-gnome/recipes-support/keybinder/keybinder_3.0.bb
index 444a545d41..278592dc6e 100644
--- a/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
+++ b/meta-gnome/recipes-support/keybinder/keybinder_3.0.bb
@@ -23,3 +23,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11"
 do_configure:prepend() {
 	touch ${S}/ChangeLog
 }
+
+# gtk-doc generation doesn't work, so disable it:
+# ../keybinder-docs.sgml:26: element include: XInclude error : could not=
 load ../xml/tree_index.sgml, and no fallback was found
+GTKDOC_ENABLED =3D "False"
--=20
2.34.1


