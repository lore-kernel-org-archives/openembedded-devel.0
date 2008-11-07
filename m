Received: from [84.96.83.115] (helo=relay.martec.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cyril.humbert@martec.fr>) id 1KyPDv-0007MC-Ih
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Nov 2008 12:09:55 +0100
Received: from localhost (relay.martec.fr [127.0.0.1])
	by relay.martec.fr (Postfix) with ESMTP id 16FB440C052
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2008 11:47:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at martec.fr
Received: from relay.martec.fr ([127.0.0.1])
	by localhost (relay.martec.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oaJBTxch2I71
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2008 11:47:42 +0100 (CET)
Received: from srvm1.martec.fr (unknown [192.168.20.3])
	by relay.martec.fr (Postfix) with ESMTP id 29E7540C04D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Nov 2008 11:47:42 +0100 (CET)
Received: from [192.168.20.66] ([192.168.20.66])
	by srvm1.martec.fr (Lotus Domino Release 8.0.1)
	with ESMTP id 2008110711473468-10205 ;
	Fri, 7 Nov 2008 11:47:34 +0100 
Message-ID: <49141CC9.9060601@martec.fr>
Date: Fri, 07 Nov 2008 11:47:37 +0100
From: Cyril Humbert <cyril.humbert@martec.fr>
Organization: MARTEC
User-Agent: Mozilla-Thunderbird 2.0.0.17 (X11/20081018)
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-MIMETrack: Itemize by SMTP Server on srvm1/martec_sevres/FR(Release
	8.0.1|February 07, 2008) at 07/11/2008 11:47:34,
	Serialize by Router on srvm1/martec_sevres/FR(Release 8.0.1|February 07,
	2008) at 07/11/2008 11:47:35,
	Serialize complete at 07/11/2008 11:47:35
Subject: Python standard lib: provide a new package for SSL support (lib-dynload/_ssl.so)
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
X-List-Received-Date: Fri, 07 Nov 2008 11:09:56 -0000
Content-Type: multipart/mixed; boundary="------------040803070505050903050108"

--------------040803070505050903050108
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1; format=flowed

Hello,

I'm using Python on a target where RAM is quite limited. I've noticed 
that "import socket" module will dynload libcrypto.so.0.9.8 and
libssl.so.0.9.8, which are quite big.

Currently, Python SSL support is provided through the package 
"python-io". I propose to remove 
"${libdir}/python2.5/lib-dynload/_ssl.so" from FILES_python-io and to 
put it in a new package called, for example, "python-ssl".

This way, you can selectively enable/disable SSL support by installing 
removing python-ssl package. This allows to save memory in situations 
where you need Python socket module without SSL support.

Here is an example of memory usage (using pmap), resp. without and with 
python-ssl installed. A Python interpreter is started and the module 
socket is imported.
==================================================================
--- import-socket-without-ssl.txt	Fri Nov  7 09:58:35 2008
+++ import-socket-with-ssl.txt	Fri Nov  7 09:59:12 2008
@@ -1,8 +1,8 @@
-1961:   python
+1977:   python
  Address   Kbytes     RSS    Anon  Locked Mode   Mapping
  00008000       4       -       -       - r-x--  python
  00010000       4       -       -       - rw---  python
-00011000     524       -       -       - rwx--    [ anon ]
+00011000     536       -       -       - rwx--    [ anon ]
  40000000     112       -       -       - r-x--  ld-2.6.1.so
  4001c000      12       -       -       - rw---    [ anon ]
  40023000       8       -       -       - rw---  ld-2.6.1.so
@@ -36,6 +36,19 @@
  403d4000      48       -       -       - r-x--  _socket.so
  403e0000      32       -       -       - -----  _socket.so
  403e8000      12       -       -       - rw---  _socket.so
-bef97000      84       -       -       - rwx--    [ stack ]
+403eb000      16       -       -       - r-x--  _ssl.so
+403ef000      28       -       -       - -----  _ssl.so
+403f6000       4       -       -       - rw---  _ssl.so
+403f7000     224       -       -       - r-x--  libssl.so.0.9.8
+4042f000      28       -       -       - -----  libssl.so.0.9.8
+40436000      16       -       -       - rw---  libssl.so.0.9.8
+4043a000    1108       -       -       - r-x--  libcrypto.so.0.9.8
+4054f000      28       -       -       - -----  libcrypto.so.0.9.8
+40556000      84       -       -       - rw---  libcrypto.so.0.9.8
+4056b000      12       -       -       - rw---    [ anon ]
+4056e000      40       -       -       - r-x--  libgcc_s.so.1
+40578000      28       -       -       - -----  libgcc_s.so.1
+4057f000       4       -       -       - rw---  libgcc_s.so.1
+be91d000      84       -       -       - rwx--    [ stack ]
  -------- ------- ------- ------- -------
-total kB    4612       -       -       -
+total kB    6244       -       -       -
=======================================================================

The attached patch contains the modifications to 
generate-manifest-2.5.py in order to move SSL support into a new package 
called "python-ssl". In this case, other Python package dependency list 
should of course be adjusted accordingly when SSL support is needed:

    s/RDEPENDS="python-io"/RDEPENDS="python-io python-ssl"/

Best Regards,
-- 
Cyril

--------------040803070505050903050108
Content-Type: text/x-patch;
 name="0087-Python-2.5-provide-lib-dynload-_ssl.so-in-a-new-pac.patch"
Content-Disposition: inline;
 filename*0="0087-Python-2.5-provide-lib-dynload-_ssl.so-in-a-new-pac.pat";
 filename*1="ch"
Content-Transfer-Encoding: quoted-printable

From 6f55a737439f8e21919a50c4d81801bbc95e5d4c Mon Sep 17 00:00:00 2001
From: Cyril Humbert <cyril.humbert@martec.fr>
Date: Thu, 6 Nov 2008 17:11:09 +0100
Subject: [PATCH] Python-2.5: provide lib-dynload/_ssl.so in a new package=
: python-ssl

---
 meta/packages/python/python-2.5-manifest.inc |   54 ++++++++++++++------=
------
 scripts/generate-manifest-2.5.py             |   21 +++++++---
 2 files changed, 43 insertions(+), 32 deletions(-)

diff --git a/meta/packages/python/python-2.5-manifest.inc b/meta/packages=
/python/python-2.5-manifest.inc
index b882ac0..9c867ca 100644
--- a/meta/packages/python/python-2.5-manifest.inc
+++ b/meta/packages/python/python-2.5-manifest.inc
@@ -1,18 +1,14 @@
-########################################################################=
#######
-### AUTO-GENERATED by './generate-manifest-2.5.py'=20
-### [(C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>]
-###
-### Visit THE Python for Embedded Systems Site=20
-### http://www.Vanille.de/projects/python.spy
-###
-### Warning: Manual edits will be lost!
-### Note: The script generate-manifest-2.5.py is in OpenEmbedded tree in
-###       the directory contrib/python/ .
-########################################################################=
#######
-=20
-PROVIDES+=3D"python-profile python-threading python-distutils python-doc=
test python-codecs python-ctypes python-pickle python-bzip2 python-dateti=
me python-core python-io python-compiler python-compression python-re pyt=
hon-xmlrpc python-terminal python-email python-image python-tests python-=
core-dbg python-resource python-devel python-difflib python-math python-s=
yslog python-hotshot python-unixadmin python-textutils python-tkinter pyt=
hon-gdbm python-elementtree python-fcntl python-netclient python-pprint p=
ython-netserver python-curses python-smtpd python-html python-readline py=
thon-subprocess python-pydoc python-logging python-mailbox python-xml pyt=
hon-mime python-sqlite3 python-sqlite3-tests python-unittest python-strin=
gold python-robotparser python-compile python-debugger python-pkgutil pyt=
hon-shell python-bsddb python-mmap python-zlib python-db python-crypt pyt=
hon-idle python-lang python-audio "
-
-PACKAGES=3D"python-profile python-threading python-distutils python-doct=
est python-codecs python-ctypes python-pickle python-bzip2 python-datetim=
e python-core python-io python-compiler python-compression python-re pyth=
on-xmlrpc python-terminal python-email python-image python-tests python-c=
ore-dbg python-resource python-devel python-difflib python-math python-sy=
slog python-hotshot python-unixadmin python-textutils python-tkinter pyth=
on-gdbm python-elementtree python-fcntl python-netclient python-pprint py=
thon-netserver python-curses python-smtpd python-html python-readline pyt=
hon-subprocess python-pydoc python-logging python-mailbox python-xml pyth=
on-mime python-sqlite3 python-sqlite3-tests python-unittest python-string=
old python-robotparser python-compile python-debugger python-pkgutil pyth=
on-shell python-bsddb python-mmap python-zlib python-db python-crypt pyth=
on-idle python-lang python-audio "
+# WARNING: This file is AUTO GENERATED: Manual edits will be lost next t=
ime I regenerate the file.
+# Generator: './generate-manifest-2.5.py' Version 20081102 (C) 2002-2008=
 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Visit the Python for Embedded Systems Site =3D> http://www.Vanille.de/=
projects/python.spy
+#
+# See also:
+#  * <OE_basedir>/contrib/python/generate-manifest-2.5.py
+#  * <poky_basedir>/scripts/generate-manifest-2.5.py
+
+PROVIDES+=3D"python-profile python-threading python-distutils python-doc=
test python-codecs python-ctypes python-pickle python-bzip2 python-dateti=
me python-core python-io python-compiler python-compression python-re pyt=
hon-xmlrpc python-terminal python-email python-image python-tests python-=
core-dbg python-resource python-devel python-difflib python-math python-s=
yslog python-hotshot python-unixadmin python-textutils python-tkinter pyt=
hon-gdbm python-stringold python-fcntl python-netclient python-pprint pyt=
hon-netserver python-curses python-smtpd python-html python-readline pyth=
on-subprocess python-pydoc python-logging python-mailbox python-xml pytho=
n-mime python-sqlite3 python-sqlite3-tests python-unittest python-ssl pyt=
hon-robotparser python-elementtree python-compile python-debugger python-=
pkgutil python-shell python-bsddb python-mmap python-zlib python-db pytho=
n-crypt python-idle python-lang python-audio "
+
+PACKAGES=3D"python-profile python-threading python-distutils python-doct=
est python-codecs python-ctypes python-pickle python-bzip2 python-datetim=
e python-core python-io python-compiler python-compression python-re pyth=
on-xmlrpc python-terminal python-email python-image python-tests python-c=
ore-dbg python-resource python-devel python-difflib python-math python-sy=
slog python-hotshot python-unixadmin python-textutils python-tkinter pyth=
on-gdbm python-stringold python-fcntl python-netclient python-pprint pyth=
on-netserver python-curses python-smtpd python-html python-readline pytho=
n-subprocess python-pydoc python-logging python-mailbox python-xml python=
-mime python-sqlite3 python-sqlite3-tests python-unittest python-ssl pyth=
on-robotparser python-elementtree python-compile python-debugger python-p=
kgutil python-shell python-bsddb python-mmap python-zlib python-db python=
-crypt python-idle python-lang python-audio "
=20
 DESCRIPTION_python-profile=3D"Python Basic Profiling Support"
 PR_python-profile=3D"ml0"
@@ -65,9 +61,9 @@ RDEPENDS_python-core=3D""
 FILES_python-core=3D"${libdir}/python2.5/__future__.* ${libdir}/python2.=
5/copy.* ${libdir}/python2.5/copy_reg.* ${libdir}/python2.5/ConfigParser.=
* ${libdir}/python2.5/getopt.* ${libdir}/python2.5/linecache.* ${libdir}/=
python2.5/new.* ${libdir}/python2.5/os.* ${libdir}/python2.5/posixpath.* =
${libdir}/python2.5/struct.* ${libdir}/python2.5/warnings.* ${libdir}/pyt=
hon2.5/site.* ${libdir}/python2.5/stat.* ${libdir}/python2.5/UserDict.* $=
{libdir}/python2.5/UserList.* ${libdir}/python2.5/UserString.* ${libdir}/=
python2.5/lib-dynload/binascii.so ${libdir}/python2.5/lib-dynload/_struct=
.so ${libdir}/python2.5/lib-dynload/time.so ${libdir}/python2.5/lib-dynlo=
ad/xreadlines.so ${libdir}/python2.5/types.* ${bindir}/python* "
=20
 DESCRIPTION_python-io=3D"Python Low-Level I/O"
-PR_python-io=3D"ml0"
+PR_python-io=3D"ml1"
 RDEPENDS_python-io=3D"python-core python-math"
-FILES_python-io=3D"${libdir}/python2.5/lib-dynload/_socket.so ${libdir}/=
python2.5/lib-dynload/_ssl.so ${libdir}/python2.5/lib-dynload/select.so $=
{libdir}/python2.5/lib-dynload/termios.so ${libdir}/python2.5/lib-dynload=
/cStringIO.so ${libdir}/python2.5/pipes.* ${libdir}/python2.5/socket.* ${=
libdir}/python2.5/tempfile.* ${libdir}/python2.5/StringIO.* "
+FILES_python-io=3D"${libdir}/python2.5/lib-dynload/_socket.so ${libdir}/=
python2.5/lib-dynload/select.so ${libdir}/python2.5/lib-dynload/termios.s=
o ${libdir}/python2.5/lib-dynload/cStringIO.so ${libdir}/python2.5/pipes.=
* ${libdir}/python2.5/socket.* ${libdir}/python2.5/tempfile.* ${libdir}/p=
ython2.5/StringIO.* "
=20
 DESCRIPTION_python-compiler=3D"Python Compiler Support"
 PR_python-compiler=3D"ml0"
@@ -164,10 +160,10 @@ PR_python-gdbm=3D"ml0"
 RDEPENDS_python-gdbm=3D"python-core"
 FILES_python-gdbm=3D"${libdir}/python2.5/lib-dynload/gdbm.so "
=20
-DESCRIPTION_python-elementtree=3D"Python elementree"
-PR_python-elementtree=3D"ml0"
-RDEPENDS_python-elementtree=3D"python-core"
-FILES_python-elementtree=3D"${libdir}/python2.5/lib-dynload/_elementtree=
.so "
+DESCRIPTION_python-stringold=3D"Python String APIs [deprecated]"
+PR_python-stringold=3D"ml0"
+RDEPENDS_python-stringold=3D"python-core python-re"
+FILES_python-stringold=3D"${libdir}/python2.5/lib-dynload/strop.so ${lib=
dir}/python2.5/string.* "
=20
 DESCRIPTION_python-fcntl=3D"Python's fcntl Interface"
 PR_python-fcntl=3D"ml0"
