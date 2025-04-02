Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297A1C3601A
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 11:19:20 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.135])
 by mx.groups.io with SMTP id smtpd.web10.5576.1743592755519605668
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Apr 2025 04:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=OxspAaOF;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C57q9lnbdvDMbrx/xbGq6Q02hEMBMOL6DghWJUMge7Pk4X7UHT/HYhQepBxvjf4gYqO1aBYBdUuukKfcB/ICPzTgAIzrbMaC6FovGPRh6FvoO41bhF/UBmhP3akSxMf76vE4hMlB+FCZDEzMkajplfY32kT5QQHFB1rrCEjKfGjP2z4fPwQ5WIgNl32h2VmrKNKPQrJvMWvrtomyLiu2PYVVTGXZjri64bky25unuhI+d+CLQ1UugaCq4mFgzO+yIi3QoBR5rUcfrKI66EqCpq+1RY/blUt9zOYEwt9NzjtV0fNRGngT96tpH0+6MQVvPBWKhGfaH8xrLSNRvps9vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkpKEYwc5plrc553qkzT1gN5a1BQGeXt6XpHcCrL+Mw=;
 b=nk8aHorIW4R31D94lJnUdRdg1NNTwmgxu7roHldboG5/dvs95D8W4Sj1sR6yty56b5zqQ9zXFntD9qu4GXj1RAu5NVxFNiGe8t79Gp3M5IqQyJ+tduP3T4vuriltd3kU7lW7Fa3K+Pv10+4T4K1/xv4+Tyfp5WHjC2TYwUVPiWvgIEk6V47bf3EQBGC82SvDKVMD8iRvfgtItZ/XWvzSUpS5SUOv7pvU7PbKBPH6DSEjOE8KF4QpZGPZEJWpjNvy3vZCMXJuA0F9kyeBY03ZpILqq8+4vh3RMSYqvUoO+Fqt39s1h24Pt2TZxLAf6JX8c1cUVTvRmodalIodFtGiXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkpKEYwc5plrc553qkzT1gN5a1BQGeXt6XpHcCrL+Mw=;
 b=OxspAaOFo6/vtoQxrLu8/I7Iv7M+TeSfuuStTPGPU6m1g20mprHuQ6HzVDocMdr0Y68a9crPukMCxzewq8i5UwiyWeYbBHN89W0HFvQn8HlPfWxA696ExF7skVTjBfhXg6TA0jbs9oTiFKeRiiMv4QdPuhDFeRiScNkEl2UW2R07bnqkIr/44nRIw7ibsHOcLGmLfHq9CufWsrzdoBdni69MldkjbfcCWcSLRI3iWEHccsbZn1MZluP4Fr7E65GgAtfp8DsWgdxvR4jxOB5HT/Dp5Ob2wPGKqwzJFFDkf2mMqIOd3nkMIbVZsaaJN2720fEif7f5VvRZNpiY9tE1iQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by DB9PR06MB7610.eurprd06.prod.outlook.com (2603:10a6:10:251::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.51; Wed, 2 Apr
 2025 11:19:09 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:19:09 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 1/2] libgpiod: Support using alternative runtime D-Bus
