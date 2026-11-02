Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9849.1793615731828902079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:35:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=MsOR2DLQ;
 spf=pass (domain: geanix.com, ip: 109.224.244.106, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793615727; x=1793874927;
	bh=IEk87LEmKfpdd0iR5tXkpS/1Ch/HENcGone/IXSf5tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MsOR2DLQFxdAxg58yvRekmB/E3I1dXt2TpbLDyqZiEFBm/FKdTaMAYhUH5OFvPSdG
	 sRRRkuN4ueis2y5ZUQNqB+LY8J/jnvdb0F18if1dCXlQDiaTWu4YeBb43rseD0pe13
	 Nia4xtLqQGXuUpqzZ5d+UO7/Bm/H++uooGyXOb5o73djmzeO1qClWZ4am7xbAFmc7W
	 fsk19kaTnPSCsVSKyZvnczBT+q/n6xpod8cMQleNtcqplIxZqef7YmWoQaqFojCScZ
	 mvA1taLZJ8RRtYigrzeoFHxS5JkGFvzs/34vPRqDnBAZf62e7ZuGSCjQ39gs2K0dqN
	 SyEq+DxLT6g8Q==
X-Pm-Submission-Id: 4jJ7Q66dTKz2ScWs
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH 1/2] zsh: make gdbm a PACKAGECONFIG
Date: Mon,  2 Nov 2026 11:34:58 +0100
Message-ID: <20261102103459.3625067-1-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 10:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131749
Content-Type: text/plain; charset="utf-8"

gdbm was always in DEPENDS while configure was hard-coded with
--disable-gdbm. Move it to a PACKAGECONFIG, disabled by default.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index 2b2de3407e..47b9bfc18f 100644
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
@@ -45,6 +44,7 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
 ALTERNATIVE_PRIORITY =3D "90"
=20
+PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm"
 # Needed for manpages.bbclass, but they're always installed
 PACKAGECONFIG[manpages] =3D ""
=20
--=20
2.55.0

