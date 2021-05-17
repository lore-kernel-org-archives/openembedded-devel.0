Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.84])
 by mx.groups.io with SMTP id smtpd.web08.15338.1621230847306589879
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 May 2021 22:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DzlH3Vfr;
 spf=pass (domain: windriver.com, ip: 40.107.220.84, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dz+YzJuXZoNdJ5X/T8KM+z1JIlXfZ40UVO5wGpukhtwOnoCY29/tt73YqgN7vBLFI8j/zrmwLDxtutejYE28M8fcVe2n5DQKZ4gkrke3IaALWqp/iMRFtp9ZqGWZL87U6Fi/8fZG5d0Mz7fR92NCDXKYq5Pk61kq0rqRPEx8DNg2LZgzTkxPbGVZw5JQMz5jkz3mf20lUatibVaiPmO3mVm4QBRs/LzeeK3RZWVNOCEpYgePKSzZfdF4mydM/rrogxh70WNdg3rxuDkEhIEFp4u70tQgeG4LJ412XtQlvARFcRbFFguBhGapnpJxKlufgdterSjHjYawksivduaJdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1kSnowd+9AgPETdCsjOhdWnuO5XyUE/ZdBumh3dbBc=;
 b=b/Kel/qx9/F8N/mEX0NB+grPQRqWdEltomziEeAhODcThGvCGDcF6eycbahi/CIcsmxRowKLFz+H5U5sWV7iuGhzwJHBomq65wdnSgAeDIWeKUGgIsZpOi3+R2fjf93Au+Y394HuXDBwZUEAII6Y0w2h1kdrs1hOeNrDzoe2P9aA/GXPtaB5j8gQ11fEeq6CaOBgAEabKN8jVZxl89f+JdTxuoIjJIMtWIl1ZkXxNJQNlQ0LCFxZ+wF6L4Z2a6Fp2yEaPkPelQAoAIgli5oJAjPNYn4nuSUiHIEFKQWLtAAbXC5Y+0ITIIbv1f+2U/aTIVSyAxtzmXSGHTSUUQDGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1kSnowd+9AgPETdCsjOhdWnuO5XyUE/ZdBumh3dbBc=;
 b=DzlH3VfrbeGiRLhqG32u3RNnWfnw1sA/2r4SVLAVqRCCgkCS9vI7XECr+3wiV4DSIar+kA+2whkfLGvOxfK3KrQFOTsOwgjtpT2XbC9GEIJnopFaW18REOvc2dvuKbJCo+V5LPIimC7AE6jBPYaVtiCxGRxvm9yLjd151ZPIGbc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR1101MB2349.namprd11.prod.outlook.com (2603:10b6:300:79::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Mon, 17 May
 2021 05:54:04 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4129.031; Mon, 17 May 2021
 05:54:04 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dhcp-relay: add recipe
Date: Mon, 17 May 2021 13:53:31 +0800
Message-ID: <20210517055331.240999-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Mon, 17 May 2021 05:53:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b75f28a3-106c-4e4f-1055-08d918f821b5
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2349:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB23498CA009DABFBF59365688F92D9@MWHPR1101MB2349.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GjU/O9w+DOOoYDWrJ1pNSPaXHYFAEpZU2kjtGZ9+vGDj5luZvo3ArXNfcpmyRHsVmVkssvaCrHBDfuDvg7E+QYtADItrIDWoGCLNRhsXCxEbtxLjFjgdwuHQHxu0u2GtXD3mSsY5DVKQF6gK/2BSHmVhwnHw/aUf2k5Ex78vbt5anJ/9jlLUKNwKbPn3PgKn1Kuh0ClDG808PIUYU/TdS86Tevg8z2kudp06yi5bFPGdD6Ddkxj0bszsuryDFaP8LXOeUO+TJs5ws+/xBfOkD5gvr/Q7wQkhNAJLNh9jDM9Et4NQvBVYcgJoPB8fUK1vgCBHjbLsDpr3224AqoXsctsDqbrSr4i80D4hsLGHzPUc+/qIU2wTVqBGD5DWDoYaiyCkbqX16pXsrkQFooCmYFbostzrYbQXaYKXBhSpwFCtnlJbLCJpkWu15nBf9aP98iG8053Csm0abiOWATptKSLIgEROFUOjZg54WAYyDrszarn0D2SAh4nGwxu7yelyTGHWEGLsXblfl+rO114tWkDq9kAogZyhAri+ppfoxUnIUDuCdCWWOYkKDvlX4zIFT5cSPDTCWh0+WL6yjXeC98kfcvrHEusgrrrxBrbC2rSsdH7TbNCo9RZtF/+wIXxz0/qobz4KVfHk+BHZmfC1YxjXKgRVi043JTCI5LkSWOAQr1VhK4NdsOkBhBSCzDnG28F/N3lcKuEWVIcqlPLEDjFqqpY19tBdECoNu/Bg2i9XUZJgl3EjCdv1+hfduGRmQOGzQ0WKtve3zYmOaJPPQQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39840400004)(376002)(6916009)(5660300002)(6666004)(66574015)(186003)(16526019)(316002)(2906002)(956004)(36756003)(66556008)(66476007)(26005)(66946007)(38350700002)(38100700002)(6506007)(83380400001)(86362001)(52116002)(478600001)(44832011)(1076003)(6512007)(8936002)(2616005)(8676002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?R5IFT3LjAvRg9xl9cMhAWJ0KQEsXuOqx7znunMKyv02TNSNflesHZ/w0wicS?=
 =?us-ascii?Q?2DYij+M2KXQucQnTGm236VfYj/BqokMjNZ+LAw+Xx3A9VWD72uep8YWaKxX6?=
 =?us-ascii?Q?kWSPOR/PKQ7Z06TDDupXPSwHVOCKS2l6UThjjomsg3vBkdOC51PDfPmwRBer?=
 =?us-ascii?Q?lZrpsTdVqnuDrwSOW1AXtWCK+NAEgeYaMlceYwnsQlsEtCyecpcFTgPbRTsQ?=
 =?us-ascii?Q?Zk9ZdyS8PAwWx+Vv9Gvy9V9Ntc3Mxnz5IoF+CZuaEjnp63Dorwe9FbXeMmdZ?=
 =?us-ascii?Q?Mf0FjD87YzWtTMsDqmY1G3QFDKLXP8sxeIWqpW5S+7lIkrvXMckIOjy3FRiy?=
 =?us-ascii?Q?SA0XdbLGMFHJ+0KeuQLq28Wu1J5LdtObIESwE12mASbjDxNZJlCCygUBfIPF?=
 =?us-ascii?Q?t5oV9lk4PXBxjSCORfpFymCBXmquzoJ+PuOVJyAd7hU7+djhbHENaT3AcFac?=
 =?us-ascii?Q?9/bTlGJaOsmXWKsdsIcI5s/bpyF/vrXuI8paNMlOL04Bqj0BZH5mTKuFpR3z?=
 =?us-ascii?Q?n6n3YchF0yGVsmOf7NFOt4izcCi1vJzq9q6g0kNkuNyNcAVVEh6Pyo6JwvTI?=
 =?us-ascii?Q?FDBjTinEEPAcwTsZqUmORAiYuZV17NAlhadGjaYxTQRCfZBySC+fboFkD/L5?=
 =?us-ascii?Q?drlOwDsnkQU58IpYKq/BcqzJvRam3jWfY5Esl3lB6yPI2ITg8BAGzQzKAHlM?=
 =?us-ascii?Q?Mm+mxSGu+zMiUm9OGVmDoK2VpRtQ7pV1N0UFmhY5LepGj8MsM1PWAZo1Z28q?=
 =?us-ascii?Q?++ibXA7Y44q5h+SXpuGZiUUdojJPpbNZIibhhdIjI3BS7Vd/KC+xjF2Pp25J?=
 =?us-ascii?Q?jOE9pl/x6tjMbPYSlhgGJrGSgFgG3Ss4m3AdEk7vSvxG/BAkwkGZzAk2G8eM?=
 =?us-ascii?Q?advB2WdN0p6/2LwI5gSjqR8e4N1+ns7xJP0t7Rnm0idTlEjid8neLxQli0PI?=
 =?us-ascii?Q?PG8Qfeq0OPOtDQuUpTxUjZ61rflSWRKkyigRlJb84ePt+064+ZsM22HbqJ+G?=
 =?us-ascii?Q?w3GTsVqCEYGbgiitj8c+kurJ0GJNSSjY/B3xorln+NvsTr4PR2KkpDlPafi5?=
 =?us-ascii?Q?xsOKItv5dpTwChxgjMWCOY/Ibnuz9t/oFdEFwUspZt55Ljw1Ds0VyU5igboy?=
 =?us-ascii?Q?6Q58rSTMHbI2w8ZpE+jJXS9VA2uBnQhmbSYhhty3rWE2TT58tq8mEChHDyPp?=
 =?us-ascii?Q?Qglfd9+odakX4oqljJWLXffqP9apadERCtvMeq5zLGw4opTY7gjQkmtqc/GU?=
 =?us-ascii?Q?/Jeb4ruYZHqsrED8WBlxDp2uxKq+2ciCexzSVxkHB6vsc/Oq/Ir0Ho5vwL+v?=
 =?us-ascii?Q?ogWdzflvzdx7NfzzVvkiF44k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b75f28a3-106c-4e4f-1055-08d918f821b5
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2021 05:54:04.2711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sex0k2AKHUVohxKaiSt1q3+kV88TzYG4zOQPx/GjWUTiA+ORsozYPGJ6/JiANnhWarTCinYx4qkEvb+l4Vryg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2349
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

The current default dhcp server kea in oe-core doesn't provide
dhcp-relay tool. Add a recipe to provide dhcrelay which is from dhcp.
This patch is picked up from dhcp recipe with some tweaks. In order to
fix the build dependency, we use bundled bind instead of external bind.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../dhcp/dhcp-relay_4.4.2.bb                  | 62 +++++++++++++++++++
 ...0001-Makefile.am-only-build-dhcrelay.patch | 30 +++++++++
 .../dhcp/files/default-relay                  | 12 ++++
 .../dhcp/files/dhcrelay.service               | 10 +++
 .../dhcp/files/init-relay                     | 44 +++++++++++++
 5 files changed, 158 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.=
4.2.bb
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0001-Ma=
kefile.am-only-build-dhcrelay.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default=
-relay
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrela=
y.service
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-re=
lay

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb =
b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
new file mode 100644
index 000000000..bd816106c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -0,0 +1,62 @@
+SECTION =3D "console/network"
+SUMMARY =3D "Internet Software Consortium DHCP Relay Agent"
+DESCRIPTION =3D "A DHCP relay agent passes DHCP requests from one \
+LAN to another, so that a DHCP server is not needed on every LAN."
+
+HOMEPAGE =3D "http://www.isc.org/"
+
+LICENSE =3D "ISC"
+LIC_FILES_CHKSUM =3D "file://LICENSE;beginline=3D4;md5=3D004a4db50a1e20972=
e924a8618747c01"
+
+DEPENDS =3D "openssl libcap zlib"
+
+SRC_URI =3D "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+           file://default-relay \
+           file://init-relay \
+           file://dhcrelay.service \
+           file://0001-Makefile.am-only-build-dhcrelay.patch \
+           "
+
+SRC_URI[md5sum] =3D "2afdaf8498dc1edaf3012efdd589b3e1"
+SRC_URI[sha256sum] =3D "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620=
f4f5f607004521"
+
+UPSTREAM_CHECK_URI =3D "http://ftp.isc.org/isc/dhcp/"
+UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+\.\d+\.(\d+?))/"
+
+S =3D "${WORKDIR}/dhcp-${PV}"
+
+inherit autotools-brokensep systemd
+
+SYSTEMD_SERVICE_${PN} =3D "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE_${PN} =3D "disable"
+
+CFLAGS +=3D "-D_GNU_SOURCE -fcommon"
+LDFLAGS_append =3D " -pthread"
+
+EXTRA_OECONF =3D "--enable-paranoia \
+                --disable-static \
+                --enable-libtool \
+                --with-randomdev=3D/dev/random \
+               "
+
+# Enable shared libs per dhcp README
+do_configure_prepend () {
+    cp configure.ac+lt configure.ac
+}
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhc=
p-relay
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}=
; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}=
/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system=
/dhcrelay.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/=
system/dhcrelay.service
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhc=
p-relay
+    fi
+}
+
+PARALLEL_MAKE =3D ""
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.=
am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/fi=
les/0001-Makefile.am-only-build-dhcrelay.patch
new file mode 100644
index 000000000..fed85d2a8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only=
-build-dhcrelay.patch
@@ -0,0 +1,30 @@
+From 17cc080e58894644dd18664ac6f3451096d5f065 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Thu, 13 May 2021 15:23:16 +0800
+Subject: [PATCH] Makefile.am: only build dhcrelay
+
+Drop client and server build as we don't need them.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index ed692a5..34f9772 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -38,7 +38,7 @@ endif
+=20
+ # Use an autoconf substitution vs an automake conditional here
+ # to fool automake when the bind directory does not exist.
+-SUBDIRS =3D @BINDSUBDIR@ includes tests common omapip client dhcpctl rela=
y server
++SUBDIRS =3D @BINDSUBDIR@ includes common omapip relay
+=20
+ DIST_SUBDIRS =3D $(SUBDIRS) keama
+=20
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-relay =
b/meta-networking/recipes-connectivity/dhcp/files/default-relay
new file mode 100644
index 000000000..7961f014b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
@@ -0,0 +1,12 @@
+# Defaults for dhcp-relay initscript
+# sourced by /etc/init.d/dhcp-relay
+
+# What servers should the DHCP relay forward requests to?
+# e.g: SERVERS=3D"192.168.0.1"
+SERVERS=3D""
+
+# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
+INTERFACES=3D""
+
+# Additional options that are passed to the DHCP relay daemon?
+OPTIONS=3D""
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.servi=
ce b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
new file mode 100644
index 000000000..15ff927d3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=3DDHCP Relay Agent Daemon
+After=3Dnetwork.target
+
+[Service]
+EnvironmentFile=3D@SYSCONFDIR@/default/dhcp-relay
+ExecStart=3D@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-relay b/m=
eta-networking/recipes-connectivity/dhcp/files/init-relay
new file mode 100644
index 000000000..019a7e84c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/init-relay
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# $Id: dhcp3-relay,v 1.1 2004/04/16 15:41:08 ml Exp $
+#
+
+# It is not safe to start if we don't have a default configuration...
+if [ ! -f /etc/default/dhcp-relay ]; then
+	echo "/etc/default/dhcp-relay does not exist! - Aborting..."
+	echo "create this file to fix the problem."
+	exit 1
+fi
+
+# Read init script configuration (interfaces the daemon should listen on
+# and the DHCP server we should forward requests to.)
+. /etc/default/dhcp-relay
+
+# Build command line for interfaces (will be passed to dhrelay below.)
+IFCMD=3D""
+if test "$INTERFACES" !=3D ""; then
+	for I in $INTERFACES; do
+		IFCMD=3D${IFCMD}"-i "${I}" "
+	done
+fi
+
+DHCRELAYPID=3D/var/run/dhcrelay.pid
+
+case "$1" in
+	start)
+		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVER=
S
+		;;
+	stop)
+		start-stop-daemon -K -x /usr/sbin/dhcrelay
+		;;
+	restart | force-reload)
+		$0 stop
+		sleep 2
+		$0 start
+		;;
+	*)
+		echo "Usage: /etc/init.d/dhcp-relay {start|stop|restart|force-reload}"
+		exit 1=20
+esac
+
+exit 0
--=20
2.25.1

