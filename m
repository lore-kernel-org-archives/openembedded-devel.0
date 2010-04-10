Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1O0RAR-0008Ln-Cj
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Apr 2010 05:15:32 +0200
Received: from localhost.localdomain (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0D9332FEA3;
	Fri,  9 Apr 2010 23:12:01 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 20:13:04 -0700
Message-Id: <1270869184-9526-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0D9332FEA3.A54DE
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Scott Garman <sgarman@zenlinux.com>
Subject: [PATCH] libnids: Upgrade to 1.24
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
X-List-Received-Date: Sat, 10 Apr 2010 03:15:33 -0000

* Addresses CVE-2010-0751
* Use new-style checksums

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 conf/checksums.ini                           |    8 ---
 recipes/libnids/libnids-1.18/configure.patch |   60 --------------------------
 recipes/libnids/libnids-1.24/configure.patch |   60 ++++++++++++++++++++++++++
 recipes/libnids/libnids_1.18.bb              |   24 ----------
 recipes/libnids/libnids_1.24.bb              |   26 +++++++++++
 5 files changed, 86 insertions(+), 92 deletions(-)
 delete mode 100644 recipes/libnids/libnids-1.18/configure.patch
 create mode 100644 recipes/libnids/libnids-1.24/configure.patch
 delete mode 100644 recipes/libnids/libnids_1.18.bb
 create mode 100644 recipes/libnids/libnids_1.24.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 50546a4..800e244 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -15998,14 +15998,6 @@ sha256=c2ae0a07d863536261b8a0562f3f77aa224fa1f413d85d824a765d00e37c5de4
 md5=055e3eedf735ee1257fd4bb9ce86d04e
 sha256=adf3612367456328609c65ecc39c9bb08c0fef84cebbd1a3b5fcfe5e9614ac82
 
-[http://downloads.sourceforge.net/libnids/libnids-1.18.tar.gz]
-md5=9ee6dcdfac97bae6fe611aa27d2594a5
-sha256=b0275c914197a53c6ccf631eac756fd37ec6f2d8f09f15757061495cf9be0fcd
-
-[http://heanet.dl.sourceforge.net/libnids/libnids-1.18.tar.gz]
-md5=9ee6dcdfac97bae6fe611aa27d2594a5
-sha256=b0275c914197a53c6ccf631eac756fd37ec6f2d8f09f15757061495cf9be0fcd
-
 [http://people.suug.ch/~tgr/libnl/files/libnl-0.5.0.tar.gz]
 md5=c58ec5032f393f569ef7f489436651b3
 sha256=89a6b5086987460ddd9b24723f35a3a951ccf2886cabe26bef89b8c53528fec5
diff --git a/recipes/libnids/libnids-1.18/configure.patch b/recipes/libnids/libnids-1.18/configure.patch
deleted file mode 100644
index 332675b..0000000
--- a/recipes/libnids/libnids-1.18/configure.patch
+++ /dev/null
@@ -1,60 +0,0 @@
---- tmp/base/libnids-1.18-r0/libnids-1.18/configure.in	Tue Oct 14 18:40:00 2003
-+++ libnids-1.18/configure.in	Wed Nov  5 16:01:27 2003
-@@ -65,12 +65,15 @@
-      ;;
-   *)
-      AC_MSG_RESULT($withval)
--     if test -f $withval/pcap.h -a -f $withval/libpcap.a; then
--        owd=`pwd`
--        if cd $withval; then withval=`pwd`; cd $owd; fi
--	PCAP_CFLAGS="-I$withval -I$withval/bpf"
--	PCAPLIB="-L$withval -lpcap"
--     else
-+     for i in $withval $withval/include $withval/lib $withval/include/pcap; do
-+        if test -f $i/pcap.h; then
-+           PCAP_CFLAGS="-I$i -I$i/bpf"
-+        fi
-+        if test -f $i/libpcap.a; then
-+           PCAPLIB="-L$i -lpcap"
-+        fi
-+     done
-+     if test -z "$PCAP_CFLAGS" -o -z "$PCAPLIB"; then
-         AC_ERROR(pcap.h or libpcap.a not found in $withval)
-      fi
-      ;;
-@@ -127,20 +130,22 @@
-      ;;
-   *)
-      AC_MSG_RESULT($withval)
--     if test -f $withval/include/libnet.h -a -f $withval/lib/libnet.a -a -f $withval/libnet-config ; then
--        owd=`pwd`
--        if cd $withval; then withval=`pwd`; cd $owd; fi
--	LNET_CFLAGS="-I$withval/include `$withval/libnet-config --defines`"
--	LNETLIB="-L$withval/lib -lnet"
--     elif test -f $withval/include/libnet.h -a -f $withval/src/libnet.a; then
--        owd=`pwd`
--        if cd $withval; then withval=`pwd`; cd $owd; fi
--	LNET_CFLAGS="-I$withval/include"
--	LNETLIB="-L$withval/src -lnet"
--     else
--	echo "A working combination of libnet.h, libnet.a and libnet-config not found in $withval; get libnet from www.packetfactory.net/projects/libnet and reinstall"
--        AC_ERROR(libnet)
-+     LNETC="`which libnet-config 2>/dev/null`"
-+     for i in $withval $withval/include $withval/lib $withval/bin; do
-+        if test -f $i/libnet-config; then
-+           LNETC"=$i/libnet-config"
-+        fi
-+        if test -f $i/libnet.h; then
-+           LNET_CFLAGS="-I$i"
-+        fi
-+        if test -f $i/libnet.a; then
-+           LNETLIB="-L$i -lnet"
-+        fi
-+     done
-+     if test -z "$LNET_CFLAGS" -o -z "$LNETLIB" -o -z "$LNETC"; then
-+        AC_ERROR([libnet not found in $withval])
-      fi
-+     LNET_CFLAGS="$LNET_CFLAGS `$LNETC --defines`"
-      ;;
-   esac ],
- [ if test "x"$LIBNET_VER = "x"-1 ; then
diff --git a/recipes/libnids/libnids-1.24/configure.patch b/recipes/libnids/libnids-1.24/configure.patch
new file mode 100644
index 0000000..332675b
--- /dev/null
+++ b/recipes/libnids/libnids-1.24/configure.patch
@@ -0,0 +1,60 @@
+--- tmp/base/libnids-1.18-r0/libnids-1.18/configure.in	Tue Oct 14 18:40:00 2003
++++ libnids-1.18/configure.in	Wed Nov  5 16:01:27 2003
+@@ -65,12 +65,15 @@
+      ;;
+   *)
+      AC_MSG_RESULT($withval)
+-     if test -f $withval/pcap.h -a -f $withval/libpcap.a; then
+-        owd=`pwd`
+-        if cd $withval; then withval=`pwd`; cd $owd; fi
+-	PCAP_CFLAGS="-I$withval -I$withval/bpf"
+-	PCAPLIB="-L$withval -lpcap"
+-     else
++     for i in $withval $withval/include $withval/lib $withval/include/pcap; do
++        if test -f $i/pcap.h; then
++           PCAP_CFLAGS="-I$i -I$i/bpf"
++        fi
++        if test -f $i/libpcap.a; then
++           PCAPLIB="-L$i -lpcap"
++        fi
++     done
++     if test -z "$PCAP_CFLAGS" -o -z "$PCAPLIB"; then
+         AC_ERROR(pcap.h or libpcap.a not found in $withval)
+      fi
+      ;;
+@@ -127,20 +130,22 @@
+      ;;
+   *)
+      AC_MSG_RESULT($withval)
+-     if test -f $withval/include/libnet.h -a -f $withval/lib/libnet.a -a -f $withval/libnet-config ; then
+-        owd=`pwd`
+-        if cd $withval; then withval=`pwd`; cd $owd; fi
+-	LNET_CFLAGS="-I$withval/include `$withval/libnet-config --defines`"
+-	LNETLIB="-L$withval/lib -lnet"
+-     elif test -f $withval/include/libnet.h -a -f $withval/src/libnet.a; then
+-        owd=`pwd`
+-        if cd $withval; then withval=`pwd`; cd $owd; fi
+-	LNET_CFLAGS="-I$withval/include"
+-	LNETLIB="-L$withval/src -lnet"
+-     else
+-	echo "A working combination of libnet.h, libnet.a and libnet-config not found in $withval; get libnet from www.packetfactory.net/projects/libnet and reinstall"
+-        AC_ERROR(libnet)
++     LNETC="`which libnet-config 2>/dev/null`"
++     for i in $withval $withval/include $withval/lib $withval/bin; do
++        if test -f $i/libnet-config; then
++           LNETC"=$i/libnet-config"
++        fi
++        if test -f $i/libnet.h; then
++           LNET_CFLAGS="-I$i"
++        fi
++        if test -f $i/libnet.a; then
++           LNETLIB="-L$i -lnet"
++        fi
++     done
++     if test -z "$LNET_CFLAGS" -o -z "$LNETLIB" -o -z "$LNETC"; then
++        AC_ERROR([libnet not found in $withval])
+      fi
++     LNET_CFLAGS="$LNET_CFLAGS `$LNETC --defines`"
+      ;;
+   esac ],
+ [ if test "x"$LIBNET_VER = "x"-1 ; then
diff --git a/recipes/libnids/libnids_1.18.bb b/recipes/libnids/libnids_1.18.bb
deleted file mode 100644
index cf88745..0000000
--- a/recipes/libnids/libnids_1.18.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-DESCRIPTION = "Libnids performs assembly of TCP segments \
-into TCP streams, IP defragmentation, and TCP port \
-scan detection."
-LICENSE = "GPL"
-SECTION = "libs"
-DEPENDS = "libnet-1.0 libpcap"
-PR = "r1"
-
-SRC_URI = "\
-  ${SOURCEFORGE_MIRROR}/libnids/libnids-${PV}.tar.gz \
-  file://configure.patch;patch=1"
-
-inherit autotools
-
-EXTRA_OECONF = "\
-  --with-libpcap=${STAGING_LIBDIR}/.. \
-  --with-libnet=${STAGING_LIBDIR}/.. \
-"
-EXTRA_OEMAKE = "'install_prefix=${D}'"
-
-do_stage () {
-	install -m 0644 ${S}/src/nids.h ${STAGING_INCDIR}/
-	oe_libinstall -a -C src libnids ${STAGING_LIBDIR}
-}
diff --git a/recipes/libnids/libnids_1.24.bb b/recipes/libnids/libnids_1.24.bb
new file mode 100644
index 0000000..09702a9
--- /dev/null
+++ b/recipes/libnids/libnids_1.24.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Libnids performs assembly of TCP segments \
+into TCP streams, IP defragmentation, and TCP port \
+scan detection."
+LICENSE = "GPL"
+SECTION = "libs"
+DEPENDS = "libnet-1.0 libpcap"
+PR = "r0"
+
+SRC_URI = "\
+  ${SOURCEFORGE_MIRROR}/libnids/libnids-${PV}.tar.gz;name=libnids \
+  file://configure.patch;patch=1"
+SRC_URI[libnids.md5sum] = "72d37c79c85615ffe158aa524d649610"
+SRC_URI[libnids.sha256sum] = "314b4793e0902fbf1fdb7fb659af37a3c1306ed1aad5d1c84de6c931b351d359"
+
+inherit autotools
+
+EXTRA_OECONF = "\
+  --with-libpcap=${STAGING_LIBDIR}/.. \
+  --with-libnet=${STAGING_LIBDIR}/.. \
+"
+EXTRA_OEMAKE = "'install_prefix=${D}'"
+
+do_stage () {
+	install -m 0644 ${S}/src/nids.h ${STAGING_INCDIR}/
+	oe_libinstall -a -C src libnids ${STAGING_LIBDIR}
+}
-- 
1.6.3.3



