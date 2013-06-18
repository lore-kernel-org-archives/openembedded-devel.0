Return-Path: <Lei.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5AB3E6023F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2013 02:23:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5I2NvuX029142
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Jun 2013 19:23:57 -0700 (PDT)
Received: from pek-lpgtest3.wrs.com (128.224.153.83) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Mon, 17 Jun 2013 19:23:56 -0700
From: <lei.yang@windriver.com>
To: <lei.yang@windriver.com>, <openembedded-devel@lists.openembedded.org>,
	<paul.eggleton@linux.intel.com>
Date: Tue, 18 Jun 2013 10:23:55 +0800
Message-ID: <1371522235-9161-1-git-send-email-lei.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH:V2] vlan: Add vlan recipe
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
X-List-Received-Date: Tue, 18 Jun 2013 02:23:56 -0000
Content-Type: text/plain

From: Lei Yang <lei.yang@windriver.com>

A 802.1q vlan support program,which can be used by virt-test

Signed-off-by: Lei Yang <lei.yang@windriver.com>
---
 meta-networking/recipes-support/vlan/files/ip      |   21 +++++++
 .../recipes-support/vlan/files/vlan-post-down      |   28 +++++++++
 .../recipes-support/vlan/files/vlan-pre-up         |   61 ++++++++++++++++++++
 meta-networking/recipes-support/vlan/vlan_1.9.bb   |   36 ++++++++++++
 4 files changed, 146 insertions(+), 0 deletions(-)
 create mode 100755 meta-networking/recipes-support/vlan/files/ip
 create mode 100755 meta-networking/recipes-support/vlan/files/vlan-post-down
 create mode 100755 meta-networking/recipes-support/vlan/files/vlan-pre-up
 create mode 100755 meta-networking/recipes-support/vlan/vlan_1.9.bb

diff --git a/meta-networking/recipes-support/vlan/files/ip b/meta-networking/recipes-support/vlan/files/ip
new file mode 100755
index 0000000..d7de05c
--- /dev/null
+++ b/meta-networking/recipes-support/vlan/files/ip
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
diff --git a/meta-networking/recipes-support/vlan/files/vlan-post-down b/meta-networking/recipes-support/vlan/files/vlan-post-down
new file mode 100755
index 0000000..89b16fb
--- /dev/null
+++ b/meta-networking/recipes-support/vlan/files/vlan-post-down
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
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
+  ;;
+  eth*.*|bond*.*|wlan*.*)
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
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
diff --git a/meta-networking/recipes-support/vlan/files/vlan-pre-up b/meta-networking/recipes-support/vlan/files/vlan-pre-up
new file mode 100755
index 0000000..b977be8
--- /dev/null
+++ b/meta-networking/recipes-support/vlan/files/vlan-pre-up
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
+    VLANID=`echo $IFACE|sed "s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*\.0*//;s/wlan[0-9][0-9]*\.0*//"`
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
+  ;;
+  eth*.*|bond*.*|wlan*.*)
+    vconfig set_name_type DEV_PLUS_VID_NO_PAD
+    VLANID=`echo $IFACE|sed "s/eth[0-9][0-9]*\.0*//g;s/bond[0-9][0-9]*\.0*//g;s/wlan[0-9][0-9]*\.0*//g"`
+    IF_VLAN_RAW_DEVICE=`echo $IFACE|sed "s/\(eth[0-9][0-9]*\)\..*/\1/;s/\(bond[0-9][0-9]*\)\..*/\1/;s/\(wlan[0-9][0-9]*\)\..*/\1/"`
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
diff --git a/meta-networking/recipes-support/vlan/vlan_1.9.bb b/meta-networking/recipes-support/vlan/vlan_1.9.bb
new file mode 100755
index 0000000..b79da6e
--- /dev/null
+++ b/meta-networking/recipes-support/vlan/vlan_1.9.bb
@@ -0,0 +1,36 @@
+SUMMARY = "802.1q vlan support program"
+HOMEPAGE = "http://www.candelatech.com/~greear/vlan.html"
+LICENSE = "GPLv2"
+SECTION = "console/network"
+
+SRC_URI[md5sum] = "5f0c6060b33956fb16e11a15467dd394"
+SRC_URI[sha256sum] = "3b8f0a1bf0d3642764e5f646e1f3bbc8b1eeec474a77392d9aeb4868842b4cca"
+LIC_FILES_CHKSUM = "file://macvlan_config.c;beginline=4;endline=62;md5=dc0660d77e4313e8ccdf256fbe436a63"
+
+S = "${WORKDIR}/${PN}"
+
+SRC_URI = " \
+	http://www.candelatech.com/~greear/vlan/vlan.${PV}.tar.gz \
+	file://ip \
+	file://vlan-pre-up \
+	file://vlan-post-down \
+	"
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
+	install -m 0755 ${WORKDIR}/vlan-pre-up ${D}/${sysconfdir}/network/if-pre-up.d/vlan
+	install -m 0755 ${WORKDIR}/vlan-post-down ${D}/${sysconfdir}/network/if-post-down.d/vlan
+}
-- 
1.7.1


