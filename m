Received: from mail-43171.protonmail.ch (mail-43171.protonmail.ch [185.70.43.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9599.1793615731056451477
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 02:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=slLqB/at;
 spf=pass (domain: geanix.com, ip: 185.70.43.171, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793615728; x=1793874928;
	bh=/N+DTjnVIkHOrWbqkzz4ypRic02BdmbQ6AaiZRDFTUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=slLqB/atisg9PQhn/qZHsdaSgYrGfKPPlRs773zV2CDedC6A6fr4vIynvFTXnPutV
	 dERuz7gp+MCZ8yw23MsgalBxAMlCCm5isOGv9WWO/DJftdoi64uaYcxtjomO0S/1py
	 BaYZ0KPp9YyvQZ4DPIa/UiYLlzHPfX4Sorz0i3/ipnHiPv7yfAGBdv1L1jgPsFJHWN
	 /BI16dm5A5J9VQUvTHIzkZ1MXSQmTKdkmwIM+xJ+aJ0IxRrKcLJWexXdSqvEpuuHb9
	 MT5IWM0M4/MnOZDQRXiAh3c38w+MJastjQ7Q3ia4f3+aCXRjwjf50WvBjfpaVhJrUI
	 ckBX3SDMJsH3Q==
X-Pm-Submission-Id: 4jJ7Q758M1z2ScX8
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH 2/2] zsh: make libpcre2 a PACKAGECONFIG
Date: Mon,  2 Nov 2026 11:34:59 +0100
Message-ID: <20261102103459.3625067-2-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261102103459.3625067-1-sean@geanix.com>
References: <20261102103459.3625067-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2026 10:35:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131748
Content-Type: text/plain; charset="utf-8"

libpcre2 was always in DEPENDS. Move it to a PACKAGECONFIG, enabled
by default, so it can be dropped.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index 47b9bfc18f..16a769612c 100644
--- a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
+++ b/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb
@@ -8,7 +8,7 @@ SECTION =3D "base/shell"
 LICENSE =3D "LicenseRef-zsh"
 LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3D1a4c4cda3e8096d2fd483ff2f4514=
fec"
=20
-DEPENDS =3D "ncurses bison-native libcap libpcre2 groff-native"
+DEPENDS =3D "ncurses bison-native libcap groff-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}/${PV}/${BP}.tar=
.xz"
 SRC_URI[sha256sum] =3D "36fa734374b44783582cec09bcd67822e2f992c779ec1624=
ab5596df078d2f81"
@@ -44,7 +44,9 @@ ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
 ALTERNATIVE_TARGET[sh] =3D "${base_bindir}/${BPN}"
 ALTERNATIVE_PRIORITY =3D "90"
=20
+PACKAGECONFIG ??=3D "pcre"
 PACKAGECONFIG[gdbm] =3D "--enable-gdbm,--disable-gdbm,gdbm"
+PACKAGECONFIG[pcre] =3D "--enable-pcre,--disable-pcre,libpcre2"
 # Needed for manpages.bbclass, but they're always installed
 PACKAGECONFIG[manpages] =3D ""
=20
--=20
2.55.0

