Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.752.1794328762904832553
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 08:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=Tkue8xnK;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2B2B2E40EC4;
	Tue, 10 Nov 2026 17:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1794328760; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=LUcjeBLuw6HiUFfHZJxgsfi3BBlQ6hwXXcCJBJnmkkQ=;
	b=Tkue8xnKtXlz/KSncVisn2j1foGzPv+NSqLpqZwWM2ZG1nJI4OFn4BBE3NW+ez2huZDNku
	BWsSW4Fpa4PSWhhEJzZuvQWXwJsWcpY8HCUbRAKgMoVVuY4sawgIuQbp+qkqHNDjWJxivO
	hJ3ZUKIU7zRoPlZLDiVMr2uNcCwqUQek5d3VV30MFD+BT0jQvV3Ek88edkJkTGq6m7eou0
	5eNwcoqJHCZQcBZ4/NnttJUluZPBU+g1KLoECGR4i/ETotlsXsgrEXV83ocI3WuLwO9zeN
	hGDAXTQNFBy9f9XsHsU98qnh3RyJNquJEieuNZlCRV6bvOkiMF13w4yCJgQORA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH 1/3] fastfetch: set link type to dynamic
Date: Tue, 10 Nov 2026 17:39:02 +0100
Message-ID: <20261110163904.15077-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 16:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132094
Content-Type: text/plain; charset="utf-8"

The default option is dlopen. Switch to dynamic to allow Yocto's
shlibdeps to generate runtime dependencies automatically to avoid
missing libraries in the target image.

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
index c1cfa4548f..a9401cdb65 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
@@ -19,6 +19,7 @@ EXTRA_OECMAKE +=3D "\
     ${@bb.utils.contains_any('PACKAGECONFIG', 'chafa imagemagick sixel',=
 '-DENABLE_IMAGE_LOGO=3DON', '-DENABLE_IMAGE_LOGO=3DOFF', d)} \
     -DENABLE_SYSTEM_YYJSON=3DON \
     -DENABLE_EET=3DOFF \
+    -DBINARY_LINK_TYPE=3Ddynamic \
 "
=20
 PACKAGECONFIG ??=3D "\
