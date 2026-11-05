Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34016.1793884031747314195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 05:07:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=klP+8A5u;
 spf=pass (domain: geanix.com, ip: 109.224.244.108, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793884026; x=1794143226;
	bh=TMJkFQQ2wesVX8bJW6vbxTOC1bYeq0MZvP+iYN39arE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=klP+8A5uks0MVa6qM/1rLr0pU5NZ8ZyQnWq4xQeNsb/8nUrSga1vKFL9Xb+rx+UrB
	 RYnPTqV25lh3JVcXaViHDApRIGHH+x2u0eaLQaaGzvkMJ7NnQClRmtRCKprGExJRu+
	 UYB226yvHWcRoEmuF9GJSp1oUUnRvs+CISb662DpltEN2DHaT0ypyNpL24ICkR7sEf
	 vIiKy9BPPXMYtAXPq4VSsa+TpFN3A9VKI6v2JuKblvMWcQzLgIu3wUTIPUFczajvNy
	 PBaDALUvOHlXDAeproda7032JZ3q7yvwximSa5E/odQn6Gxt2hlkI6cBH0WUa6huif
	 DFEqH/ZJoR+nQ==
X-Pm-Submission-Id: 4jL2dj0YsKz1DDnq
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH v2 5/5] zsh: add pcre PACKAGECONFIG
Date: Thu,  5 Nov 2026 14:06:40 +0100
Message-ID: <20261105130640.683925-5-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105130640.683925-1-sean@geanix.com>
References: <20261105130640.683925-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131924
Content-Type: text/plain; charset="utf-8"

The zsh/pcre module is link=3Ddynamic only, so add a PACKAGECONFIG for it
that conflicts with static.

libpcre2 inherits binconfig-disabled, so pass a small pcre2-config
wrapper using pkg-config via PCRE_CONFIG.

AI-Generated: Uses Claude Code
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh/pcre2-config | 16 ++++++++++++++++
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb     |  5 ++++-
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100755 meta-oe/recipes-shells/zsh/zsh/pcre2-config

diff --git a/meta-oe/recipes-shells/zsh/zsh/pcre2-config b/meta-oe/recipe=
s-shells/zsh/zsh/pcre2-config
new file mode 100755
index 0000000000..13df7b39a7
--- /dev/null
+++ b/meta-oe/recipes-shells/zsh/zsh/pcre2-config
@@ -0,0 +1,16 @@
+#!/bin/sh
+# libpcre2 inherits binconfig-disabled, so answer the queries zsh's
+# configure makes of pcre2-config using pkg-config instead.
+case "$1" in
+--cflags)
+    exec pkg-config --cflags libpcre2-8
+    ;;
+--libs8)
+    exec pkg-config --libs libpcre2-8
+    ;;
+--version)
+    exec pkg-config --modversion libpcre2-8
+    ;;
+esac
+echo "pcre2-config: unsupported option $1" >&2
+exit 1
diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index 32c59fb6bc..7f6b0e7511 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -10,7 +10,9 @@ LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e80=
96d2fd483ff2f4514fec"
=20
 DEPENDS =3D "ncurses bison-native libcap groff-native"
=20
-SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
+SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz \
+           file://pcre2-config \
+"
 SRC_URI[sha256sum] =3D "36fa734374b44783582cec09bcd67822e2f992c779ec1624=
ab5596df078d2f81"
=20
 # The SourceForge download mirror has no browsable listing; check the pe=
r-release
@@ -46,6 +48,7 @@ ALTERNATIVE_PRIORITY =3D "90"
 PACKAGECONFIG ??=3D "static"
 PACKAGECONFIG[static] =3D "--disable-dynamic,--enable-dynamic zsh_cv_sys=
_dynamic_rtld_global=3Dyes zsh_cv_sys_dynamic_execsyms=3Dyes"
 PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm,,,static"
+PACKAGECONFIG[pcre] =3D "--enable-pcre PCRE_CONFIG=3D${UNPACKDIR}/pcre2-=
config,--disable-pcre,libpcre2 pkgconfig-native,,,static"
 # Needed for manpages.bbclass, but they're always installed
 PACKAGECONFIG[manpages] =3D ""
=20
--=20
2.55.0

