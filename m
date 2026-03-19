Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D6F61088E60
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 12:31:20 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.82])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9984.1773923473715245075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 05:31:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=vKz6p0iz;
 spf=pass (domain: navimatix.de, ip: 40.107.130.82, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lSLwyeybuvx2vq9wDPjDHWSCCq0EOEL7uOQwKu6qg0u78LqcghjiZ8L5J12EwaIG1ybxfqoS2TpiXXbNqpBeC7m55it2ljzr1XRTt4kJKHh8d4um58mIBYoJOCqH02nRe0sZVG9Pzo92W2wcLtqj+qL4Xsx50kDpURIcHdnU0uTvp4S0M3PnUbzc1uUADTxAmJJl+4SSBmJh+W5lUx0hMEPCAeRqowoPMRfAlcqHhnZumD2t1WGyXYC7cEWNB02P5c4h1+/sdQogR2J59AoBsJA3dHCcUyYLE/Vvxn7aVyEjTbrPNntrAVFV2ebkdoTXfFbOT2Q42YVHTw50I7r+gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9wmdE0VPAyHoiX3vL2WRX2sB/Qc40UOV44AQ7vn1gZo=;
 b=HsgLfTUOxHPY0/ftJ+aIyiS3EFZellqriZVtwEobUxZa2A4k6Sm3gfNOoWtMl2K1DY0CDp6UPgH8Xa0EXRWauafDR48sZUGN+qMff8IIWkHYSw6FRoQr3kEnsZ3BduKttE1uX5QcC7gSx8QrUv81dgbqGcAy8xnKpmq7cfGLBUc7oYRztmyTLL3EE8b8d/XhN1BFf82itYTHVQsZdkxLVWFY+S96lQLbDebMrBEJetmBvgLACiqSAKY+8gdhdz6upRxN8fvVLfDoJq5eLCVEdNFqRsZ0sWcHu+h2kuwQepu58Yzi0sqSVEBNnVIoKWIqcqBFwsEbZcdvj7VsfCVkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9wmdE0VPAyHoiX3vL2WRX2sB/Qc40UOV44AQ7vn1gZo=;
 b=vKz6p0iz65TQMTzg/dlrU8ydXr8EgK+gOHpFqvOHfnXRCw+2IZ9Yw1pN1CgZLBEeooANTCA3X+AkO4eaQTqdGEnz1WFBC97ICmKxf8sPHGI+PFXThvCJoMnjPxro14R75P3Jk36OxrqfKk8CJtkDftD3+j3i5joSoFk32/MaZ4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB10199.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:47b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 12:31:07 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.018; Thu, 19 Mar 2026 12:31:07 +0000
Date: Thu, 19 Mar 2026 13:31:06 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH v2] conserver: Add recipe for remote console server
Message-ID: <cf39e1469eeb21555c2da569da8183c3753cfc91.1773923465.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <2f6d1b8f-43e2-4fa4-ba2d-ef3fb77583a3@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2f6d1b8f-43e2-4fa4-ba2d-ef3fb77583a3@gmail.com>
X-ClientProxiedBy: BE1P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::6) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB10199:EE_
X-MS-Office365-Filtering-Correlation-Id: 734ede10-7145-4842-adfd-08de85b3652c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|13003099007|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	VooWas4Vg9guyIOdtoArUkEEayVC5J3L+W+1Y7v3bh1ybMSSrSm2F13EJ7RY34vWgt56yIipd7fGW07cKU7cnS6g5X6ttQit8dl2BeEmaSmpp7f1uLnXTCM+06r/410fB9X4cin8HLKKaA9HCvCf7sPXBjrsM37fXFVLbChMsttyVgJfMmKNhifNmXnCzZ52wfoN5iMtpGWGReQSwxDI8d3gwGZp3Y/Vuro1wJevbWxYopRJqC8niQWKerbddqozAVD6yvpt9lXqiAr2QKKPSkEF3tQuOnff+sY6BKKQ+KaN8HCABO67LLvXNxhcdNeV4rGQaPsmGWoSMILcBBdNxHXh4ISzH+eJo4pZXe/d1FlE6I1UsDv58+wydHfVAE6B9PzTmXGhucm+pbuCeR9/j6b/lWUhwUpbl7oiXCew8Ij+YiOuCKNC+LSekuET+Lm91B8xpOp4LtKDWq2Mh4WSEebkYxS/FaeavkcKVVa9at7oLVgCz8taOAtPNoNjWq+x27e2gmuA2RiQ3St54R0rxLJ1AX+Kf+ueQogl1zUzQ5/g6pVRMCv6BWYtxVHUyXC6Vs2fqrTC+IBpIQFwIXL4mH+v63gmv7bvrsxo7X3QX1fcVHR93C8x5rWNqAOs1E+XOxph6+9guW9QZlgkeMbPpP+SazIDvzj0JeOdHGEyr2QzmaQpoizve14e4/uq7WIs
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sHb2gTbSmf4lcIw394d1HcAGGWMk9S3exz7qxsXRmBkZAHEVnEB2RjWssgIB?=
 =?us-ascii?Q?llG1Nhkxlfd5z/y8KZGCqaHVSWT9kZPgK4734Q41WIFkhP5kGDc9KzTJsuZe?=
 =?us-ascii?Q?hlEkmtAoKUnPzVtpIHfCGzMD+Ykp6R1hyyrGgXmJKRVq3tEgsbpEx0JomMnT?=
 =?us-ascii?Q?Y9JB2AJVa6wnTSeEkRb2glV/hxp6jJnYPsKNNxA81HpH3YIAtF30FX2GDYup?=
 =?us-ascii?Q?mUky0nZDpuCpM/GL4KbdO2Mtl58EUwnbUOCYI+v7n1ksiB06x6n6umwl1fC5?=
 =?us-ascii?Q?tca8STXQSjaUhwoVUqWm8ZwK1sFAzDqhosJvd7afxKRBOMU/w8wAlE5J1qPh?=
 =?us-ascii?Q?8pFpyrLOM2n8jvuiz5h6VHUqldrxW4JH4ocLroQttY4I2lY6JL5GNzsfjNmK?=
 =?us-ascii?Q?hicCOwEl/jFPsW9hZZFXLZrac+iOCP5pAAMNcI7p98dtVT/V7vmA/Se2Sojh?=
 =?us-ascii?Q?O+A39XsQ2hdBWdsIHB822YESs2sLb6nXy2cbz48YMOG98EFeB11bslocD4tT?=
 =?us-ascii?Q?dkHkotciXYb/7jhBU1IxtFx0TE47v7C4Z/zZXIr7iVn/xEiFJSrjU0SuNv1l?=
 =?us-ascii?Q?tGVNHlBoBMrGMDtvEaD2FQNuuTx4vU3U2rinw4oKPYRLJcFqo9TZns+b6kCR?=
 =?us-ascii?Q?GQgyRb7bSIqfG6eJOTDoxmftgXiin30xZsM6ehjOYek73UXzarZN00H1/kfP?=
 =?us-ascii?Q?STrEtPurg05lMoRweSiI73fhimYsrR3EPSS9u+e97AEp78x/eMRAOcIsgVAi?=
 =?us-ascii?Q?d8J+4MNkGoz13UKckoZZbp8TpCgFQrXXRmqzgmdM1zoQYqdRAjjqMdeadJoA?=
 =?us-ascii?Q?M+SaA29pTfo8KMDaCGFXB+uwrm8YRdxOJpFX5xyYD2GNNDYhbYx/TtQiNxWZ?=
 =?us-ascii?Q?eAY7cGfl9WBNy2WDoWn7BhA/LTGjmv/HSbWCpYzjPWMljdggvzMaBu497gL3?=
 =?us-ascii?Q?sfCe8r12YJBas4qOhRaOL1+bJ/IVrp0/oRAHm0k7gF5Upy25fTjKrKvr4soP?=
 =?us-ascii?Q?zUNoLpOiDQe8v2Md7rylK1VfT3peowJ0eElL/l01JdZ7dFo9kMc9iqUa8ZvN?=
 =?us-ascii?Q?TKs0MtDcbRugwSsM9o0BP9t+zFveLsxK/b+QTtBwC/SZB2VqeHDL+wG+QbVA?=
 =?us-ascii?Q?Mmz5iy3Ii/B5KSeocjvcxD0Cz1+7fMgcQaVuPwnLmVowj6IxhIY/dDAuCT4Q?=
 =?us-ascii?Q?Nsb79Tj5lnyih2z3B1OQ3F+eoJ+rSyyinU3krUUARfcNyWis2kW2rOTfpkfS?=
 =?us-ascii?Q?H3FjhrteQke3WnNTM+uN3Pq/vm0eDZB9hc6Kz86SuLy0N9jqJDpq8guQnR4w?=
 =?us-ascii?Q?bzyV8T9greksRG7pD0JbtCM+IAmDaeV6EuXeRf46D9fsMTod1xZrT++NiaOZ?=
 =?us-ascii?Q?UIqfzo1bPMTjBQscIELjl2kM99xA1G80ThumLhCcLjIH83wm+hN9IB/0MrZC?=
 =?us-ascii?Q?ECW+Vl1g7/0TB8gN2iVOqRo4tyudSVqugi3r0N1FU6VQdnoy++iTnQCKSGRU?=
 =?us-ascii?Q?oR+2J+CLeAqqziO2ztEEQkk1zsizp9FsO7L/QxHq5UcFamH94Onx98qH75L6?=
 =?us-ascii?Q?VVl5u0jaQOcMLzimFVTYSVkp6Wwp0hhxlc/lYMwABGjsEanr46xygc1Y/kde?=
 =?us-ascii?Q?ALboXEoswBvcvKKJZw/Q5NM2RunLkOwG9kmQVUTUkvYHhbNJ8N5aJ5x2RcjO?=
 =?us-ascii?Q?HYPMe1uqpdbP1lsPydlj2O6e5vyjZCPYPGeVQ9CcmCUQQzOE1SN9dZvqw45r?=
 =?us-ascii?Q?j3lWgm3jP05eM86xUUwx9/bE3gqrJwc=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 734ede10-7145-4842-adfd-08de85b3652c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 12:31:07.7670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5NfkLRnUGHi/qE0qhK9j6ADJ/UzirHimDimH0yx+ci/uag2oLn7xKRVUINdL593Pc7tBJ2gL1R0/QXM77M2v1hBuXYy72wg/ezP3kJfnPBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB10199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 12:31:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125401

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The patches are required to build with detached build directory and
cross-compiling.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../include/ptest-packagelists-meta-oe.inc    |   1 +
 .../conserver/conserver/conserver.service     |  58 +++++++++
 .../conserver/conserver/run-ptest             |  21 ++++
 .../conserver/conserver_8.3.0.bb              | 111 ++++++++++++++++++
 4 files changed, 191 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver/conser=
