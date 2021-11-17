Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0BC5C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 16:20:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.135])
 by mx.groups.io with SMTP id smtpd.web11.9345.1637166009744119700
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 08:20:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=1Y/SqFZ4;
 spf=pass (domain: skidata.com, ip: 40.107.20.135,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cOBld9AolWCK/1wbtOO+I7qtYX42amLOHQ9NCwYN9R0MdhphdgOWfibC/Siw8odMszR6Dj03e0vbkmuPNtOgKotpw6AnOtM1jsOEs5odqzG0AhDbqYMmGxQXLEhcM3rhhZeKYVbHDTwZgSM2tr3LP60QTHdaU8fmQtHkuorYNrYllKXjEuun6jH8ueaEkc3mpD942+2l9JwjlbOSPDiXQq46QI7x/S9Y7E1PMkuXSfNHG0JRhLg88afvkTEEyzYQOyxEe0KMxu6GMR4Lp9JHtdbYLNXWPCCmdbutPQaIccm5VIabFnQPC/IjSuWCSzVpxAMoEQRXoMc9vPQ5oWRztg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmo+yIjHJnaeF4Ry199q2JfRJd+hE6poI+gOz25OY4w=;
 b=Dmk96529Iy3pDwwnUp1ylPfIkbQbdHJZ9sW/cqr1JFPpyGobsPYpdHC7JkmSL3DoIuCAYzf2yReH6eawP3WhKVCbDMlHinBHPtSZfB9ZzrdXlmMsAppC3lQxLAip2Shyr71Nb3XXM6inlazIFutvx8DxeSmFfJlvWYIdG/HhTd5/7d9ZcOBVsnYFpAgDtILU3GmYJRJaNXE7Kvf3/2tVsu1Mgl62b2XeWqTWjB7M9WRvgBtZnXv2DS3UHKyUxCOGBUoThg8qBmD8ZfMty30pwVSL2CXNitnjvChBI/NmGDaP/P5LIFDqrRDI9nZbn7JFBHgRzdbqk0ZTA8QQJKSjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmo+yIjHJnaeF4Ry199q2JfRJd+hE6poI+gOz25OY4w=;
 b=1Y/SqFZ4NnVMhm77qaCzCptsU0TEI5LFCwxmBkpk2qFQHthobNy+fI51pO/FvOo7si8n3tkpHTf7/TvOTOXgxUj8LMECqgoNNrILRILwAbx/LIYWEKlQCtecg2WUBKuRLWGawUR++miOayLI3x0kUYUs0q9g9x5My1RqcdF5PPNKDwhmzZtpP1kpsmoxI5iDkXco6G6070YN8IyI2UjzB1w/HyYATrymxqd6t84o0cUqp90ICIOAoSNNQmd1yFbxeexg/4wCkHLSL79SKZ6TXylbHSEfZrXPssKeqZhZJHc9SPyZKGGCTOvgUDpADomJEJ1PQ0fEBR0Clis7QHJgxA==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VE1PR05MB7199.eurprd05.prod.outlook.com (2603:10a6:800:1b3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 16:20:06 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 16:20:06 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "jacob.kroon@gmail.com" <jacob.kroon@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 1/2] jamvm: Set git branch
Thread-Topic: [oe] [meta-java][PATCH 1/2] jamvm: Set git branch
Thread-Index: AQHX24I2fZTiyAsDVUWzXS5W9y0QNKwH5vIA
Date: Wed, 17 Nov 2021 16:20:06 +0000
Message-ID: <YZUrtnrEbKpjceM2@ltleri2>
References: <20211117070958.64782-1-jacob.kroon@gmail.com>
In-Reply-To: <20211117070958.64782-1-jacob.kroon@gmail.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5da5070b-609a-4760-72a2-08d9a9e61e67
x-ms-traffictypediagnostic: VE1PR05MB7199:
x-microsoft-antispam-prvs: 
 <VE1PR05MB71994E92DF450FF60A97D0B8F09A9@VE1PR05MB7199.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CmM1hW7U/JHHzohH4aUMyBmMm1myJduL43BzRZ30CntL2Vv2TUAsTsApvGNMvjcZWFlnx1mKcBQvdKCq6VpoxMK4l/J0MK0rPoi7c80aeCuswFABuzbluR9vQsxKZrtJlMelEXeJXeEAKAJSG0DL+tqZpuGT1MErz34r7k2g6oYdSV2xNXr8lSF76kgvcI2WXR71QVBruvvI3yN+WnEYtufBCL5+vdoIoYWArZxC/+q4TqXbWnvFVxRzM7b5vxcFJD9uK2aPijJG+u23d8MJCAvzhGXE1fwQRCs3KEA30ALBiuIfADO7hAXs+pxl2sGpg8Fb5b+zDQeG4YjjeSoDKd2USkPrx04yigDvOB/OANXWNWRh3hmYfK0PoX6/DM3Dy+Fuf8cC/BwpivlkyzOfqReLlHuB5pT2RsV45looom6BE8tLh6tb+ci71S/KRqvqh7xYpdlL0HPPxEzRpBSNlE6paXRhEaUG8BRMk5l65TRyR0LKgK/U/ySThWrfy2+TAx+owq9e0bSvDEMONAZ//IoB5qQjgaISIL+YAax5k7n3t9EYVPHq1LDrpuASujJSZrZPeMIjEOLY2F51IM4WpBoVLJOaBy3pgiouvU+799ZuEDQDJtd9Np92cupPSzWdmpGz1uQf1hQu6GWos2AXfnEud91+z0OGp6Xid/ImedTM2dVvGGoM8PR+a2Nr4RRNZJAAFCo6bNioY+v6MymN61I6UTf8+v/PJOWE8gQIV4F68GlvJjsbMIJoH5Ih0WPqj+cUTL5/p4EVRrE3JObmPeKfTP8UuFl1zZFsFlGTbYk=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(122000001)(83380400001)(8936002)(4326008)(8676002)(6506007)(38100700002)(6512007)(9686003)(38070700005)(508600001)(86362001)(966005)(5660300002)(186003)(33716001)(6486002)(71200400001)(64756008)(66946007)(6916009)(66446008)(316002)(66556008)(91956017)(26005)(2906002)(76116006)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?maKbI66ky45d00WCN+KWTLWEuy5LR68f5kz3x6okiWnjS5zNc+wVCkDfBG07?=
 =?us-ascii?Q?IyExwIGBYoAI8wbl/lUfZ/cMyY4iXkuWmku4dLm/ZKK3N/FKNN8fnGxGuiP+?=
 =?us-ascii?Q?xTYwxPQN/fCUzbh9u7PGn46ApumgNkDBf8fVl+essGdjhp2K+k+Fh0Hnav/2?=
 =?us-ascii?Q?r/q1z0zQxGqdP2CDO1fMSLQXwQUiSI+THbSFrZis5w7CV+xBUveY92uwjkh0?=
 =?us-ascii?Q?ScSqIb3BSghhPbeofYqlP3BE2XMYexoEG+wr1POeo9VN7ruWa8dIcY3CsSEv?=
 =?us-ascii?Q?glS8/24PgdyFY4Y9DuOQUOA/H2veTjDHMzv8HMsvo4DDPJH4U/8tKyJzrqWy?=
 =?us-ascii?Q?8J0+WrLJ24503oOaGP/jNbyk79j/IqQGJryPewCs4HyhHw0gz21BRdO8Cvin?=
 =?us-ascii?Q?gUTbrBWIMdR4D/EoR3m/pYPePJbG0PiH9RRcBEbi2k4B5a7/quvaz9nbeYbv?=
 =?us-ascii?Q?MexWSoglQWUs8ZOvDMPjfwmW9fqlVkjA5AGOI591ap69wWIxkvrD47m7Oq5e?=
 =?us-ascii?Q?S7SCvNAuZcCtFdrmGNPonmnvAzBbTtHQ8UWqUQgj5WMKpZiVZqxoetJr3gjG?=
 =?us-ascii?Q?q0lCcQkeBh0ofPwLl6IhNClrk7IyDadncCJVgTtVEmLqTCHVGH0CGGqL+rjI?=
 =?us-ascii?Q?sklMSKtlyE+7pJvVqccQYWp9Wiz/pXyeXlDSX4fGQg3xHmwxv/A7u1DtO15k?=
 =?us-ascii?Q?7S6Ppsb+v7o238HjMpHb+u7eWNzI5Bzt8+CrQtuYS6NDLtKnUN46nA9cCViS?=
 =?us-ascii?Q?EKe+C8sdDaU1LKa+SssRX7MMnNGmvge4FwgXCPfofN6OPgpA8V6RcVBMA10U?=
 =?us-ascii?Q?5aJlfMTAzvuBL/qXoavr7auJKvEsuTSOIhQa8ziU3nLjMUsooZOlo6K0ultD?=
 =?us-ascii?Q?0CMFSw6cJDNKJ5Bx/qWrEqTMew8S/hfZHIdNPFsj+FA2skq4L4rSuHbpHFWf?=
 =?us-ascii?Q?BZ6HCCXSxkhgI1E/iH+FcdSLV0Mo9D9BMblh5tsUoB3sbpdpNUjxeaoqYrUF?=
 =?us-ascii?Q?TyzMiTq+4G7OHSJ6KyOITnzXUoIBhRg1gxyljQYRSoh4KiZ3OhcWp1PXu/D2?=
 =?us-ascii?Q?3BNlBpUe0T3ZSC3C5gDr2adAqUCWUI2/ONPvoJYxTU2v4MsO0QUoMwna/zK6?=
 =?us-ascii?Q?EA3b3FhjyAST/tssJR373/w2EJlde8WfueVFDBG5SfwQ/OFK5tEnOx0Hs2Jl?=
 =?us-ascii?Q?xtmwElwvsrZuOg5ICu04xExuQ4N7ERI3KXFb6xfpsHdHCgitGP35XJfIXngc?=
 =?us-ascii?Q?Ox5kFcKpodMJUPYN39gpTASkoq89ajSdHB/C/4CwLQUis/vgeT9WK1evZS+U?=
 =?us-ascii?Q?u8Fkgt8FfqfXCTpLv9Nor3Y5y6zxErGD+kubKdn2TkJw/5tRbnJ3KwPMziW1?=
 =?us-ascii?Q?Dvt1xcbWcADKX7raHe42kKuk48ho+t4kqP9RjuMvQQ8/QUnNRbAtp5nH0l8y?=
 =?us-ascii?Q?P0x/pCxabxOcOyfanNrFUUVsjiQDaom+gRGf2jOcXkC0v9Sxww8fi/3rzQJ5?=
 =?us-ascii?Q?w1K+CHRUcegzwvI3zFo22+1LcqoQM9JjCeJKiCnV6YaAAZH9j2Yz7Pn2DNLk?=
 =?us-ascii?Q?fICMz8Vpmq0m+DJQLGOAVTTGyhbCLNbct04AkxESZBMSkdCQa8pYFtEp4c4f?=
 =?us-ascii?Q?sUG/TB/LVMUTRmjdGKMjFidJeS7zKos/Q8p5VP3t8dZi7IibysRjmJd9ea3n?=
 =?us-ascii?Q?pNuvK+YVoVh3JRF8MaEvUXgdy8g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5BB106D19093E7448A19F7C87E5608DB@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5da5070b-609a-4760-72a2-08d9a9e61e67
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 16:20:06.6786
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CdOEJvoXky1bzDsQEnVfYSnoeQK1lPCIVinnELVYUysn8XX5et0PiciXF687Wz9EMSsNNchpAw4H1WbcMBD0dV/Zs2glP0Jvx15QFnpOC50=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR05MB7199
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 16:20:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94001

Hi Jacob,

thanks for the patches!
I've just added them to master-next.

Another question as you might know advice:
How may I apply those messages from groups.io using "git am" without
having to adapt the "From:" for every single message? Is there any
"trick" you know about?

thanks and regards;rl

On Wed, Nov 17, 2021 at 08:09:57AM +0100, Jacob Kroon via lists.openembedde=
d.org wrote:
> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
> ---
>  recipes-core/jamvm/jamvm_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/recipes-core/jamvm/jamvm_git.bb b/recipes-core/jamvm/jamvm_g=
it.bb
> index 3c9d47b..34861ac 100644
> --- a/recipes-core/jamvm/jamvm_git.bb
> +++ b/recipes-core/jamvm/jamvm_git.bb
> @@ -6,7 +6,7 @@ require jamvm.inc
>  SRCREV =3D "6cef41d859fbc9ce7868a97cb2cb5dd2b10b9103"
>  PV =3D "2.0.0-devel+git${SRCPV}"
> =20
> -SRC_URI =3D "git://git.code.sf.net/p/jamvm/code;protocol=3Dgit \
> +SRC_URI =3D "git://git.code.sf.net/p/jamvm/code;protocol=3Dgit;branch=3D=
master \
>             file://jamvm-jni_h-noinst.patch \
>             file://libffi.patch \
>             file://jamvm-minmax-heap.patch \

>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#93986): https://lists.openembedded.org/g/openembedded=
-devel/message/93986
> Mute This Topic: https://lists.openembedded.org/mt/87114731/3617580
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
ichard.leitner@skidata.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

