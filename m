Received: from [194.100.97.46] (helo=mail.inoi.fi)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <petri.lehtinen+openembedded-devel@inoi.fi>)
	id 1N0wW0-00028l-9w for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 14:11:39 +0200
Received: from mail.inoi.fi (localhost.localdomain [127.0.0.1])
	by mail.inoi.fi (Postfix) with ESMTP id 873E820013;
	Thu, 22 Oct 2009 15:07:00 +0300 (EEST)
Received: from localhost.localdomain (petri.int.inoi.fi [10.105.0.205])
	by mail.inoi.fi (Postfix) with ESMTP id 6E92820012;
	Thu, 22 Oct 2009 15:07:00 +0300 (EEST)
From: Petri Lehtinen <petri.lehtinen+openembedded-devel@inoi.fi>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Oct 2009 15:10:35 +0300
Message-Id: <1256213435-26743-1-git-send-email-petri.lehtinen+openembedded-devel@inoi.fi>
X-Mailer: git-send-email 1.6.5.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-SA-Exim-Connect-IP: 194.100.97.46
X-SA-Exim-Mail-From: petri.lehtinen+openembedded-devel@inoi.fi
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Petri Lehtinen <petri.lehtinen@inoi.fi>
Subject: [PATCH] sudo: Bump to 1.7.2p1
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
X-List-Received-Date: Thu, 22 Oct 2009 12:11:39 -0000

From: Petri Lehtinen <petri.lehtinen@inoi.fi>

The source for the old version 1.6.8p12 is no longer available. While
at it, fixed the postinst to also chmod sudoedit, and to chmod
/etc/sudoers only if it exists.

Signed-off-by: Petri Lehtinen <petri.lehtinen@inoi.fi>
---
 conf/checksums.ini                                 |    6 +-
 recipes/sudo/files/autofoo.patch                   |  222 --------------------
 recipes/sudo/files/nonrootinstall.patch            |   56 -----
 recipes/sudo/files/nostrip.patch                   |   20 --
 recipes/sudo/site/bit-32                           |    2 -
 recipes/sudo/site/bit-64                           |    2 -
 .../sudo/{files => sudo-1.7.2p1}/noexec-link.patch |    0
 recipes/sudo/sudo-1.7.2p1/nostrip.patch            |   17 ++
 .../sudo/sudo-1.7.2p1/unsetenv-cross-compile.patch |   13 ++
 recipes/sudo/sudo.inc                              |   11 +-
 recipes/sudo/sudo_1.6.8p12.bb                      |    9 -
 recipes/sudo/sudo_1.7.2p1.bb                       |   10 +
 12 files changed, 48 insertions(+), 320 deletions(-)
 delete mode 100644 recipes/sudo/files/autofoo.patch
 delete mode 100644 recipes/sudo/files/nonrootinstall.patch
 delete mode 100644 recipes/sudo/files/nostrip.patch
 delete mode 100644 recipes/sudo/site/bit-32
 delete mode 100644 recipes/sudo/site/bit-64
 rename recipes/sudo/{files => sudo-1.7.2p1}/noexec-link.patch (100%)
 create mode 100644 recipes/sudo/sudo-1.7.2p1/nostrip.patch
 create mode 100644 recipes/sudo/sudo-1.7.2p1/unsetenv-cross-compile.patch
 delete mode 100644 recipes/sudo/sudo_1.6.8p12.bb
 create mode 100644 recipes/sudo/sudo_1.7.2p1.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 80d227e..b1843df 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -24002,9 +24002,9 @@ sha256=88cf24ba5d589351791709ff7556ababc019ec59f3240ac2087dacabb9ad77be
 md5=1a53a0e72bee0bf814f4da83a9b6a636
 sha256=64331bda459e984b8d369b449eec89daa2f3cd288186f1d2a9ad8011badd4dad
 
