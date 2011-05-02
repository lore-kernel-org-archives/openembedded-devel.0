Received: from smtp-out04.msg.oleane.net ([62.161.7.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <christian.charreyre@cioinfoindus.fr>)
	id 1QGxQd-0004MT-Lg for openembedded-devel@lists.openembedded.org;
	Mon, 02 May 2011 20:01:03 +0200
Received: from smtp01.msg.oleane.net (smtp01.mail.priv [172.17.20.110]) 
	by smtp-out04.msg.oleane.net with ESMTP id p42HwTsZ008783
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 May 2011 19:58:29 +0200
Received: from [192.168.1.148] (AMarseille-551-1-66-56.w80-9.abo.wanadoo.fr
	[80.9.121.56]) (authenticated)
	by smtp01.msg.oleane.net (MTA) with ESMTP id p42Hc1K0030421
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 May 2011 19:38:02 +0200
X-Oleane-Rep: REPA
Message-ID: <4DBEEBFA.9040007@cioinfoindus.fr>
Date: Mon, 02 May 2011 19:38:02 +0200
From: Christian Charreyre <christian.charreyre@cioinfoindus.fr>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110419 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Spam-Flag: NO
X-PMX-Spam: Probability=8%
X-PFSI-Info: PMX 5.5.9.395186, Antispam-Engine: 2.7.2.376379,
	Antispam-Data: 2011.5.2.172122 (no antivirus check)
X-Orange-Auth: Y2I1NTMtM0BjaW9pbmZvaW4uZnIuZnRv
Subject: [PATCH v3] mypaint: new recipe for version 0.9.1
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
X-List-Received-Date: Mon, 02 May 2011 18:01:03 -0000
X-Groupsio-MsgNum: 31572
Content-Type: multipart/mixed; boundary="------------050805080001000803020908"

--------------050805080001000803020908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by smtp-out04.msg.oleane.net id p42HwTsZ008783

After additional tests, found that there are still mistakes in=20
DEPENDS_${PN} line.
I don't know why _${PN} must be removed for the line to be effective.

Post corrected patch in version v4.

-------- Message original --------
Sujet: 	[PATCH v3] mypaint: new recipe for version 0.9.1
Date : 	Mon, 2 May 2011 18:33:48 +0200
De : 	Christian Charreyre <christian.charreyre@cioinfoindus.fr>
Pour : 	openembedded-devel@lists.openembedded.org
Copie =E0 : 	Christian Charreyre <christian.charreyre@cioinfoindus.fr>



Signed-off-by: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
---
  recipes/mypaint/files/scons-adapt.patch |   20 +++++++++++++++++
  recipes/mypaint/mypaint_0.9.1.bb        |   36 ++++++++++++++++++++++++=
+++++++
  2 files changed, 56 insertions(+), 0 deletions(-)
  create mode 100644 recipes/mypaint/files/scons-adapt.patch
  create mode 100644 recipes/mypaint/mypaint_0.9.1.bb

diff --git a/recipes/mypaint/files/scons-adapt.patch b/recipes/mypaint/fi=
les/scons-adapt.patch
new file mode 100644
index 0000000..dcad6db
--- /dev/null
+++ b/recipes/mypaint/files/scons-adapt.patch
@@ -0,0 +1,50 @@
+Author: Christian Charreyre<christian.charreyre@cioinfoindus.fr>
+
+Adapt scons to OE
+Index: mypaint-0.9.1/lib/SConscript
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- mypaint-0.9.1.orig/lib/SConscript	2011-04-21 11:31:29.000000000 +020=
0
++++ mypaint-0.9.1/lib/SConscript	2011-04-21 11:35:30.000000000 +0200
+@@ -1,5 +1,11 @@
+ Import('env')
+-import sys
++import sys, os
++env.Replace(SHCXX =3D os.environ['CXX'])
++env.Replace(SHLINK =3D os.environ['CXX'])
++env.Replace(LDMODULEFLAGS =3D os.environ['TARGET_LDFLAGS'])
++env.Append(LDMODULEFLAGS =3D ['-Wl,--hash-style=3Dgnu'])
++env.Append(LDMODULEFLAGS =3D ['-shared'])
++env.Replace(PATH =3D os.environ['PATH'])
+
+ # For the record: I know that scons supports swig. But it doesn't scan =
for #include in the generated code.
+ #
+Index: mypaint-0.9.1/SConstruct
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+--- mypaint-0.9.1.orig/SConstruct	2011-03-04 15:44:59.000000000 +0100
++++ mypaint-0.9.1/SConstruct	2011-05-02 17:21:17.000000000 +0200
+@@ -11,13 +11,6 @@
+ if sys.platform =3D=3D "win32":
+     python =3D 'python' # usually no versioned binaries on Windows
+
+-try:
+-    import numpy
+-except ImportError:
+-    print 'You need to have numpy installed.'
+-    print
+-    raise
+-
+ SConsignFile() # no .scsonsign into $PREFIX please
+
+ if sys.platform =3D=3D "darwin":
+@@ -40,8 +33,9 @@
+
+ env.Append(CXXFLAGS=3D' -Wall -Wno-sign-compare -Wno-write-strings')
+
+-# Get the numpy include path (for numpy/arrayobject.h).
+-numpy_path =3D numpy.get_include()
++# Defines the numpy include path (for numpy/arrayobject.h).
++# This is specefic to OE, to avoid to build python-numpy-native
++numpy_path =3D os.environ['STAGING_DIR_TARGET']+os.environ['PYTHON_SITE=
PACKAGES_DIR']+'/numpy/core/include'
+ env.Append(CPPPATH=3Dnumpy_path)
+
+
diff --git a/recipes/mypaint/mypaint_0.9.1.bb b/recipes/mypaint/mypaint_0=
.9.1.bb
new file mode 100644
index 0000000..a7e5077
--- /dev/null
+++ b/recipes/mypaint/mypaint_0.9.1.bb
@@ -0,0 +1,37 @@
+DESCRIPTION=3D"fast and easy open-source graphics application for digita=
l painters"
+LICENSE=3D"GPL"
+SECTION =3D "x11/applications"
+PRIORITY =3D "optional"
+HOMEPAGE =3D "http://mypaint.intilinux.com/"
+
+DEPENDS_${PN} =3D "libglib libpng libpython libstdc++ python-numpy"
+RDEPENDS_${PN} =3D "python-image python-json"
+
+SRC_URI =3D "http://download.gna.org/mypaint/${PN}-${PV}.tar.bz2 \
+	file://scons-adapt.patch \
+"
+
+SRC_URI[md5sum] =3D "6249a16359a438d6dc658f5765b35515"
+SRC_URI[sha256sum] =3D "407b599f62fb0d6e711fee57d22e64d3aec88825364fb5f7=
f73b9f0940aa7aed"
+
+inherit distutils scons
+
+do_compile() {
+       STAGING_INCDIR=3D${STAGING_INCDIR} \
+       STAGING_LIBDIR=3D${STAGING_LIBDIR} \
+       STAGING_DIR_TARGET=3D${STAGING_DIR_TARGET} \
+       PYTHON_SITEPACKAGES_DIR=3D${PYTHON_SITEPACKAGES_DIR} \
+       BUILD_SYS=3D${BUILD_SYS} \
+       HOST_SYS=3D${HOST_SYS} \
+       PATH=3D${PATH} scons_do_compile
+}
+
+do_install() {
+       STAGING_DIR_TARGET=3D${STAGING_DIR_TARGET} \
+       PYTHON_SITEPACKAGES_DIR=3D${PYTHON_SITEPACKAGES_DIR} \
+       BUILD_SYS=3D${BUILD_SYS} \
+       HOST_SYS=3D${HOST_SYS} \
+       scons_do_install
+}
+
+FILES_${PN} +=3D "${datadir}"
--=20
1.7.0.4





--------------050805080001000803020908
Content-Type: text/x-vcard; charset=utf-8;
 name="christian_charreyre.vcf"
Content-Disposition: attachment;
 filename="christian_charreyre.vcf"
Content-Transfer-Encoding: 7bit

begin:vcard
fn:Christian  Charreyre
n:Charreyre;Christian 
org:CIO Informatique Industrielle
adr;dom:;;11 Avenue Marigny;Marseille;;13014
email;internet:christian.charreyre@cioinfoindus.fr
tel;work:04 95 05 19 41
url:http://www.cioinfoindus.fr
version:2.1
end:vcard


--------------050805080001000803020908--
