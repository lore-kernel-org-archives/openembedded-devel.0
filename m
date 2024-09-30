Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3A0ECF6499
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 12:10:10 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.93])
 by mx.groups.io with SMTP id smtpd.web10.52735.1727698205990209830
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 05:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=S4U8oIOT;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.93, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwa1mKnAga2d+8JybVlexN+jhpmcyvLQhy1U9ToOzBLEiqtPddLAjx/qVvvO+nzw0jcBS25rPapL08MplWDInHa3ZZB1w5xnaBDKtG3+lFuSvy6dd6V/os7nA1hPGvWXU64kj3om54eB6qPclsQ5Vao3+Eq67r6p9SjGmo1zkOzBHccVJJC6GJjeCsxM4jtrzYYMTbua8hib9rvRRYVfBOHU4VaEI2wbNQSt6HAzcDRM5cDHD0o4MrQQvY84Ojr/Bf/bbVee5dKkpV1tP/fzhIxLHjg/yTuBfk0l5EObcWFoH7u6bfAoDs/ktP2CkJh3o9wJarF0vxk1OFl3ZN+bHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9qKcT1d6feUXrWvrQPPlhJ1OjTb7x8yhvKzHzP3O+rc=;
 b=LzfpncnZJtHvXH8rfn8iX8p86xPSrldnjLTLYa4S8nOSTgwD3CSec+s1eUcK26KEZHKujYyjoqeIE/L9ytT5M68ZqEBlUWqtlQ1G6piYx29ZYUQvkyZqe7LDqnRcEWULTRKwneER+kFk8sEv97ThWxxjdjriJ7kpAwTLyEle8/t2xTeeQCRz+0aud3sO63DswSnPkyEGAzVTNUTtQfMwjUU0AMtXq3Tqqyg+3QLBvvTF/PIOEPbQxNuK+TcN/wcTw2T5Z1ueIRbjut54xHZmv74SGpK0rjYreRGd04BwzDVxC0FN1MTIahfrnZ8FKFS1ZNGsczb3TLCXkOFLIuS4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qKcT1d6feUXrWvrQPPlhJ1OjTb7x8yhvKzHzP3O+rc=;
 b=S4U8oIOTMcSG1ZS2K+rxqzeRqOBW8YlIjiy8g3KvvMd9yavDi2mrrKFJo6ERtmj5dOvQ5eiMyNk7IUgMcmL4heStU61++WXWUwf5xbObhZ37WSJEkjHfyVV2GWskTQEmyTsMLeDXZI9H65dgG8UnexdX0/ymZP7Ic6XabM43PIUDqc6kRFC+VKPVJPIO+a70WVFI5QyKAMQ/rkJAMcQXQFtRbVBR7Q0Xe1dbqj+1XtTPJNZMby/ga01+C4MZTe8taH69dApM9SmPGMq0NCc/9TAucIbjNB0HJrFkE6NLj5NSjIn0Iei6FzYpg2HX8wdUzqNHRdjYnIBKpsmEE7JLww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by GVXPR06MB9323.eurprd06.prod.outlook.com (2603:10a6:150:1b8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.21; Mon, 30 Sep
 2024 12:10:00 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 12:10:00 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: derek@asterius.io,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-webserver][PATCH] cherokee: Remove obsolete recipe
