Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PozVJ-0008VT-Un
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 15:34:18 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so5249326bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 06:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=MMne711Y2hcn+s9JY63T2FhJ1t/ztTXgfAhk065jJUo=;
	b=bEvbaSfc3l0zZZFKj5Bsd2MbPYjSu9K1QbJnZ3QA1Q8W9cxnJZIJ72tJtNWLhpvtH5
	Oc+673WE4kSwscVns9j01QCzSFf7b/lCVQs5x5n+sUCSt/EGTIyiBDISo+5+OPha0fZS
	mTtr7MEHH8gBi1KyQLRK/jrxqMnV+Yhq+5leU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=aG3OOSGzKqX8JLvMeKjOS2f7xRahK9P/xJmYiEuHI0+jcEZ6IoAGD1zbE3NV2DDDef
	Tq4QAKA3sL/pJ9hg35t6LF0q4i1jdmUrHb8j7yJ9NjMBM2c3oQyuWM9IO8Gkp6/VAbnO
	9wvONmc5MHSAz9GgaEdN3/YiYLRlTvYohvWmU=
Received: by 10.204.68.69 with SMTP id u5mr25568968bki.99.1297693989973;
	Mon, 14 Feb 2011 06:33:09 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j11sm1820834bka.0.2011.02.14.06.33.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 06:33:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 15:32:37 +0100
Message-Id: <1297693958-25388-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
References: <1297693958-25388-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 4/5] python: move s/python/${PN}/g in generate-manifest-2.6.py and regenerate it
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
X-List-Received-Date: Mon, 14 Feb 2011 14:34:18 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 contrib/python/generate-manifest-2.6.py |  144 ++++++------
 recipes/python/python-2.6-manifest.inc  |  394 +++++++++++++++---------------
 2 files changed, 269 insertions(+), 269 deletions(-)

diff --git a/contrib/python/generate-manifest-2.6.py b/contrib/python/generate-manifest-2.6.py
index b094751..6d7bee9 100755
--- a/contrib/python/generate-manifest-2.6.py
+++ b/contrib/python/generate-manifest-2.6.py
@@ -76,11 +76,11 @@ class MakefileMaker:
         # generate package line
         #
 
-        packageLine = 'PACKAGES="python-core-dbg '
+        packageLine = 'PACKAGES="${PN}-core-dbg '
         for name in sorted(self.packages):
-            if name != 'python-core-dbg':
+            if name != '${PN}-core-dbg':
                 packageLine += "%s " % name
-        packageLine += 'python-modules"'
+        packageLine += '${PN}-modules"'
 
         self.out( packageLine )
         self.out( "" )
@@ -119,15 +119,15 @@ class MakefileMaker:
             self.out( line )
             self.out( "" )
 
-        self.out( 'DESCRIPTION_python-modules="All Python modules"' )
-        line = 'RDEPENDS_python-modules="'
+        self.out( 'DESCRIPTION_${PN}-modules="All Python modules"' )
+        line = 'RDEPENDS_${PN}-modules="'
 
         for name, data in sorted(self.packages.iteritems()):
-            if name not in ['python-core-dbg', 'python-dev']:
+            if name not in ['${PN}-core-dbg', '${PN}-dev']:
                 line += "%s " % name
 
         self.out( "%s \"" % line )
-        self.out( 'ALLOW_EMPTY_python-modules = "1"' )
+        self.out( 'ALLOW_EMPTY_${PN}-modules = "1"' )
 
     def doEpilog( self ):
         self.out( """""" )
@@ -152,7 +152,7 @@ if __name__ == "__main__":
     # Parameters: revision, name, description, dependencies, filenames
     #
 
