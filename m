Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BBDD6E668
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 08:44:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0R8iE4L005991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2016 00:44:14 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 27 Jan 2016 00:44:13 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 27 Jan 2016 16:43:03 +0800
Message-ID: <1453884183-23570-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-networking] netkit-rsh: add two patches and some fixes.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Jan 2016 08:44:17 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

* Update the checksum of the license text to include all the
license text to instead of the previous only from two to
three line.
* Customize compile option such as CFLAGS= -D_GNU_SOURCE
and the specific install folder.
* Customize pam configuration file for rsh, rexec.
and rlogin to make them work.
* Update the line "server  = /usr/bin/tcpd" to
"server = /usr/sbin/tcpd" for /etc/xinetd.d/{rexec,rlogin,rsh}.
* Fix some typo such as replace RPROVIDES_${PN}-rshd = "rshd"
to RPROVIDES_${PN}-server = "rshd"
* Fix host variable when rsh is renamed to other.
* Add rexec to support ipv6.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../netkit-rsh/netkit-rsh/fix-host-variable.patch  | 27 +++++++++++++++++++
 .../netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch    | 30 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam | 10 ++++++++
 .../netkit-rsh/netkit-rsh/rexec.xinetd.netkit      |  2 +-
 .../netkit-rsh/netkit-rsh/rlogin.pam               | 12 +++++++++
 .../netkit-rsh/netkit-rsh/rlogin.xinetd.netkit     |  2 +-
 .../recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam   | 10 ++++++++
 .../netkit-rsh/netkit-rsh/rsh.xinetd.netkit        |  2 +-
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 25 ++++++++++++------
 9 files changed, 109 insertions(+), 11 deletions(-)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fix-host-variable.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.pam
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fix-host-variable.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fix-host-variable.patch
new file mode 100644
index 0000000..1d3631d
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/fix-host-variable.patch
@@ -0,0 +1,27 @@
+fix host variable when rsh is renamed to other.
+
+Upstream-Status: Pending
+
+If rsh is renamed to other, like rsh.netkit, host variable is assigned to
+rsh.netkit, which is wrong.
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ rsh/rsh.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/rsh/rsh.c b/rsh/rsh.c
+index ac594f9..11f533e 100644
+--- a/rsh/rsh.c
++++ b/rsh/rsh.c
+@@ -100,7 +100,6 @@ main(int argc, char *argv[])
+ #else
+ 	if (!strcmp(p, "rsh")) asrsh = 1;
+ #endif
+-	else host = p;
+ 
+ 	/* handle "rsh host flags" */
+ 	if (!host && argc > 2 && argv[1][0] != '-') {
+-- 
+1.7.5.4
+
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
new file mode 100644
index 0000000..efd060f
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/netkit-rsh-0.17-rexec-ipv6.patch
@@ -0,0 +1,30 @@
+make rexec support ipv6
+
+Upstream-status: Pending
+
+rexec equals rexec_af(... ,AF_INET) which only support ipv4,
+use rexec_af(..., AF_UNSPEC) to support both ipv6 and ipv4.
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ rexec/rexec.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/rexec/rexec.c b/rexec/rexec.c
+index 0913c02..9c8f769 100644
+--- a/rexec/rexec.c
++++ b/rexec/rexec.c
+@@ -214,8 +214,8 @@ int main(int argc, char *argv[])
+     passwd = getpass("Password: ");
+   }
+ 
+-  if ( (sock = rexec(&host, port_exec, user_name, passwd, command, 
+-		     p_to_aux_sock)) < 0 )
++  if ( (sock = rexec_af(&host, port_exec, user_name, passwd, command, 
++		     p_to_aux_sock, AF_UNSPEC)) < 0 )
+  {
+     fprintf(stderr,"%s: Error in rexec system call: ",argv[0]);
+     perror(NULL);
+-- 
+1.7.4.1
+
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam
new file mode 100644
index 0000000..94e5dda
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.pam
@@ -0,0 +1,10 @@
+#%PAM-1.0
+# For root login to succeed here with pam_securetty, "rexec" must be
+# listed in /etc/securetty.
+auth       required     pam_nologin.so
+auth       required     pam_env.so
+auth       include      common-auth
+account    include      common-account
+session	   optional     pam_keyinit.so    force revoke
+session    include      common-session
+session    required     pam_loginuid.so
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
index 80aed36..7354360 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
@@ -14,7 +14,7 @@ service exec
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
+	server		= /usr/sbin/tcpd
 	server_args	= /usr/sbin/in.rexecd
 	disable		= yes
 }
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.pam b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.pam
new file mode 100644
index 0000000..b30f139
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.pam
@@ -0,0 +1,12 @@
+#%PAM-1.0
+# For root login to succeed here with pam_securetty, "rlogin" must be
+# listed in /etc/securetty.
+auth       required     pam_nologin.so
+auth       required     pam_securetty.so
+auth       required     pam_env.so
+auth       include      common-auth
+account    include      common-account
+password   include      common-password
+session	   optional     pam_keyinit.so    force revoke
+session    include      common-session
+session    required     pam_loginuid.so
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
index 00dbf93..70493e6 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
@@ -14,7 +14,7 @@ service login
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
+	server		= /usr/sbin/tcpd
 	server_args	= /usr/sbin/in.rlogind -a
 	disable		= yes
 }
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam
new file mode 100644
index 0000000..072327a
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.pam
@@ -0,0 +1,10 @@
+#%PAM-1.0
+# For root login to succeed here with pam_securetty, "rsh" must be
+# listed in /etc/securetty.
+auth       required     pam_nologin.so
+auth       required     pam_securetty.so
+auth       required     pam_env.so
+account    include      common-account
+session	   optional     pam_keyinit.so    force revoke
+session    include      common-session
+session    required     pam_loginuid.so
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
index ad59b62..a842eb9 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
@@ -15,7 +15,7 @@ service shell
 	group		= root
 	log_on_success	+= USERID
 	log_on_failure	+= USERID
