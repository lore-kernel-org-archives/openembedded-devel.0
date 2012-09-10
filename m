Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TB2xS-0001ve-7g
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Sep 2012 14:19:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Sep 2012 05:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,396,1344236400"; d="scan'208";a="220027212"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.193])
	by fmsmga002.fm.intel.com with ESMTP; 10 Sep 2012 05:06:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Sep 2012 13:06:19 +0100
Message-Id: <1347278779-21232-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Joe MacDonald <joe.macdonald@windriver.com>
Subject: [meta-networking][PATCH v2] zeroconf: add from OE-Core
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
X-List-Received-Date: Mon, 10 Sep 2012 12:19:18 -0000

This is about to be removed from OE-Core, so add it here for those that
still want it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../zeroconf/zeroconf/compilefix.patch             |   19 ++++++++
 .../zeroconf/zeroconf/debian-zeroconf              |   51 ++++++++++++++++++++
 .../zeroconf/zeroconf/zeroconf-default             |   17 +++++++
 .../recipes-protocols/zeroconf/zeroconf_0.9.bb     |   34 +++++++++++++
 4 files changed, 121 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/compilefix.patch
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf/zeroconf-default
 create mode 100644 meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb

diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/compilefix.patch b/meta-networking/recipes-protocols/zeroconf/zeroconf/compilefix.patch
new file mode 100644
index 0000000..328e574
--- /dev/null
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/compilefix.patch
@@ -0,0 +1,19 @@
+| zeroconf.c: In function 'main':
+| zeroconf.c:145: error: 'PATH_MAX' undeclared (first use in this function)
+
+RP - 4/9/09
+
+Upstream-Status: Pending
+
+Index: zeroconf-0.9/zeroconf.c
+===================================================================
+--- zeroconf-0.9.orig/zeroconf.c	2009-09-04 10:05:25.000000000 +0100
++++ zeroconf-0.9/zeroconf.c	2009-09-04 10:05:42.000000000 +0100
+@@ -33,6 +33,7 @@
+ #include <net/if_arp.h>
+ #include <sys/time.h>
+ #include <signal.h>
++#include <limits.h>
+ 
+ #include "delay.h"
+ 
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf b/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
new file mode 100644
index 0000000..c3705d2
--- /dev/null
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/debian-zeroconf
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+if [ ! -x /usr/sbin/zeroconf ]; then
+    exit 0
+fi
+
+# IPv4 link-local addresses (zeroconf) are
+# only applicable on the 'inet' address family
+[ "X$ADDRFAM" != "Xinet" ] && exit 0
+
+# However there are some methods where it doesn't
+# make any sense to configure an IPv4LL address
+
+# not on loopback
+[ "X$METHOD" = "Xloopback" ] && exit 0
+
+# not on ppp or wvdial either
+[ "X$METHOD" = "Xppp" ] && exit 0
+[ "X$METHOD" = "Xwvdial" ] && exit 0
+
+# The administrator may have blacklisted interfaces
+# or only want zeroconf in a fallback situation
+[ -f /etc/default/zeroconf ] &&
+    . /etc/default/zeroconf
+
+[ -n "$DISABLE" ] && exit 0
+
+for BLACK in $IFBLACKLIST; do
+    case $IFACE in
+	$BLACK)
+	exit 0
+	;;
+    esac
+done
+
+# should we only allocate an address if we do not already have one?
+if [ -n "$FALLBACK" ]; then
+    /bin/ip addr show $IFACE scope global | grep -q "inet"
+    IP=$?
+    if [ $IP -eq 0 ]; then
+        /bin/ip route add 169.254.0.0/16 dev $IFACE
+        exit 0
+    fi
+fi
+
+# otherwise, run if we aren't already going
+if [ ! -r /var/run/zeroconf.$IFACE.pid ]; then
+	/usr/sbin/zeroconf -i $IFACE
+fi
+
+exit 0
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf/zeroconf-default b/meta-networking/recipes-protocols/zeroconf/zeroconf/zeroconf-default
new file mode 100644
index 0000000..cc07b27
--- /dev/null
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf/zeroconf-default
@@ -0,0 +1,17 @@
+# Default for zeroconf
+
+# disable zeroconf
+# If you want to disable zeroconf completely, uncomment the following line
+# this may be useful if you are debugging zeroconf or starting it manually
+#DISABLE=yes
+
+# black-listed interfaces
+# Interfaces which you never wish to have zeroconf run on should
+# be listed here. e.g. "eth2 wlan1" in a space seperated string
+IFBLACKLIST=""
+
+# fallback only
+# If you would only like a link-local address if you were unable to
+# obtain an address via DHCP then uncomment the following line
+#FALLBACK=yes
+
diff --git a/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
new file mode 100644
index 0000000..f755940
--- /dev/null
+++ b/meta-networking/recipes-protocols/zeroconf/zeroconf_0.9.bb
@@ -0,0 +1,34 @@
+SUMMARY = "IPv4 link-local address allocator"
+DESCRIPTION = "Zeroconf is a program that is used to claim IPv4 \
+link-local addresses. IPv4 link-local addresses are useful when setting \
+up ad-hoc networking between devices without the involvement of a either \
+a DHCP server or network administrator. \
+These addresses are allocated from the 169.254.0.0/16 address range and \
+are normally attached to each Ethernet device in your computer. \
+Addresses are assigned randomly by each host and, in case of collision, \
+both hosts (are supposed to) renumber."
+AUTHOR = "Anand Kumria <wildfire@progsoc.uts.edu.au>"
+HOMEPAGE = "http://www.progsoc.org/~wildfire/zeroconf/"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4 \
+                    file://zeroconf.c;beginline=1;endline=13;md5=a5bada96e1e34b08eb7446b28e2630b2"
+SECTION = "net"
+
+PR = "r1"
+
+SRC_URI = "http://www.progsoc.org/~wildfire/zeroconf/download/${BPN}-${PV}.tar.gz \
+           file://compilefix.patch \
+           file://zeroconf-default \
+           file://debian-zeroconf"
+
+SRC_URI[md5sum] = "bdafb16b008ebb5633e4e581f77821d2"
+SRC_URI[sha256sum] = "a8c74df127753e2310fa1e072f3c9ca44a404bb0bbce9cfec7a84c6dff8bec7b"
+
+do_install () {
+	install -d ${D}${sbindir}
+	install -d ${D}${sysconfdir}/network/if-up.d
+	install -d ${D}${sysconfdir}/default
+	install -c -m 755 ${S}/zeroconf ${D}${sbindir}/zeroconf
+	install -c -m 755 ${WORKDIR}/debian-zeroconf ${D}${sysconfdir}/network/if-up.d/zeroconf
+	install -c ${WORKDIR}/zeroconf-default ${D}${sysconfdir}/default/zeroconf
+}
-- 
1.7.9.5



