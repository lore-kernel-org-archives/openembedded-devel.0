Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 60F747239E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Nov 2014 05:34:19 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so6049164pdi.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Nov 2014 21:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=93KaQwVaMxN2Tyn4x1i5iRjjzCxiR+p9mhfW9u2qwr0=;
	b=XlWpaM5pCBdOnIcjNcn9bdAYYBit/rz6QqiTofO3IcJD7zH+uz4q6dd+CyuhTgwdWf
	hGn+AmdgkZDxRBn8gfHlXldY6qj0UdwZBcTyRJ1GZb7T0E4VK6Pqf6SN2fz5YL2UH4Z6
	swZzXJ/i97vtkGWLkkIFKwjRJzs5R4rlSiGACjdKregi0fAAKsOIRdSsuNYejjDg0Qix
	N0RDOhn711Zx+tp0uSE8s4Dggo8W6LM802YLKrsCP6SvGpiheXH9dP1hH17yc3jAzhM6
	iRg6BSxK0Pph+aejjnbHsPzYf0GbcBYKcd/NCJupW6hiV6NPQV06Nw7h88DowjzaenFI
	IMVw==
X-Received: by 10.68.135.65 with SMTP id pq1mr68574198pbb.18.1417152860615;
	Thu, 27 Nov 2014 21:34:20 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id x10sm8696360pdr.11.2014.11.27.21.34.18
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 27 Nov 2014 21:34:19 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Nov 2014 21:34:03 -0800
Message-Id: <1417152844-23643-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
References: <1417152844-23643-1-git-send-email-akuster808@gmail.com>
Subject: [meta-networking][PATCH 1/2] New package: netkit-rsh
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
X-List-Received-Date: Fri, 28 Nov 2014 05:34:20 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/rsh-redone_link_order_file.patch         | 64 ++++++++++++++++++++++
 .../recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb   | 61 +++++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
 create mode 100644 meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb

diff --git a/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch b/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
new file mode 100644
index 0000000..bded510
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/files/rsh-redone_link_order_file.patch
@@ -0,0 +1,64 @@
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
diff --git a/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
new file mode 100644
index 0000000..6874950
--- /dev/null
+++ b/meta-networking/recipes-netkit/netkit-rsh/netkit-rsh_0.17.bb
@@ -0,0 +1,61 @@
+DESCRIPTION = "netkit-rsh includes the rsh daemon and client."
+SECTION = "networking"
+HOMEPAGE="ftp://ftp.uk.linux.org/pub/linux/Networking/netkit"
+LICENSE = "BSD"
+DEPENDS = "libpam libgcrypt"
+
+LIC_FILES_CHKSUM = "file://rsh/rsh.c;beginline=2;endline=3;md5=25737e9d21d9df251dd26b7dcbd8ee29"
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}.orig.tar.gz;name=archive \
+            ${DEBIAN_MIRROR}/main/n/netkit-rsh/netkit-rsh_${PV}-15.diff.gz;name=patch15 \
+            file://rsh-redone_link_order_file.patch \
+"
+
+SRC_URI[archive.md5sum] = "65f5f28e2fe22d9ad8b17bb9a10df096"
+SRC_URI[archive.sha256sum] = "edcac7fa18015f0bc04e573f3f54ae3b638d71335df1ad7dae692779914ad669"
+SRC_URI[patch15.md5sum] = "655efc0d541b03ca5de0ae506c805ea3"
+SRC_URI[patch15.sha256sum] = "2bc071c438e8b0ed42a0bd2db2d8b681b27a1e9b1798694d9874733293bc2aa9"
+
+inherit distro_features_check
+
+CFLAGS += " -D_GNU_SOURCE -Wno-deprecated-declarations"
+LDFLAGS += " -lutil"
+
+do_configure () {
+    ./configure --prefix=${prefix}
+    echo "USE_PAM=1" >> MCONFIG
+    echo "LDFLAGS=${LDFLAGS}" >> MCONFIG
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
+    install -d ${D}${sysconfdir}/pam.d
+
+    oe_runmake 'INSTALLROOT=${D}' 'BINMODE=0755' \
+    'DAEMONMODE=0755' 'MANMODE=0644' \
+    'SUIDMODE=4755' \
+    'BINDIR=${bindir}' 'SBINDIR=${sbindir}' \
+    'MANDIR=${mandir}' install
+
+    install -m 0644 debian/hosts.equiv ${D}/${sysconfdir}
+    install -m 0644 debian/pam.d/rexec ${D}/${sysconfdir}/pam.d
+    install -m 0644 debian/pam.d/rlogin ${D}/${sysconfdir}/pam.d
+    install -m 0644 debian/pam.d/rsh ${D}/${sysconfdir}/pam.d
+}
+
+PACKAGES = "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
+FILES_${PN}-client = "${bindir}/*"
+FILES_${PN}-server = "${sbindir}/* ${sysconfdir}"
+FILES_${PN}-doc = "${mandir}"
+FILES_${PN}-dbg = "${prefix}/src/debug \
+                   ${sbindir}/.debug ${bindir}/.debug"
+
+RDEPENDS_${PN} = "libpam"
+REQUIRED_DISTRO_FEATURES ?= "pam"
-- 
1.9.1


