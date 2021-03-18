Received: from proxima.lasnet.de (proxima.lasnet.de [78.47.171.185])
 by mx.groups.io with SMTP id smtpd.web09.47.1616095977552327762
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Mar 2021 12:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: datenfreihafen.org, ip: 78.47.171.185, mailfrom: stefan@datenfreihafen.org)
Received: from localhost.localdomain.datenfreihafen.local (p200300e9d726e120e9b10dbb2bfdc675.dip0.t-ipconnect.de [IPv6:2003:e9:d726:e120:e9b1:dbb:2bfd:c675])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan@sostec.de)
	by proxima.lasnet.de (Postfix) with ESMTPSA id B3947C0C99;
	Thu, 18 Mar 2021 20:32:54 +0100 (CET)
From: "Stefan Schmidt" <stefan@datenfreihafen.org>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Schmidt <stefan@datenfreihafen.org>,
	Stefan Schmidt <stefan.schmidt@huawei.com>
Subject: [meta-oe][PATCH 1/2] musl-rpmatch_git.bb: add new recipe to provide rpmatch() for musl libc builds
Date: Thu, 18 Mar 2021 20:32:35 +0100
Message-Id: <20210318193235.1647878-1-stefan@datenfreihafen.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Stefan Schmidt <stefan.schmidt@huawei.com>

Musl does not provide rpmatch() while glibc does. This is a standalone
implementation for musl libc based systems.

Using it for a recipe is as simple as adding the dependency and adding
-lrpmatch to the LDFLAGS for linking. An example for plymouth is
provided as follow up patch.

Signed-off-by: Stefan Schmidt <stefan.schmidt@huawei.com>
---
 .../recipes-core/musl-rpmatch/musl-rpmatch_git.bb    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb

diff --git a/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb b/meta=
-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
new file mode 100644
index 000000000..553003f7f
--- /dev/null
+++ b/meta-oe/recipes-core/musl-rpmatch/musl-rpmatch_git.bb
@@ -0,0 +1,12 @@
+SUMMARY =3D "Implementation of rpmatch(3) for musl libc."
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D81a81bf31abecc50c20862fc8a716=
329"
+
+SRC_URI =3D "gitsm://github.com/pullmoll/musl-rpmatch.git;protocol=3Dhtt=
ps"
+
+PV =3D "1.0+git${SRCPV}"
+SRCREV =3D "46267b154987d3e1f25d3a75423faa62bb5ee342"
+
+inherit autotools
+
+S =3D "${WORKDIR}/git"
--=20
2.30.2

