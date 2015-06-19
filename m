Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 715A273772
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 08:58:09 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,625,1427731200"; d="scan'208";a="97322695"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 19 Jun 2015 17:02:18 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5J8uXGC011793
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Jun 2015 16:56:33 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 19 Jun 2015 16:58:09 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 Jun 2015 16:58:03 +0800
Message-ID: <1434704283-4754-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [meta-networking][PATCH] postfix: upgrade from 2.11.1 to 3.0.1
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
X-List-Received-Date: Fri, 19 Jun 2015 08:58:13 -0000
Content-Type: text/plain

1.Remove postfix-add-db6-support.patch which is not needed,
since it is backported from upstream.

2.update install.patch and makedefs.patch that context changes.

3.Install smtp-sink which listens on the named host (or address) and port.
It takes SMTP messages from the network and throws them away.
Ref: http://www.postfix.org/smtp-sink.1.html

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-daemons/postfix/files/install.patch    | 57 ++++++++++++++++------
 .../recipes-daemons/postfix/files/makedefs.patch   | 46 +++++++++--------
 .../postfix/files/postfix-add-db6-support.patch    | 26 ----------
 .../recipes-daemons/postfix/postfix.inc            |  1 +
 .../recipes-daemons/postfix/postfix_2.11.1.bb      |  6 ---
 .../recipes-daemons/postfix/postfix_3.0.1.bb       |  5 ++
 6 files changed, 73 insertions(+), 68 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/postfix-add-db6-support.patch
 delete mode 100644 meta-networking/recipes-daemons/postfix/postfix_2.11.1.bb
 create mode 100644 meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb

diff --git a/meta-networking/recipes-daemons/postfix/files/install.patch b/meta-networking/recipes-daemons/postfix/files/install.patch
index a3fe089..d023680 100644
--- a/meta-networking/recipes-daemons/postfix/files/install.patch
+++ b/meta-networking/recipes-daemons/postfix/files/install.patch
@@ -1,14 +1,20 @@
-Change fixed postconf to a variable for cross-compiling
+From 190650e1cd5700cd6950ead3fcb17ebcec192a2e Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 19 Jun 2015 17:14:58 +0900
+Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
 
 Upstreamstatus: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
 ---
+ postfix-install | 18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
 diff --git a/postfix-install b/postfix-install
-index 49225ac..2e4c292 100644
+index 1662c3d..d11fa12 100644
 --- a/postfix-install
 +++ b/postfix-install
-@@ -201,8 +201,8 @@ test -z "$non_interactive" -a ! -t 0 && {
+@@ -226,8 +226,8 @@ test -z "$non_interactive" -a ! -t 0 && {
      exit 1
  }
  
@@ -19,7 +25,16 @@ index 49225ac..2e4c292 100644
      exit 1
  }
  
-@@ -363,7 +363,7 @@ HTML files. Specify \"no\" if you do not want to install these files."
+@@ -248,7 +248,7 @@ do
+     case "$junk" in
+     *MAIL_VERSION*) 
+ 	case "$mail_version" in
+-	"") mail_version="`bin/postconf -dhx mail_version`" || exit 1
++	"") mail_version="`$POSTCONF -dhx mail_version`" || exit 1
+ 	esac
+ 	val=`echo "$junk" | sed 's/MAIL_VERSION$/'"$mail_version/g"` || exit 1
+ 	case "$val" in
+@@ -434,7 +434,7 @@ template files main.cf.proto and master.cf.proto."
  
  : ${install_root=/}
  : ${tempdir=`pwd`}
@@ -28,39 +43,51 @@ index 49225ac..2e4c292 100644
  
  # Find out the location of installed configuration files.
  
-@@ -433,7 +433,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
+@@ -500,7 +500,7 @@ test -f $CONFIG_DIRECTORY/main.cf && {
  	case "$junk" in
  	"") eval unset $name;;
  	esac
