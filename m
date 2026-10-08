Return-Path: <martin@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A1FCA6007
	for <webhook@archiver.kernel.org>; Thu,  8 Oct 2026 12:51:10 +0000 (UTC)
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14599.1791463864336078541
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2026 05:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=NBBPXSUi;
 spf=pass (domain: geanix.com, ip: 109.224.244.108, mailfrom: martin@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1791463861; x=1791723061;
	bh=wmKspDeP4XzhbyYiBLEq6jlpUNJVgzuF/FIg+Ljzgas=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=NBBPXSUiC4fk9at6HbWb3bChcCoR8mqur9C7eExak7wr9PzPMt86GGD9B8u4EJLY0
	 d9UdZ5oYcM6Mz56xueB4qNFj+LvsPFH611kq0QAVxM3GWh7GRf/c6e0vWkXFiEPNHk
	 X2TeNS1hQfqVnIwgEIY7c3KU3CxLIxKEAjVQ2Lm29+DW5yHyz9PpRpaRPxin+ztTri
	 t4E1BrhPe+vs2JEQ9xlNYfEa4/gwxkKP3fk7fJn4IJI1ot21cpWdCox6ravWmovsJN
	 YUQJMJ7+kXxAEIpB49KFWdKkSQnM/fo0fcPIQychjhEdY9eyjgpbG2nRgXblX1znQq
	 D8UTNAiicLmIA==
X-Pm-Submission-Id: 4j0qc41KHrz2ScmB
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
Subject: [PATCH] polkit: enable the agent helper socket
Date: Thu,  8 Oct 2026 14:50:47 +0200
Message-ID: <20261008125051.619349-1-martin@geanix.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2026 12:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130670

The polkit agent helper socket is is used for authorization requests
from (among others) systemd applications that requires administrative
privileges. When available, the polkit-agent-helper-1 executable doesn't
need the setuid bit for authorization to work.

Enable authorization without requiring setuid by configuring the systemd
bbclass to enable the polkit agent helper socket at package install
time.

For the enablement to actually happen, the SYSTEMD_AUTO_ENABLE variable
is changed back to (its default) enable value. This is okay, since it
was originally assigned to not enable the polkit.service unit. That unit
doesn't include an install section, so it cannot be enablet.

Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
---
 meta-oe/recipes-extended/polkit/polkit_127.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/reci=
pes-extended/polkit/polkit_127.bb
index 10b3fbfe47f0..20891528262e 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -44,7 +44,6 @@ USERADD_PARAM:${PN} =3D "--system --no-create-home --us=
er-group --home-dir ${sysco
 # to exclude the polkit service in favor of alternative implementations
 SYSTEMD_PACKAGES +=3D "${PN}-service"
 SYSTEMD_SERVICE:${PN}-service =3D "${BPN}.service"
-SYSTEMD_AUTO_ENABLE =3D "disable"
=20
 PACKAGES =3D+ "${PN}-service"
 RDEPENDS:${PN}-service +=3D "polkit"
@@ -88,4 +87,7 @@ FILES:${PN} +=3D " \
 	${systemd_unitdir}/system/polkit-agent-helper@.service \
 "
=20
+# Enable the polkit agent helper socket used by the systemd ask-password=
 functionality
+SYSTEMD_SERVICE:${PN} +=3D "polkit-agent-helper.socket"
+
 CVE_STATUS[CVE-2016-2568] =3D "unpatched: the fix is a kernel compiled w=
ithout CONFIG_LEGACY_TIOCSTI"
--=20
2.55.0


