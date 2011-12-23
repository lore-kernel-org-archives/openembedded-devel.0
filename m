Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RdzPl-0003mU-10
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Dec 2011 08:19:37 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id 2EDD8A6510;
	Fri, 23 Dec 2011 08:12:27 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 23 Dec 2011 08:12:16 +0100
Message-Id: <1324624336-18713-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6.4
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe] gdb-cross-canadian: build gdb with python support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Dec 2011 07:19:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

* python support is needed for providing finer scripting control
in gdb, and for remote controling gdb for example from qtcreator
* gdb/configure tries to autodetect python using python executable
with --includes --ldflags --exec-prefix to get the right flags
As it's difficult to achieve in OE's context, we generate a
script which will return the right values and make gdb's build
system happy. This idea was taken from the following article :
http://www.mentby.com/doug-evans-2/python-enabled-gdb-on-windows-and-relo=
cation.html
* tested using angstrom & armv7/armv5 targets & qtcreator 201005 & 2.4.0

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../gdb/gdb-cross-canadian_7.3.1.bbappend          |   20 ++++++++++++++=
++++++
 1 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1=
.bbappend

diff --git a/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappe=
nd b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
new file mode 100644
index 0000000..3bbfe38
--- /dev/null
+++ b/meta-oe/recipes-devtools/gdb/gdb-cross-canadian_7.3.1.bbappend
@@ -0,0 +1,20 @@
+DEPENDS +=3D "python-nativesdk"
+RDEPENDS +=3D "python-nativesdk-core python-nativesdk-lang python-native=
sdk-re \
+			 python-nativesdk-codecs python-nativesdk-netclient"
+
+EXTRA_OECONF_append =3D "--with-python=3D${WORKDIR}/python"
+PRINC =3D "1"
+
+do_configure_prepend() {
+cat > ${WORKDIR}/python << EOF
+#! /bin/sh
+case "\$2" in
+	--includes) echo "-I${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}=
-${HOST_OS}${exec_prefix}/include/python${PYTHON_BASEVERSION}/" ;;
+	--ldflags) echo "-L${STAGING_DIR}/${HOST_ARCH}-nativesdk${HOST_VENDOR}-=
${HOST_OS}${libdir}/python${PYTHON_BASEVERSION}/config/config -lpthread -=
ldl -lutil -lm -lpython${PYTHON_BASEVERSION}" ;;
+	--exec-prefix) echo "/usr" ;;
+	*) exit 1 ;;
+esac
+exit 0
+EOF
+	chmod +x ${WORKDIR}/python
+}
--=20
1.7.6.4



