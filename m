Received: from smtp-dist-02.services.comms.unsw.edu.au ([149.171.97.17]
	helo=smtp-dist.unsw.edu.au) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jayen@tigger.cse.unsw.EDU.AU>) id 1P5YHb-0005VZ-Ux
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 08:24:22 +0200
Received: from INFPACM003.services.comms.unsw.edu.au
	(INFPACM003.services.comms.unsw.edu.au [149.171.193.26])
	by smtp-dist.unsw.edu.au (8.13.6/8.13.6) with ESMTP id o9C4egoX016482
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 15:40:58 +1100 (EST)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AvsEAPeDs0yBXqz5/2dsb2JhbAChUHGwIQGGNYhmhUgE
X-IronPort-AV: E=Sophos;i="4.57,318,1283695200"; d="scan'208";a="86372152"
Received: from tigger.cse.unsw.edu.au ([129.94.172.249])
	by INFPACM003.services.comms.unsw.edu.au with ESMTP;
	12 Oct 2010 15:24:23 +1100
Received: by tigger.cse.unsw.EDU.AU (Postfix, from userid 1000)
	id F2007174D8A; Tue, 12 Oct 2010 15:40:41 +1100 (EST)
From: Jayen Ashar <jayen@cse.unsw.edu.au>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Oct 2010 15:40:22 +1100
Message-Id: <1286858423-12602-1-git-send-email-jayen@cse.unsw.edu.au>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <AANLkTikS4goX8mvN7di19uN6dZccGN2csxKgYMwcutPj@mail.gmail.com>
References: <AANLkTikS4goX8mvN7di19uN6dZccGN2csxKgYMwcutPj@mail.gmail.com>
X-SA-Exim-Connect-IP: 149.171.97.17
X-SA-Exim-Mail-From: jayen@tigger.cse.unsw.EDU.AU
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_NEUTRAL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Jayen Ashar <jayen@cse.unsw.edu.au>
Subject: [PATCH v2 1/2] SWI-Prolog: New program
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
X-List-Received-Date: Tue, 12 Oct 2010 06:24:22 -0000

* Starting with SWI-Prolog 5.10.1
* SWI-Prolog is a fast and powerful ISO/Edinburgh-style Prolog compiler with a
*  rich set of built-in predicates. It offers a fast, robust and small
*  environment which enables substantial applications to be developed with it.

Signed-off-by: Jayen Ashar <jayen@cse.unsw.edu.au>
---
 recipes/swi-prolog/swi-prolog.inc             |   76 +++++++++++++++++++++++++
 recipes/swi-prolog/swi-prolog/configure.patch |   11 ++++
 recipes/swi-prolog/swi-prolog_5.10.1.bb       |    3 +
 3 files changed, 90 insertions(+), 0 deletions(-)
 create mode 100644 recipes/swi-prolog/swi-prolog.inc
 create mode 100644 recipes/swi-prolog/swi-prolog/configure.patch
 create mode 100644 recipes/swi-prolog/swi-prolog_5.10.1.bb

