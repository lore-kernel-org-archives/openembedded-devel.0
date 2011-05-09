Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJW0I-0002rv-KQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 May 2011 21:20:26 +0200
Received: by mail-gy0-f175.google.com with SMTP id 1so2074894gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 May 2011 12:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=7WoVQy5EzjFCY9H5mbq7SvpvIpffx+kK4Dj/RitpNBA=;
	b=Us5ikWb15fpqdL2sVjZ/SScS9+QGlVAkzg8CID6xaSWAF6xzn/ENmqpuJ5fPujCPoC
	EyU8xa2CdofGcrsI++/szisPgHnvj5eeoid7BpWUqOXnZ27XXsacJG8ORAm/7DEyWjFy
	FhMrVfVvuvrtX3+rpBGZ89nHFur1tpR+Jz5is=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=UbSFJ86PfOyiThK8lH89PZJpIDEqgHhwWf///+P0K/DA5AcHqGxg77oCLfe08emdzC
	Tvh93WvIh+tKwflnPdHRppb9ouLX67oaSbU8aYd89lfdo/uhE6eEB+ZCdeDbAU4IKlv7
	LiuANgdeRu3zEXgni++MVXGlAectl1hwuJXIU=
Received: by 10.150.113.14 with SMTP id l14mr6556462ybc.28.1304968662181;
	Mon, 09 May 2011 12:17:42 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id c3sm1123219ybn.24.2011.05.09.12.17.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2011 12:17:41 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 May 2011 19:16:55 +0000
Message-Id: <1304968617-4949-10-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
References: <1304968617-4949-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH v4 10/12] postgresql: update to 8.4.7 since 8.4.4 was unfetchable
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
X-List-Received-Date: Mon, 09 May 2011 19:20:27 -0000

This has been synced with postgresql recipes in OE.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../remove.autoconf.version.check.patch            |   15 ---------------
 .../remove.autoconf.version.check.patch            |   15 +++++++++++++++
 meta-oe/recipes-support/postgresql/postgresql.inc  |    6 ++++--
 .../recipes-support/postgresql/postgresql_8.4.4.bb |   11 -----------
 .../recipes-support/postgresql/postgresql_8.4.7.bb |   10 ++++++++++
 5 files changed, 29 insertions(+), 28 deletions(-)
 delete mode 100644 meta-oe/recipes-support/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
 delete mode 100644 meta-oe/recipes-support/postgresql/postgresql_8.4.4.bb
 create mode 100644 meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb

diff --git a/meta-oe/recipes-support/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch b/meta-oe/recipes-support/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch
deleted file mode 100644
index d027061..0000000
--- a/meta-oe/recipes-support/postgresql/postgresql-8.4.4/remove.autoconf.version.check.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Index: postgresql-8.4.4/configure.in
-===================================================================
---- postgresql-8.4.4.orig/configure.in
-+++ postgresql-8.4.4/configure.in
-@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
- 
- AC_INIT([PostgreSQL], [8.4.4], [pgsql-bugs@postgresql.org])
- 
--m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf version 2.61 is required.
--Untested combinations of 'autoconf' and PostgreSQL versions are not
--recommended.  You can remove the check from 'configure.in' but it is then
--your responsibility whether the result works or not.])])
- AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Group])
- AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
- AC_CONFIG_AUX_DIR(config)
diff --git a/meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch b/meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
new file mode 100644
index 0000000..514a9aa
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/postgresql-8.4.7/remove.autoconf.version.check.patch
@@ -0,0 +1,15 @@
+Index: postgresql-8.4.7/configure.in
+===================================================================
+--- postgresql-8.4.7.orig/configure.in
++++ postgresql-8.4.7/configure.in
+@@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch un
+ 
+ AC_INIT([PostgreSQL], [8.4.7], [pgsql-bugs@postgresql.org])
+ 
+-m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.61], [], [m4_fatal([Autoconf version 2.61 is required.
+-Untested combinations of 'autoconf' and PostgreSQL versions are not
+-recommended.  You can remove the check from 'configure.in' but it is then
+-your responsibility whether the result works or not.])])
+ AC_COPYRIGHT([Copyright (c) 1996-2009, PostgreSQL Global Development Group])
+ AC_CONFIG_SRCDIR([src/backend/access/common/heaptuple.c])
+ AC_CONFIG_AUX_DIR(config)
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index edad3bc..53c38df 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -1,14 +1,14 @@
 DESCRIPTION = "PostgreSQL is a powerful, open source relational database system."
 HOMEPAGE = "http://www.postgresql.com"
 LICENSE = "BSD"
-
 DEPENDS = "zlib readline tzcode-native"
+INC_PR = "r5"
 
 ARM_INSTRUCTION_SET = "arm"
 
 #WARNING: this recipe assumes you have the timezone compiler present in /usr/sbin/zic
 
-SRC_URI = "ftp://ftp-archives.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
+SRC_URI = "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2"
 
 LEAD_SONAME = "libpq.so"
 
@@ -17,6 +17,8 @@ export LDFLAGS_SL = "${LDFLAGS}"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF_sh4 = "--disable-spinlocks"
+
 do_compile_append() {
          cp /usr/sbin/zic ${S}/src/timezone/
 }
diff --git a/meta-oe/recipes-support/postgresql/postgresql_8.4.4.bb b/meta-oe/recipes-support/postgresql/postgresql_8.4.4.bb
deleted file mode 100644
index d0f5078..0000000
--- a/meta-oe/recipes-support/postgresql/postgresql_8.4.4.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require postgresql.inc
-
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=29b81b066680be9ffd98cb9d2afb9de6"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "ftp://ftp.postgresql.org/pub/source/v${PV}/${P}.tar.bz2 \
-           file://remove.autoconf.version.check.patch"
-
-SRC_URI[md5sum] = "4bf2448ad965bca3940df648c02194df"
-SRC_URI[sha256sum] = "e66b398d565f7fb16d8ae58ae72881dcd3dbb1b88f532bbe1c2d1284812be37e"
diff --git a/meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb b/meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb
new file mode 100644
index 0000000..63f324c
--- /dev/null
+++ b/meta-oe/recipes-support/postgresql/postgresql_8.4.7.bb
@@ -0,0 +1,10 @@
+require postgresql.inc
+
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=29b81b066680be9ffd98cb9d2afb9de6"
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://remove.autoconf.version.check.patch"
+
+SRC_URI[md5sum] = "689397187bb1dfe9b5cbde99538311c3"
+SRC_URI[sha256sum] = "08032849da121e67e318f7ff4e68d3ac88f29050e242641f717c4270839b597b"
-- 
1.7.2.5