-	server		= /usr/bin/tcpd
+	server		= /usr/sbin/tcpd
 	server_args	= /usr/sbin/in.rshd -aL
 	disable		= yes
 }
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
index f14a451..e29369c 100644
--- a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -4,7 +4,7 @@ HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
 LICENSE = "BSD-4-Clause"
 DEPENDS = "xinetd libgcrypt"
 
-LIC_FILES_CHKSUM = "file://rsh/rsh.c;beginline=2;endline=3;md5=25737e9d21d9df251dd26b7dcbd8ee29"
+LIC_FILES_CHKSUM = "file://rsh/rsh.c;endline=32;md5=487b3c637bdc181d32b2a8543d41b606"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=archive \
             ${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}-15.diff.gz;name=patch15 \
@@ -13,6 +13,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=
             file://rexec.xinetd.netkit \
             file://rlogin.xinetd.netkit \
             file://rsh.xinetd.netkit \
+            file://netkit-rsh-0.17-rexec-ipv6.patch \
+            file://fix-host-variable.patch \
 "
 
 SRC_URI[archive.md5sum] = "65f5f28e2fe22d9ad8b17bb9a10df096"
@@ -20,6 +22,12 @@ SRC_URI[archive.sha256sum] = "edcac7fa18015f0bc04e573f3f54ae3b638d71335df1ad7dae
 SRC_URI[patch15.md5sum] = "655efc0d541b03ca5de0ae506c805ea3"
 SRC_URI[patch15.sha256sum] = "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b1798694d9874733293bc2aa9"
 
+# Other support files
+PAM_SRC_URI = "file://rexec.pam \
+	file://rlogin.pam \
+	file://rsh.pam"
+SRC_URI += "${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI}', '', d)}"
+
 inherit pkgconfig
 
 CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
@@ -30,7 +38,7 @@ PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam", "", d)}
 PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
 
 do_configure () {
-    ./configure --prefix=${prefix}
+    ./configure --prefix=${prefix} --exec-prefix=${exec_prefix}
     echo "INSTALLROOT=${D}" > MCONFIG
 
     if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
@@ -58,9 +66,9 @@ do_install () {
     if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/pam.d
         install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
-        install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
-        install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
-        install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
+        install -m 0644 ${WORKDIR}/rexec.pam ${D}/${sysconfdir}/pam.d/rexec
+        install -m 0644 ${WORKDIR}/rlogin.pam ${D}/${sysconfdir}/pam.d/rlogin
+        install -m 0664 ${WORKDIR}/rsh.pam ${D}/${sysconfdir}/pam.d/rsh
     fi
     cp ${WORKDIR}/rexec.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rexec
     cp ${WORKDIR}/rlogin.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rlogin
@@ -85,7 +93,8 @@ ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
 ALTERNATIVE_LINK_NAME[rlogind] = "${bindir}/rlogind"
 ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
 
-RCONFLICTS_${PN}-client += "inetutils-rshd"
-RPROVIDES_${PN}-rshd = "rshd"
+RCONFLICTS_${PN}-server += "inetutils-rshd"
+RPROVIDES_${PN}-server = "rshd"
 
-RDEPENDS_${PN} = "xinetd"
+RDEPENDS_${PN}-server = "xinetd"
+RDEPENDS_${PN}-server += "tcp-wrappers"
-- 
1.9.1


