Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34015.1793884027344960600
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 05:07:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=IyL59pPi;
 spf=pass (domain: geanix.com, ip: 185.70.43.171, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793884025; x=1794143225;
	bh=DA29QaGawHnjU0O2g/fCHnqxxARasPzBMDUQ/tk14E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=IyL59pPiwGde42+vAyJCqSmdY3nj7OJC5xL6d6iWllqhWkgPPuEgZ5e2iLBQ64V6V
	 SxeE+q60ZaRkvEjXsBB2HoiwUt8clRJ4DUYnI179W4lDoniXdt4K0xQcY7/U4lJlyQ
	 1u3xYxEbfDKDnLCKLUS9JZcQKRev9UzSki4EoKe+pWc2VWwyX0dUQzTsRANj1CCAUe
	 n2HOWyiivqfNZ0QVqKQNI4z0WauMVarH4n42KJAGU5hrbIgM4B8vngrbRQsgX8M//z
	 ScfBsk7Bjp26pXeui+q3YtJD24DPaQVrko8RvDQzj2zseLtWn1XKQJSIgwYItnDgnv
	 V/HQNWgtPJXHA==
X-Pm-Submission-Id: 4jL2dh1Pshz1DDWq
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH v2 4/5] zsh: add gdbm PACKAGECONFIG
Date: Thu,  5 Nov 2026 14:06:39 +0100
Message-ID: <20261105130640.683925-4-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105130640.683925-1-sean@geanix.com>
References: <20261105130640.683925-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131923
Content-Type: text/plain; charset="utf-8"

The zsh/db/gdbm module is link=3Ddynamic only, so add a PACKAGECONFIG for
it that conflicts with static.

When static is disabled, preset the dynamic loading checks configure
can't run when cross compiling.

AI-Generated: Uses Claude Code
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index cb18983f2a..32c59fb6bc 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -44,7 +44,8 @@ ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
 ALTERNATIVE_PRIORITY =3D "90"
=20
 PACKAGECONFIG ??=3D "static"
-PACKAGECONFIG[static] =3D "--disable-dynamic,--enable-dynamic"
+PACKAGECONFIG[static] =3D "--disable-dynamic,--enable-dynamic zsh_cv_sys=
_dynamic_rtld_global=3Dyes zsh_cv_sys_dynamic_execsyms=3Dyes"
+PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm,,,static"
 # Needed for manpages.bbclass, but they're always installed
 PACKAGECONFIG[manpages] =3D ""
=20
--=20
2.55.0

