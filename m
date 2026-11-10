Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.793.1794328772846098081
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Nov 2026 08:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=oRdjxTL5;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED5992E400B0;
	Tue, 10 Nov 2026 17:39:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1794328771; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+PotOdH34PX2faJea5J1IV5cHEPpT0DNHPUxBx2Qu8s=;
	b=oRdjxTL5SOgeOxYtdXJ8PsK+14KOxKkIt09EqokvsdB6XrJ4sAnm67BuXVrE9NtyRsI8bT
	7WrE40BTHjNqbYKeRTeDrrSsi1IHp9xytXT8caDi0YnLMqKuZoh80GvYjukMHZ5+RWhhKA
	bRpEOKHxmXEOU8ughg5uPp2RoChZOiFDvyq753u0OGqldC2Wmx6PJnsoBJUATKWvYgVWE4
	DcK7ho72O5dcfXixAQb06LnCiqPplHKKPQCJzwVTVmdMtwLIpywzFqWbsOqlCdBYW5uWSp
	nK82ihcuKFw/lNGj82Wrs/TawSSsw2ex8dfWm4Hn06nikpYbh+8U2P8B6jdhqA==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH 2/3] fastfetch: drop sixel packageconfig
Date: Tue, 10 Nov 2026 17:39:03 +0100
Message-ID: <20261110163904.15077-2-tafil@tafhub.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110163904.15077-1-tafil@tafhub.de>
References: <20261110163904.15077-1-tafil@tafhub.de>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 10 Nov 2026 16:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132095
Content-Type: text/plain; charset="utf-8"

The embedded 3rd party sixel coder is meant for Windows, macOS and
Android. The option has no effect on Linux.

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
index a9401cdb65..9db8b2cbce 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.70.0.bb
@@ -16,7 +16,7 @@ SRCREV =3D "17bb3fd2384bd814b421d73b8c8b8d08e06cfa26"
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "\
-    ${@bb.utils.contains_any('PACKAGECONFIG', 'chafa imagemagick sixel',=
 '-DENABLE_IMAGE_LOGO=3DON', '-DENABLE_IMAGE_LOGO=3DOFF', d)} \
+    ${@bb.utils.contains_any('PACKAGECONFIG', 'chafa imagemagick', '-DEN=
ABLE_IMAGE_LOGO=3DON', '-DENABLE_IMAGE_LOGO=3DOFF', d)} \
     -DENABLE_SYSTEM_YYJSON=3DON \
     -DENABLE_EET=3DOFF \
     -DBINARY_LINK_TYPE=3Ddynamic \
@@ -46,7 +46,6 @@ PACKAGECONFIG[imagemagick] =3D "-DENABLE_IMAGEMAGICK7=3D=
ON -DENABLE_IMAGEMAGICK6=3DOFF
 PACKAGECONFIG[lua] =3D "-DENABLE_LUA=3DON,-DENABLE_LUA=3DOFF,lua"
 PACKAGECONFIG[opencl] =3D "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,op=
encl-headers virtual/libopencl1"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
-PACKAGECONFIG[sixel] =3D "-DENABLE_SIXEL=3DON,-DENABLE_SIXEL=3DOFF,"
 PACKAGECONFIG[sqlite3] =3D "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF=
,sqlite3"
 PACKAGECONFIG[va-drm] =3D "-DENABLE_VADRM=3DON,-DENABLE_VADRM=3DOFF,libv=
a"
 PACKAGECONFIG[va-x11] =3D "-DENABLE_VAX11=3DON,-DENABLE_VAX11=3DOFF,libv=
a"
