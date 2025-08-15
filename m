Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 049FBCA0EE0
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 08:09:09 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.4])
 by mx.groups.io with SMTP id smtpd.web10.7186.1755245348326418020
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 01:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=PKu8gMXd;
 spf=pass (domain: siemens.com, ip: 52.101.69.4, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vib51TioaQRpYaoV61f8flNJzMXGm1/T8IMC3xyYCBKv+sHhRCGOzZ+ewzPoplE1AjuKr+aQsN91CihPir+ZZb7bwr760SNdCJNh3EPjMvrY+bR3zdEe1M7/AeChHbRiLaK9EdR7NpMbKfQ9ML5x1IXMG3XWrjaR5F8acLE9IyP87UtY5DJMn1o6OUqHf5opDeyTzfA3PMRtm8KyMwBdomw24D/jM2Lh0YyepJjG4fQG1ZcOp1wvjU8c0GM6xH2WE4BqxpK60N1HQUxsHeAOVX22mjhXEQR03i8BZ/GylJX2T8HQ1A1TAzG5o9FTeYeKRZv/slA9bbfLZ75SMQ+sDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Asl+H+LY7lJjwEU0dwRF1W6stxyq7MVf+PIswx6yuRs=;
 b=zEZinLQsewOfHpXTEUhOdgoHOrO/Cvf3w6GyvwAR5OvhlJBkqPWriNaRswbizeZULn4QFZ0XEmCowoTw4i5GNHvOAehZIG2/zCtVBh4XTMvlWnGR+B56ktosI62d/0S5LnT61l45ytTBYcsMHdtFsnn2G+ufdM9yuTt79DHdSjrsy8kE7tfOEUy4ndeo5myQHpW0+7YtsiT1GFtrvHujMGDqluAciOOA5ylAA79PK832oNEg9r31oZlKHzE8JEoUfC8Y+NQwjn0ZQFseCzw5woh1xx5kNUgregnsZXh79BFdqniUlz3dPRm5hCQmglyecvpWbtwwX72WMUY5R8sOzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Asl+H+LY7lJjwEU0dwRF1W6stxyq7MVf+PIswx6yuRs=;
 b=PKu8gMXd8FlWHIZG1sVcrQLqC63gt3EoFmaH53eWJwTv7WWVWNzKz7/u9ZPGQnTIfW+pIL87FDjrRyIg9/c7UQ3YrlnS9F2VA2C9yCM9WqRItaIeUijrnMrGtEEA0nIVm1vG4WqkOpfqWn0m5GEgXFEBFcabUsQs+fkottZCa74V8hlioe69Octw5eo4Lmnej5VvK+DqAyKRgFhL9okrlwZ+PqyPiHDPbSoo6gy8TDihhZSAEQv8mIBsjZckAwgnIXSUg2QfVeHiW9jEowfwxZ4lH/txW9hhq691UEwZlE5hU5YjA9PRMoRUUTwcL+x+/DcMEEQ8Eyle5bvKeFBlHw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6248.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:561::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 08:09:03 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%7]) with mapi id 15.20.9009.018; Fri, 15 Aug 2025
 08:09:03 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "Lau, Karn Jye" <karn.jye.lau@intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fetcher
 conflict by using SRC_URI.
Thread-Topic: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
 fetcher conflict by using SRC_URI.
