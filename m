Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id B74297249B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 17:33:11 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so10317366pab.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Dec 2014 09:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Ch8rZFkph3HRAgdF0BzxRg53+/DFcj0HWTp4e3iXXKA=;
	b=HsDHyx2pCJMGgzd1KkLXSS72aaxBkjzbJqErgHZnhvk6f0Pq76u9O90dPBggvOSaR5
	uix7/NMmCx/ysCJi/BDiv2poWbacx+29vlTeCnn/7Sq2p1wdqZI1rDmf1nvN07jS84RR
	qeXFB3800Zj3MPddXv5kb+/S/OK/HEJp0Bj5PZqD0+kZ1NQGsNboxPmfNTojePSOamdB
	kCU5JLlhIaDfJGpWPKU57jsI+7CdWP6hUtRX7EkLtfnUn4XotzPdVm1yH+D/eP21TQek
	j1T0fCptcxsJoAsxlJokL85QlBpA3jdB4ytEpb4PVOsh7CV89Xh8ZzqN/4lpmqSaHPtf
	3fHg==
X-Received: by 10.66.220.134 with SMTP id pw6mr43599294pac.91.1418578392509;
	Sun, 14 Dec 2014 09:33:12 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id pv3sm2424958pbb.56.2014.12.14.09.33.10
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Dec 2014 09:33:11 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 14 Dec 2014 09:32:59 -0800
Message-Id: <1418578379-6113-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-networking][PATCH V2] netkit-rsh: add new package
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
X-List-Received-Date: Sun, 14 Dec 2014 17:33:16 -0000

V2: added PAM config option
    fixed link bug
    moved files to PN location
    fixed BSD license

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../netkit-rsh/netkit-rsh/no_pam_build_fix.patch   | 39 ++++++++++
 .../netkit-rsh/netkit-rsh/rexec.xinetd.netkit      | 20 +++++
 .../netkit-rsh/netkit-rsh/rlogin.xinetd.netkit     | 23 ++++++
 .../netkit-rsh/rsh-redone_link_order_file.patch    | 77 ++++++++++++++++++
 .../netkit-rsh/netkit-rsh/rsh.xinetd.netkit        | 21 +++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 91 ++++++++++++++++++++++
 6 files changed, 271 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
