Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58920D66BB1
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 03:39:37 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.83])
 by mx.groups.io with SMTP id smtpd.web11.64438.1732678773008270800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 19:39:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@leica-geosystems.com header.s=selector1 header.b=D6eSVvE0;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.83, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d7czhEoAIEKvVj6GfzN3acQ59c3AetIMQPdiXQ+fm3KL0iT6Tr39lcNYR6AyU6Ts513qQx3ZFJEnjfomzjYA2TnVcS8isA+e1PGafma5qfRlsmmEIFTQ9cAUgiYo6a5CsNWvopikXV3nDPkKK0+HhfzzAz4OqDjFa/Z0Bs/n9lxiLq7n7RWIkIVK3gqFCpc7sO5uJz0HSK8ivfa5NvbOebmmsIH9j6ABLbYdMS5tG0zWc7Z5jp4hzQVsewWXAUsnxdpdr/qgQnLNCMUJQvRb9afrHPZxChReh7uQB1qGVy/jbGy+jtSRSqvrycLwOnaH59p8VJ5e3bsPEbGGB8Envg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OInjBOmtGWpP6MSiTl04z2uDZlshOISTRRGhYBnWfDo=;
 b=OlGJRxtGGcOZe2xrJ45x7EZeQGiJ3N+9/Ah0A412luvjlt+7U6Flv0vja8r5sha1mFyblRoHU2fWlKEue8yR5lgmK1Iv1GmCGBFs4tLoG/qy8a/w+8llmDxS0iWAd8bFm89qHJzHve0mk9W2N5bT8H9XVqU88coO8za8PBUIzRkyt6W9foxLGG7oFanBy95Cjp0qTRgJNogSVxFvDddnBky1G8xZbrcJgsGw6txOJw09Y/6J4QWG0kRSuP+mSMT2Nt0/7FwRn6wLExOoPDuf76VWZAr5MKv5FSQrQyEPFYGW6WmdJG48B5p7pfqqvHYYo77UcU06Pje7Qqs39FwcHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=leica-geosystems.com; dmarc=pass action=none
 header.from=leica-geosystems.com; dkim=pass header.d=leica-geosystems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OInjBOmtGWpP6MSiTl04z2uDZlshOISTRRGhYBnWfDo=;
 b=D6eSVvE04Dhvo2uj4gU3v7HE5cTC6BXMpRMcHKGWyqt0fFzh2g/CXLS0AodEXYYrEvOU3D2S/kZh5cNJnDvXLgPW3ubySz3X8rmsVWGvQ6Ltz9LF5Q2iVmA2eGh6LgK2mmhRJ/OF+UsXbbBZ3WVOsKME2j54MaBpQgYKQeTXuNQ=
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com (2603:10a6:20b:355::8)
 by PA1PR06MB9501.eurprd06.prod.outlook.com (2603:10a6:102:45f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Wed, 27 Nov
 2024 03:39:29 +0000
Received: from AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3]) by AM8PR06MB7521.eurprd06.prod.outlook.com
 ([fe80::570d:8853:c13b:c7d3%7]) with mapi id 15.20.8182.019; Wed, 27 Nov 2024
 03:39:29 +0000
From: SCHNEIDER Johannes <johannes.schneider@leica-geosystems.com>
To: =?iso-8859-1?Q?Jan_L=FCbbe?= <jlu@pengutronix.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, ZHIZHIKIN Andrey
	<andrey.zhizhikin@leica-geosystems.com>
Subject: Re: [oe] [meta-oe][PATCH v1] signing.bbclass: add certificate
 ca-chain handling
Thread-Topic: [oe] [meta-oe][PATCH v1] signing.bbclass: add certificate
 ca-chain handling
Thread-Index: AQHbLFZb5ma7eF5Ohk6cgKGxMWC2BrLJ3MKAgAC+uCY=
Date: Wed, 27 Nov 2024 03:39:29 +0000
Message-ID: 
 <AM8PR06MB7521EC2BB3A7EDB743AC4B8BBC282@AM8PR06MB7521.eurprd06.prod.outlook.com>
References: <20241101120514.185668-1-johannes.schneider@leica-geosystems.com>
 <993d5bc627151ecab7366454bc0fa0f02491cf28.camel@pengutronix.de>
