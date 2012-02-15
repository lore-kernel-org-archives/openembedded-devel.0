Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kelvin.a.lawson@gmail.com>) id 1RxSdz-0007B8-QK
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Feb 2012 01:22:48 +0100
Received: by obhx4 with SMTP id x4so757716obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Feb 2012 16:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	bh=IACP3hWj01mGWQUQexilcnu/vsqEPs9oy4jFEgyKeyw=;
	b=UHNcY43OEqAJJpmDDMHEg2ZTYCpbg6OIWpPiCBW21lIkyTDPy/+Uw9kt8rbDIGsvk2
	sXLjle7qaB/jIOL8fwlWnkdNCyNunmcudC2PSHq4oKjJ8t0qb0GjwET9sRi2moUgQ+YK
	6KcmHylm5ehxNZMepY2iwhg+iqk0aGOjF7XSc=
MIME-Version: 1.0
Received: by 10.182.110.104 with SMTP id hz8mr16340886obb.77.1329264876070;
	Tue, 14 Feb 2012 16:14:36 -0800 (PST)
Sender: kelvin.a.lawson@gmail.com
Received: by 10.182.134.36 with HTTP; Tue, 14 Feb 2012 16:14:36 -0800 (PST)
Date: Wed, 15 Feb 2012 00:14:36 +0000
X-Google-Sender-Auth: -nv0T6pWywNYxo4566peG29BqWk
Message-ID: <CAO-TFnHKzoDatgkFEtmv6=wtioTkUsAto0k6FE63Qa9V7rCpGQ@mail.gmail.com>
From: Kelvin Lawson <kelvinl@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] vlan: Port vlan 1.9 recipe from OE Classic
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
X-List-Received-Date: Wed, 15 Feb 2012 00:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

 Signed-off-by: Kelvin Lawson <kelvinl@users.sf.net>

---
 meta-oe/recipes-connectivity/vlan/files/ip         |   21 +++++++
 .../recipes-connectivity/vlan/files/vlan-post-down |   28 +++++++++
 .../recipes-connectivity/vlan/files/vlan-pre-up    |   61 ++++++++++++++++++++
 meta-oe/recipes-connectivity/vlan/vlan_1.9.bb      |   39 +++++++++++++
 4 files changed, 149 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-connectivity/vlan/files/ip
 create mode 100644 meta-oe/recipes-connectivity/vlan/files/vlan-post-down
 create mode 100644 meta-oe/recipes-connectivity/vlan/files/vlan-pre-up
 create mode 100644 meta-oe/recipes-connectivity/vlan/vlan_1.9.bb