Date: Mon, 30 Sep 2024 12:09:40 +0000
Message-ID: <20240930120940.2051508-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0099.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::34) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|GVXPR06MB9323:EE_
X-MS-Office365-Filtering-Correlation-Id: 68dcb4fc-e502-4d0b-1620-08dce148cedd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yUi51FctBafPpP7af3gqqDNGC+hoWS1NItIkBUOR7twLG0vT/ZlV29zO5qjk?=
 =?us-ascii?Q?Rt5p7nQIX5ombb7LK/vsO09DnGFlDBCnguqLMcBfLHMzV6L+t3gVhJXAYCz7?=
 =?us-ascii?Q?WZD79V6GraYdOPY6CfVHuryue+PodAgNynuZWdxABwXE8uOIvw9HeMDYTwW0?=
 =?us-ascii?Q?iYuFo/I8GqkZgR628kFGOpfxchYKmJDnbACm/Bu8+t8cSJDIgUrPvdQWiA8I?=
 =?us-ascii?Q?DFYtdHiflqmjxx2q14gVbv3eVP/cfC8J8FBjbZk74NRTMLXJ49D/GPS7RKIn?=
 =?us-ascii?Q?0VPAsi3H3yb3I/IOPSCMH6pISPpS8XFo2+AjPdPcx/0IZ9oAWLUEnAQptlHB?=
 =?us-ascii?Q?JfAVKOmXSIfyS+Oxz44pU7ht/oKImabe+2B4qpBInNQSEbx6meaI4dr9xUOG?=
 =?us-ascii?Q?prYz0j4JXfiwOwVN5dfZueJ2DOiVMq8/btbQsP94rhyTo3KJabo+013Tjrpe?=
 =?us-ascii?Q?NG3WAebjlpT+Fr7srm/bL2tjKWdUYtTZvsj2e2qhCfHKAaeuKPYU6LFS9HxN?=
 =?us-ascii?Q?AtFJxs0asSHINdw4qICGt2IhCzroZ51uNN1Y0kERgtIScIt1NSBgxrDRPx0B?=
 =?us-ascii?Q?oFVg/glTRfuBYPLmWpOx/eGWo5OQHobe1vzvR5NOg1REz9VMXaQiD6UB5EIZ?=
 =?us-ascii?Q?giDTlzGMdI6HmRnPkKqjDWSWYTNVQiV/e9x8qMDwTI4PxxvJCytZPeqFjISp?=
 =?us-ascii?Q?scZXkX5TEo8GWZOAJ4jAN1ydLy4VbLSpUbhGB74N/dWZ7v3wNHs5LQhRGsdv?=
 =?us-ascii?Q?8I0Qs1+VOtOmXVtk3vvWknVpI+S35nAa6GoaJy9iuoglnLsjZkubHqNT/RMc?=
 =?us-ascii?Q?artFiUp+cA3yCkBO1f/m6EYilu2w3mtMbC/C2rsXLQw4zE24mNpsgxs0Ah7U?=
 =?us-ascii?Q?LBUeN3hZ/DEStB8uEhzSse/926K6HhKGpTM8jbJYDyQUH3tzSrHGR9V5Uc3B?=
 =?us-ascii?Q?cY6i7CFpWysmie64yivUQU3E+KHS2yvZyhtqfu8Vrw8SqkNc+0A4gcpN/wuU?=
 =?us-ascii?Q?tF5JVkFpaF3z8kTaq3Jbn7V8vAa0bahMaCH6VjHJq01QeGIXVXfXfB6K5+mn?=
 =?us-ascii?Q?nqhIyQhO1tIc60RhLnmzvkWnLc4zH5OLTn+KJqzHmcYLuZQatCs5xw/8htA0?=
 =?us-ascii?Q?lWu2UTJHXJRYhKPaZzTdtbONjn2DdlfjIR9CleJk4BdoLOr8zuGYLqMrPV0W?=
 =?us-ascii?Q?CjcXMzwCprY+4r898CbyrRr5WapDlpQ9chBXBwJ5MpRCSBngaOM1RHFel78O?=
 =?us-ascii?Q?X8l97vX11wRMRD6tVLXf+0snnHMTiiMlHwpjN1mKwQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?k9w/GyVP7mfPZEpfcMlA+IUeW2J+AfW4KrCp635KTX2jXBRbq/o1hSGDA3EQ?=
 =?us-ascii?Q?tSykttnUzudXImfw4bMK2e3FEwoHrLKmiCmMIywpQkEdbzKCmHEpvoorNQJG?=
 =?us-ascii?Q?0s2bxDBcP+g31uAYuq2lN0FeSLL0jwGlyuAZyKXDzKSHY85yNs8Xqh8XTGgp?=
 =?us-ascii?Q?43aLybQHaDiq1Ghmq61lt1eRwMZOOw/CxNsmfcGDTQl8Pga81C3ZZ+HeH4dV?=
 =?us-ascii?Q?g0ki4W/VzZKJtW/80CmOd3EcJVuV7DzGyBXwXypeOQ0TR/tNVCObZrspi++z?=
 =?us-ascii?Q?yuyil5Za/RMDmZeQiebIeDGgzM35YF8wmFELOgKu4YxCjrMHYuIUS5iZs0Th?=
 =?us-ascii?Q?aMV/wAOkvZtTtHTMK+fY8aRvmmiVZ4sNvjcVy1/cNH+vjCXmxmvBbVN/jNwK?=
 =?us-ascii?Q?HHRJWej6+FNl+YbO1EAsMmhmI1KNuxLWoHNGf5Hxy3plEu7yaHClP/zmotKl?=
 =?us-ascii?Q?nPW0HCPRF8/ItcXvsPujiNU/TA4tgSb7BhewoejBHg9devduuhPPEvRUeQQN?=
 =?us-ascii?Q?B347oOQgrKZrJ42uC6HNhlhJMX4kHfmiGumPbMhAzsxGv21wN8EZuG+PGsel?=
 =?us-ascii?Q?gbNdjiebucIQXNcWvKRcaeki3dNVYPE5cjb5ShfZb1VgCXKE7PTeDN1I6pnq?=
 =?us-ascii?Q?6IPH6YFQvpH53gqUtbIUCRXYBBng1nt1wzqX/Wq9xQLHf5f28AATHlKiweOA?=
 =?us-ascii?Q?DY0JWTWhwsM1+F0sIeikVC9S9UQ/pCdxK8hxyCl1SoSsVGkA23aFBpSsYDQI?=
 =?us-ascii?Q?jjRrQQ/uQU5fEwYbnFcxCNirkfP3vc3Ool5LkNyXu1y9Geely8bho5MzK12j?=
 =?us-ascii?Q?Xg/khj6UUEbOJuHpbDU2RE615kO29NeVeP7cfh6cijFJ+7LU1k9TBzHzS7Zt?=
 =?us-ascii?Q?AybzMsN3/SNj5dwtI+TUGzkVK0I8FqNA8Wvn3liqeT8yD2WsabhrwE3ZFnnI?=
 =?us-ascii?Q?PBPk2Hh+6PR8jaNWBB9p9+HDyOLSPDAYl4min0KCOEU5lnqT2gMVz0ISCLYV?=
 =?us-ascii?Q?msfAwfIRXa9tWUzunlAslO/6Wc3Ez+DlVj/UYrTqBWpd5Unvcdl1dMy199ny?=
 =?us-ascii?Q?JBrT5LwzcaSPUty96AtW7XG467BMQm28xKg9jBnnTIEpyyFKsE6fjJy7n607?=
 =?us-ascii?Q?Ww1BO2I6ngwTqZj2cBx7i5m+XpXpZZ7E3fS8BeH+BD28P9/dPTONVqm6NVrh?=
 =?us-ascii?Q?+SlHE919a5eTxsbCW9teZ0oApHteRGvEfaFJMZGEI7kg++rJ7ksd4Kkt13Rn?=
 =?us-ascii?Q?lz+7hRXtBQWEsVvHYtFcW1gRQ9KxkH5920P8uQEjeAJzI+LSVaHnopxkZdHu?=
 =?us-ascii?Q?bh3gqsyBQPTSeNxtNoiAJNrRszcR0pISXMBXCBnFgP6qgUGXBJvJn0I5Ml3Q?=
 =?us-ascii?Q?XSx0qUrttg2FL02MC+tauukfA7PYdW2XWk8+9K2R6Jku3MvwfTtvLR6pUaLf?=
 =?us-ascii?Q?frOBWsZyd7aoc1syNDFa9ZLT6A3xDzvbPSxWWvrsMBMQ4cWe+jl4j0U10X4v?=
 =?us-ascii?Q?XNPnD+C41era7k5921RTe4YrLlsJRRqlYHENc+8uWbZqygEUpqUcmK3UKP8W?=
 =?us-ascii?Q?Y9eAdkKd19oWi0RHKZE7qDyQ1Okdg3D52SLJcKtSi6A+YKpJXG9Q7R0aCtM1?=
 =?us-ascii?Q?UA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68dcb4fc-e502-4d0b-1620-08dce148cedd
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 12:10:00.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkQHbPddv5yRDJbUXJ/dB2u34jUuw2dektBPRc/wFSo+HBgX6XY7J/DqkRjD6y2tJ592pD+TF4H0IV1sWHl+aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR06MB9323
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 12:10:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112605

