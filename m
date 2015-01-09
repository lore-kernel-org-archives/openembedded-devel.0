Return-Path: <leimaohui@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE1D72027
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 06:36:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="55799152"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 09 Jan 2015 14:32:54 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t096Zk4R022887
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 9 Jan 2015 14:35:46 +0800
Received: from localhost.localdomain (10.167.226.48) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 9 Jan 2015 14:36:23 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 9 Jan 2015 14:35:39 +0800
Message-ID: <1420785339-18761-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.48]
Subject: [met-oe][PATCH] crash: add new recipe
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
X-List-Received-Date: Fri, 09 Jan 2015 06:36:25 -0000
Content-Type: text/plain

crash core analysis suite

Signed-off-by: Lei Maohui <leimaohui@cn.fujitsu.com>
---
 .../0001-cross_add_configure_option.patch          |  34 ++++++
 .../crash/crash-7.0.9/0001-lzo_snappy.patch        |  39 +++++++
 .../7001force_define_architecture.patch            |  13 +++
 .../7002cross_add_configure_option.patch           |  21 ++++
 .../crash/crash-7.0.9/7003cross_ranlib.patch       |  10 ++
 .../crash/crash-7.0.9/config-site.crash-7.0.9      |   1 +
 .../crash/crash-7.0.9/lzo_snappy.patch             | 100 +++++++++++++++++
 .../crash/crash-7.0.9/use_system_readline.patch    | 120 +++++++++++++++++++++
 meta-oe/recipes-kernel/crash/crash_7.0.9.bb        |  59 ++++++++++
 meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak    |  62 +++++++++++
 10 files changed, 459 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_configure_option.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline.patch
 create mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb
 create mode 100644 meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak

diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
new file mode 100644
index 0000000..229647f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-cross_add_configure_option.patch
@@ -0,0 +1,34 @@
+From cbaaa42933bb27b1bcff4c7d71d54c913201ee88 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 9 Jan 2015 11:51:18 +0900
+Subject: [PATCH] cross_add_configure_option
+
+---
+ Makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9c44633..39bebd0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -229,7 +229,7 @@ gdb_merge: force
+ 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
+ 	@rm -f ${PROGRAM}
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+-	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
++	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
+ 	    --with-bugurl="" --with-expat=no --with-python=no; \
+ 	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
+ 	else make --no-print-directory rebuild; fi
+@@ -277,7 +277,7 @@ force:
+ 
+ make_configure: force
+ 	@rm -f configure
+-	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
++	@cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
+ 
+ clean: make_configure
+ 	@./configure ${CONF_TARGET_FLAG} -q -b
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.patch
new file mode 100644
index 0000000..8eb668d
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/0001-lzo_snappy.patch
@@ -0,0 +1,39 @@
+From aab7f6d5ba37d85932783434f923d5bf21b4c13f Mon Sep 17 00:00:00 2001
+From: leimh <leimaohui@cn.fujitsu.com>
+Date: Wed, 7 Jan 2015 15:34:54 +0900
+Subject: [PATCH 1/2] lzo_snappy
+
+---
+ Makefile   | 2 +-
+ diskdump.c | 2 ++
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 68521b8..3397eeb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -225,7 +225,7 @@ all: make_configure
+ gdb_merge: force
+ 	@if [ ! -f ${GDB}/README ]; then \
+ 	  make --no-print-directory gdb_unzip; fi
+-	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
++	@echo "${LDFLAGS} -lz -llzo2 -lsnappy -ldl -rdynamic" &gt; ${GDB}/gdb/mergelibs
+ 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
+ 	@rm -f ${PROGRAM}
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+diff --git a/diskdump.c b/diskdump.c
+index 3d33fdc..95b92ee 100644
+--- a/diskdump.c
++++ b/diskdump.c
+@@ -23,6 +23,8 @@
+  * GNU General Public License for more details.
+  */
+ 
++#define LZO
++#define SNAPPY
+ #include "defs.h"
+ #include "diskdump.h"
+ 
+-- 
+1.8.4.2
+
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
new file mode 100644
index 0000000..0d44c7f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7001force_define_architecture.patch
@@ -0,0 +1,13 @@
+diff -uprN crash-5.1.8.org/configure.c crash-5.1.8/configure.c
+--- crash-5.1.8.org/configure.c	2011-09-17 04:01:12.000000000 +0900
++++ crash-5.1.8/configure.c	2012-09-13 13:28:45.393344108 +0900
+@@ -391,6 +391,9 @@ get_current_configuration(struct support
+ 			arch_mismatch(sp);
+ 	}
+ 
++	/** Force define archtecture */
++	target_data.target = FORCE_DEFINE_ARCH;
++
+         if ((fp = fopen("Makefile", "r")) == NULL) {
+ 		perror("Makefile");
+ 		goto get_release;
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_configure_option.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_configure_option.patch
new file mode 100644
index 0000000..dc594eb
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7002cross_add_configure_option.patch
@@ -0,0 +1,21 @@
+diff -uprN crash-6.1.1.org/Makefile crash-6.1.1/Makefile
+--- crash-6.1.1.org/Makefile	2012-11-20 05:57:31.000000000 +0900
++++ crash-6.1.1/Makefile	2012-12-27 20:51:34.100833890 +0900
+@@ -223,7 +223,7 @@ gdb_merge: force
+ 	@echo "${LDFLAGS} -lz -ldl -rdynamic" > ${GDB}/gdb/mergelibs
+ 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" > ${GDB}/gdb/mergeobj
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+-	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
++	  (cd ${GDB}; ./configure --host=${GDB_TARGET} --build=${GDB_HOST} --with-separate-debug-dir=/usr/lib/debug \
+ 	    --with-bugurl="" --with-expat=no --with-python=no; \
+ 	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} > crash.target) \
+ 	else (cd ${GDB}/gdb; make --no-print-directory CRASH_TARGET=${TARGET};); fi
+@@ -254,7 +254,7 @@ force:
+ 
+ make_configure: force
+ 	@rm -f configure
+-	@${CC} ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
++	@cc ${CONF_FLAGS} -o configure configure.c ${WARNING_ERROR} ${WARNING_OPTIONS}
+ 
+ clean: make_configure
+ 	@./configure ${CONF_TARGET_FLAG} -q -b
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
new file mode 100644
index 0000000..d567fa0
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/7003cross_ranlib.patch
@@ -0,0 +1,10 @@
+--- crash-5.1.8/Makefile.orig	2011-12-27 11:21:58.220652105 +0900
++++ crash-5.1.8/Makefile	2011-12-27 11:22:29.563651593 +0900
+@@ -285,6 +285,7 @@
+ 
+ library: make_build_data ${OBJECT_FILES}
+ 	ar -rs ${PROGRAM}lib.a ${OBJECT_FILES}
++	${RANLIB} ${PROGRAM}lib.a 
+ 
+ gdb: force
+ 	rm -f ${GDB_OFILES}
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9 b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
new file mode 100644
index 0000000..d6fc22f
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/config-site.crash-7.0.9
@@ -0,0 +1 @@
+bash_cv_have_mbstate_t=yes
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch
new file mode 100644
index 0000000..820a17d
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/lzo_snappy.patch
@@ -0,0 +1,100 @@
+<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
+  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
+<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>
+<head>
+<title>crash.git - crash</title>
+<meta name='generator' content='cgit v0.10.1'/>
+<meta name='robots' content='index, nofollow'/>
+<link rel='stylesheet' type='text/css' href='/cgit-data/cgit.css'/>
+<link rel='shortcut icon' href='/favicon.ico'/>
+<link rel='alternate' title='Atom feed' href='http://pkgs.fedoraproject.org/cgit/crash.git/atom/lzo_snappy.patch?h=master' type='application/atom+xml'/>
+</head>
+<body>
+<div id='cgit'><table id='header'>
+<tr>
+<td class='logo' rowspan='2'><a href='/cgit/'><img src='/cgit-data/cgit.png' alt='cgit logo'/></a></td>
+<td class='main'><a href='/cgit/'>index</a> : <a title='crash.git' href='/cgit/crash.git/'>crash.git</a></td><td class='form'><form method='get' action=''>
+<select name='h' onchange='this.form.submit();'>
+<option value='f10'>f10</option>
+<option value='f11'>f11</option>
+<option value='f12'>f12</option>
+<option value='f13'>f13</option>
+<option value='f14'>f14</option>
+<option value='f15'>f15</option>
+<option value='f16'>f16</option>
+<option value='f17'>f17</option>
+<option value='f18'>f18</option>
+<option value='f19'>f19</option>
+<option value='f20'>f20</option>
+<option value='f21'>f21</option>
+<option value='f7'>f7</option>
+<option value='f8'>f8</option>
+<option value='f9'>f9</option>
+<option value='master' selected='selected'>master</option>
+</select> <input type='submit' name='' value='switch'/></form></td></tr>
+<tr><td class='sub'>crash</td><td class='sub right'>Jesse Keating</td></tr></table>
+<table class='tabs'><tr><td>
+<a href='/cgit/crash.git/'>summary</a><a href='/cgit/crash.git/refs/'>refs</a><a href='/cgit/crash.git/log/lzo_snappy.patch'>log</a><a class='active' href='/cgit/crash.git/tree/lzo_snappy.patch'>tree</a><a href='/cgit/crash.git/commit/lzo_snappy.patch'>commit</a><a href='/cgit/crash.git/diff/lzo_snappy.patch'>diff</a><a href='/cgit/crash.git/stats/lzo_snappy.patch'>stats</a></td><td class='form'><form class='right' method='get' action='/cgit/crash.git/log/lzo_snappy.patch'>
+<select name='qt'>
+<option value='grep'>log msg</option>
+<option value='author'>author</option>
+<option value='committer'>committer</option>
+<option value='range'>range</option>
+</select>
+<input class='txt' type='text' size='10' name='q' value=''/>
+<input type='submit' value='search'/>
+</form>
+</td></tr></table>
+<div class='path'>path: <a href='/cgit/crash.git/tree/'>root</a>/<a href='/cgit/crash.git/tree/lzo_snappy.patch'>lzo_snappy.patch</a></div><div class='content'>blob: 73d2a4f713c045c4e9f046890bf88153442c8493 (<a href='/cgit/crash.git/plain/lzo_snappy.patch'>plain</a>)
+<table summary='blob content' class='blob'>
+<tr><td class='linenumbers'><pre><a id='n1' href='#n1'>1</a>
+<a id='n2' href='#n2'>2</a>
+<a id='n3' href='#n3'>3</a>
+<a id='n4' href='#n4'>4</a>
+<a id='n5' href='#n5'>5</a>
+<a id='n6' href='#n6'>6</a>
+<a id='n7' href='#n7'>7</a>
+<a id='n8' href='#n8'>8</a>
+<a id='n9' href='#n9'>9</a>
+<a id='n10' href='#n10'>10</a>
+<a id='n11' href='#n11'>11</a>
+<a id='n12' href='#n12'>12</a>
+<a id='n13' href='#n13'>13</a>
+<a id='n14' href='#n14'>14</a>
+<a id='n15' href='#n15'>15</a>
+<a id='n16' href='#n16'>16</a>
+<a id='n17' href='#n17'>17</a>
+<a id='n18' href='#n18'>18</a>
+<a id='n19' href='#n19'>19</a>
+<a id='n20' href='#n20'>20</a>
+<a id='n21' href='#n21'>21</a>
+<a id='n22' href='#n22'>22</a>
+</pre></td>
+<td class='lines'><pre><code>--- crash-7.0.2/diskdump.c.orig
++++ crash-7.0.2/diskdump.c
+@@ -23,6 +23,8 @@
+  * GNU General Public License for more details.
+  */
+ 
++#define LZO
++#define SNAPPY
+ #include "defs.h"
+ #include "diskdump.h"
+ 
+--- crash-7.0.2/Makefile.orig
++++ crash-7.0.2/Makefile
+@@ -223,7 +223,7 @@ all: make_configure
+ gdb_merge: force
+ 	@if [ ! -f ${GDB}/README ]; then \
+ 	  make --no-print-directory gdb_unzip; fi
+-	@echo "${LDFLAGS} -lz -ldl -rdynamic" &gt; ${GDB}/gdb/mergelibs
++	@echo "${LDFLAGS} -lz -llzo2 -lsnappy -ldl -rdynamic" &gt; ${GDB}/gdb/mergelibs
+ 	@echo "../../${PROGRAM} ../../${PROGRAM}lib.a" &gt; ${GDB}/gdb/mergeobj
+ 	@rm -f ${PROGRAM}
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+</code></pre></td></tr></table>
+</div> <!-- class=content -->
+<div class='footer'>generated  by cgit v0.10.1 at 2015-01-06 08:46:27 (GMT)</div>
+</div> <!-- id=cgit -->
+</body>
+</html>
diff --git a/meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline.patch b/meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline.patch
new file mode 100644
index 0000000..f992d25
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-7.0.9/use_system_readline.patch
@@ -0,0 +1,120 @@
+<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
+  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
+<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>
+<head>
+<title>crash.git - crash</title>
+<meta name='generator' content='cgit v0.10.1'/>
+<meta name='robots' content='index, nofollow'/>
+<link rel='stylesheet' type='text/css' href='/cgit-data/cgit.css'/>
+<link rel='shortcut icon' href='/favicon.ico'/>
+<link rel='alternate' title='Atom feed' href='http://pkgs.fedoraproject.org/cgit/crash.git/atom/use_system_readline.patch?h=master' type='application/atom+xml'/>
+</head>
+<body>
+<div id='cgit'><table id='header'>
+<tr>
+<td class='logo' rowspan='2'><a href='/cgit/'><img src='/cgit-data/cgit.png' alt='cgit logo'/></a></td>
+<td class='main'><a href='/cgit/'>index</a> : <a title='crash.git' href='/cgit/crash.git/'>crash.git</a></td><td class='form'><form method='get' action=''>
+<select name='h' onchange='this.form.submit();'>
+<option value='f10'>f10</option>
+<option value='f11'>f11</option>
+<option value='f12'>f12</option>
+<option value='f13'>f13</option>
+<option value='f14'>f14</option>
+<option value='f15'>f15</option>
+<option value='f16'>f16</option>
+<option value='f17'>f17</option>
+<option value='f18'>f18</option>
+<option value='f19'>f19</option>
+<option value='f20'>f20</option>
+<option value='f21'>f21</option>
+<option value='f7'>f7</option>
+<option value='f8'>f8</option>
+<option value='f9'>f9</option>
+<option value='master' selected='selected'>master</option>
+</select> <input type='submit' name='' value='switch'/></form></td></tr>
+<tr><td class='sub'>crash</td><td class='sub right'>Jesse Keating</td></tr></table>
+<table class='tabs'><tr><td>
+<a href='/cgit/crash.git/'>summary</a><a href='/cgit/crash.git/refs/'>refs</a><a href='/cgit/crash.git/log/use_system_readline.patch'>log</a><a class='active' href='/cgit/crash.git/tree/use_system_readline.patch'>tree</a><a href='/cgit/crash.git/commit/use_system_readline.patch'>commit</a><a href='/cgit/crash.git/diff/use_system_readline.patch'>diff</a><a href='/cgit/crash.git/stats/use_system_readline.patch'>stats</a></td><td class='form'><form class='right' method='get' action='/cgit/crash.git/log/use_system_readline.patch'>
+<select name='qt'>
+<option value='grep'>log msg</option>
+<option value='author'>author</option>
+<option value='committer'>committer</option>
+<option value='range'>range</option>
+</select>
+<input class='txt' type='text' size='10' name='q' value=''/>
+<input type='submit' value='search'/>
+</form>
+</td></tr></table>
+<div class='path'>path: <a href='/cgit/crash.git/tree/'>root</a>/<a href='/cgit/crash.git/tree/use_system_readline.patch'>use_system_readline.patch</a></div><div class='content'>blob: a6e04c4e6017c4818d5245357f5e649ba684f14c (<a href='/cgit/crash.git/plain/use_system_readline.patch'>plain</a>)
+<table summary='blob content' class='blob'>
+<tr><td class='linenumbers'><pre><a id='n1' href='#n1'>1</a>
+<a id='n2' href='#n2'>2</a>
+<a id='n3' href='#n3'>3</a>
+<a id='n4' href='#n4'>4</a>
+<a id='n5' href='#n5'>5</a>
+<a id='n6' href='#n6'>6</a>
+<a id='n7' href='#n7'>7</a>
+<a id='n8' href='#n8'>8</a>
+<a id='n9' href='#n9'>9</a>
+<a id='n10' href='#n10'>10</a>
+<a id='n11' href='#n11'>11</a>
+<a id='n12' href='#n12'>12</a>
+<a id='n13' href='#n13'>13</a>
+<a id='n14' href='#n14'>14</a>
+<a id='n15' href='#n15'>15</a>
+<a id='n16' href='#n16'>16</a>
+<a id='n17' href='#n17'>17</a>
+<a id='n18' href='#n18'>18</a>
+<a id='n19' href='#n19'>19</a>
+<a id='n20' href='#n20'>20</a>
+<a id='n21' href='#n21'>21</a>
+<a id='n22' href='#n22'>22</a>
+<a id='n23' href='#n23'>23</a>
+<a id='n24' href='#n24'>24</a>
+<a id='n25' href='#n25'>25</a>
+<a id='n26' href='#n26'>26</a>
+<a id='n27' href='#n27'>27</a>
+<a id='n28' href='#n28'>28</a>
+<a id='n29' href='#n29'>29</a>
+<a id='n30' href='#n30'>30</a>
+<a id='n31' href='#n31'>31</a>
+<a id='n32' href='#n32'>32</a>
+</pre></td>
+<td class='lines'><pre><code>--- crash-7.0.4/cmdline.c.orig
++++ crash-7.0.4/cmdline.c
+@@ -42,7 +42,8 @@ static int verify_args_input_file(char *
+ #define READLINE_LIBRARY
+ 
+ #include &lt;readline.h&gt;
+-#include &lt;rldefs.h&gt;
++#define vi_mode 0
++#define emacs_mode 1
+ #include &lt;history.h&gt;
+ 
+ static void readline_init(void);
+--- crash-7.0.4/Makefile.orig
++++ crash-7.0.4/Makefile
+@@ -200,7 +200,7 @@ TAR_FILES=${SOURCE_FILES} Makefile ${GPL
+ 	${EXTENSION_SOURCE_FILES} ${MEMORY_DRIVER_FILES}
+ CSCOPE_FILES=${SOURCE_FILES}
+ 
+-READLINE_DIRECTORY=./${GDB}/readline
++READLINE_DIRECTORY=/usr/include/readline
+ BFD_DIRECTORY=./${GDB}/bfd
+ GDB_INCLUDE_DIRECTORY=./${GDB}/include
+ 
+@@ -228,7 +228,7 @@ gdb_merge: force
+ 	@rm -f ${PROGRAM}
+ 	@if [ ! -f ${GDB}/config.status ]; then \
+ 	  (cd ${GDB}; ./configure ${GDB_CONF_FLAGS} --with-separate-debug-dir=/usr/lib/debug \
+-	    --with-bugurl="" --with-expat=no --with-python=no; \
++	    --with-bugurl="" --with-expat=no --with-python=no --with-system-readline; \
+ 	  make --no-print-directory CRASH_TARGET=${TARGET}; echo ${TARGET} &gt; crash.target) \
+ 	else (cd ${GDB}/gdb; make --no-print-directory CRASH_TARGET=${TARGET};); fi
+ 	@if [ ! -f ${PROGRAM} ]; then \
+</code></pre></td></tr></table>
+</div> <!-- class=content -->
+<div class='footer'>generated  by cgit v0.10.1 at 2015-01-06 08:46:44 (GMT)</div>
+</div> <!-- id=cgit -->
+</body>
+</html>
diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
new file mode 100644
index 0000000..efec061
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb
@@ -0,0 +1,59 @@
+SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
+DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
+investigate either live systems, kernel core dumps created from the\
+netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
+offered by Mission Critical Linux, or the LKCD kernel patch."
+
+HOMEPAGE = "http://people.redhat.com/anderson"
+SECTION = "devel"
+
+inherit gettext
+
+DEPENDS = "zlib readline"
+
+SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz \
+           file://7001force_define_architecture.patch \ 
+           file://7003cross_ranlib.patch \
+           file://0001-cross_add_configure_option.patch \
+           "
+
+SRC_URI[md5sum] = "d70ad2ed0f6d210ed11e88b8e977f5fd"
+SRC_URI[sha256sum] = "c6034c6eb6b52691c60d0b72dbdec58fac4c1b3ed1cd0697c209dc48d13a577e"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+
+EXTRA_OEMAKE = 'RPMPKG="${PV}" \
+                GDB_TARGET="${TARGET_SYS}" \
+                GDB_HOST="${BUILD_SYS}" \
+                '
+do_configure() {
+    :
+}
+
+do_compile_prepend() {
+   case ${TARGET_ARCH} in
+                arm*)     ARCH=ARM ;;
+                i*86*)    ARCH=X86 ;;
+                powerpc*) ARCH=PPC ;;
+                x86_64*)  ARCH=X86_64 ;;
+        esac
+
+    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
+    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    sed -i 's/&gt;/>/g' ${S}/Makefile
+}
+do_compile() {
+    oe_runmake ${EXTRA_OEMAKE}
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}/${mandir}/man8
+    install -d ${D}${includedir}/crash
+
+    oe_runmake DESTDIR=${D} install
+    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
+    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
+}   
+
diff --git a/meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak
new file mode 100644
index 0000000..8d559ee
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash_7.0.9.bb.bak
@@ -0,0 +1,62 @@
+SUMMARY = "Kernel analysis utility for live systems, netdump, diskdump, kdump, LKCD or mcore dumpfiles"
+DESCRIPTION = "The core analysis suite is a self-contained tool that can be used to\
+investigate either live systems, kernel core dumps created from the\
+netdump, diskdump and kdump packages from Red Hat Linux, the mcore kernel patch\
+offered by Mission Critical Linux, or the LKCD kernel patch."
+
+HOMEPAGE = "http://people.redhat.com/anderson"
+SECTION = "devel"
+
+inherit gettext
+
+DEPENDS = "zlib readline"
+CONFIG_SITE="${WORKDIR}/config-site.${P}"
+PARALLEL_MAKEINST = ""
+
+SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz \
+           file://7001force_define_architecture.patch \ 
+           file://7003cross_ranlib.patch \
+           file://config-site.${P} \
+           file://0001-cross_add_configure_option.patch \
+           "
+
+SRC_URI[md5sum] = "d70ad2ed0f6d210ed11e88b8e977f5fd"
+SRC_URI[sha256sum] = "c6034c6eb6b52691c60d0b72dbdec58fac4c1b3ed1cd0697c209dc48d13a577e"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
+
+EXTRA_OEMAKE = 'RPMPKG="${PV}" \
+                GDB_TARGET="${TARGET_SYS}" \
+                GDB_HOST="${BUILD_SYS}" \
+                '
+do_configure() {
+    :
+}
+
+do_compile_prepend() {
+   case ${TARGET_ARCH} in
+                arm*)     ARCH=ARM ;;
+                i*86*)    ARCH=X86 ;;
+                powerpc*) ARCH=PPC ;;
+                x86_64*)  ARCH=X86_64 ;;
+        esac
+
+    sed -i s/FORCE_DEFINE_ARCH/"${ARCH}"/g ${S}/configure.c
+    sed -i -e 's/#define TARGET_CFLAGS_ARM_ON_X86_64.*/#define TARGET_CFLAGS_ARM_ON_X86_64\t\"TARGET_CFLAGS=-D_FILE_OFFSET_BITS=64\"/g' ${S}/configure.c
+    sed -i 's/&gt;/>/g' ${S}/Makefile
+}
+do_compile() {
+    oe_runmake ${EXTRA_OEMAKE}
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}/${mandir}/man8
+    install -d ${D}${includedir}/crash
+
+    oe_runmake DESTDIR=${D} install
+    install -m 0644 ${S}/crash.8 ${D}/${mandir}/man8/
+    install -m 0644 ${S}/defs.h ${D}${includedir}/crash
+}   
+
-- 
1.8.4.2


