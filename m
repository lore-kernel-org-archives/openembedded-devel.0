Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF39AC47DA6
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 18:27:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.15173.1705084062094787955
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 10:27:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E1F0C1FB
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:28:27 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E65F3F5A1
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:27:40 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] raptor2: inherit gtk-doc
Date: Fri, 12 Jan 2024 18:27:36 +0000
Message-Id: <20240112182736.3448071-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112182736.3448071-1-ross.burton@arm.com>
References: <20240112182736.3448071-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 18:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108248

From: Ross Burton <ross.burton@arm.com>

Recent changes to oe-core[1] mean that if a configure.ac uses gtk-doc
then gtkdocize will be called. This means that recipes that don't
inherit gtk-doc (to depend on gtk-doc-native) but don't explicitly
disable the use of gtkdocize will fail to configure.

Inheriting gtk-doc both solves the configure failure, and allows us to
build the API documentation.

[1] oe-core 891ec38d4c5cc5ac7bc34938276261ebd6f6d54e

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb b/meta-oe/=
recipes-support/raptor2/raptor2_2.0.16.bb
index 30df8e0648..85012bcfb3 100644
--- a/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
+++ b/meta-oe/recipes-support/raptor2/raptor2_2.0.16.bb
@@ -15,7 +15,7 @@ SRC_URI =3D " \
 "
 SRC_URI[sha256sum] =3D "089db78d7ac982354bdbf39d973baf09581e6904ac4c92a9=
8c5caadb3de44680"
=20
-inherit autotools pkgconfig
+inherit autotools pkgconfig gtk-doc
=20
 EXTRA_OECONF =3D " \
     --without-xml2-config \
--=20
2.34.1


