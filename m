Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8016DC4707C
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 08:51:42 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.3410.1705049499866342760
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 00:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="124725953"
X-IronPort-AV: E=Sophos;i="6.04,189,1695654000"; 
   d="scan'208";a="124725953"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2024 17:51:37 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AAD5D50B1
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 17:51:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B0D1D3F2E
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 17:51:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E55952007B714
	for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 17:51:33 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 807391A0070;
	Fri, 12 Jan 2024 16:51:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] frr: Fix install conflict  when enable multilib.
Date: Fri, 12 Jan 2024 16:51:23 +0800
Message-Id: <1705049483-30941-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28114.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28114.006
X-TMASE-Result: 10--12.926600-10.000000
X-TMASE-MatchedRID: WEhXzTeHU+aMPz8Goa6fXdl0i+WyI+91C//1TMV5chO4GyTmeN+AbLRj
	qdUKeL4YDVHHAE0cndTxNdSJNcNeLJgbaf/qJzUdb/oIJuUAIuHxuhkRWK22GIMogwlv6PZoDJw
	RJ6RwBAFPvZfZHGeBclq2wMYALD4n0vxh6c85bkQaWyhV4E2vAX607foZgOWyCednjFOfspyKFp
	UuXMOO1bEzThseKC1BxVa37B5t6UBFeIgwm+98D513aYUE0ivymZiw53dqSN+ysPB8dBBorXKn6
	DBj/gsEIvrftAIhWmLy9zcRSkKatcwitucT3dE7s0T0PE+KHuWYu54KOb/ndJsoi2XrUn/JUTdY
	/mdfTXtJKW4mDlJsMSAHAopEd76v8WkFMOEZb9sKEPdn+eTLU9UO8dzlTvMU0kdYl/R5fV1nqtM
	VqPGdNQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 08:51:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108234

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
  file /usr/lib/systemd/system/frr.service conflicts between attempted installs of frr-9.1-r1.cortexa57 and lib32-frr-9.1-r1.armv7ahf_neon
  file /usr/lib/systemd/system/frr@.service conflicts between attempted installs of frr-9.1-r1.cortexa57 and lib32-frr-9.1-r1.armv7ahf_neon
  file /usr/include/frr/version.h conflicts between attempted installs of lib32-frr-dev-9.1-r1.armv7ahf_neon and frr-dev-9.1-r1.cortexa57

The differences of version.h are as follows:
@@ -32,7 +32,7 @@
 #define FRR_VER_SHORT   "9.1"
 #define FRR_BUG_ADDRESS "https://github.com/frrouting/frr/issues"
 #define FRR_COPYRIGHT   "Copyright 1996-2005 Kunihiro Ishiguro, et al."
-#define FRR_CONFIG_ARGS "'--build=x86_64-linux' '--host=aarch64-poky-linux' '--target=aarch64-poky-linux' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib64' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=' '--sbindir=/usr/lib64/frr' '--sysconfdir=/etc/frr' '--localstatedir=/var/run/frr' '--enable-vtysh' '--enable-multipath=64' '--enable-user=frr' '--enable-group=frr' '--enable-vty-group=frrvty' '--enable-configfile-mask=0640' '--enable-logfile-mask=0640' '--disable-doc' '--with-clippy=/usr/lib/clippy' '--disable-static' '--disable-capabilities' '--disable-cumulus' '--disable-datacenter' '--disable-fpm' '--disable-grpc' '--disable-ospfapi' '--disable-ospfclient' '--without-l
 ibpam' '--disable-protobuf' '--disable-snmp' '--disable-zeromq' 'build_alias=x86_64-linux' 'host_alias=aarch64-poky-linux' 'target_alias=aarch64-poky-linux' 'AR=aarch64-poky-linux-gcc-ar' 'LD=aarch64-poky-linux-ld --sysroot= ' 'OBJCOPY=aarch64-poky-linux-objcopy' 'OBJDUMP=aarch64-poky-linux-objdump' 'RANLIB=aarch64-poky-linux-gcc-ranlib' 'STRIP=aarch64-poky-linux-strip' 'PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/share/pkgconfig://usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=/usr/lib64/pkgconfig' 'CC=aarch64-poky-linux-gcc -mcpu=cortex-a57 -march=armv8-a+crc -mbranch-protection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=' 'CPPFLAGS=' 'CPP=aarch64-poky-linux-gcc -E --sysroot= -mcpu=cortex-a57 -march=armv8-a+crc -mbranch-protection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security' 'CXX=aarch64-poky-linux-g++ -mcpu=cortex-a57 -march=armv8-a+crc -mbranch-prot
 ection=standard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=' 'PYTHON=/usr/bin/python3-native/python3'"
