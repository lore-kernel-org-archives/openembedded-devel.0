Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F34C5C369A4
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 08:18:41 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.122])
 by mx.groups.io with SMTP id smtpd.web10.6510.1743754714572896958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Apr 2025 01:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=Et01/fea;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.130.122, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Doh3Iuhjmwoo6cVl9SbWTFVcSLs1otmKZtJADaq2pL0Uofx4iVCVwBjjgTXuBKzBWtUF/LWCYuEBcGNvNRYfIao668meUqep3g1dz+AuXcpvMOCc+Yw4xa1adEUDoQzuA77W7vG6fx6RpW0oq7G4D2w2aXAJtKql6E7c8c0BhdnSCxKhh2eY3c/AvEGtD0BT2EVeGvA2UIfu4cDLnZSaY0BKhy7x8w1rqfTC+PXFGcStIuK1/k5rTGZqPurzi3nmQd6nkcGvQRzGfQPNJHSoNlU07Pyc2YE6Hn2nEsSSmdOxNQ6vCKrElWbeERKzDnyrjKwLVi1B+Gb0s5IwTyPAPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkpKEYwc5plrc553qkzT1gN5a1BQGeXt6XpHcCrL+Mw=;
 b=AuIbPppYMBcKOKEMwALvU/IuzKl52HYuHa4ZIXDnk5noyYvuNzu8b2jAxZZ1p5U9uWlDeP3Em2yNty/A6Sf+tDxHb8b/942xrANz88/+UKyHIxOEhrlUtXE1mCQdNhsqwtddRpaQpmjt45kOisG3s53A9sRRtunvPrPKMgt+sG4R0aqgis5Y8rGfTIeXqC+hvLEq+tKU3+X+GcDIa2LVvcuDKjjq+gOIHlOFm6dc4cBCcX4VlbrvBOxcSQflACg31fYkDj8jLkWpqvEFwz2YyNcTrcNbVPCRqwuTz1LRQ7BUST+qxUqKCP3wqDnsxALFHXGqZHYrcEufUyLJ4HOT6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkpKEYwc5plrc553qkzT1gN5a1BQGeXt6XpHcCrL+Mw=;
 b=Et01/feaY3FN9BYQp1EynBmDBNTYq4dkBLsBy0vtWGmmzKvpZ047ZaY6vR4VTGpUZTEPOrvJFiFcn5Fl6NccRg0a+rafJdRfAhOTSXBn5u0FYFUhCWwaQD0WUn7HHzfvjPkJHQiHX1xTS7wDOrTPE23dxVz6lyUnuFrMQ8zAWLHoGPwLsSprgFXz/Jr/6AZAPIc2CUlsndZabl+54+2Xpqsy64WK5EtpNhdf84GT2rDjVcMOh1MF8FEtr9PENzZeZTKEtkwvDq+t3rR5LoEay7L77wTRO+WRCv8FEK/cieMQ4tG/FpR9z4ycP/m5vyfDOh6QMdBD2OddLV6kXf1QZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PAXPR06MB7471.eurprd06.prod.outlook.com (2603:10a6:102:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 08:18:32 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%3]) with mapi id 15.20.8534.048; Fri, 4 Apr 2025
 08:18:32 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH v2 6/9] libgpiod: Support using alternative runtime D-Bus
