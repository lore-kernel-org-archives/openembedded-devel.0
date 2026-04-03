Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B93D730B1
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 07:24:11 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6633.1775201049794659560
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 00:24:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j8ygxJgM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775201050; x=1806737050;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=W5UbsT0TuC624ilHvx16qZ0K7g29Ip4PjsW8ZDhBqvI=;
  b=j8ygxJgMnDUyYoqsQaKAND9XwzyQGB7akfrUN3kM2fhbZibjk1bzTLdJ
   tXI6FK+DLDuJbPuZ77JDreoJ+3J0v3FliAqD28jq4nTYowEZ6uRYNN0hr
   9/V+IwTR8JbGEVzcPmN41hccK/FNyl3+8gg9rpAYelehdFJHFEpNalvkh
   2qn3r8OuX+PkTL+IScL2mKaOkpgeGtV0tIVKfZ1sBvWznhbmBo+SQ89t0
   JtiCYxMyirRomKETwe39ve9pjZUjg6vIsWm5XcGEsP5coPmyYR3Hy0vyh
   I5fYWnjfMPCK+2rvTvtXoAc3VF+GG54N4rplEMBCXuvxpL8nGJKI+1A42
   Q==;
X-CSE-ConnectionGUID: GUf3wP06QJCD0EbuB74Vpw==
X-CSE-MsgGUID: gYg8tdR9Qa+mvipFB3hgEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="235624668"
X-IronPort-AV: E=Sophos;i="6.23,157,1770562800"; 
   d="scan'208";a="235624668"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 16:24:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C3D671C166D5
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 07:24:07 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 7BEEB83D94E
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 07:24:07 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 5B8B31000354
	for <openembedded-devel@lists.openembedded.org>; Fri,  3 Apr 2026 07:24:05 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] openct: Drop this recipe
Date: Fri,  3 Apr 2026 15:23:54 +0800
Message-ID: <20260403072355.16407-1-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 07:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125973

Drop openct as it is unmaintained upstream.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...e-pointer-type-error-with-gcc-option.patch | 65 -------------
 ...t-the-first-line-of-compiler-version.patch | 31 -------
 .../etc-openct.udev.in-disablePROGRAM.patch   | 31 -------
 .../etc-openct_usb.in-modify-UDEVINFO.patch   | 35 -------
 .../recipes-support/openct/openct/openct.init | 89 ------------------
 .../openct/openct/openct.service              | 13 ---
 .../openct/openct/openct.sysconfig            |  5 -
 .../recipes-support/openct/openct_0.6.20.bb   | 91 -------------------
 8 files changed, 360 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
 delete mode 100644 meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch
 delete mode 100644 meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
 delete mode 100644 meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
 delete mode 100644 meta-oe/recipes-support/openct/openct/openct.init
 delete mode 100644 meta-oe/recipes-support/openct/openct/openct.service
 delete mode 100644 meta-oe/recipes-support/openct/openct/openct.sysconfig
 delete mode 100644 meta-oe/recipes-support/openct/openct_0.6.20.bb

