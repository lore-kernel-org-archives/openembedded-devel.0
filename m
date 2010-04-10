Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1O0TA6-000231-9p
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 Apr 2010 07:23:19 +0200
Received: from localhost.localdomain (c-76-115-42-183.hsd1.or.comcast.net
	[76.115.42.183])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id E4133301BF;
	Sat, 10 Apr 2010 01:19:48 -0400 (EDT)
From: Scott Garman <sgarman@zenlinux.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Apr 2010 22:20:56 -0700
Message-Id: <1270876856-13074-1-git-send-email-sgarman@zenlinux.com>
X-Mailer: git-send-email 1.6.3.3
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: E4133301BF.E61F1
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
X-List-Received-Date: Sat, 10 Apr 2010 05:23:19 -0000

* Addresses CVE-2010-0751
* Use new-style checksums

Signed-off-by: Scott Garman <sgarman@zenlinux.com>
---
 recipes/libnids/libnids-1.24/configure.patch |   60 ++++++++++++++++++++++++++
 recipes/libnids/libnids_1.24.bb              |   26 +++++++++++
 2 files changed, 86 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libnids/libnids-1.24/configure.patch
 create mode 100644 recipes/libnids/libnids_1.24.bb

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



