Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0916BC41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 16:40:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.62])
 by mx.groups.io with SMTP id smtpd.web10.762.1703004003532051639
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Dec 2023 08:40:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EvQv6Oc3;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.62, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmUmsokdedphEluBiTutSwia1vVEF3w11cAuniruxetPnqNJQJ48ILZbGqUF+v6pcKniYCsPAPFX6a9MUcfupw7BFWQwQP7Lj4psvNhmC9uLQgtv8/i+81bxORI0ovsKaksMbk5RAulMNULaHarPKnGyF4iyEP37kH+jiX4jjg3vxnWedv9dIa5neFqA9uHqASYruAjb6cic/NQ6S+YoLVjwNJsVj8b1obHDlWeQVy5CcUqlm/0CJ5RWkeEQeAcdGDbdi1LGWqdIa0AdBGAZSPaOO05HOFRQEu1XkBDV39UEy3qTxCbPF3pfnnc7DGy3Ci3epVClonIRpOTuKvKFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9PePCY0ILLEdvEHXqE0NRdd527cdyyl5VRkFb6iA3g=;
 b=nWh9hyKVW9rA9bPOQulZRy6ciQueAdVZ38FcY25xsvm6YY+j5kj9PSvjvuCrd9Rxb7UDV8oOqfEDD2zMfx0d44iOx+yRLtNOkVF4tWAeRabm5GbtuzK3Wm2Y4O0gOWoHxzXm08YH3R73H4cin58q1AoHJYaOhypZmurOFu5EB99UozH8/qoKlunbau9QgNO/unmD6TPa04Lo1E+cIEC+Lv4qy+M8BkYldWRuuf/b8rFve5gP8qGiV/6+xt+EtNg8xJLyRkPcLiVkYCak1mWA7PT14rU6LP1tGBT9dU+gJ5+8ppJsVwRxyNtref8KtlXs3VLkbX8Yg5a87piioAuimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9PePCY0ILLEdvEHXqE0NRdd527cdyyl5VRkFb6iA3g=;
 b=EvQv6Oc3M7BekV7yJkI2v5cf1Pa1h021Oz1rbFG66k2fyAp4JW0mzc5FyFv3n06AnA6xjibaIInGy97llxB/4H1GlkQQFOa49Ps+MOZkcsrUzCkAtCXJCK5pTgfxcXIJa43AegGxF0eATqNhm1+GTBVERGN0s7MXBdWDYN9kWTunxF7qyy+yvTa6FknPnpUmXSKw8MEF/8c3gFpnybtCJz9LGNcTr7+C/HLOm3OmdY7wAMBjSQ8RbPNOfSKrsmx2mYeoKe0iejnzs0dyQfuPRHLhMaW98gy4RwlHoXO3VUJvYrixIrSchniyElKK/AQQRKoWYLfxra7CGgg39Fe2WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by AS8PR06MB7719.eurprd06.prod.outlook.com (2603:10a6:20b:337::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38; Tue, 19 Dec
 2023 16:40:00 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::820:f7b6:7f2b:324b%4]) with mapi id 15.20.7091.034; Tue, 19 Dec 2023
 16:40:00 +0000
