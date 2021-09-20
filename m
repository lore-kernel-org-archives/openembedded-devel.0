Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web09.13168.1632150432938437524
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Sep 2021 08:07:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=s5F5RDlM;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 94C3F80735;
	Mon, 20 Sep 2021 17:07:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1632150429;
	bh=on/vVxtBVBHr5trKdGV8YBgHUnBDFCc3XMImu6kgk9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=s5F5RDlMYKpYOFF3Ct3FvnbOomj5w1GZH4q5vTTStEhYsQLBuqIX+6m91WfR6/G1Z
	 OmK3yu0yv+Wjws28za5e+o3DEXd3f/pETUIvfOBaPnV2uACjT/fEDbYKKSeirGgcfp
	 pdA9+aPXdF/lzCks3VZg0rZgKHqZ2AVn450bxrbGycxHkqhs52OWR4YCmG0Ep1rgkA
	 MTdr5++Z/mqejtUCBm730hWQgRGQpkd7vUVZPQKwMsAYwYp5g/1JXox+eso1Sspo0z
	 Jj7qBde4wy/jWrks+0a8yCUokcIQNoqwnwyRbloAr8PoAmTmJuGfZa2D5Xx/ElER/V
	 CWJ4vSHmn+/FA==
From: "Marek Vasut" <marex@denx.de>
To: openembedded-devel@lists.openembedded.org,
	akuster808@gmail.com
Cc: Ramon Fried <rfried.dev@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][dunfell][PATCH] yaml-cpp: add new recipe
Date: Mon, 20 Sep 2021 17:06:49 +0200
Message-Id: <20210920150649.8140-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable

From: Ramon Fried <rfried.dev@gmail.com>

yaml-cpp is a YAML parser and emitter in C++
matching the YAML 1.2 spec.

Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 4090ca3b5be48b4df4c526cf0b66bf02ee2a8058)
---
NOTE: This would be useful to me in dunfell, but it is not a fix
---
 .../packagegroups/packagegroup-meta-oe.bb       |  1 +
 .../recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b=
/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 505d4efc1..3f2e23c13 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -279,6 +279,7 @@ RDEPENDS_packagegroup-meta-oe-support =3D"\
     tree uhubctl unixodbc uriparser usb-modeswitch \
     usb-modeswitch-data uthash utouch-evemu utouch-frame \
     vim vim-tiny websocketpp xdelta3 xdg-user-dirs xmlstarlet \
+    yaml-cpp \
     zbar zile \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "geis toscoterm uim s=
ynergy utouch-mtview links-x11 fltk pidgin-otr", "", d)} \
     libcanberra \
diff --git a/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb b/meta-oe=
/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
new file mode 100644
index 000000000..9d359d624
--- /dev/null
+++ b/meta-oe/recipes-support/yaml-cpp/yaml-cpp_0.6.3.bb
@@ -0,0 +1,17 @@
+SUMMARY =3D "yaml-cpp parser and emitter library"
+DESCRIPTION =3D "yaml-cpp is a YAML parser and emitter in C++ matching t=
he YAML 1.2 spec."
+HOMEPAGE =3D "https://github.com/jbeder/yaml-cpp"
+SECTION =3D "devel"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6a8aaf0595c2efc1a9c2e0913e9c1=
a2c"
+
+# yaml-cpp releases are stored as archive files in github.
+# download the exact revision of release
+SRC_URI =3D "git://github.com/jbeder/yaml-cpp.git"
+SRCREV =3D "9a3624205e8774953ef18f57067b3426c1c5ada6"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE =3D "-DYAML_CPP_BUILD_TESTS=3DOFF -DYAML_BUILD_SHARED_LIBS=
=3DON -DYAML_CPP_BUILD_TOOLS=3DOFF"
--=20
2.33.0

