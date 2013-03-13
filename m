Received: from mail.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1UFtPY-00015J-PS
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Mar 2013 22:40:37 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Mar 2013 22:23:39 +0100
Message-Id: <1363209819-5886-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] autofs: fix compile with uclibc
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
X-List-Received-Date: Wed, 13 Mar 2013 21:40:38 -0000

* Backport patch to make yp optional, which uclibc doesn't provide.
* Create patch to include linux/nfs.h instead of nfs/nfs.h.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 ...7-include-linux-nfs.h-directly-in-rpc_sub.patch |   32 +++++
 ...-5.0.7-make-yellow-pages-support-optional.patch |  145 ++++++++++++++++++++
 .../recipes-daemons/autofs/autofs_5.0.7.bb         |    4 +-
 3 files changed, 180 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
 create mode 100644 meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch

diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
new file mode 100644
index 0000000..3a87898
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch
@@ -0,0 +1,32 @@
+Upstream-Status: Pending
+
+From 44bdce8c6ed9b30c1643e5981172a4f9025f013c Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Wed, 13 Mar 2013 16:17:08 +0100
+Subject: [PATCH] autofs-5.0.7: include linux/nfs.h directly in rpc_subs.h
+
+Fixes compile error with uclibc. Glibc's nfs/nfs.h contains
+nothing but "#include linux/nfs.h". rpc_subs.h already includes
+other linux/nfs*.h files directly.
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ include/rpc_subs.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/rpc_subs.h b/include/rpc_subs.h
+index b6d59f9..a2d9648 100644
+--- a/include/rpc_subs.h
++++ b/include/rpc_subs.h
+@@ -18,7 +18,7 @@
+ 
+ #include <rpc/rpc.h>
+ #include <rpc/pmap_prot.h>
+-#include <nfs/nfs.h>
++#include <linux/nfs.h>
+ #include <linux/nfs2.h>
+ #include <linux/nfs3.h>
+ 
+-- 
+1.7.10.4
+
diff --git a/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch
new file mode 100644
index 0000000..9504d8e
--- /dev/null
+++ b/meta-networking/recipes-daemons/autofs/autofs-5.0.7/autofs-5.0.7-make-yellow-pages-support-optional.patch
@@ -0,0 +1,145 @@
+Upstream-Status: Backport
+
+autofs-5.0.7 - make yellow pages support optional
+
+From: Chris Packham <chris.packham@alliedtelesis.co.nz>
+
+If rpcsvc/ypclnt.h is not available don't compile in Yellow Pages
+support.
+---
+
+ Makefile.conf.in    |    3 +++
+ configure           |   16 ++++++++++++++++
+ configure.in        |    9 +++++++++
+ include/config.h.in |    3 +++
+ lib/rpc_subs.c      |    1 -
+ modules/Makefile    |    9 +++++++--
+ 7 files changed, 39 insertions(+), 3 deletions(-)
+
+
+diff --git a/Makefile.conf.in b/Makefile.conf.in
+index 802318b..3766d45 100644
+--- a/Makefile.conf.in
++++ b/Makefile.conf.in
+@@ -43,6 +43,9 @@ NISPLUS = @HAVE_NISPLUS@
+ # SMBFS support: yes (1) no (0)
+ SMBFS = @HAVE_SMBMOUNT@
+ 
++# YellowPages support: yes (1) no (0)
++YPCLNT = @HAVE_YPCLNT@
++
+ # Support for calling e2fsck when mounting ext2 filesystems
+ EXT2FS = @HAVE_E2FSCK@
+ 
+diff --git a/configure b/configure
+index 3722a46..cf6428c 100755
+--- a/configure
++++ b/configure
+@@ -614,6 +614,7 @@ XML_FLAGS
+ LIBLDAP
+ HAVE_LDAP
+ LDAP_FLAGS
++HAVE_YPCLNT
+ HAVE_NISPLUS
+ EGREP
+ GREP
+@@ -4575,6 +4576,21 @@ fi
+ 
+ 
+ 
++# YellowPages support?
++HAVE_YPCLNT=0
++ac_fn_c_check_header_mongrel "$LINENO" "rpcsvc/ypclnt.h" "ac_cv_header_rpcsvc_ypclnt_h" "$ac_includes_default"
++if test "x$ac_cv_header_rpcsvc_ypclnt_h" = xyes; then :
++  HAVE_YPCLNT=1
++fi
++
++
++
++if test "$HAVE_YPCLNT" = "1"; then
++
++$as_echo "#define HAVE_YPCLNT 1" >>confdefs.h
++
++fi
++
+ #
+ # OpenLDAP support?  Expect that this may have a special directory...
+ #
+diff --git a/configure.in b/configure.in
+index 90bda62..363c376 100644
+--- a/configure.in
++++ b/configure.in
+@@ -213,6 +213,15 @@ HAVE_NISPLUS=0
+ AC_CHECK_HEADER(rpcsvc/nis.h, HAVE_NISPLUS=1)
+ AC_SUBST(HAVE_NISPLUS)
+ 
++# YellowPages support?
++HAVE_YPCLNT=0
++AC_CHECK_HEADER([rpcsvc/ypclnt.h], HAVE_YPCLNT=1)
++AC_SUBST(HAVE_YPCLNT)
++if test "$HAVE_YPCLNT" = "1"; then
++	AC_DEFINE(HAVE_YPCLNT, 1,
++		[Define if using YellowPages])
++fi
++
+ #
+ # OpenLDAP support?  Expect that this may have a special directory...
+ #
+diff --git a/include/config.h.in b/include/config.h.in
+index 9bdf98a..7f1c5b5 100644
+--- a/include/config.h.in
++++ b/include/config.h.in
+@@ -72,6 +72,9 @@
+ /* Define to 1 if you have the <unistd.h> header file. */
+ #undef HAVE_UNISTD_H
+ 
++/* Define if using YellowPages */
++#undef HAVE_YPCLNT
++
+ /* Use libxml2 tsd usage workaround */
+ #undef LIBXML2_WORKAROUND
+ 
+diff --git a/lib/rpc_subs.c b/lib/rpc_subs.c
+index ad1d557..718caf9 100644
+--- a/lib/rpc_subs.c
++++ b/lib/rpc_subs.c
+@@ -27,7 +27,6 @@
+ #include <net/if.h>
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+-#include <rpcsvc/ypclnt.h>
+ #include <errno.h>
+ #include <sys/ioctl.h>
+ #include <ctype.h>
+diff --git a/modules/Makefile b/modules/Makefile
+index 939da7c..c5deb24 100644
+--- a/modules/Makefile
++++ b/modules/Makefile
+@@ -5,13 +5,13 @@
+ -include ../Makefile.conf
+ include ../Makefile.rules
+ 
+-SRCS :=	lookup_yp.c  lookup_file.c lookup_program.c  lookup_userhome.c \
++SRCS :=	lookup_file.c lookup_program.c  lookup_userhome.c \
+ 	lookup_multi.c lookup_hosts.c lookup_dir.c \
+ 	parse_sun.c    \
+ 	mount_generic.c  mount_nfs.c  mount_afs.c  mount_autofs.c \
+ 	mount_changer.c  mount_bind.c
+ 
+-MODS :=	lookup_yp.so lookup_file.so lookup_program.so lookup_userhome.so \
++MODS :=	lookup_file.so lookup_program.so lookup_userhome.so \
+ 	lookup_multi.so lookup_hosts.so lookup_dir.so \
+ 	parse_sun.so \
+ 	mount_generic.so mount_nfs.so mount_afs.so mount_autofs.so \
+@@ -37,6 +37,11 @@ ifeq ($(NISPLUS), 1)
+   MODS += lookup_nisplus.so
+ endif
+ 
++ifeq ($(YPCLNT), 1)
++  SRCS += lookup_yp.c
++  MODS += lookup_yp.so
++endif
++
+ ifeq ($(LDAP), 1)
+   SRCS += lookup_ldap.c
+   MODS += lookup_ldap.so
diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 215d293..44985b2 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -3,7 +3,7 @@ SECTION = "base"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libtirpc flex-native bison-native"
 
@@ -27,6 +27,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.6-fix-recursive-mount-deadlock.patch \
            file://autofs-5.0.6-increase-file-map-read-buffer-size.patch \
            file://autofs-5.0.7-handle-new-location-of-systemd.patch \
+           file://autofs-5.0.7-make-yellow-pages-support-optional.patch \
+           file://autofs-5.0.7-include-linux-nfs.h-directly-in-rpc_sub.patch \
            file://Makefile.rules-cross.patch \
            file://no-bash.patch \
            file://cross.patch \
-- 
1.7.10.4



