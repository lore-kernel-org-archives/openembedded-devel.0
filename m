Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34013.1793884026027485270
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 05:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@geanix.com header.s=protonmail header.b=kQbyuslX;
 spf=pass (domain: geanix.com, ip: 109.224.244.107, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1793884023; x=1794143223;
	bh=Pf/cUvPf+/TGJIFZX9DlGip9qBzMqCMzSmUjLwRACBs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kQbyuslX99fGkRYPU752x0K/1ovAgHX+CBIqKbGmacZvDnQGEuol8mBkM5YMOZLfn
	 +GWSMfLElzdyE8H7vcTsH/TN0zQIA2fRnaGoOujjP2L5YHyyrFjpPAox6QxWDILCP6
	 pbJu/lc/mYUD+8ZWzncfNAFbeBcxvtgRdoo1EPv/RnTYaRUnzM297TMIKn5qWZHZDB
	 WPF20QC3uN8Gf+pXglHKLNlvjI3L117usgBFU7v0Yqazj+wxERkFmUDcwGwlySi7h3
	 FQ4ranfh8auxaPVSfbB2il6BcNP+/l4FeaUKE5ReoZ4h85LBkW9CUepXnM/t+wzA33
	 8B0WvtTa9K60g==
X-Pm-Submission-Id: 4jL2df0CnMz1DDnc
From: Sean Nyekjaer <sean@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sean Nyekjaer <sean@geanix.com>
Subject: [meta-oe][PATCH v2 2/5] zsh: drop unused libpcre2 dependency
Date: Thu,  5 Nov 2026 14:06:37 +0100
Message-ID: <20261105130640.683925-2-sean@geanix.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105130640.683925-1-sean@geanix.com>
References: <20261105130640.683925-1-sean@geanix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 13:07:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131921
Content-Type: text/plain; charset="utf-8"

The zsh/pcre module is link=3Ddynamic only, and the recipe configures
with --disable-dynamic, so the module is not built. pcre is also
disabled by default in configure.

Drop libpcre2 from DEPENDS to avoid pulling in an unused library.

Signed-off-by: Sean Nyekjaer <sean@geanix.com>
---
 meta-oe/recipes-shells/zsh/zsh_5.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/zsh/zsh_5.9.2.bb b/meta-oe/recipes-sh=
ells/zsh/zsh_5.9.2.bb
index fe3f0e1354..37948b5ea5 100644
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
--=20
2.55.0

