Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <johan.hovold@lundinova.se>) id 1NLHqy-0005An-CD
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Dec 2009 16:01:23 +0100
Received: from pi (unknown [10.240.22.2])
	by mailhost.lundinova.se (Postfix) with ESMTP id 8E37FB94009;
	Thu, 17 Dec 2009 15:59:32 +0100 (CET)
Received: from johan by pi with local (Exim 4.69) (envelope-from <johan@pi>)
	id 1NLHpE-0004sr-4S; Thu, 17 Dec 2009 15:59:32 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Dec 2009 15:59:30 +0100
Message-Id: <1261061970-18736-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.6.5.6
Sender: <johan.hovold@lundinova.se>
X-SA-Exim-Connect-IP: 92.33.14.100
X-SA-Exim-Mail-From: johan.hovold@lundinova.se
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] wxsqlite3: add wxsqlite3 (1.9.7)
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
X-List-Received-Date: Thu, 17 Dec 2009 15:01:23 -0000

Fix linker failure due to gcc inline issue (gcc-inline.patch).
Fix broken unicode builds (wxtranslate.patch).

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---
 conf/checksums.ini                                 |    4 +++
 recipes/wxsqlite3/wxsqlite3-1.9.7/gcc-inline.patch |   29 ++++++++++++++++++++
 .../wxsqlite3/wxsqlite3-1.9.7/wxtranslate.patch    |   11 +++++++
 recipes/wxsqlite3/wxsqlite3_1.9.7.bb               |   23 +++++++++++++++
 4 files changed, 67 insertions(+), 0 deletions(-)
 create mode 100644 recipes/wxsqlite3/wxsqlite3-1.9.7/gcc-inline.patch
 create mode 100644 recipes/wxsqlite3/wxsqlite3-1.9.7/wxtranslate.patch
 create mode 100644 recipes/wxsqlite3/wxsqlite3_1.9.7.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 10ce619..211965b 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -27390,6 +27390,10 @@ sha256=9b4096bb1e273914adf101182c27d457f46fcc44d1b3ea027bae3d34ace8c6f7
 md5=3ad40ea2b1728eefa94f60beb9951ff7
 sha256=9b4096bb1e273914adf101182c27d457f46fcc44d1b3ea027bae3d34ace8c6f7
 
+[http://downloads.sourceforge.net/wxcode/wxsqlite3-1.9.7.tar.gz]
+md5=2e1bec387bbdf50c632649d041b32a4a
+sha256=eaee8290c1f386413f5cb1e1af9ec4e7573c1dcce2760d79f4276497a75c4f64
+
 [http://xorg.freedesktop.org/releases/individual/app/x11perf-1.4.1.tar.bz2]
 md5=fd06c8b8e3572a0e14af65a49e0dd7d1
 sha256=c81819618ec596fda55b950ef80f2ee02e5ce149ea99f1f741cedb459b4d3064
diff --git a/recipes/wxsqlite3/wxsqlite3-1.9.7/gcc-inline.patch b/recipes/wxsqlite3/wxsqlite3-1.9.7/gcc-inline.patch
new file mode 100644
index 0000000..10338ad
--- /dev/null
+++ b/recipes/wxsqlite3/wxsqlite3-1.9.7/gcc-inline.patch
@@ -0,0 +1,29 @@
+diff -pru wxsqlite3-1.9.7.orig/include/wx/wxsqlite3.h wxsqlite3-1.9.7/include/wx/wxsqlite3.h
+--- wxsqlite3-1.9.7.orig/include/wx/wxsqlite3.h	2009-11-09 20:59:38.000000000 +0100
++++ wxsqlite3-1.9.7/include/wx/wxsqlite3.h	2009-12-06 17:19:58.000000000 +0100
+@@ -94,7 +94,7 @@ public:
+   int GetExtendedErrorCode() const { return m_errorCode; }
+ 
+   /// Get error message associated with the exception
+-  const wxString GetMessage() const { return m_errorMessage; }
++  const wxString GetMessage() const;
+ 
+   /// Convert error code to error message
+   static const wxString ErrorCodeAsString(int errorCode);
+Only in wxsqlite3-1.9.7: patches
+diff -pru wxsqlite3-1.9.7.orig/src/wxsqlite3.cpp wxsqlite3-1.9.7/src/wxsqlite3.cpp
+--- wxsqlite3-1.9.7.orig/src/wxsqlite3.cpp	2009-11-09 20:59:38.000000000 +0100
++++ wxsqlite3-1.9.7/src/wxsqlite3.cpp	2009-12-06 17:58:01.000000000 +0100
+@@ -263,6 +263,11 @@ wxSQLite3Exception::~wxSQLite3Exception(
+ {
+ }
+ 
++const wxString wxSQLite3Exception::GetMessage() const
++{
++	return m_errorMessage;
++}
++
+ // ----------------------------------------------------------------------------
+ // wxSQLite3StatementBuffer: class providing a statement buffer
+ //                           for use with the SQLite3 vmprintf function
+Only in wxsqlite3-1.9.7/src: .wxsqlite3.cpp.swp
diff --git a/recipes/wxsqlite3/wxsqlite3-1.9.7/wxtranslate.patch b/recipes/wxsqlite3/wxsqlite3-1.9.7/wxtranslate.patch
new file mode 100644
index 0000000..b40511c
--- /dev/null
+++ b/recipes/wxsqlite3/wxsqlite3-1.9.7/wxtranslate.patch
@@ -0,0 +1,11 @@
+--- wxsqlite3-1.9.7.orig/src/wxsqlite3.cpp	2009-11-09 20:59:38.000000000 +0100
++++ wxsqlite3-1.9.7/src/wxsqlite3.cpp	2009-12-06 17:58:35.000000000 +0100
+@@ -94,6 +94,8 @@ static void InitSQLite3DLL()
+ 
+ // Error messages
+ 
++#undef wxTRANSLATE
++#define wxTRANSLATE wxT
+ const wxChar* wxERRMSG_NODB          = wxTRANSLATE("No Database opened");
+ const wxChar* wxERRMSG_NOSTMT        = wxTRANSLATE("Statement not accessible");
+ const wxChar* wxERRMSG_NOMEM         = wxTRANSLATE("Out of memory");
diff --git a/recipes/wxsqlite3/wxsqlite3_1.9.7.bb b/recipes/wxsqlite3/wxsqlite3_1.9.7.bb
new file mode 100644
index 0000000..a848393
--- /dev/null
+++ b/recipes/wxsqlite3/wxsqlite3_1.9.7.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "A wxWindows wrapper for the sqlite database."
+HOMEPAGE = "http://wxcode.sourceforge.net/components/wxsqlite3"
+SECTION = "libs"
+LICENSE = "wxWindows"
+DEPENDS = "sqlite3 wxwidgets"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/wxcode/wxsqlite3-${PV}.tar.gz \
+	file://gcc-inline.patch;patch=1 \
+	file://wxtranslate.patch;patch=1 \
+	"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-sqlite3-prefix=${STAGING_LIBDIR}"
+
+do_install() {
+	oe_runmake 'DESTDIR=${D}' install
+	newincludedir=${D}/${includedir}/wx-$(wx-config --release)
+	mkdir "$newincludedir"
+	mv ${D}/${includedir}/wx "$newincludedir"
+}
-- 
1.6.5.6



