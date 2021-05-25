Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.7141.1621932991574135983
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 May 2021 01:56:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NEvTOnvL;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=077953792e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14P8hadp015400;
	Tue, 25 May 2021 01:56:29 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 38rr6yr659-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 May 2021 01:56:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1QSjCyDddFGw/ohsgu/ThuxlhAr1F9T3PJCGuPGtfMMIMd3forDCyPKoWbLJJ/duqslXsEwoeN9od7fFE4tLPtWxcVWNeBIZ69Lv+XgBAFZtlU4QOIcNQAkhXmg146mdf3UTG4kI1IJazPpQEwU1f+5LXldVFehcJMS9vR5RKzdirWVbmUGYaImu26R7LVwCAqJf+VQoyAKLpTbHLPKq/YWhCpYbWMxXh4ZHldL0pI0sCiPmtVrtFgI3LXw4lJn6Bdvtn3RZIWcV38HWaZXR2tCzzKh2N9F9pGPYJjdCToGiM6nPzO2FjqFiGMVFyliPpFGYlj/V8hEs5VBvUFd8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1kSnowd+9AgPETdCsjOhdWnuO5XyUE/ZdBumh3dbBc=;
 b=LcHScfthQ+LMAAT9hWCS4YNiF71QKaVsixFCWtguLhtXcIuxIdvHYv24CgZeIVqdl2bI41akFJA9X0xqfuWPZsW+9uQciAZfG8QGKqjauC+JbWzuw5k0VzDheRfmyEEkpw5cux0ulScT/GEuPhxKMimrKuIPcnr+jqjhrtbSfim+699oModPF24POPTFeSy9l3ZxsYynWBUxeOph1ZY8eH/o3/6gNg40tWFm0dF92WKMRlnTGiD/Z8cG2pXnqZwnpISg0JVAIPmGx+42gY3mKpviB9tMQClrR9Jwqa5cOyx8v+4ySn6Kz07dgWbAK7rHBDG7SEV/4AGxJF3cGlKecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v1kSnowd+9AgPETdCsjOhdWnuO5XyUE/ZdBumh3dbBc=;
 b=NEvTOnvL5ltY/1/m7jGsrxVLK8Ayr5V/OQ0rVJba85xlKNZJN1pLv5zGCK6EUbnRNfgMsZ8CiTfg1EdYTRj7UV9cRGGgFYxaEX6IyPFNUGPDwfF+NT/HQDkT/052nJA3lhu1g1uJOe6UhnGc3o0unmOLxxXO+8+p84DZNxTQYzc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1422.namprd11.prod.outlook.com (2603:10b6:300:25::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Tue, 25 May
 2021 08:56:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 08:56:27 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org, raj.khem@gmail.com
Subject: [meta-networking][RESEND][PATCH] dhcp-relay: add recipe
Date: Tue, 25 May 2021 16:56:15 +0800
Message-Id: <20210525085615.174480-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f8d57238-0030-f053-fed2-47aa916bb682@gmail.com>
References: <f8d57238-0030-f053-fed2-47aa916bb682@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SJ0PR13CA0224.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::19) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by SJ0PR13CA0224.namprd13.prod.outlook.com (2603:10b6:a03:2c1::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.12 via Frontend Transport; Tue, 25 May 2021 08:56:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fa4837c-680d-4e8b-124f-08d91f5afaea
X-MS-TrafficTypeDiagnostic: MWHPR11MB1422:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1422659C28623B587D57D82BF9259@MWHPR11MB1422.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	IzCuvy28OlvuLvXh6lyAUnJIgt4qIzmG8oQGGgDvMsfnGekwVQ7krkGk+RX5bW48mFFS8JrhS8uPuEl3rTm5Z+dJwfvkw5EUx1MDw4mAWdiYatyV/UEZh5egFT9XexioQKBgt0SbaYLdrJfDylD+DSCrwsoosAS/9xw3qr3l6hwDumFxBNfz7kRia/NT0j/PwxHz6Dc79pIUzyXhX1BhRM8qG/zBw/UIlWqrrcDnIifCv/T2rknJXD9B25t6LQdCo512KNSrCqbpXeuRheOtpUlvHVl78LK72wLzJPPm5KwngRKmFIobdMsoyerqBIZdnaPZ9jRK3bIoCQg+czZU9CmGT3Ay4LfNLgoADW2YSw6jBh9kAOtUav1renylGCjxLlgxiydw+XsEw5hnN/Il3yZLFJCgD0v1uAZ52+9zoIVTWRO6Su+l18D+Ihfbtpl3DmoQNLJklS/cRWPLC/y+W/ik19bxFw3ivEEmB8tilkYc8J5+GPprvZorybu8KU8vWS+CNjMd73NAdatRkAHUbSI2Or/HT5FqfVBqGllLzbPEOmsgXuqM5/03aG3ssk6RxxPIXSOv9fXjKD6XLswURlvxDSFmXgbUKQm8WIAd2ipvXLAhZKaTVgVTJNyHzLJE3hhTKE8gK+ur5G8zamfmy5o5Y/wx+Cn7cY+tZ6SEP/nqa0QXMe1Yy3eMh2DGz2D2E2LEOGeyC0yU9sJ9T+Fuap/f8SiHQq/iIQHVJ+A0eHkPKMwuZTXccGmXmM2r9J3qOPPjN/Wmw2wsTU6v58ityg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(39850400004)(376002)(346002)(86362001)(66574015)(5660300002)(478600001)(316002)(66476007)(2906002)(6512007)(66946007)(2616005)(66556008)(8936002)(44832011)(956004)(38100700002)(16526019)(26005)(38350700002)(8676002)(1076003)(6486002)(83380400001)(6666004)(6506007)(186003)(52116002)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?59s1z0enJ7weJs1H4/GETKpPleG351oaKxhJHlsbgMA+iW+k3OsPOY+YjCAa?=
 =?us-ascii?Q?3M8eLeczLHRhC8DzKE+LVNN1niNaOLGLnQyaLK8wn86dmjJlJtowprW28Q9w?=
 =?us-ascii?Q?thwRYmTPBMmBd04qJMrscVS8dP1XRFx31L4IcrzyQeDwvFFuSzTtE1SxL5hh?=
 =?us-ascii?Q?fjb2EqQwhhbfVzZLh+XO1sE5CiNBVrddweOaO408IyZn/+Y3kPDUhOxSaq1C?=
 =?us-ascii?Q?bXQIBNiuiu12GwuO+2a6a8csnZ8iOgu4k9VMw1lmYxE75arXt8H0c3ZaZ9yi?=
 =?us-ascii?Q?bgKcQU4kJzRK8LkpmomiFx8pI3mJsOy2m+3/scg61MtbGrKyNPk8gMG5Qvxr?=
 =?us-ascii?Q?NMtdav7CnWL6jNmzjTn0MSKMG4f9jODqo5Wl+uaeAMEQdLBGkCX6R6Y8Eeib?=
 =?us-ascii?Q?9qdHtGYe5HpVB/GagFZcaqjNK5ObO6grYo7r3DBOWZhw48iMBWMUdmY/UY3x?=
 =?us-ascii?Q?Om9Vqg0jrFPts7jBtbtWMML8FCQa2B8osYlW+KzoSrThbHevHopvRvkCt3Q1?=
 =?us-ascii?Q?84IgUu8Vmf35goqw8rs4gzR7q5+PvFb/fwebBt9b7RqyghTGQmJhsrDdtfAH?=
 =?us-ascii?Q?1zoedynHkNGQTDN421QF9ZfGD8kFNTNhn1lsGemtAP/aLCqPaqoQ1X5XmlRC?=
 =?us-ascii?Q?X6jy1L6/RWfnFCLJhwKUPQZyRyGrOhG59BG8/N8lDibzn4ge0BqVWV+GnTjP?=
 =?us-ascii?Q?ULwTUaijLPxc10ZQLHZ9Pgi39U1N26RmrMoFdgyeD8Lll0HsFJLKF+m+pBY0?=
 =?us-ascii?Q?PDhA85iVRyJy7dyk0nsIBxY6vbN7K4O0T4vPXeW/ZfGbBzuqA/y+y22/sbNO?=
 =?us-ascii?Q?AO6eEX8CW9li5zMCEJ7GUvWKGFduNgLIs8VlGjcI1LsphVOse6Kpb2Vp20E1?=
 =?us-ascii?Q?lqtDhaJRnx8Rgsnh2Zb2AMZIiG+hKom3u8cjIOg4nA7DZgQ6TcEXfLyX9uw+?=
 =?us-ascii?Q?EPD8/AekXmVQCQaQOk52VUv4mohSWn68bv4e3n2dBTeLKz1h5aaEgSfR0HH9?=
 =?us-ascii?Q?+Oa5how/eN3lR89QlMnuOZghh8RCqPes18qj9IpZ/1d3Xf7FldHn4/NInuwy?=
 =?us-ascii?Q?EdPvm5Mkyqlmi5XlB76I/h+x8svuWm9xUYJEp2vxg42iRZjzgjN1CVEImDdj?=
 =?us-ascii?Q?UI6ZtWqB7JEQobmmXcSt7zXnjvU8nFFudlwGQplXoaJ+WUFDTKyq3faIs1EJ?=
 =?us-ascii?Q?PxW4x8bDuhXlfrOkjw7wGfrA0VZcLL9fIy8S8RIiA++YyaHVuN3yFBonWmxE?=
 =?us-ascii?Q?3rK/NRKwRKVqqr7hgWelpHZez14EHa8ISY5l5fTrrr1mdF81D8YntFhOtUrv?=
 =?us-ascii?Q?WRW0PYvDSCICyDhBrbE5IqPL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fa4837c-680d-4e8b-124f-08d91f5afaea
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 08:56:27.3109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EhkgL/HqAxKH6v9WHtGXv2z1t5cI0h0rz+cUzEJXwu40c/V6vfQ+B8tvdc3S98a5Qobn81fvVdC6BKA8P6pJYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1422
X-Proofpoint-ORIG-GUID: WeiXtJbnV2rtiCsD-X49Cd1WLLU-Q7ka
X-Proofpoint-GUID: WeiXtJbnV2rtiCsD-X49Cd1WLLU-Q7ka
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-25_05:2021-05-24,2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250060
Content-Transfer-Encoding: 8bit
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
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default-relay
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-relay

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
new file mode 100644
index 000000000..bd816106c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2.bb
@@ -0,0 +1,62 @@
+SECTION = "console/network"
+SUMMARY = "Internet Software Consortium DHCP Relay Agent"
+DESCRIPTION = "A DHCP relay agent passes DHCP requests from one \
+LAN to another, so that a DHCP server is not needed on every LAN."
+
+HOMEPAGE = "http://www.isc.org/"
+
+LICENSE = "ISC"
+LIC_FILES_CHKSUM = "file://LICENSE;beginline=4;md5=004a4db50a1e20972e924a8618747c01"
+
+DEPENDS = "openssl libcap zlib"
+
+SRC_URI = "https://ftp.isc.org/isc/dhcp/${PV}/dhcp-${PV}.tar.gz \
+           file://default-relay \
+           file://init-relay \
+           file://dhcrelay.service \
+           file://0001-Makefile.am-only-build-dhcrelay.patch \
+           "
+
+SRC_URI[md5sum] = "2afdaf8498dc1edaf3012efdd589b3e1"
+SRC_URI[sha256sum] = "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521"
+
+UPSTREAM_CHECK_URI = "http://ftp.isc.org/isc/dhcp/"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
+
+S = "${WORKDIR}/dhcp-${PV}"
+
+inherit autotools-brokensep systemd
+
+SYSTEMD_SERVICE_${PN} = "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
+
+CFLAGS += "-D_GNU_SOURCE -fcommon"
+LDFLAGS_append = " -pthread"
+
+EXTRA_OECONF = "--enable-paranoia \
+                --disable-static \
+                --enable-libtool \
+                --with-randomdev=/dev/random \
+               "
+
+# Enable shared libs per dhcp README
+do_configure_prepend () {
+    cp configure.ac+lt configure.ac
+}
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
+
+    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/system
+        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+        sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/dhcrelay.service
+    else
+        install -d ${D}${sysconfdir}/init.d
+        install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-relay
+    fi
+}
+
+PARALLEL_MAKE = ""
diff --git a/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
new file mode 100644
index 000000000..fed85d2a8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/0001-Makefile.am-only-build-dhcrelay.patch
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
+ 
+ # Use an autoconf substitution vs an automake conditional here
+ # to fool automake when the bind directory does not exist.
+-SUBDIRS = @BINDSUBDIR@ includes tests common omapip client dhcpctl relay server
++SUBDIRS = @BINDSUBDIR@ includes common omapip relay
+ 
+ DIST_SUBDIRS = $(SUBDIRS) keama
+ 
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-relay b/meta-networking/recipes-connectivity/dhcp/files/default-relay
new file mode 100644
index 000000000..7961f014b
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/default-relay
@@ -0,0 +1,12 @@
+# Defaults for dhcp-relay initscript
+# sourced by /etc/init.d/dhcp-relay
+
+# What servers should the DHCP relay forward requests to?
+# e.g: SERVERS="192.168.0.1"
+SERVERS=""
+
+# On what interfaces should the DHCP relay (dhrelay) serve DHCP requests?
+INTERFACES=""
+
+# Additional options that are passed to the DHCP relay daemon?
+OPTIONS=""
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
new file mode 100644
index 000000000..15ff927d3
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhcrelay.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=DHCP Relay Agent Daemon
+After=network.target
+
+[Service]
+EnvironmentFile=@SYSCONFDIR@/default/dhcp-relay
+ExecStart=@SBINDIR@/dhcrelay -d --no-pid -q $SERVERS
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-relay b/meta-networking/recipes-connectivity/dhcp/files/init-relay
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
+IFCMD=""
+if test "$INTERFACES" != ""; then
+	for I in $INTERFACES; do
+		IFCMD=${IFCMD}"-i "${I}" "
+	done
+fi
+
+DHCRELAYPID=/var/run/dhcrelay.pid
+
+case "$1" in
+	start)
+		start-stop-daemon -S -x /usr/sbin/dhcrelay -- -q $OPTIONS $IFCMD $SERVERS
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
+		exit 1 
+esac
+
+exit 0
-- 
2.25.1

