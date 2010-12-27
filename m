Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bgamari.foss@gmail.com>) id 1PXIJH-0000wQ-LM
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 20:07:49 +0100
Received: by qwg5 with SMTP id 5so8412628qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 10:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=qVZhwHY+BkGAOHfx/QDyP2zIXMz6sUE8oVSyKUOCR/g=;
	b=fTImmyy57ztNFpamJ/hWOQzG1KZrYu7e9zom3UFWVRcAG6FVje6+kPGObDZu1wkNZN
	Ujd6+2Y9c33hxl6Zv9gBr9Y4UfpMOZRddtIyXiBgn1yC0Vy/PexuxAbrY9kDLo/wFVFE
	UOntyLU1oK5GWoFdDxucJye6lLn+o9MY95ewU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=T9y79rzw19eNyFbedFqLbPIkQTprfG69yke5bhQ+NJvdeetLNl03MPjDYurqdHLavs
	8HKX1SjRcp1efbiUWEcH/0f0DGsseibD1mnUKeQjjFAMRmSmG8xrC+f7eEJNt3P44/eh
	H3dI6PvSrXKdrtQacoH2XI6sdJSm+huu2aVms=
Received: by 10.224.60.68 with SMTP id o4mr12387952qah.12.1293476392941;
	Mon, 27 Dec 2010 10:59:52 -0800 (PST)
Received: from ben-laptop (c-24-61-223-13.hsd1.nh.comcast.net [24.61.223.13])
	by mx.google.com with ESMTPS id p13sm7119717qcu.5.2010.12.27.10.59.51
	(version=SSLv3 cipher=RC4-MD5); Mon, 27 Dec 2010 10:59:52 -0800 (PST)
From: Ben Gamari <bgamari.foss@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Dec 2010 13:59:45 -0500
Message-Id: <1293476385-7289-2-git-send-email-bgamari.foss@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
References: <1293476385-7289-1-git-send-email-bgamari.foss@gmail.com>
Subject: [PATCH] python: Initial commit of python 2.7.1
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
X-List-Received-Date: Mon, 27 Dec 2010 19:07:49 -0000

---
 recipes/python/python-2.7-manifest.inc             |  272 ++++++++++++++++++++
 .../00-fix-bindir-libdir-for-cross.patch           |   20 ++
 .../01-fix-have-long-long-format.patch             |   19 ++
 .../01-use-proper-tools-for-cross-build.patch      |  169 ++++++++++++
 .../python-2.7.1/02-remove-test-for-cross.patch    |  108 ++++++++
 .../python-2.7.1/03-fix-tkinter-detection.patch    |   40 +++
 .../python-2.7.1/04-default-is-optimized.patch     |   18 ++
 .../05-enable-ctypes-cross-build.patch             |   28 ++
 .../06-ctypes-libffi-fix-configure.patch           |   44 ++++
 .../10-distutils-fix-swig-parameter.patch          |   16 ++
 .../11-distutils-never-modify-shebang-line.patch   |   18 ++
 ...2-distutils-prefix-is-inside-staging-area.patch |   60 +++++
 .../python-2.7.1/99-ignore-optimization-flag.patch |   19 ++
 recipes/python/python-2.7.1/debug.patch            |   27 ++
 recipes/python/python-2.7.1/nohostlibs.patch       |   29 ++
 recipes/python/python-2.7.1/sitecustomize.py       |   45 ++++
 .../00-fix-bindir-libdir-for-cross.patch           |   20 ++
 .../01-fix-have-long-long-format.patch             |   19 ++
 .../01-use-proper-tools-for-cross-build.patch      |  169 ++++++++++++
 .../02-remove-test-for-cross.patch                 |  108 ++++++++
 .../03-fix-tkinter-detection.patch                 |   40 +++
 .../04-default-is-optimized.patch                  |   18 ++
 .../05-enable-ctypes-cross-build.patch             |   28 ++
 .../06-ctypes-libffi-fix-configure.patch           |   44 ++++
 .../10-distutils-fix-swig-parameter.patch          |   16 ++
 .../11-distutils-never-modify-shebang-line.patch   |   18 ++
 ...2-distutils-prefix-is-inside-staging-area.patch |   60 +++++
 .../99-ignore-optimization-flag.patch              |   19 ++
 recipes/python/python-native-2.7.1/debug.patch     |   27 ++
 .../python/python-native-2.7.1/nohostlibs.patch    |   29 ++
 .../python/python-native-2.7.1/sitecustomize.py    |   45 ++++
 recipes/python/python-native_2.7.1.bb              |   38 +++
 recipes/python/python2.7.inc                       |   23 ++
 recipes/python/python_2.7.1.bb                     |  132 ++++++++++
 34 files changed, 1785 insertions(+), 0 deletions(-)
 create mode 100644 recipes/python/python-2.7-manifest.inc
 create mode 100644 recipes/python/python-2.7.1/00-fix-bindir-libdir-for-cross.patch
 create mode 100644 recipes/python/python-2.7.1/01-fix-have-long-long-format.patch
 create mode 100644 recipes/python/python-2.7.1/01-use-proper-tools-for-cross-build.patch
 create mode 100644 recipes/python/python-2.7.1/02-remove-test-for-cross.patch
 create mode 100644 recipes/python/python-2.7.1/03-fix-tkinter-detection.patch
 create mode 100644 recipes/python/python-2.7.1/04-default-is-optimized.patch
 create mode 100644 recipes/python/python-2.7.1/05-enable-ctypes-cross-build.patch
 create mode 100644 recipes/python/python-2.7.1/06-ctypes-libffi-fix-configure.patch
 create mode 100644 recipes/python/python-2.7.1/10-distutils-fix-swig-parameter.patch
 create mode 100644 recipes/python/python-2.7.1/11-distutils-never-modify-shebang-line.patch
 create mode 100644 recipes/python/python-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 recipes/python/python-2.7.1/99-ignore-optimization-flag.patch
 create mode 100644 recipes/python/python-2.7.1/debug.patch
 create mode 100644 recipes/python/python-2.7.1/nohostlibs.patch
 create mode 100644 recipes/python/python-2.7.1/sitecustomize.py
 create mode 100644 recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch
 create mode 100644 recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch
 create mode 100644 recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch
 create mode 100644 recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch
 create mode 100644 recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch
 create mode 100644 recipes/python/python-native-2.7.1/04-default-is-optimized.patch
 create mode 100644 recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch
 create mode 100644 recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch
 create mode 100644 recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch
 create mode 100644 recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch
 create mode 100644 recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
 create mode 100644 recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch
 create mode 100644 recipes/python/python-native-2.7.1/debug.patch
 create mode 100644 recipes/python/python-native-2.7.1/nohostlibs.patch
 create mode 100644 recipes/python/python-native-2.7.1/sitecustomize.py
 create mode 100644 recipes/python/python-native_2.7.1.bb
 create mode 100644 recipes/python/python2.7.inc
 create mode 100644 recipes/python/python_2.7.1.bb

