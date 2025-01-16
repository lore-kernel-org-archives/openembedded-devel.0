Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BB4EC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 09:50:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.132])
 by mx.groups.io with SMTP id smtpd.web10.44723.1737021038741668792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 01:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Ta6F9M+i;
 spf=pass (domain: navimatix.de, ip: 40.107.22.132, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fiO4cg0GR/O+vTALic6h+qph7JX3Ojp6WuuQru9p/Ad1+TzfQEyPMBpJirUlHC8oaM1ie0YjozRIwXVbJuPZ7ZxbzVuU6yABBWUdUL3J5nJaYQKkFxqTpGjXm7Ovdu3DgZSJVa+IGr67I1loZhoq6XsHH8sxNYiZZhLKTvd8Ssjhxj050URCYc1anlMvSBuk9oA48718xuaMIEkeRV6TgPlRXteh/cgzJ+kHoztPEzf2tGKK2KKlHyRhpe05uIcjafFxge5FT2NRHmeUA0Ywarv+CAGzHIzvmfxUjVFzjuH8NgtTVpwUYWRhAU1FZXrPzZpijsFUk9MfnsaMLtHrlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgtnBk8i3IQsuVKD01HaulohcrvylIMxWt5atF4wQtI=;
 b=GUPM9zMaYY0IPsibgtfTrJg2jrP6En58aXVmnR9BzHwSU+R640iT2z1RptHsNqLLFNwfhxaU+M6P8yrJZZVxD07mhZXqpQs43LFaQR0bxRXafFjKXc7uyZee0x+QRBE012J9f62xQVAMS9CUqCPeFysn9E5XgGtuIOyyDPbxDHO93/P2XIeKgQINHDcwbUIfgv4Togvisb0tiO9RkjaYztWQ9071ZIeEMoWuOSeJlpkZ9SL97MmaAVM/PDI0+71cchNxEojzwAcArcgt6n/MQQcDAR5XVU5tCiDpBDIHC8bt2uqSfLarwpspS1ZA6WUNsxcLmMW+z1TbPGrofrVpRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgtnBk8i3IQsuVKD01HaulohcrvylIMxWt5atF4wQtI=;
 b=Ta6F9M+iYuCYZ/NFj7+/7YwyRO+17AGR6mEeh3z+L3TVbBXvuaaV9URawfC/rluRXogsLuvKzvJdbkAITUM4BPX08n8NuUK4PPoq9N8x326qiIQnn25hl2U0tTxgfILQjLcoi4PFIwjvEPqjfc6dQjvPsnXA/n8iV7/WuqKB6tw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AM9PR01MB8182.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:415::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Thu, 16 Jan
 2025 09:50:35 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 09:50:35 +0000
Date: Thu, 16 Jan 2025 10:50:33 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
CC: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Message-ID: <qrmcdaufwt4l4rhfn72tymtzkj7ffszxwfegedgiuwfebq7735@v4gq5t4gz2vy>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
 <r3pwhezfvqmgh43ejzkjroffsmdoupemdh3q4v6hplgk3zregq@tni3w2fjzwaf>
 <TYWPR01MB11861B18EC4AD9079FF4602B0DC192@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <p675m3ebzd6qsu6x4kcbbowcg5ejb6bi3mlwjvlehxffklqvbo@muqhgasjljh6>
 <TYWPR01MB118617DA97D501BE821574B74DC1A2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TYWPR01MB118617DA97D501BE821574B74DC1A2@TYWPR01MB11861.jpnprd01.prod.outlook.com>
X-ClientProxiedBy: BE1P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::10) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AM9PR01MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: fe57941f-f950-4daa-1507-08dd36133980
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?o9Pnce+j8FkRbwkQJs5TUeackH2jyge4nH/8EJ0Z/9Ke8tMGGu5Mp4WdITyA?=
 =?us-ascii?Q?sbyp8Z0GKubFyE+aj0sR+stNfsMayeOTG5zLUyCiG+D449eDcfH9ut79+WoS?=
 =?us-ascii?Q?5rOGDNqlw22hMV73mwc1BFErHh6Nq49abiziEDQfZEb4yU/5rxm7aqpCArIb?=
 =?us-ascii?Q?IYy5gh27Rd7K2kjjdKRmWuGVFlpbuyeOYDJGR4VKiVXnywE8bfGeIAHUJllU?=
 =?us-ascii?Q?1BbYqJRQDsvLs9K9igmXlVLG2yYdrvWyb0Xog+xFq1Fa/48lizdH44m5O0uu?=
 =?us-ascii?Q?iEmgG30H2ir6C/oxuPiTfihxQ/Jrg5awuH4Pv7NteElQVTvU08PPRaQ5N8im?=
 =?us-ascii?Q?yaoAc8q88nmidOtlDM0Zv2rzCOOHohtRX2YDXlClZcqrfIHnzqX3/6O80BUX?=
 =?us-ascii?Q?vkg0pQYhzi3EoITq1bFzp2OB6A98esNsy0BL719dgno/M1cT+iRfeTsQM/7J?=
 =?us-ascii?Q?vNbMMu83Gw/Z59QRVsIruzA8oKJTrR2HRLsH89tbFPr5EppVIfGyn5nItjvV?=
 =?us-ascii?Q?5JFrOTUYQ0CQjXRDo895crTR1EaiSw1VlvkW9dH9aA7t0xrvS7wz4Xl9Fwmk?=
 =?us-ascii?Q?UkcSmr0qMmPs6LcD0Znzu0GgIAfFL5sc5z+xRqP2UbfgxLo0XmhFHW7WVQ/7?=
 =?us-ascii?Q?/NJPklMBU2TThjngBCTptAYQiCEpt6tj1+XW2mENoKlgDZPqMQfoN2fiTOAK?=
 =?us-ascii?Q?7CkmfvVsn2RfWLW5282eVds/pVr3kh9FDdQu39lzi+ZD/FGd2bU0+LqbFzEj?=
 =?us-ascii?Q?DIbpgtu9QrnYkIWXhVOkIm/O6ZbHpjvq3pGoLRTwUAFKNbKmfb1iVkUwBh60?=
 =?us-ascii?Q?AOhGTmThVFnl+CPSkaRvlXHejoQ1wNENFMpE1PS/K0ke9tcT5F3kFkRRD+R/?=
 =?us-ascii?Q?x+JFNBXcubHsKh4BVvce4adz8EEXE9noC1CWLEq++p6772tKeN6AZ4p8iVnd?=
 =?us-ascii?Q?Kc6vGtiku+wNq+SwJ5fhRifz2oLWntH7o/zR/TRhY6Oz8J1el8IsZwAWi2Lf?=
 =?us-ascii?Q?jMfKMKO8BaPPUm5GMjzobgG5NWAvs1c/vrr2BzN7jC3qIAxmiCCdIOL8KNhM?=
 =?us-ascii?Q?RID7GVtIp513BYIVrh4Uzpf6OHBQTlVhdXmreHlGJGeVX7yUnr3z/pGrkNOA?=
 =?us-ascii?Q?pOQS94GsFe3s2ehmqn4DVlayDCxV1b8gqndc4cUoLCxENj8s7j6vu/nFLB1T?=
 =?us-ascii?Q?7jKpB1kh2kE/eE3K5wnot8a2wMji1/B1csL0NMSJkNNVuIkcBnBFAjVqYjcF?=
 =?us-ascii?Q?topMTkFxJrw89uGlB09Ux7Q5Gd3HHZrWae8GcsBB3dVeuLUPSQ2xu67Fo4ea?=
 =?us-ascii?Q?pLicA/6s7aMU3iVhMW6v9DmU?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3TUfamFWHCHBaIfQajVvGCLhVByj+QXYelOu0qunxv+NxaopmIMj7MzswfoW?=
 =?us-ascii?Q?aJzxss492Mmqpo/3lqOUUSd9Djk9lqfe2fKq0+NiX2q0Xct9xjYvmUeZqLKH?=
 =?us-ascii?Q?J9NrdsqhQSIJT3OMJbQeOOYy3R3J3tDOj7Ke4p9Uag+pJa/7taPXMclMIQ52?=
 =?us-ascii?Q?BQS2vmmbe/bWkaSYlO61BcLb3ftRKeXw3pb9WFHgcELy5aFPZV58LRkrd31W?=
 =?us-ascii?Q?nkekEv35BzZTqH6R37gnq+fJ/TxyzzbxzDaoGYJVIrITW62fQz6F3fkI99hE?=
 =?us-ascii?Q?MaFGYrhNKyisi68IGlUgBsX6tDr8w+fNUIP/LQ24sjqDFj6gEXnD2ztYGFA4?=
 =?us-ascii?Q?HF4JCOIcCOyto+GoKBtsJPA+Os6YuZVPd0bgqWOnej2qj0BaEE1A6HSQM9pQ?=
 =?us-ascii?Q?3L+sowU6sr4xMTH+xo5La1OAbGd9S6p3XVbKHui6aD1F3c7sQQpQKjcCAnNd?=
 =?us-ascii?Q?8ixcI9a3yPHaT39gjeSqiOoqUhZfordXmfhWw62tqRtrLTCfuZzL+h65YvNs?=
 =?us-ascii?Q?dD4SWed3KJ9AXfQJd0HT9Ogtlak3tSZHu9Z5cVMPp7BfHKyu4CEhVA1bTDcU?=
 =?us-ascii?Q?C/YI0Z9XGCB+RqygI+JQNG8YbUZZbJQZV6y9sTKP/issuCVSxveKCaGsxIfF?=
 =?us-ascii?Q?716Qidk2trSDnaPlN2pt9FpiawiVga/dMUtYpt+0y5bK4jicl+kMyae5LPoy?=
 =?us-ascii?Q?u4WqmCrFrybP07PJTtHbei0hhZydum+hUxA7MS2pE3QuThfk5jLrXFNxUB3a?=
 =?us-ascii?Q?EOolf89tVH5tUIp7JPNKirAaUQFirAZEyP9n7ityvz5GYACztVt2NXcL5LBo?=
 =?us-ascii?Q?WDdkD4vJrfYOHTFEjAv3kLKorM9XA8VNyAhfPJH2/Y+UUxlmn5RoY8zVecKI?=
 =?us-ascii?Q?Ws4D8R3HUW8fHblUuWGP5zAeJqgDcnrBptdSXd7rTUb4QF7lGPijQZyMCNmZ?=
 =?us-ascii?Q?pzEbeLJYlVAtVfh7sxpCiZ7QMHIA9OXNuKp1XDNrKRxuPfJcETU4cwIZ9ppy?=
 =?us-ascii?Q?KT5weyfEY6Exyo7RojMWwRcMvRVoI4DNp2mcDHhYfGBi6m4B2h+IDwJfFVyD?=
 =?us-ascii?Q?X5Z5v+zBUXg49OD3WTrsotCA/iT0VzNGCG02HzTjHSYxPNl0UpbA9f5KnJ3u?=
 =?us-ascii?Q?qEmqxslRVGw/hLp+xVOYncM7WVTk5x+IEVsQf6xzf85fn+K/N9Gr7WYTOmzC?=
 =?us-ascii?Q?voaCofiiW9htqgHfnUaCu2Krewujl/Zx2vXPqKRlSamK2iCJmFet4CV4AJ3o?=
 =?us-ascii?Q?InqtOxSi4Reyih4a+aB4KpysyHGEBSADyp9PwXIZ/yrrNife+kPoiTCAuvfh?=
 =?us-ascii?Q?Ov+DcPlOZsCOxKOHPzXLWoJjJjjO2Z9w7KVItvTpMRH5EY65ryDSCc50Uk1+?=
 =?us-ascii?Q?fcySMYtRXYGCHLqEmKrlnxwptDtmwDnaZqzPoGWMlN2oF/JW2Xumqa9V1r8o?=
 =?us-ascii?Q?HKCJJDfSbABPtwJcpolEiCCm9mqkMlkxTzs5nwLwfSzncCNPk1cfurzJKrrk?=
 =?us-ascii?Q?EgS7AR+Vx4aV6Jq/e+5K0DJIzPxVsX2chtqkGSRcAC65sAD+ifMEIX1rupG4?=
 =?us-ascii?Q?Bp23jCY4UkQakZ30QqDLKEDm8Az8zbEkCCBBRyeWmXIsf3VCuCaluUR7TOz8?=
 =?us-ascii?Q?Wg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: fe57941f-f950-4daa-1507-08dd36133980
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 09:50:35.5035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M59VA7T+ZC3png7ARlOiQmhYipJ08ha0oxGok6VwVH5AaKYgDfj6Boro/qinRkLSZCJmZIqSIkvbnsIosZNCsd67orEi2/fRnNgxnjGE94g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR01MB8182
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 09:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114908

