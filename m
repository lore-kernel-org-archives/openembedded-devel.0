Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0485BC54756
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 20:34:07 +0000 (UTC)
Received: from outbound5.mail.transip.nl (outbound5.mail.transip.nl [136.144.136.9])
 by mx.groups.io with SMTP id smtpd.web11.51979.1747664155283080291
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 07:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@myspectrum.nl header.s=transip-a header.b=mZS/Tvl3;
 spf=pass (domain: myspectrum.nl, ip: 136.144.136.9, mailfrom: jeroen@myspectrum.nl)
Received: from submission2.mail.transip.nl (unknown [10.100.4.71])
	by outbound5.mail.transip.nl (Postfix) with ESMTP id 4b1KV04wvtzHXBQ;
	Mon, 19 May 2025 16:15:52 +0200 (CEST)
Received: from yellow.myspectrum.nl (yellow.myspectrum.nl [136.144.146.76])
	by submission2.mail.transip.nl (Postfix) with ESMTPSA id 4b1KV00Vwhz2rJ5nn;
	Mon, 19 May 2025 16:15:52 +0200 (CEST)
Received: from yellow.myspectrum.nl (84-27-20-154.cable.dynamic.v4.ziggo.nl [84.27.20.154])
	(Authenticated sender: sendmail@myspectrum.nl)
	by yellow.myspectrum.nl (Postfix) with ESMTPSA id 9478920292;
	Mon, 19 May 2025 14:15:50 +0000 (UTC)
Authentication-Results: yellow.myspectrum.nl;
	auth=pass smtp.auth=sendmail@myspectrum.nl smtp.mailfrom=jeroen@myspectrum.nl
Received: by yellow.myspectrum.nl (sSMTP sendmail emulation); Mon, 19 May 2025 16:15:50 +0200
From: jeroen@myspectrum.nl
To: openembedded-devel@lists.openembedded.org
Cc: marc Kleine-Budde <mkl@pengutronix.de>,
	Jeroen Hofstee <jhofstee@victronenergy.com>
Subject: [oe][meta-oe][PATCH 2/2] socketcand: add recipe
Date: Mon, 19 May 2025 16:15:25 +0200
Message-ID: <20250519141525.3708957-2-jeroen@myspectrum.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250519141525.3708957-1-jeroen@myspectrum.nl>
References: <20250519141525.3708957-1-jeroen@myspectrum.nl>
MIME-Version: 1.0
X-Scanned-By: ClueGetter at submission2.mail.transip.nl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=transip-a; d=myspectrum.nl; t=1747664152; h=from:subject:to:cc:
 references:in-reply-to:date:mime-version;
 bh=GYFYDsZ7faQHABCe1qwFRJcS6ZBss6MfXN1TDj6NI9k=;
 b=mZS/Tvl3bvvUXN3vV3cOKfFqTE8wDHMiVTGw65VQ0nMm2I/+6+ttw1w4xj/wvS60cxCkTG
 hnCwzURFn8nj6RXaSHUquOoal/GVaxsTN79AlVGXtO26/EfhYFucEt4R6dnioYj7pX9wKz
 9qC3xZc3k+Hr3af3iCsOxJRQMI05DhIC1GaYVB1XtLqSA4SlxkmmUeVAZDYTFlCBL4hhfX
 Hnwt/t77AS6ti2UzsHLSffjKcQhM781Qd6kh6M6l3v9zP/0YZxJN4BDExUSZvqBcruKr/+
 fZLgiyMRXcuKE6QzCaF105gpGKQsx2gwNQaFhEqGwz4wgUgEh1k85ue7PFOMIA==
X-Report-Abuse-To: abuse@transip.nl
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 20:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117480

From: Jeroen Hofstee <jhofstee@victronenergy.com>

Socketcand allows to transfer socketcan messages over tcp/ip.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 .../recipes-extended/socketcan/socketcand_git.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-extended/socketcan/socketcand_git.bb

diff --git a/meta-oe/recipes-extended/socketcan/socketcand_git.bb b/meta-=
oe/recipes-extended/socketcan/socketcand_git.bb
new file mode 100644
index 0000000000..764a87f874
--- /dev/null
+++ b/meta-oe/recipes-extended/socketcan/socketcand_git.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Socketcand, socketcan over tcp/ip"
+LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
+LIC_FILES_CHKSUM =3D " \
+    file://LICENSES/BSD-3-Clause;md5=3D4c00cf8b0a04a9441d8fa24850231d00 =
\
+    file://LICENSES/GPL-2.0-only.txt;md5=3Df9d20a453221a1b7e32ae84694da2=
c37 \
+"
+
+SRC_URI =3D "git://github.com/linux-can/socketcand;branch=3Dmaster;proto=
col=3Dhttps"
+SRCREV =3D "7b5e91ec656b33c325db2f9136daebb9e357bb65"
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig
+
+PACKAGECONFIG ?=3D "libconfig libsocketcan"
+PACKAGECONFIG[libconfig] =3D "-Dlibconfig=3Dtrue,-Dlibconfig=3Dfalse,lib=
config"
+PACKAGECONFIG[libsocketcan] =3D "-Dlibsocketcan=3Dtrue,-Dlibsocketcan=3D=
false,libsocketcan"
--=20
2.43.0