+#define FRR_CONFIG_ARGS "'--build=x86_64-linux' '--host=arm-pokymllib32-linux-gnueabi' '--target=arm-pokymllib32-linux-gnueabi' '--prefix=/usr' '--exec_prefix=/usr' '--bindir=/usr/bin' '--sbindir=/usr/sbin' '--libexecdir=/usr/libexec' '--datadir=/usr/share' '--sysconfdir=/etc' '--sharedstatedir=/com' '--localstatedir=/var' '--libdir=/usr/lib' '--includedir=/usr/include' '--oldincludedir=/usr/include' '--infodir=/usr/share/info' '--mandir=/usr/share/man' '--disable-silent-rules' '--disable-dependency-tracking' '--with-libtool-sysroot=' '--sbindir=/usr/lib/frr' '--sysconfdir=/etc/frr' '--localstatedir=/var/run/frr' '--enable-vtysh' '--enable-multipath=64' '--enable-user=frr' '--enable-group=frr' '--enable-vty-group=frrvty' '--enable-configfile-mask=0640' '--enable-logfile-mask=0640' '--disable-doc' '--with-clippy=/usr/lib/clippy' '--disable-static' '--disable-capabilities' '--disable-cumulus' '--disable-datacenter' '--disable-fpm' '--disable-grpc' '--disable-ospfapi' '--disable-ospfcl
 ient' '--without-libpam' '--disable-protobuf' '--disable-snmp' '--disable-zeromq' 'build_alias=x86_64-linux' 'host_alias=arm-pokymllib32-linux-gnueabi' 'target_alias=arm-pokymllib32-linux-gnueabi' 'AR=arm-pokymllib32-linux-gnueabi-gcc-ar' 'LD=arm-pokymllib32-linux-gnueabi-ld --sysroot= ' 'OBJCOPY=arm-pokymllib32-linux-gnueabi-objcopy' 'OBJDUMP=arm-pokymllib32-linux-gnueabi-objdump' 'RANLIB=arm-pokymllib32-linux-gnueabi-gcc-ranlib' 'STRIP=arm-pokymllib32-linux-gnueabi-strip' 'PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/share/pkgconfig:/ubinux-dev/ubinux001/contribution/build_xh/tmp/work/armv7ahf-neon-pokymllib32-linux-gnueabi/lib32-frr/9.1/recipe-sysroot//usr/share/pkgconfig' 'PKG_CONFIG_LIBDIR=/usr/lib/pkgconfig' 'CC=arm-pokymllib32-linux-gnueabi-gcc -march=armv7-a -mfpu=neon -mfloat-abi=hard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=' 'CPPFLAGS=' 'CPP=arm-pokymllib32-linux-gnueabi
 -gcc -E --sysroot= -march=armv7-a -mfpu=neon -mfloat-abi=hard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64' 'CXX=arm-pokymllib32-linux-gnueabi-g++ -march=armv7-a -mfpu=neon -mfloat-abi=hard -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=' 'PYTHON=/usr/bin/python3-native/python3'"

 #define FRR_DEFAULT_MOTD \
        "\n" \

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-protocols/frr/frr_9.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index 5cc19d09d..0926f8421 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -46,7 +46,7 @@ PACKAGECONFIG[ospfclient] = "--enable-ospfapi --enable-ospfclient,--disable-ospf
 
 EXTRA_OECONF:class-native = "--enable-clippy-only"
 
-EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
+EXTRA_OECONF:class-target = "--sbindir=${libexecdir}/frr \
                              --sysconfdir=${sysconfdir}/frr \
                              --localstatedir=${localstatedir}/run/frr \
                              --enable-vtysh \
@@ -74,7 +74,7 @@ SYSTEMD_PACKAGES = "${PN}"
 SYSTEMD_SERVICE:${PN} = "frr.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-inherit update-alternatives
+inherit update-alternatives multilib_script multilib_header
 
 ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE:${PN} = " ietf-interfaces "
@@ -95,6 +95,7 @@ do_install:class-native () {
 
 do_install:append:class-target () {
     install -m 0755 -d ${D}${sysconfdir}/frr
+    install -m 0755 -d ${D}${libexecdir}/frr
     install -m 0640 ${S}/tools/etc/frr/* ${D}${sysconfdir}/frr/
     chown frr:frrvty ${D}${sysconfdir}/frr
     chown frr:frr ${D}${sysconfdir}/frr/*
@@ -123,6 +124,7 @@ do_install:append:class-target () {
         echo "d /run/frr 0755 frr frr -" \
             > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
+    oe_multilib_header frr/version.h
 }
 
 USERADD_PACKAGES = "${PN}"
-- 
2.34.1