@@ -254,16 +250,21 @@ PR_python-unittest=3D"ml0"
 RDEPENDS_python-unittest=3D"python-core python-stringold python-lang"
 FILES_python-unittest=3D"${libdir}/python2.5/unittest.* "
=20
-DESCRIPTION_python-stringold=3D"Python String APIs [deprecated]"
-PR_python-stringold=3D"ml0"
-RDEPENDS_python-stringold=3D"python-core python-re"
-FILES_python-stringold=3D"${libdir}/python2.5/lib-dynload/strop.so ${lib=
dir}/python2.5/string.* "
+DESCRIPTION_python-ssl=3D"Python SSL Support"
+PR_python-ssl=3D"ml0"
+RDEPENDS_python-ssl=3D"python-core"
+FILES_python-ssl=3D"${libdir}/python2.5/lib-dynload/_ssl.so "
=20
 DESCRIPTION_python-robotparser=3D"Python robots.txt parser"
 PR_python-robotparser=3D"ml0"
 RDEPENDS_python-robotparser=3D"python-core python-netclient"
 FILES_python-robotparser=3D"${libdir}/python2.5/robotparser.* "
=20
+DESCRIPTION_python-elementtree=3D"Python elementree"
+PR_python-elementtree=3D"ml0"
+RDEPENDS_python-elementtree=3D"python-core"
+FILES_python-elementtree=3D"${libdir}/python2.5/lib-dynload/_elementtree=
.so "
+
 DESCRIPTION_python-compile=3D"Python Bytecode Compilation Support"
 PR_python-compile=3D"ml0"
 RDEPENDS_python-compile=3D"python-core"
