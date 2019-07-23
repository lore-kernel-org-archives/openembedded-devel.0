Return-Path: <wouter@wouterlucas.com>
X-Greylist: delayed 1143 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Jul 2019 04:23:32 UTC
Received: from h0stless.netw0rk.nl (h0stless.netw0rk.nl [149.210.182.68])
	by mail.openembedded.org (Postfix) with ESMTP id B95467E995
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Jul 2019 04:23:32 +0000 (UTC)
Received: from c-69-181-203-201.hsd1.ca.comcast.net ([69.181.203.201]
	helo=valravn.hsd1.ca.comcast.net) by h0stless.netw0rk.nl with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92)
	(envelope-from <wouter@wouterlucas.com>) id 1hpm2P-0001nE-OC
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jul 2019 06:04:29 +0200
From: Wouter-lucas van Boesschoten <wouter@wouterlucas.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Message-Id: <6C148EBD-DAFD-4D3A-9C58-53C6DF1E00FE@wouterlucas.com>
Date: Mon, 22 Jul 2019 21:04:27 -0700
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.104.11)
X-Authenticated-Id: wouter
Subject: [meta-python] [PATCH] python-jsonref: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 23 Jul 2019 04:23:33 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Wouter-lucas van Boesschoten <wouter@wouterlucas.com>
---
 .../python-jsonref/python-jsonref.inc                 | 11 +++++++++++
 .../python-jsonref/python-jsonref_0.2.bb              |  1 +
 2 files changed, 12 insertions(+)
 create mode 100644 =
meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
 create mode 100644 =
meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb

diff --git =
a/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc =
b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
new file mode 100644
index 000000000..0e69e4534
--- /dev/null
+++ b/meta-python/recipes-devtools/python-jsonref/python-jsonref.inc
@@ -0,0 +1,11 @@
+SUMMARY =3D "jsonref is a library for automatic dereferencing of JSON =
Reference objects for Python"
+HOMEPAGE =3D "https://github.com/gazpachoking/jsonref"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Da34264f25338d41744dca1abfe4eb18f"
+
+SRC_URI[md5sum] =3D "42b518b9ccd6852d1d709749bc96cb70"
+SRC_URI[sha256sum] =3D =
"f3c45b121cf6257eafabdc3a8008763aed1cd7da06dbabc59a9e4d2a5e4e6697"
+
+inherit pypi setuptools
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git =
a/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb =
b/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb
new file mode 100644
index 000000000..d97893f5a
--- /dev/null
+++ b/meta-python/recipes-devtools/python-jsonref/python-jsonref_0.2.bb
@@ -0,0 +1 @@
+require python-jsonref.inc
--=20
2.21.0