This recipe depends on meta-python2, master branch of which has not
been updated sine February 2022, see
https://git.openembedded.org/meta-python2/log/?h=3Dmaster

Also, https://cherokee-project.com/doc/basics_requirements.html states

  The main Python releases targeted by our developers are 2.4, 2.5 and 2.6.
  Anything other than that is not guaranteed to work at the moment.

Also, master branch of cherokee has not been updated since January
2023, see https://github.com/cherokee/webserver/commits/master/

Thus, remove the obsolete recipe and the associated packagegroup
reference.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroup-meta-webserver.bb            |  1 -
 ...rnal.h-Define-LLONG_MAX-if-undefined.patch | 47 -----------
 ...e.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch | 31 --------
 .../0001-make-Do-not-build-po-files.patch     | 28 -------
 .../cherokee-install-configured.py-once.patch | 40 ----------
 .../cherokee/cherokee/cherokee.init           | 32 --------
 .../cherokee/cherokee/cherokee.service        | 10 ---
 .../recipes-httpd/cherokee/cherokee_git.bb    | 79 -------------------
 8 files changed, 268 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/0001-com=
mon-internal.h-Define-LLONG_MAX-if-undefined.patch
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/0001-con=
figure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/0001-mak=
e-Do-not-build-po-files.patch
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/cherokee=
-install-configured.py-once.patch
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/cherokee=
.init
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee/cherokee=
.service
 delete mode 100644 meta-webserver/recipes-httpd/cherokee/cherokee_git.bb

