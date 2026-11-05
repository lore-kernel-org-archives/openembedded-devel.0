Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34011.1793884024970286568
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 05:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=N7F8/mBd;
 spf=pass (domain: geanix.com, ip: 79.135.106.112, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793884022; x=1794143222;
	bh=0eTtzPNOR99j6nMH2NN7wHcelG1itcZz7Pp2HkJfJ0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=N7F8/mBd3goXSKPArc0W9yu+yPGDzARhrHo1fA0UqSC52F5169kz0eJUY9hXSd0+9
	 BVYC2YDqDZeM1qya0nUkgO9N1E/+82CXwNAdXLpedZwTQEsqXh+Zxltgsk3BlPn3SE
	 efoJ9ZV7voryFlgLAYaNMMvt3w+eYtoRB+CxDECOiGhDR6V8K7+h5sPSJ71PdKl5Vl
	 Vh/nHWFuKpQmCkneCfP9NXeSAjaxBUxoRMnVAdEnP6sT05JIIrL1NDkq6B/NQ+rujt
	 46udJD3Y2NaS7lV1c3yS/o0wFvfaVPaP+nKogxrJ1bD2g+r2ok5NOqXLaF/cS55BRk
	 /1yGZhI9P5rkg==
X-Pm-Submission-Id: 4jL2dd0KmPz1DDLH
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH v2 1/5] zsh: drop gdbm dependency and --disable-gdbm
Date: Thu,  5 Nov 2026 14:06:36 +0100
Message-ID: <20261105130640.683925-1-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131920
Content-Type: text/plain; charset="utf-8"

gdbm support is disabled by default in zsh's configure, so
--disable-gdbm is redundant and gdbm in DEPENDS is unused.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index 2b2de3407e..fe3f0e1354 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -8,7 +8,7 @@ SECTION =3D "base/shell"
 LICENSE =3D "LicenseRef-zsh"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514=
fec"
=20
-DEPENDS =3D "ncurses bison-native libcap libpcre2 gdbm groff-native"
+DEPENDS =3D "ncurses bison-native libcap libpcre2 groff-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
 SRC_URI[sha256sum] =3D "36fa734374b44783582cec09bcd67822e2f992c779ec1624=
ab5596df078d2f81"
@@ -30,7 +30,6 @@ EXTRA_OECONF =3D " \
     --with-term-lib=3D'ncursesw ncurses' \
     --enable-cap \
     --enable-multibyte \
-    --disable-gdbm \
     --disable-dynamic \
     zsh_cv_shared_environ=3Dyes \
 "
--=20
2.55.0