new file mode 100644
index 0000000..fdd535b
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/no_pam_build_fix.patch
@@ -0,0 +1,39 @@
+netkit-rsh:
+Allow to build with no PAM enabled.
+
+Upstream-Status: Inappropriate [ no upstream maintaner ]
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: netkit-rsh-0.17/rshd/rshd.c
+===================================================================
+--- netkit-rsh-0.17.orig/rshd/rshd.c
++++ netkit-rsh-0.17/rshd/rshd.c
+@@ -110,9 +110,11 @@ extern	char	**environ;
+ static void error(const char *fmt, ...);
+ static void doit(struct sockaddr *fromp, socklen_t fromlen);
+ static char *getstr(char *, size_t, const char *);
++#ifdef USE_PAM
+ static int err_conv(
+ 	int, const struct pam_message **, struct pam_response **, void *
+ );
++#endif /* USE_PAM */
+ 
+ extern int _check_rhosts_file;
+ 
+@@ -256,6 +258,7 @@ static void stderr_parent(int sock, int
+ }
+ 
+ 
++#ifdef USE_PAM
+ static int err_conv(
+ 	int num_msg, const struct pam_message **msg,
+ 	struct pam_response **resp, void *appdata_ptr
+@@ -266,6 +269,7 @@ static int err_conv(
+ 	(void) appdata_ptr;
+ 	return PAM_CONV_ERR;
+ }
++#endif
+ 
+ static struct passwd *doauth(const char *remuser, 
+ 			     const char *hostname, 
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
new file mode 100644
index 0000000..80aed36
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rexec.xinetd.netkit
@@ -0,0 +1,20 @@
+# default: off
+# description:
+# Rexecd is the server for the rexec program. The server provides remote 
+# execution facilities with authentication based on user names and 
+# passwords.
+#
+service exec
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= /usr/bin/tcpd
+	server_args	= /usr/sbin/in.rexecd
+	disable		= yes
+}
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
new file mode 100644
index 0000000..00dbf93
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rlogin.xinetd.netkit
@@ -0,0 +1,23 @@
+# default: off
+# description:
+# Rlogind is a server for the rlogin program. The server provides remote 
+# execution with authentication based on privileged port numbers from trusted
+# host
+#
+service login
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= /usr/bin/tcpd
+	server_args	= /usr/sbin/in.rlogind -a
+	disable		= yes
+}
+							
+							
+							
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
new file mode 100644
index 0000000..c12ee9b
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh-redone_link_order_file.patch
@@ -0,0 +1,77 @@
+This fixes a build issue caused by linking order.
+
+Upstream-Status: Inappropriate
+Most distos have there own verison of this fix. This was derived by
+* Fix link order to list libraries after the objects that require them
+(LP: #771080).
+
+-- Colin Watson <cjwatson@ubuntu.com>  Tue, 13 Sep 2011 10:07:08 +0100
+
+
+signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: netkit-rsh-0.17/rsh/Makefile
+===================================================================
+--- netkit-rsh-0.17.orig/rsh/Makefile
++++ netkit-rsh-0.17/rsh/Makefile
+@@ -6,7 +6,7 @@ include ../MRULES
+ OBJS = rsh.o
+ 
+ rsh: $(OBJS)
+-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
+ 
+ install: rsh
+ 	install -o root -m$(SUIDMODE) rsh $(INSTALLROOT)$(BINDIR)
+Index: netkit-rsh-0.17/rshd/Makefile
+===================================================================
+--- netkit-rsh-0.17.orig/rshd/Makefile
++++ netkit-rsh-0.17/rshd/Makefile
+@@ -11,7 +11,7 @@ LIBS += -ldl -lpam
+ endif
+ 
+ rshd: $(OBJS)
+-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
+ 
+ install: rshd
+ 	install -m$(DAEMONMODE) rshd $(INSTALLROOT)$(SBINDIR)/in.rshd
+Index: netkit-rsh-0.17/rlogin/Makefile
+===================================================================
+--- netkit-rsh-0.17.orig/rlogin/Makefile
++++ netkit-rsh-0.17/rlogin/Makefile
+@@ -7,7 +7,7 @@ PROG=rlogin
+ OBJS=rlogin.o
+ 
+ $(PROG): $(OBJS)
+-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
+ 
+ install: $(PROG)
+ 	install -o root -m$(SUIDMODE) $(PROG) $(INSTALLROOT)$(BINDIR)
+Index: netkit-rsh-0.17/rlogind/Makefile
+===================================================================
+--- netkit-rsh-0.17.orig/rlogind/Makefile
++++ netkit-rsh-0.17/rlogind/Makefile
+@@ -13,7 +13,7 @@ LIBS += -ldl -lpam -lpam_misc
+ endif
+ 
+ rlogind: $(OBJS)
+-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
+ 
+ rlogind.o: pathnames.h logwtmp.h rlogind.h ../version.h
+ logwtmp.o: logwtmp.h
+Index: netkit-rsh-0.17/rexecd/Makefile
+===================================================================
+--- netkit-rsh-0.17.orig/rexecd/Makefile
++++ netkit-rsh-0.17/rexecd/Makefile
+@@ -24,7 +24,7 @@ endif
+ CFLAGS += -DRESTRICT_FTP=1
+ 
+ rexecd: rexecd.o
+-	$(CC) $(LDFLAGS) $^ $(LIBS) -o $@
++	$(CC) $^ -o $@ $(LDFLAGS) $(LIBS)
+ 
+ install: rexecd
+ 	install -m$(DAEMONMODE) rexecd $(INSTALLROOT)$(SBINDIR)/in.rexecd
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
new file mode 100644
index 0000000..ad59b62
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh/rsh.xinetd.netkit
@@ -0,0 +1,21 @@
+# default: off
+# description:
+# The rshd server is a server for the rcmd(3) routine and, 
+# consequently, for the rsh(1) program. The server provides 
+# remote execution facilities with authentication based on 
+# privileged port numbers from trusted hosts.
+#
+service shell
+{
+	socket_type	= stream
+	protocol	= tcp
+	flags		= NAMEINARGS
+	wait		= no
+	user		= root
+	group		= root
+	log_on_success	+= USERID
+	log_on_failure	+= USERID
+	server		= /usr/bin/tcpd
+	server_args	= /usr/sbin/in.rshd -aL
+	disable		= yes
+}
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
new file mode 100644
index 0000000..8b42fa7
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -0,0 +1,91 @@
+DESCRIPTION = "netkit-rsh includes the rsh daemon and client."
+SECTION = "networking"
+HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
+LICENSE = "BSD-4-Clause"
+DEPENDS = "xinetd libgcrypt"
+
+LIC_FILES_CHKSUM = "file://rsh/rsh.c;beginline=2;endline=3;md5=25737e9d21d9df251dd26b7dcbd8ee29"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=archive \
+            ${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}-15.diff.gz;name=patch15 \
+            file://rsh-redone_link_order_file.patch \
+            file://no_pam_build_fix.patch \
+            file://rexec.xinetd.netkit \
+            file://rlogin.xinetd.netkit \
+            file://rsh.xinetd.netkit \
+"
+
+SRC_URI[archive.md5sum] = "65f5f28e2fe22d9ad8b17bb9a10df096"
+SRC_URI[archive.sha256sum] = "edcac7fa18015f0bc04e573f3f54ae3b638d71335df1ad7dae692779914ad669"
+SRC_URI[patch15.md5sum] = "655efc0d541b03ca5de0ae506c805ea3"
+SRC_URI[patch15.sha256sum] = "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b1798694d9874733293bc2aa9"
+
+inherit pkgconfig
+
+CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
+LDFLAGS += " -L${STAGING_LIBDIR} -lutil -lcrypt"
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG += " ${@bb.utils.contains("DISTRO_FEATURES", "pam", "pam", "", d)}"
+PACKAGECONFIG[pam] = " , --without-pam, libpam, libpam"
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "INSTALLROOT=${D}" > MCONFIG
+
+    if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
+        echo "USE_PAM=1" >> MCONFIG
+    fi
+
+    # didn't want to patch these next changes
+    sed -i 's/netkit-//' ${S}/rsh/pathnames.h
+    sed -i 's/netkit-//' ${S}/rcp/pathnames.h
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${sbindir}
+    install -d ${D}${mandir}/man1
+    install -d ${D}${mandir}/man8
+    install -d ${D}${sysconfdir}/xinetd.d
+
+    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
+    'DAEMONMODE=0755' 'MANMODE=0644' \
+    'SUIDMODE=4755' \
+    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' install
+
+    if [ "${@base_contains('PACKAGECONFIG', 'pam', 'pam', '', d)}" != "" ]; then
+        install -d ${D}${sysconfdir}/pam.d
+        install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
+        install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
+        install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
+        install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
+    fi
+    cp ${WORKDIR}/rexec.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rexec
+    cp ${WORKDIR}/rlogin.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rlogin
+    cp ${WORKDIR}/rsh.xinetd.netkit  ${D}/${sysconfdir}/xinetd.d/rsh
+}
+
+PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
+
+FILES_${PN}-client = "${bindir}/*"
+FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
+FILES_${PN}-doc = "${mandir}"
+FILES_${PN}-dbg = "${prefix}/src/debug \
+                   ${sbindir}/.debug ${bindir}/.debug"
+
+ALTERNATIVE_PRIORITY = "80"
+ALTERNATIVE_${PN}-client = "rcp rexec rlogin rsh"
+ALTERNATIVE_${PN}-server = "rshd rexecd rlogind"
+ALTERNATIVE_LINK_NAME[server] = "${bindir}/rshd"
+ALTERNATIVE_TARGET[rshd] = "${sbindir}/in.rshd"
+ALTERNATIVE_LINK_NAME[rexecd] = "${bindir}/rexecd"
+ALTERNATIVE_TARGET[rexecd] = "${sbindir}/in.rexecd"
+ALTERNATIVE_LINK_NAME[rlogind] = "${bindir}/rlogind"
+ALTERNATIVE_TARGET[rlogind] = "${sbindir}/in.rlogind"
+
+RCONFLICTS_${PN}-client += "inetutils-rshd"
+RPROVIDES_${PN}-rshd = "rshd"
+
+RDEPENDS_${PN} = "xinetd"
-- 
1.9.1


