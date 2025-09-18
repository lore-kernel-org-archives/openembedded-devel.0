Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A902ACAC59A
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 10:54:52 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.24])
 by mx.groups.io with SMTP id smtpd.web10.10924.1758192891392836038
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 03:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=TMK8kyF4;
 spf=pass (domain: axis.com, ip: 40.107.130.24, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iOwhoOG1r8iDV0QswOBPMmNdHfCLunmsz2ccy6zc9FbP4s+8GzsCg+/E8YmLPeHVtfh3hRLEQz8k89lb8ZLWfGQuSrGgHRNo9ia01Cen29mmJOwHGKwgUNoATzflUX0W+IQntelRkifAWxsjWbYNQ1qBLz5eVZzbVpBTTAFOQAof1GE3t9Um9yJmnYAi6drRvDE26f2IALVBcC+dC4+aQ9MEy48UcYucjc/R5LIEpAl7ccF0f+P2QD2OLYbA2hPP1b5qVNYoMz0Jm+8mZQlFNUM0rCOkN28OWf9s3Ciu2IGXwkiAD4hj2waPMZ8ChM1Eev9CM5tnfwNgPxBa3etW+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1iK7DMI7o08pVQLRN0W13gYwA19ygNlw3fFGozrWrY=;
 b=TzXzOvnhiKPIVx5isSI3TRf16HTWDki2IKNlsuT0uZEDBYBPZlpvEvvlCjdp0sfOX93BZsyuGK1WQ2gk9N8PeWPPB8oeE3CIiIW3LGVopIz6nB4YsOT4/p+ZVqrmW3WPsfKLUiZom7I5jF+JZaHr7t5bhkcsujxwMMU66/6HXQIr/6iA72dq52BzAnT4sqdK6TCuba8nPUsh6pfOid2LsclaAMJPgdhO+RpBGkOmgGSXZ6ApcEDfYMsXj91X+fRgQd3TVuPBTCs0q8bJ9vbHDFm/QQ3RdWrBwoxQsxR/1PV9E0ZbLdULiw+he84YeuBJ4bsWdyMvv4WXAbadOBAnMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1iK7DMI7o08pVQLRN0W13gYwA19ygNlw3fFGozrWrY=;
 b=TMK8kyF4PevA0IS/m57XyMyB+k2FsCjWKVZ3zrirDnMEUUCri6ciTCjFLF+4OQpoPvCrVdMpAScmxTsZB+bwZFdd8SpYc9w5pGpp8N21m29iWUJiQNwlojVYxMTP8z0qh3KIifPnf9Tt17pVYHJ5krOXofH1T6a/FfODzVAVBWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com (2603:10a6:10:44a::6)
 by AM7PR02MB6275.eurprd02.prod.outlook.com (2603:10a6:20b:1ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 10:54:47 +0000
Received: from DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0]) by DU0PR02MB9894.eurprd02.prod.outlook.com
 ([fe80::74bd:5b24:5e73:94e0%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 10:54:47 +0000
Message-ID: <14e6130d-6802-489f-8aef-36e0cef2b525@axis.com>
Date: Thu, 18 Sep 2025 12:54:46 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: crucible: Recipe update with go module fecher
To: Fabio Estevam <festevam@gmail.com>, Khem Raj <raj.khem@gmail.com>
CC: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAOMZO5CSQZG5=+urHZb9yPK5cV8S=c1EmqecPNQgPjA5qWNwpw@mail.gmail.com>
 <CAMKF1sp6CDY46z+FsgMyZ5feuike_pJeR9S8zLo8+ESBXfcLZw@mail.gmail.com>
 <CAOMZO5ASQmTjr8Om3ZTaN5Q2VLaC9ymxEAAdrATOtHN3n9JsWw@mail.gmail.com>
Content-Language: en-US
From: Christian Lindeberg <christian.lindeberg@axis.com>
In-Reply-To: <CAOMZO5ASQmTjr8Om3ZTaN5Q2VLaC9ymxEAAdrATOtHN3n9JsWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: MM0P280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::19) To DU0PR02MB9894.eurprd02.prod.outlook.com
 (2603:10a6:10:44a::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR02MB9894:EE_|AM7PR02MB6275:EE_
X-MS-Office365-Filtering-Correlation-Id: efcff2d8-7e81-4b30-06b1-08ddf6a1c8b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?TBrH3EFglDGrN02ynm1T7NK5PUyipCz+6U+HAMuulS6fCQRvphxC1bkJJ0+P?=
 =?us-ascii?Q?iAlGA6m767Ro4GLpLBZNAYuKEAuOLtjAdDZmW8q7ADGUoQrh791PNkdrLaoj?=
 =?us-ascii?Q?Kd3Wj16mfF0vjtt6EPQJmYinUTjL83ru/lRFJYXjNWUUe3P/Ts1eUhy07Z73?=
 =?us-ascii?Q?gefTtyigxWRtPd1jUa2Gl1iyL5bhLeD/JCYSDBWMBvWznfhlW1qa9rcckqmD?=
 =?us-ascii?Q?O7ZmsJgEISWAV8sNMzfpwhWH1d9tlJTb8F9rhApRWY7WSpLte9t9J4gb+0AY?=
 =?us-ascii?Q?9TQqZVOwBMW4MarYLn3Kk8BQQjX3EO2wn754wYAkSbP4HEjLQZKg5skvmxZy?=
 =?us-ascii?Q?OYmUdWfHVpCtI35F1iPNE1gvYEH+ozCKM5U7JKnY7kCuvWkXxm8ab4nCI/Xv?=
 =?us-ascii?Q?pxMMY7CJuxohgB6wmZGdLFqlXL1VpbK2XcrjAhgpdsKQR9mjeXSwn6onM3h7?=
 =?us-ascii?Q?LnN45u5lANHjJBFIFIXSCGx7MU9OaKapOtCdI0P8OZPdBcTKmIBQlmKTx6NC?=
 =?us-ascii?Q?XF1dYVJXtf1p4MLHsEbEZ7ePzkg9UAbx9s7IAjRUg13XT0/GUEjeNOH51E5I?=
 =?us-ascii?Q?8T4o7AW/+zoJ4zb6cvxWPVmRslZVL1fQaLp6eJs8J0+tHnMRc0hazq7jl3og?=
 =?us-ascii?Q?OXMyRa8F6xIOc/hBtmH5AU2AA21zgu3UrCnDJVFlZj2+HEgUD2K9IcErPZ17?=
 =?us-ascii?Q?nDIDarp+z7wB3xI73eDfa1SF4FnEx38aHLAA/CwocnqJ1xFa6Ln4ur3ai7EG?=
 =?us-ascii?Q?Xy7iNXWWOZHsBZH4jby/H8yCjTRJsqhmCo8PpJ3qdG/Jk/gFFOiGMbKuH5xR?=
 =?us-ascii?Q?dt/iGxi8ex9KXrvwsl7tB/Sd4WU7BHqQExS4NGysejLarzgkGN5prT7PIgS7?=
 =?us-ascii?Q?mKUf/YNhgT9lXvOEUr5ZpXw5b9LxoJr0YnPO/q5CQ8AjakrCLIkXAX9i2TjT?=
 =?us-ascii?Q?P+a7jR25gm4dbF01PukyWXwHx+dg3MqmtlX7/4Njr/wHPiBvfz8Vqr4AL0by?=
 =?us-ascii?Q?UxGKjGxvCOFukT1TzvFrINbCvy+NuZQMHgKkWU/xDBTaco+RI12UCawYbFl/?=
 =?us-ascii?Q?WnyBLBdPksSZwZzdh95wP5TqzHtCIMnkYJOdbYx+S3Kmlr+orEqvcTvWlybr?=
 =?us-ascii?Q?o7tMG7LgKmcnUDwmpJWz7bRP3/SO/wFsNiiBfZqwxkr9HK3x+jWsuzEyCzCA?=
 =?us-ascii?Q?MKYxl3PHi8sr0dklUac83Ll5qA4X8amVK+QILrWlJI9qGHZxRCWYw5o5ugHu?=
 =?us-ascii?Q?lHtXF86tiZpIeHMEfrxmjJOA4h5uuoryHe7+pisrED3l5w6RTwyPb3bPgd+N?=
 =?us-ascii?Q?zQhV1s4by4dFTeCii6XSOd7FlPAQ9y+Dv+d55Edx/zS5p/GbjE1Xhjxvrj6g?=
 =?us-ascii?Q?YhDNuX6OSg2J+5BA5nqyz+34LqoT6pV+UpN6tXUAF5jg8CnOCw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR02MB9894.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?epddL6XyeOc0YRzk2sN6h1DVojBCpc7Se28oS0yJHFSk+oA2X1Bk+v9pqptr?=
 =?us-ascii?Q?Eg0DofosNxOvgVwyIIUlvkXjJVURdmLxbsOZxRijf6yM49nmgQtP3zkdHk2c?=
 =?us-ascii?Q?rfsqRUEhcwFTgwOWnFs3yXkmE8lP51b6dxKfuFFIZ0VGdJOZ1dIAVZR2ohp3?=
 =?us-ascii?Q?9iHSusQ+SN6uKPERjjFs1wTF6EzMntoPWKVuuCT7tTaQdsBJidytHB/y1JQG?=
 =?us-ascii?Q?/IaD/rbeXNv6U6sLv0znU9tQEYsiocOLKgb4IlJqf1dQeibjVszLCKP4esje?=
 =?us-ascii?Q?feILY8OFcEt2FDyJmQadqUvT9ns5xi+7IXgErMw6SDyGQkwZzpOBrviOB66p?=
 =?us-ascii?Q?yvc4HxBdCCNbXk2LSgLqBM8tN/3X5hYWU+J4k44JCMREpjFSIeffA9+N2++0?=
 =?us-ascii?Q?93zZzwGXxZ3A94MotG5YBnk1OzKarko/VqFwsug5xxvf6CMg9gQibX5p7OqX?=
 =?us-ascii?Q?ZlSJH9LzexrK6G0EdfSkw4IYACzCxfBjBSTWyelpgbkQ3/4bt9tv+uVTH2hp?=
 =?us-ascii?Q?Aooxd6NMLasrkIIQvj6WHh+qNxbCy88spvwRKCbg6DBhkjP1RsJTLFXNmnh8?=
 =?us-ascii?Q?uJgAf9XYNm14aSoQHhqeKlulGSSnk2Iw0WPepZGyjMQUCTjo6CkXVjpbsprm?=
 =?us-ascii?Q?J9JCWS9gSdcFr7UEmeTKZ2sp4nfpLoT1ZQrL7ra2gj4vzc0xykvPeabY6IOT?=
 =?us-ascii?Q?0xQJgj4zMA3LUu7YpaQ4pcNBr3E2hFnlRidjcNuFEyJ9ox6DDo7Oyom8C4hm?=
 =?us-ascii?Q?Kl/0LiOCJPkF6jJ6j2c3RaRYwWfU3bW6zcNVOhip6VA8PRIoR0L4z65hIV7h?=
 =?us-ascii?Q?mlPrrwnhv8G2dcq3O0qhbG6lvyDuckW5MyOAqJSQXm/tnmIJ3h9Yx6EBT/g5?=
 =?us-ascii?Q?xCJcf9VDbH2Xpp7PPxfsxS2n0aCP2Ifk7in/PyXPG35ItPzjqSUHfKi5dJq5?=
 =?us-ascii?Q?tUqU6Auf/ZTj00IhOolHj/mOKjgQ3t8JuZFftNU5R46zrht3z89Z/9/Gxffc?=
 =?us-ascii?Q?bLTxQqJpdliKyaNSUrjmFkpFmA3Kurl2wOh7kxbHeqcxsXhMjVGQxoFrt5S9?=
 =?us-ascii?Q?2jRw/JeOPjtTX7R6SeiO/d1tObSJTwdqt8J4LIrOB6kgm/lHPGtJcpRZqdBa?=
 =?us-ascii?Q?oZSCGjNinb6SEr04CrHZWhEANMqsXOzNpDHGJmvO3WBKFO9dc1k44CzuFzpz?=
 =?us-ascii?Q?VhaxW/YaTLOXCDI/F2DnTbQQRYE8/TwHbcWF59MTj1b/PzkFWGV11TqxFXpl?=
 =?us-ascii?Q?M/ItXkh3/SkAzEzi6VQLm+RgvOg7hSBl4G6x12+fwMB4eRcoorMjIneJpVUJ?=
 =?us-ascii?Q?ZPVP4a2AXJ2JE0s2LcrTD5C6o1j3okcnS7GK/gSa6hdIqmY5A3hbyb39Y7tB?=
 =?us-ascii?Q?pCg3D6Gi1MaPqhz6eLnt4GHcIzxnFJ6jCNJ4tcJ6eMUkbMEV//1yjI4qEkZR?=
 =?us-ascii?Q?02xWQQQDyoGlRhnhGnj0sDVcNW2uYSxhhmLNInbVGb+NKj4peZazSqvHK5K3?=
 =?us-ascii?Q?UwVpTZxoRtKdiEIdvxByItltyxH4gdlwSJz17yQ7kLGIwc7BcKASeSvPIBYz?=
 =?us-ascii?Q?KOB3EaGfrCAM0BaovSLJcrCrTLxTBHZ/e7Gd1YYD?=
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efcff2d8-7e81-4b30-06b1-08ddf6a1c8b1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR02MB9894.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 10:54:47.5625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FI3ODEIOktO71MqHrsxLTRLTVJTnkPHgPovuuwrOOSj96G0+eGNHfkauYcxThyVrm62eXOmSFvAKQVEmV/MErw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6275
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 10:54:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119555

Sorry, yes, you would have to use recipetool or manually update PV and=20
SRCREV
and run the update_modules task for now.

Thanks,
Christian

On 18/09/2025 01:40, Fabio Estevam wrote:
> Hi Khem,
>
> On Wed, Sep 17, 2025 at 3:51=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> I am not sure devtool support for go mod fetcher is there and working.
>> You can do
> Yes, devtool does not support updating via go mod fetcher, but
> recipetool did the trick.
>
> I have submitted the update; thank you.


