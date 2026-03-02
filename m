Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9603DD58E48
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:39:26 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.165031.1772469557462639094
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:39:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: no key for signature: lookup dkim._domainkey.semalibre.com on 127.0.0.53:53: no such host" header.i=@semalibre.com header.s=dkim header.b=TJyC96Gg;
 spf=pass (domain: semalibre.com, ip: 185.246.84.56, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 379661A2114;
	Mon,  2 Mar 2026 16:39:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0D8395FE89;
	Mon,  2 Mar 2026 16:39:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 20AFF103690A0;
	Mon,  2 Mar 2026 17:39:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1772469554;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=nuf4lly4yoUvp+sVyyEnF80kxjbQOeC2Xjn/skUGNBM=;
	b=TJyC96GgUzYR6u1DYtl3zT1cwWfU95SU06G/daMyivQV/29TVRCX3Sl+Az4jFBwAENC3Bv
	mOJGJFvYSlPdLS3NFYsKolRltvcT49i8HO7szw9L+jiuD9S4VZ7VU4aXuKwP2LkVITEQ3E
	X4jVwT/7ySfmtRxGnmLoMTYdpELiyOXLQH4AFIJ+XlHbwmokdoSMYnqs6HWbnwH2XVh/TA
	Qh5tAJXV3Lolac/jGzNDLLurD8T4CBG57ujJ6ldog12OmWMHViBcTXIS9kABWuyrCuDNz/
	gN1XJN6nyOFbLKBZgHtYcCx2pkaD7o+URHAaVI1YATwM1zwypvcFQ69QS1yZVQ==
From: Louis Rannou <louis.rannou@semalibre.com>
To: louis.rannou@semalibre.com,
	openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	pascal.eberhard@se.com
Subject: [meta-oe][PATCH] rrdtool: takes graph only with x11 or wayland
Date: Mon,  2 Mar 2026 17:37:55 +0100
Message-ID: <20260227-rrdtool-graph-v1-1-d51410628ba4@non.se.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Change-ID: 20260227-rrdtool-graph-2cf28a25fd23
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772198240; l=1271; i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id; bh=TUskb7XIjHmFqDi/fKcWLryXDJWKWQQf2yypCR4/c+Q=; b=Jt3g2Fz0kD3rHBu3g3rsFwbpdmnGHh4CVWF6SK0Efw406XrlEcODXWOO8WXCwy8mXOY7fqN49 v3Ef3n47XA6BxsJxx+Ev+cB9yIm3MkycigIi72Ahn6J0jxxUmmLolmR
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519; pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Mar 2026 16:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124818

From: Louis Rannou <louis.rannou@non.se.com>

rrdtool package configuration 'graph' relies on graphical support. Ignore
it if none of x11 org wayland is in the distro features.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb b/meta-oe/=
recipes-extended/rrdtool/rrdtool_1.9.0.bb
index 69c281bd92..752ecc6c48 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.9.0.bb
@@ -25,7 +25,11 @@ AUTOTOOLS_AUXDIR =3D "${S}/conftools"
=20
 EXTRA_AUTORECONF =3D "-I m4 --exclude=3Dautopoint"
=20
-PACKAGECONFIG ??=3D "perl graph ${@bb.utils.filter('DISTRO_FEATURES', 's=
ystemd', d)}"
+PACKAGECONFIG ??=3D " \
+    perl \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'graph', =
'', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
+"
=20
 PACKAGECONFIG[python] =3D "--enable-python=3Dyes \
 am_cv_python_pythondir=3D${STAGING_LIBDIR}/python${PYTHON_BASEVERSION}/s=
ite-packages \

---
base-commit: 3c5711e73245e913cfec9444e626dda9ad89fd76
change-id: 20260227-rrdtool-graph-2cf28a25fd23

Best regards,
-- =20
Louis Rannou <louis.rannou@non.se.com>

