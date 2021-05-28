Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.web08.6527.1622197759122559744
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 May 2021 03:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@guy-morand.ch header.s=20191114 header.b=PFyXgP4U;
 spf=pass (domain: guy-morand.ch, ip: 83.166.143.173, mailfrom: guy@guy-morand.ch)
Received: from smtp-2-0001.mail.infomaniak.ch (unknown [10.5.36.108])
	by smtp-2-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Fs1BW1kNSzMppH8;
	Fri, 28 May 2021 12:29:07 +0200 (CEST)
Received: from morandg-desktop.localdomain (unknown [185.72.66.106])
	by smtp-2-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Fs1BV74gjzlh8jW;
	Fri, 28 May 2021 12:29:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=guy-morand.ch;
	s=20191114; t=1622197747;
	bh=Pd0dFuSTbM/ZbPyMwcmNbTY2KCPIvLJQHWkTUBOAgho=;
	h=From:To:Cc:Subject:Date:From;
	b=PFyXgP4UjxoumZ0wx0VAydYCaJFx/aqViSW4QeK51diuUPxg7uNFDyGkFvhjYLXrD
	 hcJ83r+C6QoeEVyzmjcLKGmR1nkCPy9Tc4rdSB3wf6vVXuJMc+7oglaxR40cIXxhcc
	 FlDqnE3QCWzKJEwUPtt7ouXN1pFVF4VADelLRwmU=
From: "Guy Morand" <guy@guy-morand.ch>
To: openembedded-devel@lists.openembedded.org
Cc: Guy Morand <guy@guy-morand.ch>
Subject: [meta-oe][PATCH] fish: add fish recipe
Date: Fri, 28 May 2021 12:29:02 +0200
Message-Id: <20210528102902.13676-1-guy@guy-morand.ch>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Guy Morand <guy@guy-morand.ch>
---
 meta-oe/recipes-shells/fish/fish_3.2.2.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-shells/fish/fish_3.2.2.bb

diff --git a/meta-oe/recipes-shells/fish/fish_3.2.2.bb b/meta-oe/recipes-=
shells/fish/fish_3.2.2.bb
new file mode 100644
index 000000000..6bbe92088
--- /dev/null
+++ b/meta-oe/recipes-shells/fish/fish_3.2.2.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "Finally, a command line shell for the 90s"
+DESCRIPTION =3D "fish is a smart and user-friendly command line shell \
+for Linux, macOS, and the rest of the family."
+HOMEPAGE =3D "https://fishshell.com/"
+AUTHOR =3D "fish-shell contributors"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9dbc95a48a7b8859e3c6db4c9396f=
053"
+
+inherit cmake
+
+DEPENDS =3D " \
+    ncurses \
+    "
+
+SRC_URI =3D "https://github.com/fish-shell/fish-shell/releases/download/=
${PV}/fish-${PV}.tar.xz"
+SRC_URI[md5sum] =3D "606253699ce41991b03a93bcc6047d51"
+SRC_URI[sha256sum] =3D "5944da1a8893d11b0828a4fd9136ee174549daffb3d0adfd=
d8917856fe6b4009"
--=20
2.31.1