-    m.addPackage( "python-core", "Python Interpreter and core modules (needed!)", "",
+    m.addPackage( "${PN}-core", "Python Interpreter and core modules (needed!)", "",
     "__future__.* _abcoll.* abc.* copy.* copy_reg.* ConfigParser.* " +
     "genericpath.* getopt.* linecache.* new.* " +
     "os.* posixpath.* struct.* " +
@@ -161,202 +161,202 @@ if __name__ == "__main__":
     "lib-dynload/binascii.so lib-dynload/_struct.so lib-dynload/time.so " +
     "lib-dynload/xreadlines.so types.* platform.* ${bindir}/python*" )
 
-    m.addPackage( "python-core-dbg", "Python core module debug information", "python-core",
+    m.addPackage( "${PN}-core-dbg", "Python core module debug information", "${PN}-core",
     "config/.debug lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug" )
 
-    m.addPackage( "python-dev", "Python Development Package", "python-core",
+    m.addPackage( "${PN}-dev", "Python Development Package", "${PN}-core",
     "${includedir} ${libdir}/libpython2.6.so config" ) # package
 
-    m.addPackage( "python-idle", "Python Integrated Development Environment", "python-core python-tkinter",
+    m.addPackage( "${PN}-idle", "Python Integrated Development Environment", "${PN}-core ${PN}-tkinter",
     "${bindir}/idle idlelib" ) # package
 
-    m.addPackage( "python-pydoc", "Python Interactive Help Support", "python-core python-lang python-stringold python-re",
+    m.addPackage( "${PN}-pydoc", "Python Interactive Help Support", "${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re",
     "${bindir}/pydoc pydoc.*" )
 
-    m.addPackage( "python-smtpd", "Python Simple Mail Transport Daemon", "python-core python-netserver python-email python-mime",
+    m.addPackage( "${PN}-smtpd", "Python Simple Mail Transport Daemon", "${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime",
     "${bindir}/smtpd.*" )
 
-    m.addPackage( "python-audio", "Python Audio Handling", "python-core",
+    m.addPackage( "${PN}-audio", "Python Audio Handling", "${PN}-core",
     "wave.* chunk.* sndhdr.* lib-dynload/ossaudiodev.so lib-dynload/audioop.so" )
 
-    m.addPackage( "python-bsddb", "Python Berkeley Database Bindings", "python-core",
+    m.addPackage( "${PN}-bsddb", "Python Berkeley Database Bindings", "${PN}-core",
     "bsddb lib-dynload/_bsddb.so" ) # package
 
-    m.addPackage( "python-codecs", "Python Codecs, Encodings & i18n Support", "python-core python-lang",
+    m.addPackage( "${PN}-codecs", "Python Codecs, Encodings & i18n Support", "${PN}-core ${PN}-lang",
     "codecs.* encodings gettext.* locale.* lib-dynload/_locale.so lib-dynload/unicodedata.so stringprep.* xdrlib.*" )
 
-    m.addPackage( "python-compile", "Python Bytecode Compilation Support", "python-core",
+    m.addPackage( "${PN}-compile", "Python Bytecode Compilation Support", "${PN}-core",
     "py_compile.* compileall.*" )
 
-    m.addPackage( "python-compiler", "Python Compiler Support", "python-core",
+    m.addPackage( "${PN}-compiler", "Python Compiler Support", "${PN}-core",
     "compiler" ) # package
 
-    m.addPackage( "python-compression", "Python High Level Compression Support", "python-core python-zlib",
+    m.addPackage( "${PN}-compression", "Python High Level Compression Support", "${PN}-core ${PN}-zlib",
     "gzip.* zipfile.* tarfile.* lib-dynload/bz2.so" )
 
-    m.addPackage( "python-crypt", "Python Basic Cryptographic and Hashing Support", "python-core",
+    m.addPackage( "${PN}-crypt", "Python Basic Cryptographic and Hashing Support", "${PN}-core",
     "hashlib.* md5.* sha.* lib-dynload/crypt.so lib-dynload/_hashlib.so lib-dynload/_sha256.so lib-dynload/_sha512.so" )
 
-    m.addPackage( "python-textutils", "Python Option Parsing, Text Wrapping and Comma-Separated-Value Support", "python-core python-io python-re python-stringold",
+    m.addPackage( "${PN}-textutils", "Python Option Parsing, Text Wrapping and Comma-Separated-Value Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-stringold",
     "lib-dynload/_csv.so csv.* optparse.* textwrap.*" )
 
-    m.addPackage( "python-curses", "Python Curses Support", "python-core",
+    m.addPackage( "${PN}-curses", "Python Curses Support", "${PN}-core",
     "curses lib-dynload/_curses.so lib-dynload/_curses_panel.so" ) # directory + low level module
 
-    m.addPackage( "python-ctypes", "Python C Types Support", "python-core",
+    m.addPackage( "${PN}-ctypes", "Python C Types Support", "${PN}-core",
     "ctypes lib-dynload/_ctypes.so" ) # directory + low level module
 
-    m.addPackage( "python-datetime", "Python Calendar and Time support", "python-core python-codecs",
+    m.addPackage( "${PN}-datetime", "Python Calendar and Time support", "${PN}-core ${PN}-codecs",
     "_strptime.* calendar.* lib-dynload/datetime.so" )
 
-    m.addPackage( "python-db", "Python File-Based Database Support", "python-core",
+    m.addPackage( "${PN}-db", "Python File-Based Database Support", "${PN}-core",
     "anydbm.* dumbdbm.* whichdb.* " )
 
-    m.addPackage( "python-debugger", "Python Debugger", "python-core python-io python-lang python-re python-stringold python-shell python-pprint",
+    m.addPackage( "${PN}-debugger", "Python Debugger", "${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint",
     "bdb.* pdb.*" )
 
-    m.addPackage( "python-difflib", "Python helpers for computing deltas between objects.", "python-lang python-re",
+    m.addPackage( "${PN}-difflib", "Python helpers for computing deltas between objects.", "${PN}-lang ${PN}-re",
     "difflib.*" )
 
-    m.addPackage( "python-distutils", "Python Distribution Utilities", "python-core",
+    m.addPackage( "${PN}-distutils", "Python Distribution Utilities", "${PN}-core",
     "config distutils" ) # package
 
-    m.addPackage( "python-doctest", "Python framework for running examples in docstrings.", "python-core python-lang python-io python-re python-unittest python-debugger python-difflib",
+    m.addPackage( "${PN}-doctest", "Python framework for running examples in docstrings.", "${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib",
     "doctest.*" )
 
     # FIXME consider adding to some higher level package
-    m.addPackage( "python-elementtree", "Python elementree", "python-core",
+    m.addPackage( "${PN}-elementtree", "Python elementree", "${PN}-core",
     "lib-dynload/_elementtree.so" )
 
-    m.addPackage( "python-email", "Python Email Support", "python-core python-io python-re python-mime python-audio python-image python-netclient",
+    m.addPackage( "${PN}-email", "Python Email Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient",
     "imaplib.* email" ) # package
 
-    m.addPackage( "python-fcntl", "Python's fcntl Interface", "python-core",
+    m.addPackage( "${PN}-fcntl", "Python's fcntl Interface", "${PN}-core",
     "lib-dynload/fcntl.so" )
 
-    m.addPackage( "python-hotshot", "Python Hotshot Profiler", "python-core",
+    m.addPackage( "${PN}-hotshot", "Python Hotshot Profiler", "${PN}-core",
     "hotshot lib-dynload/_hotshot.so" )
 
-    m.addPackage( "python-html", "Python HTML Processing", "python-core",
+    m.addPackage( "${PN}-html", "Python HTML Processing", "${PN}-core",
     "formatter.* htmlentitydefs.* htmllib.* markupbase.* sgmllib.* " )
 
-    m.addPackage( "python-gdbm", "Python GNU Database Support", "python-core",
+    m.addPackage( "${PN}-gdbm", "Python GNU Database Support", "${PN}-core",
     "lib-dynload/gdbm.so" )
 
-    m.addPackage( "python-image", "Python Graphical Image Handling", "python-core",
+    m.addPackage( "${PN}-image", "Python Graphical Image Handling", "${PN}-core",
     "colorsys.* imghdr.* lib-dynload/imageop.so lib-dynload/rgbimg.so" )
 
-    m.addPackage( "python-io", "Python Low-Level I/O", "python-core python-math",
+    m.addPackage( "${PN}-io", "Python Low-Level I/O", "${PN}-core ${PN}-math",
     "lib-dynload/_socket.so lib-dynload/_ssl.so lib-dynload/select.so lib-dynload/termios.so lib-dynload/cStringIO.so " +
     "pipes.* socket.* ssl.* tempfile.* StringIO.* " )
 
-    m.addPackage( "python-json", "Python JSON Support", "python-core python-math python-re",
+    m.addPackage( "${PN}-json", "Python JSON Support", "${PN}-core ${PN}-math ${PN}-re",
     "json" ) # package
 
-    m.addPackage( "python-lang", "Python Low-Level Language Support", "python-core",
+    m.addPackage( "${PN}-lang", "Python Low-Level Language Support", "${PN}-core",
     "lib-dynload/_bisect.so lib-dynload/_collections.so lib-dynload/_heapq.so lib-dynload/_weakref.so lib-dynload/_functools.so " +
     "lib-dynload/array.so lib-dynload/itertools.so lib-dynload/operator.so lib-dynload/parser.so " +
     "atexit.* bisect.* code.* codeop.* collections.* dis.* functools.* heapq.* inspect.* keyword.* opcode.* symbol.* repr.* token.* " +
     "tokenize.* traceback.* linecache.* weakref.*" )
 
-    m.addPackage( "python-logging", "Python Logging Support", "python-core python-io python-lang python-pickle python-stringold",
+    m.addPackage( "${PN}-logging", "Python Logging Support", "${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold",
     "logging" ) # package
 
-    m.addPackage( "python-mailbox", "Python Mailbox Format Support", "python-core python-mime",
+    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
-    m.addPackage( "python-math", "Python Math Support", "python-core",
+    m.addPackage( "${PN}-math", "Python Math Support", "${PN}-core",
     "lib-dynload/cmath.so lib-dynload/math.so lib-dynload/_random.so random.* sets.*" )
 
-    m.addPackage( "python-mime", "Python MIME Handling APIs", "python-core python-io",
+    m.addPackage( "${PN}-mime", "Python MIME Handling APIs", "${PN}-core ${PN}-io",
     "mimetools.* uu.* quopri.* rfc822.*" )
 
-    m.addPackage( "python-mmap", "Python Memory-Mapped-File Support", "python-core python-io",
+    m.addPackage( "${PN}-mmap", "Python Memory-Mapped-File Support", "${PN}-core ${PN}-io",
     "lib-dynload/mmap.so " )
 
-    m.addPackage( "python-multiprocessing", "Python Multiprocessing Support", "python-core python-io python-lang",
+    m.addPackage( "${PN}-multiprocessing", "Python Multiprocessing Support", "${PN}-core ${PN}-io ${PN}-lang",
     "lib-dynload/_multiprocessing.so multiprocessing" ) # package
 
-    m.addPackage( "python-netclient", "Python Internet Protocol Clients", "python-core python-crypt python-datetime python-io python-lang python-logging python-mime",
+    m.addPackage( "${PN}-netclient", "Python Internet Protocol Clients", "${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime",
     "*Cookie*.* " +
     "base64.* cookielib.* ftplib.* gopherlib.* hmac.* httplib.* mimetypes.* nntplib.* poplib.* smtplib.* telnetlib.* urllib.* urllib2.* urlparse.* uuid.* rfc822.* mimetools.*" )
 
-    m.addPackage( "python-netserver", "Python Internet Protocol Servers", "python-core python-netclient",
+    m.addPackage( "${PN}-netserver", "Python Internet Protocol Servers", "${PN}-core ${PN}-netclient",
     "cgi.* *HTTPServer.* SocketServer.*" )
 
-    m.addPackage( "python-numbers", "Python Number APIs", "python-core python-lang python-re",
+    m.addPackage( "${PN}-numbers", "Python Number APIs", "${PN}-core ${PN}-lang ${PN}-re",
     "decimal.* numbers.*" )
 
-    m.addPackage( "python-pickle", "Python Persistence Support", "python-core python-codecs python-io python-re",
+    m.addPackage( "${PN}-pickle", "Python Persistence Support", "${PN}-core ${PN}-codecs ${PN}-io ${PN}-re",
     "pickle.* shelve.* lib-dynload/cPickle.so" )
 
-    m.addPackage( "python-pkgutil", "Python Package Extension Utility Support", "python-core",
+    m.addPackage( "${PN}-pkgutil", "Python Package Extension Utility Support", "${PN}-core",
     "pkgutil.*")
 
-    m.addPackage( "python-pprint", "Python Pretty-Print Support", "python-core",
+    m.addPackage( "${PN}-pprint", "Python Pretty-Print Support", "${PN}-core",
     "pprint.*" )
 
-    m.addPackage( "python-profile", "Python Basic Profiling Support", "python-core python-textutils",
+    m.addPackage( "${PN}-profile", "Python Basic Profiling Support", "${PN}-core ${PN}-textutils",
     "profile.* pstats.* cProfile.* lib-dynload/_lsprof.so" )
 
-    m.addPackage( "python-re", "Python Regular Expression APIs", "python-core",
+    m.addPackage( "${PN}-re", "Python Regular Expression APIs", "${PN}-core",
     "re.* sre.* sre_compile.* sre_constants* sre_parse.*" ) # _sre is builtin
 
-    m.addPackage( "python-readline", "Python Readline Support", "python-core",
+    m.addPackage( "${PN}-readline", "Python Readline Support", "${PN}-core",
     "lib-dynload/readline.so rlcompleter.*" )
 
-    m.addPackage( "python-resource", "Python Resource Control Interface", "python-core",
+    m.addPackage( "${PN}-resource", "Python Resource Control Interface", "${PN}-core",
     "lib-dynload/resource.so" )
 
-    m.addPackage( "python-shell", "Python Shell-Like Functionality", "python-core python-re",
+    m.addPackage( "${PN}-shell", "Python Shell-Like Functionality", "${PN}-core ${PN}-re",
     "cmd.* commands.* dircache.* fnmatch.* glob.* popen2.* shlex.* shutil.*" )
 
-    m.addPackage( "python-robotparser", "Python robots.txt parser", "python-core python-netclient",
+    m.addPackage( "${PN}-robotparser", "Python robots.txt parser", "${PN}-core ${PN}-netclient",
     "robotparser.*")
 
-    m.addPackage( "python-subprocess", "Python Subprocess Support", "python-core python-io python-re python-fcntl python-pickle",
+    m.addPackage( "${PN}-subprocess", "Python Subprocess Support", "${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle",
     "subprocess.*" )
 
-    m.addPackage( "python-sqlite3", "Python Sqlite3 Database Support", "python-core python-datetime python-lang python-crypt python-io python-threading python-zlib",
+    m.addPackage( "${PN}-sqlite3", "Python Sqlite3 Database Support", "${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib",
     "lib-dynload/_sqlite3.so sqlite3/dbapi2.* sqlite3/__init__.* sqlite3/dump.*" )
 
-    m.addPackage( "python-sqlite3-tests", "Python Sqlite3 Database Support Tests", "python-core python-sqlite3",
+    m.addPackage( "${PN}-sqlite3-tests", "Python Sqlite3 Database Support Tests", "${PN}-core ${PN}-sqlite3",
     "sqlite3/test" )
 
-    m.addPackage( "python-stringold", "Python String APIs [deprecated]", "python-core python-re",
+    m.addPackage( "${PN}-stringold", "Python String APIs [deprecated]", "${PN}-core ${PN}-re",
     "lib-dynload/strop.so string.*" )
 
-    m.addPackage( "python-syslog", "Python Syslog Interface", "python-core",
+    m.addPackage( "${PN}-syslog", "Python Syslog Interface", "${PN}-core",
     "lib-dynload/syslog.so" )
 
-    m.addPackage( "python-terminal", "Python Terminal Controlling Support", "python-core python-io",
+    m.addPackage( "${PN}-terminal", "Python Terminal Controlling Support", "${PN}-core ${PN}-io",
     "pty.* tty.*" )
 
-    m.addPackage( "python-tests", "Python Tests", "python-core",
+    m.addPackage( "${PN}-tests", "Python Tests", "${PN}-core",
     "test" ) # package
 
-    m.addPackage( "python-threading", "Python Threading & Synchronization Support", "python-core python-lang",
+    m.addPackage( "${PN}-threading", "Python Threading & Synchronization Support", "${PN}-core ${PN}-lang",
     "_threading_local.* dummy_thread.* dummy_threading.* mutex.* threading.* Queue.*" )
 
-    m.addPackage( "python-tkinter", "Python Tcl/Tk Bindings", "python-core",
+    m.addPackage( "${PN}-tkinter", "Python Tcl/Tk Bindings", "${PN}-core",
     "lib-dynload/_tkinter.so lib-tk" ) # package
 
-    m.addPackage( "python-unittest", "Python Unit Testing Framework", "python-core python-stringold python-lang",
+    m.addPackage( "${PN}-unittest", "Python Unit Testing Framework", "${PN}-core ${PN}-stringold ${PN}-lang",
     "unittest.*" )
 
-    m.addPackage( "python-unixadmin", "Python Unix Administration Support", "python-core",
+    m.addPackage( "${PN}-unixadmin", "Python Unix Administration Support", "${PN}-core",
     "lib-dynload/nis.so lib-dynload/grp.so lib-dynload/pwd.so getpass.*" )
 
-    m.addPackage( "python-xml", "Python basic XML support.", "python-core python-re",
+    m.addPackage( "${PN}-xml", "Python basic XML support.", "${PN}-core ${PN}-re",
     "lib-dynload/pyexpat.so xml xmllib.*" ) # package
 
-    m.addPackage( "python-xmlrpc", "Python XMLRPC Support", "python-core python-xml python-netserver python-lang",
+    m.addPackage( "${PN}-xmlrpc", "Python XMLRPC Support", "${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang",
     "xmlrpclib.* SimpleXMLRPCServer.*" )
 
-    m.addPackage( "python-zlib", "Python zlib Support.", "python-core",
+    m.addPackage( "${PN}-zlib", "Python zlib Support.", "${PN}-core",
     "lib-dynload/zlib.so" )
 
-    m.addPackage( "python-mailbox", "Python Mailbox Format Support", "python-core python-mime",
+    m.addPackage( "${PN}-mailbox", "Python Mailbox Format Support", "${PN}-core ${PN}-mime",
     "mailbox.*" )
 
     m.make()
diff --git a/recipes/python/python-2.6-manifest.inc b/recipes/python/python-2.6-manifest.inc
index 6ea3792..65ba9b8 100644
--- a/recipes/python/python-2.6-manifest.inc
+++ b/recipes/python/python-2.6-manifest.inc
@@ -5,268 +5,268 @@
 
  
 
-PROVIDES+="python-audio python-bsddb python-codecs python-compile python-compiler python-compression python-core python-core-dbg python-crypt python-ctypes python-curses python-datetime python-db python-debugger python-dev python-difflib python-distutils python-doctest python-elementtree python-email python-fcntl python-gdbm python-hotshot python-html python-idle python-image python-io python-json python-lang python-logging python-mailbox python-math python-mime python-mmap python-multiprocessing python-netclient python-netserver python-numbers python-pickle python-pkgutil python-pprint python-profile python-pydoc python-re python-readline python-resource python-robotparser python-shell python-smtpd python-sqlite3 python-sqlite3-tests python-stringold python-subprocess python-syslog python-terminal python-tests python-textutils python-threading python-tkinter python-unittest python-unixadmin python-xml python-xmlrpc python-zlib "
+PROVIDES+="${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-core-dbg ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib "
 
-PACKAGES="python-core-dbg python-audio python-bsddb python-codecs python-compile python-compiler python-compression python-core python-crypt python-ctypes python-curses python-datetime python-db python-debugger python-dev python-difflib python-distutils python-doctest python-elementtree python-email python-fcntl python-gdbm python-hotshot python-html python-idle python-image python-io python-json python-lang python-logging python-mailbox python-math python-mime python-mmap python-multiprocessing python-netclient python-netserver python-numbers python-pickle python-pkgutil python-pprint python-profile python-pydoc python-re python-readline python-resource python-robotparser python-shell python-smtpd python-sqlite3 python-sqlite3-tests python-stringold python-subprocess python-syslog python-terminal python-tests python-textutils python-threading python-tkinter python-unittest python-unixadmin python-xml python-xmlrpc python-zlib python-modules"
+PACKAGES="${PN}-core-dbg ${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-dev ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib ${PN}-modules"
 
-DESCRIPTION_python-audio="Python Audio Handling"
-RDEPENDS_python-audio="python-core"
-FILES_python-audio="${libdir}/python2.6/wave.* ${libdir}/python2.6/chunk.* ${libdir}/python2.6/sndhdr.* ${libdir}/python2.6/lib-dynload/ossaudiodev.so ${libdir}/python2.6/lib-dynload/audioop.so "
+DESCRIPTION_${PN}-audio="Python Audio Handling"
+RDEPENDS_${PN}-audio="${PN}-core"
+FILES_${PN}-audio="${libdir}/python2.6/wave.* ${libdir}/python2.6/chunk.* ${libdir}/python2.6/sndhdr.* ${libdir}/python2.6/lib-dynload/ossaudiodev.so ${libdir}/python2.6/lib-dynload/audioop.so "
 
-DESCRIPTION_python-bsddb="Python Berkeley Database Bindings"
-RDEPENDS_python-bsddb="python-core"
-FILES_python-bsddb="${libdir}/python2.6/bsddb ${libdir}/python2.6/lib-dynload/_bsddb.so "
+DESCRIPTION_${PN}-bsddb="Python Berkeley Database Bindings"
+RDEPENDS_${PN}-bsddb="${PN}-core"
+FILES_${PN}-bsddb="${libdir}/python2.6/bsddb ${libdir}/python2.6/lib-dynload/_bsddb.so "
 
-DESCRIPTION_python-codecs="Python Codecs, Encodings & i18n Support"
-RDEPENDS_python-codecs="python-core python-lang"
-FILES_python-codecs="${libdir}/python2.6/codecs.* ${libdir}/python2.6/encodings ${libdir}/python2.6/gettext.* ${libdir}/python2.6/locale.* ${libdir}/python2.6/lib-dynload/_locale.so ${libdir}/python2.6/lib-dynload/unicodedata.so ${libdir}/python2.6/stringprep.* ${libdir}/python2.6/xdrlib.* "
+DESCRIPTION_${PN}-codecs="Python Codecs, Encodings & i18n Support"
+RDEPENDS_${PN}-codecs="${PN}-core ${PN}-lang"
+FILES_${PN}-codecs="${libdir}/python2.6/codecs.* ${libdir}/python2.6/encodings ${libdir}/python2.6/gettext.* ${libdir}/python2.6/locale.* ${libdir}/python2.6/lib-dynload/_locale.so ${libdir}/python2.6/lib-dynload/unicodedata.so ${libdir}/python2.6/stringprep.* ${libdir}/python2.6/xdrlib.* "
 
-DESCRIPTION_python-compile="Python Bytecode Compilation Support"
-RDEPENDS_python-compile="python-core"
-FILES_python-compile="${libdir}/python2.6/py_compile.* ${libdir}/python2.6/compileall.* "
+DESCRIPTION_${PN}-compile="Python Bytecode Compilation Support"
+RDEPENDS_${PN}-compile="${PN}-core"
+FILES_${PN}-compile="${libdir}/python2.6/py_compile.* ${libdir}/python2.6/compileall.* "
 
-DESCRIPTION_python-compiler="Python Compiler Support"
-RDEPENDS_python-compiler="python-core"
-FILES_python-compiler="${libdir}/python2.6/compiler "
+DESCRIPTION_${PN}-compiler="Python Compiler Support"
+RDEPENDS_${PN}-compiler="${PN}-core"
+FILES_${PN}-compiler="${libdir}/python2.6/compiler "
 
-DESCRIPTION_python-compression="Python High Level Compression Support"
-RDEPENDS_python-compression="python-core python-zlib"
-FILES_python-compression="${libdir}/python2.6/gzip.* ${libdir}/python2.6/zipfile.* ${libdir}/python2.6/tarfile.* ${libdir}/python2.6/lib-dynload/bz2.so "
+DESCRIPTION_${PN}-compression="Python High Level Compression Support"
+RDEPENDS_${PN}-compression="${PN}-core ${PN}-zlib"
+FILES_${PN}-compression="${libdir}/python2.6/gzip.* ${libdir}/python2.6/zipfile.* ${libdir}/python2.6/tarfile.* ${libdir}/python2.6/lib-dynload/bz2.so "
 
-DESCRIPTION_python-core="Python Interpreter and core modules (needed!)"
-RDEPENDS_python-core=""
-FILES_python-core="${libdir}/python2.6/__future__.* ${libdir}/python2.6/_abcoll.* ${libdir}/python2.6/abc.* ${libdir}/python2.6/copy.* ${libdir}/python2.6/copy_reg.* ${libdir}/python2.6/ConfigParser.* ${libdir}/python2.6/genericpath.* ${libdir}/python2.6/getopt.* ${libdir}/python2.6/linecache.* ${libdir}/python2.6/new.* ${libdir}/python2.6/os.* ${libdir}/python2.6/posixpath.* ${libdir}/python2.6/struct.* ${libdir}/python2.6/warnings.* ${libdir}/python2.6/site.* ${libdir}/python2.6/stat.* ${libdir}/python2.6/UserDict.* ${libdir}/python2.6/UserList.* ${libdir}/python2.6/UserString.* ${libdir}/python2.6/lib-dynload/binascii.so ${libdir}/python2.6/lib-dynload/_struct.so ${libdir}/python2.6/lib-dynload/time.so ${libdir}/python2.6/lib-dynload/xreadlines.so ${libdir}/python2.6/types.* ${libdir}/python2.6/platform.* ${bindir}/python* "
+DESCRIPTION_${PN}-core="Python Interpreter and core modules (needed!)"
+RDEPENDS_${PN}-core=""
+FILES_${PN}-core="${libdir}/python2.6/__future__.* ${libdir}/python2.6/_abcoll.* ${libdir}/python2.6/abc.* ${libdir}/python2.6/copy.* ${libdir}/python2.6/copy_reg.* ${libdir}/python2.6/ConfigParser.* ${libdir}/python2.6/genericpath.* ${libdir}/python2.6/getopt.* ${libdir}/python2.6/linecache.* ${libdir}/python2.6/new.* ${libdir}/python2.6/os.* ${libdir}/python2.6/posixpath.* ${libdir}/python2.6/struct.* ${libdir}/python2.6/warnings.* ${libdir}/python2.6/site.* ${libdir}/python2.6/stat.* ${libdir}/python2.6/UserDict.* ${libdir}/python2.6/UserList.* ${libdir}/python2.6/UserString.* ${libdir}/python2.6/lib-dynload/binascii.so ${libdir}/python2.6/lib-dynload/_struct.so ${libdir}/python2.6/lib-dynload/time.so ${libdir}/python2.6/lib-dynload/xreadlines.so ${libdir}/python2.6/types.* ${libdir}/python2.6/platform.* ${bindir}/python* "
 
-DESCRIPTION_python-core-dbg="Python core module debug information"
-RDEPENDS_python-core-dbg="python-core"
-FILES_python-core-dbg="${libdir}/python2.6/config/.debug ${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug "
+DESCRIPTION_${PN}-core-dbg="Python core module debug information"
+RDEPENDS_${PN}-core-dbg="${PN}-core"
+FILES_${PN}-core-dbg="${libdir}/python2.6/config/.debug ${libdir}/python2.6/lib-dynload/.debug ${bindir}/.debug ${libdir}/.debug "
 
-DESCRIPTION_python-crypt="Python Basic Cryptographic and Hashing Support"
-RDEPENDS_python-crypt="python-core"
-FILES_python-crypt="${libdir}/python2.6/hashlib.* ${libdir}/python2.6/md5.* ${libdir}/python2.6/sha.* ${libdir}/python2.6/lib-dynload/crypt.so ${libdir}/python2.6/lib-dynload/_hashlib.so ${libdir}/python2.6/lib-dynload/_sha256.so ${libdir}/python2.6/lib-dynload/_sha512.so "
+DESCRIPTION_${PN}-crypt="Python Basic Cryptographic and Hashing Support"
+RDEPENDS_${PN}-crypt="${PN}-core"
+FILES_${PN}-crypt="${libdir}/python2.6/hashlib.* ${libdir}/python2.6/md5.* ${libdir}/python2.6/sha.* ${libdir}/python2.6/lib-dynload/crypt.so ${libdir}/python2.6/lib-dynload/_hashlib.so ${libdir}/python2.6/lib-dynload/_sha256.so ${libdir}/python2.6/lib-dynload/_sha512.so "
 
-DESCRIPTION_python-ctypes="Python C Types Support"
-RDEPENDS_python-ctypes="python-core"
-FILES_python-ctypes="${libdir}/python2.6/ctypes ${libdir}/python2.6/lib-dynload/_ctypes.so "
+DESCRIPTION_${PN}-ctypes="Python C Types Support"
+RDEPENDS_${PN}-ctypes="${PN}-core"
+FILES_${PN}-ctypes="${libdir}/python2.6/ctypes ${libdir}/python2.6/lib-dynload/_ctypes.so "
 
-DESCRIPTION_python-curses="Python Curses Support"
-RDEPENDS_python-curses="python-core"
-FILES_python-curses="${libdir}/python2.6/curses ${libdir}/python2.6/lib-dynload/_curses.so ${libdir}/python2.6/lib-dynload/_curses_panel.so "
+DESCRIPTION_${PN}-curses="Python Curses Support"
+RDEPENDS_${PN}-curses="${PN}-core"
+FILES_${PN}-curses="${libdir}/python2.6/curses ${libdir}/python2.6/lib-dynload/_curses.so ${libdir}/python2.6/lib-dynload/_curses_panel.so "
 
-DESCRIPTION_python-datetime="Python Calendar and Time support"
-RDEPENDS_python-datetime="python-core python-codecs"
-FILES_python-datetime="${libdir}/python2.6/_strptime.* ${libdir}/python2.6/calendar.* ${libdir}/python2.6/lib-dynload/datetime.so "
+DESCRIPTION_${PN}-datetime="Python Calendar and Time support"
+RDEPENDS_${PN}-datetime="${PN}-core ${PN}-codecs"
+FILES_${PN}-datetime="${libdir}/python2.6/_strptime.* ${libdir}/python2.6/calendar.* ${libdir}/python2.6/lib-dynload/datetime.so "
 
-DESCRIPTION_python-db="Python File-Based Database Support"
-RDEPENDS_python-db="python-core"
-FILES_python-db="${libdir}/python2.6/anydbm.* ${libdir}/python2.6/dumbdbm.* ${libdir}/python2.6/whichdb.* "
+DESCRIPTION_${PN}-db="Python File-Based Database Support"
+RDEPENDS_${PN}-db="${PN}-core"
+FILES_${PN}-db="${libdir}/python2.6/anydbm.* ${libdir}/python2.6/dumbdbm.* ${libdir}/python2.6/whichdb.* "
 
-DESCRIPTION_python-debugger="Python Debugger"
-RDEPENDS_python-debugger="python-core python-io python-lang python-re python-stringold python-shell python-pprint"
-FILES_python-debugger="${libdir}/python2.6/bdb.* ${libdir}/python2.6/pdb.* "
+DESCRIPTION_${PN}-debugger="Python Debugger"
+RDEPENDS_${PN}-debugger="${PN}-core ${PN}-io ${PN}-lang ${PN}-re ${PN}-stringold ${PN}-shell ${PN}-pprint"
+FILES_${PN}-debugger="${libdir}/python2.6/bdb.* ${libdir}/python2.6/pdb.* "
 
-DESCRIPTION_python-dev="Python Development Package"
-RDEPENDS_python-dev="python-core"
-FILES_python-dev="${includedir} ${libdir}/libpython2.6.so ${libdir}/python2.6/config "
+DESCRIPTION_${PN}-dev="Python Development Package"
+RDEPENDS_${PN}-dev="${PN}-core"
+FILES_${PN}-dev="${includedir} ${libdir}/libpython2.6.so ${libdir}/python2.6/config "
 
-DESCRIPTION_python-difflib="Python helpers for computing deltas between objects."
-RDEPENDS_python-difflib="python-lang python-re"
-FILES_python-difflib="${libdir}/python2.6/difflib.* "
+DESCRIPTION_${PN}-difflib="Python helpers for computing deltas between objects."
+RDEPENDS_${PN}-difflib="${PN}-lang ${PN}-re"
+FILES_${PN}-difflib="${libdir}/python2.6/difflib.* "
 
-DESCRIPTION_python-distutils="Python Distribution Utilities"
-RDEPENDS_python-distutils="python-core"
-FILES_python-distutils="${libdir}/python2.6/config ${libdir}/python2.6/distutils "
+DESCRIPTION_${PN}-distutils="Python Distribution Utilities"
+RDEPENDS_${PN}-distutils="${PN}-core"
+FILES_${PN}-distutils="${libdir}/python2.6/config ${libdir}/python2.6/distutils "
 
-DESCRIPTION_python-doctest="Python framework for running examples in docstrings."
-RDEPENDS_python-doctest="python-core python-lang python-io python-re python-unittest python-debugger python-difflib"
-FILES_python-doctest="${libdir}/python2.6/doctest.* "
+DESCRIPTION_${PN}-doctest="Python framework for running examples in docstrings."
+RDEPENDS_${PN}-doctest="${PN}-core ${PN}-lang ${PN}-io ${PN}-re ${PN}-unittest ${PN}-debugger ${PN}-difflib"
+FILES_${PN}-doctest="${libdir}/python2.6/doctest.* "
 
-DESCRIPTION_python-elementtree="Python elementree"
-RDEPENDS_python-elementtree="python-core"
-FILES_python-elementtree="${libdir}/python2.6/lib-dynload/_elementtree.so "
+DESCRIPTION_${PN}-elementtree="Python elementree"
+RDEPENDS_${PN}-elementtree="${PN}-core"
+FILES_${PN}-elementtree="${libdir}/python2.6/lib-dynload/_elementtree.so "
 
-DESCRIPTION_python-email="Python Email Support"
-RDEPENDS_python-email="python-core python-io python-re python-mime python-audio python-image python-netclient"
-FILES_python-email="${libdir}/python2.6/imaplib.* ${libdir}/python2.6/email "
+DESCRIPTION_${PN}-email="Python Email Support"
+RDEPENDS_${PN}-email="${PN}-core ${PN}-io ${PN}-re ${PN}-mime ${PN}-audio ${PN}-image ${PN}-netclient"
+FILES_${PN}-email="${libdir}/python2.6/imaplib.* ${libdir}/python2.6/email "
 
-DESCRIPTION_python-fcntl="Python's fcntl Interface"
-RDEPENDS_python-fcntl="python-core"
-FILES_python-fcntl="${libdir}/python2.6/lib-dynload/fcntl.so "
+DESCRIPTION_${PN}-fcntl="Python's fcntl Interface"
+RDEPENDS_${PN}-fcntl="${PN}-core"
+FILES_${PN}-fcntl="${libdir}/python2.6/lib-dynload/fcntl.so "
 
-DESCRIPTION_python-gdbm="Python GNU Database Support"
-RDEPENDS_python-gdbm="python-core"
-FILES_python-gdbm="${libdir}/python2.6/lib-dynload/gdbm.so "
+DESCRIPTION_${PN}-gdbm="Python GNU Database Support"
+RDEPENDS_${PN}-gdbm="${PN}-core"
+FILES_${PN}-gdbm="${libdir}/python2.6/lib-dynload/gdbm.so "
 
-DESCRIPTION_python-hotshot="Python Hotshot Profiler"
-RDEPENDS_python-hotshot="python-core"
-FILES_python-hotshot="${libdir}/python2.6/hotshot ${libdir}/python2.6/lib-dynload/_hotshot.so "
+DESCRIPTION_${PN}-hotshot="Python Hotshot Profiler"
+RDEPENDS_${PN}-hotshot="${PN}-core"
+FILES_${PN}-hotshot="${libdir}/python2.6/hotshot ${libdir}/python2.6/lib-dynload/_hotshot.so "
 
-DESCRIPTION_python-html="Python HTML Processing"
-RDEPENDS_python-html="python-core"
-FILES_python-html="${libdir}/python2.6/formatter.* ${libdir}/python2.6/htmlentitydefs.* ${libdir}/python2.6/htmllib.* ${libdir}/python2.6/markupbase.* ${libdir}/python2.6/sgmllib.* "
+DESCRIPTION_${PN}-html="Python HTML Processing"
+RDEPENDS_${PN}-html="${PN}-core"
+FILES_${PN}-html="${libdir}/python2.6/formatter.* ${libdir}/python2.6/htmlentitydefs.* ${libdir}/python2.6/htmllib.* ${libdir}/python2.6/markupbase.* ${libdir}/python2.6/sgmllib.* "
 
-DESCRIPTION_python-idle="Python Integrated Development Environment"
-RDEPENDS_python-idle="python-core python-tkinter"
-FILES_python-idle="${bindir}/idle ${libdir}/python2.6/idlelib "
+DESCRIPTION_${PN}-idle="Python Integrated Development Environment"
+RDEPENDS_${PN}-idle="${PN}-core ${PN}-tkinter"
+FILES_${PN}-idle="${bindir}/idle ${libdir}/python2.6/idlelib "
 
-DESCRIPTION_python-image="Python Graphical Image Handling"
-RDEPENDS_python-image="python-core"
-FILES_python-image="${libdir}/python2.6/colorsys.* ${libdir}/python2.6/imghdr.* ${libdir}/python2.6/lib-dynload/imageop.so ${libdir}/python2.6/lib-dynload/rgbimg.so "
+DESCRIPTION_${PN}-image="Python Graphical Image Handling"
+RDEPENDS_${PN}-image="${PN}-core"
+FILES_${PN}-image="${libdir}/python2.6/colorsys.* ${libdir}/python2.6/imghdr.* ${libdir}/python2.6/lib-dynload/imageop.so ${libdir}/python2.6/lib-dynload/rgbimg.so "
 
-DESCRIPTION_python-io="Python Low-Level I/O"
-RDEPENDS_python-io="python-core python-math"
-FILES_python-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/ssl.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
+DESCRIPTION_${PN}-io="Python Low-Level I/O"
+RDEPENDS_${PN}-io="${PN}-core ${PN}-math"
+FILES_${PN}-io="${libdir}/python2.6/lib-dynload/_socket.so ${libdir}/python2.6/lib-dynload/_ssl.so ${libdir}/python2.6/lib-dynload/select.so ${libdir}/python2.6/lib-dynload/termios.so ${libdir}/python2.6/lib-dynload/cStringIO.so ${libdir}/python2.6/pipes.* ${libdir}/python2.6/socket.* ${libdir}/python2.6/ssl.* ${libdir}/python2.6/tempfile.* ${libdir}/python2.6/StringIO.* "
 
-DESCRIPTION_python-json="Python JSON Support"
-RDEPENDS_python-json="python-core python-math python-re"
-FILES_python-json="${libdir}/python2.6/json "
+DESCRIPTION_${PN}-json="Python JSON Support"
+RDEPENDS_${PN}-json="${PN}-core ${PN}-math ${PN}-re"
+FILES_${PN}-json="${libdir}/python2.6/json "
 
-DESCRIPTION_python-lang="Python Low-Level Language Support"
-RDEPENDS_python-lang="python-core"
-FILES_python-lang="${libdir}/python2.6/lib-dynload/_bisect.so ${libdir}/python2.6/lib-dynload/_collections.so ${libdir}/python2.6/lib-dynload/_heapq.so ${libdir}/python2.6/lib-dynload/_weakref.so ${libdir}/python2.6/lib-dynload/_functools.so ${libdir}/python2.6/lib-dynload/array.so ${libdir}/python2.6/lib-dynload/itertools.so ${libdir}/python2.6/lib-dynload/operator.so ${libdir}/python2.6/lib-dynload/parser.so ${libdir}/python2.6/atexit.* ${libdir}/python2.6/bisect.* ${libdir}/python2.6/code.* ${libdir}/python2.6/codeop.* ${libdir}/python2.6/collections.* ${libdir}/python2.6/dis.* ${libdir}/python2.6/functools.* ${libdir}/python2.6/heapq.* ${libdir}/python2.6/inspect.* ${libdir}/python2.6/keyword.* ${libdir}/python2.6/opcode.* ${libdir}/python2.6/symbol.* ${libdir}/python2.6/repr.* ${libdir}/python2.6/token.* ${libdir}/python2.6/tokenize.* ${libdir}/python2.6/traceback.* ${libdir}/python2.6/linecache.* ${libdir}/python2.6/weakref.* "
+DESCRIPTION_${PN}-lang="Python Low-Level Language Support"
+RDEPENDS_${PN}-lang="${PN}-core"
+FILES_${PN}-lang="${libdir}/python2.6/lib-dynload/_bisect.so ${libdir}/python2.6/lib-dynload/_collections.so ${libdir}/python2.6/lib-dynload/_heapq.so ${libdir}/python2.6/lib-dynload/_weakref.so ${libdir}/python2.6/lib-dynload/_functools.so ${libdir}/python2.6/lib-dynload/array.so ${libdir}/python2.6/lib-dynload/itertools.so ${libdir}/python2.6/lib-dynload/operator.so ${libdir}/python2.6/lib-dynload/parser.so ${libdir}/python2.6/atexit.* ${libdir}/python2.6/bisect.* ${libdir}/python2.6/code.* ${libdir}/python2.6/codeop.* ${libdir}/python2.6/collections.* ${libdir}/python2.6/dis.* ${libdir}/python2.6/functools.* ${libdir}/python2.6/heapq.* ${libdir}/python2.6/inspect.* ${libdir}/python2.6/keyword.* ${libdir}/python2.6/opcode.* ${libdir}/python2.6/symbol.* ${libdir}/python2.6/repr.* ${libdir}/python2.6/token.* ${libdir}/python2.6/tokenize.* ${libdir}/python2.6/traceback.* ${libdir}/python2.6/linecache.* ${libdir}/python2.6/weakref.* "
 
-DESCRIPTION_python-logging="Python Logging Support"
-RDEPENDS_python-logging="python-core python-io python-lang python-pickle python-stringold"
-FILES_python-logging="${libdir}/python2.6/logging "
+DESCRIPTION_${PN}-logging="Python Logging Support"
+RDEPENDS_${PN}-logging="${PN}-core ${PN}-io ${PN}-lang ${PN}-pickle ${PN}-stringold"
+FILES_${PN}-logging="${libdir}/python2.6/logging "
 
-DESCRIPTION_python-mailbox="Python Mailbox Format Support"
-RDEPENDS_python-mailbox="python-core python-mime"
-FILES_python-mailbox="${libdir}/python2.6/mailbox.* "
+DESCRIPTION_${PN}-mailbox="Python Mailbox Format Support"
+RDEPENDS_${PN}-mailbox="${PN}-core ${PN}-mime"
+FILES_${PN}-mailbox="${libdir}/python2.6/mailbox.* "
 
-DESCRIPTION_python-math="Python Math Support"
-RDEPENDS_python-math="python-core"
-FILES_python-math="${libdir}/python2.6/lib-dynload/cmath.so ${libdir}/python2.6/lib-dynload/math.so ${libdir}/python2.6/lib-dynload/_random.so ${libdir}/python2.6/random.* ${libdir}/python2.6/sets.* "
+DESCRIPTION_${PN}-math="Python Math Support"
+RDEPENDS_${PN}-math="${PN}-core"
+FILES_${PN}-math="${libdir}/python2.6/lib-dynload/cmath.so ${libdir}/python2.6/lib-dynload/math.so ${libdir}/python2.6/lib-dynload/_random.so ${libdir}/python2.6/random.* ${libdir}/python2.6/sets.* "
 
-DESCRIPTION_python-mime="Python MIME Handling APIs"
-RDEPENDS_python-mime="python-core python-io"
-FILES_python-mime="${libdir}/python2.6/mimetools.* ${libdir}/python2.6/uu.* ${libdir}/python2.6/quopri.* ${libdir}/python2.6/rfc822.* "
+DESCRIPTION_${PN}-mime="Python MIME Handling APIs"
+RDEPENDS_${PN}-mime="${PN}-core ${PN}-io"
+FILES_${PN}-mime="${libdir}/python2.6/mimetools.* ${libdir}/python2.6/uu.* ${libdir}/python2.6/quopri.* ${libdir}/python2.6/rfc822.* "
 
-DESCRIPTION_python-mmap="Python Memory-Mapped-File Support"
-RDEPENDS_python-mmap="python-core python-io"
-FILES_python-mmap="${libdir}/python2.6/lib-dynload/mmap.so "
+DESCRIPTION_${PN}-mmap="Python Memory-Mapped-File Support"
+RDEPENDS_${PN}-mmap="${PN}-core ${PN}-io"
+FILES_${PN}-mmap="${libdir}/python2.6/lib-dynload/mmap.so "
 
-DESCRIPTION_python-multiprocessing="Python Multiprocessing Support"
-RDEPENDS_python-multiprocessing="python-core python-io python-lang"
-FILES_python-multiprocessing="${libdir}/python2.6/lib-dynload/_multiprocessing.so ${libdir}/python2.6/multiprocessing "
+DESCRIPTION_${PN}-multiprocessing="Python Multiprocessing Support"
+RDEPENDS_${PN}-multiprocessing="${PN}-core ${PN}-io ${PN}-lang"
+FILES_${PN}-multiprocessing="${libdir}/python2.6/lib-dynload/_multiprocessing.so ${libdir}/python2.6/multiprocessing "
 
-DESCRIPTION_python-netclient="Python Internet Protocol Clients"
-RDEPENDS_python-netclient="python-core python-crypt python-datetime python-io python-lang python-logging python-mime"
-FILES_python-netclient="${libdir}/python2.6/*Cookie*.* ${libdir}/python2.6/base64.* ${libdir}/python2.6/cookielib.* ${libdir}/python2.6/ftplib.* ${libdir}/python2.6/gopherlib.* ${libdir}/python2.6/hmac.* ${libdir}/python2.6/httplib.* ${libdir}/python2.6/mimetypes.* ${libdir}/python2.6/nntplib.* ${libdir}/python2.6/poplib.* ${libdir}/python2.6/smtplib.* ${libdir}/python2.6/telnetlib.* ${libdir}/python2.6/urllib.* ${libdir}/python2.6/urllib2.* ${libdir}/python2.6/urlparse.* ${libdir}/python2.6/uuid.* ${libdir}/python2.6/rfc822.* ${libdir}/python2.6/mimetools.* "
+DESCRIPTION_${PN}-netclient="Python Internet Protocol Clients"
+RDEPENDS_${PN}-netclient="${PN}-core ${PN}-crypt ${PN}-datetime ${PN}-io ${PN}-lang ${PN}-logging ${PN}-mime"
+FILES_${PN}-netclient="${libdir}/python2.6/*Cookie*.* ${libdir}/python2.6/base64.* ${libdir}/python2.6/cookielib.* ${libdir}/python2.6/ftplib.* ${libdir}/python2.6/gopherlib.* ${libdir}/python2.6/hmac.* ${libdir}/python2.6/httplib.* ${libdir}/python2.6/mimetypes.* ${libdir}/python2.6/nntplib.* ${libdir}/python2.6/poplib.* ${libdir}/python2.6/smtplib.* ${libdir}/python2.6/telnetlib.* ${libdir}/python2.6/urllib.* ${libdir}/python2.6/urllib2.* ${libdir}/python2.6/urlparse.* ${libdir}/python2.6/uuid.* ${libdir}/python2.6/rfc822.* ${libdir}/python2.6/mimetools.* "
 
-DESCRIPTION_python-netserver="Python Internet Protocol Servers"
-RDEPENDS_python-netserver="python-core python-netclient"
-FILES_python-netserver="${libdir}/python2.6/cgi.* ${libdir}/python2.6/*HTTPServer.* ${libdir}/python2.6/SocketServer.* "
+DESCRIPTION_${PN}-netserver="Python Internet Protocol Servers"
+RDEPENDS_${PN}-netserver="${PN}-core ${PN}-netclient"
+FILES_${PN}-netserver="${libdir}/python2.6/cgi.* ${libdir}/python2.6/*HTTPServer.* ${libdir}/python2.6/SocketServer.* "
 
-DESCRIPTION_python-numbers="Python Number APIs"
-RDEPENDS_python-numbers="python-core python-lang python-re"
-FILES_python-numbers="${libdir}/python2.6/decimal.* ${libdir}/python2.6/numbers.* "
+DESCRIPTION_${PN}-numbers="Python Number APIs"
+RDEPENDS_${PN}-numbers="${PN}-core ${PN}-lang ${PN}-re"
+FILES_${PN}-numbers="${libdir}/python2.6/decimal.* ${libdir}/python2.6/numbers.* "
 
-DESCRIPTION_python-pickle="Python Persistence Support"
-RDEPENDS_python-pickle="python-core python-codecs python-io python-re"
-FILES_python-pickle="${libdir}/python2.6/pickle.* ${libdir}/python2.6/shelve.* ${libdir}/python2.6/lib-dynload/cPickle.so "
+DESCRIPTION_${PN}-pickle="Python Persistence Support"
+RDEPENDS_${PN}-pickle="${PN}-core ${PN}-codecs ${PN}-io ${PN}-re"
+FILES_${PN}-pickle="${libdir}/python2.6/pickle.* ${libdir}/python2.6/shelve.* ${libdir}/python2.6/lib-dynload/cPickle.so "
 
-DESCRIPTION_python-pkgutil="Python Package Extension Utility Support"
-RDEPENDS_python-pkgutil="python-core"
-FILES_python-pkgutil="${libdir}/python2.6/pkgutil.* "
+DESCRIPTION_${PN}-pkgutil="Python Package Extension Utility Support"
+RDEPENDS_${PN}-pkgutil="${PN}-core"
+FILES_${PN}-pkgutil="${libdir}/python2.6/pkgutil.* "
 
-DESCRIPTION_python-pprint="Python Pretty-Print Support"
-RDEPENDS_python-pprint="python-core"
-FILES_python-pprint="${libdir}/python2.6/pprint.* "
+DESCRIPTION_${PN}-pprint="Python Pretty-Print Support"
+RDEPENDS_${PN}-pprint="${PN}-core"
+FILES_${PN}-pprint="${libdir}/python2.6/pprint.* "
 
-DESCRIPTION_python-profile="Python Basic Profiling Support"
-RDEPENDS_python-profile="python-core python-textutils"
-FILES_python-profile="${libdir}/python2.6/profile.* ${libdir}/python2.6/pstats.* ${libdir}/python2.6/cProfile.* ${libdir}/python2.6/lib-dynload/_lsprof.so "
+DESCRIPTION_${PN}-profile="Python Basic Profiling Support"
+RDEPENDS_${PN}-profile="${PN}-core ${PN}-textutils"
+FILES_${PN}-profile="${libdir}/python2.6/profile.* ${libdir}/python2.6/pstats.* ${libdir}/python2.6/cProfile.* ${libdir}/python2.6/lib-dynload/_lsprof.so "
 
-DESCRIPTION_python-pydoc="Python Interactive Help Support"
-RDEPENDS_python-pydoc="python-core python-lang python-stringold python-re"
-FILES_python-pydoc="${bindir}/pydoc ${libdir}/python2.6/pydoc.* "
+DESCRIPTION_${PN}-pydoc="Python Interactive Help Support"
+RDEPENDS_${PN}-pydoc="${PN}-core ${PN}-lang ${PN}-stringold ${PN}-re"
+FILES_${PN}-pydoc="${bindir}/pydoc ${libdir}/python2.6/pydoc.* "
 
-DESCRIPTION_python-re="Python Regular Expression APIs"
-RDEPENDS_python-re="python-core"
-FILES_python-re="${libdir}/python2.6/re.* ${libdir}/python2.6/sre.* ${libdir}/python2.6/sre_compile.* ${libdir}/python2.6/sre_constants* ${libdir}/python2.6/sre_parse.* "
+DESCRIPTION_${PN}-re="Python Regular Expression APIs"
+RDEPENDS_${PN}-re="${PN}-core"
+FILES_${PN}-re="${libdir}/python2.6/re.* ${libdir}/python2.6/sre.* ${libdir}/python2.6/sre_compile.* ${libdir}/python2.6/sre_constants* ${libdir}/python2.6/sre_parse.* "
 
-DESCRIPTION_python-readline="Python Readline Support"
-RDEPENDS_python-readline="python-core"
-FILES_python-readline="${libdir}/python2.6/lib-dynload/readline.so ${libdir}/python2.6/rlcompleter.* "
+DESCRIPTION_${PN}-readline="Python Readline Support"
+RDEPENDS_${PN}-readline="${PN}-core"
+FILES_${PN}-readline="${libdir}/python2.6/lib-dynload/readline.so ${libdir}/python2.6/rlcompleter.* "
 
-DESCRIPTION_python-resource="Python Resource Control Interface"
-RDEPENDS_python-resource="python-core"
-FILES_python-resource="${libdir}/python2.6/lib-dynload/resource.so "
+DESCRIPTION_${PN}-resource="Python Resource Control Interface"
+RDEPENDS_${PN}-resource="${PN}-core"
+FILES_${PN}-resource="${libdir}/python2.6/lib-dynload/resource.so "
 
-DESCRIPTION_python-robotparser="Python robots.txt parser"
-RDEPENDS_python-robotparser="python-core python-netclient"
-FILES_python-robotparser="${libdir}/python2.6/robotparser.* "
+DESCRIPTION_${PN}-robotparser="Python robots.txt parser"
+RDEPENDS_${PN}-robotparser="${PN}-core ${PN}-netclient"
+FILES_${PN}-robotparser="${libdir}/python2.6/robotparser.* "
 
-DESCRIPTION_python-shell="Python Shell-Like Functionality"
-RDEPENDS_python-shell="python-core python-re"
-FILES_python-shell="${libdir}/python2.6/cmd.* ${libdir}/python2.6/commands.* ${libdir}/python2.6/dircache.* ${libdir}/python2.6/fnmatch.* ${libdir}/python2.6/glob.* ${libdir}/python2.6/popen2.* ${libdir}/python2.6/shlex.* ${libdir}/python2.6/shutil.* "
+DESCRIPTION_${PN}-shell="Python Shell-Like Functionality"
+RDEPENDS_${PN}-shell="${PN}-core ${PN}-re"
+FILES_${PN}-shell="${libdir}/python2.6/cmd.* ${libdir}/python2.6/commands.* ${libdir}/python2.6/dircache.* ${libdir}/python2.6/fnmatch.* ${libdir}/python2.6/glob.* ${libdir}/python2.6/popen2.* ${libdir}/python2.6/shlex.* ${libdir}/python2.6/shutil.* "
 
-DESCRIPTION_python-smtpd="Python Simple Mail Transport Daemon"
-RDEPENDS_python-smtpd="python-core python-netserver python-email python-mime"
-FILES_python-smtpd="${bindir}/smtpd.* "
+DESCRIPTION_${PN}-smtpd="Python Simple Mail Transport Daemon"
+RDEPENDS_${PN}-smtpd="${PN}-core ${PN}-netserver ${PN}-email ${PN}-mime"
+FILES_${PN}-smtpd="${bindir}/smtpd.* "
 
-DESCRIPTION_python-sqlite3="Python Sqlite3 Database Support"
-RDEPENDS_python-sqlite3="python-core python-datetime python-lang python-crypt python-io python-threading python-zlib"
-FILES_python-sqlite3="${libdir}/python2.6/lib-dynload/_sqlite3.so ${libdir}/python2.6/sqlite3/dbapi2.* ${libdir}/python2.6/sqlite3/__init__.* ${libdir}/python2.6/sqlite3/dump.* "
+DESCRIPTION_${PN}-sqlite3="Python Sqlite3 Database Support"
+RDEPENDS_${PN}-sqlite3="${PN}-core ${PN}-datetime ${PN}-lang ${PN}-crypt ${PN}-io ${PN}-threading ${PN}-zlib"
+FILES_${PN}-sqlite3="${libdir}/python2.6/lib-dynload/_sqlite3.so ${libdir}/python2.6/sqlite3/dbapi2.* ${libdir}/python2.6/sqlite3/__init__.* ${libdir}/python2.6/sqlite3/dump.* "
 
-DESCRIPTION_python-sqlite3-tests="Python Sqlite3 Database Support Tests"
-RDEPENDS_python-sqlite3-tests="python-core python-sqlite3"
-FILES_python-sqlite3-tests="${libdir}/python2.6/sqlite3/test "
+DESCRIPTION_${PN}-sqlite3-tests="Python Sqlite3 Database Support Tests"
+RDEPENDS_${PN}-sqlite3-tests="${PN}-core ${PN}-sqlite3"
+FILES_${PN}-sqlite3-tests="${libdir}/python2.6/sqlite3/test "
 
-DESCRIPTION_python-stringold="Python String APIs [deprecated]"
-RDEPENDS_python-stringold="python-core python-re"
-FILES_python-stringold="${libdir}/python2.6/lib-dynload/strop.so ${libdir}/python2.6/string.* "
+DESCRIPTION_${PN}-stringold="Python String APIs [deprecated]"
+RDEPENDS_${PN}-stringold="${PN}-core ${PN}-re"
+FILES_${PN}-stringold="${libdir}/python2.6/lib-dynload/strop.so ${libdir}/python2.6/string.* "
 
-DESCRIPTION_python-subprocess="Python Subprocess Support"
-RDEPENDS_python-subprocess="python-core python-io python-re python-fcntl python-pickle"
-FILES_python-subprocess="${libdir}/python2.6/subprocess.* "
+DESCRIPTION_${PN}-subprocess="Python Subprocess Support"
+RDEPENDS_${PN}-subprocess="${PN}-core ${PN}-io ${PN}-re ${PN}-fcntl ${PN}-pickle"
+FILES_${PN}-subprocess="${libdir}/python2.6/subprocess.* "
 
-DESCRIPTION_python-syslog="Python Syslog Interface"
-RDEPENDS_python-syslog="python-core"
-FILES_python-syslog="${libdir}/python2.6/lib-dynload/syslog.so "
+DESCRIPTION_${PN}-syslog="Python Syslog Interface"
+RDEPENDS_${PN}-syslog="${PN}-core"
+FILES_${PN}-syslog="${libdir}/python2.6/lib-dynload/syslog.so "
 
-DESCRIPTION_python-terminal="Python Terminal Controlling Support"
-RDEPENDS_python-terminal="python-core python-io"
-FILES_python-terminal="${libdir}/python2.6/pty.* ${libdir}/python2.6/tty.* "
+DESCRIPTION_${PN}-terminal="Python Terminal Controlling Support"
+RDEPENDS_${PN}-terminal="${PN}-core ${PN}-io"
+FILES_${PN}-terminal="${libdir}/python2.6/pty.* ${libdir}/python2.6/tty.* "
 
-DESCRIPTION_python-tests="Python Tests"
-RDEPENDS_python-tests="python-core"
-FILES_python-tests="${libdir}/python2.6/test "
+DESCRIPTION_${PN}-tests="Python Tests"
+RDEPENDS_${PN}-tests="${PN}-core"
+FILES_${PN}-tests="${libdir}/python2.6/test "
 
-DESCRIPTION_python-textutils="Python Option Parsing, Text Wrapping and Comma-Separated-Value Support"
-RDEPENDS_python-textutils="python-core python-io python-re python-stringold"
-FILES_python-textutils="${libdir}/python2.6/lib-dynload/_csv.so ${libdir}/python2.6/csv.* ${libdir}/python2.6/optparse.* ${libdir}/python2.6/textwrap.* "
+DESCRIPTION_${PN}-textutils="Python Option Parsing, Text Wrapping and Comma-Separated-Value Support"
+RDEPENDS_${PN}-textutils="${PN}-core ${PN}-io ${PN}-re ${PN}-stringold"
+FILES_${PN}-textutils="${libdir}/python2.6/lib-dynload/_csv.so ${libdir}/python2.6/csv.* ${libdir}/python2.6/optparse.* ${libdir}/python2.6/textwrap.* "
 
-DESCRIPTION_python-threading="Python Threading & Synchronization Support"
-RDEPENDS_python-threading="python-core python-lang"
-FILES_python-threading="${libdir}/python2.6/_threading_local.* ${libdir}/python2.6/dummy_thread.* ${libdir}/python2.6/dummy_threading.* ${libdir}/python2.6/mutex.* ${libdir}/python2.6/threading.* ${libdir}/python2.6/Queue.* "
+DESCRIPTION_${PN}-threading="Python Threading & Synchronization Support"
+RDEPENDS_${PN}-threading="${PN}-core ${PN}-lang"
+FILES_${PN}-threading="${libdir}/python2.6/_threading_local.* ${libdir}/python2.6/dummy_thread.* ${libdir}/python2.6/dummy_threading.* ${libdir}/python2.6/mutex.* ${libdir}/python2.6/threading.* ${libdir}/python2.6/Queue.* "
 
-DESCRIPTION_python-tkinter="Python Tcl/Tk Bindings"
-RDEPENDS_python-tkinter="python-core"
-FILES_python-tkinter="${libdir}/python2.6/lib-dynload/_tkinter.so ${libdir}/python2.6/lib-tk "
+DESCRIPTION_${PN}-tkinter="Python Tcl/Tk Bindings"
+RDEPENDS_${PN}-tkinter="${PN}-core"
+FILES_${PN}-tkinter="${libdir}/python2.6/lib-dynload/_tkinter.so ${libdir}/python2.6/lib-tk "
 
-DESCRIPTION_python-unittest="Python Unit Testing Framework"
-RDEPENDS_python-unittest="python-core python-stringold python-lang"
-FILES_python-unittest="${libdir}/python2.6/unittest.* "
+DESCRIPTION_${PN}-unittest="Python Unit Testing Framework"
+RDEPENDS_${PN}-unittest="${PN}-core ${PN}-stringold ${PN}-lang"
+FILES_${PN}-unittest="${libdir}/python2.6/unittest.* "
 
-DESCRIPTION_python-unixadmin="Python Unix Administration Support"
-RDEPENDS_python-unixadmin="python-core"
-FILES_python-unixadmin="${libdir}/python2.6/lib-dynload/nis.so ${libdir}/python2.6/lib-dynload/grp.so ${libdir}/python2.6/lib-dynload/pwd.so ${libdir}/python2.6/getpass.* "
+DESCRIPTION_${PN}-unixadmin="Python Unix Administration Support"
+RDEPENDS_${PN}-unixadmin="${PN}-core"
+FILES_${PN}-unixadmin="${libdir}/python2.6/lib-dynload/nis.so ${libdir}/python2.6/lib-dynload/grp.so ${libdir}/python2.6/lib-dynload/pwd.so ${libdir}/python2.6/getpass.* "
 
-DESCRIPTION_python-xml="Python basic XML support."
-RDEPENDS_python-xml="python-core python-re"
-FILES_python-xml="${libdir}/python2.6/lib-dynload/pyexpat.so ${libdir}/python2.6/xml ${libdir}/python2.6/xmllib.* "
+DESCRIPTION_${PN}-xml="Python basic XML support."
+RDEPENDS_${PN}-xml="${PN}-core ${PN}-re"
+FILES_${PN}-xml="${libdir}/python2.6/lib-dynload/pyexpat.so ${libdir}/python2.6/xml ${libdir}/python2.6/xmllib.* "
 
-DESCRIPTION_python-xmlrpc="Python XMLRPC Support"
-RDEPENDS_python-xmlrpc="python-core python-xml python-netserver python-lang"
-FILES_python-xmlrpc="${libdir}/python2.6/xmlrpclib.* ${libdir}/python2.6/SimpleXMLRPCServer.* "
+DESCRIPTION_${PN}-xmlrpc="Python XMLRPC Support"
+RDEPENDS_${PN}-xmlrpc="${PN}-core ${PN}-xml ${PN}-netserver ${PN}-lang"
+FILES_${PN}-xmlrpc="${libdir}/python2.6/xmlrpclib.* ${libdir}/python2.6/SimpleXMLRPCServer.* "
 
-DESCRIPTION_python-zlib="Python zlib Support."
-RDEPENDS_python-zlib="python-core"
-FILES_python-zlib="${libdir}/python2.6/lib-dynload/zlib.so "
+DESCRIPTION_${PN}-zlib="Python zlib Support."
+RDEPENDS_${PN}-zlib="${PN}-core"
+FILES_${PN}-zlib="${libdir}/python2.6/lib-dynload/zlib.so "
 
-DESCRIPTION_python-modules="All Python modules"
-RDEPENDS_python-modules="python-audio python-bsddb python-codecs python-compile python-compiler python-compression python-core python-crypt python-ctypes python-curses python-datetime python-db python-debugger python-difflib python-distutils python-doctest python-elementtree python-email python-fcntl python-gdbm python-hotshot python-html python-idle python-image python-io python-json python-lang python-logging python-mailbox python-math python-mime python-mmap python-multiprocessing python-netclient python-netserver python-numbers python-pickle python-pkgutil python-pprint python-profile python-pydoc python-re python-readline python-resource python-robotparser python-shell python-smtpd python-sqlite3 python-sqlite3-tests python-stringold python-subprocess python-syslog python-terminal python-tests python-textutils python-threading python-tkinter python-unittest python-unixadmin python-xml python-xmlrpc python-zlib  "
-ALLOW_EMPTY_python-modules = "1"
+DESCRIPTION_${PN}-modules="All Python modules"
+RDEPENDS_${PN}-modules="${PN}-audio ${PN}-bsddb ${PN}-codecs ${PN}-compile ${PN}-compiler ${PN}-compression ${PN}-core ${PN}-crypt ${PN}-ctypes ${PN}-curses ${PN}-datetime ${PN}-db ${PN}-debugger ${PN}-difflib ${PN}-distutils ${PN}-doctest ${PN}-elementtree ${PN}-email ${PN}-fcntl ${PN}-gdbm ${PN}-hotshot ${PN}-html ${PN}-idle ${PN}-image ${PN}-io ${PN}-json ${PN}-lang ${PN}-logging ${PN}-mailbox ${PN}-math ${PN}-mime ${PN}-mmap ${PN}-multiprocessing ${PN}-netclient ${PN}-netserver ${PN}-numbers ${PN}-pickle ${PN}-pkgutil ${PN}-pprint ${PN}-profile ${PN}-pydoc ${PN}-re ${PN}-readline ${PN}-resource ${PN}-robotparser ${PN}-shell ${PN}-smtpd ${PN}-sqlite3 ${PN}-sqlite3-tests ${PN}-stringold ${PN}-subprocess ${PN}-syslog ${PN}-terminal ${PN}-tests ${PN}-textutils ${PN}-threading ${PN}-tkinter ${PN}-unittest ${PN}-unixadmin ${PN}-xml ${PN}-xmlrpc ${PN}-zlib  "
+ALLOW_EMPTY_${PN}-modules = "1"
 
 
-- 
1.7.4.1



