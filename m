Received: from smtp.missinglinkelectronics.com (smtp.missinglinkelectronics.com [94.130.14.54])
 by mx.groups.io with SMTP id smtpd.web10.15118.1621231775743361676
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 23:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: missinglinkelectronics.com, ip: 94.130.14.54, mailfrom: stefan.wiehler@missinglinkelectronics.com)
Received: from localhost (localhost [127.0.0.1])
	by smtp.missinglinkelectronics.com (Postfix) with ESMTP id 9059F20304
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 May 2021 08:09:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at missinglinkelectronics.com
Received: from smtp.missinglinkelectronics.com ([127.0.0.1])
	by localhost (mail.missinglinkelectronics.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmqlD45MeG2n; Mon, 17 May 2021 08:09:33 +0200 (CEST)
Received: from pfanne-bionic2.mle (p578c5bfe.dip0.t-ipconnect.de [87.140.91.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: stefan)
	by smtp.missinglinkelectronics.com (Postfix) with ESMTPSA id 4CC1E202A8;
	Mon, 17 May 2021 08:09:33 +0200 (CEST)
From: "Stefan Wiehler" <stefan.wiehler@missinglinkelectronics.com>
To: openembedded-devel@lists.openembedded.org
Cc: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Subject: [meta-networking][PATCH v2 1/2] http-parser: add recipe
Date: Mon, 17 May 2021 08:09:19 +0200
Message-Id: <20210517060920.109438-1-stefan.wiehler@missinglinkelectronics.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

HTTP request/response parser for C.

Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
---
 .../http-parser/http-parser_2.9.4.bb          | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-networking/recipes-support/http-parser/http-pars=
er_2.9.4.bb

diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.=
4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
new file mode 100644
index 000000000..2d04ded34
--- /dev/null
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "HTTP request/response parser for C"
+DESCRIPTION =3D "This is a parser for HTTP messages written in C. It par=
ses \
+              both requests and responses. The parser is designed to be =
used \
+              in performance HTTP applications. It does not make any \
+              syscalls nor allocations, it does not buffer data, it can =
be \
+              interrupted at anytime. Depending on your architecture, it=
 \
+              only requires about 40 bytes of data per message stream (i=
n a \
+              web server that is per connection)."
+AUTHOR =3D "Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>"
+HOMEPAGE =3D "https://github.com/nodejs/http-parser"
+SECTION =3D "libs"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE-MIT;md5=3D9bfa835d048c194ab30487af8=
d7b3778"
+
+SRC_URI =3D "git://github.com/nodejs/http-parser.git"
+SRCREV =3D "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
+
+S =3D "${WORKDIR}/git"
+
+do_configure[noexec] =3D "1"
+
+do_compile() {
+    oe_runmake library package
+}
+
+do_install() {
+    oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix}
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.29.2