-[http://ftp.sudo.ws/sudo/dist/sudo-1.6.8p12.tar.gz]
-md5=b29893c06192df6230dd5f340f3badf5
-sha256=56f7d86032538a4a98d90af3742903a09ba16d6db82b593e4a47605f87fa581a
+[http://www.courtesan.com/sudo/dist/sudo-1.7.2p1.tar.gz]
+md5=4449d466a774f5ce401c9c0e3866c026
+sha256=34d11a1dd8bace0885f55b4c8bddda1da29993ff8d7174099e25bd80db1eaf7f
 
 [http://dev.laptop.org/pub/sugar/sources/sugar/sugar-0.82.0.tar.bz2]
 md5=1f26fa4aee57469a0636a70649343fb3
diff --git a/recipes/sudo/files/autofoo.patch b/recipes/sudo/files/autofoo.patch
deleted file mode 100644
index 995f026..0000000
--- a/recipes/sudo/files/autofoo.patch
+++ /dev/null
@@ -1,222 +0,0 @@
-Index: sudo-1.6.8p12/configure.in
-===================================================================
---- sudo-1.6.8p12.orig/configure.in	2004-11-26 04:31:20.000000000 +1100
-+++ sudo-1.6.8p12/configure.in	2007-05-16 16:45:20.000000000 +1000
-@@ -1609,7 +1609,7 @@
-     AC_CHECK_FUNCS(getspnam, [CHECKSHADOW="false"], [AC_CHECK_LIB(gen, getspnam, AC_DEFINE(HAVE_GETSPNAM) [SUDO_LIBS="${SUDO_LIBS} -lgen"; LIBS="${LIBS} -lgen"])])
- fi
- if test "$CHECKSHADOW" = "true"; then
--    AC_CHECK_FUNC(getprpwnam, [AC_DEFINE(HAVE_GETPRPWNAM) [CHECKSHADOW="false"; SECUREWARE=1], AC_CHECK_LIB(sec, getprpwnam, AC_DEFINE(HAVE_GETPRPWNAM) [CHECKSHADOW="false"; SECUREWARE=1; SUDO_LIBS="${SUDO_LIBS} -lsec"; LIBS="${LIBS} -lsec"], AC_CHECK_LIB(security, getprpwnam, AC_DEFINE(HAVE_GETPRPWNAM) [CHECKSHADOW="false"; SECUREWARE=1; SUDO_LIBS="${SUDO_LIBS} -lsecurity"; LIBS="${LIBS} -lsecurity"], AC_CHECK_LIB(prot, getprpwnam, AC_DEFINE(HAVE_GETPRPWNAM) [CHECKSHADOW="false"; SECUREWARE=1; SUDO_LIBS="${SUDO_LIBS} -lprot"; LIBS="${LIBS} -lprot"])))])
-+    AC_CHECK_FUNC(getprpwnam, [AC_DEFINE(HAVE_GETPRPWNAM) CHECKSHADOW="false"; SECUREWARE=1], [AC_CHECK_LIB(sec, getprpwnam, [AC_DEFINE(HAVE_GETPRPWNAM) CHECKSHADOW="false"; SECUREWARE=1; SUDO_LIBS="${SUDO_LIBS} -lsec"; LIBS="${LIBS} -lsec"], [AC_CHECK_LIB(security, getprpwnam, [AC_DEFINE(HAVE_GETPRPWNAM) CHECKSHADOW="false"; SECUREWARE=1; SUDO_LIBS="${SUDO_LIBS} -lsecurity"; LIBS="${LIBS} -lsecurity"], [AC_CHECK_LIB(prot, getprpwnam, [AC_DEFINE(HAVE_GETPRPWNAM) CHECKSHADOW="false"; SECUREWARE=1; SUDO_LIBS="${SUDO_LIBS} -lprot"; LIBS="${LIBS} -lprot"])])])])
- fi
- 
- dnl
-@@ -1670,7 +1670,7 @@
- SUDO_TYPE_INO_T
- SUDO_FULL_VOID
- SUDO_UID_T_LEN
--SUDO_LONG_LONG
-+SUDO_TYPE_LONG_LONG
- SUDO_SOCK_SA_LEN
- dnl
- dnl only set RETSIGTYPE if it is not set already
-@@ -1700,12 +1700,14 @@
- if test -z "$BROKEN_GETCWD"; then
-     AC_REPLACE_FUNCS(getcwd)
- fi
--AC_CHECK_FUNCS(lockf flock, [break])
--AC_CHECK_FUNCS(waitpid wait3, [break])
--AC_CHECK_FUNCS(innetgr _innetgr, [AC_CHECK_FUNCS(getdomainname) [break]])
--AC_CHECK_FUNCS(lsearch, , [AC_CHECK_LIB(compat, lsearch, AC_CHECK_HEADER(search.h, AC_DEFINE(HAVE_LSEARCH) [LIBS="${LIBS} -lcompat"], AC_LIBOBJ(lsearch), -), AC_LIBOBJ(lsearch))])
--AC_CHECK_FUNCS(utimes, [AC_CHECK_FUNCS(futimes futimesat, [break])], [AC_CHECK_FUNCS(futime) AC_LIBOBJ(utimes)])
--SUDO_FUNC_FNMATCH(AC_DEFINE(HAVE_FNMATCH), AC_LIBOBJ(fnmatch))
-+AC_CHECK_FUNCS(lockf flock)
-+AC_CHECK_FUNCS(waitpid wait3)
-+AC_CHECK_FUNCS(innetgr _innetgr, [AC_CHECK_FUNCS(getdomainname)])
-+
-+AC_CHECK_FUNCS(lsearch, , [AC_CHECK_LIB(compat, lsearch, [AC_CHECK_HEADER(search.h, [AC_DEFINE(HAVE_LSEARCH) LIBS="$LIBS -lcompat"], [AC_LIBOBJ([lsearch])])], [AC_LIBOBJ([lsearch])])])
-+
-+AC_CHECK_FUNCS(utimes)
-+SUDO_FUNC_FNMATCH([AC_DEFINE([HAVE_FNMATCH], [1], [Define if you have the 'fnmatch' function.])], [AC_LIBOBJ([fnmatch])])
- SUDO_FUNC_ISBLANK
- AC_REPLACE_FUNCS(strerror strcasecmp sigaction strlcpy strlcat closefrom)
- AC_CHECK_FUNCS(snprintf vsnprintf asprintf vasprintf, , [NEED_SNPRINTF=1])
-Index: sudo-1.6.8p12/aclocal.m4
-===================================================================
---- sudo-1.6.8p12.orig/aclocal.m4	2004-09-08 03:14:51.000000000 +1000
-+++ sudo-1.6.8p12/aclocal.m4	2007-05-16 16:45:08.000000000 +1000
-@@ -9,7 +9,7 @@
- dnl
- dnl check for sendmail
- dnl
--AC_DEFUN(SUDO_PROG_SENDMAIL, [AC_MSG_CHECKING(for sendmail)
-+AC_DEFUN([SUDO_PROG_SENDMAIL], [AC_MSG_CHECKING(for sendmail)
- if test -f "/usr/sbin/sendmail"; then
-     AC_MSG_RESULT(/usr/sbin/sendmail)
-     SUDO_DEFINE(_PATH_SUDO_SENDMAIL, "/usr/sbin/sendmail")
-@@ -36,7 +36,7 @@
- dnl
- dnl check for vi
- dnl
--AC_DEFUN(SUDO_PROG_VI, [AC_MSG_CHECKING(for vi)
-+AC_DEFUN([SUDO_PROG_VI], [AC_MSG_CHECKING(for vi)
- if test -f "/usr/bin/vi"; then
-     AC_MSG_RESULT(/usr/bin/vi)
-     SUDO_DEFINE(_PATH_VI, "/usr/bin/vi")
-@@ -60,7 +60,7 @@
- dnl
- dnl check for mv
- dnl
--AC_DEFUN(SUDO_PROG_MV, [AC_MSG_CHECKING(for mv)
-+AC_DEFUN([SUDO_PROG_MV], [AC_MSG_CHECKING(for mv)
- if test -f "/usr/bin/mv"; then
-     AC_MSG_RESULT(/usr/bin/mv)
-     SUDO_DEFINE(_PATH_MV, "/usr/bin/mv")
-@@ -81,7 +81,7 @@
- dnl
- dnl check for bourne shell
- dnl
--AC_DEFUN(SUDO_PROG_BSHELL, [AC_MSG_CHECKING(for bourne shell)
-+AC_DEFUN([SUDO_PROG_BSHELL], [AC_MSG_CHECKING(for bourne shell)
- if test -f "/bin/sh"; then
-     AC_MSG_RESULT(/bin/sh)
-     SUDO_DEFINE(_PATH_BSHELL, "/bin/sh")
-@@ -114,7 +114,7 @@
- dnl
- dnl Where the log file goes, use /var/log if it exists, else /{var,usr}/adm
- dnl
--AC_DEFUN(SUDO_LOGFILE, [AC_MSG_CHECKING(for log file location)
-+AC_DEFUN([SUDO_LOGFILE], [AC_MSG_CHECKING(for log file location)
- if test -n "$with_logpath"; then
-     AC_MSG_RESULT($with_logpath)
-     SUDO_DEFINE_UNQUOTED(_PATH_SUDO_LOGFILE, "$with_logpath")
-@@ -135,7 +135,7 @@
- dnl
- dnl Where the log file goes, use /var/log if it exists, else /{var,usr}/adm
- dnl
--AC_DEFUN(SUDO_TIMEDIR, [AC_MSG_CHECKING(for timestamp file location)
-+AC_DEFUN([SUDO_TIMEDIR], [AC_MSG_CHECKING(for timestamp file location)
- if test -n "$with_timedir"; then
-     AC_MSG_RESULT($with_timedir)
-     SUDO_DEFINE_UNQUOTED(_PATH_SUDO_TIMEDIR, "$with_timedir")
-@@ -158,7 +158,7 @@
- dnl
- dnl check for fullly working void
- dnl
--AC_DEFUN(SUDO_FULL_VOID, [AC_MSG_CHECKING(for full void implementation)
-+AC_DEFUN([SUDO_FULL_VOID], [AC_MSG_CHECKING(for full void implementation)
- AC_TRY_COMPILE(, [void *foo;
- foo = (void *)0; (void *)"test";], AC_DEFINE(VOID, void, [Define to "void" if your compiler supports void pointers, else use "char"].)
- AC_MSG_RESULT(yes), AC_DEFINE(VOID, char)
-@@ -168,7 +168,7 @@
- dnl SUDO_CHECK_TYPE(TYPE, DEFAULT)
- dnl XXX - should require the check for unistd.h...
- dnl
--AC_DEFUN(SUDO_CHECK_TYPE,
-+AC_DEFUN([SUDO_CHECK_TYPE],
- [AC_REQUIRE([AC_HEADER_STDC])dnl
- AC_MSG_CHECKING(for $1)
- AC_CACHE_VAL(sudo_cv_type_$1,
-@@ -189,31 +189,31 @@
- dnl
- dnl Check for size_t declation
- dnl
--AC_DEFUN(SUDO_TYPE_SIZE_T,
-+AC_DEFUN([SUDO_TYPE_SIZE_T],
- [SUDO_CHECK_TYPE(size_t, int)])
- 
- dnl
- dnl Check for ssize_t declation
- dnl
--AC_DEFUN(SUDO_TYPE_SSIZE_T,
-+AC_DEFUN([SUDO_TYPE_SSIZE_T],
- [SUDO_CHECK_TYPE(ssize_t, int)])
- 
- dnl
- dnl Check for dev_t declation
- dnl
--AC_DEFUN(SUDO_TYPE_DEV_T,
-+AC_DEFUN([SUDO_TYPE_DEV_T],
- [SUDO_CHECK_TYPE(dev_t, int)])
- 
- dnl
- dnl Check for ino_t declation
- dnl
--AC_DEFUN(SUDO_TYPE_INO_T,
-+AC_DEFUN([SUDO_TYPE_INO_T],
- [SUDO_CHECK_TYPE(ino_t, unsigned int)])
- 
- dnl
- dnl check for working fnmatch(3)
- dnl
--AC_DEFUN(SUDO_FUNC_FNMATCH,
-+AC_DEFUN([SUDO_FUNC_FNMATCH],
- [AC_MSG_CHECKING(for working fnmatch with FNM_CASEFOLD)
- AC_CACHE_VAL(sudo_cv_func_fnmatch,
- [rm -f conftestdata; > conftestdata
-@@ -224,9 +224,9 @@
- rm -f core core.* *.core])dnl
- AC_MSG_RESULT($sudo_cv_func_fnmatch)
- if test $sudo_cv_func_fnmatch = yes; then
--  [$1]
-+  $1
- else
--  [$2]
-+  $2
- fi
- ])
- 
-@@ -246,7 +246,7 @@
- dnl
- dnl check for sa_len field in struct sockaddr
- dnl
--AC_DEFUN(SUDO_SOCK_SA_LEN,
-+AC_DEFUN([SUDO_SOCK_SA_LEN],
- [AC_MSG_CHECKING(for sa_len field in struct sockaddr)
- AC_CACHE_VAL(sudo_cv_sock_sa_len,
- [AC_TRY_RUN([#include <sys/types.h>
-@@ -269,7 +269,7 @@
- dnl we can't really trust UID_MAX or MAXUID since they may exist
- dnl only for backwards compatibility.
- dnl
--AC_DEFUN(SUDO_UID_T_LEN,
-+AC_DEFUN([SUDO_UID_T_LEN],
- [AC_REQUIRE([AC_TYPE_UID_T])
- AC_MSG_CHECKING(max length of uid_t)
- AC_CACHE_VAL(sudo_cv_uid_t_len,
-@@ -301,17 +301,29 @@
- 
- dnl
- dnl check for "long long"
--dnl XXX hard to cache since it includes 2 tests
- dnl
--AC_DEFUN(SUDO_LONG_LONG, [AC_MSG_CHECKING(for long long support)
--AC_TRY_LINK(, [long long foo = 1000; foo /= 10;], AC_DEFINE(HAVE_LONG_LONG, 1, [Define if your compiler supports the "long long" type.])
--[AC_TRY_RUN([main() {if (sizeof(long long) == sizeof(long)) exit(0); else exit(1);}], AC_DEFINE(LONG_IS_QUAD, 1, [Define if sizeof(long) == sizeof(long long).]))]
--AC_MSG_RESULT(yes), AC_MSG_RESULT(no))])
-+AC_DEFUN([SUDO_TYPE_LONG_LONG],
-+[AC_CHECK_TYPES(long long, [AC_DEFINE(HAVE_LONG_LONG, 1, [Define if your
-+compiler supports the "long long" type.])]
-+[AC_MSG_CHECKING(for long and long long equivalence)
-+AC_CACHE_VAL(sudo_cv_type_long_is_quad,
-+[AC_TRY_RUN([
-+main() {
-+if (sizeof(long long) == sizeof(long)) exit(0);
-+else exit(1);
-+}], [sudo_cv_type_long_is_quad=yes],
-+[sudo_cv_type_long_is_quad=no], [sudo_cv_type_long_is_quad=no])
-+rm -f core core.* *.core])dnl
-+AC_MSG_RESULT($sudo_cv_type_long_is_quad)
-+if test $sudo_cv_type_long_is_quad = yes; then
-+  AC_DEFINE(LONG_IS_QUAD, 1, [Define if sizeof(long) == sizeof(long long).])
-+fi
-+])])
- 
- dnl
- dnl append a libpath to an LDFLAGS style variable
- dnl
--AC_DEFUN(SUDO_APPEND_LIBPATH, [
-+AC_DEFUN([SUDO_APPEND_LIBPATH], [
-     if test X"$with_rpath" = X"yes"; then
- 	$1="${$1} -L$2 -R$2"
-     else
diff --git a/recipes/sudo/files/nonrootinstall.patch b/recipes/sudo/files/nonrootinstall.patch
deleted file mode 100644
index db174b3..0000000
--- a/recipes/sudo/files/nonrootinstall.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-
-#
-# Patch managed by http://www.mn-logistik.de/unsupported/pxa250/patcher
-#
-
-Index: sudo-1.6.8p5/Makefile.in
-===================================================================
---- sudo-1.6.8p5.orig/Makefile.in	2004-11-25 12:27:00.000000000 -0500
-+++ sudo-1.6.8p5/Makefile.in	2005-01-21 18:02:00.447440568 -0500
-@@ -81,10 +81,16 @@
- mandirform = $(mandir)/$(mantype)$(mansectform)
- 
- # User and group ids the installed files should be "owned" by
-+ifeq ($(DESTDIR),)
-+install_owncmd = -o $(install_uid) -g $(install_gid)
-+endif
- install_uid = 0
- install_gid = 0
- 
- # User, group, and mode the sudoers file should be "owned" by (configure)
-+ifeq ($(DESTDIR),)
-+sudoers_owncmd = -o $(sudoers_uid) -g $(sudoers_gid)
-+endif
- sudoers_uid = @SUDOERS_UID@
- sudoers_gid = @SUDOERS_GID@
- sudoers_mode = @SUDOERS_MODE@
-@@ -301,12 +307,11 @@
- 	    $(DESTDIR)$(noexecdir)
- 
- install-binaries: $(PROGS)
--	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 4111 -s sudo $(DESTDIR)$(sudodir)/sudo
-+	$(INSTALL) $(install_owncmd) -m 4555 -s sudo $(DESTDIR)$(sudodir)/sudo
-+	$(INSTALL) $(install_owncmd) -m 0555 -s visudo $(DESTDIR)$(visudodir)/visudo
- 	rm -f $(DESTDIR)$(sudodir)/sudoedit
- 	ln $(DESTDIR)$(sudodir)/sudo $(DESTDIR)$(sudodir)/sudoedit
- 
--	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0111 -s visudo $(DESTDIR)$(visudodir)/visudo
--
- install-noexec: sudo_noexec.la
- 	$(LIBTOOL) --mode=install $(INSTALL) sudo_noexec.la $(DESTDIR)$(noexecdir)
- 
-@@ -319,11 +324,11 @@
- 		$(srcdir)/sudoers $(DESTDIR)$(sudoersdir)/sudoers
- 
- install-man:
--	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0444 @mansrcdir@/sudo.$(mantype) $(DESTDIR)$(mandirsu)/sudo.$(mansectsu)
-+	$(INSTALL) $(install_owncmd) -m 0444 @mansrcdir@/sudo.$(mantype) $(DESTDIR)$(mandirsu)/sudo.$(mansectsu)
- 	@rm -f $(DESTDIR)$(mandirsu)/sudoedit.$(mansectsu)
- 	ln $(DESTDIR)$(mandirsu)/sudo.$(mansectsu) $(DESTDIR)$(mandirsu)/sudoedit.$(mansectsu)
--	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0444 @mansrcdir@/visudo.$(mantype) $(DESTDIR)$(mandirsu)/visudo.$(mansectsu)
--	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0444 @mansrcdir@/sudoers.$(mantype) $(DESTDIR)$(mandirform)/sudoers.$(mansectform)
-+	$(INSTALL) $(install_owncmd) -m 0444 @mansrcdir@/visudo.$(mantype) $(DESTDIR)$(mandirsu)/visudo.$(mansectsu)
-+	$(INSTALL) $(install_owncmd) -m 0444 @mansrcdir@/sudoers.$(mantype) $(DESTDIR)$(mandirform)/sudoers.$(mansectform)
- @MAN_POSTINSTALL@
- 
- check:
diff --git a/recipes/sudo/files/nostrip.patch b/recipes/sudo/files/nostrip.patch
deleted file mode 100644
index 287d43a..0000000
--- a/recipes/sudo/files/nostrip.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-
-#
-# Patch managed by http://www.holgerschurig.de/patcher.html
-#
-
-Index: sudo-1.6.8p5/Makefile.in
-===================================================================
---- sudo-1.6.8p5.orig/Makefile.in	2005-01-21 18:19:05.762568976 -0500
-+++ sudo-1.6.8p5/Makefile.in	2005-01-21 18:19:34.701169640 -0500
-@@ -307,8 +307,8 @@
- 	    $(DESTDIR)$(noexecdir)
- 
- install-binaries: $(PROGS)
--	$(INSTALL) $(install_owncmd) -m 4555 -s sudo $(DESTDIR)$(sudodir)/sudo
--	$(INSTALL) $(install_owncmd) -m 0555 -s visudo $(DESTDIR)$(visudodir)/visudo
-+	$(INSTALL) $(install_owncmd) -m 4555 sudo $(DESTDIR)$(sudodir)/sudo
-+	$(INSTALL) $(install_owncmd) -m 0555 visudo $(DESTDIR)$(visudodir)/visudo
- 	rm -f $(DESTDIR)$(sudodir)/sudoedit
- 	ln $(DESTDIR)$(sudodir)/sudo $(DESTDIR)$(sudodir)/sudoedit
- 
diff --git a/recipes/sudo/site/bit-32 b/recipes/sudo/site/bit-32
deleted file mode 100644
index 9b7ca5c..0000000
--- a/recipes/sudo/site/bit-32
+++ /dev/null
@@ -1,2 +0,0 @@
-# is sizeof(long long) == sizeof(long)
-sudo_cv_type_long_is_quad=${sudo_cv_type_long_is_quad=no}
diff --git a/recipes/sudo/site/bit-64 b/recipes/sudo/site/bit-64
deleted file mode 100644
index 05846ff..0000000
--- a/recipes/sudo/site/bit-64
+++ /dev/null
@@ -1,2 +0,0 @@
-# is sizeof(long long) == sizeof(long)
-sudo_cv_type_long_is_quad=${sudo_cv_type_long_is_quad=yes}
diff --git a/recipes/sudo/files/noexec-link.patch b/recipes/sudo/sudo-1.7.2p1/noexec-link.patch
similarity index 100%
rename from recipes/sudo/files/noexec-link.patch
rename to recipes/sudo/sudo-1.7.2p1/noexec-link.patch
diff --git a/recipes/sudo/sudo-1.7.2p1/nostrip.patch b/recipes/sudo/sudo-1.7.2p1/nostrip.patch
new file mode 100644
index 0000000..7ab57da
--- /dev/null
+++ b/recipes/sudo/sudo-1.7.2p1/nostrip.patch
@@ -0,0 +1,17 @@
+Don't strip binaries.
+
+--- a/Makefile.in
+--- b/Makefile.in
+@@ -417,10 +417,10 @@
+ 	    $(DESTDIR)$(noexecdir)
+ 
+ install-binaries: install-dirs $(PROGS)
+-	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 4111 -s sudo $(DESTDIR)$(sudodir)/sudo
++	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 4111 sudo $(DESTDIR)$(sudodir)/sudo
+ 	rm -f $(DESTDIR)$(sudodir)/sudoedit
+ 	ln $(DESTDIR)$(sudodir)/sudo $(DESTDIR)$(sudodir)/sudoedit
+-	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0111 -s visudo $(DESTDIR)$(visudodir)/visudo
++	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0111 visudo $(DESTDIR)$(visudodir)/visudo
+ @SELINUX@	$(INSTALL) -O $(install_uid) -G $(install_gid) -M 0111 -s sesh $(DESTDIR)$(libexecdir)/sesh
+ 
+ install-noexec: install-dirs sudo_noexec.la
diff --git a/recipes/sudo/sudo-1.7.2p1/unsetenv-cross-compile.patch b/recipes/sudo/sudo-1.7.2p1/unsetenv-cross-compile.patch
new file mode 100644
index 0000000..88d786f
--- /dev/null
+++ b/recipes/sudo/sudo-1.7.2p1/unsetenv-cross-compile.patch
@@ -0,0 +1,13 @@
+Unset UNSETENV_VOID if cross-compiling.
+
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -245,7 +245,7 @@
+     ],
+     [sudo_cv_func_unsetenv_void=no],
+     [sudo_cv_func_unsetenv_void=yes],
+-    [sudo_cv_func_unsetenv_void=yes])])
++    [sudo_cv_func_unsetenv_void=no])])
+     if test $sudo_cv_func_unsetenv_void = yes; then
+       AC_DEFINE(UNSETENV_VOID, 1,
+         [Define to 1 if the `unsetenv' function returns void instead of `int'.])
diff --git a/recipes/sudo/sudo.inc b/recipes/sudo/sudo.inc
index 0dfb22b..f86ffd2 100644
--- a/recipes/sudo/sudo.inc
+++ b/recipes/sudo/sudo.inc
@@ -19,10 +19,9 @@ do_configure_prepend () {
 }
 
 pkg_postinst() {
-	if [ "x$D" != "x" ]; then
-		exit 1
-	fi
-
-	chmod 4111 /usr/bin/sudo
-	chmod 0440 /etc/sudoers
+	chmod 4755 $D${bindir}/sudo
+	chmod 4755 $D${bindir}/sudoedit
+        if [ -f $D${sysconfdir}/sudoers ]; then
+	    chmod 0440 $D${sysconfdir}/sudoers
+        fi
 }
diff --git a/recipes/sudo/sudo_1.6.8p12.bb b/recipes/sudo/sudo_1.6.8p12.bb
deleted file mode 100644
index f3fa0c6..0000000
--- a/recipes/sudo/sudo_1.6.8p12.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-PR = "r3"
-
-SRC_URI = "http://ftp.sudo.ws/sudo/dist/sudo-${PV}.tar.gz \
-           file://nonrootinstall.patch;patch=1 \
-           file://nostrip.patch;patch=1 \
-           file://autofoo.patch;patch=1 \
-           file://noexec-link.patch;patch=1"
-
-require sudo.inc
diff --git a/recipes/sudo/sudo_1.7.2p1.bb b/recipes/sudo/sudo_1.7.2p1.bb
new file mode 100644
index 0000000..9ef55f6
--- /dev/null
+++ b/recipes/sudo/sudo_1.7.2p1.bb
@@ -0,0 +1,10 @@
+PR = "r1"
+
+SRC_URI = "http://www.courtesan.com/sudo/dist/sudo-${PV}.tar.gz \
+           file://noexec-link.patch;patch=1 \
+           file://nostrip.patch;patch=1 \
+           file://unsetenv-cross-compile.patch;patch=1"
+
+require sudo.inc
+
+EXTRA_OECONF += "--with-pam=no"
-- 
1.6.5.1