diff --git a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-w=
ebserver.bb b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-=
webserver.bb
index e775cdb50..fc97f6e58 100644
--- a/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserve=
r.bb
+++ b/meta-webserver/recipes-core/packagesgroups/packagegroup-meta-webserve=
r.bb
@@ -21,7 +21,6 @@ RDEPENDS:packagegroup-meta-webserver =3D "\
 RDEPENDS:packagegroup-meta-webserver-http =3D "\
     apache-websocket \
     apache2 \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "cherokee",=
 "", d)} \
     hiawatha \
     monkey \
     nginx \
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-common-int=
ernal.h-Define-LLONG_MAX-if-undefined.patch b/meta-webserver/recipes-httpd/=
cherokee/cherokee/0001-common-internal.h-Define-LLONG_MAX-if-undefined.patc=
h
deleted file mode 100644
index 0f4384275..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-common-internal.h=
-Define-LLONG_MAX-if-undefined.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From c73415021f3f3b2b30062ab74b25fe49c51c2242 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 10 Nov 2019 15:59:44 -0800
-Subject: [PATCH] common-internal.h: Define LLONG_MAX if undefined
-
-time_t can also be long long type, therefore check for that as fallback
-Fixes build on 32bit hosts where time_t is fixed for Y2K38
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cherokee/common-internal.h | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/cherokee/common-internal.h b/cherokee/common-internal.h
-index 5c28da97..5646ec0f 100644
---- a/cherokee/common-internal.h
-+++ b/cherokee/common-internal.h
-@@ -222,6 +222,16 @@ char *strcasestr(char *s, char *find);
- # endif
- #endif
-=20
-+/* Long Long limit
-+ */
-+#ifndef LLONG_MAX
-+# if (__SIZEOF_LONG_LONG__ =3D=3D 8)
-+#  define LLONG_MAX 0x7fffffffffffffffLL
-+# else
-+#  error "Can't define LLONG_MAX"
-+# endif
-+#endif
-+
- /* time_t limit
-  */
- #ifndef TIME_MAX
-@@ -229,6 +239,8 @@ char *strcasestr(char *s, char *find);
- #  define TIME_MAX ((time_t)INT_MAX)
- # elif (SIZEOF_TIME_T =3D=3D SIZEOF_LONG)
- #  define TIME_MAX ((time_t)LONG_MAX)
-+# elif (SIZEOF_TIME_T =3D=3D __SIZEOF_LONG_LONG__)
-+#  define TIME_MAX ((time_t)LLONG_MAX)
- # else
- #  error "Can't define TIME_MAX"
- # endif
---=20
-2.24.0
-
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.=
ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch b/meta-webserver/recipes-httpd/che=
rokee/cherokee/0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch
deleted file mode 100644
index b16060f2a..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-configure.ac-Add-=
foreign-to-AM_INIT_AUTOMAKE.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 4591b5b40d66c19edc73b951ad091dac639454c9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 25 Jul 2017 16:00:34 -0700
-Subject: [PATCH] configure.ac: Add foreign to AM_INIT_AUTOMAKE
-
-Fixes errors like
-| Makefile.am: error: required file './README' not found
-| Makefile.am: error: required file './ChangeLog' not found
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index d6298f27..98cab791 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -32,7 +32,7 @@ dnl Init autoconf and automake
- AC_INIT([cherokee], [cherokee_version], [http://bugs.cherokee-project.com=
/], [cherokee])
- AC_CONFIG_SRCDIR([cherokee/server.c])
- AC_CONFIG_MACRO_DIR([m4])
--AM_INIT_AUTOMAKE([no-define])
-+AM_INIT_AUTOMAKE([no-define foreign])
-=20
- dnl Define version
- AC_DEFINE(PACKAGE_MAJOR_VERSION, "cherokee_major_version", [Version strin=
g])
---=20
-2.13.3
-
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-no=
t-build-po-files.patch b/meta-webserver/recipes-httpd/cherokee/cherokee/000=
1-make-Do-not-build-po-files.patch
deleted file mode 100644
index 1d6a2182b..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/0001-make-Do-not-build=
-po-files.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e9ae3231ec188df801fe51aa95d6afec2e52db58 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 25 Jul 2017 16:14:19 -0700
-Subject: [PATCH] make: Do not build po files
-
-Target fails to build
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index f01278c3..eb864c36 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,6 +1,6 @@
- ## Cherokee: Makefile.am  -*- makefile -*-
-=20
--SUBDIRS =3D po m4 www icons themes qa doc . admin contrib cherokee cget p=
ackages dbslayer
-+SUBDIRS =3D m4 www icons themes qa doc . admin contrib cherokee cget pack=
ages dbslayer
- SUFFIXES =3D .sample.pre .sample .h.pre .h .xml.pre .xml
- ACLOCAL_AMFLAGS =3D -I m4
-=20
---=20
-2.13.3
-
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee-instal=
l-configured.py-once.patch b/meta-webserver/recipes-httpd/cherokee/cherokee=
/cherokee-install-configured.py-once.patch
deleted file mode 100644
index 3336f7df7..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee-install-confi=
gured.py-once.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 98a0f19df0a31d5649ad89d395fd1b8de5591827 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Thu, 3 Apr 2014 21:33:25 +0800
-Subject: [PATCH] admin/Makefile.am: only install configured.py once
-
-Both the two rules install-adminpyDATA and install-generatedDATA will
-install the configured.py to the same location, they can run parallel,
-and they use "install -m", which would might build failures:
-
-/usr/bin/install: setting permissions for `/path/to/configured.py': No suc=
h file or directory
-
-This is because the first install is setting the permission while the
-second install is removing the file an re-install.
-
-Only install the configured.py once will fix the problem, I think that
-there is no side effect since it installed the same file to the same
-location twice in the past.
-
-Upstream-Status: Pending
-
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
----
- admin/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/admin/Makefile.am b/admin/Makefile.am
-index ce5937b..6f96934 100644
---- a/admin/Makefile.am
-+++ b/admin/Makefile.am
-@@ -73,7 +73,6 @@ SystemStatsWidgets.py \
- Wizard.py \
- XMLServerDigest.py \
- config_version.py \
--configured.py \
- consts.py \
- util.py \
- popen.py \
---=20
-1.8.2.1
-
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init b=
/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
deleted file mode 100644
index 93603b84d..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
+++ /dev/null
@@ -1,32 +0,0 @@
-#!/bin/sh
-DAEMON=3D/usr/sbin/cherokee
-CONFIG=3D/etc/cherokee/cherokee.conf
-PIDFILE=3D/var/run/cherokee.pid
-NAME=3D"cherokee"
-DESC=3D"Cherokee http server"
-
-test -r /etc/default/cherokee && . /etc/default/cherokee
-test -x "$DAEMON" || exit 0
-test ! -r "$CONFIG" && exit 0
-       =20
-case "$1" in
-  start)
-    echo "Starting $DESC: "
-    start-stop-daemon --oknodo -S -x $DAEMON -- -d -C $CONFIG
-    ;;
-
-  stop)
-    echo "Stopping $DESC:"
-    start-stop-daemon -K -p $PIDFILE
-    ;;
-
-  restart)
-    $0 stop >/dev/null 2>&1
-    $0 start
-    ;;
-
-  *)
-    echo "Usage: $0 {start|stop|restart}"
-    exit 0
-    ;;
-esac
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.servic=
e b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.service
deleted file mode 100644
index a2d703185..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=3DCherokee web server
-After=3Dsyslog.target
-
-[Service]
-Type=3Dforking
-ExecStart=3D/usr/sbin/cherokee -d -C /etc/cherokee/cherokee.conf
-
-[Install]
-WantedBy=3Dmulti-user.target
diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb b/meta-w=
ebserver/recipes-httpd/cherokee/cherokee_git.bb
deleted file mode 100644
index 53d6a85ae..000000000
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_git.bb
+++ /dev/null
@@ -1,79 +0,0 @@
-SUMMARY =3D "Cherokee Web Server fast and secure"
-SUMMARY:cget =3D "Small downloader based in the Cherokee client library"
-HOMEPAGE =3D "http://www.cherokee-project.com/"
-SECTION =3D "network"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19=
f"
-
-DEPENDS =3D "unzip-native libpcre openssl mysql5 ${@bb.utils.contains('DIS=
TRO_FEATURES', 'pam', 'libpam', '', d)}"
-
-SRCREV =3D "9a75e65b876bcc376cb6b379dca1f7ce4a055c59"
-PV =3D "1.2.104+git"
-SRC_URI =3D "git://github.com/cherokee/webserver;branch=3Dmaster;protocol=
=3Dhttps \
-           file://cherokee.init \
-           file://cherokee.service \
-           file://cherokee-install-configured.py-once.patch \
-           file://0001-configure.ac-Add-foreign-to-AM_INIT_AUTOMAKE.patch =
\
-           file://0001-make-Do-not-build-po-files.patch \
-           file://0001-common-internal.h-Define-LLONG_MAX-if-undefined.pat=
ch \
-"
-
-S =3D "${WORKDIR}/git"
-
-inherit autotools-brokensep pkgconfig binconfig update-rc.d systemd ${@bb.=
utils.contains("BBFILE_COLLECTIONS", "meta-python2", "pythonnative", "", d)=
}
-
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
-PACKAGECONFIG[ffmpeg] =3D "--with-ffmpeg,--without-ffmpeg,libav"
-PACKAGECONFIG[ldap] =3D "--with-ldap,--without-ldap,openldap"
-PACKAGECONFIG[geoip] =3D "--with-geoip,--without-geoip,geoip"
-PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
-
-EXTRA_OECONF =3D "--disable-static \
-                --disable-nls \
-               ${@bb.utils.contains('DISTRO_FEATURES', 'pam', '--enable-pa=
m', '--disable-pam', d)} \
-               --with-wwwroot=3D${localstatedir}/www/cherokee \
-"
-
-do_install:append () {
-    install -m 0755 -d ${D}${sysconfdir}/init.d
-    install -m 755 ${UNPACKDIR}/cherokee.init ${D}${sysconfdir}/init.d/che=
rokee
-
-    # clean up .la files for plugins
-    rm -f ${D}${libdir}/cherokee/*.la
-
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${UNPACKDIR}/cherokee.service ${D}${systemd_unitdir}/s=
ystem
-    rmdir "${D}${localstatedir}/run"
-    rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
-}
-
-# Put -dev near the front so we can move the .la files into it with a wild=
card
-PACKAGES =3D+ "libcherokee-server libcherokee-client libcherokee-base cget=
"
-
-FILES:cget =3D "${bindir}/cget"
-FILES:libcherokee-server =3D "${libdir}/libcherokee-server${SOLIBS}"
-FILES:libcherokee-client =3D "${libdir}/libcherokee-client${SOLIBS}"
-FILES:libcherokee-base =3D "${libdir}/libcherokee-base${SOLIBS}"
-
-# Pack the htdocs
-FILES:${PN} +=3D "${localstatedir}/www/cherokee"
-
-CONFFILES:${PN} =3D " \
-                   ${sysconfdir}/cherokee/cherokee.conf \
-                   ${sysconfdir}/init.d/cherokee \
-"
-
-INITSCRIPT_NAME =3D "cherokee"
-INITSCRIPT_PARAMS =3D "defaults 91 91"
-
-RPROVIDES:${PN} +=3D "${PN}-systemd"
-RREPLACES:${PN} +=3D "${PN}-systemd"
-RCONFLICTS:${PN} +=3D "${PN}-systemd"
-SYSTEMD_SERVICE:${PN} =3D "cherokee.service"
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
-
-CVE_PRODUCT +=3D "cherokee_web_server"
--=20
2.39.2


