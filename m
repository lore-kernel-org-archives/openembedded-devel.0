Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C526C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 13:08:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.14980.1714482441206734728
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 06:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4ABD62F4;
	Tue, 30 Apr 2024 06:07:47 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 683963F793;
	Tue, 30 Apr 2024 06:07:20 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH] renderdoc: remove vim-native DEPENDS
Date: Tue, 30 Apr 2024 13:07:16 +0000
Message-Id: <20240430130716.1704733-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 13:08:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110197

This need for this was removed in 2016[1]

[1] https://github.com/baldurk/renderdoc/commit/fff93a4bcc036f8288fd31dcd=
d1209fea36b9b58

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb b/meta-=
oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
index e52ec5f291..58f2275736 100644
--- a/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
+++ b/meta-oe/recipes-graphics/renderdoc/renderdoc_1.27.bb
@@ -10,7 +10,7 @@ SRC_URI =3D " \
 "
 S =3D "${WORKDIR}/git"
=20
-DEPENDS +=3D "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms vim-n=
ative"
+DEPENDS +=3D "virtual/libx11 virtual/libgl libxcb xcb-util-keysyms"
=20
 RDEPENDS:${PN} =3D "libxcb xcb-util-keysyms"
=20
--=20
2.34.1


