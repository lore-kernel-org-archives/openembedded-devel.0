Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jekhor@gmail.com>) id 1Rq1Sn-0005jn-4h
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jan 2012 12:56:29 +0100
Received: by bkaq10 with SMTP id q10so4097098bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 03:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=3BwM+n/OdvLVHTqx3ehYudl2LNow7lX4xQMfjtDuTGA=;
	b=JA69asqtYnVCv8qOMqvOAMdXGeH8sl0SxCCBJTrZQprrmNj75oJau6k9X8gzzv22Jz
	3HlPN28wzMpfnpIKgYSaAHR0a9Itj4hHrjXaPrkWCo47vjp6Nxcjppwxxzmae1szvHpE
	UHoxuCKqqxR7BZqbJcoGkTXo1td+Ye252hZYE=
Received: by 10.204.154.140 with SMTP id o12mr6816192bkw.102.1327488984749;
	Wed, 25 Jan 2012 02:56:24 -0800 (PST)
Received: from localhost.localdomain (mx2.promwad.com. [195.222.87.218])
	by mx.google.com with ESMTPS id ev5sm123319bkb.4.2012.01.25.02.56.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 02:56:23 -0800 (PST)
Sender: Yauhen Kharuzhy <jekhor@gmail.com>
Received: from jek by localhost.localdomain with local (Exim 4.77)
	(envelope-from <jek@jeknote.loshitsa1.net>)
	id 1Rq0Wa-0007MU-T7; Wed, 25 Jan 2012 13:56:20 +0300
From: Yauhen Kharuzhy <yauhen.kharuzhy@promwad.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 25 Jan 2012 13:56:20 +0300
Message-Id: <1327488980-28269-1-git-send-email-yauhen.kharuzhy@promwad.com>
X-Mailer: git-send-email 1.7.8.3
Cc: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
Subject: [PATCH 07/10] Add recipe for postgresql 9.0.2
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
X-List-Received-Date: Wed, 25 Jan 2012 11:56:29 -0000

From: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>

Recipe for this package has been taken from Openembedded-classic project.

Signed-off-by: Vladimir Redzhepoff <vladimir.redzhepoff@promwad.com>
---
 .../postgresql/files/no-ecpg-test.patch            |   12 ++++
 .../remove.autoconf.version.check.patch            |   13 ++++
 meta/recipes-support/postgresql/postgresql.inc     |   69 ++++++++++++++++++++
 .../recipes-support/postgresql/postgresql_9.0.2.bb |    8 ++
 4 files changed, 102 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-support/postgresql/files/no-ecpg-test.patch
 create mode 100644 meta/recipes-support/postgresql/postgresql-9.0.2/remove.autoconf.version.check.patch
 create mode 100644 meta/recipes-support/postgresql/postgresql.inc
 create mode 100644 meta/recipes-support/postgresql/postgresql_9.0.2.bb