diff --git a/recipes/python/python-2.7-manifest.inc b/recipes/python/python-2.7-manifest.inc
new file mode 100644
index 0000000..c6833de
--- /dev/null
+++ b/recipes/python/python-2.7-manifest.inc
@@ -0,0 +1,272 @@
+
+# WARNING: This file is AUTO GENERATED: Manual edits will be lost next time I regenerate the file.
+# Generator: '../../contrib/python/generate-manifest-2.7.py' Version 20100908 (C) 2002-2010 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# Visit the Python for Embedded Systems Site => http://www.Vanille.de/projects/python.spy
+
+ 
+
+PROVIDES+="python-codecs python-threading python-distutils python-doctest python-stringold python-curses python-ctypes python-pickle python-datetime python-core python-io python-compression python-re python-profile python-xmlrpc python-terminal python-dev python-email python-image python-tests python-core-dbg python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-compiler python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio "
+
+PACKAGES="python-core-dbg python-codecs python-threading python-distutils python-doctest python-stringold python-curses python-ctypes python-pickle python-datetime python-core python-io python-compression python-re python-profile python-xmlrpc python-terminal python-dev python-email python-image python-tests python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-compiler python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio python-modules"
+
+DESCRIPTION_python-codecs="Python Codecs, Encodings & i18n Support"
+RDEPENDS_python-codecs="python-core python-lang"
+FILES_python-codecs="${libdir}/python2.7/codecs.* ${libdir}/python2.7/encodings ${libdir}/python2.7/gettext.* ${libdir}/python2.7/locale.* ${libdir}/python2.7/lib-dynload/_locale.so ${libdir}/python2.7/lib-dynload/unicodedata.so ${libdir}/python2.7/stringprep.* ${libdir}/python2.7/xdrlib.* "
+
+DESCRIPTION_python-threading="Python Threading & Synchronization Support"
+RDEPENDS_python-threading="python-core python-lang"
+FILES_python-threading="${libdir}/python2.7/_threading_local.* ${libdir}/python2.7/dummy_thread.* ${libdir}/python2.7/dummy_threading.* ${libdir}/python2.7/mutex.* ${libdir}/python2.7/threading.* ${libdir}/python2.7/Queue.* "
+
+DESCRIPTION_python-distutils="Python Distribution Utilities"
+RDEPENDS_python-distutils="python-core"
+FILES_python-distutils="${libdir}/python2.7/config ${libdir}/python2.7/distutils "
+
+DESCRIPTION_python-doctest="Python framework for running examples in docstrings."
+RDEPENDS_python-doctest="python-core python-lang python-io python-re python-unittest python-debugger python-difflib"
+FILES_python-doctest="${libdir}/python2.7/doctest.* "
+
+DESCRIPTION_python-stringold="Python String APIs [deprecated]"
+RDEPENDS_python-stringold="python-core python-re"
+FILES_python-stringold="${libdir}/python2.7/lib-dynload/strop.so ${libdir}/python2.7/string.* "
+
+DESCRIPTION_python-curses="Python Curses Support"
+RDEPENDS_python-curses="python-core"
+FILES_python-curses="${libdir}/python2.7/curses ${libdir}/python2.7/lib-dynload/_curses.so ${libdir}/python2.7/lib-dynload/_curses_panel.so "
+
+DESCRIPTION_python-ctypes="Python C Types Support"
+RDEPENDS_python-ctypes="python-core"
+FILES_python-ctypes="${libdir}/python2.7/ctypes ${libdir}/python2.7/lib-dynload/_ctypes.so "
+
+DESCRIPTION_python-pickle="Python Persistence Support"
+RDEPENDS_python-pickle="python-core python-codecs python-io python-re"
+FILES_python-pickle="${libdir}/python2.7/pickle.* ${libdir}/python2.7/shelve.* ${libdir}/python2.7/lib-dynload/cPickle.so "
+
+DESCRIPTION_python-datetime="Python Calendar and Time support"
+RDEPENDS_python-datetime="python-core python-codecs"
+FILES_python-datetime="${libdir}/python2.7/_strptime.* ${libdir}/python2.7/calendar.* ${libdir}/python2.7/lib-dynload/datetime.so "
+
+DESCRIPTION_python-core="Python Interpreter and core modules (needed!)"
+RDEPENDS_python-core=""
+FILES_python-core="${libdir}/python2.7/__future__.* ${libdir}/python2.7/_abcoll.* ${libdir}/python2.7/abc.* ${libdir}/python2.7/copy.* ${libdir}/python2.7/copy_reg.* ${libdir}/python2.7/ConfigParser.* ${libdir}/python2.7/genericpath.* ${libdir}/python2.7/getopt.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/new.* ${libdir}/python2.7/os.* ${libdir}/python2.7/posixpath.* ${libdir}/python2.7/struct.* ${libdir}/python2.7/warnings.* ${libdir}/python2.7/site.* ${libdir}/python2.7/stat.* ${libdir}/python2.7/UserDict.* ${libdir}/python2.7/UserList.* ${libdir}/python2.7/UserString.* ${libdir}/python2.7/lib-dynload/binascii.so ${libdir}/python2.7/lib-dynload/_struct.so ${libdir}/python2.7/lib-dynload/time.so ${libdir}/python2.7/lib-dynload/xreadlines.so ${libdir}/python2.7/types.* ${libdir}/python2.7/platform.* ${bindir}/python* "
+
+DESCRIPTION_python-io="Python Low-Level I/O"
+RDEPENDS_python-io="python-core python-math"
+FILES_python-io="${libdir}/python2.7/lib-dynload/_socket.so ${libdir}/python2.7/lib-dynload/_ssl.so ${libdir}/python2.7/lib-dynload/select.so ${libdir}/python2.7/lib-dynload/termios.so ${libdir}/python2.7/lib-dynload/cStringIO.so ${libdir}/python2.7/pipes.* ${libdir}/python2.7/socket.* ${libdir}/python2.7/ssl.* ${libdir}/python2.7/tempfile.* ${libdir}/python2.7/StringIO.* "
+
+DESCRIPTION_python-compression="Python High Level Compression Support"
+RDEPENDS_python-compression="python-core python-zlib"
+FILES_python-compression="${libdir}/python2.7/gzip.* ${libdir}/python2.7/zipfile.* ${libdir}/python2.7/tarfile.* ${libdir}/python2.7/lib-dynload/bz2.so "
+
+DESCRIPTION_python-re="Python Regular Expression APIs"
+RDEPENDS_python-re="python-core"
+FILES_python-re="${libdir}/python2.7/re.* ${libdir}/python2.7/sre.* ${libdir}/python2.7/sre_compile.* ${libdir}/python2.7/sre_constants* ${libdir}/python2.7/sre_parse.* "
+
+DESCRIPTION_python-profile="Python Basic Profiling Support"
+RDEPENDS_python-profile="python-core python-textutils"
+FILES_python-profile="${libdir}/python2.7/profile.* ${libdir}/python2.7/pstats.* ${libdir}/python2.7/cProfile.* ${libdir}/python2.7/lib-dynload/_lsprof.so "
+
+DESCRIPTION_python-xmlrpc="Python XMLRPC Support"
+RDEPENDS_python-xmlrpc="python-core python-xml python-netserver python-lang"
+FILES_python-xmlrpc="${libdir}/python2.7/xmlrpclib.* ${libdir}/python2.7/SimpleXMLRPCServer.* "
+
+DESCRIPTION_python-terminal="Python Terminal Controlling Support"
+RDEPENDS_python-terminal="python-core python-io"
+FILES_python-terminal="${libdir}/python2.7/pty.* ${libdir}/python2.7/tty.* "
+
+DESCRIPTION_python-dev="Python Development Package"
+RDEPENDS_python-dev="python-core"
+FILES_python-dev="${includedir} ${libdir}/libpython2.6.so ${libdir}/python2.7/config "
+
+DESCRIPTION_python-email="Python Email Support"
+RDEPENDS_python-email="python-core python-io python-re python-mime python-audio python-image python-netclient"
+FILES_python-email="${libdir}/python2.7/imaplib.* ${libdir}/python2.7/email "
+
+DESCRIPTION_python-image="Python Graphical Image Handling"
+RDEPENDS_python-image="python-core"
+FILES_python-image="${libdir}/python2.7/colorsys.* ${libdir}/python2.7/imghdr.* ${libdir}/python2.7/lib-dynload/imageop.so ${libdir}/python2.7/lib-dynload/rgbimg.so "
+
+DESCRIPTION_python-tests="Python Tests"
+RDEPENDS_python-tests="python-core"
+FILES_python-tests="${libdir}/python2.7/test "
+
+DESCRIPTION_python-core-dbg="Python core module debug information"
+RDEPENDS_python-core-dbg="python-core"
+FILES_python-core-dbg="${libdir}/python2.7/config/.debug ${libdir}/python2.7/lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug "
+
+DESCRIPTION_python-resource="Python Resource Control Interface"
+RDEPENDS_python-resource="python-core"
+FILES_python-resource="${libdir}/python2.7/lib-dynload/resource.so "
+
+DESCRIPTION_python-json="Python JSON Support"
+RDEPENDS_python-json="python-core python-math python-re"
+FILES_python-json="${libdir}/python2.7/json "
+
+DESCRIPTION_python-difflib="Python helpers for computing deltas between objects."
+RDEPENDS_python-difflib="python-lang python-re"
+FILES_python-difflib="${libdir}/python2.7/difflib.* "
+
+DESCRIPTION_python-math="Python Math Support"
+RDEPENDS_python-math="python-core"
+FILES_python-math="${libdir}/python2.7/lib-dynload/cmath.so ${libdir}/python2.7/lib-dynload/math.so ${libdir}/python2.7/lib-dynload/_random.so ${libdir}/python2.7/random.* ${libdir}/python2.7/sets.* "
+
+DESCRIPTION_python-syslog="Python Syslog Interface"
+RDEPENDS_python-syslog="python-core"
+FILES_python-syslog="${libdir}/python2.7/lib-dynload/syslog.so "
+
+DESCRIPTION_python-hotshot="Python Hotshot Profiler"
+RDEPENDS_python-hotshot="python-core"
+FILES_python-hotshot="${libdir}/python2.7/hotshot ${libdir}/python2.7/lib-dynload/_hotshot.so "
+
+DESCRIPTION_python-unixadmin="Python Unix Administration Support"
+RDEPENDS_python-unixadmin="python-core"
+FILES_python-unixadmin="${libdir}/python2.7/lib-dynload/nis.so ${libdir}/python2.7/lib-dynload/grp.so ${libdir}/python2.7/lib-dynload/pwd.so ${libdir}/python2.7/getpass.* "
+
+DESCRIPTION_python-textutils="Python Option Parsing, Text Wrapping and Comma-Separated-Value Support"
+RDEPENDS_python-textutils="python-core python-io python-re python-stringold"
+FILES_python-textutils="${libdir}/python2.7/lib-dynload/_csv.so ${libdir}/python2.7/csv.* ${libdir}/python2.7/optparse.* ${libdir}/python2.7/textwrap.* "
+
+DESCRIPTION_python-tkinter="Python Tcl/Tk Bindings"
+RDEPENDS_python-tkinter="python-core"
+FILES_python-tkinter="${libdir}/python2.7/lib-dynload/_tkinter.so ${libdir}/python2.7/lib-tk "
+
+DESCRIPTION_python-gdbm="Python GNU Database Support"
+RDEPENDS_python-gdbm="python-core"
+FILES_python-gdbm="${libdir}/python2.7/lib-dynload/gdbm.so "
+
+DESCRIPTION_python-elementtree="Python elementree"
+RDEPENDS_python-elementtree="python-core"
+FILES_python-elementtree="${libdir}/python2.7/lib-dynload/_elementtree.so "
+
+DESCRIPTION_python-fcntl="Python's fcntl Interface"
+RDEPENDS_python-fcntl="python-core"
+FILES_python-fcntl="${libdir}/python2.7/lib-dynload/fcntl.so "
+
+DESCRIPTION_python-netclient="Python Internet Protocol Clients"
+RDEPENDS_python-netclient="python-core python-crypt python-datetime python-io python-lang python-logging python-mime"
+FILES_python-netclient="${libdir}/python2.7/*Cookie*.* ${libdir}/python2.7/base64.* ${libdir}/python2.7/cookielib.* ${libdir}/python2.7/ftplib.* ${libdir}/python2.7/gopherlib.* ${libdir}/python2.7/hmac.* ${libdir}/python2.7/httplib.* ${libdir}/python2.7/mimetypes.* ${libdir}/python2.7/nntplib.* ${libdir}/python2.7/poplib.* ${libdir}/python2.7/smtplib.* ${libdir}/python2.7/telnetlib.* ${libdir}/python2.7/urllib.* ${libdir}/python2.7/urllib2.* ${libdir}/python2.7/urlparse.* ${libdir}/python2.7/uuid.* ${libdir}/python2.7/rfc822.* ${libdir}/python2.7/mimetools.* "
+
+DESCRIPTION_python-pprint="Python Pretty-Print Support"
+RDEPENDS_python-pprint="python-core"
+FILES_python-pprint="${libdir}/python2.7/pprint.* "
+
+DESCRIPTION_python-netserver="Python Internet Protocol Servers"
+RDEPENDS_python-netserver="python-core python-netclient"
+FILES_python-netserver="${libdir}/python2.7/cgi.* ${libdir}/python2.7/*HTTPServer.* ${libdir}/python2.7/SocketServer.* "
+
+DESCRIPTION_python-compiler="Python Compiler Support"
+RDEPENDS_python-compiler="python-core"
+FILES_python-compiler="${libdir}/python2.7/compiler "
+
+DESCRIPTION_python-smtpd="Python Simple Mail Transport Daemon"
+RDEPENDS_python-smtpd="python-core python-netserver python-email python-mime"
+FILES_python-smtpd="${bindir}/smtpd.* "
+
+DESCRIPTION_python-html="Python HTML Processing"
+RDEPENDS_python-html="python-core"
+FILES_python-html="${libdir}/python2.7/formatter.* ${libdir}/python2.7/htmlentitydefs.* ${libdir}/python2.7/htmllib.* ${libdir}/python2.7/markupbase.* ${libdir}/python2.7/sgmllib.* "
+
+DESCRIPTION_python-readline="Python Readline Support"
+RDEPENDS_python-readline="python-core"
+FILES_python-readline="${libdir}/python2.7/lib-dynload/readline.so ${libdir}/python2.7/rlcompleter.* "
+
+DESCRIPTION_python-subprocess="Python Subprocess Support"
+RDEPENDS_python-subprocess="python-core python-io python-re python-fcntl python-pickle"
+FILES_python-subprocess="${libdir}/python2.7/subprocess.* "
+
+DESCRIPTION_python-pydoc="Python Interactive Help Support"
+RDEPENDS_python-pydoc="python-core python-lang python-stringold python-re"
+FILES_python-pydoc="${bindir}/pydoc ${libdir}/python2.7/pydoc.* "
+
+DESCRIPTION_python-logging="Python Logging Support"
+RDEPENDS_python-logging="python-core python-io python-lang python-pickle python-stringold"
+FILES_python-logging="${libdir}/python2.7/logging "
+
+DESCRIPTION_python-mailbox="Python Mailbox Format Support"
+RDEPENDS_python-mailbox="python-core python-mime"
+FILES_python-mailbox="${libdir}/python2.7/mailbox.* "
+
+DESCRIPTION_python-xml="Python basic XML support."
+RDEPENDS_python-xml="python-core python-re"
+FILES_python-xml="${libdir}/python2.7/lib-dynload/pyexpat.so ${libdir}/python2.7/xml ${libdir}/python2.7/xmllib.* "
+
+DESCRIPTION_python-mime="Python MIME Handling APIs"
+RDEPENDS_python-mime="python-core python-io"
+FILES_python-mime="${libdir}/python2.7/mimetools.* ${libdir}/python2.7/uu.* ${libdir}/python2.7/quopri.* ${libdir}/python2.7/rfc822.* "
+
+DESCRIPTION_python-sqlite3="Python Sqlite3 Database Support"
+RDEPENDS_python-sqlite3="python-core python-datetime python-lang python-crypt python-io python-threading python-zlib"
+FILES_python-sqlite3="${libdir}/python2.7/lib-dynload/_sqlite3.so ${libdir}/python2.7/sqlite3/dbapi2.* ${libdir}/python2.7/sqlite3/__init__.* ${libdir}/python2.7/sqlite3/dump.* "
+
+DESCRIPTION_python-sqlite3-tests="Python Sqlite3 Database Support Tests"
+RDEPENDS_python-sqlite3-tests="python-core python-sqlite3"
+FILES_python-sqlite3-tests="${libdir}/python2.7/sqlite3/test "
+
+DESCRIPTION_python-unittest="Python Unit Testing Framework"
+RDEPENDS_python-unittest="python-core python-stringold python-lang"
+FILES_python-unittest="${libdir}/python2.7/unittest.* "
+
+DESCRIPTION_python-multiprocessing="Python Multiprocessing Support"
+RDEPENDS_python-multiprocessing="python-core python-io python-lang"
+FILES_python-multiprocessing="${libdir}/python2.7/lib-dynload/_multiprocessing.so ${libdir}/python2.7/multiprocessing "
+
+DESCRIPTION_python-robotparser="Python robots.txt parser"
+RDEPENDS_python-robotparser="python-core python-netclient"
+FILES_python-robotparser="${libdir}/python2.7/robotparser.* "
+
+DESCRIPTION_python-compile="Python Bytecode Compilation Support"
+RDEPENDS_python-compile="python-core"
+FILES_python-compile="${libdir}/python2.7/py_compile.* ${libdir}/python2.7/compileall.* "
+
+DESCRIPTION_python-debugger="Python Debugger"
+RDEPENDS_python-debugger="python-core python-io python-lang python-re python-stringold python-shell python-pprint"
+FILES_python-debugger="${libdir}/python2.7/bdb.* ${libdir}/python2.7/pdb.* "
+
+DESCRIPTION_python-pkgutil="Python Package Extension Utility Support"
+RDEPENDS_python-pkgutil="python-core"
+FILES_python-pkgutil="${libdir}/python2.7/pkgutil.* "
+
+DESCRIPTION_python-shell="Python Shell-Like Functionality"
+RDEPENDS_python-shell="python-core python-re"
+FILES_python-shell="${libdir}/python2.7/cmd.* ${libdir}/python2.7/commands.* ${libdir}/python2.7/dircache.* ${libdir}/python2.7/fnmatch.* ${libdir}/python2.7/glob.* ${libdir}/python2.7/popen2.* ${libdir}/python2.7/shlex.* ${libdir}/python2.7/shutil.* "
+
+DESCRIPTION_python-bsddb="Python Berkeley Database Bindings"
+RDEPENDS_python-bsddb="python-core"
+FILES_python-bsddb="${libdir}/python2.7/bsddb ${libdir}/python2.7/lib-dynload/_bsddb.so "
+
+DESCRIPTION_python-numbers="Python Number APIs"
+RDEPENDS_python-numbers="python-core python-lang python-re"
+FILES_python-numbers="${libdir}/python2.7/decimal.* ${libdir}/python2.7/numbers.* "
+
+DESCRIPTION_python-mmap="Python Memory-Mapped-File Support"
+RDEPENDS_python-mmap="python-core python-io"
+FILES_python-mmap="${libdir}/python2.7/lib-dynload/mmap.so "
+
+DESCRIPTION_python-zlib="Python zlib Support."
+RDEPENDS_python-zlib="python-core"
+FILES_python-zlib="${libdir}/python2.7/lib-dynload/zlib.so "
+
+DESCRIPTION_python-db="Python File-Based Database Support"
+RDEPENDS_python-db="python-core"
+FILES_python-db="${libdir}/python2.7/anydbm.* ${libdir}/python2.7/dumbdbm.* ${libdir}/python2.7/whichdb.* "
+
+DESCRIPTION_python-crypt="Python Basic Cryptographic and Hashing Support"
+RDEPENDS_python-crypt="python-core"
+FILES_python-crypt="${libdir}/python2.7/hashlib.* ${libdir}/python2.7/md5.* ${libdir}/python2.7/sha.* ${libdir}/python2.7/lib-dynload/crypt.so ${libdir}/python2.7/lib-dynload/_hashlib.so ${libdir}/python2.7/lib-dynload/_sha256.so ${libdir}/python2.7/lib-dynload/_sha512.so "
+
+DESCRIPTION_python-idle="Python Integrated Development Environment"
+RDEPENDS_python-idle="python-core python-tkinter"
+FILES_python-idle="${bindir}/idle ${libdir}/python2.7/idlelib "
+
+DESCRIPTION_python-lang="Python Low-Level Language Support"
+RDEPENDS_python-lang="python-core"
+FILES_python-lang="${libdir}/python2.7/lib-dynload/_bisect.so ${libdir}/python2.7/lib-dynload/_collections.so ${libdir}/python2.7/lib-dynload/_heapq.so ${libdir}/python2.7/lib-dynload/_weakref.so ${libdir}/python2.7/lib-dynload/_functools.so ${libdir}/python2.7/lib-dynload/array.so ${libdir}/python2.7/lib-dynload/itertools.so ${libdir}/python2.7/lib-dynload/operator.so ${libdir}/python2.7/lib-dynload/parser.so ${libdir}/python2.7/atexit.* ${libdir}/python2.7/bisect.* ${libdir}/python2.7/code.* ${libdir}/python2.7/codeop.* ${libdir}/python2.7/collections.* ${libdir}/python2.7/dis.* ${libdir}/python2.7/functools.* ${libdir}/python2.7/heapq.* ${libdir}/python2.7/inspect.* ${libdir}/python2.7/keyword.* ${libdir}/python2.7/opcode.* ${libdir}/python2.7/symbol.* ${libdir}/python2.7/repr.* ${libdir}/python2.7/token.* ${libdir}/python2.7/tokenize.* ${libdir}/python2.7/traceback.* ${libdir}/python2.7/linecache.* ${libdir}/python2.7/weakref.* "
+
+DESCRIPTION_python-audio="Python Audio Handling"
+RDEPENDS_python-audio="python-core"
+FILES_python-audio="${libdir}/python2.7/wave.* ${libdir}/python2.7/chunk.* ${libdir}/python2.7/sndhdr.* ${libdir}/python2.7/lib-dynload/ossaudiodev.so ${libdir}/python2.7/lib-dynload/audioop.so "
+
+DESCRIPTION_python-modules="All Python modules"
+RDEPENDS_python-modules="python-codecs python-threading python-distutils python-doctest python-stringold python-curses python-ctypes python-pickle python-datetime python-core python-io python-compression python-re python-profile python-xmlrpc python-terminal python-email python-image python-tests python-resource python-json python-difflib python-math python-syslog python-hotshot python-unixadmin python-textutils python-tkinter python-gdbm python-elementtree python-fcntl python-netclient python-pprint python-netserver python-compiler python-smtpd python-html python-readline python-subprocess python-pydoc python-logging python-mailbox python-xml python-mime python-sqlite3 python-sqlite3-tests python-unittest python-multiprocessing python-robotparser python-compile python-debugger python-pkgutil python-shell python-bsddb python-numbers python-mmap python-zlib python-db python-crypt python-idle python-lang python-audio  "
+ALLOW_EMPTY_python-modules = "1"
+
+
diff --git a/recipes/python/python-2.7.1/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-2.7.1/00-fix-bindir-libdir-for-cross.patch
new file mode 100644
index 0000000..2559e3a
--- /dev/null
+++ b/recipes/python/python-2.7.1/00-fix-bindir-libdir-for-cross.patch
@@ -0,0 +1,20 @@
+# $(exec_prefix) points to the wrong directory, when installing
+# a cross-build. @bindir@ and @libdir@ works better and doesn't
+# affect the native build.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
+ datarootdir=    @datarootdir@
+ 
+ # Expanded directories
+-BINDIR=		$(exec_prefix)/bin
+-LIBDIR=		$(exec_prefix)/lib
++BINDIR=		@bindir@
++LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/python/python-2.7.1/01-fix-have-long-long-format.patch b/recipes/python/python-2.7.1/01-fix-have-long-long-format.patch
new file mode 100644
index 0000000..6cf3cd4
--- /dev/null
+++ b/recipes/python/python-2.7.1/01-fix-have-long-long-format.patch
@@ -0,0 +1,19 @@
+# The configure script assumes the %lld printf format is not available as it
+# can't run its check script. For some reason python refuses to compile without
+# this functionality, so we just assume that our printf supports %lld.
+#
+# Include/pyport.h:243:13: error: #error "This platform's pyconfig.h needs to define PY_FORMAT_LONG_LONG"
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -4151,7 +4151,7 @@ then
+   ]]])],
+   [ac_cv_have_long_long_format=yes],
+   [ac_cv_have_long_long_format=no],
+-  [ac_cv_have_long_long_format=no])
++  [ac_cv_have_long_long_format=yes])
+   )
+   AC_MSG_RESULT($ac_cv_have_long_long_format)
+ fi
diff --git a/recipes/python/python-2.7.1/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-2.7.1/01-use-proper-tools-for-cross-build.patch
new file mode 100644
index 0000000..8420eb3
--- /dev/null
+++ b/recipes/python/python-2.7.1/01-use-proper-tools-for-cross-build.patch
@@ -0,0 +1,169 @@
+# We need to ensure our host tools get run during build, not the freshly
+# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-27 13:16:38.032631011 -0500
++++ Python-2.7.1/setup.py	2010-12-27 13:16:50.130290766 -0500
+@@ -313,6 +313,7 @@
+             self.failed.append(ext.name)
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -347,8 +348,8 @@
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -452,6 +453,9 @@
+ 
+         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
+ 
++        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
++        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++
+         #
+         # The following modules are all pretty straightforward, and compile
+         # on pretty much any POSIXish platform.
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in	2010-12-27 13:16:38.022628181 -0500
++++ Python-2.7.1/Makefile.pre.in	2010-12-27 13:17:31.870473931 -0500
+@@ -201,6 +201,7 @@
+ 
+ ##########################################################################
+ # Grammar
++GRAMMAR_STAMP=	$(srcdir)/grammar-stamp
+ GRAMMAR_H=	$(srcdir)/Include/graminit.h
+ GRAMMAR_C=	$(srcdir)/Python/graminit.c
+ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+@@ -380,7 +381,7 @@
+ 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-generate" LIBS="$(LIBS) -lgcov"
+ 
+ run_profile_task:
+-	./$(BUILDPYTHON) $(PROFILE_TASK)
++	$(HOSTPYTHON) $(PROFILE_TASK)
+ 
+ build_all_use_profile:
+ 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-use"
+@@ -398,14 +399,14 @@
+ 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
+ 
+ platform: $(BUILDPYTHON)
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
++	$(RUNSHARED) $(HOSTPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
+ 
+ 
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -535,10 +536,24 @@
+ Modules/python.o: $(srcdir)/Modules/python.c
+ 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
+ 
++# GNU "make" interprets rules with two dependents as two copies of the rule.
++#
++# In a parallel build this can lead to pgen being run twice, once for each of
++# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the compiler
++# reads a partially-overwritten copy of one of these files, leading to syntax
++# errors (or linker errors if the fragment happens to be syntactically valid C)
++#
++# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outputs.html
++# for more information.
++#
++# Introduce ".grammar-stamp" as a contrived single output from PGEN to avoid
++# this:
++$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
+ 
+-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+ 		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		touch $(GRAMMAR_STAMP)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -921,25 +936,25 @@
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -1044,7 +1059,7 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+@@ -1117,7 +1132,7 @@
+ # This installs a few of the useful scripts in Tools/scripts
+ scriptsinstall:
+ 	SRCDIR=$(srcdir) $(RUNSHARED) \
+-	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/setup.py install \
++	$(HOSTPYTHON) $(srcdir)/Tools/scripts/setup.py install \
+ 	--prefix=$(prefix) \
+ 	--install-scripts=$(BINDIR) \
+ 	--root=/$(DESTDIR)
+@@ -1139,7 +1154,7 @@
+ 
+ # Run reindent on the library
+ reindent:
+-	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
++	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
+ 
+ # Rerun configure with the same options as it was run last time,
+ # provided the config.status script exists
+@@ -1242,7 +1257,7 @@
+ 
+ # Perform some verification checks on any modified files.
+ patchcheck:
+-	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
++	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
+ 
+ # Dependencies
+ 
diff --git a/recipes/python/python-2.7.1/02-remove-test-for-cross.patch b/recipes/python/python-2.7.1/02-remove-test-for-cross.patch
new file mode 100644
index 0000000..ab5858c
--- /dev/null
+++ b/recipes/python/python-2.7.1/02-remove-test-for-cross.patch
@@ -0,0 +1,108 @@
+# OpenEmbedded prepopulates the autotools site cache, so if this
+# would be using AC_TRY_CACHE, we could patch it in a more sane way
+# Alas, I don't have enough autotalent to do that.
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in	2010-12-26 10:02:03.222663593 -0500
++++ Python-2.7.1/configure.in	2010-12-26 10:02:19.891414484 -0500
+@@ -2822,49 +2822,6 @@
+   AC_CHECK_LIB(resolv, inet_aton)
+ )
+ 
+-# On Tru64, chflags seems to be present, but calling it will
+-# exit Python
+-AC_CACHE_CHECK([for chflags], [ac_cv_have_chflags], [dnl
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[[
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(chflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-]]])],
+-[ac_cv_have_chflags=yes],
+-[ac_cv_have_chflags=no],
+-[ac_cv_have_chflags=cross])
+-])
+-if test "$ac_cv_have_chflags" = cross ; then
+-  AC_CHECK_FUNC([chflags], [ac_cv_have_chflags="yes"], [ac_cv_have_chflags="no"])
+-fi
+-if test "$ac_cv_have_chflags" = yes ; then
+-  AC_DEFINE(HAVE_CHFLAGS, 1, [Define to 1 if you have the `chflags' function.])
+-fi
+-
+-AC_CACHE_CHECK([for lchflags], [ac_cv_have_lchflags], [dnl
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[[
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(lchflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-]]])],[ac_cv_have_lchflags=yes],[ac_cv_have_lchflags=no],[ac_cv_have_lchflags=cross])
+-])
+-if test "$ac_cv_have_lchflags" = cross ; then
+-  AC_CHECK_FUNC([lchflags], [ac_cv_have_lchflags="yes"], [ac_cv_have_lchflags="no"])
+-fi
+-if test "$ac_cv_have_lchflags" = yes ; then
+-  AC_DEFINE(HAVE_LCHFLAGS, 1, [Define to 1 if you have the `lchflags' function.])
+-fi
+-
+ dnl Check if system zlib has *Copy() functions
+ dnl
+ dnl On MacOSX the linker will search for dylibs on the entire linker path
+@@ -4210,48 +4167,6 @@
+ 	LIBS="$LIBS -framework CoreFoundation"
+ fi
+ 
+-
+-AC_CACHE_CHECK([for %zd printf() format support], ac_cv_have_size_t_format, [dnl
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <stdio.h>
+-#include <stddef.h>
+-#include <string.h>
+-
+-#ifdef HAVE_SYS_TYPES_H
+-#include <sys/types.h>
+-#endif
+-
+-#ifdef HAVE_SSIZE_T
+-typedef ssize_t Py_ssize_t;
+-#elif SIZEOF_VOID_P == SIZEOF_LONG
+-typedef long Py_ssize_t;
+-#else
+-typedef int Py_ssize_t;
+-#endif
+-
+-int main()
+-{
+-    char buffer[256];
+-
+-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "123"))
+-	return 1;
+-
+-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "-123"))
+-	return 1;
+-
+-    return 0;
+-}
+-]])],
+-[ac_cv_have_size_t_format=yes],
+-[ac_cv_have_size_t_format=no],
+-[ac_cv_have_size_t_format="cross -- assuming yes"
+-])])
+ if test "$ac_cv_have_size_t_format" != no ; then
+   AC_DEFINE(PY_FORMAT_SIZE_T, "z",
+   [Define to printf format modifier for Py_ssize_t])
diff --git a/recipes/python/python-2.7.1/03-fix-tkinter-detection.patch b/recipes/python/python-2.7.1/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..47274b3
--- /dev/null
+++ b/recipes/python/python-2.7.1/03-fix-tkinter-detection.patch
@@ -0,0 +1,40 @@
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-26 10:01:38.992621096 -0500
++++ Python-2.7.1/setup.py	2010-12-26 10:02:31.032604626 -0500
+@@ -1712,7 +1712,7 @@
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1731,22 +1731,6 @@
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-2.7.1/04-default-is-optimized.patch b/recipes/python/python-2.7.1/04-default-is-optimized.patch
new file mode 100644
index 0000000..5131e0b
--- /dev/null
+++ b/recipes/python/python-2.7.1/04-default-is-optimized.patch
@@ -0,0 +1,18 @@
+# When compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Python/compile.c
+===================================================================
+--- Python-2.6.1.orig/Python/compile.c
++++ Python-2.6.1/Python/compile.c
+@@ -32,7 +32,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
diff --git a/recipes/python/python-2.7.1/05-enable-ctypes-cross-build.patch b/recipes/python/python-2.7.1/05-enable-ctypes-cross-build.patch
new file mode 100644
index 0000000..c33dc9f
--- /dev/null
+++ b/recipes/python/python-2.7.1/05-enable-ctypes-cross-build.patch
@@ -0,0 +1,28 @@
+# CTypes need to know the actual host we are building on.
+# Signed-Off: Michael Dietrich <mdt@emdete.de>
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-26 10:02:31.032604626 -0500
++++ Python-2.7.1/setup.py	2010-12-26 10:02:43.182604395 -0500
+@@ -1825,16 +1825,16 @@
+                                          ffi_configfile):
+                 from distutils.dir_util import mkpath
+                 mkpath(ffi_builddir)
+-                config_args = []
++                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+ 
+                 # Pass empty CFLAGS because we'll just append the resulting
+                 # CFLAGS to Python's; -g or -O2 is to be avoided.
+-                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
+-                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
++                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
+ 
+                 res = os.system(cmd)
+                 if res or not os.path.exists(ffi_configfile):
+-                    print "Failed to configure _ctypes module"
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
+                     return False
+ 
+             fficonfig = {}
diff --git a/recipes/python/python-2.7.1/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-2.7.1/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..b5e59e6
--- /dev/null
+++ b/recipes/python/python-2.7.1/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,44 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+Index: Python-2.7.1/Modules/_ctypes/libffi/Makefile.am
+===================================================================
+--- Python-2.7.1.orig/Modules/_ctypes/libffi/Makefile.am	2010-03-19 14:59:20.000000000 -0400
++++ Python-2.7.1/Modules/_ctypes/libffi/Makefile.am	2010-12-26 10:05:56.112625174 -0500
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+ 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -34,8 +34,6 @@
+ 	libtool-version ChangeLog.libffi m4/libtool.m4 \
+ 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
+Index: Python-2.7.1/Modules/_ctypes/libffi/configure.ac
+===================================================================
+--- Python-2.7.1.orig/Modules/_ctypes/libffi/configure.ac	2010-12-26 10:06:09.752605599 -0500
++++ Python-2.7.1/Modules/_ctypes/libffi/configure.ac	2010-12-26 10:07:18.260769612 -0500
+@@ -409,7 +409,7 @@
+ 
+ AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
+ 
+-AC_CONFIG_FILES(include/Makefile include/ffi.h Makefile testsuite/Makefile man/Makefile libffi.pc)
++AC_CONFIG_FILES(include/Makefile include/ffi.h Makefile testsuite/Makefile man/Makefile libffi.pc Makefile)
+ 
+ AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
+ 
diff --git a/recipes/python/python-2.7.1/10-distutils-fix-swig-parameter.patch b/recipes/python/python-2.7.1/10-distutils-fix-swig-parameter.patch
new file mode 100644
index 0000000..0e86954
--- /dev/null
+++ b/recipes/python/python-2.7.1/10-distutils-fix-swig-parameter.patch
@@ -0,0 +1,16 @@
+# Some versions of SWIG do not use the extension parameter.
+# Make it optional.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.7.1/Lib/distutils/command/build_ext.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/command/build_ext.py	2010-09-10 16:03:17.000000000 -0400
++++ Python-2.7.1/Lib/distutils/command/build_ext.py	2010-12-26 10:07:28.492632349 -0500
+@@ -531,7 +531,7 @@
+             target_lang=language)
+ 
+ 
+-    def swig_sources (self, sources, extension):
++    def swig_sources (self, sources, extension=None):
+ 
+         """Walk the list of source files in 'sources', looking for SWIG
+         interface (.i) files.  Run SWIG on all that are found, and
diff --git a/recipes/python/python-2.7.1/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-2.7.1/11-distutils-never-modify-shebang-line.patch
new file mode 100644
index 0000000..20f3605
--- /dev/null
+++ b/recipes/python/python-2.7.1/11-distutils-never-modify-shebang-line.patch
@@ -0,0 +1,18 @@
+# Don't modify the she-bang line for a cross-build.
+# Otherwise it points to our hostpython (which we do not want)
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.7.1/Lib/distutils/command/build_scripts.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/command/build_scripts.py	2010-01-23 04:23:15.000000000 -0500
++++ Python-2.7.1/Lib/distutils/command/build_scripts.py	2010-12-26 10:07:35.762597668 -0500
+@@ -85,7 +85,7 @@
+                     continue
+ 
+                 match = first_line_re.match(first_line)
+-                if match:
++                if False: #match:
+                     adjust = 1
+                     post_interp = match.group(1) or ''
+ 
diff --git a/recipes/python/python-2.7.1/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
new file mode 100644
index 0000000..afe4201
--- /dev/null
+++ b/recipes/python/python-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
@@ -0,0 +1,60 @@
+# The proper prefix is inside our staging area.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.7.1/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/sysconfig.py	2010-11-06 10:16:30.000000000 -0400
++++ Python-2.7.1/Lib/distutils/sysconfig.py	2010-12-26 10:08:40.760410838 -0500
+@@ -19,8 +19,8 @@
+ from distutils.errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+@@ -70,7 +70,10 @@
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
++        else:
++            prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+         if python_build:
+@@ -111,7 +114,10 @@
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
++        else:
++            prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+         libpython = os.path.join(prefix,
+@@ -199,7 +205,7 @@
+     else:
+         # The name of the config.h file changed in 2.2
+         config_h = 'pyconfig.h'
+-    return os.path.join(inc_dir, config_h)
++    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def get_makefile_filename():
+@@ -207,7 +213,7 @@
+     if python_build:
+         return os.path.join(os.path.dirname(sys.executable), "Makefile")
+     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
+-    return os.path.join(lib_dir, "config", "Makefile")
++    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def parse_config_h(fp, g=None):
diff --git a/recipes/python/python-2.7.1/99-ignore-optimization-flag.patch b/recipes/python/python-2.7.1/99-ignore-optimization-flag.patch
new file mode 100644
index 0000000..f068ece
--- /dev/null
+++ b/recipes/python/python-2.7.1/99-ignore-optimization-flag.patch
@@ -0,0 +1,19 @@
+# Reinstate the empty -O option to fix weird mixing of native and target
+# binaries and libraries with LD_LIBRARY_PATH when host==target
+#
+# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+
+Index: Python-2.7.1/Modules/main.c
+===================================================================
+--- Python-2.7.1.orig/Modules/main.c	2010-06-13 02:50:39.000000000 -0400
++++ Python-2.7.1/Modules/main.c	2010-12-26 10:09:34.300455892 -0500
+@@ -329,8 +329,7 @@
+ 
+         /* case 'J': reserved for Jython */
+ 
+-        case 'O':
+-            Py_OptimizeFlag++;
++        case 'O': /* ignore it */
+             break;
+ 
+         case 'B':
diff --git a/recipes/python/python-2.7.1/debug.patch b/recipes/python/python-2.7.1/debug.patch
new file mode 100644
index 0000000..c7f5081
--- /dev/null
+++ b/recipes/python/python-2.7.1/debug.patch
@@ -0,0 +1,27 @@
+Index: Python-2.7.1/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/unixccompiler.py	2010-06-27 08:36:16.000000000 -0400
++++ Python-2.7.1/Lib/distutils/unixccompiler.py	2010-12-26 10:09:44.282632589 -0500
+@@ -318,6 +318,8 @@
+ 
+ 
+ 
++        print "Looking in %s for %s" % (lib, dirs)
++
+         for dir in dirs:
+             shared = os.path.join(dir, shared_f)
+             dylib = os.path.join(dir, dylib_f)
+@@ -336,10 +338,13 @@
+             # assuming that *all* Unix C compilers do.  And of course I'm
+             # ignoring even GCC's "-static" option.  So sue me.
+             if os.path.exists(dylib):
++                print "Found %s" % (dylib)
+                 return dylib
+             elif os.path.exists(shared):
++                print "Found %s" % (shared)
+                 return shared
+             elif os.path.exists(static):
++                print "Found %s" % (static)
+                 return static
+ 
+         # Oops, didn't find it in *any* of 'dirs'
diff --git a/recipes/python/python-2.7.1/nohostlibs.patch b/recipes/python/python-2.7.1/nohostlibs.patch
new file mode 100644
index 0000000..6f33a49
--- /dev/null
+++ b/recipes/python/python-2.7.1/nohostlibs.patch
@@ -0,0 +1,29 @@
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-26 10:02:43.000000000 -0500
++++ Python-2.7.1/setup.py	2010-12-26 10:12:30.920427195 -0500
+@@ -404,11 +404,8 @@
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+         # be assumed that no additional -I,-L directives are needed.
+-        lib_dirs = self.compiler.library_dirs + [
+-            '/lib64', '/usr/lib64',
+-            '/lib', '/usr/lib',
+-            ]
+-        inc_dirs = self.compiler.include_dirs + ['/usr/include']
++        lib_dirs = self.compiler.library_dirs
++        inc_dirs = self.compiler.include_dirs
+         exts = []
+         missing = []
+ 
+@@ -657,9 +654,7 @@
+                 pass # Issue 7384: Already linked against curses or tinfo.
+             elif curses_library:
+                 readline_libs.append(curses_library)
+-            elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
+-                                                     'termcap'):
++            elif self.compiler.find_library_file(lib_dirs, 'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+                                    library_dirs=['/usr/lib/termcap'],
diff --git a/recipes/python/python-2.7.1/sitecustomize.py b/recipes/python/python-2.7.1/sitecustomize.py
new file mode 100644
index 0000000..2739018
--- /dev/null
+++ b/recipes/python/python-2.7.1/sitecustomize.py
@@ -0,0 +1,45 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __enableDefaultEncoding():
+    import sys
+    try:
+        sys.setdefaultencoding( "utf8" )
+    except LookupError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __enableDefaultEncoding()
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch b/recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch
new file mode 100644
index 0000000..2559e3a
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/00-fix-bindir-libdir-for-cross.patch
@@ -0,0 +1,20 @@
+# $(exec_prefix) points to the wrong directory, when installing
+# a cross-build. @bindir@ and @libdir@ works better and doesn't
+# affect the native build.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Makefile.pre.in
+===================================================================
+--- Python-2.6.1.orig/Makefile.pre.in
++++ Python-2.6.1/Makefile.pre.in
+@@ -86,8 +86,8 @@ exec_prefix=	@exec_prefix@
+ datarootdir=    @datarootdir@
+ 
+ # Expanded directories
+-BINDIR=		$(exec_prefix)/bin
+-LIBDIR=		$(exec_prefix)/lib
++BINDIR=		@bindir@
++LIBDIR=		@libdir@
+ MANDIR=		@mandir@
+ INCLUDEDIR=	@includedir@
+ CONFINCLUDEDIR=	$(exec_prefix)/include
diff --git a/recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch b/recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch
new file mode 100644
index 0000000..6cf3cd4
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/01-fix-have-long-long-format.patch
@@ -0,0 +1,19 @@
+# The configure script assumes the %lld printf format is not available as it
+# can't run its check script. For some reason python refuses to compile without
+# this functionality, so we just assume that our printf supports %lld.
+#
+# Include/pyport.h:243:13: error: #error "This platform's pyconfig.h needs to define PY_FORMAT_LONG_LONG"
+
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in
++++ Python-2.7.1/configure.in
+@@ -4151,7 +4151,7 @@ then
+   ]]])],
+   [ac_cv_have_long_long_format=yes],
+   [ac_cv_have_long_long_format=no],
+-  [ac_cv_have_long_long_format=no])
++  [ac_cv_have_long_long_format=yes])
+   )
+   AC_MSG_RESULT($ac_cv_have_long_long_format)
+ fi
diff --git a/recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch b/recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch
new file mode 100644
index 0000000..8420eb3
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/01-use-proper-tools-for-cross-build.patch
@@ -0,0 +1,169 @@
+# We need to ensure our host tools get run during build, not the freshly
+# built cross-tools (this will not work), so we introduce HOSTPYTHON and HOSTPGEN.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-27 13:16:38.032631011 -0500
++++ Python-2.7.1/setup.py	2010-12-27 13:16:50.130290766 -0500
+@@ -313,6 +313,7 @@
+             self.failed.append(ext.name)
+             self.announce('*** WARNING: renaming "%s" since importing it'
+                           ' failed: %s' % (ext.name, why), level=3)
++            return
+             assert not self.inplace
+             basename, tail = os.path.splitext(ext_filename)
+             newname = basename + "_failed" + tail
+@@ -347,8 +348,8 @@
+ 
+     def detect_modules(self):
+         # Ensure that /usr/local is always used
+-        add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
+-        add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
++        # add_dir_to_list(self.compiler.library_dirs, '/usr/local/lib')
++        # add_dir_to_list(self.compiler.include_dirs, '/usr/local/include')
+ 
+         # Add paths specified in the environment variables LDFLAGS and
+         # CPPFLAGS for header and library files.
+@@ -452,6 +453,9 @@
+ 
+         # XXX Omitted modules: gl, pure, dl, SGI-specific modules
+ 
++        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
++        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
++
+         #
+         # The following modules are all pretty straightforward, and compile
+         # on pretty much any POSIXish platform.
+Index: Python-2.7.1/Makefile.pre.in
+===================================================================
+--- Python-2.7.1.orig/Makefile.pre.in	2010-12-27 13:16:38.022628181 -0500
++++ Python-2.7.1/Makefile.pre.in	2010-12-27 13:17:31.870473931 -0500
+@@ -201,6 +201,7 @@
+ 
+ ##########################################################################
+ # Grammar
++GRAMMAR_STAMP=	$(srcdir)/grammar-stamp
+ GRAMMAR_H=	$(srcdir)/Include/graminit.h
+ GRAMMAR_C=	$(srcdir)/Python/graminit.c
+ GRAMMAR_INPUT=	$(srcdir)/Grammar/Grammar
+@@ -380,7 +381,7 @@
+ 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-generate" LIBS="$(LIBS) -lgcov"
+ 
+ run_profile_task:
+-	./$(BUILDPYTHON) $(PROFILE_TASK)
++	$(HOSTPYTHON) $(PROFILE_TASK)
+ 
+ build_all_use_profile:
+ 	$(MAKE) all CFLAGS="$(CFLAGS) -fprofile-use"
+@@ -398,14 +399,14 @@
+ 			$(BLDLIBRARY) $(LIBS) $(MODLIBS) $(SYSLIBS) $(LDLAST)
+ 
+ platform: $(BUILDPYTHON)
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
++	$(RUNSHARED) $(HOSTPYTHON) -E -c 'import sys ; from sysconfig import get_platform ; print get_platform()+"-"+sys.version[0:3]' >platform
+ 
+ 
+ # Build the shared modules
+ sharedmods: $(BUILDPYTHON)
+ 	@case $$MAKEFLAGS in \
+-	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py -q build;; \
+-	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' ./$(BUILDPYTHON) -E $(srcdir)/setup.py build;; \
++	*s*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py -q build;; \
++	*) $(RUNSHARED) CC='$(CC)' LDSHARED='$(BLDSHARED)' OPT='$(OPT)' $(HOSTPYTHON) -E $(srcdir)/setup.py build;; \
+ 	esac
+ 
+ # Build static library
+@@ -535,10 +536,24 @@
+ Modules/python.o: $(srcdir)/Modules/python.c
+ 	$(MAINCC) -c $(PY_CFLAGS) -o $@ $(srcdir)/Modules/python.c
+ 
++# GNU "make" interprets rules with two dependents as two copies of the rule.
++#
++# In a parallel build this can lead to pgen being run twice, once for each of
++# GRAMMAR_H and GRAMMAR_C, leading to race conditions in which the compiler
++# reads a partially-overwritten copy of one of these files, leading to syntax
++# errors (or linker errors if the fragment happens to be syntactically valid C)
++#
++# See http://www.gnu.org/software/hello/manual/automake/Multiple-Outputs.html
++# for more information.
++#
++# Introduce ".grammar-stamp" as a contrived single output from PGEN to avoid
++# this:
++$(GRAMMAR_H) $(GRAMMAR_C): $(GRAMMAR_STAMP)
+ 
+-$(GRAMMAR_H) $(GRAMMAR_C): $(PGEN) $(GRAMMAR_INPUT)
++$(GRAMMAR_STAMP): $(PGEN) $(GRAMMAR_INPUT)
+ 		-@$(INSTALL) -d Include
+ 		-$(PGEN) $(GRAMMAR_INPUT) $(GRAMMAR_H) $(GRAMMAR_C)
++		touch $(GRAMMAR_STAMP)
+ 
+ $(PGEN):	$(PGENOBJS)
+ 		$(CC) $(OPT) $(LDFLAGS) $(PGENOBJS) $(LIBS) -o $(PGEN)
+@@ -921,25 +936,25 @@
+ 	done
+ 	$(INSTALL_DATA) $(srcdir)/LICENSE $(DESTDIR)$(LIBDEST)/LICENSE.txt
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -tt -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST) -f \
+ 		-x 'bad_coding|badsyntax|site-packages|lib2to3/tests/data' \
+ 		$(DESTDIR)$(LIBDEST)
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST)  $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
++		$(HOSTPYTHON) -Wi -t -O $(DESTDIR)$(LIBDEST)/compileall.py \
+ 		-d $(LIBDEST)/site-packages -f \
+ 		-x badsyntax $(DESTDIR)$(LIBDEST)/site-packages
+ 	-PYTHONPATH=$(DESTDIR)$(LIBDEST) $(RUNSHARED) \
+-		./$(BUILDPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
++		$(HOSTPYTHON) -Wi -t -c "import lib2to3.pygram, lib2to3.patcomp;lib2to3.patcomp.PatternCompiler()"
+ 
+ # Create the PLATDIR source directory, if one wasn't distributed..
+ $(srcdir)/Lib/$(PLATDIR):
+@@ -1044,7 +1059,7 @@
+ # Install the dynamically loadable modules
+ # This goes into $(exec_prefix)
+ sharedinstall: sharedmods
+-	$(RUNSHARED) ./$(BUILDPYTHON) -E $(srcdir)/setup.py install \
++	$(RUNSHARED) $(HOSTPYTHON) -E $(srcdir)/setup.py install \
+ 	   	--prefix=$(prefix) \
+ 		--install-scripts=$(BINDIR) \
+ 		--install-platlib=$(DESTSHARED) \
+@@ -1117,7 +1132,7 @@
+ # This installs a few of the useful scripts in Tools/scripts
+ scriptsinstall:
+ 	SRCDIR=$(srcdir) $(RUNSHARED) \
+-	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/setup.py install \
++	$(HOSTPYTHON) $(srcdir)/Tools/scripts/setup.py install \
+ 	--prefix=$(prefix) \
+ 	--install-scripts=$(BINDIR) \
+ 	--root=/$(DESTDIR)
+@@ -1139,7 +1154,7 @@
+ 
+ # Run reindent on the library
+ reindent:
+-	./$(BUILDPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
++	$(HOSTPYTHON) $(srcdir)/Tools/scripts/reindent.py -r $(srcdir)/Lib
+ 
+ # Rerun configure with the same options as it was run last time,
+ # provided the config.status script exists
+@@ -1242,7 +1257,7 @@
+ 
+ # Perform some verification checks on any modified files.
+ patchcheck:
+-	$(RUNSHARED) ./$(BUILDPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
++	$(RUNSHARED) $(HOSTPYTHON) $(srcdir)/Tools/scripts/patchcheck.py
+ 
+ # Dependencies
+ 
diff --git a/recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch b/recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch
new file mode 100644
index 0000000..ab5858c
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/02-remove-test-for-cross.patch
@@ -0,0 +1,108 @@
+# OpenEmbedded prepopulates the autotools site cache, so if this
+# would be using AC_TRY_CACHE, we could patch it in a more sane way
+# Alas, I don't have enough autotalent to do that.
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.7.1/configure.in
+===================================================================
+--- Python-2.7.1.orig/configure.in	2010-12-26 10:02:03.222663593 -0500
++++ Python-2.7.1/configure.in	2010-12-26 10:02:19.891414484 -0500
+@@ -2822,49 +2822,6 @@
+   AC_CHECK_LIB(resolv, inet_aton)
+ )
+ 
+-# On Tru64, chflags seems to be present, but calling it will
+-# exit Python
+-AC_CACHE_CHECK([for chflags], [ac_cv_have_chflags], [dnl
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[[
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(chflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-]]])],
+-[ac_cv_have_chflags=yes],
+-[ac_cv_have_chflags=no],
+-[ac_cv_have_chflags=cross])
+-])
+-if test "$ac_cv_have_chflags" = cross ; then
+-  AC_CHECK_FUNC([chflags], [ac_cv_have_chflags="yes"], [ac_cv_have_chflags="no"])
+-fi
+-if test "$ac_cv_have_chflags" = yes ; then
+-  AC_DEFINE(HAVE_CHFLAGS, 1, [Define to 1 if you have the `chflags' function.])
+-fi
+-
+-AC_CACHE_CHECK([for lchflags], [ac_cv_have_lchflags], [dnl
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[[
+-#include <sys/stat.h>
+-#include <unistd.h>
+-int main(int argc, char*argv[])
+-{
+-  if(lchflags(argv[0], 0) != 0)
+-    return 1;
+-  return 0;
+-}
+-]]])],[ac_cv_have_lchflags=yes],[ac_cv_have_lchflags=no],[ac_cv_have_lchflags=cross])
+-])
+-if test "$ac_cv_have_lchflags" = cross ; then
+-  AC_CHECK_FUNC([lchflags], [ac_cv_have_lchflags="yes"], [ac_cv_have_lchflags="no"])
+-fi
+-if test "$ac_cv_have_lchflags" = yes ; then
+-  AC_DEFINE(HAVE_LCHFLAGS, 1, [Define to 1 if you have the `lchflags' function.])
+-fi
+-
+ dnl Check if system zlib has *Copy() functions
+ dnl
+ dnl On MacOSX the linker will search for dylibs on the entire linker path
+@@ -4210,48 +4167,6 @@
+ 	LIBS="$LIBS -framework CoreFoundation"
+ fi
+ 
+-
+-AC_CACHE_CHECK([for %zd printf() format support], ac_cv_have_size_t_format, [dnl
+-AC_RUN_IFELSE([AC_LANG_SOURCE([[
+-#include <stdio.h>
+-#include <stddef.h>
+-#include <string.h>
+-
+-#ifdef HAVE_SYS_TYPES_H
+-#include <sys/types.h>
+-#endif
+-
+-#ifdef HAVE_SSIZE_T
+-typedef ssize_t Py_ssize_t;
+-#elif SIZEOF_VOID_P == SIZEOF_LONG
+-typedef long Py_ssize_t;
+-#else
+-typedef int Py_ssize_t;
+-#endif
+-
+-int main()
+-{
+-    char buffer[256];
+-
+-    if(sprintf(buffer, "%zd", (size_t)123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "123"))
+-	return 1;
+-
+-    if (sprintf(buffer, "%zd", (Py_ssize_t)-123) < 0)
+-       	return 1;
+-
+-    if (strcmp(buffer, "-123"))
+-	return 1;
+-
+-    return 0;
+-}
+-]])],
+-[ac_cv_have_size_t_format=yes],
+-[ac_cv_have_size_t_format=no],
+-[ac_cv_have_size_t_format="cross -- assuming yes"
+-])])
+ if test "$ac_cv_have_size_t_format" != no ; then
+   AC_DEFINE(PY_FORMAT_SIZE_T, "z",
+   [Define to printf format modifier for Py_ssize_t])
diff --git a/recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch b/recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch
new file mode 100644
index 0000000..47274b3
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/03-fix-tkinter-detection.patch
@@ -0,0 +1,40 @@
+# We need to supply STAGING_INCDIR here, otherwise the Tk headers
+# will not be found.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille.de>
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-26 10:01:38.992621096 -0500
++++ Python-2.7.1/setup.py	2010-12-26 10:02:31.032604626 -0500
+@@ -1712,7 +1712,7 @@
+                 dotversion = dotversion[:-1] + '.' + dotversion[-1]
+             tcl_include_sub = []
+             tk_include_sub = []
+-            for dir in inc_dirs:
++            for dir in [os.getenv("STAGING_INCDIR")]:
+                 tcl_include_sub += [dir + os.sep + "tcl" + dotversion]
+                 tk_include_sub += [dir + os.sep + "tk" + dotversion]
+             tk_include_sub += tcl_include_sub
+@@ -1731,22 +1731,6 @@
+             if dir not in include_dirs:
+                 include_dirs.append(dir)
+ 
+-        # Check for various platform-specific directories
+-        if platform == 'sunos5':
+-            include_dirs.append('/usr/openwin/include')
+-            added_lib_dirs.append('/usr/openwin/lib')
+-        elif os.path.exists('/usr/X11R6/include'):
+-            include_dirs.append('/usr/X11R6/include')
+-            added_lib_dirs.append('/usr/X11R6/lib64')
+-            added_lib_dirs.append('/usr/X11R6/lib')
+-        elif os.path.exists('/usr/X11R5/include'):
+-            include_dirs.append('/usr/X11R5/include')
+-            added_lib_dirs.append('/usr/X11R5/lib')
+-        else:
+-            # Assume default location for X11
+-            include_dirs.append('/usr/X11/include')
+-            added_lib_dirs.append('/usr/X11/lib')
+-
+         # If Cygwin, then verify that X is installed before proceeding
+         if platform == 'cygwin':
+             x11_inc = find_file('X11/Xlib.h', [], include_dirs)
diff --git a/recipes/python/python-native-2.7.1/04-default-is-optimized.patch b/recipes/python/python-native-2.7.1/04-default-is-optimized.patch
new file mode 100644
index 0000000..5131e0b
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/04-default-is-optimized.patch
@@ -0,0 +1,18 @@
+# When compiling for an embedded system, we need every bit of
+# performance we can get. default to optimized with the option
+# of opt-out.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.6.1/Python/compile.c
+===================================================================
+--- Python-2.6.1.orig/Python/compile.c
++++ Python-2.6.1/Python/compile.c
+@@ -32,7 +32,7 @@
+ #include "symtable.h"
+ #include "opcode.h"
+ 
+-int Py_OptimizeFlag = 0;
++int Py_OptimizeFlag = 1;
+ 
+ #define DEFAULT_BLOCK_SIZE 16
+ #define DEFAULT_BLOCKS 8
diff --git a/recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch b/recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch
new file mode 100644
index 0000000..c33dc9f
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/05-enable-ctypes-cross-build.patch
@@ -0,0 +1,28 @@
+# CTypes need to know the actual host we are building on.
+# Signed-Off: Michael Dietrich <mdt@emdete.de>
+
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-26 10:02:31.032604626 -0500
++++ Python-2.7.1/setup.py	2010-12-26 10:02:43.182604395 -0500
+@@ -1825,16 +1825,16 @@
+                                          ffi_configfile):
+                 from distutils.dir_util import mkpath
+                 mkpath(ffi_builddir)
+-                config_args = []
++                config_args = ['--host=%s' % os.environ["HOST_SYS"], ]
+ 
+                 # Pass empty CFLAGS because we'll just append the resulting
+                 # CFLAGS to Python's; -g or -O2 is to be avoided.
+-                cmd = "cd %s && env CFLAGS='' '%s/configure' %s" \
+-                      % (ffi_builddir, ffi_srcdir, " ".join(config_args))
++                cmd = "(cd %s && autoconf -W cross) && (cd %s && env CFLAGS='' '%s/configure' %s)" \
++                      % (ffi_srcdir, ffi_builddir, ffi_srcdir, " ".join(config_args))
+ 
+                 res = os.system(cmd)
+                 if res or not os.path.exists(ffi_configfile):
+-                    print "Failed to configure _ctypes module"
++                    print "Failed to configure _ctypes module (res=%d) or missing conffile=%s" % ( res, ffi_configfile )
+                     return False
+ 
+             fficonfig = {}
diff --git a/recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch b/recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch
new file mode 100644
index 0000000..b5e59e6
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/06-ctypes-libffi-fix-configure.patch
@@ -0,0 +1,44 @@
+This fixes configure issues with recent autoconf, e.g:
+  autoreconf: Entering directory `Modules/_ctypes/libffi'
+  autoreconf: configure.ac: not using Gettext
+  autoreconf: running: aclocal --force
+  configure.ac:26: error: m4_copy: won't overwrite defined macro: _AC_ARG_VAR_PRECIOUS
+  configure.ac:26: the top level
+
+The problem is still present in python-2.6.5 but fixed in python-svn.
+
+Index: Python-2.7.1/Modules/_ctypes/libffi/Makefile.am
+===================================================================
+--- Python-2.7.1.orig/Modules/_ctypes/libffi/Makefile.am	2010-03-19 14:59:20.000000000 -0400
++++ Python-2.7.1/Modules/_ctypes/libffi/Makefile.am	2010-12-26 10:05:56.112625174 -0500
+@@ -2,7 +2,7 @@
+ 
+ AUTOMAKE_OPTIONS = foreign subdir-objects
+ 
+-SUBDIRS = include testsuite man
++SUBDIRS = include
+ 
+ EXTRA_DIST = LICENSE ChangeLog.v1 ChangeLog.libgcj configure.host \
+ 	src/alpha/ffi.c src/alpha/osf.S src/alpha/ffitarget.h \
+@@ -34,8 +34,6 @@
+ 	libtool-version ChangeLog.libffi m4/libtool.m4 \
+ 	m4/lt~obsolete.m4 m4/ltoptions.m4 m4/ltsugar.m4 m4/ltversion.m4
+ 
+-info_TEXINFOS = doc/libffi.texi
+-
+ ## ################################################################
+ 
+ ##
+Index: Python-2.7.1/Modules/_ctypes/libffi/configure.ac
+===================================================================
+--- Python-2.7.1.orig/Modules/_ctypes/libffi/configure.ac	2010-12-26 10:06:09.752605599 -0500
++++ Python-2.7.1/Modules/_ctypes/libffi/configure.ac	2010-12-26 10:07:18.260769612 -0500
+@@ -409,7 +409,7 @@
+ 
+ AC_CONFIG_LINKS(include/ffitarget.h:src/$TARGETDIR/ffitarget.h)
+ 
+-AC_CONFIG_FILES(include/Makefile include/ffi.h Makefile testsuite/Makefile man/Makefile libffi.pc)
++AC_CONFIG_FILES(include/Makefile include/ffi.h Makefile testsuite/Makefile man/Makefile libffi.pc Makefile)
+ 
+ AC_CONFIG_LINKS(include/ffi_common.h:include/ffi_common.h)
+ 
diff --git a/recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch b/recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch
new file mode 100644
index 0000000..0e86954
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/10-distutils-fix-swig-parameter.patch
@@ -0,0 +1,16 @@
+# Some versions of SWIG do not use the extension parameter.
+# Make it optional.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+Index: Python-2.7.1/Lib/distutils/command/build_ext.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/command/build_ext.py	2010-09-10 16:03:17.000000000 -0400
++++ Python-2.7.1/Lib/distutils/command/build_ext.py	2010-12-26 10:07:28.492632349 -0500
+@@ -531,7 +531,7 @@
+             target_lang=language)
+ 
+ 
+-    def swig_sources (self, sources, extension):
++    def swig_sources (self, sources, extension=None):
+ 
+         """Walk the list of source files in 'sources', looking for SWIG
+         interface (.i) files.  Run SWIG on all that are found, and
diff --git a/recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch b/recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch
new file mode 100644
index 0000000..20f3605
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/11-distutils-never-modify-shebang-line.patch
@@ -0,0 +1,18 @@
+# Don't modify the she-bang line for a cross-build.
+# Otherwise it points to our hostpython (which we do not want)
+#
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.7.1/Lib/distutils/command/build_scripts.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/command/build_scripts.py	2010-01-23 04:23:15.000000000 -0500
++++ Python-2.7.1/Lib/distutils/command/build_scripts.py	2010-12-26 10:07:35.762597668 -0500
+@@ -85,7 +85,7 @@
+                     continue
+ 
+                 match = first_line_re.match(first_line)
+-                if match:
++                if False: #match:
+                     adjust = 1
+                     post_interp = match.group(1) or ''
+ 
diff --git a/recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch b/recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
new file mode 100644
index 0000000..afe4201
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/12-distutils-prefix-is-inside-staging-area.patch
@@ -0,0 +1,60 @@
+# The proper prefix is inside our staging area.
+# Signed-Off: Michael 'Mickey' Lauer <mickey@vanille-media.de>
+
+Index: Python-2.7.1/Lib/distutils/sysconfig.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/sysconfig.py	2010-11-06 10:16:30.000000000 -0400
++++ Python-2.7.1/Lib/distutils/sysconfig.py	2010-12-26 10:08:40.760410838 -0500
+@@ -19,8 +19,8 @@
+ from distutils.errors import DistutilsPlatformError
+ 
+ # These are needed in a couple of spots, so just compute them once.
+-PREFIX = os.path.normpath(sys.prefix)
+-EXEC_PREFIX = os.path.normpath(sys.exec_prefix)
++PREFIX = os.path.normpath(sys.prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
++EXEC_PREFIX = os.path.normpath(sys.exec_prefix).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ # Path to the base directory of the project. On Windows the binary may
+ # live in project/PCBuild9.  If we're dealing with an x64 Windows build,
+@@ -70,7 +70,10 @@
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = plat_specific and os.environ['STAGING_INCDIR'].rstrip('include')
++        else:
++            prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+         if python_build:
+@@ -111,7 +114,10 @@
+     sys.exec_prefix -- i.e., ignore 'plat_specific'.
+     """
+     if prefix is None:
+-        prefix = plat_specific and EXEC_PREFIX or PREFIX
++        if plat_specific:
++            prefix = plat_specific and os.environ['STAGING_LIBDIR'].rstrip('lib')
++        else:
++            prefix = plat_specific and EXEC_PREFIX or PREFIX
+ 
+     if os.name == "posix":
+         libpython = os.path.join(prefix,
+@@ -199,7 +205,7 @@
+     else:
+         # The name of the config.h file changed in 2.2
+         config_h = 'pyconfig.h'
+-    return os.path.join(inc_dir, config_h)
++    return os.path.join(inc_dir, config_h).replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def get_makefile_filename():
+@@ -207,7 +213,7 @@
+     if python_build:
+         return os.path.join(os.path.dirname(sys.executable), "Makefile")
+     lib_dir = get_python_lib(plat_specific=1, standard_lib=1)
+-    return os.path.join(lib_dir, "config", "Makefile")
++    return os.path.join(lib_dir, "config", "Makefile").replace( os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
+ 
+ 
+ def parse_config_h(fp, g=None):
diff --git a/recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch b/recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch
new file mode 100644
index 0000000..f068ece
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/99-ignore-optimization-flag.patch
@@ -0,0 +1,19 @@
+# Reinstate the empty -O option to fix weird mixing of native and target
+# binaries and libraries with LD_LIBRARY_PATH when host==target
+#
+# Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+
+Index: Python-2.7.1/Modules/main.c
+===================================================================
+--- Python-2.7.1.orig/Modules/main.c	2010-06-13 02:50:39.000000000 -0400
++++ Python-2.7.1/Modules/main.c	2010-12-26 10:09:34.300455892 -0500
+@@ -329,8 +329,7 @@
+ 
+         /* case 'J': reserved for Jython */
+ 
+-        case 'O':
+-            Py_OptimizeFlag++;
++        case 'O': /* ignore it */
+             break;
+ 
+         case 'B':
diff --git a/recipes/python/python-native-2.7.1/debug.patch b/recipes/python/python-native-2.7.1/debug.patch
new file mode 100644
index 0000000..c7f5081
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/debug.patch
@@ -0,0 +1,27 @@
+Index: Python-2.7.1/Lib/distutils/unixccompiler.py
+===================================================================
+--- Python-2.7.1.orig/Lib/distutils/unixccompiler.py	2010-06-27 08:36:16.000000000 -0400
++++ Python-2.7.1/Lib/distutils/unixccompiler.py	2010-12-26 10:09:44.282632589 -0500
+@@ -318,6 +318,8 @@
+ 
+ 
+ 
++        print "Looking in %s for %s" % (lib, dirs)
++
+         for dir in dirs:
+             shared = os.path.join(dir, shared_f)
+             dylib = os.path.join(dir, dylib_f)
+@@ -336,10 +338,13 @@
+             # assuming that *all* Unix C compilers do.  And of course I'm
+             # ignoring even GCC's "-static" option.  So sue me.
+             if os.path.exists(dylib):
++                print "Found %s" % (dylib)
+                 return dylib
+             elif os.path.exists(shared):
++                print "Found %s" % (shared)
+                 return shared
+             elif os.path.exists(static):
++                print "Found %s" % (static)
+                 return static
+ 
+         # Oops, didn't find it in *any* of 'dirs'
diff --git a/recipes/python/python-native-2.7.1/nohostlibs.patch b/recipes/python/python-native-2.7.1/nohostlibs.patch
new file mode 100644
index 0000000..6f33a49
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/nohostlibs.patch
@@ -0,0 +1,29 @@
+Index: Python-2.7.1/setup.py
+===================================================================
+--- Python-2.7.1.orig/setup.py	2010-12-26 10:02:43.000000000 -0500
++++ Python-2.7.1/setup.py	2010-12-26 10:12:30.920427195 -0500
+@@ -404,11 +404,8 @@
+         # lib_dirs and inc_dirs are used to search for files;
+         # if a file is found in one of those directories, it can
+         # be assumed that no additional -I,-L directives are needed.
+-        lib_dirs = self.compiler.library_dirs + [
+-            '/lib64', '/usr/lib64',
+-            '/lib', '/usr/lib',
+-            ]
+-        inc_dirs = self.compiler.include_dirs + ['/usr/include']
++        lib_dirs = self.compiler.library_dirs
++        inc_dirs = self.compiler.include_dirs
+         exts = []
+         missing = []
+ 
+@@ -657,9 +654,7 @@
+                 pass # Issue 7384: Already linked against curses or tinfo.
+             elif curses_library:
+                 readline_libs.append(curses_library)
+-            elif self.compiler.find_library_file(lib_dirs +
+-                                                     ['/usr/lib/termcap'],
+-                                                     'termcap'):
++            elif self.compiler.find_library_file(lib_dirs, 'termcap'):
+                 readline_libs.append('termcap')
+             exts.append( Extension('readline', ['readline.c'],
+                                    library_dirs=['/usr/lib/termcap'],
diff --git a/recipes/python/python-native-2.7.1/sitecustomize.py b/recipes/python/python-native-2.7.1/sitecustomize.py
new file mode 100644
index 0000000..2739018
--- /dev/null
+++ b/recipes/python/python-native-2.7.1/sitecustomize.py
@@ -0,0 +1,45 @@
+# OpenEmbedded sitecustomize.py (C) 2002-2008 Michael 'Mickey' Lauer <mlauer@vanille-media.de>
+# GPLv2 or later
+# Version: 20081123
+# Features:
+# * set proper default encoding
+# * enable readline completion in the interactive interpreter
+# * load command line history on startup
+# * save command line history on exit 
+
+import os
+
+def __exithandler():
+    try:
+        readline.write_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __registerExitHandler():
+    import atexit
+    atexit.register( __exithandler )
+
+def __enableReadlineSupport():
+    readline.set_history_length( 1000 )
+    readline.parse_and_bind( "tab: complete" )
+    try:
+        readline.read_history_file( "%s/.python-history" % os.getenv( "HOME", "/tmp" ) )
+    except IOError:
+        pass
+
+def __enableDefaultEncoding():
+    import sys
+    try:
+        sys.setdefaultencoding( "utf8" )
+    except LookupError:
+        pass
+
+import sys
+try:
+    import rlcompleter, readline
+except ImportError:
+    pass
+else:
+    __enableDefaultEncoding()
+    __registerExitHandler()
+    __enableReadlineSupport()
diff --git a/recipes/python/python-native_2.7.1.bb b/recipes/python/python-native_2.7.1.bb
new file mode 100644
index 0000000..eb487a9
--- /dev/null
+++ b/recipes/python/python-native_2.7.1.bb
@@ -0,0 +1,38 @@
+require python2.7.inc
+DEPENDS = "openssl-native bzip2-full-native zlib-native readline-native sqlite3-native"
+PR = "${INC_PR}.1"
+
+FILESPATHPKG .= ":python-${PV}:python"
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+           file://04-default-is-optimized.patch \
+           file://05-enable-ctypes-cross-build.patch \
+           file://06-ctypes-libffi-fix-configure.patch \
+           file://10-distutils-fix-swig-parameter.patch \
+           file://11-distutils-never-modify-shebang-line.patch \
+           file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://debug.patch \
+           file://nohostlibs.patch"
+SRC_URI[md5sum] = "aa27bc25725137ba155910bd8e5ddc4f"
+SRC_URI[sha256sum] = "80e387bcf57eae8ce26726753584fd63e060ec11682d1145af921e85fd612292"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit native
+
+EXTRA_OECONF_append = '\
+  --enable-unicode=ucs4 \
+'
+
+EXTRA_OEMAKE = '\
+  BUILD_SYS="" \
+  HOST_SYS="" \
+  LIBC="" \
+  STAGING_LIBDIR=${STAGING_LIBDIR_NATIVE} \
+  STAGING_INCDIR=${STAGING_INCDIR_NATIVE} \
+'
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	install -d ${D}${bindir}/
+	install -m 0755 Parser/pgen ${D}${bindir}/
+}
diff --git a/recipes/python/python2.7.inc b/recipes/python/python2.7.inc
new file mode 100644
index 0000000..c5f58d0
--- /dev/null
+++ b/recipes/python/python2.7.inc
@@ -0,0 +1,23 @@
+DESCRIPTION = "The Python Programming Language"
+HOMEPAGE = "http://www.python.org"
+LICENSE = "PSF"
+SECTION = "devel/python"
+PRIORITY = "optional"
+# bump this on every change in contrib/python/generate-manifest-2.7.py
+INC_PR = "ml1"
+
+DEFAULT_PREFERENCE = "-27"
+
+PYTHON_MAJMIN = "2.7"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+  --with-threads \
+  --with-pymalloc \
+  --with-cyclic-gc \
+  --without-cxx \
+  --with-signal-module \
+  --with-wctype-functions \
+  --enable-shared \
+"
diff --git a/recipes/python/python_2.7.1.bb b/recipes/python/python_2.7.1.bb
new file mode 100644
index 0000000..6346026
--- /dev/null
+++ b/recipes/python/python_2.7.1.bb
@@ -0,0 +1,132 @@
+require python2.7.inc
+DEPENDS = "python-native db gdbm openssl readline sqlite3 tcl zlib\
+           ${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}"
+DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
+# set to .0 on every increase of INC_PR
+PR = "${INC_PR}.2"
+
+SRC_URI = "\
+  http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.bz2 \
+  file://01-fix-have-long-long-format.patch \
+  file://01-use-proper-tools-for-cross-build.patch \
+  file://02-remove-test-for-cross.patch \
+  file://03-fix-tkinter-detection.patch \
+  file://04-default-is-optimized.patch \
+  file://05-enable-ctypes-cross-build.patch \
+  file://06-ctypes-libffi-fix-configure.patch \
+  file://99-ignore-optimization-flag.patch \
+  file://sitecustomize.py \
+"
+SRC_URI[md5sum] = "aa27bc25725137ba155910bd8e5ddc4f"
+SRC_URI[sha256sum] = "80e387bcf57eae8ce26726753584fd63e060ec11682d1145af921e85fd612292"
+
+S = "${WORKDIR}/Python-${PV}"
+
+inherit autotools
+
+# The 3 lines below are copied from the libffi recipe, ctypes ships its own copy of the libffi sources
+#Somehow gcc doesn't set __SOFTFP__ when passing -mfloatabi=softp :(
+TARGET_CC_ARCH_append_armv6 = " -D__SOFTFP__"
+TARGET_CC_ARCH_append_armv7a = " -D__SOFTFP__"
+
+do_configure_prepend() {
+	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
+}
+
+#
+# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+# which laters uses the information out of these to compile extensions
+#
+do_compile_prepend() {
+	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+	install -m 0644 Makefile Makefile.orig
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile Makefile.backup
+	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
+	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+}
+
+do_compile() {
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		OPT="${CFLAGS}" libpython${PYTHON_MAJMIN}.so
+
+	oe_libinstall -so libpython${PYTHON_MAJMIN} ${STAGING_LIBDIR}
+
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		RUNSHARED= OPT="${CFLAGS}"
+}
+
+do_install() {
+	install -m 0644 Makefile.orig Makefile
+	
+	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
+		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
+		STAGING_LIBDIR=${STAGING_LIBDIR} \
+		STAGING_INCDIR=${STAGING_INCDIR} \
+		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
+		DESTDIR=${D} LIBDIR=${libdir} RUNSHARED= install
+
+	install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
+do_install_append() {
+	# remove unecessary files from python-distutils' packages
+	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/config/libpython2.7.a
+	rm ${D}/${libdir}/python${PYTHON_MAJMIN}/distutils/command/win*
+}
+
+require python-${PYTHON_MAJMIN}-manifest.inc
+
+# manual dependency additions
+RPROVIDES_python-core = "python"
+RRECOMMENDS_python-core = "python-readline"
+RRECOMMENDS_python-crypt = "openssl"
+
+# add sitecustomize
+FILES_python-core += "${libdir}/python${PYTHON_MAJMIN}/sitecustomize.py"
+# ship 2to3
+FILES_python-core += "${bindir}/2to3"
+
+# package libpython2
+PACKAGES =+ "libpython2"
+FILES_libpython2 = "${libdir}/libpython*.so.*"
+
+# additional stuff -dev
+
+FILES_${PN}-dev += "\
+  ${includedir} \
+  ${libdir}/lib*${SOLIBSDEV} \
+  ${libdir}/*.la \
+  ${libdir}/*.a \
+  ${libdir}/*.o \
+  ${libdir}/pkgconfig \
+  ${base_libdir}/*.a \
+  ${base_libdir}/*.o \
+  ${datadir}/aclocal \
+  ${datadir}/pkgconfig \
+"
+
+# catch debug extensions (isn't that already in python-core-dbg?)
+FILES_python-dbg += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/.debug"
+
+# catch all the rest (unsorted)
+PACKAGES += "python-misc"
+FILES_python-misc = "${libdir}/python${PYTHON_MAJMIN}"
+
+# catch manpage
+PACKAGES += "python-man"
+FILES_python-man = "${datadir}/man"
-- 
1.7.0.4