In-Reply-To: <993d5bc627151ecab7366454bc0fa0f02491cf28.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=leica-geosystems.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8PR06MB7521:EE_|PA1PR06MB9501:EE_
x-ms-office365-filtering-correlation-id: dc91a7f7-b1f7-42df-7915-08dd0e95192c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|38070700018;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?kVw7SeMuA9VY7qdV7RF6BW2QXlJIJQCUXKXOD4ehtqVR0R2ZX02GqHhGFh?=
 =?iso-8859-1?Q?mRnU7yElP4Wm8Sd4CBZ9AZhLvztB7jFhC4oIL5yMcDOSd9rHg/vLr6IcGv?=
 =?iso-8859-1?Q?xB6MNhh7hAq9ps++6JMBFcOml6JRpZwQqXtMGIHZGy5hPITSv8tMvtB/SM?=
 =?iso-8859-1?Q?2U9aue8iFvP0RWEDz5qCA3YvFYhK0tut6wFcytodT7wxIMNbrl04disw+q?=
 =?iso-8859-1?Q?SCS7eooDz9ASEvSuh2EVtHiPXtOSwQNOmtrSFEmi4rlJt4g/+mFJXd3M49?=
 =?iso-8859-1?Q?YWeX4RlaaAhSlq9mUBbvQWWMNoT83Trqv9b5ygJ+SuWRTxXxNXmoIEqfHt?=
 =?iso-8859-1?Q?mkBr9zBnZ/PgVCa0jcXv9MzmUoNL1A0YpiykL8bH8v828NcZkmjBghUkZY?=
 =?iso-8859-1?Q?IvxK0276k/y5+HAW54NDCPj2E3Ci0ZAxuQIg8eIqSSShWbt/NW6MhWFKrz?=
 =?iso-8859-1?Q?w3OO6fKTx/P+bmFamLdQae8Pn2qdO8rHjMheLxIOgjYEQxlig2Z5CTiyum?=
 =?iso-8859-1?Q?JxOzJLD8DlPuqWUyVFXxR4L3WkfHlA2SljL0SSLYd7Xu80X83+qdJYyaBn?=
 =?iso-8859-1?Q?gnizVcEJ4nwAKPbbUu5VHW1LvOeZZ/V0J3nKk+VXrVIFRrl+UEjNWRkrON?=
 =?iso-8859-1?Q?gojZx8nLEkIcfaKsFJmXNQj1FhKWgCJhRMCfLeNdSRbJP6bwM3nX0lrM8U?=
 =?iso-8859-1?Q?m0hu83XJUc9lpbBwNaInA7tmnyWwfRpurxDSFlxBcgowKOgVeVKmI1/T/4?=
 =?iso-8859-1?Q?tl0V3s4kdzjKEqTQ9XgNDG7bbwUQC2R86POipMuepwk+c4HRMnDrRplykG?=
 =?iso-8859-1?Q?LdzMiA9NUhBQqL4PqNeZkMAGzFqWmYsu/2Olmpq4c0AZsVlOmA8H8EVsc2?=
 =?iso-8859-1?Q?BnHp6rcFJ0lXuZth1KozLh2JpVPpQ1NJVtrmuA+6NZhBA70knYaIQSRrKu?=
 =?iso-8859-1?Q?+Pu+9TY5TZhXKOQ+pxXlELMWZWPiDlx7CJZiIitz2AABa6zE7hGLx9RSOv?=
 =?iso-8859-1?Q?d7NF9U+1oCMu0OfyHXNItn0XAEUs38t7/xMS+KnPw1uNRDfulzVxDRfgFU?=
 =?iso-8859-1?Q?w8z9W8/pb9NIXfrmVRkzwZXxTYt6f97U6f1ikdEseCUFmNiYaNrunbN6mT?=
 =?iso-8859-1?Q?FAyD69MbAije3GwmBBIDsagcabyvdOTNfhJ4FWy08mWyclPgskvWqFkct8?=
 =?iso-8859-1?Q?9U84uG4j2qRBcBNijrCJ6JGKttkV2VVX+KGJqZwblLH91cI5gYQHtgIX3a?=
 =?iso-8859-1?Q?oBqCOoog9bmFhbVjnM6nt5l/gp2yNgOy3S0+hz94Vl7K/lStyHpCHfpIth?=
 =?iso-8859-1?Q?wuOrpOiDZJYZRRnExUUh6fNZ0JbTEw2YZwhfOzIY03A+7JP552rdUVJ0yK?=
 =?iso-8859-1?Q?aHgH7sy7d61vcNDe8qvymBcBlIPgY73Hpr16VF0wgbDG75OO5pLY96a5+1?=
 =?iso-8859-1?Q?yt4gmNtEaLf3lruhJEgsQrdgw+rrJqGAeZtaVA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR06MB7521.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?cNdW9pNs4vFAMnk834hcuyEx5qel59EZ3PyVeJpUfZ57+92aqmtzNJuPV5?=
 =?iso-8859-1?Q?2cTLw4M9Wg5jiKOQJm0x6PG8GTqp0QKKzIzqfd07LHOYGEO4gM+P6Qzh50?=
 =?iso-8859-1?Q?KjidiwpfnaCcr/wDe4msYNAzzjW8ROSu2V717FphYGpOJADUYykknc1kYE?=
 =?iso-8859-1?Q?6eDo6AuzveCmqMsight07r1IXSi/acPQyFG9vdp26HcAiEagwJ4ucqDcwP?=
 =?iso-8859-1?Q?gDUjLxY05nOsjoHoLLO6j4NGSDOBrgEsookreo+sXIZHI8WVxuBXQePzpu?=
 =?iso-8859-1?Q?9+X3eRLck8nSRlI74acZw987W5yMZsYhTkHO9Typ/F3UofdjXlGEtl4WPq?=
 =?iso-8859-1?Q?WkvNiBJ3dnrFa474/00pmhyjtnKlWRf4Ehdyev4+Rg/bPSLcsx2kZpawnW?=
 =?iso-8859-1?Q?2vr+uP9itIo4tRrFVkHZGrZnLrFLwMlYqffprJSuLLQFJ/Z+S/uVmfBrgH?=
 =?iso-8859-1?Q?/WlI+9M2dvjtuC+CaxEeAh8tY846+GdGHgoNfyF4q2weUFEmt9wVdwCQj1?=
 =?iso-8859-1?Q?w3g/H2z7lyPf4CSAfI+kIA13+5hcPeCGb6OIF4T3BMWdR7xNYwgSb8ue+s?=
 =?iso-8859-1?Q?xeVjx2te8AcjSY13cvVYREWl/xFK5aNCv1cz03mp5FJJpZncNQg0ob0vWE?=
 =?iso-8859-1?Q?B9Lotfq1UPWL7WK7NHl2L94/mRHyfiuV25QDGCNwwJlatWLcjMSbe3aQ3P?=
 =?iso-8859-1?Q?0zoKzo23XTPvCCG3QqU/4IfMFJVNUn93wfE9S7rzKq/Za6Q3oQMK14lQER?=
 =?iso-8859-1?Q?F5SE3x34i7oX9IfYeS0zkWsPW5V+bfi/PqfrqcdfWH6gpdXeGPym7U+hiW?=
 =?iso-8859-1?Q?zUaEJgOLMpOLUkouMvCeQuD5EmzbIhh5/iFO1SsgLq3EyvCqHEC6qA9OJM?=
 =?iso-8859-1?Q?yLkWZZl/+3XtkpHsZ+WOAdpQSMdmDRWos8yToEdnNKkdZVjqI+vVsPQz40?=
 =?iso-8859-1?Q?hWlvUEXsBq4mnFXwhJJub3GSRt4bAg9KtmWHnmQxPyFdlTm2XJL2/md+r7?=
 =?iso-8859-1?Q?TXnKSAQjmv2tXwoiew/CP4rAAcfcOY2TnARQgeY5GJns0+AKSQXciwnfJd?=
 =?iso-8859-1?Q?r6Yp3d8N1UfBpoqM10t3dAPdj9MajN5pcZ4WjsA1Uerzlv/f8fYk1HKp3/?=
 =?iso-8859-1?Q?glnjVuo31ce/+7YSVT7RPk37gcoIYo76q8hxWcZRh3ceoUcSA7wZECnRZ8?=
 =?iso-8859-1?Q?MCya3Drl04iSvfne/s5H9bN4nJPrnNtJaT4BKnktJjEzkDckIdrzJdal2s?=
 =?iso-8859-1?Q?26XgzxQ9FAueynRm6ouzlIhya/jhx1Vi5tk0n/PV+Y9sYEd35bWhSeU+FX?=
 =?iso-8859-1?Q?04jNolTIW5DSLkFjb6H5YRpSi8zn7/RHYlZWanvQWL4aXVveLtkQ47+RiJ?=
 =?iso-8859-1?Q?3dGNZf6Byi8xrP9+XQYPxk2gz5Z34O61Kc4rH4V6NWg0g4KQulSpkIw3nv?=
 =?iso-8859-1?Q?yq41/8giV3qQLUsbQklV7zaKcOlAB0Bj+FBKANyIZBpCPbdPXq4xirTFyR?=
 =?iso-8859-1?Q?NsojIuEXAJIhEj8MdvyRpXU/7+6rRW69iic363kYIzHeloXCzyK6eSnkJ/?=
 =?iso-8859-1?Q?V7RXQcAbBm2u3HWwhYzJdLSmASxptuDs88TyrKxQ64GIRzV3ZKmgGee5BO?=
 =?iso-8859-1?Q?dNMgTZIdWMrtnM0B8Olx5EFKxDUOdqATiQCN3D+hig7TAt/7tAVCNRli0i?=
 =?iso-8859-1?Q?y/+EwW7xHx0uiTR4FDDuu0RYUt29kpuRcXFBuyMBq+WjQrrehKev6OC8Lt?=
 =?iso-8859-1?Q?+iiUkOxS5VpmDq70CrPst1wvU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR06MB7521.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc91a7f7-b1f7-42df-7915-08dd0e95192c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Nov 2024 03:39:29.1111
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2Ud8wv987bSF3BmsIy55mIigJ2dvM8QYkzTTXjAKX1m4p0DBm/sf5jmTkLZO7/wzV4MBrPH2GuW+krLu5Uk8y3+0pHw71hbfqK5LrO8uMvDjanYZxCX2o/DTLNHAvRnj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9501
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 03:39:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114083