Date: Fri,  4 Apr 2025 08:18:02 +0000
Message-ID: <20250404081805.663425-6-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250404081805.663425-1-niko.mauno@vaisala.com>
References: <20250404081805.663425-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PAXPR06MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9a8585-5e3d-4f7a-699f-08dd73514988
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?T0HLdBKM6Qwxn77ALYlJtMRzKk8iSvCWgXAL+QidmVQCsuIifNEilKEYv/SE?=
 =?us-ascii?Q?ioWDbIxkjKQnWXgt8MQclDsC6RzUYEz7Y/z+Rpi+KmhLdHBUI1kJherbMtTk?=
 =?us-ascii?Q?aHxos/9zPsdTP4z+CH7OeTTnfYccv+0o4ToyhXgoGnS5hI4K++MdpdfDk4nK?=
 =?us-ascii?Q?MSn6qatlMOP0FOXiULLyeMEyts1s8XLudMIrwDKl7oWxs1NxEjnPJ19ksuQS?=
 =?us-ascii?Q?y2l+cSmwuIJFPv9HIKmgm847GYL8VFeFjOG48ov9jPX3WZSQgCzXjDROZhP1?=
 =?us-ascii?Q?y3Oponmo+haiYhbxbGihrcx4B0ljv9f6gkHhNX2xEYVj3BXDFLzi4oOkcS22?=
 =?us-ascii?Q?1gc/9QJN3ySkRlomhcbVblsDrGpwVdFcM9u3EIEJ0ZGY/puSk4s0Grk+oeRD?=
 =?us-ascii?Q?GCrokO2eWFv4zATqIUM6RwiOKr39SH6NdOSG2CtnbW0jiaKcBd1E/9fLEPZU?=
 =?us-ascii?Q?sj1FmX2cEXkYt5l4PW2Gj6JZjTZEH8WTILjCmWmRGV/D0fePm1Ag+cCtSlBF?=
 =?us-ascii?Q?aPoM5TNuRQMwLCrG8NiIXZYKKTvmILWdPwWj8mXMl/fCJu1ICcTgYIGUJWj3?=
 =?us-ascii?Q?wrLkvpiC65DiCSuRHjDcdSTdjSYLVzOVYlqPV9cHK7LfvKoe0muM5DRpFFq3?=
 =?us-ascii?Q?ktIpZH5ilA9euXy3iAF/FybU0HFkCRIk6gI1/y7eNVbBVwpO5almvibnqdAY?=
 =?us-ascii?Q?sWmXdd0viid5pd4X5zYS/dQ44BiAjePDPg7jCao2uq5E87ZxbkXsRt/KThJy?=
 =?us-ascii?Q?7Fy6jHt05kmPZs5ZfBdNYCEW7hu7fAJe+ZYQFsNeOeu6Jy1iozwygKXGshp7?=
 =?us-ascii?Q?1XkkqJLsh8Yp5llYOt/bDOoekw6pEwKcgqcN//dhky5KnmqL3Dl5N4MLP6an?=
 =?us-ascii?Q?XZUQPUeQF1uqKdmu8bPPrtq8LgTX5TITVGg3fQyHUsASckJHEaEY4j2rQJo5?=
 =?us-ascii?Q?LArW4nb3gRZX+RUhcw0N7lbJXTPnITKQFtYae0QMKZzrq6PUTDHEFIFj118W?=
 =?us-ascii?Q?UxZ04d2YpuL0LD1Y4gT+6OSfoIBRFV0wtsnTFyDKR+bxKw3Sqk0XAiEZi9sH?=
 =?us-ascii?Q?lGzcBj1TAiWVhIdKluMGxXL0/G2TksQjyKBmxTCFgmBfUkr8lPpowRjJrfvM?=
 =?us-ascii?Q?t+R0X2dMDdviEtzzWT1ihbmC5obvizAqVIXkpZWnpukyrWAPzpuSi+1BOVUu?=
 =?us-ascii?Q?gSYOsbvLoYxawDckl1dwMmNjP7Fedv72u2yj7SgodUdxUwub54W0sPsjvn/Q?=
 =?us-ascii?Q?QB3+2ACF/vmIzOK6ZYAH50vMWqfqgP1xKaFyGEcFw0chrueE2OVFSNi6nxeL?=
 =?us-ascii?Q?thZeFbQQ53TMczdzQMxLXuYUL2lEuP7J/izzOsnIkINcKmwtK0JtpbN5o4eO?=
 =?us-ascii?Q?3Mz0ULnio23JEYZg3kCZdTEJW6AF/Q9ovOzbc2rVdBJfZyfai0Zk2mSyj2vz?=
 =?us-ascii?Q?V06YGR03wSEUqBcJArJz8NlJmbOtfLHLXEOnM5gGwTGTKGaWBoSOPA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4a8IEgRCx8qR12bIa8RBhztmOoOhr87TZB6PEuaB+GZsHkqWo0oD8cEBVyfx?=
 =?us-ascii?Q?PB+bkEFVhAKevj+jjV8EzQfzeWGjl2G+TRaUKHjIR9Ltcy4/dJVjL06Fb8xM?=
 =?us-ascii?Q?mCocE1mzF63LKrwCJFT5uN402iCljyZWO5hMQw8o+F84jTpBrhsQ2Uf+vsiP?=
 =?us-ascii?Q?sQcBMEujwYKHhaI1bv73SHF6CSw5RUwXQb11AxgoiTY2BL368vQCWavc2qNd?=
 =?us-ascii?Q?rikyeXLjqri7thNhMmO5hFCO7STBe/uUBRehz3FW2nx69qAGRfQsBbKO3QJ1?=
 =?us-ascii?Q?F0dKHPWzsVoDX2sPY+jX/AcWi+v9zhlO0uCN2k2evynNmnTlXcA3EVEfiR7w?=
 =?us-ascii?Q?gzLC6xL91fy8IP+h830RjA9AUzIbnokHrUReYMfBd1utymXu1blnYzxP7Km1?=
 =?us-ascii?Q?nU01V3OREjaSAR4riZyYWhzPMWDJP6b3is0UgiB6Y0460CG81ELK3YZkbtpI?=
 =?us-ascii?Q?3yWol+EXGp0raQglC7Off+hTQ9I9yYYntdw1DpVy7/6WJWQ1ILAzeA7YIhWQ?=
 =?us-ascii?Q?jghpQqloEpgcoEWfqObOHjuTqSyWvQka5if1Hac4Ef1BilO+26WQZQ/ODDmc?=
 =?us-ascii?Q?TpsjAf+gWv5yIJpb1iWR+cCMmpmVVR7lm3WuYx9/8E8XcBbNnHhX56SWJ3E2?=
 =?us-ascii?Q?+4lx0s28e9VotQD8s8pCAGZcmManrrUoFPkP9Uw36N99ODiBJOrUX8qINAaU?=
 =?us-ascii?Q?DLOCtIWq9PQkpF62c1SoqGTxIFNy02RRSTQUo1bZXQqeniYGAsYNE1Rk5BcI?=
 =?us-ascii?Q?2ASn+PIR/8wJSAy4am1QPWPj6dEDECOu1Y82/k3drcjiCR2v+80VqTSWGJ+X?=
 =?us-ascii?Q?RRJvz9bgoi+alfjEz5ug/meNzzvzPew6GbGwx5XeVNAG1xKp0Pez8ZWdvDdc?=
 =?us-ascii?Q?lPb6iNq9M6CwckyUeaA+8ACC16XyopFXAz7FKVxSoui5WhdKxdnLZ8vGL/o5?=
 =?us-ascii?Q?LFgOBDg6f1kWdh9cKvmPow2CxeaW0sZUarIaJY1jn0NLPj0ISi40FAhpP6Sx?=
 =?us-ascii?Q?yyjdQx9PwZ589JKQnqtrY00LptQZwqJppZ2uYPcNDc1YyTZGZLMHOQ1+m9vI?=
 =?us-ascii?Q?zQz8kMVyczFaGU9v1rRsbUcdJX+RcHOQzqlSOumlfzpOz5uLbvMuN+KTn2ux?=
 =?us-ascii?Q?Ix8ukzFgBlkMr5mvGnn7WN5MGm4bPEhoJEd/Fr+/A6quXvwvXIm76xu8Kf/e?=
 =?us-ascii?Q?IjX4sjVGSTgeEBY8eTztqptKLxGbBrBlvmpvnsZrH1UcKPppqIz0hk/O1AoI?=
 =?us-ascii?Q?nyybDNnPA3KgxxbxKkpfZG9AW9GWGJrCJUJyt9HJOLPLTyzJGXLJP+8d0S2i?=
 =?us-ascii?Q?lzu74TLSQgHNYeLE/52Pe5txjgJOQ85wAclW340dTrWU0BNsCS5SEtapLQeU?=
 =?us-ascii?Q?DVy/5USbiaJbKWrl86oujYE3SnX0ufzKJrIFCcqAznGv0sxaZDd0aWeXbMn6?=
 =?us-ascii?Q?sMdZcB+eDNU+mRxFXpFiKs+3mx6DGtKEp0iChXUHxyJErGWqHCLhIh0JNcKA?=
 =?us-ascii?Q?jo/C60Zkm6n6fg1M3TTl4vmQyKXbs4rZqLr2V6MjhaKevQw0IPc5ugnLbUc4?=
 =?us-ascii?Q?Lt9zC4JyTGalmW0e0PBs3F2Eek66yK4aUI1Wjxf9rNOVXQ11PwFdiKTPb/17?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9a8585-5e3d-4f7a-699f-08dd73514988
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 08:18:32.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WnIFIGdVfRZlfU3cU3h5SDC58Ad6L1fX1oR2hXWUwiRaurt9+8DRisaOf57mibuJabxjZUyIOjgMrx/Fdi2gGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7471
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Apr 2025 08:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116566