ver.service
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver/run-pt=
est
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver_8.3.0.=
bb

diff --git a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc b/meta-oe/=
conf/include/ptest-packagelists-meta-oe.inc
index 4de602ac1c..e88e50b59c 100644
--- a/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
+++ b/meta-oe/conf/include/ptest-packagelists-meta-oe.inc
@@ -13,6 +13,7 @@ PTESTS_FAST_META_OE =3D "\
     cjson \
     cli11 \
     cmocka \
+    conserver \
     cunit \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'dbus-broker', '', =
d)} \
     duktape \
diff --git a/meta-oe/recipes-connectivity/conserver/conserver/conserver.ser=
vice b/meta-oe/recipes-connectivity/conserver/conserver/conserver.service
new file mode 100644
index 0000000000..8649896487
--- /dev/null
+++ b/meta-oe/recipes-connectivity/conserver/conserver/conserver.service
@@ -0,0 +1,58 @@
+[Unit]
+Description=3DConsole server
+Documentation=3Dman:conserver(8)
+Documentation=3Dhttps://www.conserver.com/
+After=3Dnetwork.target
+ConditionPathExists=3D/etc/conserver.cf
+
+[Service]
+Type=3Dexec
+ExecStart=3D/usr/sbin/conserver -C /etc/conserver.cf
+ExecReload=3D+kill -HUP $MAINPID
+User=3Dconserver
+# /run/conserver for Unix domain socket
+RuntimeDirectory=3Dconserver
+
+CapabilityBoundingSet=3D
+
+LockPersonality=3Dtrue
+MemoryDenyWriteExecute=3Dtrue
+NoNewPrivileges=3Dtrue
+
+# No access to /dev/...
+PrivateDevices=3Dtrue
+PrivateTmp=3Dtrue
+ProtectClock=3Dtrue
+ProtectControlGroups=3Dtrue
+ProtectHostname=3Dtrue
+ProtectKernelLogs=3Dtrue
+ProtectKernelModules=3Dtrue
+ProtectKernelTunables=3Dtrue
+
+# strict: mounts the whole system read-only
+# full: mount only /var as read-write
+# true: mount /var and /etc as read-write
+ProtectSystem=3Dfull
+# Make some paths writable
+#ReadWritePaths=3D/=E2=80=A6
+ProtectHome=3Dtrue
+
+# Make sure that the process can only see PIDs and process details of itse=
lf,
+# and the second option disables seeing details of things like system load=
 and
