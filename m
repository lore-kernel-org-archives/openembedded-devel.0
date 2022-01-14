Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25CC7C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 11:52:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.6116.1642161171150025293
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 576BF11B3
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:50 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 029A93F5A1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 03:52:49 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/3] pyxdg: upgrade and remove distutils
Date: Fri, 14 Jan 2022 11:52:46 +0000
Message-Id: <20220114115246.3985850-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114115246.3985850-1-ross.burton@arm.com>
References: <20220114115246.3985850-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 11:52:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94829

Upgrade to 0.27, and switch to setuptools now that distutils is
deprecated.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-gnome/pyxdg/{pyxdg_0.26.bb =3D> pyxdg_0.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/pyxdg/{pyxdg_0.26.bb =3D> pyxdg_0.27.bb} (8=
2%)

diff --git a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb b/meta-oe/recipes-=
gnome/pyxdg/pyxdg_0.27.bb
similarity index 82%
rename from meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
rename to meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
index 6fa31c58ff..35ecd7ff5d 100644
--- a/meta-oe/recipes-gnome/pyxdg/pyxdg_0.26.bb
+++ b/meta-oe/recipes-gnome/pyxdg/pyxdg_0.27.bb
@@ -4,9 +4,9 @@ SECTION =3D "devel/python"
 LICENSE =3D "LGPLv2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df30a9716ef3762e3467a2f62bf790=
f0a"
=20
-SRCREV =3D "7db14dcf4c4305c3859a2d9fcf9f5da2db328330"
+SRCREV =3D "f097a66923a65e93640c48da83e6e9cfbddd86ba"
 SRC_URI =3D "git://anongit.freedesktop.org/xdg/pyxdg;branch=3Dmaster"
=20
-inherit distutils3
+inherit setuptools3
=20
 S =3D "${WORKDIR}/git"
--=20
2.25.1


