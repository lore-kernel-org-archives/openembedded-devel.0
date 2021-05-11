Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.46])
 by mx.groups.io with SMTP id smtpd.web11.9047.1620714296824907582
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 May 2021 23:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=RdGfx8l9;
 spf=pass (domain: windriver.com, ip: 40.107.223.46, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kS5zDNeNTtCNSkr/wXg4Aap7jdL27sadCamus46UpVbf6jeCEpq2kqoB/bQkTjVIbY6ZlGa8NqcYXfxSiW21+5zRKBVYQP3Uj0/FoepBtLchSZaV2HONrBjpDNV9tPu7aXuHw6zDqQBsHAesH3HctLm5vOuGiZGD7IPVeyAlvfVpdH9McN9It8nC95oeGmpggVIIg02rd9kSC77rzUJyZYTPkqablh58DTD0hycdRAdPuOgbTRchoIAf+qtp/aTuOA6/Ti0wD7ncNn3IUEvYXyQJsL8vY4NreiQRQcUC8ldUJa3RapyV++8uVBwFkpKndSwoSL1e1xZn4hu2YKuMyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/Wb3v3o0IG6uMvSl1CCe6FM+EF8pY7AmSkluP5g8WY=;
 b=hfkhKYDctrkwTP8Tsca/ePZJtf+n186SkxZ9o3idMBPhTWw7A004cJkvr50IPV+rDUDRYuZbCJeIDWhxqHxvgVf9gYnjNC7fglQRxGTGghgkzr3pntgOdcQZumK4kMq6MhvnOWLkNgtikbHK9JVpTqN5cd+aiw9TfGsN8jU7gX9th6WxBKt63KuU1xK/Zm9CGt+lEx+9ICerWCN91mZ3SSxdO/sWVBLm03c0d9eYXPBqDDmVYAjJXbvzR79qy3lgrUkaEHRr8P81JmDXVfEWEOV46rjp2EbDWQ5NJzko/YrUnlEIQJF33U4ierCU6RDFMRICHGpc7XqZn3CyF7QfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/Wb3v3o0IG6uMvSl1CCe6FM+EF8pY7AmSkluP5g8WY=;
 b=RdGfx8l9H29ptsGVB4B2CLuv2CRdzVzjImXMf7FkxRSrwoEO+Z6hdy0bz9dn8I0Rh19ToESMKZp+HbwiBMcfd8fmH1V1KtHWuNMZrLeV6Thv+jsQTPJHT3gCo3qQiNKHOvdzHVigAJaWERDjBqQAZWBhdFFaaHmoauDbgT6gAh8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB2032.namprd11.prod.outlook.com (2603:10b6:300:2b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 06:24:54 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::55fe:763e:6961:7bbf%4]) with mapi id 15.20.4108.031; Tue, 11 May 2021
 06:24:54 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] dhcp: add recipe