Mingyu Wang (Fujitsu) schrieb am Do 16. Jan, 00:39 (+0000):
> Adding php-native to DEPENDS also doesn't work, it will report the same e=
rror.

Yes. The problem is a (somewhat) broken make clean that removes files they
can't be rebuild without composer. But composer in meta-parallel-php and no=
t
in meta-oe. So, I think the best is to mark clean as broken to prevent that
do_configure runs it.

Here is a patch to make all working:

diff --git meta-oe/recipes-support/smarty/smarty_5.4.2.bb meta-oe/recipes-s=
upport/smarty/smarty_5.4.2.bb
index 906b9e4ee2..25eda52690 100644
--- meta-oe/recipes-support/smarty/smarty_5.4.2.bb
+++ meta-oe/recipes-support/smarty/smarty_5.4.2.bb
@@ -1,21 +1,29 @@
-DESCRIPTION =3D "the compiling PHP template engine"
-SECTION =3D "console/network"
+SUMMARY =3D "Template engine for PHP"
+DESCRIPTION =3D "\
+    Smarty facilitates the separation of presentation (HTML/CSS) from \
+    application logic. This implies that PHP code is application logic, an=
d is \
+    separated from the presentation. \
+"
 HOMEPAGE =3D "https://www.smarty.net/"