Date: Wed,  2 Apr 2025 11:18:47 +0000
Message-ID: <20250402111848.3803825-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5dc::13) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|DB9PR06MB7610:EE_
X-MS-Office365-Filtering-Correlation-Id: a96c4947-b116-420b-7bf3-08dd71d83063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZO/m+sqBBZeXDxueK+lpP6qlQrZQi5e0EqrZQIgd5GqfCioJ5PhqPxMF79G3?=
 =?us-ascii?Q?/9CIfNxnGPtXQVxv7jaRMM+roapJkVACv4SRZee8IK6fMZN05H5W1yZon6y5?=
 =?us-ascii?Q?yxZDsXDSwe8gP/nH1cLxDFxoc3RhHKnFfJxRAU0qIbqX4xR68YttDchVR3z7?=
 =?us-ascii?Q?If+1QWlZnJtrvQmxS47AT+DotHfI8Yn8Olc66DoHrCKN6kCbQ1sH5jNHjpSa?=
 =?us-ascii?Q?DBodOH7p7W+I4ifbBNYjOvkNlvrt3K5oYDDtiMTNvdYSF0NgVRypG7keUjNo?=
 =?us-ascii?Q?5TWDh5TfyOT/5q3U0rx4MQP5nQga5F8cUzrISCEGZ5Rqrory2FcGT+3mA/75?=
 =?us-ascii?Q?kVJgvTh72OtBRitdBpQV+keE47M4lnpWGNsX1WLhqV2YPlf1weKDZ4cebr/V?=
 =?us-ascii?Q?n9XHGI0lCnEFEvdWDwFvTrTgm7B30qaAqXZUS6K8ENlhpUz+bgy8mjLIY+pJ?=
 =?us-ascii?Q?vxkr4gpoNp8Ko2dTjcLvdnficEqh0g08AvanOfZxt0EOnMM5gJ6utBD74NRd?=
 =?us-ascii?Q?dDh7e+bEzwu/EBIC1oExJ9a7zsDj8rETQ7GtzbB8ou4QY4PPnHxYUFpK3+3y?=
 =?us-ascii?Q?XUhTvjQMRouBytaIA+Bat7i0+3w19OZOgj1QQSUvzXdWXdDYGmLgBshINPEg?=
 =?us-ascii?Q?ZeGxS4sjVk2ss/4dvVjTV22cPHGf9lCmzt+mRDDSp6d20WuW6+sHDeijSJy0?=
 =?us-ascii?Q?hzg2+NYWH4vChtx887S4UYXWjuipk+vGJcg38xZuGJbhSy7PE+c1S3z+F1Dw?=
 =?us-ascii?Q?zRxwptZFF3tDV2HAAs0bl7yplVFNDhqiG/TPeydqQNzhMmkYVXOcilq30AO4?=
 =?us-ascii?Q?z6+HOFcQkpL+mLsXJLsjvGxObyQIJquNJY6lbEMaeXgrJydQHLvlrLnnrBRm?=
 =?us-ascii?Q?l/SPxwCFTOP0QZcP1j4RoIZchZA0+dyyUSPKAMDYoi8Q8SDl/CxblLW6GxfM?=
 =?us-ascii?Q?VLxaEWsOHubym4P4BIxq+NyZRyfDO4a930MGsyW6Zo83GmY/wRm+PMF8d5+2?=
 =?us-ascii?Q?EpPdnlqeLcM1rHyoq8yCe/pFeTeloFfbYHR+uY/05sx+x6l5N3KqUsIQshPw?=
 =?us-ascii?Q?sjuHjtr5vOYPobmvdngaNj5f+NJmmFIh0vDrIqH7iiWOHnN8c5Asj+IxUQn5?=
 =?us-ascii?Q?IbN57HWOQoYMKzjN9kBwBuk6t9jJDW3e3hi4GCaIjbk51yLC3mi1bOH423A8?=
 =?us-ascii?Q?EgKUSJmfFOnVoPuO87V+ClyUijFckbNDYJz9GAMsu5iZnQJ5tcw/oedY6iBR?=
 =?us-ascii?Q?4PA9X9zbz2umwmMT8F4YY6r7c7pba0Jqs0kENJqMKdap7SWvA2SXjUHeI36K?=
 =?us-ascii?Q?Mrf/NG+GUcXYktO9VeKHUzgc+1eYJElUUnPq8nOzgo8y4Q8Ht2/BWmq/cLyQ?=
 =?us-ascii?Q?HvF1GE/GACYKUol2FyKA4p0JMBZcozcSCqMQ8TBb/tpbUqIIiBjRjzH/y60p?=
 =?us-ascii?Q?QcHTsY6H77AewOZqYcpRdpZuIc3Q1SlHEr6YpfOSF8HWsFBf0xSurA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GqSizDE+/AqvpOtOHEDNpjgr6BEhkXAh+xIkzRTkfEeS6RhBJN1w7wVJl4zM?=
 =?us-ascii?Q?AGnkGmT34y7I5rdkZW8GeLSxmzrA2yB3nxzX01yPb0wsHzC17qY3ZJVPqhEM?=
 =?us-ascii?Q?pak1+TsQhGRy8urGXXju1wQ2AdkKoYuCXA2BiARWIbvu9y/UAv1ruLeQtCHR?=
 =?us-ascii?Q?cPbrcR5Kwm/hjzJZ1/AiQYlbpPKgpHtvTX5j9bqBWqDpwUxdSAfmBVRhUdSu?=
 =?us-ascii?Q?Y+/PIow+Bt6h+w3BdWFCbQhhOvKq2qp9B3wyXkq8ZuPQFnflXrQNl86Kwobc?=
 =?us-ascii?Q?b7dCXr2Z0eOuXeKckR03UWjy/vL76ZcV5lzWgqGnBM7Xl4QfxdDDZVIvYCoL?=
 =?us-ascii?Q?BRbHrfDeX1zl8J6IEMrJtqIDcptLSpKRj9Tf4WBxb3CzUXiXw6g2yfRWKAKU?=
 =?us-ascii?Q?oPoSkUI7BW5Ps+RVo9Qtt7VZqyPubQEgFSnn2r3PD6Iq3ePRlM2UqJY3mdkm?=
 =?us-ascii?Q?P1h8VRGeHEPM/JuPsR2uJOw1w+6ZJCQxe4d236Vnj6fm5zWJMZtKYtomTrfG?=
 =?us-ascii?Q?ypAkmpiYn3oKluHFe0JVfCvuQ5COzStHGcIu7ONNGJkzobPr+G69MBKLQ7Au?=
 =?us-ascii?Q?fbAqvcwmkc1jE8DBsi/96uOEAPT5uOsZwER/WpWPlRTtjvIHxx+XBKlhJEH2?=
 =?us-ascii?Q?7vvZYkGGvI/lVD/UvPchdX/2XTdQBJLrfn/7TP338IbCku3eC7bExJxZrpC3?=
 =?us-ascii?Q?uigeqakpBWIXwP+96STyW8evEJY0czOaBq/YOHCqg6TrXp2t7MU/nMbmdJDH?=
 =?us-ascii?Q?aZThF5VbVpgCyumI//u28h+frZuIgGVFr+NxkWUDvrtXTvDCM7M9/sa/1CUJ?=
 =?us-ascii?Q?xsdOU/l/fLBqb3sjRq2eG3/HkWp8IROycK3iJV8N5yDQryMGjPD5n8+ePsB0?=
 =?us-ascii?Q?vQCP00x5DqOyDyAeHV4zMzhMrt/5YkWh1wl1z+cnV3PacY527jf9muclz9uD?=
 =?us-ascii?Q?NB13QlUm5snOyzXvLvftNb0wXfzA4HWMV6kpu04g+w1xO/TiWtbK4CFXRJDV?=
 =?us-ascii?Q?S23mx5VYSrQcIjmQ3R14BgeeS9f7j6SASGUDRMt/LqXn2E9Ttvbzt5O4/I1t?=
 =?us-ascii?Q?ZSztV7yCPAxb2q2evezazKXUEqWKoIJvPy4O5W/AEdI7cXj3rUPyVQXr+um1?=
 =?us-ascii?Q?7qgRe2pSP4K4PebD+grXZvYa6SrYADla0mU42fF6mNU40qIFepFL+HkkciRh?=
 =?us-ascii?Q?/uOyIr9PvBqDx1MHiSfHxs3AaksbUO5ntlm0I+D99hhIhtRcXOTH8lwUGMPW?=
 =?us-ascii?Q?jrg8e2DYv7+7bbl1P81EBjjqBxijYq8dMMbIZl3qRk6KvPm7JQtOn/epmOGZ?=
 =?us-ascii?Q?wGg1gbJItRQF9jEqCluRhYkvj8fKOwhbmrLQ432sfxjnF9qGXSBQC2CoaYLh?=
 =?us-ascii?Q?eQP/viB2jHz/fi68AdagCfZ7kZq6C26JwHvNEPZ/VMvF19ZjyAdNxOnOINPi?=
 =?us-ascii?Q?CjPmPA1kxl9EINWQS2icV+Sq1fK+WtB5tmVYxXmzHGq93rBEsh5UklMMhBid?=
 =?us-ascii?Q?IqgPNIJvm60dQslNH0RSIFRazuBIoIXl47ECZyeNsZSP+bPWZJpeNR9ea6WL?=
 =?us-ascii?Q?9vBi/E0KRvL4FtdzTa03HDvvbrUyoiQ0rpLoaIpLOdDIdZ2ErbhPplMSCu+v?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a96c4947-b116-420b-7bf3-08dd71d83063
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 11:19:09.7690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wl/Ued7tZLifmG3MlaVBFkrlOh7Zxx1eXtJ+5tgt74Nx2yB4y2/wD+KHkoALWacDshpdgogRraFzOMJUJ08sTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB7610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 11:19:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116520

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