Date: Tue, 11 May 2021 14:24:39 +0800
Message-ID: <20210511062439.135521-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:202:2e::26) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR06CA0014.apcprd06.prod.outlook.com (2603:1096:202:2e::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend Transport; Tue, 11 May 2021 06:24:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92222943-a798-4590-f25f-08d914457cd8
X-MS-TrafficTypeDiagnostic: MWHPR11MB2032:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB2032C5BDDF1D0CD3FDC0A74BF9539@MWHPR11MB2032.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xv3D0UVL7pstjAB1wls8KlEXPbxBnOnAWJcswjRqqz3cNmLx7Qa6Uaa2jFk3NbImNnyZOS87ND3XHhNewleU69TS4vPtB5ZhAk7GYbV71d/o299TAj9g7s4eUuW+uXSIJAnCeHx8aPq8lwckrZwxn+QKVQ0AukKaWbBDlisXDaU+1co/JlJmu7MamBnGfO0eibY4+iC0nLpUa+MhYPDbbCvRkTjxsn5xduXPPGIiUosZfGR4LPjWk6RSmbqLagZO/BpwH/OS/LKviTcuxAvyeztwjDTB/YTjbuHIDQ0QPPPyNT7D0eQWbs4ooh2AbXDfypT3amKSlALDDUY/ZseUAD4gooefxRQ9fFv9T/LAXe20iYh9jtUoE3pa2Js6sDV2Kq5dh0HxislA5LOBozvctPcAeEf8kkmPgdb39yVfFf8snEmIVx+E9lhbTnk0qmi4e7dQmSYK2doKoX6PeD/yaZqXB9r5s9VvCGdQ8Cf4B8+6pV7QNRCZ5K4awdSER6BVNWepLt+YpJMnyMGCGbZ9zk+lI0ftePA//E5BnwZlDhGDIwerl8EvPtoV4AtjR+0JJbXFZhvf8cuhffH8KzMlXLAZtRjQBS7VyAzeK6c8DnOkP18nTCHlUefXhuRbO6LgUtY/uplNYMajOQef181zWnW/ynstb0WXLri4DpIVfT+XIe4YYTGx2ESUMydF0KI8PG62dOlPPKQXM+gTZJngvpfTOUvvxBlDophgkwO20Cc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39830400003)(6512007)(6506007)(5660300002)(6486002)(44832011)(66574015)(38350700002)(38100700002)(8936002)(52116002)(83380400001)(6666004)(26005)(2906002)(30864003)(66476007)(16526019)(66946007)(8676002)(6916009)(2616005)(956004)(1076003)(186003)(316002)(478600001)(66556008)(86362001)(36756003)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?XRTzeqpAvlL74zMWdpyZkAjPSVycssCcKHaxGfuZflOilGUix4AuGBsO3feI?=
 =?us-ascii?Q?Ia8zi6hYkB0gXhLBG0sQaCylsrkp4EMk8KJaluMavjhh3y+4q5/QMvqkqR6v?=
 =?us-ascii?Q?vJgyOF+TAGSGBTnt8Az3NnlEux/+NkANHKrxjo1WMZZ8l2cDkOM9d7zDVPoB?=
 =?us-ascii?Q?MzoRKSGmkmebxeGNyHt5KQw/DzaxERtTW3zQRg12zBWr8UBhNyo8wDxa1y9/?=
 =?us-ascii?Q?tS3Y3Ov7DyMuSj8QSp2ZE04C6IZT8l2adOkgI5Uc+IFHqrflM1SPIz7J964V?=
 =?us-ascii?Q?Vf2Ub7JXWg21QAJ6jyEc9YYeH26orQM0gHaLuvrphbAGXS4O0jiTEUBxlGNs?=
 =?us-ascii?Q?m/fWkGeWD1Uf9aRu5vCYwWxwrH6y2Lp2GOLXJrwcE7yY4NkI/A6lA/HhGHNH?=
 =?us-ascii?Q?b4a/C6JbJS+o86Uloog1n7ym2OtfpE39YdHs4thTGre+rp6z4xMWs8ZleU1a?=
 =?us-ascii?Q?SJUGpHwo14oJh8z8DdF/niOToJHAiCb6s4nztmvEJpRiBGqNzDvg7xSGsHTk?=
 =?us-ascii?Q?69hMnb5sdLBpC8EkLt+CjhXxTl/l9BpL3qC6Ki700nVH4CDP0h+LGeZWssQR?=
 =?us-ascii?Q?LSCh1QYs7PgEZ1UnimnXU97F3XxoczNT7OKLzh/AZENZOL+WYtUyU4RJSSEx?=
 =?us-ascii?Q?AJojGZBQJ8g5T5+os/15TUIhfAB0czswlp/F6kbWxusxknHVrHKmdksgYFDZ?=
 =?us-ascii?Q?9Wz7HDV9SdTFrD0CqMrRuxHfSxt9c8fDVLZIsaRJffE5drV8QYH9KB0qqQkb?=
 =?us-ascii?Q?CMTBhm+jP8AxoWFy3xIsQgxOoidsLL5lrM7vru8yDtrNuia8X26ohxOiYwbC?=
 =?us-ascii?Q?H5uTRt+KO78rd3a6wkJcB440weoN2tLQ1k74nHn50FJQFlroHwSuM0D+znGp?=
 =?us-ascii?Q?FuDLhz4tQdMZPV4Ys2+0l7sw58VpEdQqlQQk68v73gr5e2uQJAWL3kJeIAXS?=
 =?us-ascii?Q?RrYd1fv42RNmjrSQy81GxGMHSL6tdKGWekl4VHJhEQ/a+KK+4Gi3y6CGbtvE?=
 =?us-ascii?Q?t5WW0mGQJd3Kfqp1UdCzZ/PihpZ29Zz4ZyM49DHLOXOF1PmwEvMBKSUd7XiW?=
 =?us-ascii?Q?EpX4/iipZm+mHmjayLJ2cjie5TEhee5MO07QjQKGLtxh2Y37QGIkVBKfgcc+?=
 =?us-ascii?Q?WxDiu/RLGuUFu/ytjWzID6Mhx49PvsdA0hI9DIZiyT/FH2XAQWN62GP/Vn5y?=
 =?us-ascii?Q?JOjb5JLQPNQ7BiiK2Dzxvin8Q2s2bx9m6Dgieteski71lJsaKe3UjKrmuZwa?=
 =?us-ascii?Q?Ku9Yw44N5CcnINcLkNenTVU7ypeD7dM2IOFrkWZou86gWWG5sq/TC7zDvlX+?=
 =?us-ascii?Q?wKPCSaQDxhTRDhT4RIQCRdgq?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92222943-a798-4590-f25f-08d914457cd8
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2021 06:24:54.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F7jEaYWfpR4uYCq02tyS4WYFEP/7djr/eIYXqhxupyR0a903+kGb6uYycS3Gwe6chv2lgjlN61sCsZcfRTDOYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB2032
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Although kea is the default dhcp server in oe-coe, dhcp can still
provide some useful functions, e.g. dhcrelay.
This patch is picked up from oe-core with some minor tweaks. In order to
fix the build dependency, we use bundled bind instead of external bind.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-connectivity/dhcp/dhcp.inc        | 150 ++++++++++++++++++
 ...TH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch |  30 ++++
 .../dhcp/dhcp/0002-dhclient-dbus.patch        | 117 ++++++++++++++
 .../dhcp/dhcp/0003-link-with-lcrypto.patch    |  38 +++++
 .../dhcp/0004-Fix-out-of-tree-builds.patch    |  98 ++++++++++++
 ...invoke-dhclient-script-failed-on-Rea.patch |  36 +++++
 ...gument-to-make-the-libxml2-dependenc.patch |  66 ++++++++
 ...move-dhclient-script-bash-dependency.patch |  28 ++++
 ...ct-the-intention-for-xml2-lib-search.patch |  37 +++++
 ...ox-limitation-in-Linux-dhclient-scri.patch |  65 ++++++++
 .../recipes-connectivity/dhcp/dhcp_4.4.2.bb   |  24 +++
 .../dhcp/files/default-relay                  |  12 ++
 .../dhcp/files/default-server                 |   7 +
 .../dhcp/files/dhclient-systemd-wrapper       |  39 +++++
 .../dhcp/files/dhclient.conf                  |  50 ++++++
 .../dhcp/files/dhclient.service               |  13 ++
 .../dhcp/files/dhcpd.conf                     | 108 +++++++++++++
 .../dhcp/files/dhcpd.service                  |  15 ++
 .../dhcp/files/dhcpd6.service                 |  15 ++
 .../dhcp/files/dhcrelay.service               |  10 ++
 .../dhcp/files/init-relay                     |  44 +++++
 .../dhcp/files/init-server                    |  44 +++++
 22 files changed, 1046 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp.inc
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0001-def=
ine-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhc=
lient-dbus.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0003-lin=
k-with-lcrypto.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix=
-out-of-tree-builds.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhc=
p-client-fix-invoke-dhclient-script-failed-on-Rea.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add=
-configure-argument-to-make-the-libxml2-dependenc.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0007-rem=
ove-dhclient-script-bash-dependency.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhc=
p-correct-the-intention-for-xml2-lib-search.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp/0009-Wor=
karound-busybox-limitation-in-Linux-dhclient-scri.patch
 create mode 100644 meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default=
-relay
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/default=
-server
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhclien=
t-systemd-wrapper
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhclien=
t.conf
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhclien=
t.service
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcpd.c=
onf
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcpd.s=
ervice
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcpd6.=
service
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/dhcrela=
y.service
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-re=
lay
 create mode 100644 meta-networking/recipes-connectivity/dhcp/files/init-se=
rver

diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp.inc b/meta-netw=
orking/recipes-connectivity/dhcp/dhcp.inc
new file mode 100644
index 000000000..aff330d59
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp.inc
@@ -0,0 +1,150 @@
+SECTION =3D "console/network"
+SUMMARY =3D "Internet Software Consortium DHCP package"
+DESCRIPTION =3D "DHCP (Dynamic Host Configuration Protocol) is a protocol =
\
+which allows individual devices on an IP network to get their own \
+network configuration information from a server.  DHCP helps make it \
+easier to administer devices."
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
+           file://init-relay file://default-relay \
+           file://init-server file://default-server \
+           file://dhclient.conf file://dhcpd.conf \
+           file://dhclient-systemd-wrapper \
+           file://dhclient.service \
+           file://dhcpd.service file://dhcrelay.service \
+           file://dhcpd6.service \
+           "
+
+UPSTREAM_CHECK_URI =3D "http://ftp.isc.org/isc/dhcp/"
+UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+\.\d+\.(\d+?))/"
+
+inherit autotools-brokensep systemd useradd update-rc.d
+
+USERADD_PACKAGES =3D "${PN}-server"
+USERADD_PARAM_${PN}-server =3D "--system --no-create-home --home-dir /var/=
run/${BPN} --shell /bin/false --user-group ${BPN}"
+
+SYSTEMD_PACKAGES =3D "${PN}-server ${PN}-relay ${PN}-client"
+SYSTEMD_SERVICE_${PN}-server =3D "dhcpd.service dhcpd6.service"
+SYSTEMD_AUTO_ENABLE_${PN}-server =3D "disable"
+
+SYSTEMD_SERVICE_${PN}-relay =3D "dhcrelay.service"
+SYSTEMD_AUTO_ENABLE_${PN}-relay =3D "disable"
+
+SYSTEMD_SERVICE_${PN}-client =3D "dhclient.service"
+SYSTEMD_AUTO_ENABLE_${PN}-client =3D "disable"
+
+INITSCRIPT_PACKAGES =3D "dhcp-server"
+INITSCRIPT_NAME_dhcp-server =3D "dhcp-server"
+INITSCRIPT_PARAMS_dhcp-server =3D "defaults"
+
+CFLAGS +=3D "-D_GNU_SOURCE"
+EXTRA_OECONF =3D "--with-srv-lease-file=3D${localstatedir}/lib/dhcp/dhcpd.=
leases \
+                --with-srv6-lease-file=3D${localstatedir}/lib/dhcp/dhcpd6.=
leases \
+                --with-cli-lease-file=3D${localstatedir}/lib/dhcp/dhclient=
.leases \
+                --with-cli6-lease-file=3D${localstatedir}/lib/dhcp/dhclien=
t6.leases \
+                --enable-paranoia --disable-static \
+                --with-randomdev=3D/dev/random \
+                --enable-libtool \
+               "
+
+#Enable shared libs per dhcp README
+do_configure_prepend () {
+    cp configure.ac+lt configure.ac
+}
+
+do_install_append () {
+    install -d ${D}${sysconfdir}/init.d
+    install -d ${D}${sysconfdir}/default
+    install -d ${D}${sysconfdir}/dhcp
+    install -m 0755 ${WORKDIR}/init-relay ${D}${sysconfdir}/init.d/dhcp-re=
lay
+    install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhc=
p-relay
+    install -m 0755 ${WORKDIR}/init-server ${D}${sysconfdir}/init.d/dhcp-s=
erver
+    install -m 0644 ${WORKDIR}/default-server ${D}${sysconfdir}/default/dh=
cp-server
+
+    rm -f ${D}${sysconfdir}/dhclient.conf*
+    rm -f ${D}${sysconfdir}/dhcpd.conf*
+    install -m 0644 ${WORKDIR}/dhclient.conf ${D}${sysconfdir}/dhcp/dhclie=
nt.conf
+    install -m 0644 ${WORKDIR}/dhcpd.conf ${D}${sysconfdir}/dhcp/dhcpd.con=
f
+
+    install -d ${D}${base_sbindir}/
+    if [ "${sbindir}" !=3D "${base_sbindir}" ]; then
+        mv ${D}${sbindir}/dhclient ${D}${base_sbindir}/
+    fi
+    install -m 0755 ${S}/client/scripts/linux ${D}${base_sbindir}/dhclient=
-script
+
+    # Install systemd unit files
+    install -d ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/dhcpd.service ${D}${systemd_unitdir}/system
+    install -m 0644 ${WORKDIR}/dhcpd6.service ${D}${systemd_unitdir}/syste=
m
+    install -m 0644 ${WORKDIR}/dhcrelay.service ${D}${systemd_unitdir}/sys=
tem
+    sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/dhc=
pd*.service ${D}${systemd_unitdir}/system/dhcrelay.service
+    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/syst=
em/dhcpd*.service
+    sed -i -e 's,@base_bindir@,${base_bindir},g' ${D}${systemd_unitdir}/sy=
stem/dhcpd*.service
+    sed -i -e 's,@localstatedir@,${localstatedir},g' ${D}${systemd_unitdir=
}/system/dhcpd*.service
+    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/syst=
em/dhcrelay.service
+
+    install -d ${D}${base_sbindir}
+    install -m 0755 ${WORKDIR}/dhclient-systemd-wrapper ${D}${base_sbindir=
}/dhclient-systemd-wrapper
+    install -m 0644 ${WORKDIR}/dhclient.service ${D}${systemd_unitdir}/sys=
tem
+    sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/syst=
em/dhclient.service
+    sed -i -e 's,@BASE_SBINDIR@,${base_sbindir},g' ${D}${systemd_unitdir}/=
system/dhclient.service
+}
+
+PACKAGES +=3D "dhcp-libs dhcp-server dhcp-server-config dhcp-client dhcp-r=
elay dhcp-omshell"
+
+PACKAGES_remove =3D "${PN}"
+RDEPENDS_${PN}-client +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'syste=
md', 'iproute2', '', d)}"
+RDEPENDS_${PN}-dev =3D ""
+RDEPENDS_${PN}-staticdev =3D ""
+
+FILES_${PN}-libs =3D "${libdir}/lib*.so.*"
+
+FILES_${PN}-server =3D "${sbindir}/dhcpd ${sysconfdir}/init.d/dhcp-server"
+RRECOMMENDS_${PN}-server =3D "dhcp-server-config"
+
+FILES_${PN}-server-config =3D "${sysconfdir}/default/dhcp-server ${sysconf=
dir}/dhcp/dhcpd.conf"
+
+FILES_${PN}-relay =3D "${sbindir}/dhcrelay ${sysconfdir}/init.d/dhcp-relay=
 ${sysconfdir}/default/dhcp-relay"
