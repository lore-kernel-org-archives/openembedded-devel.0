Return-Path: <richard.leitner@skidata.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850B1C433EF
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:58:01 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.99])
 by mx.groups.io with SMTP id smtpd.web12.9007.1637164678610512192
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:58:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=UtdNlMD5;
 spf=pass (domain: skidata.com, ip: 40.107.7.99,
 mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyVEXKkLiuYScUNaTBRxukD33ziQasYgFXqweyIhqcLM92J6s0R3ml6LBW+7UxJMRzBB3qqRfeHDW26hbcbBpkvTpyVbQ0zffUnNEBZtdJIJn/eeW2AIT/BZA8iHHzNOhE2HwYQ1AFa38GI4pzKMoJQg1RIXaMW0ehdDgfd5Sxl4PEO4uhz+cFmxCw2GePsFWStrZtpXsVRBQjQN8Zw3BWggpUvc5toHqAbwtFOykkhonztgB/XiqISFspwp4ZIDkWoG32XQiAHO/DZMPh9nh5RJ72zMiEdKUjnV3uGC/8fj/2ZCl+qLUcyMZC9zPRkf1lK5Sha9UADVav2zizJPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKvIeAcQ2h7ydhTjUoyN6Yual9PocNyU7yVWr2ctkU0=;
 b=oBsHj98SWcbz4anQBaQfzrPsoVLY6KwipYucubc7exyoW1etwXwIlDl0uiHI0gbbwz7BKNaWCRRdJI531OIsDzq9PX+CLyT5zUfa/ao+/ByRSvkaeVjdIXFJCMBYX1YSoUHRyAQBfODl5dmGkl9ebjHpIJPvhm1vfruM4H8uDpUV688oKq6Dz1nqOCY4CchNXyrpfXpMqQHEPVdBSIKdj2EiAyG0o9HoM+1KDrdHK9YP4JOEyfzOdBZpfHEkvlNhIcjOj70xuqEgcUGZW4U+fuFT/KdVyDurYQheEu+dm4JqFOiLMgGatiFaO8/U1C+yVOf/vxO7ak4Gd4p4HYUiYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKvIeAcQ2h7ydhTjUoyN6Yual9PocNyU7yVWr2ctkU0=;
 b=UtdNlMD5tJc0s4Sc3R8R3wdpsXtw8KOKcetqaz/0j/TR/2GIGBLOvvFFAjv+a1EFy0QKUHjeLuNpmlx/+5uXTEMDEKNzcahM6+WfSn0P/CXX1n0uGrhi5MMypRQUd/au5ckTToyPY4tAT7mb5o1LTaqpCtaxOhnz958LP/dN4IX26xz/MXB2Tg+2TAQ4ciHVM++ThmJ274XoZ+pmLRGhTYCFjjSIun3zRxzbrT/EHg5DVWFkS8rVwpUPt+T/dQ9wO0erdvHYP1CsGLTS+ENPFHFVKn5hE8Zj9T0ieiIWI1hlJZkZ3KizpVjmB/pYNlliT8ROfFhm9mZw4Pb3ro8O6A==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR05MB3152.eurprd05.prod.outlook.com (2603:10a6:802:1b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 15:57:55 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::21d9:e4fb:d0ff:8596%4]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 15:57:55 +0000
From: Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To: "geoffhp@gmail.com" <geoffhp@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-java] Request to pull honister branch and override
 syntax commits from master-next to master branch
Thread-Topic: [oe] [meta-java] Request to pull honister branch and override
 syntax commits from master-next to master branch
Thread-Index: AQHX2d0Uq9f1rN6s80OQGJfiPm/JlqwH5AqA
Date: Wed, 17 Nov 2021 15:57:55 +0000
Message-ID: <YZUmg2oqYa/btYrE@ltleri2>
References: <16AE031C14A64EBB.21980@lists.openembedded.org>
 <CAHNuFG+QkyytMAp+9LGLtoBmFX3ztug2od6OBqCcwvR_=T5nUg@mail.gmail.com>
In-Reply-To: 
 <CAHNuFG+QkyytMAp+9LGLtoBmFX3ztug2od6OBqCcwvR_=T5nUg@mail.gmail.com>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab52d5fa-a7d8-4b6f-2058-08d9a9e30515
