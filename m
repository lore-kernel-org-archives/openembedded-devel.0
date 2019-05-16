Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 940A17DF0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 07:27:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 454NKg1JCXz3G
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2019 09:27:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557991639;
	bh=HdnWCjRRm20HU8kJudgU+1VOQnXT6CpUjlBumTPzu+E=;
	h=From:To:Subject:Date:From;
	b=nkljTnbDVEsEJmU0TJCgWPBKXAfmN1IaFEWcTvNODVR/Uw9GuotGUHy/Wcd7YlYjJ
	QBsjqPq5uqbp8EtY0GmOk8hmvGeE5+O71BHPK9kDBvfJ1gbRiXDdUzNBv4yQwqDDcE
	DKJv4ZVWsu5GkIO15xnM6+uFF4vK3VNIcjZB7jDKVNQsRXJcHaH0erUFHisBYoneui
	q0IltKZFiX2TwFs3ms+GUZOB8K1ZAmabIXw3OnDyClf9NrnFxa/TE2uB0iHtZgtuhy
	6JOMz3qpRWsjBcGXoOH9gR+JUgtSSS/7ByGRGWuQE9Te2FlWtfNHN3MGEXvEpVnHCx
	BW31D4RjBZZ5eUyNLQ3PYLHUFsFCnfIU0ctLco2M0SdVE9p7En/64rOE3il6TRxsn/
	U02VDNMYb6d5YbrIuxXaieV4bV/J5MwZhDu3fPnwFpSkb6jUpGTXdQsugRPuDLVCWU
	BT4sXdFoIv+8JXkvIxgH3csvx92wA/G+uGtNe3+Iy/xqf0yo+w6+VeJ0rS4dSY/iFh
	vyy/Op864pfzCNwz+nA7x4JiPHZMDN6JLshXJQso1w75e6S8MhFVZhuGR8hvN3rMPr
	FE2c40uAb5KjqCKHoeKBq+LvKimj4dEhQRCwzHvPHd6dFz6kukCjSndXwdc6910n91
	cPqzWuaYwQIbxbIjFwAz4DQ0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 May 2019 10:27:18 +0300
Message-Id: <20190516072718.2384-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] Add irda-utils
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
X-List-Received-Date: Thu, 16 May 2019 07:27:19 -0000

Removed from oe-core since IrDA support was removed in kernel 4.17,
added here in case there are users left on older kernels.

RRECOMMENDS are the former RRECOMMENDS_packagegroup-base-irda.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../irda-utils/irda-utils-0.9.18/init         | 78 +++++++++++++++++
 .../irda-utils-0.9.18/ldflags.patch           | 87 +++++++++++++++++++
 .../irda-utils/irda-utils-0.9.18/musl.patch   | 29 +++++++
 .../irda-utils/irda-utils_0.9.18.bb           | 64 ++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100755 meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/init
 create mode 100644 meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/ldflags.patch
 create mode 100644 meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/musl.patch
 create mode 100644 meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb

diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/init b/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/init
new file mode 100755
index 000000000..6f29e9c6e
--- /dev/null
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/init
@@ -0,0 +1,78 @@
+#! /bin/sh
+### BEGIN INIT INFO
+# Provides:          irda
+# Required-Start:    $network $remote_fs
+# Required-Stop:     $network $remote_fs
+# Default-Start:     2 3 4 5
+# Default-Stop:      0 1 6
+# Short-Description: Infrared port support
+### END INIT INFO
+
+NAME="irattach"
+test -x "$IRDA_DAEMON" || IRDA_DAEMON=/usr/sbin/irattach
+test -z "$IRATTACH_PID" && IRATTACH_PID=/var/run/irattach.pid
+
+# Source function library.
+. /etc/init.d/functions
+
+module_id() {
+        awk 'BEGIN { FS=": " } /Hardware/ { print $2 } ' </proc/cpuinfo
+}
+
+if [ ! -f /etc/sysconfig/irda ]; then
+    case `module_id` in
+	"HP iPAQ H2200" | "HP iPAQ HX4700" | "HTC Universal")
+	    IRDA=yes
+	    DEVICE=/dev/ttyS2
+	    DONGLE=
+	    DISCOVERY=
+	    ;;
+	*)
+	    IRDA=yes
+	    DEVICE=/dev/ttyS1
+	    DONGLE=
+	    DISCOVERY=
+	    ;;
+    esac
+else
+    . /etc/sysconfig/irda
+fi
+
+# Check that irda is up.
+[ ${IRDA} = "no" ] && exit 0
+
+[ -f /usr/sbin/irattach ] || exit 0
+
+ARGS=
+if [ $DONGLE ]; then
+	ARGS="$ARGS -d $DONGLE"
+fi
+if [ "$DISCOVERY" = "yes" ];then
+	ARGS="$ARGS -s"
+fi
+
+case "$1" in
+  start)
+	echo -n "Starting IrDA: $NAME"
+	start-stop-daemon --start --quiet --exec "$IRDA_DAEMON" ${DEVICE} ${ARGS} --pidfile "$IRATTACH_PID"
+	sleep 1
+	[ -f /var/run/irattach.pid ] && echo " done" || echo " fail"
+	;;
+  stop)
+	echo "Stopping IrDA: $NAME"
+	start-stop-daemon --stop --quiet --exec "$IRDA_DAEMON" --pidfile "$IRATTACH_PID"
+	;;
+  restart|force-reload)
+	$0 stop
+	$0 start
+	;;
+  status)
+	status irattach
+	exit $?
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload|status}" >&2
+	exit 1
+	;;
+esac
diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/ldflags.patch b/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/ldflags.patch
new file mode 100644
index 000000000..b246de8f5
--- /dev/null
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/ldflags.patch
@@ -0,0 +1,87 @@
+Obey LDFLAGS
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+Upstream-Status: Pending
+
+Index: irda-utils-0.9.18/findchip/Makefile
+===================================================================
+--- irda-utils-0.9.18.orig/findchip/Makefile
++++ irda-utils-0.9.18/findchip/Makefile
+@@ -65,5 +65,5 @@ install: findchip
+ 
+ gfindchip: gfindchip.c 
+ 	$(prn_cc)
+-	$(ECMD))$(CC) $(CFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `gtk-config --cflags`  $< -o $@ `gtk-config --libs`
+ 
+Index: irda-utils-0.9.18/irattach/Makefile
+===================================================================
+--- irda-utils-0.9.18.orig/irattach/Makefile
++++ irda-utils-0.9.18/irattach/Makefile
+@@ -49,13 +49,13 @@ all: $(TARGETS)
+ 
+ irattach: irattach.o util.o
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) irattach.o util.o -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) irattach.o util.o -o $@
+ 
+ 
+ 
+ dongle_attach: dongle_attach.o
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) dongle_attach.o -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) dongle_attach.o -o $@
+ 
+ 
+ install: $(TARGETS)
+Index: irda-utils-0.9.18/irdadump/Makefile
+===================================================================
+--- irda-utils-0.9.18.orig/irdadump/Makefile
++++ irda-utils-0.9.18/irdadump/Makefile
+@@ -40,7 +40,7 @@ lib_irdadump.a: $(LIBIRDADUMP_OBJS)
+ 
+ irdadump: $(IRDADUMP_OBJS) $(LIBIRDADUMP_TARGET)
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) `pkg-config --libs glib-2.0` -o  $(IRDADUMP_TARGET) $< $(LIBIRDADUMP_TARGET)
+ 
+ 
+ .c.o:
+Index: irda-utils-0.9.18/irdaping/Makefile
+===================================================================
+--- irda-utils-0.9.18.orig/irdaping/Makefile
++++ irda-utils-0.9.18/irdaping/Makefile
+@@ -56,7 +56,7 @@ all: $(TARGETS)
+ 
+ irdaping: $(OBJS)
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
+ 
+ 
+ .c.o:
+Index: irda-utils-0.9.18/irnetd/Makefile
+===================================================================
+--- irda-utils-0.9.18.orig/irnetd/Makefile
++++ irda-utils-0.9.18/irnetd/Makefile
+@@ -50,7 +50,7 @@ all: $(TARGETS)
+ 
+ irnetd: $(OBJS)
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) $(OBJS) -o $@
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) -o $@
+ 
+ 
+ install: irnetd
+Index: irda-utils-0.9.18/psion/Makefile
+===================================================================
+--- irda-utils-0.9.18.orig/psion/Makefile
++++ irda-utils-0.9.18/psion/Makefile
+@@ -25,4 +25,4 @@ install: $(PSION_TARGETS)
+ CFLAGS += -g -I../include -Wall -Wstrict-prototypes $(RPM_OPT_FLAGS)
+ irpsion5: 
+ 	$(prn_cc_o)
+-	$(ECMD)$(CC) $(CFLAGS) $(PSION_SRC) -o $@
+\ No newline at end of file
++	$(ECMD)$(CC) $(CFLAGS) $(LDFLAGS) $(PSION_SRC) -o $@
+\ No newline at end of file
diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/musl.patch b/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/musl.patch
new file mode 100644
index 000000000..97eb97502
--- /dev/null
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils-0.9.18/musl.patch
@@ -0,0 +1,29 @@
+Replace use of <net/if_packet.h> with <linux/if_packet.h>.
+
+kernel headers <linux/if_packet.h> already provides the
+needed definitions, moreover not all libc implementations
+provide if_packet.h e.g. musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+
+Index: irda-utils-0.9.18/irdaping/irdaping.c
+===================================================================
+--- irda-utils-0.9.18.orig/irdaping/irdaping.c
++++ irda-utils-0.9.18/irdaping/irdaping.c
+@@ -33,7 +33,6 @@
+ #include <sys/socket.h>
+ #include <sys/ioctl.h>
+ #include <net/if.h>		/* For struct ifreq */
+-#include <net/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <net/if_arp.h>		/* For ARPHRD_IRDA */
+ #include <netinet/if_ether.h>	/* For ETH_P_ALL */
+ #include <netinet/in.h>		/* For htons */
+@@ -46,6 +45,7 @@
+ #include <asm/byteorder.h>	/* __cpu_to_le32 and co. */
+ 
+ #include <linux/types.h>	/* For __u8 and co. */
++#include <linux/if_packet.h>	/* For struct sockaddr_pkt */
+ #include <irda.h>
+ 
+ #ifndef AF_IRDA
diff --git a/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
new file mode 100644
index 000000000..caffcb696
--- /dev/null
+++ b/meta-oe/recipes-bsp/irda-utils/irda-utils_0.9.18.bb
@@ -0,0 +1,64 @@
+SUMMARY = "Common files for IrDA"
+DESCRIPTION = "Provides common files needed to use IrDA. \
+IrDA allows communication over Infrared with other devices \
+such as phones and laptops."
+HOMEPAGE = "http://irda.sourceforge.net/"
+BUGTRACKER = "http://sourceforge.net/p/irda/bugs/"
+SECTION = "base"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://irdadump/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://smcinit/COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
+                    file://man/COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
+                    file://irdadump/irdadump.c;beginline=1;endline=24;md5=d78b9dce3cd78c2220250c9c7a2be178"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/irda/irda-utils-${PV}.tar.gz \
+           file://ldflags.patch \
+           file://musl.patch \
+           file://init"
+
+SRC_URI[md5sum] = "84dc12aa4c3f61fccb8d8919bf4079bb"
+SRC_URI[sha256sum] = "61980551e46b2eaa9e17ad31cbc1a638074611fc33bff34163d10c7a67a9fdc6"
+
+inherit update-rc.d
+
+RRECOMMENDS_${PN} = "\
+    kernel-module-pxaficp-ir \
+    kernel-module-irda \
+    kernel-module-ircomm \
+    kernel-module-ircomm-tty \
+    kernel-module-irlan \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ppp', 'kernel-module-irnet', '',d)} \
+    kernel-module-irport \
+    kernel-module-irtty \
+    kernel-module-irtty-sir \
+    kernel-module-sir-dev \
+    ${@bb.utils.contains('COMBINED_FEATURES', 'usbhost', 'kernel-module-ir-usb', '',d)} "
+
+EXTRA_OEMAKE = "\
+    'CC=${CC}' \
+    'LD=${LD}' \
+    'CFLAGS=${CFLAGS}' \
+    'LDFLAGS=${LDFLAGS}' \
+    'SYS_INCLUDES=' \
+    'V=1' \
+"
+
+INITSCRIPT_NAME = "irattach"
+INITSCRIPT_PARAMS = "defaults 20"
+
+TARGETS ??= "irattach irdaping"
+do_compile () {
+	for t in ${TARGETS}; do
+		oe_runmake -C $t
+	done
+}
+
+do_install () {
+	install -d ${D}${sbindir}
+	for t in ${TARGETS}; do
+		oe_runmake -C $t ROOT="${D}" install
+	done
+
+	install -d ${D}${sysconfdir}/init.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/${INITSCRIPT_NAME}
+}
-- 
2.17.1


