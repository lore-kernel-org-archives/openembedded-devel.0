Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C554AC47DA2
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 18:27:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.15454.1705084060816335003
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 10:27:41 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CEB612FC
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:28:26 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A775C3F5A1
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 10:27:39 -0800 (PST)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] libgxim: inherit gtk-doc
Date: Fri, 12 Jan 2024 18:27:34 +0000
Message-Id: <20240112182736.3448071-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112182736.3448071-1-ross.burton@arm.com>
References: <20240112182736.3448071-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 18:27:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108246

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
 meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb b/meta-oe/=
recipes-extended/libgxim/libgxim_0.5.0.bb
index 3912e0a8d7..eb85a07e99 100644
--- a/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
+++ b/meta-oe/recipes-extended/libgxim/libgxim_0.5.0.bb
@@ -26,6 +26,6 @@ file://COPYING;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
 EXTRA_OECONF =3D "--enable-debug --disable-static --disable-rebuilds --e=
nable-compile-warnings=3Dminimum"
 DEPENDS +=3D "gtk+ glib-2.0 glib-2.0-native ruby-native intltool-native =
gnome-common-native autoconf-archive-native"
=20
-inherit features_check autotools pkgconfig gettext
+inherit features_check autotools pkgconfig gettext gtk-doc
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
--=20
2.34.1


