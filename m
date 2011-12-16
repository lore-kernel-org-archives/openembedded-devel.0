Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=TX2EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1RbO0f-0004CW-Jo
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 03:58:57 +0100
Received: from mail195-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Fri, 16 Dec 2011 02:36:53 +0000
Received: from mail195-tx2 (localhost [127.0.0.1])	by
	mail195-tx2-R.bigfish.com (Postfix) with ESMTP id E3C1B600256	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:00 +0000 (UTC)
X-SpamScore: 1
X-BigFish: VS1(zzzz1202hzz8275ch8275bhz2dh2a8h668h839hb79i62h)
X-Spam-TCS-SCL: 1:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail195-tx2 (localhost.localdomain [127.0.0.1]) by mail195-tx2
	(MessageSwitch) id 1324003020475333_27344;
	Fri, 16 Dec 2011 02:37:00 +0000 (UTC)
Received: from TX2EHSMHS019.bigfish.com (unknown [10.9.14.235])	by
	mail195-tx2.bigfish.com (Postfix) with ESMTP id 5D3F75C0042	for
	<openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 02:37:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS019.bigfish.com
	(10.9.99.119) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 16 Dec 2011 02:36:51 +0000
Received: from az33smr01.freescale.net (10.64.34.199) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server id 14.1.355.3; Thu, 15 Dec 2011 20:36:50 -0600
Received: from localhost.localdomain
	(bjsimics-desktop-010192208197.ap.freescale.net [10.192.208.197])	by
	az33smr01.freescale.net (8.13.1/8.13.0) with ESMTP id pBG2aliv009971;
	Thu, 15 Dec 2011 20:36:48 -0600 (CST)
From: <b19537@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Dec 2011 10:39:25 +0800
Message-ID: <1324003173-13994-1-git-send-email-b19537@freescale.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH meta-oe 1/9] bridge-utils: add
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
X-List-Received-Date: Fri, 16 Dec 2011 02:58:57 -0000
Content-Type: text/plain

From: Zhenhua Luo <b19537@freescale.com>

    bridge-utils provides tools for ethernet bridging.

Signed-off-by: Zhenhua Luo <b19537@freescale.com>
---
 .../bridge-utils/bridge-utils.inc                  |   30 +++
 .../bridge-utils/bridge-utils_1.4.bb               |    6 +
 .../bridge-utils/files/ifupdown.sh                 |  245 ++++++++++++++++++++
 3 files changed, 281 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
 create mode 100644 meta-oe/recipes-connectivity/bridge-utils/files/ifupdown.sh

diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
new file mode 100644
index 0000000..5ac6c83
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils.inc
@@ -0,0 +1,30 @@
+DESCRIPTION = "Tools for ethernet bridging."
+HOMEPAGE = "http://bridge.sourceforge.net/"
+SECTION = "console/network"
+LICENSE = "GPL"
+DEPENDS = "sysfsutils"
+RRECOMMENDS_${PN} = "kernel-module-bridge"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bridge/bridge-utils-${PV}.tar.gz file://ifupdown.sh"
+
+inherit autotools
+
+EXTRA_OECONF = "--with-linux-headers=${STAGING_INCDIR}"
+
+do_install_append () {
+	mv ${D}${sbindir}/brctl ${D}${sbindir}/brctl.${PN}
+	install -d ${D}/${datadir}/bridge-utils
+	install -d ${D}/${sysconfdir}/network/if-pre-up.d
+	install -d ${D}/${sysconfdir}/network/if-post-down.d
+	install -m 0755 ${WORKDIR}/ifupdown.sh  ${D}/${datadir}/bridge-utils/
+	ln -s ${datadir}/bridge-utils/ifupdown.sh ${D}/${sysconfdir}/network/if-pre-up.d/bridge
+	ln -s ${datadir}/bridge-utils/ifupdown.sh ${D}/${sysconfdir}/network/if-post-down.d/bridge
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${sbindir}/brctl brctl brctl.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove brctl brctl.${PN}
+}
diff --git a/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
new file mode 100644
index 0000000..00a5815
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/bridge-utils_1.4.bb
@@ -0,0 +1,6 @@
+require bridge-utils.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=f9d20a453221a1b7e32ae84694da2c37"
+
+SRC_URI[md5sum] = "0182fcac3a2b307113bbec34e5f1c673"
+SRC_URI[sha256sum] = "876975e9bcc302aa8b829161ea3348b12b9b879f1db0dc98feaed8d0e5dd5933"
diff --git a/meta-oe/recipes-connectivity/bridge-utils/files/ifupdown.sh b/meta-oe/recipes-connectivity/bridge-utils/files/ifupdown.sh
new file mode 100644
index 0000000..a67ffcc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/bridge-utils/files/ifupdown.sh
@@ -0,0 +1,245 @@
+#!/bin/sh
+
+# You don't usually need to touch this file at all, the full configuration
+# of the bridge can be done in a standard way on /etc/network/interfaces.
+
+# Have a look at /usr/share/doc/bridge-utils/README.Debian if you want
+# more info about the way on wich a bridge is set up on Debian.
+
+if [ ! -x /usr/sbin/brctl ]
+then
+  exit 0
+fi
+
+case "$IF_BRIDGE_PORTS" in
+    "")
+	exit 0
+	;;
+    none)
+	INTERFACES=""
+	;;
+    *)
+	INTERFACES="$IF_BRIDGE_PORTS"
+	;;
+esac
+
+# Previous work (create the interface)
+if [ "$MODE" = "start" ] ; then
+  brctl addbr $IFACE || exit 1
+# Wait for the ports to become available
+  if [ "$IF_BRIDGE_WAITPORT" ]
+  then
+    set x $IF_BRIDGE_WAITPORT &&   
+    shift &&
+    WAIT="$1" &&
+    shift &&
+    WAITPORT="$@" &&
+    if [ -z "$WAITPORT" ];then WAITPORT="$IF_BRIDGE_PORTS";fi &&
+    STARTTIME=$(date +%s) &&
+    NOTFOUND="true" &&
+    /bin/echo -e "\nWaiting for a max of $WAIT seconds for $WAITPORT to become available." &&
+    while [ "$(($(date +%s)-$STARTTIME))" -le "$WAIT" ] && [ -n "$NOTFOUND" ]
+    do
+      NOTFOUND=""
+      for i in $WAITPORT
+      do
+        if ! grep -q "^[\ ]*$i:.*$" /proc/net/dev;then NOTFOUND="true";fi
+      done
+      if [ -n "$NOTFOUND" ];then sleep 1;fi
+    done
+  fi
+# Previous work (stop the interface)
+elif [ "$MODE" = "stop" ];  then
+  ifconfig $IFACE down || exit 1
+fi
+
+all_interfaces= &&
+unset all_interfaces &&
+set x $INTERFACES &&
+shift &&
+while [ x"${1+set}" = xset ]
+do
+  # For compatibility: the `all' option.
+  case $1 in
+      all)
+	shift &&
+	set regex eth.\* noregex "$@"
+	;;
+  esac
+
+  # Primitive state machine...
+  case $1-`uname -s` in
+      regex-Linux)
+	all_interfaces=`sed -n 's%^[\ ]*\([^:]*\):.*$%\1%p' < /proc/net/dev`
+	shift
+	;;
+      regex-*)
+	echo -n "$0 needs to be ported for your `uname -s` system.  " >&2
+	echo "Trying to continue nevertheless." >&2
+	shift
+	;;
+      noregex-*)
+	all_interfaces=
+	unset all_interfaces
+	shift
+	;;
+  esac
+
+  case ${all_interfaces+regex}-${1+set} in
+      regex-set)
+	# The following interface specification are to be parsed as regular
+	# expressions against all interfaces the system provides.
+	i=`egrep "^$1$" << EOAI
+$all_interfaces
+EOAI
+`
+	shift
+	;;
+      *-set)
+	# Literal interfaces.
+	i=$1
+	shift
+	;;
+      *)
+	# No interface specification is following.
+	i=
+	;;
+  esac
+
+  for port in $i
+  do
+    # We attach and configure each port of the bridge
+    if [ "$MODE" = "start" ] ; then
+      if [ -x /etc/network/if-pre-up.d/vlan ]; then
+        env IFACE=$port /etc/network/if-pre-up.d/vlan
+      fi
+      if [ "$IF_BRIDGE_HW" ]
+      then
+         ifconfig $port down; ifconfig $port hw ether $IF_BRIDGE_HW
+      fi
+      brctl addif $IFACE $port && ifconfig $port 0.0.0.0 up
+    # We detach each port of the bridge
+    elif [ "$MODE" = "stop" ];  then
+      ifconfig $port down && brctl delif $IFACE $port && \
+        if [ -x /etc/network/if-post-down.d/vlan ]; then
+          env IFACE=$port /etc/network/if-post-down.d/vlan
+        fi
+    fi
+  done
+done
+
+# We finish setting up the bridge
+if [ "$MODE" = "start" ] ; then
+
+  if [ "$IF_BRIDGE_AGEING" ]
+  then
+    brctl setageing $IFACE $IF_BRIDGE_AGEING
+  fi
+
+  if [ "$IF_BRIDGE_BRIDGEPRIO" ]
+  then
+    brctl setbridgeprio $IFACE $IF_BRIDGE_BRIDGEPRIO
+  fi
+
+  if [ "$IF_BRIDGE_FD" ]
+  then
+    brctl setfd $IFACE $IF_BRIDGE_FD
+  fi
+
+  if [ "$IF_BRIDGE_GCINT" ]
+  then
+    brctl setgcint $IFACE $IF_BRIDGE_GCINT
+  fi
+
+  if [ "$IF_BRIDGE_HELLO" ]
+  then
+    brctl sethello $IFACE $IF_BRIDGE_HELLO
+  fi
+
+  if [ "$IF_BRIDGE_MAXAGE" ]
+  then
+    brctl setmaxage $IFACE $IF_BRIDGE_MAXAGE
+  fi
+
+  if [ "$IF_BRIDGE_PATHCOST" ]
+  then
+    brctl setpathcost $IFACE $IF_BRIDGE_PATHCOST
+  fi
+
+  if [ "$IF_BRIDGE_PORTPRIO" ]
+  then
+    brctl setportprio $IFACE $IF_BRIDGE_PORTPRIO
+  fi
+
+  if [ "$IF_BRIDGE_STP" ]
+  then
+    brctl stp $IFACE $IF_BRIDGE_STP
+  fi
+
+
+  # We activate the bridge
+  ifconfig $IFACE 0.0.0.0 up
+
+
+  # Calculate the maximum time to wait for the bridge to be ready
+  if [ "$IF_BRIDGE_MAXWAIT" ]
+  then
+    MAXWAIT=$IF_BRIDGE_MAXWAIT
+  else
+    MAXWAIT=$(brctl showstp $IFACE|sed -n 's/^.*forward delay[ \t]*\(.*\)\..*bridge forward delay[ \t]*\(.*\)\..*$/\1 \2/p')
+    if [ "$MAXWAIT" ]
+    then
+      if [ ${MAXWAIT% *} -gt ${MAXWAIT#* } ]
+      then
+        MAXWAIT=$((2*(${MAXWAIT% *}+1)))
+      else
+        MAXWAIT=$((2*(${MAXWAIT#* }+1)))
+      fi
+    else
+      if [ "$IF_BRIDGE_FD" ]
+      then
+        MAXWAIT=$((2*(${IF_BRIDGE_FD%.*}+1)))
+      else
+        MAXWAIT=32
+      fi
+      /bin/echo -e "\nWaiting $MAXWAIT seconds for $IFACE to get ready."
+      sleep $MAXWAIT
+      MAXWAIT=0
+    fi
+  fi
+
+  # Wait for the bridge to be ready
+  if [ "$MAXWAIT" != 0 ]
+  then
+    /bin/echo -e "\nWaiting for $IFACE to get ready (MAXWAIT is $MAXWAIT seconds)."
+
+    unset BREADY
+    unset TRANSITIONED
+    COUNT=0
+
+    while [ ! "$BREADY" -a $COUNT -lt $MAXWAIT ]
+    do
+      sleep 1
+      COUNT=$(($COUNT+1))
+      BREADY=true
+      for i in $(brctl showstp $IFACE|sed -n 's/^.*port id.*state[ \t]*\(.*\)$/\1/p')
+      do
+        if [ "$i" = "listening" -o "$i" = "learning" -o "$i" = "forwarding" -o "$i" = "blocking" ]
+        then
+          TRANSITIONED=true
+        fi
+        if [ "$i" != "forwarding" -a "$i" != "blocking" ] && [ ! "$TRANSITIONED" -o "$i" != "disabled" ]
+        then
+          unset BREADY
+        fi
+      done
+    done
+
+  fi
+
+# Finally we destroy the interface
+elif [ "$MODE" = "stop" ];  then
+
+  brctl delbr $IFACE
+
+fi
-- 
1.7.0.4




