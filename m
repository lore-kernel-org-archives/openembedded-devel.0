Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFBA108E1E6
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 10:47:36 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.101])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8208.1773917249431480313
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 03:47:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=RoR7OVA3;
 spf=pass (domain: navimatix.de, ip: 52.101.69.101, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hDK++LAm4InuKu+XmE6vFvvfSzQKSk1r98r5AwGyO+/3hOkvD8oX+Yvq75NN11fXD8k94b85Ih2sfGD7ttr699YytdTLyjAzT6IDBMDdoTsJb3M9ZxoyazuyRF1zvdzIdGfZMn14107+VcC/Cjfv+taFznfhxaiekGKoYpGoFx4Z2NGQLjp292riiQPnkRLVyBoBOQ3TI5ERfVgYr6mauqwOanU5U9oFU5Mph8kmauixkr9wJM+ypQD+T3lBCp42z1zqWahgXAuS/3wIQJrnitt0j7+6glv5Kv6XUWAp1KbZ+X8Cssr1Fu9wQYnv88ZJ/2Kr4P78RjXX9164RapxAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PY00OhNh/QnnlGgq//7z3lepqS9xF7LzK9A7zHomIBY=;
 b=FoUXgCxtf0zK7L2bLH6kMxn1qh/rRKx+pH81XjAwcO6pa9p2z27oQGzL0GI+IYu/pYakFSHDuPXEQngIXZGMA7GZKMMfFXO7BRbaFvaRz3E4vk3b/SRXCKV5rh7g4+3+zxfbcT7lMpRaUaEZ3kxMLCUy2Ixx5queNqStIqA2putjEO2It4Q92jz0gvCeIjDut2lQxMDXG7151P6x7mp39mdT0TAv7Qzo0lQS/TCU/+Fk+Pi/6r24wStpQiSsv4tEJu+D0e89iREiImbxQdAHj9FN+d3eM2oW1GqlcWk5OBqwgycmm50sfnp/1ilVGE/GtP2z0FIvREhLZmIXT/Vkfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY00OhNh/QnnlGgq//7z3lepqS9xF7LzK9A7zHomIBY=;
 b=RoR7OVA3YtFEH4H5Dwn0o3U5+nZCzuRwojFcJ5DHfdiJtKRoPzfpIUoY9DSocuYVA9E6Zn4iOQt7Nu70rmlmBA85aNdF2Mnuvdee5/oVrTE3yngvA5pUXEcGJb+/UM5iQ/0rmfo60ufWz41sptHmk47b9sKTXGM/mxrbrYnWhug=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB9PR01MB7225.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:211::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 10:47:25 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.20.9723.018; Thu, 19 Mar 2026 10:47:25 +0000
Date: Thu, 19 Mar 2026 11:47:23 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-devel@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] conserver: Add recipe for remote console server
Message-ID: <ada1edc64fc422e4e638c4a98613bd86f321f321.1773917242.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0051.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DB9PR01MB7225:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e12921d-1372-414e-2bea-08de85a4e814
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	3Rbzyeo5Ba0d8YKFMJwo5M6cJ+8Cq1ScxBdt0nLTalOPTf6pWV6wpuzHyrWqB9nw4B2ZaZJqv9DTnaC5UAQK/VIsKf8ztjD/bY4ZWtHy+Zviijq92WF1thgBPDcOoZfJoj3nWfRT01JVnrx2JT5o7Aa2PEfL0JaK9x0kliNlJ7vAUDYUS7IrvFcTmbxgdYPFFGDCZTVPHNVfKFsooDkV6y9MCV9962oc5Pf6XJYze0oXnXZaR/1KrkefYuyrJpH75l8G545qHmn0mJ/hka1uhzMQ/ZwD0vfH2M+02Pf77dp3TKeH2lzoA9GWa8pk9NpOIdodvMM/7ocWkLrPxYbBci2/0zR6a6BjUFkWM2yeZyMW8ClxWh94FWsUZFRGW1ElbjuirpSwPyOxBoR71Yyn6HUepD+p3/9/0ie20NiEirM1rXODBChjqTA4x+e+JtOir3QAsJIkIAt2SmBTj90mjZX1TuTiDabluJhKmuqo8xWHvAYPXO+Sp8aJNiws31vWme5Q1HC+y2/2GfzVXel8Zhdf60439OUxYvhQf32YK0Gs5JUsh5T8Nz14wYEzaALFr9YcAyZNzpcODl9OBhs4mN9TjQv0mimmzZFPvl9uUz0U3Y8WB2GC9ZYM0oU72ZCNRrPknKas+dVppakIdrxCbGsYewAV1mNOwn0ul14sU4fQee6JtjQxEQO265RV8ElA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I9Z8if/qjAo6jVDzoLgS59+7+lNpQAOGE1z3967E/me5iesghmAXix+gk6Mh?=
 =?us-ascii?Q?+FWkKKjD2PBoAs9dVc7BtV812BOB3aPVrOuFuGJHuwkZ7S2qlG0mi67bfxrh?=
 =?us-ascii?Q?QqcU1jHvc/tJoXpZxOPF4JIIHzpDibpeoZFWOgnaz0VDUApo7GKI/oSJnLxF?=
 =?us-ascii?Q?QVVQ0kHcY1wBgJhrA5ui81LT4M51plsVip1KuRfgF3sfIAnRkDnilKUvlM0C?=
 =?us-ascii?Q?zYCT/z6xn0XBQ4nTtkh63VdxXIEsVI9HobD6o4RsCDF6udwdei8IPcLpYRts?=
 =?us-ascii?Q?dH7btpB13lc/KuIKPOiYlqqPmW6Wde15afRfzPQ6ozeq9WCYn2OhnIMgjgWN?=
 =?us-ascii?Q?AqmV59l18/qvNWPlBr9yFq54PkbJmWqFSQ9yOmkFQ8hn6K8J3GXJAi1YdQ3u?=
 =?us-ascii?Q?bx610PWSM7emnKUhQz6ETgba0BiynvnFvh0tRCx9rB2otbMCCAPtW3vDOSDd?=
 =?us-ascii?Q?JvLJoFsSX0XMPko/hzPhaqdGc3PHZl/iiU5eehpWn2WBIz6P5ZcAdoJqhbom?=
 =?us-ascii?Q?vXqi71V0mDA9LccSCpZNkubodjMxI7DjqCoiGVKnsuGA3Ocalfcbs2XFFz/7?=
 =?us-ascii?Q?9eaevHzmLUPfdFhNUsxWZDrv+JDu0uLhizolo6jaLEWzPWh8i/M0hA03wi7c?=
 =?us-ascii?Q?Po1PWyXOWvpWEpARM7sBYIsoa8rshRn+df6MOrsQmp9uQLT5P9Y4Xzy5bi/i?=
 =?us-ascii?Q?7uF/uIbtwV2kIAV7xtlzbyYwDi9DYo7JEhd5Krmc8qQ8zgkGEpau0HV0Vy6M?=
 =?us-ascii?Q?6FjgJ6nOB5XTO9+OLggzg8cWO/gYY9GFRik0NH7M9mY+f+LGJvoDhAPc0aoT?=
 =?us-ascii?Q?ru96RJ1d9BXgqm4M4tEvaD2sm5b2QfhiL2JcObVFMoauLvJZPHAjudoa/Ksg?=
 =?us-ascii?Q?dwxWRefCqfAJ91xIL3qJf7QDzntQ3doRGV/n15rEYBz1EQztl94efcoC6yiF?=
 =?us-ascii?Q?eh63BZGxhWh3X1yMYusj+airG3W8pF/0VO03010mHvgPtyKMTp16Qu5Nqfye?=
 =?us-ascii?Q?ffSvM96cI6kLZq5EpETA5rY8RChLULz0ttP4EDb2f9/xYdRBfa3eI5gQArWJ?=
 =?us-ascii?Q?RMuX1WGwdKmrjZ8ziYRFzngsUlciHuWZCj/i3+d8d8JiLK0UYaqD86PmDNdJ?=
 =?us-ascii?Q?JTAlg1QU0HfhiVBh8hy6Fx/A4Ef6YMp+x2cNI07NsAxvK/t+1AKsXK6m5kE7?=
 =?us-ascii?Q?Z9GPoNIrTlVoYY0mtHEpH4DChepTvyW9RxAYSpuK2Fkx1BCBSnGz9i6gBYTx?=
 =?us-ascii?Q?64cNE1Hwq9VRQTRCUnqu5Saoy2JAS2ja6tmbnSDU6EHUSognkwuq6OpdYuU9?=
 =?us-ascii?Q?L1zxZIepUQflIGBsOl8252B4MLrIousaYsFliaL2AxobWrVv7yruKLPbhM0e?=
 =?us-ascii?Q?DTr9Kd2waMTLg2guI9KxK/70KD9sTOW3nCgMqiCM9GJEpI+Vuy2Nv6BgmzOp?=
 =?us-ascii?Q?jFMwawRjTrZN999TEQQqU4DhrJTm3ykL4CuIG6RDacUwHX33lSOy/8QckDeG?=
 =?us-ascii?Q?bC3pckaStqbGjSv6Z5qPihSluYErqRyg6sOBGH+WQoKV2qM3NikgJqz8oRxo?=
 =?us-ascii?Q?Pc66IfOa+gM7OzfOUge9NhVsNRCjwioGs9jVp+gZJ3mwk/1ID8F/q3ybzYMr?=
 =?us-ascii?Q?fcmSsumyMrISJj3TkY7aOekA4f0fRx0WNC+LtQNv1rAIYmUOIgPzfmoci1tX?=
 =?us-ascii?Q?kKjb/vsCU/cogP8LEbMETFDp7kdfkKOsh943vPPGRy74aDBAjcu7+v/iUhOG?=
 =?us-ascii?Q?CpTydb0VyZevI7TTvGm749jCXLGX5NA=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e12921d-1372-414e-2bea-08de85a4e814
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:47:24.9336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pQ0gJJ6HOlxbkggkPzfVxA5cHJspkBintI9bpFUKwR092IithUDlcRiIFn36Vpf7KMvNiLyTtuDKuyz3zwqJ9MDftpqssncvAvatF8eYuao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7225
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 10:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125394

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

The patches are required to build with detached build directory and
cross-compiling.

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../conserver/conserver/conserver.service     |  58 +++++++++
 .../conserver/conserver/run-ptest             |  21 ++++
 .../conserver/conserver_8.3.0.bb              | 111 ++++++++++++++++++
 3 files changed, 190 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver/conser=
ver.service
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver/run-pt=
est
 create mode 100644 meta-oe/recipes-connectivity/conserver/conserver_8.3.0.=
bb

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


