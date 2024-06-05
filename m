Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B97EC25B76
	for <webhook@archiver.kernel.org>; Wed,  5 Jun 2024 17:56:27 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web11.22204.1717608622059804731
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Jun 2024 10:30:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tkos.co.il header.s=default header.b=RJJ9Z+RE;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.tkos.co.il (Postfix) with ESMTPS id 2ACB5440CD1;
	Wed,  5 Jun 2024 20:30:10 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1717608611;
	bh=M9jMrgw3e4UCo35RCu1yr6ZtvalxurjWtLIECGvdv2I=;
	h=From:To:Cc:Subject:Date:From;
	b=RJJ9Z+RE9VBW8u/uCeQgxjLtCXWHNr3PedJtMds6uYEXt0Oav77xn4ECg5ibuu3Fr
	 3cUfo/Riy7zlu0MsfYzZ1hcFLCbYj2LQL7InjAB87XkzUthzAU27fWL96Rq9T1Yp9j
	 HO9Af/S73WPLJdzFzRir457PJ/V9eF5ILpcqzyV/IiAZSKzIfpJFUSMTSEm/ilftFI
	 qk7nzoQWs8dWoypjiBDQe300ONEK37j+IXR3q5UGwRV9a9FVwJWOjC3BblV299mJC4
	 RCSFv8piKVUUftopFwvKXNGwHGugflEIL2I3al5hrxsTpufgfeldD+KLZjsad9sjPS
	 BiJCmIzSEWiUw==
From: "baruch@tkos.co.il" <baruch@tkos.co.il>
To: openembedded-devel@lists.openembedded.org
Cc: Baruch Siach <baruch@tkos.co.il>
Subject: [meta-oe][PATCH] sexpect: add new recipe
Date: Wed,  5 Jun 2024 20:30:15 +0300
Message-ID: <dd6a6738ed5b4d80a40705f9d115cdd5c80e5a57.1717608615.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Jun 2024 17:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110705

sexpect is an expect like utility that is designed in the client/server
model. This makes it suitable for use in shell script to control
multiple interactive programs from a single script.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb

diff --git a/meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb b/meta-oe=
/recipes-devtools/sexpect/sexpect_2.3.14.bb
new file mode 100644
index 000000000000..1b064faf160c
--- /dev/null
+++ b/meta-oe/recipes-devtools/sexpect/sexpect_2.3.14.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "sexpect is another implementation of Expect which is specif=
ically designed for Shell scripts"
+HOMEPAGE =3D "https://github.com/clarkwang/sexpect"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+BRANCH =3D "master"
+SRC_URI =3D "git://github.com/clarkwang/sexpect;branch=3D${BRANCH};proto=
col=3Dhttps"
+SRCREV =3D "532a52d36aae442b7fe1ce20a59effd1dbc6e6fe"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
--=20
2.43.0


