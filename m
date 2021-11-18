Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7451DC433F5
	for <webhook@archiver.kernel.org>; Thu, 18 Nov 2021 16:11:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.3755.1637251902887073140
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 697151042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1196B3F766
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Nov 2021 08:11:41 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/19] imlib2: clarify license
Date: Thu, 18 Nov 2021 16:11:20 +0000
Message-Id: <20211118161138.663375-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Nov 2021 16:11:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94027

Imlib2 has its own special license, so use that instead of MIT & BSD.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/imlib2/imlib2_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb b/meta-oe/reci=
pes-graphics/imlib2/imlib2_git.bb
index 9e4daddd53..56d41cd394 100644
--- a/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
+++ b/meta-oe/recipes-graphics/imlib2/imlib2_git.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "A graphic library for file loading, saving, =
rendering, and manipulati
=20
 HOMEPAGE =3D "https://sourceforge.net/projects/enlightenment/"
 SECTION =3D "libs"
-LICENSE =3D "MIT & BSD"
+LICENSE =3D "Imlib2"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D344895f253c32f38e182dcaf30fe8=
a35"
=20
 DEPENDS =3D "freetype "
--=20
2.25.1


