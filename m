Return-Path: <B40290@freescale.com>
Received: from ch1outboundpool.messaging.microsoft.com
	(ch1ehsobe002.messaging.microsoft.com [216.32.181.182])
	by mail.openembedded.org (Postfix) with ESMTP id 477F46D3C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 02:40:04 +0000 (UTC)
Received: from mail144-ch1-R.bigfish.com (10.43.68.239) by
	CH1EHSOBE016.bigfish.com (10.43.70.66) with Microsoft SMTP Server id
	14.1.225.22; Mon, 4 Nov 2013 02:40:05 +0000
Received: from mail144-ch1 (localhost [127.0.0.1])	by
	mail144-ch1-R.bigfish.com (Postfix) with ESMTP id 7CEC9A0249	for
	<openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 02:40:05 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz936eIzz1f42h208ch1ee6h1de0h1fdah2073h2146h1202h1e76h1d1ah1d2ah1fc6hzz1de098h17326ah8275bh8275dh1de097h186068hz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh2222h1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h2218h2216h1155h)
Received: from mail144-ch1 (localhost.localdomain [127.0.0.1]) by mail144-ch1
	(MessageSwitch) id 1383532803775952_11553;
	Mon,  4 Nov 2013 02:40:03 +0000 (UTC)
Received: from CH1EHSMHS027.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.253])	by mail144-ch1.bigfish.com (Postfix) with ESMTP id
	B98761C0055	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Nov 2013 02:40:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS027.bigfish.com
	(10.43.70.27) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Mon, 4 Nov 2013 02:40:03 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-004.039d.mgd.msft.net (10.84.1.14) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Mon, 4 Nov 2013 02:40:02 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id rA42dxTE009145;	Sun, 3 Nov 2013 19:40:00 -0700
From: <b40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 4 Nov 2013 10:39:56 +0800
Message-ID: <1383532796-31088-1-git-send-email-b40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [meta-networking][PATCH v3 1/3] snort: add recipe
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
X-List-Received-Date: Mon, 04 Nov 2013 02:40:04 -0000
Content-Type: text/plain

From: Chunrong Guo <B40290@freescale.com>

  *snort - a free lightweight network intrusion detection
         system for UNIX and Windows

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../snort/files/disable-dap-address-space-id.patch |   52 +++++++++
 .../snort/files/disable-inaddr-none.patch          |   75 ++++++++++++++
 .../recipes-connectivity/snort/files/snort.init    |  109 ++++++++++++++++++++
 .../recipes-connectivity/snort/snort_2.9.4.6.bb    |   71 +++++++++++++
 4 files changed, 307 insertions(+), 0 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
 create mode 100644 meta-networking/recipes-connectivity/snort/files/snort.init
 create mode 100644 meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb

diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch b/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
new file mode 100644
index 0000000..39e5c9c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
@@ -0,0 +1,52 @@
+Upstream-Status:Inappropriate [embedded specific]
+
+fix the below error:
+checking for dap address space id... configure: 
+configure: error: cannot run test program while cross compiling
+
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+--- a/configure.in	2013-08-23 00:06:37.239361932 -0500
++++ b/configure.in	2013-08-23 00:07:32.860266534 -0500
+@@ -679,23 +679,23 @@
+ 
+ AC_CHECK_FUNCS([daq_hup_apply] [daq_acquire_with_meta])
+ 
+-AC_MSG_CHECKING([for daq address space ID])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <daq.h>
+-]],
+-[[
+-   DAQ_PktHdr_t hdr;
+-   hdr.address_space_id = 0;
+-]])],
+-[have_daq_address_space_id="yes"],
+-[have_daq_address_space_id="no"])
+-AC_MSG_RESULT($have_daq_address_space_id)
+-if test "x$have_daq_address_space_id" = "xyes"; then
+-    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
+-        [DAQ version supports address space ID in header.])
+-fi
++#AC_MSG_CHECKING([for daq address space ID])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <daq.h>
++#]],
++#[[
++#   DAQ_PktHdr_t hdr;
++#   hdr.address_space_id = 0;
++#]])],
++have_daq_address_space_id="yes"
++#[have_daq_address_space_id="no"])
++#AC_MSG_RESULT($have_daq_address_space_id)
++#if test "x$have_daq_address_space_id" = "xyes"; then
++#    AC_DEFINE([HAVE_DAQ_ADDRESS_SPACE_ID],[1],
++#        [DAQ version supports address space ID in header.])
++#fi
+ 
+ # any sparc platform has to have this one defined.
+ AC_MSG_CHECKING(for sparc)
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
new file mode 100644
index 0000000..9dafe63
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
@@ -0,0 +1,75 @@
+Upstream-Status: Inappropriate [embedded specific]
+
+fix the below error:
+checking for INADDR_NONE... configure:
+configure: error: cannot run test program while cross compiling
+
+Signed-off-by: Chunrong Guo <B40290@freescale.com>
+
+
+--- a/configure.in	2013-08-21 03:56:17.197414789 -0500
++++ b/configure.in	2013-08-21 23:19:05.298553560 -0500
+@@ -281,25 +281,7 @@
+ AC_CHECK_TYPES([boolean])
+ 
+ # In case INADDR_NONE is not defined (like on Solaris)
+-have_inaddr_none="no"
+-AC_MSG_CHECKING([for INADDR_NONE])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <sys/types.h>
+-#include <netinet/in.h>
+-#include <arpa/inet.h>
+-]],
+-[[
+-	if (inet_addr("10,5,2") == INADDR_NONE);
+-    return 0;
+-]])],
+-[have_inaddr_none="yes"],
+-[have_inaddr_none="no"])
+-AC_MSG_RESULT($have_inaddr_none)
+-if test "x$have_inaddr_none" = "xno"; then
+-	AC_DEFINE([INADDR_NONE],[-1],[For INADDR_NONE definition])
+-fi
++have_inaddr_none="yes"
+ 
+ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include <stdio.h>
+@@ -397,21 +379,21 @@
+   fi
+ fi
+ 
+-AC_MSG_CHECKING([for pcap_lex_destroy])
+-AC_RUN_IFELSE(
+-[AC_LANG_PROGRAM(
+-[[
+-#include <pcap.h>
+-]],
+-[[
+-   pcap_lex_destroy();
+-]])],
+-[have_pcap_lex_destroy="yes"],
+-[have_pcap_lex_destroy="no"])
+-AC_MSG_RESULT($have_pcap_lex_destroy)
+-if test "x$have_pcap_lex_destroy" = "xyes"; then
+-    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
+-fi
++#AC_MSG_CHECKING([for pcap_lex_destroy])
++#AC_RUN_IFELSE(
++#[AC_LANG_PROGRAM(
++#[[
++##include <pcap.h>
++#]],
++#[[
++#   pcap_lex_destroy();
++#]])],
++have_pcap_lex_destroy="yes"
++#[have_pcap_lex_destroy="no"])
++#AC_MSG_RESULT($have_pcap_lex_destroy)
++#if test "x$have_pcap_lex_destroy" = "xyes"; then
++#    AC_DEFINE([HAVE_PCAP_LEX_DESTROY],[1],[Can cleanup lex buffer stack created by pcap bpf filter])
++#fi
+ 
+ AC_MSG_CHECKING([for pcap_lib_version])
+ AC_LINK_IFELSE(
diff --git a/meta-networking/recipes-connectivity/snort/files/snort.init b/meta-networking/recipes-connectivity/snort/files/snort.init
new file mode 100644
index 0000000..91cb343
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/files/snort.init
@@ -0,0 +1,109 @@
+#!/bin/sh
+#
+#   Snort Startup Script modified for OpenEmbedded
+#
+
+# Script variables
+
+LAN_INTERFACE="$2"
+RETURN_VAL=0
+BINARY=/usr/bin/snort
+PATH=/bin:/usr/bin
+PID=/var/run/snort_${LAN_INTERFACE}_ids.pid
+DEL_PID=$PID
+LOGDIR="/var/log/snort"
+DATE=`/bin/date +%Y%m%d`
+CONFIG_FILE=/etc/snort/snort.conf
+PROG=snort
+USER=root
+GROUP=root
+
+if [ ! -x "$BINARY" ]; then
+    echo "ERROR: $BINARY not found."
+    exit 1
+fi
+                                                                                
+if [ ! -r "$CONFIG_FILE" ]; then
+    echo "ERROR: $CONFIG_FILE not found."
+    exit 1
+fi
+
+start()
+{
+     
+    [ -n "$LAN_INTERFACE" ] || return 0
+    # Check if log diratory is present. Otherwise, create it.
+    if [ ! -d $LOGDIR/$DATE ]; then 
+        mkdir -d $LOGDIR/$DATE
+        /bin/chown -R $USER:$USER $LOGDIR/$DATE
+    /bin/chmod -R 700 $LOGDIR/$DATE
+    fi
+
+    /bin/echo "Starting $PROG: "
+    # Snort parameters
+    # -D Run Snort in background (daemon) mode
+    # -i <if> Listen on interface <if> 
+    # -u <uname> Run snort uid as <uname> user (or uid)
+    # -g <gname> Run snort uid as <gname> group (or gid)
+    # -c Load configuration file
+    # -N Turn off logging (alerts still work) (removed to enable logging) :)
+    # -l Log to directory
+    # -t Chroots process to directory after initialization
+    # -R <id> Include 'id' in snort_intf<id>.pid file name
+    
+    $BINARY -D -i $LAN_INTERFACE -u $USER -g $GROUP -c $CONFIG_FILE -l $LOGDIR/$DATE -t $LOGDIR/$DATE -R _ids
+    /bin/echo "$PROG startup complete."
+    return $RETURN_VAL
+}
+
+stop()
+{
+    if [ -s $PID ]; then
+        /bin/echo "Stopping $PROG with PID `cat $PID`: "
+        kill -TERM `cat $PID` 2>/dev/null
+        RETURN_VAL=$?
+        /bin/echo "$PROG shutdown complete."
+        [ -e $DEL_PID ] && rm -f $DEL_PID
+    [ -e $DEL_PID.lck ] && rm -f $DEL_PID.lck
+    else
+        /bin/echo "ERROR: PID in $PID file not found."
+        RETURN_VAL=1
+    fi
+    return $RETURN_VAL
+}
+
+status() {
+        if [ -s $PID ]; then
+                echo "$PROG is running as pid `cat $PID`:"
+        else
+                echo "$PROG is not running."
+        fi
+}
+
+restart()
+{
+    stop
+    start
+    RETURN_VAL=$?
+    return $RETURN_VAL
+}
+
+case "$1" in
+ start)
+       start
+    ;;
+ stop)
+       stop
+    ;;
+ status)
+       status
+    ;;
+ restart|reload)
+       restart
+    ;;
+ *)
+    /bin/echo "Usage: $0 {start|stop|status|restart|reload}"
+    RETURN_VAL=1
+esac
+
+exit $RETURN_VAL 
diff --git a/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
new file mode 100644
index 0000000..829146d
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort_2.9.4.6.bb
@@ -0,0 +1,71 @@
+DESCRIPTION = "snort - a free lightweight network intrusion detection system for UNIX and Windows."
+HOMEPAGE = "http://www.snort.org/"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=78fa8ef966b48fbf9095e13cc92377c5"
+
+DEPENDS = "libpcap libpcre daq libdnet"
+
+
+SRC_URI = " ${GENTOO_MIRROR}/${BP}.tar.gz;name=tarball \
+            file://snort.init \
+            file://disable-inaddr-none.patch \
+            file://disable-dap-address-space-id.patch "
+
+SRC_URI[tarball.md5sum] = "4111df01a4f21bd1d328a18b76d625bd"
+SRC_URI[tarball.sha256sum] = "cfaa5390b1840aaaa68a6c05a7077dd92cb916e6186a014baa451d43cdb0b3bc"
+
+inherit autotools  gettext  update-rc.d
+
+INITSCRIPT_NAME = "snort"
+INITSCRIPT_PARAMS = "defaults"
+
+EXTRA_OECONF = " \
+	--enable-gre \    
+	--enable-linux-smp-stats \
+	--enable-reload \
+	--enable-reload-error-restart \
+	--enable-targetbased \
+	--disable-static-daq \
+	"
+
+do_install_append() {
+	install -d ${D}/${sysconfdir}/snort/rules
+	install -d ${D}/${sysconfdir}/snort/preproc_rules
+    install -d ${D}${sysconfdir}/init.d
+	for i in map config conf dtd; do
+		cp ${S}/etc/*.$i ${D}/${sysconfdir}/snort/
+	done
+	cp ${S}/preproc_rules/*.rules ${D}/${sysconfdir}/snort/preproc_rules/
+    install -m 755 ${WORKDIR}/snort.init ${D}/${sysconfdir}/init.d/snort
+	mkdir -p ${D}/${localstatedir}/log/snort
+    install -d ${D}/var/log/snort
+}
+
+FILES_${PN} += " \
+	${libdir}/snort_dynamicengine/*.so.* \
+	${libdir}/snort_dynamicpreprocessor/*.so.* \
+	${libdir}/snort_dynamicrules/*.so.* \
+	"
+FILES_${PN}-dbg += " \
+	${libdir}/snort_dynamicengine/.debug \
+	${libdir}/snort_dynamicpreprocessor/.debug \
+	${libdir}/snort_dynamicrules/.debug \
+	"
+FILES_${PN}-staticdev += " \
+	${libdir}/snort_dynamicengine/*.a \
+	${libdir}/snort_dynamicpreprocessor/*.a \
+	${libdir}/snort_dynamicrules/*.a \
+	${libdir}/snort/dynamic_preproc/*.a \
+	${libdir}/snort/dynamic_output/*.a \
+	"
+FILES_${PN}-dev += " \
+	${libdir}/snort_dynamicengine/*.la \
+	${libdir}/snort_dynamicpreprocessor/*.la \
+	${libdir}/snort_dynamicrules/*.la \
+	${libdir}/snort_dynamicengine/*.so \
+	${libdir}/snort_dynamicpreprocessor/*.so \
+	${libdir}/snort_dynamicrules/*.so \
+	${prefix}/src/snort_dynamicsrc \
+	"
+
+RRECOMMENDS_${PN} += "barnyard2"
-- 
1.7.5.4



