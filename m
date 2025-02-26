Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F225AC19F32
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 17:22:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11469.1740590553931570152
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 09:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 481061516
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0644E3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 09:22:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/4] gstd: disable gtk-doc
Date: Wed, 26 Feb 2025 17:22:19 +0000
Message-ID: <20250226172220.1033779-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226172220.1033779-1-ross.burton@arm.com>
References: <20250226172220.1033779-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 17:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115681

The API documentation should be buildable with gtk-doc, but it fails
for some reason:

  gtkdoc-mkhtml: error: unrecognized arguments: ../gstd-docs.xml

Leave the gtk-doc class inherited, but temporarily disable it until this
is fixed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb=
 b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
index 3b0d3ded13..4720edf153 100644
--- a/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
+++ b/meta-multimedia/recipes-multimedia/gstreamer-1.0/gstd_git.bb
@@ -18,6 +18,10 @@ PV =3D "1.0+really0.15.2"
=20
 GTKDOC_MESON_OPTION =3D "enable-gtk-doc"
=20
+# Documentation doesn't currently build:
+# gtkdoc-mkhtml: error: unrecognized arguments: ../gstd-docs.xml
+GTKDOC_ENABLED =3D "False"
+
 inherit meson pkgconfig gettext gtk-doc python3native python3-dir python=
3targetconfig
=20
 do_install:append() {
--=20
2.43.0