x-ms-traffictypediagnostic: VI1PR05MB3152:
x-microsoft-antispam-prvs: 
 <VI1PR05MB3152616444CB100A2B8773B9F09A9@VI1PR05MB3152.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4WA0s7cwpuwyeR3ATC/zOCps3NPArdr/KXHaQ8Qgd6EKYKk1a5JNE5YYGB5XKWAbc/Xyy9wVojOzt/zAVbf0Z5C8DEFqkOKE3aMLz/0ROd3mCijWmtU4m9nalaonaSPtPTZ7AuEuPEYdqbRcz+7DYDFD3cEFiDpNYfezGJVHn1iaf6RltmGfW8pJfX09dT7VpoGb5BCWz1q63A+rLuRrg9yeEyNza2t0XxD93N6TgyWkftyckCRlRxsl6BdIEZUA/tXN9K0dUOKG2G0glkdYfDvn4MAAmB6ltYwvFu7V4JkJrjLm8es2lxIBVuGDCJooKDWLn5hLf2I3VD5YoXuziFtHcbEe9TX5W70R21jZdLJjSnqZbQg8dZGXr07q1ZRwkTrls3/EYWEXIu++jWKdarFC1fJcIsC18DyveTxOgx2aCPK+lbsJ8zvabAo2CLMd91yeBzj8ZOIxnRArnrf9b2kB+U2W9msN/+H3juFpXhPduoOBlg9W008u+i0EP7wZAns+uGiOmjz+7uKRBo5l2UwaQqKctxAllgpo03PoCJqBG+4bOjyDpQ7aMXrnSnbWS+m8+aWhY8k/cpu3n1cSFhpxhycDa9+CXA7uqPMxjtHVGoHjXF/f5T4ztHZAxviMiIC22yYlJ3ZgxxQZUODJDBydrKrfL0VlBbEBZRHLHYANfQ2XDRBuCLJqhNMyWKtLkzrDjHytnnQZNw/mprfejg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(64756008)(66556008)(316002)(6506007)(66476007)(4744005)(66946007)(122000001)(66446008)(2906002)(6512007)(26005)(5660300002)(4326008)(76116006)(91956017)(6916009)(38100700002)(53546011)(8676002)(86362001)(8936002)(83380400001)(33716001)(508600001)(71200400001)(6486002)(38070700005)(186003)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?AT4w7E2SHzaz0EYywSe5KEuxaAbxS+P3MCl5P7Pq5p8flleJ51R5GSsbV47U?=
 =?us-ascii?Q?YFNROJRcKG0m0GuExJqvzBRHOtS1ncyluM5aAg4T5PpS2IUELVmwBlJxL9qy?=
 =?us-ascii?Q?zO+i0Js9gl2RwhCVRj/xF8WW3RiqSJvhbExnecL+EYQDj+vE1UVNaoKW4EN/?=
 =?us-ascii?Q?06txXCCVg8q6UsEONS3Cdwragi211X1Y64AAxZ+e+rCf/iIAqdhwpfTlbnoS?=
 =?us-ascii?Q?fDL7+fMnPHq4e+PF2/9ih/fkiurBmLJhahZEjh0R67qjrVqBHT2mLFQQLssH?=
 =?us-ascii?Q?3MGGetBmLTgd23tp8dLDsCqfUC3XqN+LRfewxeM2UZc0O8RKGbq9NXxcrDi5?=
 =?us-ascii?Q?uEMy7Fohhk8pG1mMOfb/mxMqpckMQdBPSxEIlvzsLM7B8TjH/Wm2rovSCCEM?=
 =?us-ascii?Q?wIEdjE3lfQC3l80cwksC3QmIKYXtVJ6PZeHnk2NEtZpqywzCjlb6PSzFiIPn?=
 =?us-ascii?Q?QeTl2tUvC3/Y/+iX2ARtuZ1RcTSu9W50i7mIIdjHiY/Ngll2rvN5s82EwzvE?=
 =?us-ascii?Q?6S/QUfPtoP3uqYth+Jq1eiRhM1lhOANVz5+0KENlG1E2QoKwQBL52qeXl6fB?=
 =?us-ascii?Q?o/QvlkFWFQ3Pam36Qutw35qCfVv61jQ8iB5DGwEnVh9i0XuzrGq4FhDSjoCH?=
 =?us-ascii?Q?KgLzA+dfJ9hNTgSN/J1oTV+pKQY49pln+9IgTImfP1ht8I5Nmw8ruo+LzH4Z?=
 =?us-ascii?Q?bghdmOE7ZgSi7GDsNe0EW9ncuOD+ffJksBAmnPPoH2G4bUB6XkH1O3NwjUVr?=
 =?us-ascii?Q?4kixKZZFMGbfYMwhjFy2rbB/UqTdExsAeVmZirdREKziJtNmrgwM7729bZbJ?=
 =?us-ascii?Q?8uk/3mfQUZhNYadj7wvYon2VKpsrb7N1VO+SJmJ8wWIRrrpekJqX1XqeMF7E?=
 =?us-ascii?Q?BcC/2UUtEBoeEBA52qu2e+OiooF+UhBMmcvOlXrdAt7cyta/9RP0DQ6xKN7K?=
 =?us-ascii?Q?vrkGCZD3VepT717vxXqp2uGeIUi+VWFQsDgKZSOEaAncT/JYdNFlBlAY46bT?=
 =?us-ascii?Q?tnNTH0yjdfdJse2A+S4PXecDoYD+k2cSx25Kz7WqFQLgYHsG+3eCe3V8bhpi?=
 =?us-ascii?Q?kHlA0u7evlkMmyoNAs9009BtpvoHetm7bPqTTy4/KDyaL3WuQCcwXmVdP59y?=
 =?us-ascii?Q?hqey69ouFhyrwGXH+vLzd3LA7dTf+RYlHwFYQDZCaqAubpel4njwxMHRqFN8?=
 =?us-ascii?Q?73Tn3meCdoyqaNqJuVxiW59vinAzzskEak4jjAD8Z9tz4yKke5ioWPIyBHrp?=
 =?us-ascii?Q?Vn7JAaPggaxDWeQdiKm59fW3+q1JsJnBankBv1RScCGrWybm7MNoLClqmJaO?=
 =?us-ascii?Q?An1Bvzg8Ae90dTvXpTXeN5eNT5lSi3Nk08u3ZWHd4GN+fanE2mnP+RxnYNlz?=
 =?us-ascii?Q?SZi55XgxsSGvoh4uQhn24WDxqrCRvzCacU9Ncr7Y6u15Qr9xALCd7ivhjSQ0?=
 =?us-ascii?Q?RY7nZ1KGyH+Ed5NQj2ZY83YouyxP5LdWXamY04Qk6EitH7Pt/vZCyQpOxuDy?=
 =?us-ascii?Q?PawHL75qa/XS0/IJugK600Waf8QYTEFISpdVNCznuDWQeed38otGvUzwQBVw?=
 =?us-ascii?Q?9/QCB259BDUzSfYEGKGWGMV6CqFh/ZqRTmkxuPBdFdvh1Vi0tbpYdMRDdsQz?=
 =?us-ascii?Q?ewxWIEzDD+ii8+pWwoWdR9WN2ueRxJLFwGb63V0DL7Ztc/NfcDQ+zlzHCeZG?=
 =?us-ascii?Q?bpUlUZ5mK12bi2H8ah0Xu5RVPXA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5B47025A48498345A4CE57E755B5376A@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab52d5fa-a7d8-4b6f-2058-08d9a9e30515
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2021 15:57:55.6362
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 WJ6yzBTV9hRfO+kgSkAAGWj4THxABzAnqRY9qoovzX1qWqTVYRDNq/tCgvzqR9ZWUYEyO+AyT2osGqQDNPf0OQUF9JtSQCSCa2ZTxvBfvRw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3152
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Nov 2021 15:58:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93999

Hi Geoff,

On Sun, Nov 14, 2021 at 08:55:41PM -0800, Geoff Parker via lists.openembedd=
ed.org wrote:
> I made this request a month ago, still no change to the master branch
> so that builds can be made using  meta-java with honister or master
> openembedded layers.

Thanks for the reminder.
It seems my CI script missed the final push.

I'm sorry!

Everything should be up2date now.

regards;rl

>=20
> On Thu, Oct 14, 2021 at 2:32 PM Geoff Parker via
> lists.openembedded.org <geoffhp=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > Request that these commits that have been in meta-next for a while get
> > merged into master of meta-java  so that builds using meta-java can be
> > built with master or honister core layers.
> >
> > 147677c layer.conf: Update to new honister release name
> > a1eb2b9 all: manual fixes for new override syntax
> > b71a986 all: run convert-overrides (0.9.3) script to convert to new
> > override format
> >
> >=20
> >=

