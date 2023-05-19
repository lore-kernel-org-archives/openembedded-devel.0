Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E12C7EE33
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 16:34:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.31016.1684514084735593854
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 May 2023 09:34:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28EC31FB;
	Fri, 19 May 2023 09:35:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C7E3D3F793;
	Fri, 19 May 2023 09:34:43 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 03/13] graphviz: no longer needs intltool-native
Date: Fri, 19 May 2023 17:34:30 +0100
Message-Id: <20230519163440.2733149-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519163440.2733149-1-ross.burton@arm.com>
References: <20230519163440.2733149-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 May 2023 16:34:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102677

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/meta-=
oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
index 967b9321b8..b63017576a 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
@@ -4,7 +4,6 @@ LICENSE =3D "EPL-1.0"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9109f5fc16cf963fb3cdd32781b3c=
e04"
=20
 DEPENDS =3D " \
-    intltool-native \
     bison-native \
     groff-native \
     libtool \
--=20
2.34.1