Hoi,=0A=
=0A=
>=0A=
> On Fri, 2024-11-01 at 13:05 +0100, Johannes Schneider via lists.openembed=
ded.org wrote:=0A=
> > Add handling of ca-chains which can consist of more than one=0A=
> > certificate in a .pem file, which need to be split off, processed and=
=0A=
> > stored separately in the softhsm - as the tool-chain=0A=
> > signing.bbclass::signing_import_cert* -> softhsm -> 'extract-cert'=0A=
> > only supports one-per-file, due to using/expecting "plain" x509=0A=
> > in-/output.=0A=
> >=0A=
> > The added signing_import_cert_chain_from_pem function takes a <role>=0A=
> > basename, and iterates through the input .pem file, creating numbered=
=0A=
> > <role>_1, _2, ... roles as needed.=0A=
> =0A=
> Why do you want to import certificates without corresponding private=0A=
> keys into the singing mechanism?=0A=
> =0A=
> They can't be used for signing, so don't really fit the role concept as=
=0A=
> I intended it. This mismatch then leads to workarounds such as the _N=0A=
> suffix and the problem below.=0A=
>=0A=
=0A=
During a (yocto) build, there can be places where the key is used to sign=
=0A=
something, and other places where the corresponding certificate is inserted=
/used=0A=
to verify the former - so there are two different "consumers" of one role; =
e.g.=0A=
the kernel fitimage is signed with A.key, and at bootloader build time A.ce=
rt is=0A=
inserted into the bootloader so that it can later verify what it is suppose=
d to load.=0A=
=0A=
Now the bootloader<>kernel uscase is simple, because there is no verificati=
on of=0A=
the certificate; e.g. there is no need to provide the complete chain.=0A=
=0A=
But other usecases sign $something during buildtime, and at runtime this=0A=
artifact would then be verified against a certificate, which in turn would =
need=0A=
to be verified against it's CA-chain.=0A=
=0A=
By keeping the leaf (key+cert) plus all links (just the cert) up the certif=
icate=0A=
chain, the softhsm can be used as "single source of keymaterial". Otherwise=
=0A=
there could be a rift between taking the keys from the softhsm during build=
time,=0A=
but takeing the certificate (-chains) from $elsewhere.=0A=
=0A=
>=0A=
> > Afterwards the certificates can be used or extracted one-by-one from=0A=
> > the softhsm, using the numbered roles; the only precondition - or=0A=
> > limitation - is that the PKI structure has to be known beforhand;=0A=
> > e.g. how many certificates are between leaf and root.=0A=
> =0A=
> The point of the signing.bbclass is to abstract over different HSMs and=
=0A=
> allow flexible key selection at the .conf level.=0A=
> =0A=
> With this approach, any recipe using this set of generated=0A=
> (certificate-only) roles now needs to know how long the chain is and=0A=
> the PKIs with different layouts are no longer possible.=0A=
> =0A=
=0A=
That is the one caveat - the layout has to be the same and known beforehand=
;=0A=
should we add more logic=3Dcomplexity into the class to detect and handle t=
his=0A=
(... i guess: no ;-)?=0A=
=0A=
>=0A=
> Could you describe you use-case in detail? I think we should try to=0A=
> find a design which avoids using roles for certificate chains, while=0A=
> also allowing different PKI layouts between SoftHSM and actual HSMs.=0A=
>=0A=
=0A=
We have a build setup that, depending on a build-configuration switch, uses=
=0A=
either development-keymaterial, or production-keymaterial. So the (soft)HSM=
=0A=
encapsuled by the signing.bbclass and it's roles becomes the common interfa=
ce=0A=
through which all keymaterial is requested for artifact-signing purposes, o=
r=0A=
certificate (chains) are gathered to populate e.g. the rootfs with, for use=
=0A=
during system runtime.=0A=
=0A=
The intended usecase of the signing.bbclass is certainly to swith around th=
e=0A=
actual underlying HSMs (e.g. have a softhsm with devkeys, but a "real" HSM =
for=0A=
the production usecase) - but due to limitations with our CI infrastructure=
...=0A=
we only have a secured channel to fetch the productive keymaterial, but sti=
ll=0A=
need/intend to use the softhsm to "secure" the keymaterial on the CI during=
=0A=
build-time.=0A=
=0A=
> > Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.=
com>=0A=
> > ---=0A=
> >  meta-oe/classes/signing.bbclass | 30 ++++++++++++++++++++++++++++++=0A=
> >  1 file changed, 30 insertions(+)=0A=
> >=0A=
> > diff --git a/meta-oe/classes/signing.bbclass b/meta-oe/classes/signing.=
bbclass=0A=
> > index 3e662ff73..8af7bbf8e 100644=0A=
> > --- a/meta-oe/classes/signing.bbclass=0A=
> > +++ b/meta-oe/classes/signing.bbclass=0A=
> > @@ -134,6 +134,36 @@ signing_import_cert_from_der() {=0A=
> >      signing_pkcs11_tool --type cert --write-object "${der}" --label "$=
{role}"=0A=
> >  }=0A=
> >=0A=
> > +# signing_import_cert_chain_from_pem <role> <pem>=0A=
> > +#=0A=
> > +=0A=
> > +# Import a certificate *chain* from a PEM file to a role.=0A=
> > +# (e.g. multiple ones concatenated in one file)=0A=
> > +#=0A=
> > +# Due to limitations in the toolchain:=0A=
> > +#   signing class -> softhsm -> 'extract-cert'=0A=
> > +# the input certificate is split into a sequentially numbered list of =
roles,=0A=
> > +# starting at <role>_1=0A=
> > +#=0A=
> > +# (The limitations are the conversion step from x509 to a plain .der, =
and=0A=
> > +# extract-cert expecting a x509 and then producing only plain .der aga=
in)=0A=
> > +signing_import_cert_chain_from_pem() {=0A=
> > +    local role=3D"${1}"=0A=
> > +    local pem=3D"${2}"=0A=
> > +    local i=3D1=0A=
> > +=0A=
> > +    cat "${pem}" | \=0A=
> > +        while openssl x509 -inform pem -outform der -out ${B}/temp_${i=
}.der; do=0A=
> > +            signing_import_define_role "${role}_${i}"=0A=
> =0A=
> Calling signing_import_define_role() from an import function breaks the=
=0A=
> separation and ordering we currently use (first=0A=
> signing_import_define_role(), then import certs/keys) and is surprising=
=0A=
> compared to the existing signing_import_define_role()=0A=
>=0A=
=0A=
That is true... got any advice/ideas on how to handle this?=0A=
=0A=
This way the PKI layout =3D the certificate chain lenght, has not to be kno=
wn at=0A=
the time of the import, but only when using the roles. A separate=0A=
signing_import_define_N_roles(N) to have them prepared "blindly" ahead of t=
ime?=0A=
=0A=
>=0A=
> Regards=0A=
> Jan=0A=
> =0A=
> > +            signing_pkcs11_tool --type cert \=0A=
> > +                                --write-object  ${B}/temp_${i}.der \=
=0A=
> > +                                --label "${role}_${i}"=0A=
> > +            rm ${B}/temp_${i}.der=0A=
> > +            echo "imported ${pem} under role: ${role}_${i}"=0A=
> > +            i=3D$(awk "BEGIN {print $i+1}")=0A=
> > +        done=0A=
> > +}=0A=
> > +=0A=
> >  # signing_import_cert_from_pem <role> <pem>=0A=
> >  #=0A=
> >  # Import a certificate from PEM file to a role. To be used=0A=
> >=0A=
> =0A=
=0A=
gru=DF=0A=
Johannes=0A=