Message-ID: <339cc73f-0f06-43ee-825f-c5556f11974e@vaisala.com>
Date: Tue, 19 Dec 2023 18:39:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] pkcs11-provider: Add recipe
Content-Language: en-US
To: quaresma.jose@gmail.com
CC: openembedded-devel@lists.openembedded.org
References: <20231219155119.3859157-1-niko.mauno@vaisala.com>
 <CANPvuR=x0pi8KNgk1cmVX=W6ffAAh=522iSNRUGqhFD=CYXa_Q@mail.gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANPvuR=x0pi8KNgk1cmVX=W6ffAAh=522iSNRUGqhFD=CYXa_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3P280CA0071.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:a::6)
 To AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|AS8PR06MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 058a44b8-333e-43b2-6440-08dc00b12490
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bnk/X5fM0DsZrsoAODpqevwCRGXGQloWl2gtPbPgtLVnzh4XHf9CsjIimhwcZNsVnks5JOcbP8QQuQFEn28+96E94rB3tP890wMkoZXAg5pvXiyCeaQJmL/a0W60uNkdLpehnGqozfFIuY1qnkhV3uTUkdgL/LgPyFdO5zyMZip9ojcxaOAy2rqg5yAcdnRqBhiVuOT2OUskvoCH6pBZUmcKstEH+jcELpBQNiXjucQSWMfcqNtt1la/mrzyUFdUs4pvfzeTRvYGmksCFiHGdb5JsWMW8uYyRi6nK3YJrXLgMVBnIis/vbg1O5QVfL+Zxw1g1vttDHs5W/sOIeSorJt8zKFQavhgyftJLhQ34dhX+wQfCoPpP7+dfsPUBlqWb9gHg+VQV1MKYd7iq/8f9R325cuu0Z95DHYz1OF0P4exuaGQ4L4dcaGqfRFe5jVb9q6gGoisAeQ21EEPWXhJ7Fi35wNWzMjXxsEzlajz9rpJ44fNS7GnXW7fZ5IrRGkHaqrjOhiGZrtQiq1Prg4mhUreD20LZJJuyy/MqxUrSfEsJ76DhhF1zQ8Pa+hBLBqmCxpxpMAaMBISI9T3irn9NH6IUHm+2Moaop6eMTn3unrELsRJ+AGMhxk07a0PwXJeP8yeld2fKVdKpoSp40/XLg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(2616005)(6512007)(26005)(38100700002)(5660300002)(8936002)(4326008)(8676002)(316002)(2906002)(4744005)(44832011)(6486002)(478600001)(6506007)(41300700001)(66556008)(66946007)(6916009)(66476007)(86362001)(36756003)(31696002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?10tHpHYRgdWcpbKfx3IfhrXJuZApePFgHcAm5wWJrOmmAZ2Ar4wyht18E3/d?=
 =?us-ascii?Q?n5AG/Sud9tMZ1hp7SNXPzgCq0S2GKc7vUGOOqBOx2mH1K2hIAdeOsLO5K+KU?=
 =?us-ascii?Q?ES3UKoqY1cM+E50pcqFL0aZQFN6XVZRkp1Xnuj9OShPLQOaY3zJw7HznluMG?=
 =?us-ascii?Q?QJG3sbsEQM1yzUh0y3lApp08Ek3AIfBNOfK6bGa/SjfvxH6XzxsZcgRpzcZB?=
 =?us-ascii?Q?LdF6dU6FV7bDPS0Qwbx6wvamZti3+KdlBGqB2VXkzZ71ya90En+zCetgv5Tj?=
 =?us-ascii?Q?5AHQhZX5EFyw7xBLTEB36vfgbYJYaLmFWYImtVyUZ7IzZ8DwGwdseKHccCre?=
 =?us-ascii?Q?JAFZlyh7Lld1A86roKWSLia072KQsH97jEHVWBuCWVYVRUqKOEut3ggR/JWe?=
 =?us-ascii?Q?2yNsHjIOWQATf9l6PU/1zw1lwjUuxM0q4cvS9f9AktVkPEwLVzoVtlOjDEfR?=
 =?us-ascii?Q?aLZvRyDmK2RhlolPw3TElLiGvirDLIoU3+gj6ryojQYiYbXyazdj1G90sCas?=
 =?us-ascii?Q?xxyDw/PsRq7tHxCg2kXSXutb8MibfeIkh67prLeTcApbvAGwm+ptYWuL3hxv?=
 =?us-ascii?Q?bWK2G3OKjAuRZYCQQImJATIyQBZkti/oPwZbJ83UFQBTGpiFjh8GoufHjRIy?=
 =?us-ascii?Q?7xmw9DpVRrxuqvgCVDeTVB8iLtPASH9m7zo7F+XQ6bzz2Ds8HygiWqhcaaCZ?=
 =?us-ascii?Q?BEsjcpgxW9FBOp+B7SUDmjZehW1gzIPcv9Y4taHgK6DHCAe025G5ky3SYnWZ?=
 =?us-ascii?Q?0sL1w/vInLcvg6CjmcrIUZA///v7rWgdX1uxnmIjfUJgpGUZmekArz7sgQsE?=
 =?us-ascii?Q?2RwmUQL6UgO1LlZMFkSCsxZ6GIVijJ1vdon+PSUD/T24zpZBELXTsyIM/s/C?=
 =?us-ascii?Q?DL9Qh4j6+tC+vrkzlpvLc2LZr9TODeR43GRL2gt+2B9RfygPi7KfbS+4dJVY?=
 =?us-ascii?Q?QNA/WRDJyz1e11kB/eK82btfkY7mw48C6Z5+XoHKoh/o696IZwai1JExeMcG?=
 =?us-ascii?Q?TZqrb0ZGNpJ/Tl2Zs8H88DmeUpflJLVTksq7Z3M0OExjiiGTduf0xzVeGQ56?=
 =?us-ascii?Q?0062rG2JnT2WX0aJEZO37AVHBQs2aq0zGSxbAw5oYCDcpT1AjjKV1xa4K8sO?=
 =?us-ascii?Q?yYp9+BE3aWePVis27macxRmnHCoW9WDgJ8xuyM2e3TBEb9rFdEasFkcvDqs2?=
 =?us-ascii?Q?+3uSmfCs6WB0fbwfErQjQsDgENBnnAKJEQH5BZdKHv7VuwG5KwreRPPZGoLq?=
 =?us-ascii?Q?qBMv9pSvxF6Ay6BaxdEmjFYkM4mtgD9MH4coUOTaG3AQlmPkyBPyPrjbHF8x?=
 =?us-ascii?Q?5Qrple9D7CY00x8USHs7GO+PRtvTerYfVjffTLKm7NHv2ms6LzAsOeMpI/W4?=
 =?us-ascii?Q?0Eqnq/ufZUri/0GSqDiC+sOMj9wq0H+KETOZZr+ifMLjr5yN7XKVI2ihsyNh?=
 =?us-ascii?Q?4aZ7jyHUfxDlmF5F56K2JqngUJJ+ZzXhjYjadX+J5SdH5iDZRIey9Hpyw3ju?=
 =?us-ascii?Q?vnrKiAwOLodEJ/QCQ9umn5Hcz+1XNE+46WvcgAstKmY9RiVqjtP34pUWm0tT?=
 =?us-ascii?Q?3zAttraCR3lmc02lKH09z6eQGblGjq4FAs5KkvhWUD1doiX8qpEOiyM/1DfC?=
 =?us-ascii?Q?Nw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 058a44b8-333e-43b2-6440-08dc00b12490
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2023 16:40:00.4627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z+hKdRuyfe8QjM9KanJsqK2J9xvWW51Qojp/61R5KdtB8TTYC+GRfPxkiJA35irr/uoCk9znL4IKKttMgvSncg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7719
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Dec 2023 16:40:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107640

On 19.12.2023 18.05, Jose Quaresma via lists.openembedded.org wrote:
> Hi Niko,
>=20
> Can the gitpkgv be removed and used with a bbappend on a custom layer?
> This is not strictly necessary for the package and looks more=20
> aligned=C2=A0with the product.
>=20
> Jose

Hi Jose,

certainly, I have now submitted v2 which omits gitpkgv usage.

On related note, I have so far assumed using gitpkgv makes sense as it=20
helps to avoid non-deterministic package versioning for recipes that=20
bump SRCREV value without changing the base version. So I assume this is=20
not considered an issue from the Yocto project perspective.

Kind regards, Niko