diff --git a/meta-oe/recipes-connectivity/vlan/files/ip
b/meta-oe/recipes-connectivity/vlan/files/ip
new file mode 100644
index 0000000..d7de05c
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vlan/files/ip
@@ -0,0 +1,21 @@
+#!/bin/sh
+# This should probably go into ifupdown
+# But usually only those with lots of interfaces (vlans) need these
+if [ -d "/proc/sys/net/ipv4/conf/$IFACE" ]
+then
+	if [ -n "$IF_IP_PROXY_ARP" ]; then
+		if [ "$IF_IP_PROXY_ARP" -eq "1" ]; then
+			echo 1 > "/proc/sys/net/ipv4/conf/$IFACE/proxy_arp"
+		else
+			echo 0 > "/proc/sys/net/ipv4/conf/$IFACE/proxy_arp"
+		fi
+	fi
+	if [ -n "$IF_IP_RP_FILTER" ]; then
+		if [ "$IF_IP_RP_FILTER" -eq "0" ]; then
+			echo 0 > "/proc/sys/net/ipv4/conf/$IFACE/rp_filter"
+		else
+			echo 1 > "/proc/sys/net/ipv4/conf/$IFACE/rp_filter"
+		fi
+	fi
+fi
+
diff --git a/meta-oe/recipes-connectivity/vlan/files/vlan-post-down
b/meta-oe/recipes-connectivity/vlan/files/vlan-post-down
new file mode 100644
index 0000000..89b16fb
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vlan/files/vlan-post-down
@@ -0,0 +1,28 @@
+#!/bin/sh
+
+# If IFACE is an automagic vlan interface (without the vlan-raw-device
+# parameter) then let's try to discover the magic here..  Another way would be
+# to just probe for the right device name in /proc/net/vlan
+
+case "$IFACE" in
+  # Ignore any alias (#272891)
+  *:*)
+    exit 0
+  ;;
+  eth*.0*|bond*.0*|wlan*.0*)
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
"s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
+  ;;
+  eth*.*|bond*.*|wlan*.*)
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
"s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
+  ;;
+  # Test for vlan raw device (#196890, #292648)
+  *)
+    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
+  ;;
+esac
+
+if [ ! -x /sbin/vconfig ]; then
+    exit 0
+fi
+
+vconfig rem $IFACE
diff --git a/meta-oe/recipes-connectivity/vlan/files/vlan-pre-up
b/meta-oe/recipes-connectivity/vlan/files/vlan-pre-up
new file mode 100644
index 0000000..b977be8
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vlan/files/vlan-pre-up
@@ -0,0 +1,61 @@
+#!/bin/sh
+
+# Most of this stuff is to enable vlans
+
+case "$IFACE" in
+  # Ignore any alias (#272891) which uses <interface>:<alabel>
+  *:*)
+    exit 0
+  ;;
+  vlan0*)
+    vconfig set_name_type VLAN_PLUS_VID
+    VLANID=`echo $IFACE|sed "s/vlan0*//"`
+  ;;
+  vlan*)
+    vconfig set_name_type VLAN_PLUS_VID_NO_PAD
+    VLANID=`echo $IFACE|sed "s/vlan0*//"`
+  ;;
+  eth*.0*|bond*.0*|wlan*.0*)
+    vconfig set_name_type DEV_PLUS_VID
+    VLANID=`echo $IFACE|sed
"s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*\.0*//;s/wlan[0-9][0-9]*\.0*//"`
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
"s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
+  ;;
+  eth*.*|bond*.*|wlan*.*)
+    vconfig set_name_type DEV_PLUS_VID_NO_PAD
+    VLANID=`echo $IFACE|sed
"s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*\.0*//g;s/wlan[0-9][0-9]*\.0*//g"`
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed
"s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
+  ;;
+  *.0*)
+    # Silently ignore interfaces which we do not (know how to) support
+    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
+    vconfig set_name_type DEV_PLUS_VID
+    VLANID=`echo $IFACE|sed "s/[^.]*\.0*//g"`
+  ;;
+  *.*)
+    # Silently ignore interfaces which we do not (know how to) support
+    [ -z "$IF_VLAN_RAW_DEVICE" ] && exit 0
+    vconfig set_name_type DEV_PLUS_VID_NO_PAD
+    VLANID=`echo $IFACE|sed "s/[^.]*\.0*//g"`
+  ;;
+
+  *)
+    exit 0
+  ;;
+esac
+
+if [ -n "$IF_VLAN_RAW_DEVICE" ]; then
+    if [ ! -x /sbin/vconfig ]; then
+        exit 0
+    fi
+    if ! ip link show dev "$IF_VLAN_RAW_DEVICE" > /dev/null; then
+        echo "$IF_VLAN_RAW_DEVICE does not exist, unable to create $IFACE"
+        exit 1
+    fi
+    ip link set up dev $IF_VLAN_RAW_DEVICE
+    vconfig add $IF_VLAN_RAW_DEVICE $VLANID
+fi
+
+# This is not vlan specific, and should actually go somewhere else.
+if [ -n "$IF_HW_MAC_ADDRESS" ]; then
+    ip link set $IFACE address $IF_HW_MAC_ADDRESS
+fi
diff --git a/meta-oe/recipes-connectivity/vlan/vlan_1.9.bb
b/meta-oe/recipes-connectivity/vlan/vlan_1.9.bb
new file mode 100644
index 0000000..619e039
--- /dev/null
+++ b/meta-oe/recipes-connectivity/vlan/vlan_1.9.bb
@@ -0,0 +1,39 @@
+DESCRIPTION = "802.1q vlan support program"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM =
"file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"
+RRECOMMENDS_${PN} = "kernel-module-8021q"
+PR = "r1"
+
+S = "${WORKDIR}/vlan/"
+
+SRC_URI = " \
+	http://www.candelatech.com/~greear/vlan/vlan.${PV}.tar.gz \
+	file://ip \
+	file://vlan-pre-up \
+	file://vlan-post-down \
+	"
+
+inherit base
+
+CCFLAGS = "-g -D_GNU_SOURCE -Wall -I${STAGING_INCDIR}"
+LDLIBS = ""
+
+do_compile() {
+	${CC} ${CCFLAGS} -c vconfig.c
+	${CC} ${CCFLAGS} ${LDFLAGS} -o vconfig vconfig.o ${LDLIBS}
+}
+
+do_install() {
+	install -d "${D}${sbindir}"
+	install -m 755 "${S}/vconfig" "${D}${sbindir}/vconfig"
+	install -d ${D}/${sysconfdir}/network/if-pre-up.d
+	install -d ${D}/${sysconfdir}/network/if-post-down.d
+	install -d ${D}/${sysconfdir}/network/if-up.d
+	install -m 0755 ${WORKDIR}/ip ${D}/${sysconfdir}/network/if-up.d/
+	install -m 0755 ${WORKDIR}/vlan-pre-up
${D}/${sysconfdir}/network/if-pre-up.d/vlan
+	install -m 0755 ${WORKDIR}/vlan-post-down
${D}/${sysconfdir}/network/if-post-down.d/vlan
+}
+
+
+SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
+SRC_URI[sha256sum] =
"3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
-- 
1.7.1


