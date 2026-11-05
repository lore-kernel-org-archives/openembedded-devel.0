Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33798.1793884026571386957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 05:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=y5XAztAM;
 spf=pass (domain: geanix.com, ip: 185.70.43.170, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793884024; x=1794143224;
	bh=GWZ1zoWBkj7uXLLalzE9yqaozbQXFm13pq2TOFAqnkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=y5XAztAMvpdvXDoADcQqRXb1vgVQjH7WAbk/ChNY1Gg6V6flFlFx8xgXou5I70TDt
	 8EZi18BLSVa7xLS8qH/x4/CsFx3c/2qiZUuHFoxYXy7sbcGO6YinCG37cMkslAathX
	 gNyI5i6atLOczFNMqQyv/uwj8v6GSh12EdNe5PkbAE25DX2+uCs4zFCuGHdKTw+f0H
	 pjmgVFMq3K5PZ1DawgWt8KRovXhkKdH9fSjM+S/7AefRM6OO/MdvG4qqWmPihaobT4
	 o7hbKyotqbbrlgndjgXNy3LCVjaTjWSMc5i9M+jFxjIJ8EIHskK77JjsRooar508w+
	 gx633Z58HSCUg==
X-Pm-Submission-Id: 4jL2dg1tKZz1DDnh
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH v2 3/5] zsh: move --disable-dynamic to a static PACKAGECONFIG
Date: Thu,  5 Nov 2026 14:06:38 +0100
Message-ID: <20261105130640.683925-3-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105130640.683925-1-sean@geanix.com>
References: <20261105130640.683925-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131922
Content-Type: text/plain; charset="utf-8"

Allow building zsh with dynamically loadable modules by moving
--disable-dynamic into a PACKAGECONFIG named static, enabled by
default to keep the current behaviour.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index 37948b5ea5..cb18983f2a 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -30,7 +30,6 @@ EXTRA_OECONF =3D " \
     --with-term-lib=3D'ncursesw ncurses' \
     --enable-cap \
     --enable-multibyte \
-    --disable-dynamic \
     zsh_cv_shared_environ=3Dyes \
 "
=20
@@ -44,6 +43,8 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
 ALTERNATIVE_PRIORITY =3D "90"
=20
+PACKAGECONFIG ??=3D "static"
+PACKAGECONFIG[static] =3D "--disable-dynamic,--enable-dynamic"
 # Needed for manpages.bbclass, but they're always installed
 PACKAGECONFIG[manpages] =3D ""
=20
--=20
2.55.0