In order to facilitate using e.g. dbus-broker as runtime D-Bus
implementation, change the Freedesktop.org specific D-Bus runtime
dependency declarations to honor oe-core's new VIRTUAL-RUNTIME_dbus
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb b/meta-oe/r=
ecipes-support/libgpiod/libgpiod_2.2.1.bb
index b72d960c10..93c3e3b92d 100644
--- a/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
+++ b/meta-oe/recipes-support/libgpiod/libgpiod_2.2.1.bb
@@ -20,11 +20,11 @@ PACKAGECONFIG[tests] =3D " \
     --enable-tests --enable-tools --enable-bindings-cxx --enable-bindings-=
glib --enable-gpioset-interactive --enable-dbus, \
     --disable-tests, \
     kmod util-linux glib-2.0 catch2 libedit glib-2.0-native libgudev, \
-    bash dbus glib-2.0-utils libgpiod-manager-cfg shunit2 \
+    bash ${VIRTUAL-RUNTIME_dbus} glib-2.0-utils libgpiod-manager-cfg shuni=
t2 \
 "
 PACKAGECONFIG[gpioset-interactive] =3D "--enable-gpioset-interactive,--dis=
able-gpioset-interactive,libedit"
 PACKAGECONFIG[glib] =3D "--enable-bindings-glib,--disable-bindings-glib,gl=
ib-2.0 glib-2.0-native"
-PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-na=
tive libgudev,dbus"
+PACKAGECONFIG[dbus] =3D "--enable-dbus,--disable-dbus,glib-2.0 glib-2.0-na=
tive libgudev,${VIRTUAL-RUNTIME_dbus}"
=20
 PACKAGES =3D+ "${PN}-gpiosim ${PN}-glib ${PN}-manager ${PN}-manager-cfg ${=
PN}-cli"
 FILES:${PN}-tools +=3D "${bindir}/gpionotify"
@@ -43,7 +43,7 @@ FILES:${PN}-manager-cfg +=3D " \
 "
 FILES:${PN}-cli +=3D "${bindir}/gpiocli"
=20
-RDEPENDS:${PN}-manager +=3D "dbus ${PN}-manager-cfg"
+RDEPENDS:${PN}-manager +=3D "${VIRTUAL-RUNTIME_dbus} ${PN}-manager-cfg"
 RDEPENDS:${PN}-cli +=3D "${PN}-manager"
=20
 SYSTEMD_PACKAGES =3D "${PN}-manager"
--=20
2.39.5


