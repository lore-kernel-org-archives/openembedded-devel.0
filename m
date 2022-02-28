Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E267C433F5
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 12:55:31 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.118])
 by mx.groups.io with SMTP id smtpd.web10.19285.1646052927181820244
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Feb 2022 04:55:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=DfWZblvK;
 spf=pass (domain: skidata.com, ip: 40.107.20.118,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R3WiZkXm28l8MADWMCuuepqfzHfvGdugUgTbhgdFpiRdLlPcw3XDgu5wYABpr6GazMCz2m4o2Srs4FGpnnIq+LFIsmjeqd2Kk63XzPMNwzXCs1mIRyH6UxfjKSsQLsFoVI5Y468d0pB0LoVbY47x56KC3pnsaXo/Pe8O4Zs7ESrG7tdXauSeJdD+aArb6bl8xDKmEPd3ImXVQgpdG0N4Rt8i837LQ+KtRWgfDhpE120U7F3h7OFsXePSYloOgrZIp8LsoyWlmX4oydq7gqZ4Q/4Ln3JAUz8rprYOelSB6JE20cQxMeMdXjxm3t7l1jDGh2NL3TBpdMm7kJUgHRoc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAyIjsHSI3jnhnJB4/J/GhO5PzqfeHUu0s0ewKyMKpg=;
 b=EWfEYGdZlS5RuKpT3ADWmNVldsU/B/sjtD0VMJMM1ZFNzqBknXjalAQfYzBnOzx3ALoELU70BxHn09Qv7doX+NyPqUEWnchsIYM4w9rbNsTumvEQGNBnxka6eg56gH97SBwDaHLFYWX3QUlsZJ6fhyiOy+90AMY5AjU9GA0nLEfG9UoE9SKtmAt93AhBLiZJmD2YV1BD0zMCfoYv3SvJ2Yv7bDG1KSMX5ARprpP0woLMhzU2zAJgrN+8TB2Ow7PMB9P0uhdSn9Oml7gLy7DNsQkI2vPm+uLjJQclVPak3r3EeL4oL9tfVUtNBK8+88h/PBZNRb3wkfaazyScF191Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAyIjsHSI3jnhnJB4/J/GhO5PzqfeHUu0s0ewKyMKpg=;
 b=DfWZblvK+Gbe2dvrCTpN/klb88pHb6nDo+hgmAWSYC9cncWIe/pQIAZQJ6oGt3jAnmOpT2C1b7JBCkoSHwMi7pNC6EXpjv1dBZys48SOWzhc7BBYBPGUBz401BjXfC7gPEhQWaP9YaASGIa7jd2yTpBGzPaRe7Vz14Hv7HDl2xc86Y0X+ptIrkxAHsPwJi/hyl6JGCQay+vKVEzbK+5EhYpHmTzOBIAs1a4hzGzMAoKFmyh5jq7VlP6IHMYTEBE/dSINrZv1fiCbpMkoJZWPraovgAVzLQ/a2xmsjtgxg3mELF9XzKjHqJ//X4xSwBvNPZkWcHTjPBlmZI5HEW08FA==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by AS4PR05MB9229.eurprd05.prod.outlook.com (2603:10a6:20b:4ec::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Mon, 28 Feb
 2022 12:55:23 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::6cb8:5e3f:2397:fc69]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::6cb8:5e3f:2397:fc69%5]) with mapi id 15.20.5017.026; Mon, 28 Feb 2022
 12:55:23 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "jpuhlman@mvista.com" <jpuhlman@mvista.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java][PATCH 0/5] Update master to kirkstone compat
