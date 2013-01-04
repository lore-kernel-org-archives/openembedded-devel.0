Received: from mail-pb0-f46.google.com ([209.85.160.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygs-0001zH-AN
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:54 +0100
Received: by mail-pb0-f46.google.com with SMTP id wy7so8862443pbc.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=kB0eWoA39RCnIPaCem5rpKnBEwlZsFvvSQlxrExOs+w=;
	b=wprXkL6vKSyhAVEiKycKWUA9Y5F+7Qi5i6KwZkoRs2oYLiv6xTgBGN5Uyl1RoKsEep
	XrF56PPImGowf1E6Q9Olpdp+g5RN/bhXhxjSQhlEyeO4Tn/EI4ToQcKXZsP1tKTHhmmx
	y9Fp5AlOsP2retP386hrgxpPvPoxgofF8KXxxS2HYrdyvSKtrufJIUciQ4kk+o0weoMQ
	yKSfMsSiXerXb23cCLNJ2NotMSNcLehWlJdUVp+jGGZOCNPWnp+1tDW3MxwQjDgU52Uz
	bw1lT3ZGmOw0uV+rv4/XNx2u+nhcb64pK6wlBGpwsvpy6kPz/A3X5m62AjVw7pjhVove
	R6bg==
X-Received: by 10.66.77.200 with SMTP id u8mr151049035paw.43.1357272022934;
	Thu, 03 Jan 2013 20:00:22 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:32 -0800
Message-Id: <1357271974-3317-10-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/13] arptables: Import recipe from OE-Classic and update to latest
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
X-List-Received-Date: Fri, 04 Jan 2013 04:16:32 -0000

Make LICENSE more specific
Add LIC_FILES_CHKSUM

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../arptables-compile-install.patch                |   61 ++++++++++++++++
 .../arptables-0.0.3-4/arptables-init-busybox.patch |   77 ++++++++++++++++++++
 .../recipes-support/arptables/arptables_0.0.3-4.bb |   23 ++++++
 3 files changed, 161 insertions(+)
 create mode 100644 meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch
 create mode 100644 meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-init-busybox.patch
 create mode 100644 meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb

diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch
new file mode 100644
index 0000000..80e9804
--- /dev/null
+++ b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-compile-install.patch
@@ -0,0 +1,61 @@
+Index: arptables-v0.0.3-4/Makefile
+===================================================================
+--- arptables-v0.0.3-4.orig/Makefile	2010-03-08 18:49:28.000000000 +0300
++++ arptables-v0.0.3-4/Makefile	2010-03-22 15:52:56.000000000 +0300
+@@ -6,12 +6,11 @@
+ LIBDIR:=$(PREFIX)/lib
+ BINDIR:=$(PREFIX)/sbin
+ MANDIR:=$(PREFIX)/man
+-INITDIR:=/etc/rc.d/init.d
++INITDIR:=/etc/init.d
+ SYSCONFIGDIR:=/etc/sysconfig
+ DESTDIR:=
+ 
+-COPT_FLAGS:=-O2
+-CFLAGS:=$(COPT_FLAGS) -Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\" #-g -DDEBUG #-pg # -DARPTC_DEBUG
++ARPCFLAGS:=-Wall -Wunused -I$(KERNEL_DIR)/include/ -Iinclude/ -DARPTABLES_VERSION=\"$(ARPTABLES_VERSION)\"
+ 
+ ifndef ARPT_LIBDIR
+ ARPT_LIBDIR:=$(LIBDIR)/arptables
+@@ -22,16 +21,16 @@
+ all: arptables
+ 
+ arptables.o: arptables.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS) $(ARPCFLAGS) -c -o $@ $<
+ 
+ arptables-standalone.o: arptables-standalone.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS) $(ARPCFLAGS) -c -o $@ $<
+ 
+ libarptc/libarptc.o: libarptc/libarptc.c libarptc/libarptc_incl.c
+-	$(CC) $(CFLAGS) -c -o $@ $<
++	$(CC) $(CFLAGS) $(ARPCFLAGS) -c -o $@ $<
+ 
+ arptables: arptables-standalone.o arptables.o libarptc/libarptc.o $(EXT_OBJS)
+-	$(CC) $(CFLAGS) -o $@ $^
++	$(CC) $(LDFLAGS) $(CFLAGS) $(ARPCFLAGS) -o $@ $^
+ 
+ $(DESTDIR)$(MANDIR)/man8/arptables.8: arptables.8
+ 	mkdir -p $(@D)
+@@ -50,6 +49,7 @@
+ 	cat arptables-restore | sed 's/__EXEC_PATH__/$(tmp1)/g' > arptables-restore_
+ 	install -m 0755 -o root -g root arptables-restore_ $(DESTDIR)$(BINDIR)/arptables-restore
+ 	cat arptables.sysv | sed 's/__EXEC_PATH__/$(tmp1)/g' | sed 's/__SYSCONFIG__/$(tmp2)/g' > arptables.sysv_
++	install -d $(DESTDIR)$(INITDIR)
+ 	if test -d $(DESTDIR)$(INITDIR); then install -m 0755 -o root -g root arptables.sysv_ $(DESTDIR)$(INITDIR)/arptables; fi
+ 	rm -f arptables-save_ arptables-restore_ arptables.sysv_
+ 
+Index: arptables-v0.0.3-4/extensions/Makefile
+===================================================================
+--- arptables-v0.0.3-4.orig/extensions/Makefile	2010-03-08 18:49:28.000000000 +0300
++++ arptables-v0.0.3-4/extensions/Makefile	2010-03-22 15:52:38.000000000 +0300
+@@ -4,4 +4,7 @@
+ EXT_OBJS+=$(foreach T,$(EXT_FUNC), extensions/arpt_$(T).o)
+ 
+ extensions/ebt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
+-	$(CC) $(CFLAGS) $(PROGSPECS) -c -o $@ $<
++	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
++
++extensions/arpt_%.o: extensions/arpt_%.c include/arptables.h include/arptables_common.h
++	$(CC) $(CFLAGS) $(ARPCFLAGS) $(PROGSPECS) -c -o $@ $<
diff --git a/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-init-busybox.patch b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-init-busybox.patch
new file mode 100644
index 0000000..24956c4
--- /dev/null
+++ b/meta-networking/recipes-support/arptables/arptables-0.0.3-4/arptables-init-busybox.patch
@@ -0,0 +1,77 @@
+Index: arptables-v0.0.3-4/arptables.sysv
+===================================================================
+--- arptables-v0.0.3-4.orig/arptables.sysv	2010-03-22 16:28:03.000000000 +0300
++++ arptables-v0.0.3-4/arptables.sysv	2010-03-22 16:27:51.000000000 +0300
+@@ -12,10 +12,10 @@
+ # config: __SYSCONFIG__/arptables
+ 
+ source /etc/init.d/functions
+-source /etc/sysconfig/network
++# source /etc/sysconfig/network
+ 
+ # Check that networking is up.
+-[ ${NETWORKING} = "no" ] && exit 0
++# [ ${NETWORKING} = "no" ] && exit 0
+ 
+ [ -x __EXEC_PATH__/arptables ] || exit 1
+ [ -x __EXEC_PATH__/arptables-save ] || exit 1
+@@ -28,32 +28,30 @@
+ desc="Arp filtering"
+ 
+ start() {
+-	echo -n $"Starting $desc ($prog): "
++	echo -n "Starting $desc ($prog): "
+ 	__EXEC_PATH__/arptables-restore < __SYSCONFIG__/arptables || RETVAL=1
+ 
+ 	if [ $RETVAL -eq 0 ]; then
+-		success "$prog startup"
+-		rm -f /var/lock/subsys/$prog
++		echo "$prog ok"
++		touch /var/lock/subsys/$prog
+ 	else
+-		failure "$prog startup"
++		echo "$prog failed"
+ 	fi
+ 
+-	echo
+ 	return $RETVAL
+ }
+ 
+ stop() {
+-	echo -n $"Stopping $desc ($prog): "
++	echo -n "Stopping $desc ($prog): "
+ 	__EXEC_PATH__/arptables-restore < /dev/null || RETVAL=1
+ 
+ 	if [ $RETVAL -eq 0 ]; then
+-		success "$prog shutdown"
+-		rm -f %{_localstatedir}/lock/subsys/$prog
++		echo "$prog stopped"
++		rm -f /var/lock/subsys/$prog
+ 	else
+-		failure "$prog shutdown"
++		echo "$prog failed to stop"
+ 	fi
+ 
+-	echo
+ 	return $RETVAL
+ }
+ 
+@@ -63,15 +61,14 @@
+ }
+ 
+ save() {
+-	echo -n $"Saving $desc ($prog): "
++	echo -n "Saving $desc ($prog): "
+ 	__EXEC_PATH__/arptables-save > __SYSCONFIG__/arptables || RETVAL=1
+ 
+ 	if [ $RETVAL -eq 0 ]; then
+-		success "$prog saved"
++		echo "$prog saved"
+ 	else
+-		failure "$prog saved"
++		echo "$prog is not saved"
+ 	fi
+-	echo
+ }
+ 
+ case "$1" in
diff --git a/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
new file mode 100644
index 0000000..71e2600
--- /dev/null
+++ b/meta-networking/recipes-support/arptables/arptables_0.0.3-4.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Administration tool for arp packet filtering"
+PRIORITY = "optional"
+LICENSE = "GPL-2.0"
+SECTION = "console/network"
+
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+SRC_URI = " \
+	${SOURCEFORGE_MIRROR}/ebtables/arptables-v${PV}.tar.gz;name=arptables \
+	file://arptables-compile-install.patch \
+	file://arptables-init-busybox.patch \
+	"
+SRC_URI[arptables.md5sum] = "1d4ab05761f063b0751645d8f2b8f8e5"
+SRC_URI[arptables.sha256sum] = "e529fd465c67d69ad335299a043516e6b38cdcd337a5ed21718413e96073f928"
+
+S = "${WORKDIR}/arptables-v${PV}"
+
+do_compile () {
+	oe_runmake
+}
+
+fakeroot do_install () {
+	oe_runmake 'BINDIR=${sbindir}' 'MANDIR=${mandir}/' 'DESTDIR=${D}' install
+}
-- 
1.7.9.5