Thread-Index: AQHcDZsLPP8TZUoOrk+X1krjohD77LRjNfGAgAAEpGCAAACpEIAAIPQg
Date: Fri, 15 Aug 2025 08:09:03 +0000
Message-ID: 
 <AS1PR10MB5697DACCAF2B06BE08BF72ACFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250815041114.481650-1-karn.jye.lau@intel.com>
 <AS1PR10MB569789D04BA92FFBEBDCB664FD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <CH3PR11MB870248A4F751C67B94D9E7D0D734A@CH3PR11MB8702.namprd11.prod.outlook.com>
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS1PR10MB5697355DC7874A906AB2E20EFD34A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=79510229-3cbf-47e6-bd6e-de6256f29579;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-08-15T05:51:00Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6248:EE_
x-ms-office365-filtering-correlation-id: 0ca361f4-04bd-4592-5015-08dddbd2ffdf
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?f6YjF6FKY2spfcYWOiq8I1STVuQD50PzWYI+HF8x+z/yYa4uIeIQyZ34wOeR?=
 =?us-ascii?Q?zhzkCMXM7taBra/kk7PPC23XL0xL2XpaSdCsHTEjBehrnn8k6ZP/ezbYYitA?=
 =?us-ascii?Q?JztedhkmsrMiI4aqPGrmASLnxaj3MVZNZNTmTPsOexNjleh7GKhtpu+nWvcn?=
 =?us-ascii?Q?VUw4lQBDvx0TJpKzNi2ayngyzRvebMGzog46pwOrMpslXR4tse6VgOGg82AV?=
 =?us-ascii?Q?9oKIomw9iHbJwyeGLtLFHowtNG5MjwKDYpkn64k25hGTs/BuiFv7N6KUT2tz?=
 =?us-ascii?Q?giACjs0aIrzfEd3n2jddjNDtCPl2YIGK9Ni+pyTA0WIktosWHBPv2/zjmvrt?=
 =?us-ascii?Q?hf+tfCrT4HmLcvZuKCBua0Zl8ynPhL5h7zuFdbxPQrlGyGF1HgamUDZrkmtt?=
 =?us-ascii?Q?0N5GmiYOY1XjkqgRF2GyHh9Zgb3cjqjoxpEpFI4ycl1Wjt8cTaEJZqBTF/VS?=
 =?us-ascii?Q?YyQPfQnLxAHPzQZm9so4YyooGmOUhMvCfM+Fl1wIcpRkHSwhxIEU0Q1GiyEr?=
 =?us-ascii?Q?2apukAld1cnImHd8AUS6W5RqUIAqUeJD/wfK/bphOH6E+JnP8ZuIpQoPAcim?=
 =?us-ascii?Q?E5rgykVGKNIclBtVklKXjSEsTg68BAYWyIia7WHFsG7QaeSwL5HV1esfgH4l?=
 =?us-ascii?Q?ZmfN6dnAJSJxtQgPzLzl9LY8hGHJO0YpiOH4+uB/QreGDCPu239raNHvFCg/?=
 =?us-ascii?Q?Da8Y5qzMCg8prbfOGx+p9It51YAaUxpVseX/T8yvc/4SnMyRm01dEistoSis?=
 =?us-ascii?Q?zW6gLbuDm4F9QaQZVcBzVAEn0TUA3201E2C0zd/op9mGEC5lT2wjNdDH8RAK?=
 =?us-ascii?Q?0KIHPYBJPIqcjLAB6iE9hGoXF2ePXUBuUQTqpYzcZuc5YbKQm+cwzIH3CRy0?=
 =?us-ascii?Q?HfE0EuFta6+cw7zg/lRJKU8emiE++v+x/i+0VP6HFqrFhRApQw9i8vTG1mfg?=
 =?us-ascii?Q?Xe84OsFkewRL+Pcyf3+E4ayC1ABGm12iBgWrNQXm1s9bzxL2FPEh7aqV7lVv?=
 =?us-ascii?Q?OX7OaigFELxJQyq1hlcphe76wrSsBpftyP1x1BG4Qu4JdTMJEXHhr5TU13tb?=
 =?us-ascii?Q?gzB/upOf6Dj7a4R0pvWjPcgLKSNyZ3tZ7IJMVKb2Jg0fT2H7oFnLNEeqt9VO?=
 =?us-ascii?Q?JzzV+ynk90VqMlFXBCsIHj0Lhxp9UdEPQ1FJ+DnFCboPASbFqGry0m+V11/z?=
 =?us-ascii?Q?tUjA/cAvmaXqExvLaOgBbFtST0IUmA2JYzQ0Shf/a4jyhO0fNm6jGmd+hULL?=
 =?us-ascii?Q?BU48Agk/T8cjunM4kXTV9FD8Gk3gB/RgRZl7Mt2ACsRIlt6z+FwlPzlrrx3Q?=
 =?us-ascii?Q?fYMKlBGKi8nOjPq1hgeRqnk0ud/fOR1pR669A7+AHgttw7M4ew7CfnqNpuDn?=
 =?us-ascii?Q?LWpb5zqqW2NbyYyFMz0/vFcoB/MDXV4YLiO/lZf0atcRqNO47SzA9ErTgpuR?=
 =?us-ascii?Q?WNSckRWUyRSXTHO+Xfxah413cf1FBPDRpDECXuOUy3zuYA7joYs7ZQ=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?bhwuzoRe5Ty63DkCynX1EENR22nyxshCFibb87GaZO8EFtsWxMwax7Vim8lv?=
 =?us-ascii?Q?sLovVDFiGXWFugFv/z2OWVeg2ViUlnZvNiA7ZTI0j+wGKQXHTQN7B/Luh6sS?=
 =?us-ascii?Q?Ak2vfoEuLLaks7z2cMT2k6SPgydp5pKtX3I2jrTToezXegW/tK8SXR46CCjR?=
 =?us-ascii?Q?XD81Sm1YbmceITZiyMk0ZifXR3fr8pGIAvrOWO+PV7fzWhbqo4mr2chSJVsb?=
 =?us-ascii?Q?NXQst5HgjNQ6vqOOq0EQeq76sFjkwbELiqC8UEIL684DdrL4gSE/E/xDaOyU?=
 =?us-ascii?Q?PxAAQ9C9JdBxzy0Xb41FQc3Ly0dGRgJnKHCi2R8+gXJYwtSmBNONGDomeWNj?=
 =?us-ascii?Q?CsLx54c3sW5PJXWqCdzdDmstHnrXSkmQfnnrJrQEWV/TFjJ/mQam0Nclft6m?=
 =?us-ascii?Q?V0gF9Eg7mXKYcHivWBhdXoBZYCyfGB8GaPoQ+YX56FAQpgw1XjxcPxirSmyv?=
 =?us-ascii?Q?jRj6Dcqz5K/24Ia6GZ5hlr7eHXV3GUiS2Se2twCsEvSpmgQIG0w+enJYf4NO?=
 =?us-ascii?Q?wBQ3aLk92Q4cK6JniyH9iJIOo64QEnonaaKA5H1Dd/HmF17xG474auZT35Ld?=
 =?us-ascii?Q?kcSgLeAy4f6+BJLysy69mM5Q9HxES+/Bqnx2iLU6YiPdLDYRQoYvGCG4wZ9N?=
 =?us-ascii?Q?hujVWnMYfahEAgIiXm1zaSU4qC5rtRqf+Qi1mBHq3uNbEkR7Of6WsYnszHyg?=
 =?us-ascii?Q?tyEFv5AGu1N4ajPaTqdsR5fy7LPZJ3YLADtCj/CrLQSszeBop4HtTTt8ab/x?=
 =?us-ascii?Q?4c4zwmeLajVdc1Ga2WRsA+4316a1sQC2l7yYGtjUvasoV9AyXQgLzqUIgLap?=
 =?us-ascii?Q?x3FfYLQj+sXXBoCO2YznaVQPsjxCSrycWUVTLlebCsFjyBrPX6o6ouBOc+Bo?=
 =?us-ascii?Q?31h43nT12H8sun2OWkyQeNfit2aSf+YPdRtOGu7vkvx19uiFHv+19z5WLSGd?=
 =?us-ascii?Q?ecWJuORAmTM3XyKBdudvecS4WCCbkve52gTcvp0l8+mxuqd6QNhDr+vyyP6Q?=
 =?us-ascii?Q?ZuWpLjtPDLHZcnLGkEYAMVP6255MPsexXmYl0rT4SIlNrZjaEIJcxTax1e2J?=
 =?us-ascii?Q?UnKWK2g/bySW/X3Vg5eX+S9L0HbIrXIBtHDEkQaKBy48UQZnqxWNf40eFpRn?=
 =?us-ascii?Q?1sClwX73sgAh485k6rRQEtloWcIJ3ISQFjSnHBabm494BDv43N/WKFrItJGV?=
 =?us-ascii?Q?RwR49K4nOgqmX9IsMoX/ogCsezf24JXMJycgr1xFJRfIyRluM2cZqHQJ4Qj6?=
 =?us-ascii?Q?U2fmtuoTMIgu5HeW+u/O626wPZlb+7qu0x00XKzcxpmM5xYouUhN9AwcHfxI?=
 =?us-ascii?Q?DKRFnQjmKKZK9uRx6LHxBWNW4CZF4+WldHk4kbjQLuisUh/blBMwyLEs4ZjC?=
 =?us-ascii?Q?kmHrTaV0pg7oy8WIZegBW1prAeBwtv5I5F1UJFW6qpsvi28xo6vIke/4Gmkd?=
 =?us-ascii?Q?c8B+p7viEsflatDmEMSJx1sgG7P7LOUY+2R1h5to6U4/mtO8YwPFT/qK7s37?=
 =?us-ascii?Q?iLbqRtT5N4C7yJhgpXJ7jTjB0qLf4+Pk4FBL87uJ9CZshOzifurd0/feGHbI?=
 =?us-ascii?Q?7R0RGCgCRiRBbahXHC/K/4+uQVOOYAW3iyrS0103?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca361f4-04bd-4592-5015-08dddbd2ffdf
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2025 08:09:03.8574
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eKAFY1StykXX1To22sW7rpweoj0u9NhIuDr9k4QCmcB2ZLJNypD8SPgneg9NO5GHkn3Z1KdyEZpCprSQ+pnloQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6248
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 08:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118961



> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1)
> Sent: Friday, August 15, 2025 8:12
> To: Lau, Karn Jye <karn.jye.lau@intel.com>; openembedded-
> devel@lists.openembedded.org
> Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git fe=
tcher
> conflict by using SRC_URI.
>=20
> Oops, sorry for missing the scarthgap tag.
> This is good patch, I wonder how this got through the testing.
>=20
> Unfortunately, meta-openembedded LTS branches get updates only once a mon=
th
> so this will be broken trough then next release.
>=20
> Peter
>=20
> > -----Original Message-----
> > From: Lau, Karn Jye <karn.jye.lau@intel.com>
> > Sent: Friday, August 15, 2025 8:09
> > To: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>;
> > openembedded-devel@lists.openembedded.org
> > Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git =
fetcher
> > conflict by using SRC_URI.
> >
> > Hi Peter, it may working fine in master branch
> > but it not working at all at LTS branch for example yocto 5.0 scargapth=
, I
> observing
> > our daily build hit into this issue.
> > Thus submitting this patch
> >
> > KJ
> > -----Original Message-----
> > From: Marko, Peter <Peter.Marko@siemens.com>
> > Sent: Friday, August 15, 2025 1:53 PM
> > To: Lau, Karn Jye <karn.jye.lau@intel.com>; openembedded-
> > devel@lists.openembedded.org
> > Subject: RE: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git =
fetcher
> > conflict by using SRC_URI.
> >
> > Both tag and SRVREV works with latest oe-core/poky master.
> > And is actually encouraged to be used so that hash is verified against =
the tag.
> >
> > I wonder what could be wrong since this is a second patch for this reci=
pe
> > complaining about errors.
> >
> > Peter
> >
> > > -----Original Message-----
> > > From: openembedded-devel@lists.openembedded.org <openembedded-
> > > devel@lists.openembedded.org> On Behalf Of Lau, Karn Jye via
> > > lists.openembedded.org
> > > Sent: Friday, August 15, 2025 6:11
> > > To: openembedded-devel@lists.openembedded.org
> > > Subject: [oe] [meta-networking][scarthgap][PATCH] mbedtls: fix git
> > > fetcher conflict by using SRC_URI.
> > >
> > > From: kjlau0112 <karn.jye.lau@intel.com>
> > >
> > > if both SRC_URI & SRCREV specify particular source revision will lead
> > > to "Fix Fetcher failure: Conflicting revisions error"
> > >
> > > Fix by removing SRCREV and specify expected source revision in SRC_UR=
I
> > > by adding revision parmater.
> > >
> > > Signed-off-by: kjlau0112 <karn.jye.lau@intel.com>
> > > ---
> > >  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 4
> > > +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git
> > > a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > b/meta- networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > index 88b50a406..2591e2cde 100644
> > > --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> > > @@ -23,12 +23,10 @@ LIC_FILES_CHKSUM =3D
> > > "file://LICENSE;md5=3D379d5819937a6c2f1ef1630d341e026d"
> > >  SECTION =3D "libs"
> > >
> > >  S =3D "${WORKDIR}/git"
> > > -SRC_URI =3D "gitsm://github.com/Mbed-
> > > TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-3.6;tag=3Dv${PV} \
> > > +SRC_URI =3D "gitsm://github.com/Mbed-
> > > TLS/mbedtls.git;protocol=3Dhttps;branch=3Dmbedtls-
> > > 3.6;rev=3Dc765c831e5c2a0971410692f92f7a81d6ec65ec2\
> > >             file://run-ptest \
> > >             "
> > >
> > > -SRCREV =3D "c765c831e5c2a0971410692f92f7a81d6ec65ec2"

Could you please keep the SRCREV and just remove the ";tag=3Dv${PV}"?
Adding rev to SRC_URI is not according to current standards.

Peter

> > > -
> > >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
> > >
> > >  inherit cmake update-alternatives ptest
> > > --
> > > 2.34.1


