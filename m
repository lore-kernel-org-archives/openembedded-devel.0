Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2311C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 06:11:56 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.115])
 by mx.groups.io with SMTP id smtpd.web10.15163.1736921508582460134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 22:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=zXG4pf3C;
 spf=pass (domain: navimatix.de, ip: 40.107.21.115, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qkKZDqjT9hE6vp6X1Rz98MhyTc0Lik1cPgmOktiMTj4mc+eqxZLYvwxU/hYlK8q+2Adux8JabDV/HPF/EIDMEFcVzMDK7a7zLAfIKUIfTSD8/yD/nEaY/FgFwPPaZ6SqxSfIez4SClJpvV4GorsXwPTDGjpUflHnmIz7zbj8sw4n7U1QQKDEopoT6WYCSPwBw7PHH4gnuGoH37Pfc5TRKLg7qxucFGnS8syOtmwchD9CDtnkFG7TLJiC+LOTmGQ8X19DuPmu76eICJd7q5g/O5Vi+04sGEDyTRfNoEk+8OnOzPuBe6CutAVTPHML6bAjFHMgn7QXBzj5rFOVkfDfOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8FRiGY7/V4+b92uLc9znXl0eLTQVQnObE5ZFZbqkXeU=;
 b=PJcV3Ira0VoF49ChVZMJsCmlCJLtnSrrrI5JhZ+eCdsmvOZckHKxn/Pfo5lcV5CzCzeKPjgUaOt5YworMsIXwfEy1viNA0vmtT+YNgauCPNHVWkU8SfKzpSZfjw8xUwQqT0/2MuJIqctVx2qhcQ0kzVm+0YFRHR1VDLpZt8No2THi5Y/97rEqaFb4ljXBVZM0rMtsVqWGPv/dY3wskeAVLyulXBsFe1zl+qHoP/cqEbEhSclNrUAk8kA8vULQIcxryV7oI1h7fFpVLtCiCEO0wLHUovowjlYSQSqJnWh3bIivHDh0+Oe9oZcploZs6huQ5GSwDGlB6uTDhymd+bHaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8FRiGY7/V4+b92uLc9znXl0eLTQVQnObE5ZFZbqkXeU=;
 b=zXG4pf3Clf6Zq4pZSM0PAvRAdp9jGZxPEzt0w34LcY4zk/WIy1lAA1gY8QhHPcc3KUsf8WzR7DkI5HyW9id0sj4man7SnIpPG2zBzmAjJ7w0QPNidK5LgUPVpCVXHq9JzaWJa+Ab8hNhHYgIwnke5CneUmK5BmjCB3sYcSNhC/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by PAXPR01MB8565.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:22b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 06:11:44 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 06:11:44 +0000
Date: Wed, 15 Jan 2025 07:11:42 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: wangmy@fujitsu.com
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe] [PATCH] smarty: update 4.5.5 -> 5.4.2
Message-ID: <vns3akdzcivjb4p6voamniwm6ri6iif533uxqdvdfswpw6phx4@mabgpcnzpk7e>
References: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1736911952-10934-1-git-send-email-wangmy@fujitsu.com>
X-ClientProxiedBy: BE1P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::16) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|PAXPR01MB8565:EE_
X-MS-Office365-Filtering-Correlation-Id: b0cdb6ce-4c82-4b0e-639d-08dd352b7c2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OjVuQcpVQG6rfEz1Z2JScPTxaiapEENazePvKjZrCtU7KtbOqMh1/jL0gytI?=
 =?us-ascii?Q?n5T75CKSFP+iuxssK6oL1ADsfJbMkAmuhULxoYmeOQnftIKOg8CbMepb0KxI?=
 =?us-ascii?Q?i0JgwOgynIfy5jzjJRgPDkdSGJauI6AtahrrWQUNhryFygr8vne6j/NrPOAC?=
 =?us-ascii?Q?rxVUbFXtCeMFLWylFWVfJE9RaQhNHUlUNDn1zP1E+xtFZwdVYT2BDcGNgO6U?=
 =?us-ascii?Q?tMW51qnSQjWiYseB8bN5Pkt03FgENXT40TOZjlFvNvtK1NTJ/7aVnGGBbTCP?=
 =?us-ascii?Q?S05+CURa8RofabYGEl6XwwamUdqAGHs36N6i/o8pDYXQtbBtHBQWxJRgaNXN?=
 =?us-ascii?Q?MZgv7YZgEPsl7KD2Z/NBPFkhrRg4P30zUVrWWPvGWiQRIxh/B/Dfeb1t79kU?=
 =?us-ascii?Q?wRyhDT9BUw2PgcKSTs6LlzmtvN31mdRPh2MDOrW+4ZIl/3fVmfxAvsUzgxSG?=
 =?us-ascii?Q?iJOtjab8DoLZ9ZYr4qOyFtRuU5Qq9Gi/zzgKHBJrrcxnzan7myIuG6VAziCA?=
 =?us-ascii?Q?hBNhzqq0N2Qjy6r/JYYBYWNZtPcXgKpQc8C+ltHDHEWHvBDTNlHd4ri+m1Qj?=
 =?us-ascii?Q?yujTvJqlXJ5ZLXeXPAoIEgTDkv84uUAWHwNQAzUJAV+C1ycfy1tTtnTat3y8?=
 =?us-ascii?Q?t4m1IYRXBa+UFfRjJ9owBa3gPNFVG0u1sr+0tQuJzLr5FFwK0r054rPOojcT?=
 =?us-ascii?Q?dtaPvsOyLNedwAcpI3BjNHj3246oh40lwUKaWiJu0L6cL3rDb9cVjmEUqsYC?=
 =?us-ascii?Q?tCzUir1REviEuouKM/dw62metbSmzR2pVyQzoWoDVoQTYBQ03CgRQiqymqtM?=
 =?us-ascii?Q?6oi33+I5bXfoHCW2XGXl9gsKwk3DYyR1QTsYEIorEOKqKdu60K0WXFd13FxO?=
 =?us-ascii?Q?WJ96wfFEl86y4CJk+5HbBF8XknKe49UVw042xkVM8HXKqYJ6YoxBO5U5hUWA?=
 =?us-ascii?Q?dbvpBGCQNSrRxqI4kNqHYr7Ez4O6eaFKNY+sG0HpIKkOa3u+16uBoxxz10KU?=
 =?us-ascii?Q?vMvM/6cxM9nFVxonCq4CLcelSupcBcLm8cQ2/+uJcImgc2Z1KdZT4GekamQX?=
 =?us-ascii?Q?GlaN0SnayQG0Dga6+WqQpc06mfY0olPNwdknRA9cNHdgV+vC4NH2TX2N34Xd?=
 =?us-ascii?Q?m89w/teFYZ6fnwpcS0qkhoLPZiP5fNkKc2ftxNHgdBQYtdmtbPrHf+Z4UHOV?=
 =?us-ascii?Q?U2Hittx1eCwoW1P7AhtuhK/0WZMSTbgh3GdjZfxdwyn9/hYC6L5Kg6qW2M10?=
 =?us-ascii?Q?QOnto/AXUphDhAGapF3U7PD0Dd82Qp9CM5hIIy189U5jAK/ztdJXAXvAOLjW?=
 =?us-ascii?Q?WwpRZ3Pyr5G7qYvB0ae/qebB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:de;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d0B5229m8hWsxqSOgHYghqG9YNSmgztZ4oFZXXWIqg3dMnSfWJmRqmpPra7T?=
 =?us-ascii?Q?ztJWyOU2z9f6gjjCNrp133P3Q6EWr7UgerTeN579rU03bFI2NQ0CPslysaHx?=
 =?us-ascii?Q?rhfQfxkagIafMpaR8E+XjT+RZFOftII0ewwWoJTFDhCVjdreDjiHcHxLvmUb?=
 =?us-ascii?Q?rqweUQLwlySWBDMMtzqhZrKSMwCeSiTyiv8JFpCC4nbWfOTLteuNPd6rYQoH?=
 =?us-ascii?Q?vWFu5W4CL7YH08Q9G6/BM5dtJMztj4kC07lTR/8fIOSE+sR5kftVpxgWKju+?=
 =?us-ascii?Q?GbuhluCnIO9l0dsEicEdYDuA75XY+WyCeovBiGeE2AJCHnYaJ+xdzAXK/+qX?=
 =?us-ascii?Q?W5m9HBracmmamRrMDA0wpQ2hEMdljRaT6/Eu29wz1/yVX+Ll3prslxtFWntz?=
 =?us-ascii?Q?uvEAO46xy1k+NzX7+adovg2QCmuc0SyeyZucsYCx91mTriSQRDrxV3vm3iXD?=
 =?us-ascii?Q?+QILfAZ/u7asSVnSHkaLRsxsoC9FhZR9+R/pqwtcG85oENVFBTEDnmVvCuRx?=
 =?us-ascii?Q?t4+G7cmU68WsR8Kzv64MqXJoz9MzAZ3dZKGHS4ryfpzmSRaCc/Qb9/+tTH1R?=
 =?us-ascii?Q?SolLgIy4cT0SL4V7v/nkWmsFGcFvXoDoO8vMnjZZo7aqbAeI0CTCwSlmf1GO?=
 =?us-ascii?Q?mylygJxqZndl0dguF8EGVnf1OTfbRinPu/mCmsNpHwjFZSGWCNdFHcET+kp7?=
 =?us-ascii?Q?LjEOWYDpSGTs5MEpkvV+L3CuBP1A1U5MkNytColnthw1dAZB692/gKrC+cCm?=
 =?us-ascii?Q?1oQtycNcbKE1+injlapmE0UfvNKDg51P0j0QCEljSo693bjX1ULGzhH2Cnnh?=
 =?us-ascii?Q?XKrEs0m8xqE3blS9ndejW4tpkj8H/zhLybMlM7xeiJmZEXvWHJfvcJ49XF9a?=
 =?us-ascii?Q?m2jwE3nKGsWB0KUjBqmPgpG8C54UcU8EVMMeAGAhPjZr35xd0gMrdoOjNDUy?=
 =?us-ascii?Q?TST7pSxSTg5NZ9U+blGBdTldygpJe5GWTbqh+ZlL1qHLRhTchPH/N7XGURct?=
 =?us-ascii?Q?rkikHk3D4X6SgI8MouuLkztseY6gCgqqb02GcxTAm/GDe732fCwUCVrixJM8?=
 =?us-ascii?Q?/5KCPjbRxoEtinf//3MNyyCOVF3PiqHeQ0BHawEBOOyNaIhUTOvZwS1NroFy?=
 =?us-ascii?Q?f3NtSWz2u8loYF4g2vhYWI0SUmu4T/Nx/0lrzxqwZuf+0OUABX8Y0YUueM6x?=
 =?us-ascii?Q?G6npXvYQXTu7P41UPQDmRj1qKSJXyBjLE8lavXI7ZNKPm3XnkkV/EaAmcF/k?=
 =?us-ascii?Q?Mwx0oS4k74zJZtTHcnnufNlTiijkYfklMd+7Dmnx9brsQ3hVjbnOg+xWhUM0?=
 =?us-ascii?Q?gemPi4Wp5N8wY2J1I0uP9PNGxKDk6zyjK6IWukkPvWqH7S6Azpb1Ks1I9k7H?=
 =?us-ascii?Q?4VNqByQXuhVuFBSCCFbp1ETcIRciFc/VuaOJfKDTlpfW57NFAlyRWSJd4cR3?=
 =?us-ascii?Q?H+wVg8LlH8K376hnQgZU3kCTZS04mZE10eaCQ3MBannXc9uQ6uj6gDze8YbX?=
 =?us-ascii?Q?B9P8OXBZIzrFgfdTi6HmQWbeQp3+onhVayiKbnS2iE88IUXVXNtRGqnZjVPY?=
 =?us-ascii?Q?Ciy+IUArsbwrFl2kR/cJYyIeeDBtUFj/cQYsok6Fk3mzg3rgw3Md7D4ZVdpB?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b0cdb6ce-4c82-4b0e-639d-08dd352b7c2d
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 06:11:44.0596
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTZqDLoXeqWLt6huk4oK3h6IF2zAGQKkd6yLPt7JHnOmxZK17bkzNf7BXbttJK+JetE3UIEnuwCE1lw4UD+CNtSG7U+iy6n9VkwNrCLY3Bs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8565
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 06:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114884

wangmy via lists.openembedded.org schrieb am Mi 15. Jan, 11:32 (+0800):
> -SRC_URI =3D "git://github.com/smarty-php/smarty.git;protocol=3Dhttps;bra=
nch=3Dsupport/4"
> -
> -SRCREV =3D "c4851c12e34ff80073ddeb7d98b059d57dea9de2"
> +SRC_URI =3D "git://github.com/smarty-php/smarty.git;protocol=3Dhttps;bra=
nch=3Dmaster"

And could you add BUGTRACKER after HOMEPAGE?

BUGTRACKER =3D "https://github.com/smarty-php/smarty/issues"


Regards, J=F6rg

--=20
Facebook ist wie Alkohol - man ist offener, redet Mist, wird s=FCchtig
und einem gef=E4llt alles, egal wie bl=F6d es auch sein mag.

Navimatix GmbH           T: 03641 - 327 99 0
Tatzendpromenade 2       F: 03641 - 526 306
07745 Jena               www.navimatix.de

Gesch=E4ftsf=FChrer: Steffen Sp=E4the, Jan Rommeley
Registergericht: Amtsgericht Jena, HRB 501480