+BUGTRACKER =3D "https://github.com/smarty-php/smarty/issues"
=20
 LICENSE =3D "GPL-3.0-only"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2c0f216b2120ffc367e20f2b56df51b=
3"
=20
-DEPENDS +=3D "php"
-
 SRC_URI =3D "git://github.com/smarty-php/smarty.git;protocol=3Dhttps;branc=
h=3Dmaster"
-
-S =3D "${WORKDIR}/git"
-
 SRCREV =3D "642a97adcc2bf6c1b2458d6afeeb36ae001c1c2f"
=20
-do_compile() {
-	:
-}
+S =3D "${UNPACKDIR}/git"
+
+INHIBIT_DEFAULT_DEPS =3D "1"
+
+inherit allarch
+
+# `make clean` removes files, they can't be rebuild with `make all`
+CLEANBROKEN =3D "1"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
=20
 do_install() {
         install -d ${D}${datadir}/php/smarty3/libs/
@@ -24,6 +32,8 @@ do_install() {
         install -d ${D}${datadir}/php/smarty3/src/
         cp -rf ${S}/src/* ${D}${datadir}/php/smarty3/src/
 }
-FILES:${PN} =3D "${datadir}/php/smarty3/"
+FILES:${PN} +=3D "${datadir}/php/smarty3/"
+
+RDEPENDS:${PN} =3D "php"
=20
 CVE_STATUS[CVE-2020-10375] =3D "cpe-incorrect: The recipe used in the meta=
-openembedded is a different smarty package compared to the one which has t=
he CVE issue."

I'm unsure about the archall, but it's PHP.

Regards, J=F6rg

--=20
Als deutscher Tourist im Ausland steht man vor der Frage, ob man sich
anst=E4ndig benehmen muss oder ob schon deutsche Touristen dagewesen sind.
                                                (Kurt Tucholsky)

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