Thread-Topic: [oe] [meta-java][PATCH 0/5] Update master to kirkstone compat
Thread-Index: AQHYKWA/tKMbBJw7UU6osOlN4Vp6xqyo8iCA
Date: Mon, 28 Feb 2022 12:55:23 +0000
Message-ID: <YhzGNSXNHi2Qn7pT@ltleri2>
References: <20220224092339.2711524-1-jpuhlman@mvista.com>
In-Reply-To: <20220224092339.2711524-1-jpuhlman@mvista.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 461d9183-9fdb-4c8a-e8d2-08d9fab99590
x-ms-traffictypediagnostic: AS4PR05MB9229:EE_
x-microsoft-antispam-prvs: 
 <AS4PR05MB92297AEC340F33F7D2A342B8F0019@AS4PR05MB9229.eurprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bQnT/PnX6rcRrKXWBqXb4fO+VM47Cw8Daw9qQMtlqUqIJ/FM1HfANeAY3/L/xwJN8KA2JLmqIxv5fEpczDJeysLUOr4W8NcOGU+xNkdgHkD8AeRDLKsEgXbD8nV/3xyMDziBiSVuvIovbzGux1lJipAX91AfZjuG+O0t7S262ToLzzRyrzgZnvtIQUp7QHRNbYq1MPDelDZRK4KE/GYXScM4WNjHwsaLXjQemg8mMq1+jTndQSwmRPFRNntzeMC9T8vPVuvc9xOB4hDci8h5ryvZEqad1D4ycuSL1fwh4ExUlTUw0E0X6+Wq/rnDTbWePSCryJX7niBb8C4iwu+xFv7UJXAFCg643h7M2sNhYLyPNEKsCjkXndLQ0Rs2RMTtERce/LrxjwMpl0GTHAX464Z66fzlh6IcIzVYX+74pOnt92bgoj8UpPTa5Wg6lpX9+IyWyGbkgBJ3reG54HRtHlKuPxAWxTBdECpEAi/V7OM8LfZoyL4HHS/I2iaERVyG0JAbE80fiuYExGYB+YRBeaee2Bcx7HWXyWzuqCWMVMA3GwHlVmoL5GYxlr+kOZYPFP0kyiGPSW4Kis13EfoFaUbxubqydwxhyfBHmx4wcDbWYPQt9oklN2ZwprEwTih4ZNw0L8oAGtMRFij5RCxClbm2mKGJzZq2UTgV6cibZ8V1eoreLgus9wcKMeCBthZSiVS3ur5GcVPGaYTLdgowgg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(122000001)(2906002)(33716001)(5660300002)(64756008)(15650500001)(66946007)(38070700005)(66446008)(4326008)(8676002)(186003)(26005)(38100700002)(71200400001)(66556008)(66476007)(76116006)(4744005)(8936002)(6506007)(6512007)(9686003)(6486002)(83380400001)(86362001)(508600001)(316002)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?Y3IHxyC0YNrwYxRWHHcsuOobeYboy8bK3RD4iKMcQFggGbWvQY4OjumroDrd?=
 =?us-ascii?Q?rqIXOXNh3qNNdNCOrcd5zyopyDZp3jHYS5bJuST1IgivY69/oEpxaL2T2Cy/?=
 =?us-ascii?Q?Fuj4dOMqoJktk4uNVIakDnXKPw1Vj5HKc95ujZuoHsgW+0hFWzngRTpQJrY0?=
 =?us-ascii?Q?PCWXF43OVlnEPsxkhFtm4gVeoXkK08zdjEz3wo4vZSlU5R6kq1ozkoKgdkBV?=
 =?us-ascii?Q?q1YIWIydjcMBjZToI8LbzTMVhfUJEo6qlIt/WwCGSIxhuTJ9P+mr9NvNgArQ?=
 =?us-ascii?Q?TwMlU7ovCeyrz9GQyJ6TumYGwoYqiHh4B0ICarJEVMQmbLTzK4z4VN7mQPNH?=
 =?us-ascii?Q?jSQenMChMZspgAne2aZ+hBsNQE4uM0Rt1npvBT+KW3ngBlyZoHfP81bzhkKN?=
 =?us-ascii?Q?ocn8H61ZvUbZ3/7DSqjO0nhG5b/d7sxL5qf2lH8zUxN04DimCk5+/e6QFwT/?=
 =?us-ascii?Q?JC0/jtO6JfCflZBP7P510hvzha6LkxAM9cs2LcRlUB1y9PwClBjwksUSrDrb?=
 =?us-ascii?Q?N3iyz6+LHsFQ9+qWFk3y/RKQM3LM6z2gbuYYTjrtwTTRNMaynLlz/CUEGckr?=
 =?us-ascii?Q?LGmN94WfaAmNSif8dVExS23QxP2whO8QfJEU2tWCe8Ken3q8Lq9Erq4EZmCw?=
 =?us-ascii?Q?rJBtiqHxGl4lnhPiW2VJibJLgFJ0HuNH0qX+Hk400lAqixkOLIWoeJmb2dDX?=
 =?us-ascii?Q?YM4JSkK3UoGRXhnkOGEFMLlW6JvgTBdpXnPHxfWtX2wUPQrnmxE4B1FjmOlO?=
 =?us-ascii?Q?mCh9q7nu6nCcsYteXzy1ntZUznFw7YkACBQ8V31dgolgIBSdeEJJDHztsCH2?=
 =?us-ascii?Q?UBtyeSYm2gFY86BLmuAfNJ+CN8i6QWSSVS2Ig5cibaen17hZm9wsyExCXiEO?=
 =?us-ascii?Q?99EUenOx2ixCIfKhEaC919QXxwnec2i0SWx7mX9wKG85bRUKSKKPOWWH9Ila?=
 =?us-ascii?Q?EpAYOBCYJLsEzRbgQCCZxswLB+Oi093bllOHsRyUhmKQ3JEiV/ZPskfvUaoe?=
 =?us-ascii?Q?/0xFokM2fkVvkqzUnev4u3IOfmtuXGNKbrvti6p/qUnDfPdNTJtlll3XmdJz?=
 =?us-ascii?Q?DpGA5hBERGFHzJH3oMSxs13RNmDNp9tc+lRwEvMeeG6jpRpz6WW9w+K1ccbq?=
 =?us-ascii?Q?udklM3YSSOtd+mA29BBajM44HF94QMlSEYzGOeqV+rKKX0zRvak0zoZ9n1u8?=
 =?us-ascii?Q?XV4TM5W2vARMpwH/fCifYluLWRHrWPgMz0VNeQHPUMp9zhk/koIi4PuxSbVw?=
 =?us-ascii?Q?X+Mioi88cuTsSkOQy2CZOYAhSunzxn3JzWOP9Nq7sYeE+MBfizxssygmj27X?=
 =?us-ascii?Q?5V472JJQfsxzRU9DaUny8YFntclAki32rAgKH2uBR5GKJANAZ35DHM8aV/4I?=
 =?us-ascii?Q?LXhfwb+DQGstiD/KYZStQdkTykT6w7ihsofKMsKHJAckEO8LLaFDRPfaZQN5?=
 =?us-ascii?Q?OTcrdVkVoY2Nd0TxMObxCvHt7Pbb6QHLLKZsVvtEeTJFMDE/HDPzqvM6/5FP?=
 =?us-ascii?Q?Jk+zHZtSQNbajkLcF/iOKHV5Uu3F0VD6TQ+Po8HxdS2xagsAD51DO/bFddbX?=
 =?us-ascii?Q?UHyKh/x36FZOfQ00jvUQ//bNT0nuyvhrRW2lgjhy/Ywqe6wM0+IzgZpO/y5j?=
 =?us-ascii?Q?pUctozTI8nuupTC4nrqrSePEyORpLQHjaGYg6xUBvdlFRlKf9ILc8l4wmvH5?=
 =?us-ascii?Q?tZeOMU87Q2n3htpyM0zI/VKwrwU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5D88C7ADDF3F6140BB4B20D7AD82E8E9@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 461d9183-9fdb-4c8a-e8d2-08d9fab99590
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2022 12:55:23.4362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 Xlu5WKuaQpFG+SEjZyaVP71Fo9fBdSnXdXW+fK6mlb2jWjcGQCAuk3yRL0UPba1K8fYQecM7oOIHPW+S+1AU6bWXB0c2wPMdBn5ze/bnIlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR05MB9229
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Feb 2022 12:55:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95568

Hi Jeremy,
thanks for the patch! I've just applied it to master-next and if everything
goes well it will be merged to master after some testing.

regards;rl

On Thu, Feb 24, 2022 at 04:23:34AM -0500, Jeremy Puhlman via lists.openembe=
dded.org wrote:
> Update variables to use kirkstone variants.
>=20
> Jeremy A. Puhlman (5):
>   Switch compat to kirkstone
>   jaxme: update variable names
>   xerces-j: update variable names
>   commons-configuration: update variable names
>   commons-jxpath: update variable names
>=20
>  conf/layer.conf                                           | 2 +-
>  recipes-core/jakarta-commons/commons-configuration_1.5.bb | 2 +-
>  recipes-core/jakarta-commons/commons-jxpath_1.3.bb        | 2 +-
>  recipes-core/xerces-j/xerces-j_2.11.0.bb                  | 2 +-
>  recipes-core/xml-commons/jaxme_0.5.2.bb                   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>=20
> --=20
> 2.33.0=

