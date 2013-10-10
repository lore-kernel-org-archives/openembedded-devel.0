Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F1A436CFB2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 08:34:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9A8YmjN001762
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Oct 2013 01:34:48 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.168) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 10 Oct 2013 01:34:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 10 Oct 2013 16:34:45 +0800
Message-ID: <1381394085-7681-2-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1381394085-7681-1-git-send-email-rongqing.li@windriver.com>
References: <1381394085-7681-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2 meta-networking] vsftpd: change default secure_chroot_dir
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
X-List-Received-Date: Thu, 10 Oct 2013 08:34:46 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Change default value of secure_chroot_dir to /var/run/vsftpd/empty, add
volatiles entry for it, to ensure it won't fail to start by xinetd.

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../vsftpd/files/change-secure_chroot_dir.patch    |   55 ++++++++++++++++++++
 meta-networking/recipes-daemons/vsftpd/files/init  |    2 +-
 .../vsftpd/files/volatiles.99_vsftpd               |    2 +
 .../recipes-daemons/vsftpd/vsftpd_3.0.0.bb         |    7 ++-
 4 files changed, 64 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
 create mode 100644 meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd

diff --git a/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
new file mode 100644
index 0000000..e7a673e
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/files/change-secure_chroot_dir.patch
@@ -0,0 +1,55 @@
+vsftpd: change secure_chroot_dir default value
+
+Upstream-Status: Pending
+
+Change secure_chroot_dir pointing to a volatile directory.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ INSTALL       |    6 +++---
+ tunables.c    |    2 +-
+ vsftpd.conf.5 |    2 +-
+ 3 files changed, 5 insertions(+), 5 deletions(-)
+
+diff -urpN a/INSTALL b/INSTALL
+--- a/INSTALL	2013-09-13 10:23:57.504972397 +0800
++++ b/INSTALL	2013-09-13 10:25:25.664971779 +0800
+@@ -27,11 +27,11 @@ user in case it does not already exist. 
+ [root@localhost root]# useradd nobody
+ useradd: user nobody exists
+ 
+-2b) vsftpd needs the (empty) directory /usr/share/empty in the default
++2b) vsftpd needs the (empty) directory /var/run/vsftpd/empty in the default
+ configuration. Add this directory in case it does not already exist. e.g.:
+ 
+-[root@localhost root]# mkdir /usr/share/empty/
+-mkdir: cannot create directory `/usr/share/empty': File exists
++[root@localhost root]# mkdir /var/run/vsftpd/empty/
++mkdir: cannot create directory `/var/run/vsftpd/empty': File exists
+ 
+ 2c) For anonymous FTP, you will need the user "ftp" to exist, and have a
+ valid home directory (which is NOT owned or writable by the user "ftp").
+diff -urpN a/tunables.c b/tunables.c
+--- a/tunables.c	2013-09-13 10:26:29.554972817 +0800
++++ b/tunables.c	2013-09-13 10:27:18.104972210 +0800
+@@ -254,7 +254,7 @@ tunables_load_defaults()
+   /* -rw------- */
+   tunable_chown_upload_mode = 0600;
+ 
+-  install_str_setting("/usr/share/empty", &tunable_secure_chroot_dir);
++  install_str_setting("/var/run/vsftpd/empty", &tunable_secure_chroot_dir);
+   install_str_setting("ftp", &tunable_ftp_username);
+   install_str_setting("root", &tunable_chown_username);
+   install_str_setting("/var/log/xferlog", &tunable_xferlog_file);
+diff -urpN a/vsftpd.conf.5 b/vsftpd.conf.5
+--- a/vsftpd.conf.5	2013-09-13 10:09:33.774972462 +0800
++++ b/vsftpd.conf.5	2013-09-13 10:10:41.914971989 +0800
+@@ -969,7 +969,7 @@ This option should be the name of a dire
+ directory should not be writable by the ftp user. This directory is used
+ as a secure chroot() jail at times vsftpd does not require filesystem access.
+ 
+-Default: /usr/share/empty
++Default: /var/run/vsftpd/empty
+ .TP
+ .B ssl_ciphers
+ This option can be used to select which SSL ciphers vsftpd will allow for
diff --git a/meta-networking/recipes-daemons/vsftpd/files/init b/meta-networking/recipes-daemons/vsftpd/files/init
index d0ec010..513f407 100755
--- a/meta-networking/recipes-daemons/vsftpd/files/init
+++ b/meta-networking/recipes-daemons/vsftpd/files/init
@@ -2,7 +2,7 @@
 DAEMON=/usr/sbin/vsftpd
 NAME=vsftpd
 DESC="FTP Server"
-ARGS=""
+ARGS="/etc/vsftpd.conf"
 FTPDIR=/var/lib/ftp
 
 test -f $DAEMON || exit 0
diff --git a/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
new file mode 100644
index 0000000..0f80776
--- /dev/null
+++ b/meta-networking/recipes-daemons/vsftpd/files/volatiles.99_vsftpd
@@ -0,0 +1,2 @@
+# <type> <owner> <group> <mode> <path> <linksource>
+d root root 0755 /var/run/vsftpd/empty none
diff --git a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
index 7677477..09de1e9 100644
--- a/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
+++ b/meta-networking/recipes-daemons/vsftpd/vsftpd_3.0.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "https://security.appspot.com/downloads/vsftpd-${PV}.tar.gz \
            file://vsftpd.conf \
            file://vsftpd.user_list \
            file://vsftpd.ftpusers \
+           file://change-secure_chroot_dir.patch \
+           file://volatiles.99_vsftpd \
 "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6067ad950b28336613aed9dd47b1271 \
@@ -40,7 +42,7 @@ LDFLAGS_append =" -lcrypt -lcap"
 do_configure() {
     # Fix hardcoded /usr, /etc, /var mess.
     cat tunables.c|sed s:\"/usr:\"${prefix}:g|sed s:\"/var:\"${localstatedir}:g \
-    |sed s:\"${prefix}/share/empty:\"${localstatedir}/share/empty:g |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
+    |sed s:\"/etc:\"${sysconfdir}:g > tunables.c.new
     mv tunables.c.new tunables.c
 }
 
@@ -60,6 +62,9 @@ do_install() {
 
     install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
     install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
+    install -d ${D}/${sysconfdir}/default/volatiles
+    install -m 644 ${WORKDIR}/volatiles.99_vsftpd ${D}/${sysconfdir}/default/volatiles/99_vsftpd
+
     if ! test -z "${PAMLIB}" ; then
         install -d ${D}${sysconfdir}/pam.d/
         cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
-- 
1.7.10.4