+
+FILES_${PN}-client =3D "${base_sbindir}/dhclient \
+                      ${base_sbindir}/dhclient-script \
+                      ${sysconfdir}/dhcp/dhclient.conf \
+                      ${base_sbindir}/dhclient-systemd-wrapper \
+                     "
+
+FILES_${PN}-omshell =3D "${bindir}/omshell"
+
+pkg_postinst_dhcp-server() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
+    touch $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    touch $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+}
+
+pkg_postinst_dhcp-client() {
+    mkdir -p $D/${localstatedir}/lib/dhcp
+}
+
+pkg_postrm_dhcp-server() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhcpd6.leases
+
+    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
+        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
+    fi
+}
+
+pkg_postrm_dhcp-client() {
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient.leases
+    rm -f $D/${localstatedir}/lib/dhcp/dhclient6.leases
+
+    if ! rmdir $D/${localstatedir}/lib/dhcp 2>/dev/null; then
+        echo "Not removing ${localstatedir}/lib/dhcp as it is non-empty."
+    fi
+}
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0001-define-mac=
ro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch b/meta-networking/recipes-=
connectivity/dhcp/dhcp/0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIEN=
T_CON.patch
new file mode 100644
index 000000000..3050636e8
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0001-define-macro-_PAT=
H_DHCPD_CONF-and-_PATH_DHCLIENT_CON.patch
@@ -0,0 +1,30 @@
+From 6424c532f49041ecf8fd3776d43b0d583b723b12 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 16:14:22 +0800
+Subject: [PATCH] define macro _PATH_DHCPD_CONF and _PATH_DHCLIENT_CONF
+
+Upstream-Status: Inappropriate [OE specific]
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ includes/site.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/includes/site.h b/includes/site.h
+index 2ef69e4..b4dd2e4 100644
+--- a/includes/site.h
++++ b/includes/site.h
+@@ -148,7 +148,8 @@
+ /* Define this if you want the dhcpd.conf file to go somewhere other than
+    the default location.   By default, it goes in /etc/dhcpd.conf. */
+=20
+-/* #define _PATH_DHCPD_CONF	"/etc/dhcpd.conf" */
++#define _PATH_DHCPD_CONF	"/etc/dhcp/dhcpd.conf"
++#define _PATH_DHCLIENT_CONF	"/etc/dhcp/dhclient.conf"
+=20
+ /* Network API definitions.   You do not need to choose one of these - if
+    you don't choose, one will be chosen for you in your system's config
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-d=
bus.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-db=
us.patch
new file mode 100644
index 000000000..df0c9a1fa
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0002-dhclient-dbus.pat=
ch
@@ -0,0 +1,117 @@
+From 3fa083e3d8b65eeb5444e458aed358709130141f Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 14:56:56 +0800
+Subject: [PATCH] dhclient dbus
+
+Upstream-Status: Inappropriate [distribution]
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/bsdos   | 5 +++++
+ client/scripts/freebsd | 5 +++++
+ client/scripts/linux   | 5 +++++
+ client/scripts/netbsd  | 5 +++++
+ client/scripts/openbsd | 5 +++++
+ client/scripts/solaris | 5 +++++
+ 6 files changed, 30 insertions(+)
+
+diff --git a/client/scripts/bsdos b/client/scripts/bsdos
+index d69d0d8..095b143 100755
+--- a/client/scripts/bsdos
++++ b/client/scripts/bsdos
+@@ -45,6 +45,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus !=3D x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=3Dcom.redhat.dhcp \
++      --type=3Dmethod_call /com/redhat/dhcp/$interface com.redhat.dhcp.se=
t \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\=3D'`"
++  fi
+   exit $exit_status
+ }
+=20
+diff --git a/client/scripts/freebsd b/client/scripts/freebsd
+index 7c073f8..b3426bf 100755
+--- a/client/scripts/freebsd
++++ b/client/scripts/freebsd
+@@ -89,6 +89,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus !=3D x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=3Dcom.redhat.dhcp \
++      --type=3Dmethod_call /com/redhat/dhcp/$interface com.redhat.dhcp.se=
t \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\=3D'`"
++  fi
+   exit $exit_status
+ }
+=20
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 0c42969..cded38f 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -174,6 +174,11 @@ exit_with_hooks() {
+         exit_status=3D$?
+     fi
+=20
++    if [ x$dhc_dbus !=3D x -a $exit_status -eq 0 ]; then
++        dbus-send --system --dest=3Dcom.redhat.dhcp \
++           --type=3Dmethod_call /com/redhat/dhcp/$interface com.redhat.dh=
cp.set \
++           'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\=3D'`"
++    fi
+     exit $exit_status
+ }
+=20
+diff --git a/client/scripts/netbsd b/client/scripts/netbsd
+index fa08637..3628418 100755
+--- a/client/scripts/netbsd
++++ b/client/scripts/netbsd
+@@ -45,6 +45,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus !=3D x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=3Dcom.redhat.dhcp \
++      --type=3Dmethod_call /com/redhat/dhcp/$interface com.redhat.dhcp.se=
t \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\=3D'`"
++  fi
+   exit $exit_status
+ }
+=20
+diff --git a/client/scripts/openbsd b/client/scripts/openbsd
+index afb7924..57c80d4 100755
+--- a/client/scripts/openbsd
++++ b/client/scripts/openbsd
+@@ -45,6 +45,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus !=3D x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=3Dcom.redhat.dhcp \
++      --type=3Dmethod_call /com/redhat/dhcp/$interface com.redhat.dhcp.se=
t \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\=3D'`"
++  fi
+   exit $exit_status
+ }
+=20
+diff --git a/client/scripts/solaris b/client/scripts/solaris
+index af553b9..4a2aa69 100755
+--- a/client/scripts/solaris
++++ b/client/scripts/solaris
+@@ -26,6 +26,11 @@ exit_with_hooks() {
+     . /etc/dhclient-exit-hooks
+   fi
+ # probably should do something with exit status of the local script
++  if [ x$dhc_dbus !=3D x -a $exit_status -eq 0 ]; then
++    dbus-send --system --dest=3Dcom.redhat.dhcp \
++      --type=3Dmethod_call /com/redhat/dhcp/$interface com.redhat.dhcp.se=
t \
++      'string:'"`env | grep -Ev '^(PATH|SHLVL|_|PWD|dhc_dbus)\=3D'`"
++  fi
+   exit $exit_status
+ }
+=20
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-with-=
lcrypto.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-wi=
th-lcrypto.patch
new file mode 100644
index 000000000..1c55a70a7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0003-link-with-lcrypto=
.patch
@@ -0,0 +1,38 @@
+From 4d7dd522faed6c25daf88ac81a43943af4c40fe7 Mon Sep 17 00:00:00 2001
+From: Andrei Gherzan <andrei@gherzan.ro>
+Date: Tue, 15 Aug 2017 15:05:47 +0800
+Subject: [PATCH] link with lcrypto
+
+From 4.2.0 final release, -lcrypto check was removed and we compile
+static libraries
+from bind that are linked to libcrypto. This is why i added a patch in
+order to add
+-lcrypto to LIBS.
+
+Upstream-Status: Pending
+Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 3a583a5..b3d48f7 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -603,6 +603,10 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[]], [[void foo()=
 __attribute__((noreturn));
+ # Look for optional headers.
+ AC_CHECK_HEADERS(sys/socket.h net/if_dl.h net/if6.h regex.h)
+=20
++# find an MD5 library
++AC_SEARCH_LIBS(MD5_Init, [crypto])
++AC_SEARCH_LIBS(MD5Init, [crypto])
++
+ # Solaris needs some libraries for functions
+ AC_SEARCH_LIBS(socket, [socket])
+ AC_SEARCH_LIBS(inet_ntoa, [nsl])
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of=
-tree-builds.patch b/meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fi=
x-out-of-tree-builds.patch
new file mode 100644
index 000000000..912a8f20c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0004-Fix-out-of-tree-b=
uilds.patch
@@ -0,0 +1,98 @@
+From d64897645e712975763fa78937c6c1ea7a46542d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 15:08:22 +0800
+Subject: [PATCH] Fix out of tree builds
+
+Upstream-Status: Pending
+
+RP 2013/03/21
+
+Rebase to 4.3.6
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/Makefile.am  | 2 +-
+ common/Makefile.am  | 3 ++-
+ dhcpctl/Makefile.am | 2 ++
+ omapip/Makefile.am  | 1 +
+ relay/Makefile.am   | 2 +-
+ server/Makefile.am  | 2 +-
+ 6 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/client/Makefile.am b/client/Makefile.am
+index d177159..4857a86 100644
+--- a/client/Makefile.am
++++ b/client/Makefile.am
+@@ -5,7 +5,7 @@
+ SUBDIRS =3D . tests
+=20
+ AM_CPPFLAGS =3D -DCLIENT_PATH=3D'"PATH=3D$(sbindir):/sbin:/bin:/usr/sbin:=
/usr/bin"'
+-AM_CPPFLAGS +=3D -DLOCALSTATEDIR=3D'"$(localstatedir)"'
++AM_CPPFLAGS +=3D -DLOCALSTATEDIR=3D'"$(localstatedir)"' -I$(top_srcdir)/i=
ncludes
+=20
+ dist_sysconf_DATA =3D dhclient.conf.example
+ sbin_PROGRAMS =3D dhclient
+diff --git a/common/Makefile.am b/common/Makefile.am
+index 91dd235..725cd4c 100644
+--- a/common/Makefile.am
++++ b/common/Makefile.am
+@@ -1,4 +1,5 @@
+-AM_CPPFLAGS =3D -I$(top_srcdir) -DLOCALSTATEDIR=3D'"@localstatedir@"'
++AM_CPPFLAGS =3D -I$(top_srcdir)/includes -I$(top_srcdir) -DLOCALSTATEDIR=
=3D'"@localstatedir@"'
++
+ AM_CFLAGS =3D $(LDAP_CFLAGS)
+=20
+ lib_LIBRARIES =3D libdhcp.a
+diff --git a/dhcpctl/Makefile.am b/dhcpctl/Makefile.am
+index 0d66971..a52326b 100644
+--- a/dhcpctl/Makefile.am
++++ b/dhcpctl/Makefile.am
+@@ -3,6 +3,8 @@ BINDLIBDNSDIR=3D@BINDLIBDNSDIR@
+ BINDLIBISCCFGDIR=3D@BINDLIBISCCFGDIR@
+ BINDLIBISCDIR=3D@BINDLIBISCDIR@
+=20
++AM_CPPFLAGS =3D -I$(top_srcdir)/includes -I$(top_srcdir)
++
+ bin_PROGRAMS =3D omshell
+ lib_LIBRARIES =3D libdhcpctl.a
+ noinst_PROGRAMS =3D cltest
+diff --git a/omapip/Makefile.am b/omapip/Makefile.am
+index 5b61581..c9091dc 100644
+--- a/omapip/Makefile.am
++++ b/omapip/Makefile.am
+@@ -2,6 +2,7 @@ BINDLIBIRSDIR=3D@BINDLIBIRSDIR@
+ BINDLIBDNSDIR=3D@BINDLIBDNSDIR@
+ BINDLIBISCCFGDIR=3D@BINDLIBISCCFGDIR@
+ BINDLIBISCDIR=3D@BINDLIBISCDIR@
++AM_CPPFLAGS =3D -I$(top_srcdir)/includes
+=20
+ lib_LIBRARIES =3D libomapi.a
+ noinst_PROGRAMS =3D svtest
+diff --git a/relay/Makefile.am b/relay/Makefile.am
+index 5562b69..d265ec2 100644
+--- a/relay/Makefile.am
++++ b/relay/Makefile.am
+@@ -1,6 +1,6 @@
+ SUBDIRS =3D . tests
+=20
+-AM_CPPFLAGS =3D -DLOCALSTATEDIR=3D'"@localstatedir@"'
++AM_CPPFLAGS =3D -DLOCALSTATEDIR=3D'"@localstatedir@"' -I$(top_srcdir)/inc=
ludes
+=20
+ sbin_PROGRAMS =3D dhcrelay
+ dhcrelay_SOURCES =3D dhcrelay.c
+diff --git a/server/Makefile.am b/server/Makefile.am
+index 787efca..35b747e 100644
+--- a/server/Makefile.am
++++ b/server/Makefile.am
+@@ -4,7 +4,7 @@
+ # production code. Sadly, we are not there yet.
+ SUBDIRS =3D . tests
+=20
+-AM_CPPFLAGS =3D -I.. -DLOCALSTATEDIR=3D'"@localstatedir@"'
++AM_CPPFLAGS =3D -I$(top_srcdir) -DLOCALSTATEDIR=3D'"@localstatedir@"' -I$=
(top_srcdir)/includes
+=20
+ dist_sysconf_DATA =3D dhcpd.conf.example
+ sbin_PROGRAMS =3D dhcpd
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhcp-clien=
t-fix-invoke-dhclient-script-failed-on-Rea.patch b/meta-networking/recipes-=
connectivity/dhcp/dhcp/0005-dhcp-client-fix-invoke-dhclient-script-failed-o=
n-Rea.patch
new file mode 100644
index 000000000..b93325f34
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0005-dhcp-client-fix-i=
nvoke-dhclient-script-failed-on-Rea.patch
@@ -0,0 +1,36 @@
+From d27dea78a073a124f416af26501197d18130913d Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Tue, 15 Aug 2017 15:24:14 +0800
+Subject: [PATCH] dhcp-client: fix invoke dhclient-script failed on Read-on=
ly
+ file system
+
+In read-only file system, '/etc' is on the readonly partition,
+and '/etc/resolv.conf' is symlinked to a separate writable
+partition.
+
+In this situation, we create temp files 'resolv.conf.dhclient-new'
+in /tmp dir.
+
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index cded38f..516c986 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -40,7 +40,7 @@ make_resolv_conf() {
+     # DHCPv4
+     if [ -n "$new_domain_search" ] || [ -n "$new_domain_name" ] ||
+        [ -n "$new_domain_name_servers" ]; then
+-        new_resolv_conf=3D/etc/resolv.conf.dhclient-new
++        new_resolv_conf=3D/tmp/resolv.conf.dhclient-new
+         rm -f $new_resolv_conf
+=20
+         if [ -n "$new_domain_name" ]; then
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add-config=
ure-argument-to-make-the-libxml2-dependenc.patch b/meta-networking/recipes-=
connectivity/dhcp/dhcp/0006-Add-configure-argument-to-make-the-libxml2-depe=
ndenc.patch
new file mode 100644
index 000000000..6471bcf6c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0006-Add-configure-arg=
ument-to-make-the-libxml2-dependenc.patch
@@ -0,0 +1,66 @@
+From 0ca6f4d1e34b54f85de9f5c27536f01326cf35fd Mon Sep 17 00:00:00 2001
+From: Christopher Larson <chris_larson@mentor.com>
+Date: Tue, 15 Aug 2017 16:17:49 +0800
+Subject: [PATCH] Add configure argument to make the libxml2 dependency
+ explicit and determinisitic.
+
+Upstream-Status: Pending
+
+Signed-off-by: Christopher Larson <chris_larson@mentor.com>
+
+Rebase to 4.3.6
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ configure.ac    | 11 +++++++++++
+ configure.ac+lt | 12 ++++++++++++
+ 2 files changed, 23 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index b3d48f7..35a9fbb 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -633,6 +633,17 @@ if test "$have_nanosleep" =3D "rt"; then
+ 	LIBS=3D"-lrt $LIBS"
+ fi
+=20
++AC_ARG_WITH(libxml2,
++	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed i=
f bind was built with xml2 support enabled]),
++	with_libxml2=3D"$withval", with_libxml2=3D"no")
++
++if test x$with_libxml2 !=3D xno; then
++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
++		[if test x$with_libxml2 !=3D xauto; then
++			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 =
and libxml2 was requested])
++		fi])
++fi
++
+ # check for /dev/random (declares HAVE_DEV_RANDOM)
+ AC_MSG_CHECKING(for random device)
+ AC_ARG_WITH(randomdev,
+diff --git a/configure.ac+lt b/configure.ac+lt
+index 6432927..df6ea4f 100644
+--- a/configure.ac+lt
++++ b/configure.ac+lt
+@@ -900,6 +900,18 @@ elif test "$want_libtool" =3D "yes" -a "$use_libbind"=
 =3D "no"; then
+ fi
+ AM_CONDITIONAL(INSTALL_BIND, test "$want_install_bind" =3D "yes")
+=20
++AC_ARG_WITH(libxml2,
++	AS_HELP_STRING([--with-libxml2], [link against libxml2. this is needed i=
f bind was built with xml2 support enabled]),
++	with_libxml2=3D"$withval", with_libxml2=3D"no")
++
++if test x$with_libxml2 !=3D xno; then
++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
++		[if test x$with_libxml2 !=3D xauto; then
++			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 =
and libxml2 was requested])
++		fi])
++fi
++
++
+ # OpenLDAP support.
+ AC_ARG_WITH(ldap,
+     AS_HELP_STRING([--with-ldap],[enable OpenLDAP support in dhcpd (defau=
lt is no)]),
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0007-remove-dhc=
lient-script-bash-dependency.patch b/meta-networking/recipes-connectivity/d=
hcp/dhcp/0007-remove-dhclient-script-bash-dependency.patch
new file mode 100644
index 000000000..ba3b459a9
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0007-remove-dhclient-s=
cript-bash-dependency.patch
@@ -0,0 +1,28 @@
+From b006317ed7b1068764f362429feaebbd450f2eca Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Tue, 15 Aug 2017 15:49:31 +0800
+Subject: [PATCH] remove dhclient-script bash dependency
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+
+Rebase to 4.3.6
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ client/scripts/linux | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index 516c986..e9ea379 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -1,4 +1,4 @@
+-#!/bin/bash
++#!/bin/sh
+ # dhclient-script for Linux. Dan Halbert, March, 1997.
+ # Updated for Linux 2.[12] by Brian J. Murrell, January 1999.
+ # No guarantees about this. I'm a novice at the details of Linux
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhcp-corre=
ct-the-intention-for-xml2-lib-search.patch b/meta-networking/recipes-connec=
tivity/dhcp/dhcp/0008-dhcp-correct-the-intention-for-xml2-lib-search.patch
new file mode 100644
index 000000000..67e346dcd
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0008-dhcp-correct-the-=
intention-for-xml2-lib-search.patch
@@ -0,0 +1,37 @@
+From b734ef006c2b79529d44edab9f75786ecc9030e1 Mon Sep 17 00:00:00 2001
+From: Awais Belal <awais_belal@mentor.com>
+Date: Wed, 25 Oct 2017 21:00:05 +0500
+Subject: [PATCH] dhcp: correct the intention for xml2 lib search
+
+A missing case breaks the build when libxml2 is
+required and found appropriately. The third argument
+to the function AC_SEARCH_LIB is action-if-found which
+was mistakenly been used for the case where the library
+is not found and hence breaks the configure phase
+where it shoud actually pass.
+We now pass on silently when action-if-found is
+executed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Awais Belal <awais_belal@mentor.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 35a9fbb..c5dd69e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -638,7 +638,7 @@ AC_ARG_WITH(libxml2,
+ 	with_libxml2=3D"$withval", with_libxml2=3D"no")
+=20
+ if test x$with_libxml2 !=3D xno; then
+-	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],
++	AC_SEARCH_LIBS(xmlTextWriterStartElement, [xml2],,
+ 		[if test x$with_libxml2 !=3D xauto; then
+ 			AC_MSG_FAILURE([*** Cannot find xmlTextWriterStartElement with -lxml2 =
and libxml2 was requested])
+ 		fi])
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp/0009-Workaround=
-busybox-limitation-in-Linux-dhclient-scri.patch b/meta-networking/recipes-=
connectivity/dhcp/dhcp/0009-Workaround-busybox-limitation-in-Linux-dhclient=
-scri.patch
new file mode 100644
index 000000000..61cf6003a
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp/0009-Workaround-busybo=
x-limitation-in-Linux-dhclient-scri.patch
@@ -0,0 +1,65 @@
+From 5374cef35850ca476d4e866471d8c724eabc6d4a Mon Sep 17 00:00:00 2001
+From: Haris Okanovic <haris.okanovic@ni.com>
+Date: Mon, 7 Jan 2019 13:22:09 -0600
+Subject: [PATCH] Workaround busybox limitation in Linux dhclient-script
+
+Busybox is a lightweight implementation of coreutils commonly used on
+space-constrained embedded Linux distributions. It's implementation of
+chown and chmod doesn't provide a "--reference" option added to
+client/scripts/linux as of commit 9261cb14. This change works around
+that limitation by using stat to read ownership and permissions flags
+and simple chown/chmod calls supported in both coreutils and busybox.
+
+    modified:   client/scripts/linux
+
+Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
+Upstream-Status: Pending [ISC-Bugs #48771]
+---
+ client/scripts/linux | 17 +++++++++++++----
+ 1 file changed, 13 insertions(+), 4 deletions(-)
+
+diff --git a/client/scripts/linux b/client/scripts/linux
+index e9ea379..8d4acbf 100755
+--- a/client/scripts/linux
++++ b/client/scripts/linux
+@@ -32,6 +32,17 @@
+ # if your system holds ip tool in a non-standard location.
+ ip=3D/sbin/ip
+=20
++chown_chmod_by_reference() {
++    local reference_file=3D"$1"
++    local target_file=3D"$2"
++
++    local owner=3D$(stat -c "%u:%g" "$reference_file")
++    local perm=3D$(stat -c "%a" "$reference_file")
++
++    chown "$owner" "$target_file"
++    chmod "$perm" "$target_file"
++}
++
+ # update /etc/resolv.conf based on received values
+ # This updated version mostly follows Debian script by Andrew Pollock et =
al.
+ make_resolv_conf() {
+@@ -74,8 +85,7 @@ make_resolv_conf() {
+         fi
+=20
+ 	if [ -f /etc/resolv.conf ]; then
+-	    chown --reference=3D/etc/resolv.conf $new_resolv_conf
+-	    chmod --reference=3D/etc/resolv.conf $new_resolv_conf
++	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
+ 	fi
+         mv -f $new_resolv_conf /etc/resolv.conf
+     # DHCPv6
+@@ -101,8 +111,7 @@ make_resolv_conf() {
+         fi
+=20
+ 	if [ -f /etc/resolv.conf ]; then
+-            chown --reference=3D/etc/resolv.conf $new_resolv_conf
+-            chmod --reference=3D/etc/resolv.conf $new_resolv_conf
++	    chown_chmod_by_reference /etc/resolv.conf $new_resolv_conf
+ 	fi
+         mv -f $new_resolv_conf /etc/resolv.conf
+     fi
+--=20
+2.17.1
+
diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb b/meta=
-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb
new file mode 100644
index 000000000..30ca34722
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/dhcp_4.4.2.bb
@@ -0,0 +1,24 @@
+require dhcp.inc
+
+SRC_URI +=3D "file://0001-define-macro-_PATH_DHCPD_CONF-and-_PATH_DHCLIENT=
_CON.patch \
+            file://0002-dhclient-dbus.patch \
+            file://0003-link-with-lcrypto.patch \
+            file://0004-Fix-out-of-tree-builds.patch \
+            file://0005-dhcp-client-fix-invoke-dhclient-script-failed-on-R=
ea.patch \
+            file://0006-Add-configure-argument-to-make-the-libxml2-depende=
nc.patch \
+            file://0007-remove-dhclient-script-bash-dependency.patch \
+            file://0008-dhcp-correct-the-intention-for-xml2-lib-search.pat=
ch \
+            file://0009-Workaround-busybox-limitation-in-Linux-dhclient-sc=
ri.patch \
+           "
+
+SRC_URI[md5sum] =3D "2afdaf8498dc1edaf3012efdd589b3e1"
+SRC_URI[sha256sum] =3D "1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620=
f4f5f607004521"
+
+LDFLAGS_append =3D " -pthread"
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[bind-httpstats] =3D "--with-libxml2,--without-libxml2,libxml=
2"
+
+CFLAGS +=3D "-fcommon"
+
+PARALLEL_MAKE =3D ""
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
diff --git a/meta-networking/recipes-connectivity/dhcp/files/default-server=
 b/meta-networking/recipes-connectivity/dhcp/files/default-server
new file mode 100644
index 000000000..0385d1699
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/default-server
@@ -0,0 +1,7 @@
+# Defaults for dhcp initscript
+# sourced by /etc/init.d/dhcp-server
+# installed at /etc/default/dhcp-server by the maintainer scripts
+
+# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
+#       Separate multiple interfaces with spaces, e.g. "eth0 eth1".
+INTERFACES=3D""
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhclient-syste=
md-wrapper b/meta-networking/recipes-connectivity/dhcp/files/dhclient-syste=
md-wrapper
new file mode 100644
index 000000000..7d0e224a1
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhclient-systemd-wrap=
per
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+# In case the interface is used for nfs, skip it.
+nfsroot=3D0
+interfaces=3D""
+exec 9<&0 < /proc/mounts
+while read dev mtpt fstype rest; do
+    if test $mtpt =3D "/" ; then
+        case $fstype in
+            nfs | nfs4)
+                nfsroot=3D1
+                nfs_addr=3D`echo $rest | sed -e 's/^.*addr=3D\([0-9.]*\).*=
$/\1/'`
+                break
+                ;;
+            *)
+                ;;
+        esac
+    fi
+done
+exec 0<&9 9<&-
+
+if [ $nfsroot -eq 0 ]; then
+    interfaces=3D"$INTERFACES"
+else
+    if [ -x /bin/ip -o -x /sbin/ip ] ; then
+	nfs_iface=3D`ip route get $nfs_addr | grep dev | sed -e 's/^.*dev \([-a-z=
0-9.]*\).*$/\1/'`
+    fi
+    for i in $INTERFACES; do
+	if test "x$i" =3D "x$nfs_iface"; then
+            echo "dhclient skipping nfsroot interface $i"
+	else
+	    interfaces=3D"$interfaces $i"
+	fi
+    done
+fi
+
+if test "x$interfaces" !=3D "x"; then
+    /sbin/dhclient -d -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhc=
lient.leases $interfaces
+fi
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhclient.conf =
b/meta-networking/recipes-connectivity/dhcp/files/dhclient.conf
new file mode 100644
index 000000000..0e6dcf96c
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhclient.conf
@@ -0,0 +1,50 @@
+# Configuration file for /sbin/dhclient, which is included in Debian's
+#	dhcp3-client package.
+#
+# This is a sample configuration file for dhclient. See dhclient.conf's
+#	man page for more information about the syntax of this file
+#	and a more comprehensive list of the parameters understood by
+#	dhclient.
+#
+# Normally, if the DHCP server provides reasonable information and does
+#	not leave anything out (like the domain name, for example), then
+#	few changes must be made to this file, if any.
+#
+
+#send host-name "andare.fugue.com";
+#send dhcp-client-identifier 1:0:a0:24:ab:fb:9c;
+#send dhcp-lease-time 3600;
+#supersede domain-name "fugue.com home.vix.com";
+#prepend domain-name-servers 127.0.0.1;
+request subnet-mask, broadcast-address, time-offset, routers,
+	domain-name, domain-name-servers, host-name,
+	netbios-name-servers, netbios-scope;
+#require subnet-mask, domain-name-servers;
+#timeout 60;
+#retry 60;
+#reboot 10;
+#select-timeout 5;
+#initial-interval 2;
+#script "/etc/dhcp3/dhclient-script";
+#media "-link0 -link1 -link2", "link0 link1";
+#reject 192.33.137.209;
+
+#alias {
+#  interface "eth0";
+#  fixed-address 192.5.5.213;
+#  option subnet-mask 255.255.255.255;
+#}
+
+#lease {
+#  interface "eth0";
+#  fixed-address 192.33.137.200;
+#  medium "link0 link1";
+#  option host-name "andare.swiftmedia.com";
+#  option subnet-mask 255.255.255.0;
+#  option broadcast-address 192.33.137.255;
+#  option routers 192.33.137.250;
+#  option domain-name-servers 127.0.0.1;
+#  renew 2 2000/1/12 00:00:01;
+#  rebind 2 2000/1/12 00:00:01;
+#  expire 2 2000/1/12 00:00:01;
+#}
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhclient.servi=
ce b/meta-networking/recipes-connectivity/dhcp/files/dhclient.service
new file mode 100644
index 000000000..9ddb4d1df
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhclient.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=3DDynamic Host Configuration Protocol (DHCP)
+Wants=3Dnetwork.target
+Before=3Dnetwork.target
+After=3Dsystemd-udevd.service
+
+[Service]
+EnvironmentFile=3D-@SYSCONFDIR@/default/dhcp-client
+ExecStart=3D@BASE_SBINDIR@/dhclient-systemd-wrapper
+RemainAfterExit=3Dyes
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcpd.conf b/m=
eta-networking/recipes-connectivity/dhcp/files/dhcpd.conf
new file mode 100644
index 000000000..0001c0f00
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.conf
@@ -0,0 +1,108 @@
+#
+# Sample configuration file for ISC dhcpd for Debian
+#
+# $Id: dhcpd.conf,v 1.1.1.1 2002/05/21 00:07:44 peloy Exp $
+#
+
+# The ddns-updates-style parameter controls whether or not the server will
+# attempt to do a DNS update when a lease is confirmed. We default to the
+# behavior of the version 2 packages ('none', since DHCP v2 didn't
+# have support for DDNS.)
+ddns-update-style none;
+
+# option definitions common to all supported networks...
+option domain-name "example.org";
+option domain-name-servers ns1.example.org, ns2.example.org;
+
+default-lease-time 600;
+max-lease-time 7200;
+
+# If this DHCP server is the official DHCP server for the local
+# network, the authoritative directive should be uncommented.
+#authoritative;
+
+# Use this to send dhcp log messages to a different log file (you also
+# have to hack syslog.conf to complete the redirection).
+log-facility local7;
+
+# No service will be given on this subnet, but declaring it helps the=20
+# DHCP server to understand the network topology.
+
+#subnet 10.152.187.0 netmask 255.255.255.0 {
+#}
+
+# This is a very basic subnet declaration.
+
+#subnet 10.254.239.0 netmask 255.255.255.224 {
+#  range 10.254.239.10 10.254.239.20;
+#  option routers rtr-239-0-1.example.org, rtr-239-0-2.example.org;
+#}
+
+# This declaration allows BOOTP clients to get dynamic addresses,
+# which we don't really recommend.
+
+#subnet 10.254.239.32 netmask 255.255.255.224 {
+#  range dynamic-bootp 10.254.239.40 10.254.239.60;
+#  option broadcast-address 10.254.239.31;
+#  option routers rtr-239-32-1.example.org;
+#}
+
+# A slightly different configuration for an internal subnet.
+#subnet 10.5.5.0 netmask 255.255.255.224 {
+#  range 10.5.5.26 10.5.5.30;
+#  option domain-name-servers ns1.internal.example.org;
+#  option domain-name "internal.example.org";
+#  option routers 10.5.5.1;
+#  option broadcast-address 10.5.5.31;
+#  default-lease-time 600;
+#  max-lease-time 7200;
+#}
+
+# Hosts which require special configuration options can be listed in
+# host statements.   If no address is specified, the address will be
+# allocated dynamically (if possible), but the host-specific information
+# will still come from the host declaration.
+
+#host passacaglia {
+#  hardware ethernet 0:0:c0:5d:bd:95;
+#  filename "vmunix.passacaglia";
+#  server-name "toccata.fugue.com";
+#}
+
+# Fixed IP addresses can also be specified for hosts.   These addresses
+# should not also be listed as being available for dynamic assignment.
+# Hosts for which fixed IP addresses have been specified can boot using
+# BOOTP or DHCP.   Hosts for which no fixed address is specified can only
+# be booted with DHCP, unless there is an address range on the subnet
+# to which a BOOTP client is connected which has the dynamic-bootp flag
+# set.
+#host fantasia {
+#  hardware ethernet 08:00:07:26:c0:a5;
+#  fixed-address fantasia.fugue.com;
+#}
+
+# You can declare a class of clients and then do address allocation
+# based on that.   The example below shows a case where all clients
+# in a certain class get addresses on the 10.17.224/24 subnet, and all
+# other clients get addresses on the 10.0.29/24 subnet.
+
+#class "foo" {
+#  match if substring (option vendor-class-identifier, 0, 4) =3D "SUNW";
+#}
+
+#shared-network 224-29 {
+#  subnet 10.17.224.0 netmask 255.255.255.0 {
+#    option routers rtr-224.example.org;
+#  }
+#  subnet 10.0.29.0 netmask 255.255.255.0 {
+#    option routers rtr-29.example.org;
+#  }
+#  pool {
+#    allow members of "foo";
+#    range 10.17.224.10 10.17.224.250;
+#  }
+#  pool {
+#    deny members of "foo";
+#    range 10.0.29.10 10.0.29.230;
+#  }
+#}
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcpd.service =
b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.service
new file mode 100644
index 000000000..ae4f93eca
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhcpd.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=3DDHCPv4 Server Daemon
+Documentation=3Dman:dhcpd(8) man:dhcpd.conf(5)
+After=3Dnetwork.target
+After=3Dtime-sync.target
+
+[Service]
+PIDFile=3D@localstatedir@/run/dhcpd.pid
+EnvironmentFile=3D@SYSCONFDIR@/default/dhcp-server
+EnvironmentFile=3D-@SYSCONFDIR@/sysconfig/dhcp-server
+ExecStartPre=3D@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd.leases
+ExecStart=3D@SBINDIR@/dhcpd -f -cf @SYSCONFDIR@/dhcp/dhcpd.conf -pf @local=
statedir@/run/dhcpd.pid $DHCPDARGS -q $INTERFACES
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service=
 b/meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service
new file mode 100644
index 000000000..52a6224dc
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/dhcpd6.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=3DDHCPv6 Server Daemon
+Documentation=3Dman:dhcpd(8) man:dhcpd.conf(5)
+After=3Dnetwork.target
+After=3Dtime-sync.target
+
+[Service]
+PIDFile=3D@localstatedir@/run/dhcpd6.pid
+EnvironmentFile=3D@SYSCONFDIR@/default/dhcp-server
+EnvironmentFile=3D-@SYSCONFDIR@/sysconfig/dhcpd6
+ExecStartPre=3D@base_bindir@/touch @localstatedir@/lib/dhcp/dhcpd6.leases
+ExecStart=3D@SBINDIR@/dhcpd -f -6 -cf @SYSCONFDIR@/dhcp/dhcpd6.conf -pf @l=
ocalstatedir@/run/dhcpd6.pid $DHCPDARGS -q $INTERFACES
+
+[Install]
+WantedBy=3Dmulti-user.target
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
diff --git a/meta-networking/recipes-connectivity/dhcp/files/init-server b/=
meta-networking/recipes-connectivity/dhcp/files/init-server
new file mode 100644
index 000000000..5e693adf7
--- /dev/null
+++ b/meta-networking/recipes-connectivity/dhcp/files/init-server
@@ -0,0 +1,44 @@
+#!/bin/sh
+#
+# $Id: dhcp3-server.init.d,v 1.4 2003/07/13 19:12:41 mdz Exp $
+#
+
+test -f /usr/sbin/dhcpd || exit 0
+
+# It is not safe to start if we don't have a default configuration...
+if [ ! -f /etc/default/dhcp-server ]; then
+	echo "/etc/default/dhcp-server does not exist! - Aborting..."
+	exit 0
+fi
+
+# Read init script configuration (so far only interfaces the daemon
+# should listen on.)
+. /etc/default/dhcp-server
+
+case "$1" in
+	start)
+		echo -n "Starting DHCP server: "
+		test -d /var/lib/dhcp/ || mkdir -p /var/lib/dhcp/
+		test -f /var/lib/dhcp/dhcpd.leases || touch /var/lib/dhcp/dhcpd.leases=09
+		start-stop-daemon -S -x /usr/sbin/dhcpd -- -q $INTERFACES -user dhcp -gr=
oup dhcp
+		echo "."
+		;;
+	stop)
+		echo -n "Stopping DHCP server: dhcpd3"
+		start-stop-daemon -K -x /usr/sbin/dhcpd
+		echo "."
+		;;
+	restart | force-reload)
+		$0 stop
+		sleep 2
+		$0 start
+		if [ "$?" !=3D "0" ]; then
+			exit 1
+		fi
+		;;
+	*)
+		echo "Usage: /etc/init.d/dhcp-server {start|stop|restart|force-reload}"
+		exit 1=20
+esac
+
+exit 0
--=20
2.25.1