diff --git a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch b/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
deleted file mode 100644
index 73c9d06667..0000000000
--- a/meta-oe/recipes-support/openct/openct/0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c4351058da555e1e6a2b4b15d913baee80f55865 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Thu, 27 Jun 2024 06:27:18 +0000
-Subject: Fix incompatible pointer type error with gcc option 
- -Wincompatible-pointer-types
-
-| ../../../openct-0.6.20/src/ifd/ifdhandler.c: In function 'ifdhandler_run':
-| ../../../openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argument 2 of 'ifd_get_eventfd' from incompatible pointer type [-Wincompatible-pointer-types]
-|   239 |                 sock->fd = ifd_get_eventfd(reader, &sock->events);
-|       |                                                    ^~~~~~~~~~~~~
-|       |                                                    |
-|       |                                                    int *
-| In file included from ../../../openct-0.6.20/src/ifd/internal.h:17,
-|                  from ../../../openct-0.6.20/src/ifd/ifdhandler.c:7:
-| ../../../openct-0.6.20/src/include/openct/ifd.h:182:65: note: expected 'short int *' but argument is of type 'int *'
-|   182 | extern int                      ifd_get_eventfd(ifd_reader_t *, short *);
-|       |                                                                 ^~~~~~~
-
-| ../../../openct-0.6.20/src/ifd/process.c: In function 'do_memory_write':
-| ../../../openct-0.6.20/src/ifd/process.c:461:61: error: passing argument 4 of 'ct_tlv_get_opaque' from incompatible pointer type [-Wincompatible-pointer-types]
-|   461 |             || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, &data_len))
-|       |                                                             ^~~~~~~~~
-|       |                                                             |
-|       |                                                             unsigned int *
-| In file included from ../../../openct-0.6.20/src/ifd/process.c:20:
-| ../../../openct-0.6.20/src/include/openct/tlv.h:40:62: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'unsigned int *'
-|    40 |                                 ifd_tag_t, unsigned char **, size_t *);
-
-Upstream-Status: Submitted
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- src/ifd/ifdhandler.c | 2 +-
- src/ifd/process.c    | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/ifd/ifdhandler.c b/src/ifd/ifdhandler.c
-index 12686c9..ebd1b53 100644
---- a/src/ifd/ifdhandler.c
-+++ b/src/ifd/ifdhandler.c
-@@ -236,7 +236,7 @@ static void ifdhandler_run(ifd_reader_t * reader)
- 		sock->fd = -1;
- 	}
- 	else {
--		sock->fd = ifd_get_eventfd(reader, &sock->events);
-+		sock->fd = ifd_get_eventfd(reader, (short int *)&sock->events);
- 	}
- 	if (sock->fd == -1) {
- 		ifd_debug(1, "events inactive for reader %s", reader->name);
-diff --git a/src/ifd/process.c b/src/ifd/process.c
-index 4563bdf..7088a76 100644
---- a/src/ifd/process.c
-+++ b/src/ifd/process.c
-@@ -458,7 +458,7 @@ static int do_memory_write(ifd_reader_t * reader, int unit,
- 		return IFD_ERROR_INVALID_SLOT;
- 
- 	if (ct_tlv_get_int(args, CT_TAG_ADDRESS, &address) == 0
--	    || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, &data_len))
-+	    || !ct_tlv_get_opaque(args, CT_TAG_DATA, &data, (size_t *)&data_len))
- 		return IFD_ERROR_MISSING_ARG;
- 
- 	rc = ifd_card_write_memory(reader, unit, address, data, data_len);
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch b/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch
deleted file mode 100644
index 9bd3d18d6e..0000000000
--- a/meta-oe/recipes-support/openct/openct/0001-m4-Just-emit-the-first-line-of-compiler-version.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 146b5116140d719e4e9ae19748c0b6dee7d82f96 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 22 May 2023 22:01:28 -0700
-Subject: [PATCH] m4: Just emit the first line of compiler version
-
-Avoids emitting buildpaths into comments
-Fixes
-WARNING: openct-0.6.20-r0 do_package_qa: QA Issue: File /usr/include/openct/types.h in package openct-dev contains reference to TMPDIR [buildpaths]
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- m4/ac_create_stdint_h.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/ac_create_stdint_h.m4 b/m4/ac_create_stdint_h.m4
-index 66de704..4b7223a 100644
---- a/m4/ac_create_stdint_h.m4
-+++ b/m4/ac_create_stdint_h.m4
-@@ -110,7 +110,7 @@ echo "#define" $_ac_stdint_h "1" >>$ac_stdint_h
- echo "#ifndef" _GENERATED_STDINT_H >>$ac_stdint_h
- echo "#define" _GENERATED_STDINT_H '"'$PACKAGE $VERSION'"' >>$ac_stdint_h
- if test "$GCC" = "yes" ; then
--  echo "/* generated using a gnu compiler version" `$CC --version` "*/" \
-+  echo "/* generated using a gnu compiler version" `$CC --version|head -1` "*/" \
-   >>$ac_stdint_h
- else
-   echo "/* generated using $CC */" >>$ac_stdint_h
--- 
-2.40.1
-
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch b/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
deleted file mode 100644
index e2401bb31b..0000000000
--- a/meta-oe/recipes-support/openct/openct/etc-openct.udev.in-disablePROGRAM.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From e0d3e0bb1e38ff851696a7d8826e651d364ad8ce Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Fri, 5 Dec 2014 02:00:57 +0900
-Subject: [PATCH 1/2] etc/openct.udev.in: disablePROGRAM
-
-Bug fix: https://bugzilla.redhat.com/show_bug.cgi?id=287871
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- etc/openct.udev.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/etc/openct.udev.in b/etc/openct.udev.in
-index d11d0e1..48083c9 100644
---- a/etc/openct.udev.in
-+++ b/etc/openct.udev.in
-@@ -22,7 +22,8 @@ ACTION!="add", GOTO="openct_usb_rules_end"
- # 2010-01-06 removed, as latest udev doesn't know WAIT_FOR_ATTR any more.
- 
- # sleep for 100ms - the wait_for_sysfs might not be enough
--PROGRAM="/bin/sleep 0.1"
-+# Disabled in this package - see https://bugzilla.redhat.com/287871
-+# PROGRAM="/bin/sleep 0.1"
- 
- # ccid
- ATTR{bInterfaceClass}=="0b", ATTR{bInterfaceSubClass}=="00", ATTR{bInterfaceProtocol}=="00", ATTRS{idVendor}=="?*"  RUN+="@udevdir@/openct_usb /dev/$parent"
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch b/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
deleted file mode 100644
index 22eda729fb..0000000000
--- a/meta-oe/recipes-support/openct/openct/etc-openct_usb.in-modify-UDEVINFO.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From d93985a137b553b2723235d03bda341dab14064f Mon Sep 17 00:00:00 2001
-From: Li xin <lixin.fnst@cn.fujitsu.com>
-Date: Fri, 5 Dec 2014 02:04:03 +0900
-Subject: [PATCH 2/2] etc/openct_usb.in: modify UDEVINFO
-
-this patch is from Fedora
-
-Upstream-Status: Pending
-
-Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
----
- etc/openct_usb.in | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/etc/openct_usb.in b/etc/openct_usb.in
-index 32f91aa..917467d 100644
---- a/etc/openct_usb.in
-+++ b/etc/openct_usb.in
-@@ -15,10 +15,10 @@ if [ -z "$DEVNAME" ]; then
- 	# Guess udev info interface.
- 	# Newer udev uses udevadm
- 	#
--	if which udevinfo > /dev/null 2>&1; then
--		UDEVINFO="udevinfo"
--	else
-+	if which udevadm > /dev/null 2>&1; then
- 		UDEVINFO="udevadm info"
-+	else
-+		UDEVINFO="udevinfo"
- 	fi
- 	DEVNAME=/dev/$($UDEVINFO --query=name --path=$(dirname $DEVPATH))
- fi
--- 
-1.8.4.2
-
diff --git a/meta-oe/recipes-support/openct/openct/openct.init b/meta-oe/recipes-support/openct/openct/openct.init
deleted file mode 100644
index c6896095e3..0000000000
--- a/meta-oe/recipes-support/openct/openct/openct.init
+++ /dev/null
@@ -1,89 +0,0 @@
-#!/bin/sh
-#
-# openct       This shell script takes care of starting and stopping OpenCT.
-#
-# chkconfig:   2345 24 89
-# description: OpenCT is a middleware framework for smart card terminals.
-#
-# processname: ifdhandler
-# config:      /etc/openct.conf
-
-### BEGIN INIT INFO
-# Provides: openct
-# Default-Start: 2 3 4 5
-# Default-Stop: 0 1 6
-# Should-Start: $syslog $network
-# Should-Stop: $syslog $network
-# Short-Description: Middleware framework for smart card terminals
-# Description: This starts/stops the OpenCT middleware framework support
-#              for smart card terminals.
-### END INIT INFO
-
-. /etc/init.d/functions
-
-exec="/usr/sbin/openct-control"
-prog=openct
-proc=ifdhandler
-
-OPENCT_OPTIONS=
-[ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
-
-lockfile=/var/lock/subsys/$prog
-
-start() {
-    retval=0
-    if ! status $proc >/dev/null 2>&1 ; then
-        action $"Initializing OpenCT smart card terminals: " \
-            $exec $OPENCT_OPTIONS init
-        retval=$?
-        [ $retval -eq 0 ] && touch $lockfile
-    fi
-    return $retval
-}
-
-stop() {
-    if status $proc >/dev/null 2>&1 ; then
-        action $"Stopping OpenCT smart card terminals: " \
-            $exec $OPENCT_OPTIONS shutdown
-    fi
-    retval=$?
-    if [ $retval -eq 0 ] ; then
-        rm -f /var/run/openct/status
-        rm -f $lockfile
-    fi
-    return $retval
-}
-
-restart() {
-    stop
-    start
-}
-
-oct_status() {
-    status $proc
-    retval=$?
-    if [ -e /var/run/openct/status ] ; then
-        $exec $OPENCT_OPTIONS status
-        [ -e /var/run/openct/status ] && \
-            echo $"Waiting for reader attach/detach events..."
-    fi
-    return $retval
-}
-
-case "$1" in
-    start|stop|restart)
-        $1
-        ;;
-    reload|force-reload)
-        restart
-        ;;
-    status)
-        oct_status
-        ;;
-    try-restart|condrestart)
-  	[ ! -f $lockfile ] || restart
-	;;
-    *)
-        echo $"Usage: $0 {start|stop|status|restart|try-restart|reload|force-reload}"
-        exit 2
-esac
diff --git a/meta-oe/recipes-support/openct/openct/openct.service b/meta-oe/recipes-support/openct/openct/openct.service
deleted file mode 100644
index 57de8c0a88..0000000000
--- a/meta-oe/recipes-support/openct/openct/openct.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=Openct Middleware framework for smart card terminals
-After=syslog.target network.target
-
-[Service]
-EnvironmentFile=-/etc/sysconfig/openct
-ExecStart=/usr/sbin/openct-control $OPENCT_OPTIONS init 
-ExecStop=/usr/sbin/openct-control $OPENCT_OPTIONS shutdown
-RemainAfterExit=yes
-KillMode=mixed
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-oe/recipes-support/openct/openct/openct.sysconfig b/meta-oe/recipes-support/openct/openct/openct.sysconfig
deleted file mode 100644
index ffc270790f..0000000000
--- a/meta-oe/recipes-support/openct/openct/openct.sysconfig
+++ /dev/null
@@ -1,5 +0,0 @@
-#                                                                    -*- sh -*-
-# Extra options to pass to openct-control.
-# Consult "/usr/sbin/openct-control -h" for available options.
-#
-OPENCT_OPTIONS=""
diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
deleted file mode 100644
index c7b0d0d56d..0000000000
--- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
+++ /dev/null
@@ -1,91 +0,0 @@
-SUMMARY = "Middleware framework for smart card terminals"
-HOMEPAGE = "https://github.com/OpenSC/openct/wiki"
-DESCRIPTION = " \
-OpenCT implements drivers for several smart card readers. \
-It comes as driver in ifdhandler format for PC/SC-Lite, \
-as CT-API driver, or as a small and lean middleware, \
-so applications can use it with minimal overhead. \
-OpenCT also has a primitive mechanism to export smart card \
-readers to remote machines via TCP/IP."
-
-DEPENDS += "libtool pcsc-lite libusb-compat"
-
-SRC_URI = " \
-    https://downloads.sourceforge.net/project/opensc/${BPN}/${BPN}-${PV}.tar.gz \
-    file://etc-openct.udev.in-disablePROGRAM.patch \
-    file://etc-openct_usb.in-modify-UDEVINFO.patch \
-    file://0001-m4-Just-emit-the-first-line-of-compiler-version.patch \
-    file://openct.init \
-    file://openct.sysconfig \
-    file://openct.service \
-    file://0001-Fix-incompatible-pointer-type-error-with-gcc-option.patch \
-"
-
-SRC_URI[sha256sum] = "6cd3e2933d29eb1f875c838ee58b8071fd61f0ec8ed5922a86c01c805d181a68"
-
-UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/opensc/files/openct/"
-
-LICENSE = "LGPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-inherit systemd
-SYSTEMD_SERVICE:${PN} += "openct.service "
-SYSTEMD_AUTO_ENABLE = "enable"
-
-EXTRA_OECONF = " \
-    --disable-static \
-    --enable-usb \
-    --enable-pcsc \
-    --enable-doc \
-    --enable-api-doc \
-    --with-udev=${nonarch_libdir}/udev \
-    --with-bundle=${libdir}/pcsc/drivers \
-"
-
-inherit autotools pkgconfig
-
-FILES:${PN} += " \
-    ${libdir}/ctapi \
-    ${nonarch_libdir}/udev \
-    ${libdir}/openct-ifd.so \
-    ${libdir}/pcsc \
-"
-
-FILES:${PN}-dbg += " \
-    ${libdir}/ctapi/.debug \
-    ${libdir}/pcsc/drivers/openct-ifd.bundle/Contents/Linux/.debug \
-"
-
-INSANE_SKIP:${PN} += "dev-deps"
-
-do_install[cleandirs] += "${D}"
-
-do_install () {
-    install -d ${D}${sysconfdir}
-    # fix up hardcoded paths
-    sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
-        ${UNPACKDIR}/openct.service ${UNPACKDIR}/openct.init
-
-    oe_runmake install DESTDIR=${D}
-    install -dm 755 ${D}${libdir}/ctapi/
-    mv ${D}${libdir}/libopenctapi.so ${D}${libdir}/ctapi/
-    install -Dpm 644 etc/openct.udev ${D}${nonarch_libdir}/udev/rules.d/60-openct.rules
-    install -pm 644 etc/openct.conf ${D}${sysconfdir}/openct.conf
-
-    install -Dpm 755 ${UNPACKDIR}/openct.init ${D}${sysconfdir}/init.d/openct
-    install -Dpm 644 ${UNPACKDIR}/openct.sysconfig ${D}${sysconfdir}/sysconfig/openct
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 644 ${UNPACKDIR}/openct.service ${D}${systemd_unitdir}/system
-
-    so=$(find ${D} -name \*.so | sed "s|^${D}||")
-    sed -i -e 's|\\(LIBPATH\\s*\\).*|\\1$so|' etc/reader.conf
-    install -Dpm 644 etc/reader.conf ${D}${sysconfdir}/reader.conf.d/openct.conf
-}
-
-BBCLASSEXTEND = "native"
-
-# http://errors.yoctoproject.org/Errors/Details/766890/
-# openct-0.6.20/src/ifd/ifdhandler.c:239:52: error: passing argument 2 of 'ifd_get_eventfd' from incompatible pointer type [-Wincompatible-pointer-types]
-# openct-0.6.20/src/ifd/process.c:461:61: error: passing argument 4 of 'ct_tlv_get_opaque' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
-- 
2.43.0


