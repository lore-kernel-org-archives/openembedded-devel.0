Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel.mcdougall@liftoffsoftware.com>)
	id 1SY0mB-0007tO-OT for openembedded-devel@lists.openembedded.org;
	Fri, 25 May 2012 22:06:20 +0200
Received: by yenl13 with SMTP id l13so676806yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 May 2012 12:56:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=+HYTWMLWphCQzNK0kWCx41uVUMspKnj0YHWVkfepch0=;
	b=JxQb7g1NWxzDWLNwYFzXspFb7m705sG1pQNkA5ZFhHJjCf5lL8tp22845eu3caw9Tn
	AeLtc0pOMptyKSb9gSjdh7j5d1kDrRlY2j+PjDmXVgbWUm30HJQxsmBkSXUDUUFm5tB7
	jcx1Sc86Kn3YIL3vj+aOEJg/dXD+emBCsByCE1jtHvwSlBBK0y9hz9JhAA0pTe+J63Tj
	aq6wQa++UdbndAWBNrlZHszE9gdkMpn3NKKjyh7S/MljRldW/dbZcFM7zTaZmx8hs6iw
	vk7L7HJSlYGoR6z/9iMOe4SzmIctp7PUfmOiIwjB5T/vzLXmPATwk1ziwzCFKlvYaK2k
	QViw==
Received: by 10.101.152.18 with SMTP id e18mr58895ano.23.1337975766486;
	Fri, 25 May 2012 12:56:06 -0700 (PDT)
Received: from portarisk.lan (c-69-180-64-152.hsd1.fl.comcast.net.
	[69.180.64.152])
	by mx.google.com with ESMTPS id q44sm19239274yhg.3.2012.05.25.12.56.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 12:56:05 -0700 (PDT)
From: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 May 2012 15:54:48 -0400
Message-Id: <1337975688-31659-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQmtsOEWRWWjO+bpqYz7KsAToJgFzh817wNM2Vt1pImGyaFybqwmsLCOWZnowMnweapWsa9Q
Subject: [PATCH] netbase updated to 5.0
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
X-List-Received-Date: Fri, 25 May 2012 20:06:20 -0000

Updated from 4.47 to 5.0 (4.47 isn't available anymore on the Debian FTP
servers so this was blocking builds from completing).

Signed-off-by: Dan McDougall <daniel.mcdougall@liftoffsoftware.com>
---
 meta/recipes-core/netbase/netbase-4.47/hosts       |    2 -
 meta/recipes-core/netbase/netbase-4.47/init        |   89 --------------------
 meta/recipes-core/netbase/netbase-4.47/interfaces  |   31 -------
 meta/recipes-core/netbase/netbase-4.47/nfsroot     |   39 ---------
 .../netbase/netbase-4.47/qemuarm/interfaces        |    5 --
 .../netbase/netbase-4.47/qemuarmv6/interfaces      |    5 --
 .../netbase/netbase-4.47/qemuarmv7/interfaces      |    5 --
 .../netbase/netbase-4.47/qemumips/interfaces       |    8 --
 .../netbase/netbase-4.47/qemumips64/interfaces     |    8 --
 .../netbase/netbase-4.47/qemuppc/interfaces        |    8 --
 .../netbase/netbase-4.47/qemush4/interfaces        |    8 --
 .../netbase/netbase-4.47/qemux86-64/interfaces     |    8 --
 .../netbase/netbase-4.47/qemux86/interfaces        |    8 --
 meta/recipes-core/netbase/netbase-5.0/hosts        |    2 +
 meta/recipes-core/netbase/netbase-5.0/init         |   89 ++++++++++++++++++++
 meta/recipes-core/netbase/netbase-5.0/interfaces   |   31 +++++++
 meta/recipes-core/netbase/netbase-5.0/nfsroot      |   39 +++++++++
 .../netbase/netbase-5.0/qemuarm/interfaces         |    5 ++
 .../netbase/netbase-5.0/qemuarmv6/interfaces       |    5 ++
 .../netbase/netbase-5.0/qemuarmv7/interfaces       |    5 ++
 .../netbase/netbase-5.0/qemumips/interfaces        |    8 ++
 .../netbase/netbase-5.0/qemumips64/interfaces      |    8 ++
 .../netbase/netbase-5.0/qemuppc/interfaces         |    8 ++
 .../netbase/netbase-5.0/qemush4/interfaces         |    8 ++
 .../netbase/netbase-5.0/qemux86-64/interfaces      |    8 ++
 .../netbase/netbase-5.0/qemux86/interfaces         |    8 ++
 meta/recipes-core/netbase/netbase_4.47.bb          |   48 -----------
 meta/recipes-core/netbase/netbase_5.0.bb           |   48 +++++++++++
 28 files changed, 272 insertions(+), 272 deletions(-)
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/hosts
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/init
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/nfsroot
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/hosts
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/init
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/nfsroot
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
 delete mode 100644 meta/recipes-core/netbase/netbase_4.47.bb
 create mode 100644 meta/recipes-core/netbase/netbase_5.0.bb