+# I/O etc
+ProtectProc=3Dinvisible
+ProcSubset=3Dpid
+
+RemoveIPC=3Dtrue
+RestrictAddressFamilies=3DAF_UNIX AF_INET AF_INET6
+RestrictNamespaces=3Dtrue
+RestrictRealtime=3Dtrue
+RestrictSUIDSGID=3Dtrue
+
+SystemCallArchitectures=3Dnative
+SystemCallFilter=3D@system-service
+SystemCallFilter=3D~@privileged @resources @obsolete
+
+
+[Install]
+WantedBy=3Dmulti-user.target
diff --git a/meta-oe/recipes-connectivity/conserver/conserver/run-ptest b/m=
eta-oe/recipes-connectivity/conserver/conserver/run-ptest
new file mode 100644
index 0000000000..51eb0ffbcf
--- /dev/null
+++ b/meta-oe/recipes-connectivity/conserver/conserver/run-ptest
@@ -0,0 +1,21 @@
+#!/bin/sh
+
+set -e -u -C
+
+cd test
+
+./dotest |sed \
+    -e 's,^executing test \(#[0-9]*\)...succeeded$,PASS: conserver \1,' \
+    -e 's,^executing test \(#[0-9]*\)...failed\(.*\)$,FAIL: conserver \1 \=
2,'
+
+for i in test*.diff conserver.log shell.log shell2.log
+do
+    test "$i" !=3D 'test*.diff' || exit 0
+    test -e "$i" || continue
+
+    echo "----[ $i ]--------------------"
+    cat "$i"
+    echo "------------------------------------"
+done
+
+exit 1
diff --git a/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb b/me=
ta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
new file mode 100644
index 0000000000..c32d6f9646
--- /dev/null
+++ b/meta-oe/recipes-connectivity/conserver/conserver_8.3.0.bb
@@ -0,0 +1,111 @@
+SUMMARY =3D "Manages connections of multiple users to a serial console or =
TCP/unix sockets"
+DESCRIPTION =3D "\
+    Conserver allows multiple users to watch a serial console at the same =
\
+    time. It can log the data, allows users to take write-access of a cons=
ole \
+    (one at a time), and has a variety of bells and whistles to accentuate=
 \
