Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 732AFC83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 07:22:35 +0000 (UTC)
Received: from esa10.hc324-48.eu.iphmx.com (esa10.hc324-48.eu.iphmx.com [207.54.69.29])
 by mx.groups.io with SMTP id smtpd.web11.2267.1752564147183159346
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 00:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=iIcxQghH;
 dkim=pass header.i=@bmw.de header.s=selector1 header.b=mEqwW5Pc;
 spf=pass (domain: bmw.de, ip: 207.54.69.29, mailfrom: prvs=284ae8e06=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752564147; x=1784100147;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lxC/CBzBRJKPN5F8rHab/KCOyIPGD0rcMLFPFDK1W/A=;
  b=iIcxQghHIi1afuZR/zcNApVHjzR2P72bW0uAXkQAgs3aZpFtHibv3wGF
   XUT1dn7qilxXo1urWWw9yyZ7AYEwfJB9r+I/GOBfcqP8+uRdjzS95r8Hw
   qQkbYLpT4liF3KLsrZphDQQLHL4pejoczLJui3NzZHuJrZdRBAh2LTFOh
   Q=;
X-CSE-ConnectionGUID: TVqvHIdMRZiWdHVkhfpIFg==
X-CSE-MsgGUID: Cl0+Ndz9TIyt32in/wYatg==
Received: from 160.46.252.39.spf.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa10.hc324-48.eu.iphmx.com with ESMTP/TLS; 15 Jul 2025 09:22:24 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw4.muc with
 ESMTP/TLS; 15 Jul 2025 09:22:25 +0200
Received: from smucmp19d.bmwgroup.net (HELO smucmp19d.europe.bmw.corp)
 ([10.30.13.170]) by esabb4.muc with ESMTP/TLS; 15 Jul 2025 09:22:25 +0200
Received: from smucmp19c.europe.bmw.corp (2a03:1e80:a15:58f::2050) by
 smucmp19d.europe.bmw.corp (2a03:1e80:a15:58f::205d) with Microsoft SMTP
 Server (version=TLS; Tue, 15 Jul 2025 09:22:24 +0200
Received: from smucdzmp09.europe.bmw.corp (192.109.190.43) by
 smucmp19c.europe.bmw.corp (10.30.13.169) with Microsoft SMTP Server
 (version=TLS; Tue, 15 Jul 2025 09:22:24 +0200
Received: from OSPPR02CU001.outbound.protection.outlook.com (192.109.190.1) by
 smtpedge.bmwgroup.net (192.109.190.43) with Microsoft SMTP Server
 (version=TLS; Tue, 15 Jul 2025 09:22:24 +0200
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com (2603:10a6:10:d7::16) by
 PAWPR09MB6726.eurprd09.prod.outlook.com (2603:10a6:102:389::11) with
 Microsoft SMTP Server (version=TLS; Tue, 15 Jul 2025 07:22:22 +0000
Received: from DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459]) by DBBPR09MB3143.eurprd09.prod.outlook.com
 ([fe80::97f8:c4e9:10f0:459%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 07:22:22 +0000
X-CSE-ConnectionGUID: lyoUfGEJTXq4T3UYgJsdlg==
X-CSE-MsgGUID: Al0FColfTEy+QsjQo/RMIg==
X-CSE-ConnectionGUID: 580PX26YQcea/F9mOxwciQ==
X-CSE-MsgGUID: Qy7rtIQuTLek9Qk+lq34tQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vdni+Gli1d53Somd14ZjI1Ybyj2QzJNhxf1MpZ3mmY4JN6uVc/0XWfYBozosft8H8KepCVfu02NoZ5KZULlvkN/BtAHnSnb+16/7CqBSa2Ykz5fluS3M1+owyk2jYk12MBU9VHy95yRN93lAXgolIobmB1YEq292v7CKi3qCfDAi0cK2x88+1PG3tFdqPmLenEe6JO7l0wYsTkwcPt1Vh+rHjQCbIf/c9iuKwoczfX+2ZlbsjzBxTbuCX3m+YpEkVZKPv/xd2kfXpWewpDfRfZE7O/SJ5OlaGTzah95fXsXqvztSJD22Zupm7OZTwgGPEpmET+qhO3T87jvpCnyWiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxC/CBzBRJKPN5F8rHab/KCOyIPGD0rcMLFPFDK1W/A=;
 b=GtPdQ8MVE4AjkTA8/l+rJIq63WF+W/EmU/HuElJEEERKSDT71FULZ2g8VL9tuFVOhYMWSPFOx1HYNbAE5+Kyt88zuj96BaVdfBbo/+bxnhLQHkLqgsBvJ8VUzsVIIuoWJ5H7biTzXjW8JYa3694I+N8YJNCbkDrAwf6hWjDF+QkBcYKJs8creuEgVKq0Ait2448UMdW3znTpISal6ttEbQcQwdd/w4KaeI9P2ue4iTtu9b9qR8gQr9IyoasyGcjeTJpVig4gu9JT9yykVbnbkdPm9XgYjnHnhAj5tUQV/TNO/lsYLF4NWbVD1Vki6UOGiX0HQBYd3q/rsSLRrdfVKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmw.de; dmarc=pass action=none header.from=bmw.de; dkim=pass
 header.d=bmw.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmw.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxC/CBzBRJKPN5F8rHab/KCOyIPGD0rcMLFPFDK1W/A=;
 b=mEqwW5Pc3Dc7C8hOfEy92RPEYgWte6IKyNvbnQ2CVfOA9Jd3ny0rcD3O/FzAZhbyDCsMyhsibyCqnvilSXlLXIjsP0/ia8D96kXGKqZnt6VxOSE7ylqv5diw0296pooLt3AffOSgtP5CmtG1sYu05TFvYrOCWNFK3lcfdnL4/srR76rQh4Wig/lDQgY8/8nVH/yiYPeAtflqKzxyRy0y7nWMtPyHvEe2InOBE+fJzSCPaBrSwzBBk1JbUOM+waSixefEWSTLAstFAWybSo9VhV48IIXfAizui3z626fBZB2Id3KgY6ZeTsLECrc3ZE7a8TdC/3aluw3aSYYvMR2FvA==
From: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH 01/10] leveldb: Disable ptests to allow to
 build with CMake 4+
Thread-Topic: [oe] [meta-oe][PATCH 01/10] leveldb: Disable ptests to allow to
 build with CMake 4+
Thread-Index: AQHb9LI4Ygse9Yo6+06BYwEro5ikkbQx59aAgADgV9s=
Date: Tue, 15 Jul 2025 07:22:22 +0000
Message-ID: <DBBPR09MB314330C1EB5527DC1C9A7C49EA57A@DBBPR09MB3143.eurprd09.prod.outlook.com>
References: <20250714112642.121146-1-Moritz.Haase@bmw.de>
 <CAMKF1spxFM0-inrTcpdmCNTvnNueFMw=k3_RB1q2+FYy+Tv73Q@mail.gmail.com>
In-Reply-To: <CAMKF1spxFM0-inrTcpdmCNTvnNueFMw=k3_RB1q2+FYy+Tv73Q@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmw.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBPR09MB3143:EE_|PAWPR09MB6726:EE_
x-ms-office365-filtering-correlation-id: f2f0fada-da2a-42ee-580c-08ddc370578b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|19092799006|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?77x4Y4bsQlEKhHIJPMZ3DJ8UzL0gBVcMJprgmrcLqDpdOa1x6UZ0xY17hl?=
 =?iso-8859-1?Q?vHATHq2aNwBfj6MBIMBRHrWzk0T7nLJTrU9Hk75LYEYskoFT09qSu/SdWA?=
 =?iso-8859-1?Q?1zXw0ukDMnpEeYh9ooeSvSLCQinCFW7QkKLAUaqot53Iv9DXPbKkN4x61G?=
 =?iso-8859-1?Q?6fXEhijH8lLwFBEwo3nUgMjnQOFFzE/gvdy1X5utzx7duK1f4UvdA0ZFCh?=
 =?iso-8859-1?Q?gG0Iy5WlAnxUAi2Gsu7HF8fahDatpHzFJmV9mDkG9nY9StEDPlMa0Yl3pY?=
 =?iso-8859-1?Q?vJ8bOV0xDdYW3BQsWxzm65sikhUSEHaLEG/CS0gQj30pV7La9klg4yW+B6?=
 =?iso-8859-1?Q?crn3ajOOfS5VG+r/ztnO5m+Wmo9yjHj7qaYeKD9BPnqMTZ8olMQzWbgtTj?=
 =?iso-8859-1?Q?Q5wX+oFHUD7pJ6U7BaXhh37cUcZLDXEyhIpb/xQG7W6Ie8q/5WzfkWPV2F?=
 =?iso-8859-1?Q?xxOF+tzQW7azrdD9faYW4yDp8Wsylg+j4sWGWSgurSno+LvtHvg0AxX0h0?=
 =?iso-8859-1?Q?M9kkHQLkJy1AqBo6Ti+P2c/F6hcqZjt/TnuqFDuQv4c3dar7y32fJ0TCJV?=
 =?iso-8859-1?Q?ru7nHrI4GsVcIS/Ps1d15O6wAHDuXcFDCr+RFgYRrW0ctewB9SMKhJMQcm?=
 =?iso-8859-1?Q?gKZYPn9BO3HZ+e+ZgwvnobEVTdQt4d8VWzMT7uKfjHBZxQjhzwxJaWWV5Z?=
 =?iso-8859-1?Q?+Sk5DkkUEQHnZe6tzqVymLzBWsbQL3aLt/pbJXtxQoS6eP2bnO9EEUtGpb?=
 =?iso-8859-1?Q?osOPSEB94BNUcT05VPYnFDOgSXsl8fTzPnjKEmCmduxXZShzLG2jYFqQko?=
 =?iso-8859-1?Q?Otzu0bdVB1uAOLdvc2TB6q7AjHlAnx8na4MAY6NjpA59BF1w2KOtbG13qG?=
 =?iso-8859-1?Q?YxfOUnAN3SvDVBQuYE2Eu7JhndE+qr0M0cWPpMro7e6bA050unQxISA4Lx?=
 =?iso-8859-1?Q?w4TMlQHBeT5QUTKFgdr3vkKCt5El/xqK3wZlagBPEAk5v4w3RGlnUsK4+J?=
 =?iso-8859-1?Q?uUM7VENrPgTjCJmGDNDP3FnLfzMhHtIBGX2HB6aUrabqD6jNfuxjsa780k?=
 =?iso-8859-1?Q?o9aKXFwZk+W3VwHxnGoV8QHG0Xlxkmiv4kG/fdJE2Azct9T99kGffI+b6S?=
 =?iso-8859-1?Q?xVWqQEjtxZhnE5vAdJXMZ0EUFh8bIJVhD/aWMwqv5QqbAw2WFyyfX3vyf2?=
 =?iso-8859-1?Q?byfa7NTNAY9338IfpP41sxAOnRGUehQl4CvUsOqIasBtGFhkxToiFi9iMb?=
 =?iso-8859-1?Q?M/Xm/W5UZH2z8pFEHotP1/Cbkaa2XCZ9lG/bEVMV6rfDuuBpLj3UnYbQri?=
 =?iso-8859-1?Q?OdTMs9GCY9XJgkPM6pSjVCp+sgMnMz+iGn1RJEJEXPz7OZQIOPJBbnj5RW?=
 =?iso-8859-1?Q?HTQwmkhVJPqEvit64AjuM6147v2saQVwJoVNM43QAI8a796lz+6pghVG0+?=
 =?iso-8859-1?Q?T7uYRhGNEUW2uWRv1y7IEx6BrmtCZunm4TkPd4esPMAWh1mdUaC8FvuHdL?=
 =?iso-8859-1?Q?g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR09MB3143.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jrOgQkSCgcBs2iTFvY6qKBmMJv5U8ZzjCUKDub/mnTDz2DXLLFDm+02eo/?=
 =?iso-8859-1?Q?TTQrPJaXa9MvjNk61+d496nopKzrZmGjwYtWxFYLss1S05qnN2+a/20y9U?=
 =?iso-8859-1?Q?Kd7xl4KcZThfxgHSOdHULtrvEwE+O4Uo5orMcThaLkX97GD4grNDJUwEQ2?=
 =?iso-8859-1?Q?AJKMQ/cCLd0ALCM+00CrjPyk9HvDevXoN+252GM2qezkDOdqgvNts+Qo6l?=
 =?iso-8859-1?Q?uEWclevTQob5tznO31lwEjjZZHFRbAsjjViU1swgA9L1cYJuV/ppj2h6DO?=
 =?iso-8859-1?Q?cfK5hACaFJBLLZCMJU+j2X6//H20TCcPPthkbOqu+KKr07ZXqxXslvhk2Y?=
 =?iso-8859-1?Q?kdvhb6NV9fXaE85iU0qeDWgvhv+TfjlpDdmGaDdpQLcMoHvFVs+Zb6qrK4?=
 =?iso-8859-1?Q?1JkxPyoPfvugOQanMSwzO0oDHF8tsITVe6E9HsS13mr0edkNQw4MIWdbmX?=
 =?iso-8859-1?Q?jDF6RM3R4nugQaZE6s6ciEnk8lmqIDm3duSM1hvcRTuN7uQSNsJl/yUJ+I?=
 =?iso-8859-1?Q?evxK1iyqIMO9PTDGkaHDZJgjDDJuyY4q1Tyrq4cj0RMrpRhxn4d54LhI3U?=
 =?iso-8859-1?Q?WGNK8Dp/B9/IlVIGk/d7qscNcoVby+5G+RIWAbVuVZwi7bm5U+8EaxpdFj?=
 =?iso-8859-1?Q?7LrFlDFxUkYqc+XuXhG4wzQRPJCu5b26WK6PjQsvKnG7D0CYuHo9RmvRu3?=
 =?iso-8859-1?Q?MUH+6ORJ6Yj+/CijKjWuEh5EJxgc8iyCrCrPsv5U0HOwZMyA6N1oHO5yoa?=
 =?iso-8859-1?Q?wFlFTueBrAby0kpHOCdHchwT5WJXn+7LN2gmo4XaSewPSc7cs3/erNbMI9?=
 =?iso-8859-1?Q?kCqVSL7GwKnJAGq5MjZBEXVVo5cv3Hq32HZ3k2ji31yOAzU8cvOX2pltDO?=
 =?iso-8859-1?Q?+rJ8lUqMXqsITeXFnQFqc77CgDe9HiNeYLRhcenCm4FyiCNkQl7nrgsp3u?=
 =?iso-8859-1?Q?Cl9JnjdV6mrIUw7GzAxUPkpAY+RI69URXOM1LWwo9tUhEX+f2zITxOnfsU?=
 =?iso-8859-1?Q?/0m32dJ7FAGroBVkw5AFAwgSLGiCoQzR+XMUArIsEJaWoEdoD7EBDidFDU?=
 =?iso-8859-1?Q?336btjBPL735owR045T2qRK5+Kzsmfe+kpaPHBirdAqrYnVqEnvPpnU6FZ?=
 =?iso-8859-1?Q?ns1NexfuXlgoYpUOJ0EuPmVMNWnzG0PKLcvCmn4gwkNOC2QoRLhWRQedqO?=
 =?iso-8859-1?Q?bqAZ7y+TYRKULs4gAQPkD0IYH/ALRYEViuCltOfii2GmXfHK8UITzJ8gAg?=
 =?iso-8859-1?Q?MdGZ/Eg1dJGDQSCfS+NIHITSQvP5QHh8OUC1yroZr9A2WzFr46oe8KdlH7?=
 =?iso-8859-1?Q?e0Yt8ms4OsCUdBEr5LS9YTDtooFT07xUF6Vd5pdR4S9gdvC1PmuonVE+WW?=
 =?iso-8859-1?Q?Jv8VptrAb8toBHdsT+f0OoCEZV2KKwyLiBh4fwCqD4Pkc+MJrE2MVSCgyv?=
 =?iso-8859-1?Q?lOvZJRS16TpzYD5ea+XlQdLyImSKITXWO3R2lxEhx9KryXou6W5+8z1JBt?=
 =?iso-8859-1?Q?AN1sEX76gLCI2wbDGVzJ4yUzX3nZwiQxHX9vZMDcUyfUtAVFw6Ovnseedd?=
 =?iso-8859-1?Q?1paI2K/SA0ooR9FmT93uWFOfTfCM+eH8fJaQ+wEhAeDd6LRAfmCKVJkNQD?=
 =?iso-8859-1?Q?K8OxkBVE5bHvsQzIR6vWy6MUdFM3RQmwDf?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR09MB3143.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2f0fada-da2a-42ee-580c-08ddc370578b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 07:22:22.8530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ce849bab-cc1c-465b-b62e-18f07c9ac198
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FjYsm0kuQKvmVpNGE5m5bxcOV2Mn2e3cvjmd9v1fGPoG6/VgaRY3CV88BkWkpbU0OCFdq6TtmPOCXZ8J1tNmtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR09MB6726
X-OriginatorOrg: bmw.de
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 07:22:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118553

Hi,=0A=
=0A=
> is it possible to try using system gtest ?=0A=
=0A=
at least not easily, since - among other things - that requires C++14=0A=
and the project is still on C++11. Applying the policy override=0A=
workaround seems to work though, so I've sent a new patch (see [0]).=0A=
Please consider this one obsolete.=0A=
=0A=
[0]: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_patc=
h_leveldb/114162925=0A=
=0A=
Moritz=

