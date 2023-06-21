Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74C9EB64D8
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 14:09:07 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by mx.groups.io with SMTP id smtpd.web10.5746.1687333777496370083
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jun 2023 00:49:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: non.se.com, ip: 212.27.42.3, mailfrom: remi.peuvergne@non.se.com)
Received: from localhost.localdomain (unknown [176.157.204.145])
	(Authenticated sender: rpeuvergne@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3475213F8E1;
	Wed, 21 Jun 2023 09:49:34 +0200 (CEST)
From: "Remi Peuvergne" <rpeuvergne@free.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Remi Peuvergne <remi.peuvergne@non.se.com>
Subject: [meta-oe][PATCH] zeromq: Remove unsupported LGPLv3+ license
Date: Wed, 21 Jun 2023 09:48:50 +0200
Message-Id: <20230621074849.2160926-1-remi.peuvergne@non.se.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jun 2023 14:09:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103487

LGPLv3+ is not a valid license any more, and it doesn't
serve any purpose since we have the LGPL-3.0 with exception
license.

Thanks Peter Kjellerstedt for pointing this.

Signed-off-by: Remi Peuvergne <remi.peuvergne@non.se.com>
---
 meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb b/meta-o=
e/recipes-connectivity/zeromq/zeromq_4.3.4.bb
index 1ed486df5..cd319b5d3 100644
--- a/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
+++ b/meta-oe/recipes-connectivity/zeromq/zeromq_4.3.4.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "ZeroMQ looks like an embeddable networking library but =
acts like a concurrency framework"
 HOMEPAGE =3D "http://www.zeromq.org"
-LICENSE =3D "LGPL-3.0-with-zeromq-exception | LGPLv3+"
+LICENSE =3D "LGPL-3.0-with-zeromq-exception"
 LIC_FILES_CHKSUM =3D "file://COPYING.LESSER;md5=3Dd5311495d952062e0e4fbb=
a39cbf3de1"
=20
 PACKAGECONFIG ??=3D "libsodium"
--=20
2.25.1