diff --git a/recipes/swi-prolog/swi-prolog.inc b/recipes/swi-prolog/swi-prolog.inc
new file mode 100644
index 0000000..772873e
--- /dev/null
+++ b/recipes/swi-prolog/swi-prolog.inc
@@ -0,0 +1,76 @@
+DESCRIPTION = "SWI-Prolog is a fast and powerful ISO/Edinburgh-style Prolog compiler with a rich set of built-in predicates. It offers a fast, robust and small environment which enables substantial applications to be developed with it."
+HOMEPAGE = "http://www.swi-prolog.org/"
+SECTION = "interpreters"
+PRIORITY = "optional"
+LICENSE = "LGPL"
+DEPENDS = "ncurses readline gmp chrpath"
+
+INC_PR = "r1"
+
+SRC_URI = "http://mirror.cse.unsw.edu.au/pub/debian/pool/main/s/${PN}/${PN}_${PV}.orig.tar.gz \
+           file://configure.patch;patch=1"
+
+S = "${WORKDIR}/pl-${PV}"
+
+inherit autotools
+
+#overriden because we don't want to run autoconf on releases
+do_configure() {
+  if [ -e ${S}/configure ]; then
+    oe_runconf $@
+  else
+    oenote "nothing to configure ${S}"
+  fi
+}
+
+#appended so we can run configure and make on the packages directory after 
+#compiling the main enging
+do_compile_append() {
+  if [ -e ${S}/packages/configure ]; then
+  if [ -x ${S}/packages/configure ] ; then
+    cd ${S}/packages
+    export DISABLE_PKGS="xpce http pldoc jpl"
+    cfgcmd="${S}/packages/configure \
+        --build=${BUILD_SYS} \
+        --host=${HOST_SYS} \
+        --target=${TARGET_SYS} \
+        --prefix=${prefix} \
+        --exec_prefix=${exec_prefix} \
+        --bindir=${bindir} \
+        --sbindir=${sbindir} \
+        --libexecdir=${libexecdir} \
+        --datadir=${datadir} \
+        --sysconfdir=${sysconfdir} \
+        --sharedstatedir=${sharedstatedir} \
+        --localstatedir=${localstatedir} \
+        --libdir=${libdir} \
+        --includedir=${includedir} \
+        --oldincludedir=${oldincludedir} \
+        --infodir=${infodir} \
+        --mandir=${mandir} \
+      ${EXTRA_OECONF} \
+        $@"
+    oenote "Running $cfgcmd..."
+    $cfgcmd || oefatal "oe_runconf failed" 
+  else
+    oefatal "no configure script found"
+  fi
+  else
+    oenote "nothing to configure ${S}/packages"
+  fi
+  if [ -e packages/Makefile -o -e packages/makefile ]; then
+    oe_runmake -C packages || die "make failed"
+  else
+    oenote "nothing to compile"
+  fi
+}
+
+#to install the packages
+do_install_append() {
+  oe_runmake -C packages 'DESTDIR=${D}' install
+}
+
+#so debug files aren't included in the main package
+FILES_${PN}-dbg += " ${libdir}/swipl-${PV}/bin/*/.debug ${libdir}/swipl-${PV}/lib/*/.debug"
+#so the main package includes dependent libraries and packages
+FILES_${PN} += " ${libdir}/swipl-${PV}"
diff --git a/recipes/swi-prolog/swi-prolog/configure.patch b/recipes/swi-prolog/swi-prolog/configure.patch
new file mode 100644
index 0000000..58ecd58
--- /dev/null
+++ b/recipes/swi-prolog/swi-prolog/configure.patch
@@ -0,0 +1,11 @@
+--- a/src/configure~    2010-07-21 23:04:23.000000000 +1000
++++ b/src/configure     2010-10-01 14:02:15.000000000 +1000
+@@ -7470,7 +7470,7 @@
+ 
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for pthread support for cpu clocks" >&5
+ $as_echo_n "checking for pthread support for cpu clocks... " >&6; }
+-if test "$cross_compiling" = yes; then :
++if test x"$cross_compiling" = yes; then :
+   { { $as_echo "$as_me:${as_lineno-$LINENO}: error: in \`$ac_pwd':" >&5
+ $as_echo "$as_me: error: in \`$ac_pwd':" >&2;}
+ as_fn_error "cannot run test program while cross compiling
diff --git a/recipes/swi-prolog/swi-prolog_5.10.1.bb b/recipes/swi-prolog/swi-prolog_5.10.1.bb
new file mode 100644
index 0000000..bb7e95b
--- /dev/null
+++ b/recipes/swi-prolog/swi-prolog_5.10.1.bb
@@ -0,0 +1,3 @@
+require swi-prolog.inc
+
+PR = "${INC_PR}.1"
-- 
1.7.0.4



