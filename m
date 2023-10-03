Return-Path: <philip-dylan.gleonec@savoirfairelinux.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A40E7AD75
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 15:57:33 +0000 (UTC)
Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
 by mx.groups.io with SMTP id smtpd.web11.111958.1696348650951045151
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 08:57:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@savoirfairelinux.com header.s=DFC430D2-D198-11EC-948E-34200CB392D2 header.b=ZSJebc8/;
 spf=pass (domain: savoirfairelinux.com, ip: 208.88.110.44, mailfrom: philip-dylan.gleonec@savoirfairelinux.com)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 1687B9C1108
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Oct 2023 11:57:29 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BB4HLBHrfIgd for <openembedded-devel@lists.openembedded.org>;
 Tue,  3 Oct 2023 11:57:28 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 960E89C2BCB
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Oct 2023 11:57:28 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 960E89C2BCB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1696348648; bh=4hjlDsdRj1S5s8IdUzuL51slg+oGVJw+iDYPVVJ7zIc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ZSJebc8/8yZpTjRR/jW1kRRV41OM7wpgjftRpmwuDmUJJtRnnZxoWqH8ugntimHS6
	 rGe5o8ui/idiIy2sTk0pLkW9k/PGCe3K5jgEwa03/v4dNqvtVz6EhpOnHV0lPqyeIH
	 8VuE+PqQUSk0vNX3yk1KCiqupMDKs8KxHl3NxPWcm7639Y4yzPJCUIPUYUQXjR76Vy
	 L1DhNgdX7WFBovh1hacAUmT6YV6CUmFvFjTs+L1zQ/6mbxAiK4Bu+BZ++uSuGu0pvZ
	 UfCXgsKVqOzKQv+hzfF1JsIH602FIIUC5jL3PYJO6tL7zbuKqLnbxvgJMGI07QtDZQ
	 8hnQS21Ma9T9Q==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id XcVnBb2KIJmG for <openembedded-devel@lists.openembedded.org>;
 Tue,  3 Oct 2023 11:57:28 -0400 (EDT)
Received: from t14pdgleonec.rennes.sfl (lmontsouris-657-1-69-118.w80-15.abo.wanadoo.fr [80.15.101.118])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 409909C1108
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Oct 2023 11:57:28 -0400 (EDT)
From: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinux.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] cukinia: fix license field
Date: Tue,  3 Oct 2023 17:57:20 +0200
Message-Id: <20231003155720.172377-1-philip-dylan.gleonec@savoirfairelinux.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 15:57:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105324

The recipe currently indicates that the cukinia package is licensed
under both GPLv3 AND Apache 2.0 licensesi, but the upstream specifies
GPLv3 OR Apache 2.0 license, at the choice of the user.

Signed-off-by: Philip-Dylan Gleonec <philip-dylan.gleonec@savoirfairelinu=
x.com>
---
 meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb b/meta-oe/reci=
pes-test/cukinia/cukinia_0.6.2.bb
index ed7a3f06a..1bcfb0a9b 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.6.2.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "Linux firmware validation framework"
 DESCRIPTION =3D "Cukinia is designed to help Linux-based embedded firmwa=
re \
 developers run simple system-level validation tests on their firmware."
 HOMEPAGE =3D "https://github.com/savoirfairelinux/cukinia"
-LICENSE =3D "GPL-3.0-only & Apache-2.0"
+LICENSE =3D "GPL-3.0-only | Apache-2.0"
=20
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPLv3;md5=3Dd32239bcb673463ab874e80=
d47fae504 \
                     file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c29=
e"
--=20
2.30.2


