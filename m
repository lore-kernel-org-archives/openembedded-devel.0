Return-Path: <nandor.han@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C85AEC433F5
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 05:34:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.51])
 by mx.groups.io with SMTP id smtpd.web11.4068.1634103270708651323
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Oct 2021 22:34:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com
 header.s=selector1 header.b=UmdtTjPt;
 spf=pass (domain: vaisala.com, ip: 40.107.6.51,
 mailfrom: nandor.han@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jm4CFXLkjBLapPnp56iy/iKC9vAV2kpPj/GgFCs+CLG/TYCZYcQ+0hl1uLwamy8XfKCppND2MK7xcw7PjXoOJhB2NcHmXT+Xr7LJ5J5PKeZ5SwQtvBg2DyZgF0/i3bfhkfOjXJ+S6ErLVCDiyN7ShNdCZhT1RznP3cydW8HjFwX+5CyKNsE7Tz8DA+lIdJke+OH43Uy3/mwOQPtXSQ5YdB6Q2EomepVdnON9KPvRtouXO1c0pXZVfpSVfxJtIGapK4SZvgGOg71qBiJ1GVUSGdarG8/B/MxlTBknwZPY8zcyKMytzpG46jB2XkOGD9RYjeb2oZj44FFSp4R2SU4/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ZrJi93tzH3vYjMvenRkIMzyZQHqT+614AdIgE4sU+0=;
 b=fGB/iTDvbhqf3nlmBzaXob7rM5Z+9a9tmzvTDQ+wjJqTUCf988F/13c+Doc5fw0MFwUkp+4J/PAw6khE1xnnCO59DUiA5mfkkL1GQqWLJrgNAbJmPK9RJSQeUaZ6Yx5n5setr2c+s7L6QqMuSG+cPKW2Qv4JnF5XJ1bavYXO9uxTJikhSTJCD/2MwcfTP1y8RsT8U+aJzA8ldR0cOYtqn0GOQSf3oTwsuf3Hr9+LpQvB9geG25TDpEXNe/IyGbB9mhh6ag6l6TJd6Gkt+ALeKzt6XNu334jfDSvAk68yA7XZC4ZdXVipsYwliI+j1Sqc/nQ6dzTAXRnUqQB7+WUhcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ZrJi93tzH3vYjMvenRkIMzyZQHqT+614AdIgE4sU+0=;
 b=UmdtTjPtMhh/46631pd3mJVuT2h99Zbv28wfwZGwE0yIMd1aVYfMSWxPSOfrTKxsMP/CujFgfo2XnMuA8lzAIrhINKT5EDyNvfgXid+8DDL+sjRrqHCJv1jN4cihq+MMuP2K3aqcKi/3yYNEEs61OYm639hvKo6GbNNEYfTlikezdoDRbGJyMZtLmHikqtxMLjmcNEC7V1UNjXO7xdG5bLRKICsUKXtzMoZMqcwTUQueYnC1hDeizFBpSZu2SNbHPgHlx1zz2NFY+6tNyqX0iZfVCkRFRBYTff5vJFwmIBPjiFsV6bOrDCWkAAQlXmXRl2r3ErHZ2sy25pupTDF0sg==
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=vaisala.com;
Received: from HE1PR0602MB3498.eurprd06.prod.outlook.com (2603:10a6:7:86::11)
 by HE1PR06MB3980.eurprd06.prod.outlook.com (2603:10a6:7:9f::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 13 Oct
 2021 05:34:27 +0000
Received: from HE1PR0602MB3498.eurprd06.prod.outlook.com
 ([fe80::c118:b535:8c96:c940]) by HE1PR0602MB3498.eurprd06.prod.outlook.com
 ([fe80::c118:b535:8c96:c940%6]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 05:34:26 +0000
From: Nandor Han <nandor.han@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Nandor Han <nandor.han@vaisala.com>,
	sam.van.den.berge@gmail.com,
	raj.khem@gmail.com
Subject: [meta-oe][RFC PATCH] libiio: depend on avahi only when network backed
 is used
Date: Wed, 13 Oct 2021 08:34:19 +0300
Message-ID: <20211013053419.2871191-1-nandor.han@vaisala.com>
X-Mailer: git-send-email 2.26.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0502CA0003.eurprd05.prod.outlook.com
 (2603:10a6:3:e3::13) To HE1PR0602MB3498.eurprd06.prod.outlook.com
 (2603:10a6:7:86::11)
MIME-Version: 1.0
Received: from localhost.vaisala.com (188.67.214.176) by
 HE1PR0502CA0003.eurprd05.prod.outlook.com (2603:10a6:3:e3::13) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 05:34:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16793a0a-dccc-4302-3cf1-08d98e0b1f0f
X-MS-TrafficTypeDiagnostic: HE1PR06MB3980:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<HE1PR06MB3980520A4A24222A1DD6B99285B79@HE1PR06MB3980.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8F6vyclXtdF4zo1W8AL2hxvXk/EIkgyuDL6lLR7efX0DkbEXtdZytB+VSaH/ts2f62UGfM9eFQ3qrE7Qh/tdQfGEh/q3gBXdd+FVf69GLP9kwsmGaodwlW32ZiLnVdzLk6i3Y7vX1W+qfTHj5rVk+TQOrqS+l5BDovmKOGw4vHorZOu0UZNKIjEMOuUv9lqjFK1FQVpjbQPTeA/jxI6n2H5bB2vOXJwaYaomhivh1rcd2bQCJGXbLvkzWysJLkmZBB8aUU/j4w7ZxW1TaEQ5zMkgBKMYPavkD67niKquFbur0A6tFqgDuk9QGWFtsFKsKJFCdpOAgL6PQFnHR/nheygWXWw4tWf0BK/LXeG41o9suGnsV6M4GMHJ75yo2TRZAdr23EeH8+h3UigNHO52MVntTWUGSLD39BhOmHKO2E9kQLCCl07s+736VfMT+Saz7Y05xn1/Pm2Wh5q+9niKA6BtQM0XaGh+THsAZZlJJMMOoCnz1X+qsoYmx39uxHeWo2u8qAW3feP2sgo/RD6mqnKSr6j2RT4BPSu+HtQLoVyFPEPpQ54mBTnocdKJS3WQPSkG59d8HNEsQ5csSCyHMjOvC0L9DMgRRZ1tFlZOEez0HRdy1EysVEqTZYEkrxgu6EGmQKj4qKpBUxNjQk6Jvdtsw+hC/EqhhwVidlb/0eZDv7NWbuJhlb7HDrmzszDumuAL35Nb3LCrGOEc/lqGjA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3498.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(956004)(83380400001)(8936002)(8676002)(86362001)(6486002)(44832011)(186003)(5660300002)(1076003)(26005)(6916009)(36756003)(316002)(6666004)(4326008)(2906002)(38350700002)(52116002)(508600001)(38100700002)(7696005)(66556008)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ac+TKAQdPlV6IMgSiWXKYHUJnJw3+Dg7AETgzHByye/ht+3UOMntNmgGX5Mk?=
 =?us-ascii?Q?ErFaFIvDXQK9H90jpnF8KriI8Qj3kx/DsG4emOvjUe56/V9kEKM5APF0un/i?=
 =?us-ascii?Q?oVtIw4b55xFO3RWfzzwJks9S2KHcpg6B96MItBcLrLU6FtZCO6uS6suOcF78?=
 =?us-ascii?Q?a9qdc5qXBQ0OjFO88/k0HWAvI0DBTtvxuxg+zTWyXPvTQqtphHNJPAWz2KDA?=
 =?us-ascii?Q?j3QK3aJON52OKg+DwQujFNuRiNz/tcEa0psvB/pMcjKlEzVFSxnK7bHQLUE1?=
 =?us-ascii?Q?xmqwhCvunQ/drPctzmxDEY+76l51ggBRcXfwSlzLkIIe6AZ4i+CHmkyfA3aB?=
 =?us-ascii?Q?f2mL5gBdA/fkMfqTu4WD0kcJjDta4bMrhVgyGaPmQ4NObDidhA24k+c8C57t?=
 =?us-ascii?Q?kfKJuRmyJMk4CnjC+kI58joTVC3nFzSjG8RIxXe1KblNiRI6LjE0rrjPcZO+?=
 =?us-ascii?Q?luFSGe+pqBTyo4i731TuJqZpmcWjCUvruDSgTz4HT4N0plRUnjUOScZDznNR?=
 =?us-ascii?Q?9PtNxtNmD6MVXiHJDSuL+3VtbaLIohVcm9SkgiwZGAfuWWIpi9utps3z/2W1?=
 =?us-ascii?Q?W9IoawnIePsLYqP7VDIUdf2OnjP+Fm+IPqiV6sqTQbIEs481M1ZMtKNO0Efu?=
 =?us-ascii?Q?Zg2T7ZLBGiFIUTO3D3YqU9y8Z2U5o+9aOOEGw5ROEEFSNYNLiALu2oqHBwas?=
 =?us-ascii?Q?812ORPIR6Abi24xsRlsK3m0godg27LnIpMoQ++p3heNVVaWWwh2fBdfmMe1g?=
 =?us-ascii?Q?OZIbdeg1OhBCwOEKt6EKRuL8Hil+6gk2oa8CKMhNkB/iiVKjiexspvcZMfeU?=
 =?us-ascii?Q?nDbsBP60DSH3qItIT/HwEvZmB01FLsA7/NPLCy8FQtKnXxcDAt2wJlzgluET?=
 =?us-ascii?Q?Js+zfbgFg8MC/lAkRq5Ci6+gyZr5LPmmIhcdbHCYdkksCPXm/upmg8Zk2I2i?=
 =?us-ascii?Q?Yk3r0k/JNnbAclkj782YGP4gxC8kgcUea2pIEf0iyPLlutSaN08CWbMjkqMR?=
 =?us-ascii?Q?hQOQ1nDjvEZyCkzyosLGZsz+6tWmDDkOt8BfKvCqdsQy5Uc6ApbVPmvgPlYn?=
 =?us-ascii?Q?XvyNYmhztT5f8nOXcp0zWp1DBSD6zDUwNb6uE4ij8cTwLWFe407d3gTC/dLZ?=
 =?us-ascii?Q?PXMCOi7ZK+N4DkOcEFkTdKsHY0r2HH/Y/1oI/nMs1gTUAG93b8CyCfImNxxu?=
 =?us-ascii?Q?+LirC9p4dMRECYgRAgPc7EvsrxXvZoWuycmnxDm1OpK2GmemGL4IYataTH+8?=
 =?us-ascii?Q?aHXNukFEknS58d+Jt4kHFxtRDvoBpMo+FA3joNYd9y2iFnCZjc6VSKV2ZNdU?=
 =?us-ascii?Q?zF0wo6386bl9l5qWcHOoGdT+?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 16793a0a-dccc-4302-3cf1-08d98e0b1f0f
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0602MB3498.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 05:34:26.8371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9hbfDDIymRaANMuXZppC2gCJFpL69py5kvkz2ryvBdahXyq2W1c7wqAMijhML0HkeYtIlXU6mrShbu0EtmhKTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR06MB3980
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Oct 2021 05:34:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93269

The `avahi` dependency is needed only when network backend is used.
The current dependency configuration will add the `avahi` dependency
regardless if network backend is used or not.

Move the `avahi` dependency to be part of `PACKAGECONFIG` configuration
which will insert the dependency only when needed.

Signed-off-by: Nandor Han <nandor.han@vaisala.com>
---

Notes:
    Testing
    -------
    1. Verify that `libiio` recipe builds successfully with or
    without the network backend configured: PASS

 meta-oe/recipes-support/libiio/libiio_git.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libiio/libiio_git.bb b/meta-oe/recipes=
-support/libiio/libiio_git.bb
index 6ac534a28..488d4e3b0 100644
--- a/meta-oe/recipes-support/libiio/libiio_git.bb
+++ b/meta-oe/recipes-support/libiio/libiio_git.bb
@@ -18,7 +18,6 @@ DISTUTILS_SETUP_PATH ?=3D "${B}/bindings/python/"
=20
 DEPENDS =3D " \
     flex-native bison-native libaio \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
 "
=20
 inherit cmake python3native systemd setuptools3
@@ -31,8 +30,13 @@ EXTRA_OECMAKE =3D " \
=20
 PACKAGECONFIG ??=3D "usb_backend network_backend serial_backend"
=20
+NETWORK_BACKEND_DEPENDENCIES =3D "\
+    libxml2 \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi', '', d)} \
+"
+
 PACKAGECONFIG[usb_backend] =3D "-DWITH_USB_BACKEND=3DON,-DWITH_USB_BACKEND=
=3DOFF,libusb1 libxml2"
-PACKAGECONFIG[network_backend] =3D "-DWITH_NETWORK_BACKEND=3DON,-DWITH_NET=
WORK_BACKEND=3DOFF,libxml2"
+PACKAGECONFIG[network_backend] =3D "-DWITH_NETWORK_BACKEND=3DON,-DWITH_NET=
WORK_BACKEND=3DOFF, ${NETWORK_BACKEND_DEPENDENCIES}"
 PACKAGECONFIG[serial_backend] =3D "-DWITH_SERIAL_BACKEND=3DON,-DWITH_SERIA=
L_BACKEND=3Doff,libserialport libxml2"
 PACKAGECONFIG[libiio-python3] =3D "-DPYTHON_BINDINGS=3DON,-DPYTHON_BINDING=
S=3DOFF"
=20
--=20
2.26.3


