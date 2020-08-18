Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web12.62053.1597740758225332690
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 01:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id B8E92600DF;
	Tue, 18 Aug 2020 08:52:33 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
From: "Jack Mitchell" <ml@embed.me.uk>
To: openembedded-devel@lists.openembedded.org
Cc: Philip Balister <philip@balister.org>,
	Leon Anavi <leon.anavi@konsulko.com>,
	Jack Mitchell <ml@embed.me.uk>
Subject: [meta-python][PATCH] python3-pybind11: install both python wheel and cmake build
Date: Tue, 18 Aug 2020 09:52:15 +0100
Message-Id: <20200818085215.538731-1-ml@embed.me.uk>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at c03mi01
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

The wheel for this module doesn't install the required cmake
files, yet the cmake build doesn't install the required
python module files. Therefore use manual calls to the cmake
and distutils classes in order to get both into the final
package. This method is also what other popular distros use
such as Archlinux.

Signed-off-by: Jack Mitchell <ml@embed.me.uk>
---
 .../python/python3-pybind11_2.5.0.bb             | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.b=
b b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
index 46bba8d8d..9674ec093 100644
--- a/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pybind11_2.5.0.bb
@@ -17,4 +17,18 @@ BBCLASSEXTEND =3D "native"
=20
 EXTRA_OECMAKE =3D  "-DPYBIND11_TEST=3DOFF"
=20
-inherit cmake python3native
+inherit cmake setuptools3 python3native
+
+do_configure() {
+	cmake_do_configure
+}
+
+do_compile() {
+	distutils3_do_compile
+	cmake_do_compile
+}
+
+do_install() {
+	distutils3_do_install
+	cmake_do_install
+}
--=20
2.28.0