+    that basic functionality. The idea is that conserver will log all your=
 \
+    serial traffic so you can go back and review why something crashed, lo=
ok \
+    at changes (if done on the console), or tie the console logs into a \
+    monitoring system (just watch the logfiles it creates). \
+"
+HOMEPAGE =3D "https://www.conserver.com/"
+BUGTRACKER =3D "https://github.com/bstansell/conserver/issues"
+SECTION =3D "console/network"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db28513e7b696027d3d2b8dbf117f9fe=
5"
+
+DEPENDS =3D "libxcrypt"
+
+inherit autotools ptest systemd useradd
+
+SRC_URI =3D "\
+    git://github.com/bstansell/conserver;protocol=3Dhttps;branch=3Dmaster;=
tag=3Dv${PV} \
+    file://conserver.service \
+    file://run-ptest \
+"
+SRCREV =3D "fe9aac337554f95721dc9f3da721092a81092089"
+
+# In 8.3.0, conserver fails to build with uds and ipv6
+# https://github.com/bstansell/conserver/issues/112
+PACKAGECONFIG ?=3D "\
+    openssl \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', 'ipv4 ipv6', '', 'uds trus=
t-uds-cred', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6 pam', d)} \
+"
+
+# Trust reverse DNS information
+PACKAGECONFIG[trustrevdns] =3D "--with-trustrevdns,--without-trustrevdns"
+# Produce extended messages
+PACKAGECONFIG[extmsgs] =3D "--with-extmsgs,--without-extmsgs"
+# Use Unix domain sockets for client/server communication [/tmp/conserver]
+PACKAGECONFIG[uds] =3D "--with-uds=3D/run/${PN},--without-uds"
+# Trust UDS credentials obtained via socket
+PACKAGECONFIG[trust-uds-cred] =3D "--with-trust-uds-cred,--without-trust-u=
ds-cred"
+# Compile in libwrap (tcp_wrappers) support
+PACKAGECONFIG[libwrap] =3D "--with-libwrap,--without-libwrap,tcp-wrappers"
+# Compile in OpenSSL support
+PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
+# Require server SSL certificate by client
+PACKAGECONFIG[req-server-cert] =3D "--with-req-server-cert,--without-req-s=
erver-cert"
+# Compile in GSS-API support
+PACKAGECONFIG[gssapi] =3D "--with-gssapi,--without-gssapi,krb5"
+# retry username without @REALM with gss-api authentication
+PACKAGECONFIG[striprealm] =3D "--with-striprealm,--without-striprealm"
+# Compile in FreeIPMI support
+PACKAGECONFIG[freeipmi] =3D "--with-freeipmi,--without-freeipmi,freeipmi"
+# Compile in dmalloc support
+PACKAGECONFIG[dmalloc] =3D "--with-dmalloc,--without-dmalloc,dmalloc"
+# Enable PAM support
+PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam"
+# (experimental) Use IPv6 for client/server communication
+PACKAGECONFIG[ipv6] =3D "--with-ipv6,--without-ipv6"
+
+EXTRA_OECONF +=3D "\
+    INSTALL_PROGRAM=3D'install --strip-program=3Dtrue' \
+    --with-pidfile=3D/run/conserver/conserver.pid \
+    --without-rpath \
+"
+
+PACKAGE_BEFORE_PN +=3D "${PN}-client"
+SUMMARY:${PN}-client =3D "Client to connect to conserver"
+FILES:${PN}-client +=3D "${bindir}/console"
+
+PACKAGE_BEFORE_PN +=3D "${PN}-convert"
+SUMMARY:${PN}-convert =3D "Converter for old config files of conserver"
+FILES:${PN}-convert +=3D "${libdir}/${PN}"
+
+# tests fail with ash
+RDEPENDS:${PN}-ptest +=3D "bash"
+
+SYSTEMD_SERVICE:${PN} =3D "${PN}.service"
+
+USERADD_PACKAGES =3D "\
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '${PN}', '', d)} \
+"
+USERADD_PARAM:${PN} =3D "\
+    -M -d /invalid -r -U -s ${sbindir}/nologin conserver; \
+"
+
+do_install:append() {
+    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false',=
 d)}
+    then
+        rm ${D}${datadir}/examples/${PN}/conserver.rc
+
+        install -m 644 -D -t ${D}/${systemd_unitdir}/system ${UNPACKDIR}/c=
onserver.service
+    else
+        install -d ${D}${sysconfdir}/init.d
+        mv ${D}${datadir}/examples/${PN}/conserver.rc ${D}${sysconfdir}/in=
it.d/${PN}
+    fi
+
+    install -d ${D}${datadir}/doc/${PN}/examples
+    mv ${D}${datadir}/examples/${PN}/* ${D}${datadir}/doc/${PN}/examples
+    rmdir ${D}${datadir}/examples/${PN} ${D}${datadir}/examples
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/conserver ${D}${PTEST_PATH}/console
+    ln -s ${sbindir}/conserver ${D}${PTEST_PATH}/conserver
+    ln -s ${bindir}/console ${D}${PTEST_PATH}/console
+    cp -a ${S}/test ${D}${PTEST_PATH}
+}
--=20
2.53.0