@@ -323,3 +324,6 @@ DESCRIPTION_python-audio=3D"Python Audio Handling"
 PR_python-audio=3D"ml0"
 RDEPENDS_python-audio=3D"python-core"
 FILES_python-audio=3D"${libdir}/python2.5/wave.* ${libdir}/python2.5/chu=
nk.* ${libdir}/python2.5/sndhdr.* ${libdir}/python2.5/lib-dynload/ossaudi=
odev.so ${libdir}/python2.5/lib-dynload/audioop.so "
+
+
+
diff --git a/scripts/generate-manifest-2.5.py b/scripts/generate-manifest=
-2.5.py
index 8054608..1635561 100755
--- a/scripts/generate-manifest-2.5.py
+++ b/scripts/generate-manifest-2.5.py
@@ -22,10 +22,14 @@ class MakefileMaker:
         self.packages =3D {}
         self.targetPrefix =3D "${libdir}/python%s/" % VERSION[:3]
         self.output =3D outfile
-        self.out( """ \
+        self.out( """\
 # WARNING: This file is AUTO GENERATED: Manual edits will be lost next t=
ime I regenerate the file.
 # Generator: '%s' Version %s (C) 2002-2008 Michael 'Mickey' Lauer <mlaue=
r@vanille-media.de>
 # Visit the Python for Embedded Systems Site =3D> http://www.Vanille.de/=
projects/python.spy
+#
+# See also:
+#  * <OE_basedir>/contrib/python/generate-manifest-2.5.py
+#  * <poky_basedir>/scripts/generate-manifest-2.5.py
 """ % ( sys.argv[0], __version__ ) )
=20
     #
@@ -63,15 +67,15 @@ class MakefileMaker:
=20
         #
         # generate provides line
-        #=20
-=20
+        #
+
         provideLine =3D 'PROVIDES+=3D"'
         for name in self.packages:
             provideLine +=3D "%s " % name
         provideLine +=3D '"'
=20
         self.out( provideLine )
-        self.out( "" )      =20
+        self.out( "" )
=20
         #
         # generate package line
@@ -233,8 +237,8 @@ if __name__ =3D=3D "__main__":
     m.addPackage( 0, "python-image", "Python Graphical Image Handling", =
"python-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
=20
-    m.addPackage( 0, "python-io", "Python Low-Level I/O", "python-core p=
ython-math",
-    "lib-dynload/_socket.so lib-dynload/_ssl.so lib-dynload/select.so li=
b-dynload/termios.so lib-dynload/cStringIO.so "
+    m.addPackage( 1, "python-io", "Python Low-Level I/O", "python-core p=
ython-math",
+    "lib-dynload/_socket.so lib-dynload/select.so lib-dynload/termios.so=
 lib-dynload/cStringIO.so "
     "pipes.* socket.* tempfile.* StringIO.* " )
=20
     m.addPackage( 0, "python-lang", "Python Low-Level Language Support",=
 "python-core",
@@ -262,7 +266,7 @@ if __name__ =3D=3D "__main__":
     "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*"=
 )
=20
     m.addPackage( 0, "python-netclient", "Python Internet Protocol Clien=
ts", "python-core python-crypt python-datetime python-io python-lang pyth=
on-logging python-mime",
-    "*Cookie*.* " +=20
+    "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetype=
s.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.=
*" )
=20
     m.addPackage( 0, "python-netserver", "Python Internet Protocol Serve=
rs", "python-core python-netclient",
@@ -304,6 +308,9 @@ if __name__ =3D=3D "__main__":
     m.addPackage( 0, "python-sqlite3-tests", "Python Sqlite3 Database Su=
pport Tests", "python-core python-sqlite3",
     "sqlite3/test" )
=20
+
+    m.addPackage( 0, "python-ssl", "Python SSL Support", "python-core", =
"lib-dynload/_ssl.so" )
+
     m.addPackage( 0, "python-stringold", "Python String APIs [deprecated=
]", "python-core python-re",
     "lib-dynload/strop.so string.*" )
=20
--=20
1.5.6.5


--------------040803070505050903050108--