diff --git a/meta/recipes-core/netbase/netbase-4.47/hosts b/meta/recipes-core/netbase/netbase-4.47/hosts
deleted file mode 100644
index 2f33245..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/hosts
+++ /dev/null
@@ -1,2 +0,0 @@
-127.0.0.1	localhost.localdomain		localhost
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/init b/meta/recipes-core/netbase/netbase-4.47/init
deleted file mode 100644
index bace9df..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/init
+++ /dev/null
@@ -1,89 +0,0 @@
-#!/bin/sh -e
-### BEGIN INIT INFO
-# Provides:          networking
-# Required-Start:    mountvirtfs $local_fs
-# Required-Stop:     $local_fs
-# Should-Start:      ifupdown
-# Should-Stop:       ifupdown
-# Default-Start:     S
-# Default-Stop:      0 6
-# Short-Description: Raise network interfaces.
-### END INIT INFO
-
-PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
-
-[ -x /sbin/ifup ] || exit 0
-
-check_network_file_systems() {
-    [ -e /proc/mounts ] || return 0
-
-    if [ -e /etc/iscsi/iscsi.initramfs ]; then
-	echo "not deconfiguring network interfaces: iSCSI root is mounted."
-	exit 0
-    fi
-
-    exec 9<&0 < /proc/mounts
-    while read DEV MTPT FSTYPE REST; do
-	case $DEV in
-	/dev/nbd*|/dev/nd[a-z]*|/dev/etherd/e*)
-	    echo "not deconfiguring network interfaces: network devices still mounted."
-	    exit 0
-	    ;;
-	esac
-	case $FSTYPE in
-	nfs|nfs4|smbfs|ncp|ncpfs|cifs|coda|ocfs2|gfs|pvfs|pvfs2|fuse.httpfs|fuse.curlftpfs)
-	    echo "not deconfiguring network interfaces: network file systems still mounted."
-	    exit 0
-	    ;;
-	esac
-    done
-    exec 0<&9 9<&-
-}
-
-check_network_swap() {
-    [ -e /proc/swaps ] || return 0
-
-    exec 9<&0 < /proc/swaps
-    while read DEV MTPT FSTYPE REST; do
-	case $DEV in
-	/dev/nbd*|/dev/nd[a-z]*|/dev/etherd/e*)
-	    echo "not deconfiguring network interfaces: network swap still mounted."
-	    exit 0
-	    ;;
-	esac
-    done
-    exec 0<&9 9<&-
-}
-
-case "$1" in
-start)
-	echo -n "Configuring network interfaces... "
-	ifup -a
-	echo "done."
-	;;
-
-stop)
-	check_network_file_systems
-	check_network_swap
-
-	echo -n "Deconfiguring network interfaces... "
-	ifdown -a
-	echo "done."
-	;;
-
-force-reload|restart)
-	echo "Running $0 $1 is deprecated because it may not enable again some interfaces"
-	echo "Reconfiguring network interfaces... "
-	ifdown -a || true
-	ifup -a
-	echo "done."
-	;;
-
-*)
-	echo "Usage: /etc/init.d/networking {start|stop}"
-	exit 1
-	;;
-esac
-
-exit 0
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/interfaces b/meta/recipes-core/netbase/netbase-4.47/interfaces
deleted file mode 100644
index 0acf4cf..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/interfaces
+++ /dev/null
@@ -1,31 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-# Wireless interfaces
-iface wlan0 inet dhcp
-	wireless_mode managed
-	wireless_essid any
-	wpa-driver wext
-	wpa-conf /etc/wpa_supplicant.conf
-
-iface atml0 inet dhcp
-
-# Wired or wireless interfaces
-auto eth0
-iface eth0 inet dhcp
-iface eth1 inet dhcp
-
-# Ethernet/RNDIS gadget (g_ether)
-# ... or on host side, usbnet and random hwaddr
-iface usb0 inet static
-	address 192.168.7.2
-	netmask 255.255.255.0
-	network 192.168.7.0
-	gateway 192.168.7.1
-
-# Bluetooth networking
-iface bnep0 inet dhcp
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/nfsroot b/meta/recipes-core/netbase/netbase-4.47/nfsroot
deleted file mode 100644
index 750c0a9..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/nfsroot
+++ /dev/null
@@ -1,39 +0,0 @@
-#! /bin/sh
-
-# In case the interface is used as nfsroot, avoid ifup, otherwise
-# nfsroot may lose response
-
-nfsroot=0
-
-if test "x$IFACE" = xlo ; then
-	exit 0
-fi
-
-exec 9<&0 < /proc/mounts
-while read dev mtpt fstype rest; do
-    if test $mtpt = "/" ; then
-        case $fstype in
-            nfs | nfs4)
-                nfsroot=1
-                nfs_addr=`echo $rest | sed -e 's/^.*addr=\([0-9.]*\).*$/\1/'`
-                break
-                ;;
-            *)
-                ;;
-        esac
-    fi
-done
-exec 0<&9 9<&-
-
-test $nfsroot -eq 0 && exit 0
-
-if [ -x /bin/ip -o -x /sbin/ip ] ; then
-    nfs_iface=`ip route get $nfs_addr | grep dev | sed -e 's/^.*dev \([-a-z0-9.]*\).*$/\1/'`
-fi
-
-if test "x$IFACE" = "x$nfs_iface" ; then
-    echo "ifup skipped for nfsroot interface $nfs_iface"
-    exit 1
-fi
-
-exit 0
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
deleted file mode 100644
index 1696776..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemuarm/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
deleted file mode 100644
index 1696776..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemuarmv6/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
deleted file mode 100644
index 1696776..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemuarmv7/interfaces
+++ /dev/null
@@ -1,5 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
deleted file mode 100644
index f62b9a8..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemumips/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
deleted file mode 100644
index f62b9a8..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
deleted file mode 100644
index f62b9a8..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemuppc/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
deleted file mode 100644
index f62b9a8..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
deleted file mode 100644
index f62b9a8..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemux86-64/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
deleted file mode 100644
index f62b9a8..0000000
--- a/meta/recipes-core/netbase/netbase-4.47/qemux86/interfaces
+++ /dev/null
@@ -1,8 +0,0 @@
-# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
- 
-# The loopback interface
-auto lo
-iface lo inet loopback
-
-
-
diff --git a/meta/recipes-core/netbase/netbase-5.0/hosts b/meta/recipes-core/netbase/netbase-5.0/hosts
new file mode 100644
index 0000000..2f33245
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/hosts
@@ -0,0 +1,2 @@
+127.0.0.1	localhost.localdomain		localhost
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/init b/meta/recipes-core/netbase/netbase-5.0/init
new file mode 100644
index 0000000..bace9df
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/init
@@ -0,0 +1,89 @@
+#!/bin/sh -e
+### BEGIN INIT INFO
+# Provides:          networking
+# Required-Start:    mountvirtfs $local_fs
+# Required-Stop:     $local_fs
+# Should-Start:      ifupdown
+# Should-Stop:       ifupdown
+# Default-Start:     S
+# Default-Stop:      0 6
+# Short-Description: Raise network interfaces.
+### END INIT INFO
+
+PATH="/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin"
+
+[ -x /sbin/ifup ] || exit 0
+
+check_network_file_systems() {
+    [ -e /proc/mounts ] || return 0
+
+    if [ -e /etc/iscsi/iscsi.initramfs ]; then
+	echo "not deconfiguring network interfaces: iSCSI root is mounted."
+	exit 0
+    fi
+
+    exec 9<&0 < /proc/mounts
+    while read DEV MTPT FSTYPE REST; do
+	case $DEV in
+	/dev/nbd*|/dev/nd[a-z]*|/dev/etherd/e*)
+	    echo "not deconfiguring network interfaces: network devices still mounted."
+	    exit 0
+	    ;;
+	esac
+	case $FSTYPE in
+	nfs|nfs4|smbfs|ncp|ncpfs|cifs|coda|ocfs2|gfs|pvfs|pvfs2|fuse.httpfs|fuse.curlftpfs)
+	    echo "not deconfiguring network interfaces: network file systems still mounted."
+	    exit 0
+	    ;;
+	esac
+    done
+    exec 0<&9 9<&-
+}
+
+check_network_swap() {
+    [ -e /proc/swaps ] || return 0
+
+    exec 9<&0 < /proc/swaps
+    while read DEV MTPT FSTYPE REST; do
+	case $DEV in
+	/dev/nbd*|/dev/nd[a-z]*|/dev/etherd/e*)
+	    echo "not deconfiguring network interfaces: network swap still mounted."
+	    exit 0
+	    ;;
+	esac
+    done
+    exec 0<&9 9<&-
+}
+
+case "$1" in
+start)
+	echo -n "Configuring network interfaces... "
+	ifup -a
+	echo "done."
+	;;
+
+stop)
+	check_network_file_systems
+	check_network_swap
+
+	echo -n "Deconfiguring network interfaces... "
+	ifdown -a
+	echo "done."
+	;;
+
+force-reload|restart)
+	echo "Running $0 $1 is deprecated because it may not enable again some interfaces"
+	echo "Reconfiguring network interfaces... "
+	ifdown -a || true
+	ifup -a
+	echo "done."
+	;;
+
+*)
+	echo "Usage: /etc/init.d/networking {start|stop}"
+	exit 1
+	;;
+esac
+
+exit 0
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/interfaces b/meta/recipes-core/netbase/netbase-5.0/interfaces
new file mode 100644
index 0000000..0acf4cf
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/interfaces
@@ -0,0 +1,31 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+# Wireless interfaces
+iface wlan0 inet dhcp
+	wireless_mode managed
+	wireless_essid any
+	wpa-driver wext
+	wpa-conf /etc/wpa_supplicant.conf
+
+iface atml0 inet dhcp
+
+# Wired or wireless interfaces
+auto eth0
+iface eth0 inet dhcp
+iface eth1 inet dhcp
+
+# Ethernet/RNDIS gadget (g_ether)
+# ... or on host side, usbnet and random hwaddr
+iface usb0 inet static
+	address 192.168.7.2
+	netmask 255.255.255.0
+	network 192.168.7.0
+	gateway 192.168.7.1
+
+# Bluetooth networking
+iface bnep0 inet dhcp
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/nfsroot b/meta/recipes-core/netbase/netbase-5.0/nfsroot
new file mode 100644
index 0000000..750c0a9
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/nfsroot
@@ -0,0 +1,39 @@
+#! /bin/sh
+
+# In case the interface is used as nfsroot, avoid ifup, otherwise
+# nfsroot may lose response
+
+nfsroot=0
+
+if test "x$IFACE" = xlo ; then
+	exit 0
+fi
+
+exec 9<&0 < /proc/mounts
+while read dev mtpt fstype rest; do
+    if test $mtpt = "/" ; then
+        case $fstype in
+            nfs | nfs4)
+                nfsroot=1
+                nfs_addr=`echo $rest | sed -e 's/^.*addr=\([0-9.]*\).*$/\1/'`
+                break
+                ;;
+            *)
+                ;;
+        esac
+    fi
+done
+exec 0<&9 9<&-
+
+test $nfsroot -eq 0 && exit 0
+
+if [ -x /bin/ip -o -x /sbin/ip ] ; then
+    nfs_iface=`ip route get $nfs_addr | grep dev | sed -e 's/^.*dev \([-a-z0-9.]*\).*$/\1/'`
+fi
+
+if test "x$IFACE" = "x$nfs_iface" ; then
+    echo "ifup skipped for nfsroot interface $nfs_iface"
+    exit 1
+fi
+
+exit 0
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
new file mode 100644
index 0000000..1696776
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemuarm/interfaces
@@ -0,0 +1,5 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
new file mode 100644
index 0000000..1696776
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemuarmv6/interfaces
@@ -0,0 +1,5 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
new file mode 100644
index 0000000..1696776
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemuarmv7/interfaces
@@ -0,0 +1,5 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemumips/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemumips64/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemuppc/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemush4/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemux86-64/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces b/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-5.0/qemux86/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_4.47.bb
deleted file mode 100644
index 634560a..0000000
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-SUMMARY = "Basic TCP/IP networking support"
-DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/IP based networking"
-HOMEPAGE = "http://packages.debian.org/netbase"
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r3"
-
-inherit update-rc.d
-
-INITSCRIPT_NAME = "networking"
-INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
-
-SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
-           file://init \
-           file://hosts \
-           file://interfaces \
-           file://nfsroot"
-
-SRC_URI[md5sum] = "fcd87a62f177592724a8066e3774ae97"
-SRC_URI[sha256sum] = "a7e6525c9a09b00eff3395d09739b3c70a18bff8d13f7daa21fdf81989387726"
-
-do_install () {
-	install -d ${D}${sysconfdir}/init.d \
-		   ${D}${mandir}/man8 \
-		   ${D}${sysconfdir}/network/if-pre-up.d \
-		   ${D}${sysconfdir}/network/if-up.d \
-		   ${D}${sysconfdir}/network/if-down.d \
-		   ${D}${sysconfdir}/network/if-post-down.d
-	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
-	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
-	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
-	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
-	install -m 0644 etc-services ${D}${sysconfdir}/services
-	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
-	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
-
-	# Disable network manager on machines that commonly do NFS booting
-	case "${MACHINE}" in
-		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
-			touch ${D}${sysconfdir}/network/nm-disabled-eth0
-			;;
-		*)
-			;;
-	esac
-}
-
-CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
diff --git a/meta/recipes-core/netbase/netbase_5.0.bb b/meta/recipes-core/netbase/netbase_5.0.bb
new file mode 100644
index 0000000..634560a
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase_5.0.bb
@@ -0,0 +1,48 @@
+SUMMARY = "Basic TCP/IP networking support"
+DESCRIPTION = "This package provides the necessary infrastructure for basic TCP/IP based networking"
+HOMEPAGE = "http://packages.debian.org/netbase"
+SECTION = "base"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
+PR = "r3"
+
+inherit update-rc.d
+
+INITSCRIPT_NAME = "networking"
+INITSCRIPT_PARAMS = "start 40 S . stop 40 0 6 1 ."
+
+SRC_URI = "${DEBIAN_MIRROR}/main/n/netbase/netbase_${PV}.tar.gz \
+           file://init \
+           file://hosts \
+           file://interfaces \
+           file://nfsroot"
+
+SRC_URI[md5sum] = "fcd87a62f177592724a8066e3774ae97"
+SRC_URI[sha256sum] = "a7e6525c9a09b00eff3395d09739b3c70a18bff8d13f7daa21fdf81989387726"
+
+do_install () {
+	install -d ${D}${sysconfdir}/init.d \
+		   ${D}${mandir}/man8 \
+		   ${D}${sysconfdir}/network/if-pre-up.d \
+		   ${D}${sysconfdir}/network/if-up.d \
+		   ${D}${sysconfdir}/network/if-down.d \
+		   ${D}${sysconfdir}/network/if-post-down.d
+	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/networking
+	install -m 0644 ${WORKDIR}/hosts ${D}${sysconfdir}/hosts
+	install -m 0644 etc-rpc ${D}${sysconfdir}/rpc
+	install -m 0644 etc-protocols ${D}${sysconfdir}/protocols
+	install -m 0644 etc-services ${D}${sysconfdir}/services
+	install -m 0644 ${WORKDIR}/interfaces ${D}${sysconfdir}/network/interfaces
+	install -m 0755 ${WORKDIR}/nfsroot ${D}${sysconfdir}/network/if-pre-up.d
+
+	# Disable network manager on machines that commonly do NFS booting
+	case "${MACHINE}" in
+		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
+			touch ${D}${sysconfdir}/network/nm-disabled-eth0
+			;;
+		*)
+			;;
+	esac
+}
+
+CONFFILES_${PN} = "${sysconfdir}/hosts ${sysconfdir}/network/interfaces"
-- 
1.7.9.5