diff --git a/meta/recipes-support/postgresql/files/no-ecpg-test.patch b/meta/recipes-support/postgresql/files/no-ecpg-test.patch
new file mode 100644
index 0000000..c0f28f4
--- /dev/null
+++ b/meta/recipes-support/postgresql/files/no-ecpg-test.patch
@@ -0,0 +1,12 @@
+diff --git a/src/interfaces/ecpg/Makefile b/src/interfaces/ecpg/Makefile
+index dcd578f..1428423 100644
+--- a/src/interfaces/ecpg/Makefile
++++ b/src/interfaces/ecpg/Makefile
+@@ -8,7 +8,6 @@ all install installdirs uninstall dep depend distprep:
+ 	$(MAKE) -C ecpglib $@
+ 	$(MAKE) -C compatlib $@
+ 	$(MAKE) -C preproc $@
+-	$(MAKE) -C test $@
+ 
+ clean distclean maintainer-clean:
+ 	-$(MAKE) -C include $@
diff --git a/meta/recipes-support/postgresql/postgresql-9.0.2/remove.autoconf.version.check.patch b/meta/recipes-support/postgresql/postgresql-9.0.2/remove.autoconf.version.check.patch
new file mode 100644
index 0000000..70985d1
--- /dev/null
+++ b/meta/recipes-support/postgresql/postgresql-9.0.2/remove.autoconf.version.check.patch
@@ -0,0 +1,13 @@
+--- postgresql-9.0.2.orig/configure.in	2011-12-10 10:40:41.954161101 +0100
++++ postgresql-9.0.2/configure.in	2011-12-10 10:41:52.203851668 +0100
+@@ -19,10 +19,6 @@
+ 
+ AC_INIT([PostgreSQL], [9.0.2], [pgsql-bugs@postgresql.org])
+ 
+-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.63], [], [m4_fatal([Autoconf version 2.63 is required.
+-Untested combinations of 'autoconf' and PostgreSQL versions are not
+-recommended.  You can remove the check from 'configure.in' but it is then
+-your responsibility whether the result works or not.])])
+ AC_COPYRIGHT([Copyright (c) 1996-2010, PostgreSQL Global Development Group])
+ AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
+ AC_CONFIG_AUX_DIR(config)
diff --git a/meta/recipes-support/postgresql/postgresql.inc b/meta/recipes-support/postgresql/postgresql.inc
new file mode 100644
index 0000000..17c552f
--- /dev/null
+++ b/meta/recipes-support/postgresql/postgresql.inc
@@ -0,0 +1,69 @@
+DESCRIPTION = "PostgreSQL is a powerful, open source relational database system."
+HOMEPAGE = "http://www.postgresql.com"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=7c1fe1ba5f31ccabfa4f6508eee09dc0"
+DEPENDS = "zlib readline tzcode-native"
+INC_PR = "r6"
+
+ARM_INSTRUCTION_SET = "arm"
+
+#WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
+
+SRC_URI = "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
+
+LEAD_SONAME = "libpq.so"
+
+# LDFLAGS for shared libraries
+export LDFLAGS_SL = "${LDFLAGS}"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF_sh4 = "--disable-spinlocks"
+
+do_compile_append() {
+         cp /usr/sbin/zic ${S}/src/timezone/
+}
+
+PACKAGES =+ "${PN}-client ${PN}-server-dev ${PN}-timezone \
+             libecpg-compat-dbg libecpg-compat \
+             libecpg-dbg libecpg libecpg-dev \
+             libpq-dbg libpq libpq-dev \ 
+             libpgtypes-dbg libpgtypes "
+
+FILES_${PN}-client = "${bindir}/clusterdb \
+                ${bindir}/createdb \
+                ${bindir}/createlang \
+                ${bindir}/createuser \
+                ${bindir}/dropdb \
+                ${bindir}/droplang \
+                ${bindir}/dropuser \
+                ${bindir}/pg_dump \
+                ${bindir}/pg_dumpall \
+                ${bindir}/pg_restore \
+                ${bindir}/psql \
+                ${bindir}/reindexdb \
+                ${bindir}/vacuumdb \
+                ${bindir}/vacuumlo \
+                ${datadir}/${PN}/psqlrc.sample"
+
+FILES_${PN}-doc += "${prefix}/doc/"
+FILES_${PN}-timezone = "${datadir}/${PN}/timezone"
+FILES_${PN}-server-dev = "${includedir}/${PN}/server"
+
+FILES_libecpg = "${libdir}/libecpg*.so.*"
+FILES_libecpg-dbg = "${libdir}/.debug/libecpg*"
+FILES_libecpg-dev = "${libdir}/libecpg*.a ${libdir}/libecpg*.so \
+                     ${libdir}/libpgtypes*.a ${libdir}/libpgtypes*.so \
+                     ${includedir}/ecpg*.h ${includedir}/${PN}/ecpg*.h \
+                     ${includedir}/pgtypes*.h ${includedir}/${PN}/informix \
+                     ${includedir}/sql3types.h ${includedir}/sqlca.h"
+
+FILES_libpq = "${libdir}/libpq*.so.*"
+FILES_libpq-dbg = "${libdir}/.debug/libpq* ${libdir}/${PN}/pgxs/src/test/regress/.debug/*"
+FILES_libpq-dev = "${libdir}/libpq*.a ${libdir}/libpq*.so ${libdir}/libpgport.a \
+                   ${includedir}"
+
+FILES_libecpg-compat = "${libdir}/libecpg_compat*.so.*"
+FILES_libecpg-compat-dbg = "${libdir}/.debug/libecpg_compat*"
+FILES_libpgtypes = "${libdir}/libpgtypes*.so.*"
+FILES_libpgtypes-dbg = "${libdir}/.debug/libpgtypes*"
diff --git a/meta/recipes-support/postgresql/postgresql_9.0.2.bb b/meta/recipes-support/postgresql/postgresql_9.0.2.bb
new file mode 100644
index 0000000..814dc72
--- /dev/null
+++ b/meta/recipes-support/postgresql/postgresql_9.0.2.bb
@@ -0,0 +1,8 @@
+require postgresql.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://remove.autoconf.version.check.patch"
+
+SRC_URI[md5sum] = "fc79ef32b602f75f2ccd37647bc008e9"
+SRC_URI[sha256sum] = "ffb58195850aa0ec9b7b3dcdac51a6dee0c76ea3387b76c805e1c4d186fe2af5"
-- 
1.7.6.4



