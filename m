Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.765.1794328779525303028
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 08:39:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=A4GaMFMm;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB7EC2E400B0;
	Tue, 10 Nov 2026 17:39:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1794328776; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=88VO1LR9VHcxzO1mRbPpzSkUhJ2p+Z63c8A5EbCeJN4=;
	b=A4GaMFMmT8/nVkEkdec1BtiuHyRu3EYdz1+byf+WupPlzRcNi+9OlnKAdhkTlo2vKBVIxs
	Tk4S4rvXiYzZlu90SuO/+9QlocvKLCJeYHD6dbLASnES03ThgOlIZaurIst4sBJCbkgIjO
	bnU3E0zunQisoj434IYcbb+GKb+98m+x99ojVi8i/+zRdRnJewShpJua42yFiP8NqQdJK8
	AaDlqEhl1xVlPoP13sVvR40JvcF8895WvjMeLidrrttiOrlY7CBHNfK/6h9vLHHdi7oFKJ
	d4DTy2TNroFGXB+XYiiIyD8ESWSpL86Gkur0X0PdbpcUvUMtgDRnjYxVmzk5FA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH 3/3] fastfetch: upgrade 2.70.0 -> 2.71.0
Date: Tue, 10 Nov 2026 17:39:04 +0100
Message-ID: <20261110163904.15077-3-tafil@tafhub.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110163904.15077-1-tafil@tafhub.de>
References: <20261110163904.15077-1-tafil@tafhub.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 16:39:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132096
Content-Type: text/plain; charset="utf-8"

Full changelog: https://github.com/fastfetch-cli/fastfetch/blob/2.71.0/CH=
ANGELOG.md

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../fastfetch/{fastfetch_2.70.0.bb =3D> fastfetch_2.71.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.70.0.bb =3D> fastf=
etch_2.71.0.bb} (98%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
similarity index 98%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
index 9db8b2cbce..c9ba3519b0 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.71.0.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2090e7d93df7=
ad5a3d41f6fb4226ac76"
 DEPENDS =3D "yyjson"
=20
 SRC_URI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV}"
-SRCREV =3D "17bb3fd2384bd814b421d73b8c8b8d08e06cfa26"
+SRCREV =3D "8c9d9c0449dd515e0088c4a60a38d2dc40c5ccd0"
=20
 inherit cmake pkgconfig
=20