--	eval : \${$name=\`bin/postconf -c $CONFIG_DIRECTORY -h $name\`} ||
-+	eval : \${$name=\`$POSTCONF -c $CONFIG_DIRECTORY -h $name\`} ||
+-	eval : \${$name=\`bin/postconf -c $CONFIG_DIRECTORY -hx $name\`} ||
++	eval : \${$name=\`$POSTCONF -c $CONFIG_DIRECTORY -hx $name\`} ||
  	    exit 1
      done
  }
-@@ -446,7 +446,7 @@ do
+@@ -513,7 +513,7 @@ do
      case "$junk" in
      "") eval unset $name;;
      esac
--    eval : \${$name=\`bin/postconf -c conf -d -h $name\`} || exit 1
-+    eval : \${$name=\`$POSTCONF -c conf -d -h $name\`} || exit 1
+-    eval : \${$name=\`bin/postconf -c conf -d -hx $name\`} || exit 1
++    eval : \${$name=\`$POSTCONF -c conf -d -hx $name\`} || exit 1
  done
  
  # Override settings manually.
-@@ -565,6 +565,8 @@ HTML_DIRECTORY=$install_root$html_directory
- MANPAGE_DIRECTORY=$install_root$manpage_directory
- README_DIRECTORY=$install_root$readme_directory
+@@ -639,6 +639,8 @@ README_DIRECTORY=$install_root$readme_directory
+ SHLIB_DIRECTORY=$install_root$shlib_directory
+ META_DIRECTORY=$install_root$meta_directory
  
 +test "x$POSTCONF" != "x" || POSTCONF="bin/postconf"
 +
  # Avoid repeated tests for existence of these; default permissions suffice.
  
  test -d $DAEMON_DIRECTORY || mkdir -p $DAEMON_DIRECTORY || exit 1
-@@ -724,7 +726,7 @@ do
- # Postfix releases, and software should not suddenly be installed in
+@@ -810,7 +812,7 @@ IFS="$BACKUP_IFS"
  # the wrong place when Postfix is being upgraded.
  
+ case "$mail_version" in
+-"") mail_version="`bin/postconf -dhx mail_version`" || exit 1
++"") mail_version="`$POSTCONF -dhx mail_version`" || exit 1
+ esac
+ 
+ # Undo MAIL_VERSION expansion at the end of a parameter value. If
+@@ -830,7 +832,7 @@ do
+     esac
+ done
+ 
 -bin/postconf -c $CONFIG_DIRECTORY -e \
 +"$POSTCONF" -c $CONFIG_DIRECTORY -e \
      "daemon_directory = $daemon_directory" \
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-daemons/postfix/files/makedefs.patch b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
index ea1e994..98d5f7e 100644
--- a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
@@ -1,4 +1,7 @@
-1)remove RANLIB, SYSLIBS, AR and get them from env.
+From 4f49e2ce420fb3c17415937530493158ef312733 Mon Sep 17 00:00:00 2001
+From: Li xin <lixin.fnst@cn.fujitsu.com>
+Date: Fri, 19 Jun 2015 16:45:54 +0900
+Subject: [PATCH] 1)remove RANLIB, SYSLIBS, AR and get them from env.
 
 2)reference sysroot when searching header files
 3)include sysroot path instead of absolute include path
@@ -10,22 +13,25 @@ for Linux2 and Linux3 systems.
 Upstreamstatus: Inappropriate [embedded specific]
 
 Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
+---
+ makedefs | 27 +++++++++++----------------
+ 1 file changed, 11 insertions(+), 16 deletions(-)
 
-5)add Linux 4.0 support
-
---- a/makedefs	2015-05-30 13:38:50.346033228 +0200
-+++ b/makedefs	2015-05-30 13:40:19.375364795 +0200
-@@ -87,9 +87,6 @@
-
+diff --git a/makedefs b/makedefs
+index 8b84e47..893fb0d 100644
+--- a/makedefs
++++ b/makedefs
+@@ -170,9 +170,6 @@ echo "# pie=$pie"
+ 
  # Defaults for most sane systems
-
+ 
 -RANLIB=ranlib
 -SYSLIBS=
 -AR=ar
  ARFL=rv
-
+ 
  # Ugly function to make our error message more visible among the
-@@ -293,12 +290,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -424,12 +421,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -41,7 +47,7 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -307,12 +304,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -438,12 +435,12 @@ case "$SYSTEM.$RELEASE" in
  			echo "Install the appropriate db*-devel package first." 1>&2
  			exit 1
  		    fi
@@ -56,7 +62,7 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -332,7 +329,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -463,7 +460,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -65,7 +71,7 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -356,22 +353,20 @@
+@@ -487,8 +484,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -74,9 +80,7 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
- 		;;
--    Linux.3*)	SYSTYPE=LINUX3
-+    Linux.3*|Linux.4*)	SYSTYPE=LINUX3
+@@ -504,12 +499,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -92,7 +96,7 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -379,7 +374,7 @@ EOF
+@@ -517,12 +512,12 @@ EOF
  			echo "Install the appropriate db*-devel package first." 1>&2
  			exit 1
  		    fi
@@ -101,12 +105,12 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  		    ;;
  		esac
  		for name in nsl resolv
-@@ -415,7 +410,7 @@ EOF
- 		esac
- 		for name in nsl resolv
  		do
--		    for lib in /usr/lib64 /lib64 /usr/lib /lib
+-		    for lib in /usr/lib64 /lib64 /usr/lib /usr/lib/* /lib /lib/*
 +		    for lib in $BUILD_SYSROOT_NSL_PATH
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
+-- 
+1.8.4.2
+
diff --git a/meta-networking/recipes-daemons/postfix/files/postfix-add-db6-support.patch b/meta-networking/recipes-daemons/postfix/files/postfix-add-db6-support.patch
deleted file mode 100644
index e3e28c8..0000000
--- a/meta-networking/recipes-daemons/postfix/files/postfix-add-db6-support.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Subject: [PATCH] add db6 support db6
-
-Upstream-Status: Backport
-
-Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
----
- src/util/dict_db.c |    3 ++-
- 1 files changed, 2 insertions(+), 1 deletions(-)
-
-diff --git a/src/util/dict_db.c b/src/util/dict_db.c
-index 93ee480..f1ae66b 100644
---- a/src/util/dict_db.c
-+++ b/src/util/dict_db.c
-@@ -693,7 +693,8 @@ static DICT *dict_db_open(const char *class, const char *path, int open_flags,
- 	msg_fatal("set DB cache size %d: %m", dict_db_cache_size);
-     if (type == DB_HASH && db->set_h_nelem(db, DICT_DB_NELM) != 0)
- 	msg_fatal("set DB hash element count %d: %m", DICT_DB_NELM);
--#if DB_VERSION_MAJOR == 5 || (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR > 0)
-+#if DB_VERSION_MAJOR == 6 || DB_VERSION_MAJOR == 5 || \
-+    (DB_VERSION_MAJOR == 4 && DB_VERSION_MINOR > 0)
-     if ((errno = db->open(db, 0, db_path, 0, type, db_flags, 0644)) != 0)
- 	FREE_RETURN(dict_surrogate(class, path, open_flags, dict_flags,
- 				   "open database %s: %m", db_path));
---
-1.7.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix.inc b/meta-networking/recipes-daemons/postfix/postfix.inc
index 72bc936..b118098 100644
--- a/meta-networking/recipes-daemons/postfix/postfix.inc
+++ b/meta-networking/recipes-daemons/postfix/postfix.inc
@@ -140,6 +140,7 @@ do_install () {
         -non-interactive
     rm -rf ${D}${localstatedir}/spool/postfix
     mv ${D}${sysconfdir}/postfix/main.cf ${D}${sysconfdir}/postfix/sample-main.cf
+    install -m 755 ${S}/bin/smtp-sink ${D}/${sbindir}/
     install -d ${D}${sysconfdir}/init.d
     install -m 644 ${WORKDIR}/main.cf_2.0 ${D}${sysconfdir}/postfix/main.cf
     install -m 755 ${WORKDIR}/postfix ${D}${sysconfdir}/init.d/postfix
diff --git a/meta-networking/recipes-daemons/postfix/postfix_2.11.1.bb b/meta-networking/recipes-daemons/postfix/postfix_2.11.1.bb
deleted file mode 100644
index 8f237dc..0000000
--- a/meta-networking/recipes-daemons/postfix/postfix_2.11.1.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require postfix.inc
-
-SRC_URI += "file://postfix-add-db6-support.patch"
-
-SRC_URI[md5sum] = "56ac1f1a79737c4ac1e24535a122a4a6"
-SRC_URI[sha256sum] = "487f98a73b95a5799409caf21ec065efea91c1dcdfb84c038a0e3a265d6489e2"
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb
new file mode 100644
index 0000000..04b81c8
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.0.1.bb
@@ -0,0 +1,5 @@
+require postfix.inc
+
+
+SRC_URI[md5sum] = "3ec1416e7d4fba9566297c8fcf7a348c"
+SRC_URI[sha256sum] = "cd2bd6447fe3368bb1a39f482f8dd1eec87c63067a0eb75f9aec8e4eadd21328"
-- 
1.8.4.2


