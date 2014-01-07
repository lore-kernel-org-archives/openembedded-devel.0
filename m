Return-Path: <nick.lewis@usa.g4s.com>
Received: from mail1.bemta14.messagelabs.com (mail1.bemta14.messagelabs.com
	[193.109.254.112])
	by mail.openembedded.org (Postfix) with ESMTP id 57FF76BE7A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 10:29:33 +0000 (UTC)
Received: from [85.158.140.195:44528] by server-8.bemta-14.messagelabs.com id
	C8/B7-30921-907DBC25; Tue, 07 Jan 2014 10:29:29 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-16.tower-193.messagelabs.com!1389090568!13735469!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.9.16; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19888 invoked from network); 7 Jan 2014 10:29:28 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s038.Technology.local)
	(89.206.228.155)
	by server-16.tower-193.messagelabs.com with RC4-SHA encrypted SMTP;
	7 Jan 2014 10:29:28 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s038.Technology.local ([10.234.1.40]) with mapi; Tue, 7 Jan 2014
	10:29:28 +0000
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Date: Tue, 7 Jan 2014 10:29:28 +0000
Thread-Topic: [oe] Patch to fix libxml++ build failure in meta-oe
Thread-Index: Ac8K9fplYt7QYmMqTDaR6cxOxnVidwAk/6HQAAJSSdA=
Message-ID: <AAE0766F5AF36B46BAB7E0EFB9273206331489E795@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Patch to fix libxml++ build failure in meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jan 2014 10:29:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From c77c6adf075f314209f7cd071fb5b99c0d8d0e70 Mon Sep 17 00:00:00 2001
From: Nick Lewis <nick.lewis@usa.g4s.com>
Date: Mon, 6 Jan 2014 17:16:03 +0000
Subject: [PATCH] Use libxml++ version 2.37.1 and add ptest support

---
 .../libxml/libxml++-2.37.1/libxml++_ptest.patch    |   73 ++++++++++++++++=
++++
 .../recipes-core/libxml/libxml++-2.37.1/run-ptest  |    3 +
 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb     |   22 ------
 meta-oe/recipes-core/libxml/libxml++_2.37.1.bb     |   34 +++++++++
 4 files changed, 110 insertions(+), 22 deletions(-)  create mode 100644 me=
ta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
 create mode 100644 meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest
 delete mode 100644 meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
 create mode 100644 meta-oe/recipes-core/libxml/libxml++_2.37.1.bb

diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.pat=
ch b/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
new file mode 100644
index 0000000..a18822f
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++-2.37.1/libxml++_ptest.patch
@@ -0,0 +1,73 @@
+diff --git a/Makefile.am b/Makefile.am
+index d4aadb1..0e36756 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -253,5 +253,8 @@ post-html: docs/index.html
+       rsync $(rsync_args) -r docs/index.html $$USER,libxmlplusplus@web.so=
urceforge.net:$(web_path_project)
+       rsync $(rsync_args) -r examples
+$$USER,libxmlplusplus@web.sourceforge.net:$(web_path_project)
+
++install-ptest:
++      make -C examples install-ptest
++
+ # Optional: auto-generate the ChangeLog file from the git log on make
+dist  include $(top_srcdir)/macros/dist-changelog.am
+diff --git a/examples/Makefile.am b/examples/Makefile.am index
+d9541ca..c28b49c 100644
+--- a/examples/Makefile.am
++++ b/examples/Makefile.am
+@@ -36,6 +36,23 @@ check_PROGRAMS =3D \
+   schemavalidation/schemavalidation \
+   textreader/textreader
+
++check_DOTLIBS =3D \
++  dom_build/.libs/dom_build \
++  dom_parse_entities/.libs/dom_parse_entities \
++  dom_parser/.libs/dom_parser \
++  dom_parser_raw/.libs/dom_parser_raw \
++  dom_read_write/.libs/dom_read_write \
++  dom_xinclude/.libs/dom_xinclude \
++  dom_xpath/.libs/dom_xpath \
++  dtdvalidation/.libs/dtdvalidation \
++  import_node/.libs/import_node \
++  sax_exception/.libs/sax_exception \
++  sax_parser/.libs/sax_parser \
++  sax_parser_build_dom/.libs/sax_parser_build_dom \
++  sax_parser_entities/.libs/sax_parser_entities \
++  schemavalidation/.libs/schemavalidation \
++  textreader/.libs/textreader
++
+ # Shell scripts that call the example programs.
+ check_SCRIPTS =3D \
+   dom_build/make_check.sh \
+@@ -147,10 +164,10 @@ dist_noinst_DATA =3D \  # file are located in
+different directories.
+ dom_read_write/make_check.sh: Makefile
+       echo '# Generated and used by "make check"' >$@
+-      echo 'dom_read_write/dom_read_write "$(srcdir)/dom_read_write/examp=
le.xml" dom_read_write/example_output.xml >/dev/null' >>$@
++      echo 'dom_read_write/.libs/dom_read_write
++"$(srcdir)/dom_read_write/example.xml"
++dom_read_write/example_output.xml >/dev/null' >>$@
+       chmod +x $@
+
+-script_template =3D cd "$(srcdir)/<!progname!>" &&
+"$(abs_builddir)/<!progname!>/<!progname!>" >/dev/null
++script_template =3D cd "$(srcdir)/<!progname!>" && ".libs/<!progname!>"
++>/dev/null
+ standard_scripts =3D $(filter-out
+ dom_read_write/make_check.sh,$(check_SCRIPTS))
+
+ # All other script files are generated like so:
+@@ -162,3 +179,18 @@ $(standard_scripts): Makefile  CLEANFILES =3D \
+   dom_read_write/example_output.xml \
+   $(check_SCRIPTS)
++
++buildtest: all
++      $(MAKE) $(AM_MAKEFLAGS) $(check_PROGRAMS) $(check_SCRIPTS)
++      $(MAKE) $(AM_MAKEFLAGS) buildtest-TESTS
++
++install-ptest:
++      $(MKDIR_P) $(DESTDIR)/examples
++      cp --parents $(check_DOTLIBS) $(DESTDIR)/examples
++      cp --parents $(check_SCRIPTS) $(DESTDIR)/examples
++      cp --parents $(dist_noinst_DATA) $(DESTDIR)/examples
++      cp Makefile $(DESTDIR)/examples
++      $(MKDIR_P) $(DESTDIR)/macros
++      cp ../macros/test-driver $(DESTDIR)/macros
++      sed -i -e 's|^Makefile:|_Makefile:|' $(DESTDIR)/examples/Makefile
++
diff --git a/meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest b/meta-o=
e/recipes-core/libxml/libxml++-2.37.1/run-ptest
new file mode 100644
index 0000000..236f667
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++-2.37.1/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+cd examples
+make -k check-TESTS
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb b/meta-oe/recip=
es-core/libxml/libxml++_2.35.3.bb
deleted file mode 100644
index fb9cdd9..0000000
--- a/meta-oe/recipes-core/libxml/libxml++_2.35.3.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-SUMMARY =3D "C++ wrapper for libxml library"
-DESCRIPTION =3D "C++ wrapper for libxml library"
-HOMEPAGE =3D "http://libxmlplusplus.sourceforge.net"
-BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml%2B%=
2B"
-SECTION =3D "libs"
-LICENSE =3D "GPLv2"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e3=
4 "
-
-PR =3D "r1"
-
-SHRT_VER =3D "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True)=
.split('.')[1]}"
-SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
-
-SRC_URI[md5sum] =3D "196a2dcdc84ab987fe3852b3f29cafd7"
-SRC_URI[sha256sum] =3D "715a4214bbff90365cc8406a28e427febd90461006d608fbdc=
dcea7fc9891eaf"
-
-DEPENDS =3D "libxml2 glibmm"
-
-inherit autotools pkgconfig
-
-FILES_${PN}-doc +=3D "${datadir}/devhelp"
-FILES_${PN}-dev +=3D "${libdir}/libxml++-2.6/include/libxml++config.h"
diff --git a/meta-oe/recipes-core/libxml/libxml++_2.37.1.bb b/meta-oe/recip=
es-core/libxml/libxml++_2.37.1.bb
new file mode 100644
index 0000000..604877d
--- /dev/null
+++ b/meta-oe/recipes-core/libxml/libxml++_2.37.1.bb
@@ -0,0 +1,34 @@
+SUMMARY =3D "C++ wrapper for libxml library"
+DESCRIPTION =3D "C++ wrapper for libxml library"
+HOMEPAGE =3D "http://libxmlplusplus.sourceforge.net"
+BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml%2B%=
2B"
+SECTION =3D "libs"
+LICENSE =3D "GPLv2"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7fbc338309ac38fefcd64b04bb903e3=
4 "
+
+PR =3D "r0"
+
+SHRT_VER =3D "${@d.getVar('PV',True).split('.')[0]}.${@d.getVar('PV',True)=
.split('.')[1]}"
+SRC_URI =3D "${GNOME_MIRROR}/${BPN}/${SHRT_VER}/${BP}.tar.xz"
+
+SRC_URI[md5sum] =3D "2f9372a6eba6e40206c11f558a8fbc32"
+SRC_URI[sha256sum] =3D "f3b183600532a92af355719210223f858857092b8b1531c790=
7155c59a6db39f"
+
+DEPENDS =3D "libxml2 glibmm"
+
+inherit autotools pkgconfig
+
+FILES_${PN}-doc +=3D "${datadir}/devhelp"
+FILES_${PN}-dev +=3D "${libdir}/libxml++-2.6/include/libxml++config.h"
+
+SRC_URI +=3D "file://libxml++_ptest.patch \
+            file://run-ptest"
+
+inherit ptest
+
+RDEPENDS_${PN}-ptest +=3D "make"
+
+do_compile_ptest() {
+  oe_runmake -C examples buildtest
+}
+
--
1.7.9.5


The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

