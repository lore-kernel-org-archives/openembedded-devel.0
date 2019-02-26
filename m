Return-Path: <fsnow@phoenixcontact.com>
X-Greylist: delayed 79102 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 Feb 2019 14:25:32 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50063.outbound.protection.outlook.com [40.107.5.63])
	by mail.openembedded.org (Postfix) with ESMTP id D4D8A7C81C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 14:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phoenixcontact.onmicrosoft.com; s=selector1-phoenixcontact-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Nqgm/6pMWDGC17N9irXD+5GhxU2YI5/pR+d/lJbIPBM=;
	b=WWBH2KA+Iokf1CQTyv8DO5eB7i8zH7T7NMsa/Gr1kTbNzIcjDnvx/I5T0ejSxJrktV7AD1Lxfnjj+bqj5NCpCh3A4MwdSjupEwmtT3Bb5HmNHj/SfmjAZjN0iXEKD2VdBO7Mz6B8qG3r54ArCojlZ9e+Y64vWRALBOkpOm/hOgw=
Received: from HE1PR05CA0243.eurprd05.prod.outlook.com (2603:10a6:3:fb::19) by
	VI1PR05MB3455.eurprd05.prod.outlook.com (2603:10a6:802:1e::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.21; Tue, 26 Feb 2019 10:55:24 +0000
Received: from HE1EUR04FT006.eop-eur04.prod.protection.outlook.com
	(2a01:111:f400:7e0d::200) by HE1PR05CA0243.outlook.office365.com
	(2603:10a6:3:fb::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.14 via
	Frontend Transport; Tue, 26 Feb 2019 10:55:23 +0000
Authentication-Results: spf=none (sender IP is 51.136.18.164)
	smtp.mailfrom=phoenixcontact.com; lists.openembedded.org;
	dkim=fail (body hash did not verify)
	header.d=phoenixcontact.onmicrosoft.com; lists.openembedded.org;
	dmarc=none action=none header.from=phoenixcontact.com;
Received-SPF: None (protection.outlook.com: phoenixcontact.com does not
	designate permitted sender hosts)
Received: from azr-iqsuite12 (51.136.18.164) by
	HE1EUR04FT006.mail.protection.outlook.com (10.152.27.20) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1643.11 via Frontend Transport; Tue, 26 Feb 2019 10:55:23 +0000
Received: from mail pickup service by azr-iqsuite12 with Microsoft SMTPSVC;
	Tue, 26 Feb 2019 11:55:23 +0100
Received: from EUR04-HE1-obe.outbound.protection.outlook.com ([104.47.13.53])
	by azr-iqsuite12 over TLS secured channel with Microsoft
	SMTPSVC(10.0.14393.2608); Tue, 26 Feb 2019 11:55:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=phoenixcontact.onmicrosoft.com; s=selector1-phoenixcontact-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JSmqHYc7rwRwFe8O4G2RdnA/ZZItykbHVK6m2PSX/9k=;
	b=YW6Z6IjtG2hAZ0NoVX+uyFf95zaMU8v/xA3xlrG2rVeg6k7XNoFqhZgpzcG3X760+Bxmbv4K7cbDAPzIw6wSP9xWqczh+UqbN8/RHBTA+Llo2X9iQVOjs/SokHtZYjPmtut07qvQjA+1Jws21x5oL5rTX2Uvqoa58JsjnKu6nHM=
Received: from AM6PR05MB6357.eurprd05.prod.outlook.com (20.179.5.150) by
	AM6PR05MB5336.eurprd05.prod.outlook.com (20.177.197.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1643.16; Tue, 26 Feb 2019 10:55:20 +0000
Received: from AM6PR05MB6357.eurprd05.prod.outlook.com
	([fe80::65c1:8a3e:3f16:9d95]) by
	AM6PR05MB6357.eurprd05.prod.outlook.com
	([fe80::65c1:8a3e:3f16:9d95%5]) with mapi id 15.20.1643.019;
	Tue, 26 Feb 2019 10:55:20 +0000
From: Felix Snow <fsnow@phoenixcontact.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: patch to upgrade python-click to 7.0
Thread-Index: AdTNwDWCDaZL5V4uTXSJiiVlUD3TfA==
Date: Tue, 26 Feb 2019 10:55:19 +0000
Message-ID: <AM6PR05MB6357CFE97A9BBF608B59C261DB7B0@AM6PR05MB6357.eurprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=fsnow@phoenixcontact.com; 
x-originating-ip: [62.157.123.101]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2612b18f-901e-44a7-cbd8-08d69bd8e88d
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:AM6PR05MB5336; 
X-MS-TrafficTypeDiagnostic: AM6PR05MB5336:|AM6PR05MB5336:|VI1PR05MB3455:
X-MS-Exchange-PUrlCount: 2
x-ld-processed: 6868843b-f012-4c95-a18e-bab826cca9ac,ExtAddr
X-Microsoft-Exchange-Diagnostics-untrusted: =?us-ascii?Q?1; AM6PR05MB5336;
	23:ruM/co3o8HxX/+FeFW4x0nhmC7qD9cJIRhRNwuV7o?=
	=?us-ascii?Q?h2J23ZU1q/LJd+dEcFUgn9N4fFBdt3bNCvVmqMOTQUXzB8ng72OG2iCqVjGD?=
	=?us-ascii?Q?fbezaRcRWyR2Top2hfhz+pMM//HZ7g4m/cOLaIYptFrqZrE6BMkg7cryPDxD?=
	=?us-ascii?Q?d6OKy4ctlWQCQ87+gmTrPH+Pme6z8LRsS0J+mpu4I59df45geMP512PFTBw9?=
	=?us-ascii?Q?ZgsY5ujPCX7BtejX12/BSOKLwJfsOzH7wN03i1jW4M8hLCDFi9PYddcWhUm+?=
	=?us-ascii?Q?p88gr30kLo1SeJcb8gtObzq1mlWe8fRo13G5IUXLukSQF6mwS65SOBCvxbfG?=
	=?us-ascii?Q?sM/Jp3oYWeo59lpSmJztPhVPX5XT6Oirq0xIHSPpgPmWq0ViyXUcATxCtDqL?=
	=?us-ascii?Q?eQswRcexcg1LXWXd8gFcD1NYoUrAzkOzdhv+D/HNcEji7pZvRoMMWaeTyVPJ?=
	=?us-ascii?Q?Oy/tNAj+VwVpsA9ppC51mCdWaDE/3kTk9XG+ADJxnRVNxjjm7Ge4qGFaFQTb?=
	=?us-ascii?Q?zz8nIEf21H8hSrnLD7qPw4VbvSDIH5LZevSm5WuJ5eJz609Lr2wZnjArq4cf?=
	=?us-ascii?Q?Qyn1vbas3/UDGNEzzD/J7rjhCtf/gN13qmRLyfh3MSCxh/hDCHc3wNd/J8Cf?=
	=?us-ascii?Q?QQQBEmT4QSO18Xqit97Mzz6xqDm882ffWvxSQLfOlbxn5639wjkgpiPHn3mK?=
	=?us-ascii?Q?Xs3JMcNjDJfl+O09i+YMwAme1hr0YV1aUG7kvFwWLPBlWIW2liRbNDE6YM4C?=
	=?us-ascii?Q?v+6L2f4WmgYaP7qsn/6rordBCNfb/lKGNXQc6U1ZcysLxYC5fTEL5v9vRd/N?=
	=?us-ascii?Q?C/gJ284WoWEFfcsKERrniGUOmH8PTDr1NgE0K/x6NYFrm5aJRaBonkHV2AxM?=
	=?us-ascii?Q?HkKudFeTKoBaHVSiM6P15Y4cxo9RJQkO7CfNcaVy2zzZ+osYRcp+2dCmpBs0?=
	=?us-ascii?Q?Qao9snCOScaxY3BtPXE36pgS53+p9e3VDV88eI6NYKZ+GsCN4nIzU2cWxoVl?=
	=?us-ascii?Q?4bxfr5RXRfTMp5KiyRjgQTr/d2HdBaNn5z4OJ3iGwe4eU9KqKXpKrZNGGAFu?=
	=?us-ascii?Q?ilmwQO3TB9IE0PQMMGkk/n/wxMO2dfr4uZG1GGaNNzvyfF9g96MWLbn5ImKQ?=
	=?us-ascii?Q?qUVpvHI6qUBmJ1KG5Dj3Im/cSlRSDbuNtHI3Kno57FPZ9sLOyh7KJD+LI879?=
	=?us-ascii?Q?vrJBXmTvswABIk/kGqHTcQPabbgL667OSZzsM+YJYHsh3wSEsI6px7ta0Dc3?=
	=?us-ascii?Q?U+Q++pQ4k1tpU5xyC4aRXGfXDg3tZutnApHDpjJ0gK9nq+Of4Vv5c+5ugis8?=
	=?us-ascii?Q?kONsn4H1UAobeMHGrFxMpcES+tyH5GtzTMlZ+0qQTyAyAjLgT7T0kIba+MOo?=
	=?us-ascii?Q?2d4oQ=3D=3D?=
X-Microsoft-Antispam-PRVS: <VI1PR05MB3455BADE04DA6EC12A126110DB7B0@VI1PR05MB3455.eurprd05.prod.outlook.com>
x-forefront-prvs: 096029FF66
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(366004)(39860400002)(376002)(396003)(136003)(346002)(43234003)(199004)(189003)(2351001)(105586002)(106356001)(66066001)(966005)(478600001)(14454004)(316002)(19627235002)(102836004)(5024004)(256004)(8936002)(476003)(99936001)(21615005)(486006)(5660300002)(33656002)(6916009)(26005)(186003)(97736004)(52536013)(74316002)(8676002)(2501003)(7736002)(99286004)(81166006)(81156014)(7696005)(6506007)(68736007)(71200400001)(71190400001)(2906002)(4744005)(86362001)(606006)(6116002)(55016002)(54896002)(9686003)(5640700003)(6306002)(3846002)(790700001)(6436002)(236005)(53936002)(25786009);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR05MB5336;
	H:AM6PR05MB6357.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: phoenixcontact.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info-Original: jHWNy9oC0p5nTxYRm6id472YJXbuu49ZkZ+fdDINeM+ptCZZRgpL369tiJpdZlhUGT5Z7wPvc04mqE73+5H8GuKHwV7/tDQVOUVCGxZA211CL18NXiOmtSebe1NUIIpUSIwpak84RmdG2UwjOr3qQZTED3QjgGN0z/b4T3/BieP/a57eyCLfxg3Hm3uMgEAWmoL6R5hrQKARFY+K6629HGZWPesx3cugCubeN0FrMhtygyQAN6G1L7j22qAEr74lHWC7l8dBzWXAtl6zFN95V5z1d8/NkgkwvuBarMSbJ8KPMhHD2WO4CJXMqqKDA2Wapw0pzmKZQe141BtGPW9UjfU5NQpgSiPBj2KAy13qau5tNNjcop5JYBHFbE0VlLABDml1o7r8XUU5st3t9H1Cf3cYAnOiC49Hjgl5XdILCvk=
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5336
X-OriginalArrivalTime: 26 Feb 2019 10:55:21.0878 (UTC)
	FILETIME=[C50AAB60:01D4CDC1]
X-GBS-PROC: wH5/Q9YdK2SSOBYJVsQzpOdIXbv7jVhEzL+Ahd54aeI5US++Sk5kTnrHyvJoTaDL
X-GRP-TAN: azr-iqsuite12@800B6FB80896463A8BA4BAD19C4760E2
X-iqsuite-process: processed
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR04FT006.eop-eur04.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:51.136.18.164; IPV:NLI; CTRY:GB; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(376002)(39860400002)(396003)(2980300002)(428003)(43234003)(199004)(189003)(61614004)(33656002)(3846002)(2906002)(790700001)(55016002)(316002)(6116002)(7696005)(36906005)(356004)(74316002)(336012)(2476003)(21615005)(66066001)(5640700003)(7736002)(9686003)(33964004)(478600001)(71190400001)(66574012)(606006)(966005)(53936002)(84326002)(14454004)(54896002)(6306002)(102836004)(99286004)(16586007)(126002)(476003)(486006)(99936001)(236005)(568964002)(26005)(2351001)(235185007)(5660300002)(8936002)(2501003)(8676002)(105586002)(6506007)(81166006)(14444005)(106466001)(68736007)(86362001)(5024004)(81156014)(97736004)(186003)(25786009)(19627235002)(52536013)(6916009)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB3455; H:azr-iqsuite12;
	FPR:; SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7eb5c204-540d-4800-2ba1-08d69bd8e66f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(710020)(711020)(4605104)(2017052603328)(7153060)(49563074)(7193020);
	SRVR:VI1PR05MB3455; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR05MB3455;
	20:1NApAZbr6ec69e1MNKoo/bC2xNlyZH5Dj+BUoK3hdyGbUZYbGkkVy8Uf2LVa/znpXPc3Ib3ZV9JjX9FIbI8edUEvOFhU4DvojgYY9Ti92HGcYgDfUZgbbSE3xTVnYGo+R1MWww8miEpTrorZ1e6tQOjak+hKTVvHdTwRwTa3cU31//xu0asqu4rjnfYQ3hwIxWuSDwyuMtFFkCX4NPwU7Zpk89p5FMRXn8BL13DoOExUIS6xSSpeE0RvaXHF5sT+4qjfsXiinojDFAzrpKxPE63L5+Jz6b+DsUi1CKnhYg7iBQ1ZHhG49mU8sFR5ado+33Zyx9paQCu6ZkSIE6klQt0vjQlQwMFHDs8HEhXZd3mEZT6AB5H5WekRFpH93/2Tm++/LnJN1M70odbUD/6cEktI1v1pxKgU3DP4Ss2V/DJTUKONQ/1LwWs+0FnkIPGO9u8/UEACp2yCQCuV46P3pwPn4KCGbQ/+YeYlsZuRbv+rZqDkmLO+adq3+RWkuP7Pe5242b/XgaomO1QWZBXPCGk8TzjGK24e3rSVLXIDD8w6b+wlgc2Y5uoyMccDBZUeDBf6lofnQaeitd8N6rf8nhzkUnzultlTFh7LbI5oX48=
X-Forefront-PRVS: 096029FF66
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR05MB3455;
	23:PKxOn483oTY6ezoU5dd0OeFgEfhERkYNmg6rkDiQx?=
	=?us-ascii?Q?k5We/eyWsVmbbCmEoZIMjMnQH98GFIX7pb2FKEq/y0oMspwcSuTTOX735r/B?=
	=?us-ascii?Q?1kz8HB8OtoRWdRDb+d6UVF0Pli33M/zy6N9Cl879N0aGdM0T50lg+VNXhZPJ?=
	=?us-ascii?Q?nBJV42Kyz0ZsbgvOJSj23je9vKC+6tjQCfamYxBrIkOo67OWu9OF2N0zapIv?=
	=?us-ascii?Q?Ef9hqzbYuCgZ3fV/BqBVjl0AZMtDx1F3jAbeRJevp4KE46pB+ojxuqYIvU+/?=
	=?us-ascii?Q?XfvqTmHeHF6d6MWXOq54nIb8woLmkUPNi+vaEhSPl/nDYz1DtXw//DQs6bPN?=
	=?us-ascii?Q?aAfeXdaCIvysyL82jPRkIF6Ux9EDDUD+uZg9VFbh+gIhRHfZ1FylXzNTubmh?=
	=?us-ascii?Q?OMnHTXnJ1ILUkaGHuadS5Z635iXWC/ZD2izqiUdB76PKDduB37M8vlumvNCM?=
	=?us-ascii?Q?twToAfQ20Fj1L1BiGHT/1CW/nZSces587Y0g6qnT/E29gfJ6KAzLAySbr3uz?=
	=?us-ascii?Q?nI/cZ+LaFAf+f6Lo0Uz/UnJV5sBy1f6x6sRcSlmcMMWWU9CITXEYDj53jW9R?=
	=?us-ascii?Q?EVo01JE8JVByLOcZAtfN2to+vGYVvQte9Ic4tAXpZ186dzX3cAHT+/vgndQn?=
	=?us-ascii?Q?4wxEoCWStG1CzewASvFpbzSyyaqe5jfqzTYRfxGCb5yTNb6BlJjJp9Lt8/Yd?=
	=?us-ascii?Q?HeHwf6jmY9YkEsLoS19rph+Oc7efwbhfJ79yQutqjm7sYkVqaSDVfi/B4tpS?=
	=?us-ascii?Q?MWCny6BcgRV7C5Dm1/epm1lA/fzICLJlL5kssewU1UEAvHwpoAGfRQwlY9Ll?=
	=?us-ascii?Q?MBhu9mxJQZWpw7ESEkVj+8MxjNWtn+iH/FwOZTLYBNvJt/H/15sEH4m5dWvh?=
	=?us-ascii?Q?Re6bJQVT7NkkzfDVkfZ+QfhNqnz25U4kjOdHkGgi5pzoHYSH0RJHPabmAde7?=
	=?us-ascii?Q?v8V13gce9p9GByElSktXKl3Es/vi8wMbtwFzPqC0h7GWMQd7XgEb5ssyfaRU?=
	=?us-ascii?Q?lGk88oZ4/MdKbRST0FhFuEjLPprp0YHVqlAQ0kbKt9Fyt9Lqhj4erygagQcP?=
	=?us-ascii?Q?WUK1LHlSFm0TALEsJdDRBrbusNUgoZHmQj79+wmrdkA0/kCBEoScqOGxNsyB?=
	=?us-ascii?Q?924UA+BtNvi+mKVbhT4t1NNYYLSvoMDaAFsGodIJb7f8FeEYOu2pcvB+dU38?=
	=?us-ascii?Q?TwpeI18kuI2u2qF/sgfZ2LuvLzVAwwQb0HQghtbscFUB5NjoCmIMGxyJ083s?=
	=?us-ascii?Q?PNspkb9D9w/uLMgJiFCS3rk34oudE93IN2R3XDCrSuPPtiLwhUkmaKnyBJV5?=
	=?us-ascii?Q?lM2uxZVotSoStiBmNA1E8+ZBZm85hKsJC0K3o/ghCsGLENN63a35tVA0tTKW?=
	=?us-ascii?Q?L8teTlI818/gyVzpp7ho0TtxyanGHA/rNuR3hkC0plGwimN3eTJB4cCCHefb?=
	=?us-ascii?Q?G00VJE79XjDuRJ3js/wMiMt15G0Fu4RY9rhrHk7FAPtTBkP6cwzrEOrWslqV?=
	=?us-ascii?Q?mUi8FMcrllP5V9xCuoMW8qjDOIargqCEkeiAI83f1ukO6kPiQtBVyZdpr2Xq?=
	=?us-ascii?Q?ySw8WePuIE+W8NMrh2N3TvVBRdoUcmmyoBpKJ0=3D?=
X-Microsoft-Antispam-Message-Info: v5JHDtGy0Ez2Rr+fWv/G93W6g5DUt30jceeKyssSXl98KzuMU0FxLlvBwBNLsdZ6uDqKmewzckKmx4mIhfJR/7I8y14QrX9oZcdTzYL55QHDfDoL5iAxypjSUZ9D+RwZeZMPrLGoZqpoEHxMkgDUUaJ5fF+B2qcjfqDGJVbPnjk7z/tn1sKl4Mes4wrDj1w3DznzygRKUwxAnipkQTVCXcgFM5aORd3ePHDSL7+fY9BwQmwIdbfytZymk5Os3gHE+5GH4UT3y/lUDXY/VyZRfdYucc3EM5ujFxT05mY8Zi9HYgXoCHFdd/D/Sa18G9JGm49N9k00Z5sxEgr/eXIALnFAMV77iEUWbu7vl4Jusggw/y4YOjvuuPOceP3C4SgVD24bIpvcnfAvKL9DzV+mOkkfO1KKQH7jCw87P5KIEyk=
X-OriginatorOrg: phoenixcontact.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2019 10:55:23.4910 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2612b18f-901e-44a7-cbd8-08d69bd8e88d
X-MS-Exchange-CrossTenant-Id: 6868843b-f012-4c95-a18e-bab826cca9ac
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=6868843b-f012-4c95-a18e-bab826cca9ac;
	Ip=[51.136.18.164]; Helo=[azr-iqsuite12]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB3455
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: patch to upgrade python-click to 7.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Feb 2019 14:25:33 -0000
X-Groupsio-MsgNum: 76523
Content-Language: de-DE
Content-Type: multipart/mixed;
	boundary="_004_AM6PR05MB6357CFE97A9BBF608B59C261DB7B0AM6PR05MB6357eurp_"

--_004_AM6PR05MB6357CFE97A9BBF608B59C261DB7B0AM6PR05MB6357eurp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,

attached is a patch which brings python-click to version 7.0.

This was initially discussed in the core mailing list -  http://lists.ope=
nembedded.org/pipermail/openembedded-core/2019-February/278937.html

So I first made the patch for our system and built it without errors and =
found that it worked by typing in

python3 -c =22import click; print(click.__version__)=22

at the terminal which returns =227.0=22. Then I cloned your repo from - h=
ttps://git.openembedded.org/meta-openembedded/
and carefully brought the handful of changes from our patch into the file=
s there and created a git patch.

So it works on our system which ultimately draws from openembedded upstre=
am and it would be nice to have it patched there rather than applying thi=
s patch locally. Am not set up to build and test openembedded here sorry,=
 our system has its own yocto build system. Am happy to look at it again =
if you have any issues with it.

Regards,
Felix Snow






.........................................................................=
..............
PHOENIX CONTACT Cyber Security GmbH 
Richard-Willst=C3=A4tter-Stra=C3=9Fe 6  
D-12489 Berlin  
 
Register Court: AG Charlottenburg, HR B 202908 
Gesch=C3=A4ftsf=C3=BChrer/General Manager: Kilian Golm

--_004_AM6PR05MB6357CFE97A9BBF608B59C261DB7B0AM6PR05MB6357eurp_
Content-Type: application/octet-stream;
	name="0001-upgrade-python-click-from-6.7-to-7.0.patch"
Content-Description: 0001-upgrade-python-click-from-6.7-to-7.0.patch
Content-Disposition: attachment;
	filename="0001-upgrade-python-click-from-6.7-to-7.0.patch"; size=2324;
	creation-date="Tue, 26 Feb 2019 10:44:16 GMT";
	modification-date="Tue, 19 Feb 2019 10:38:03 GMT"
Content-Transfer-Encoding: base64

RnJvbSA0OTQyYTBhODc4N2MyOTVmNjBhOWQ2ZjgyZTUwZTA2NDU1Mjc3OGM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpeCBTbm93IDxmc25vd0BwaG9lbml4Y29udGFjdC5jb20+
CkRhdGU6IFR1ZSwgMTkgRmViIDIwMTkgMTE6MDY6MDEgKzAxMDAKU3ViamVjdDogW1BBVENIXSB1
cGdyYWRlIHB5dGhvbi1jbGljayBmcm9tIDYuNyB0byA3LjAKCi0tLQogbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrLmluYyAgICAgICAgICAgICAgfCA4ICsr
KysrLS0tCiAuLi4vcHl0aG9uL3tweXRob24tY2xpY2tfNi43LmJiID0+IHB5dGhvbi1jbGlja183
LjAuYmJ9ICAgICAgICAgICB8IDAKIC4uLi9weXRob24ve3B5dGhvbjMtY2xpY2tfNi43LmJiID0+
IHB5dGhvbjMtY2xpY2tfNy4wLmJifSAgICAgICAgIHwgMAogMyBmaWxlcyBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24ve3B5dGhvbi1jbGlja182LjcuYmIgPT4gcHl0aG9uLWNsaWNrXzcuMC5i
Yn0gKDEwMCUpCiByZW5hbWUgbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5
dGhvbjMtY2xpY2tfNi43LmJiID0+IHB5dGhvbjMtY2xpY2tfNy4wLmJifSAoMTAwJSkKCmRpZmYg
LS1naXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY2xpY2su
aW5jIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrLmlu
YwppbmRleCBjODE1NDViMTUuLjYwYmM0NmY4MiAxMDA2NDQKLS0tIGEvbWV0YS1weXRob24vcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrLmluYworKysgYi9tZXRhLXB5dGhvbi9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tY2xpY2suaW5jCkBAIC02LDEwICs2LDEwIEBA
IExpbmUgSW50ZXJmYWNlIENyZWF0aW9uIEtpdCIuIEl0J3MgaGlnaGx5IGNvbmZpZ3VyYWJsZSBi
dXQgY29tZXMgd2l0aCBcCiBzZW5zaWJsZSBkZWZhdWx0cyBvdXQgb2YgdGhlIGJveC4iCiBIT01F
UEFHRSA9ICJodHRwOi8vY2xpY2sucG9jb28ub3JnLyIKIExJQ0VOU0UgPSAiQlNEIgotTElDX0ZJ
TEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9MDllOGI3ODY5Zjk0YmE5ZTlhN2IyNjBk
NTNjNjVkYWIiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnJzdDttZDU9YzEz
ZWQ4OTBiMjEwYTg4MmMxNzc4MjE2Njk0Yzk4YzciCiAKLVNSQ19VUklbbWQ1c3VtXSA9ICJmYzRj
YzAwYzQ4NjM4MzMyMzBkM2FmOTJhZjQ4YWJkNCIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmMTU1
MTZkZjQ3OGQ1YTU2MTgwZmJmODBlNjhmMjA2MDEwZTZkMTYwZmMzOWZhNTA4YjY1ZTAzNWZkNzUx
MzBiIgorU1JDX1VSSVttZDVzdW1dID0gIjdmNTNkNTBmN2I3MzczZWJjNzk2M2Y5ZmY2OTc0NTBh
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViOTRiNDk1MjFmNjQ1NjY3MGZkYjMwY2Q4MmE0ZWNh
OTQxMjc4OGE5M2ZhNmRkNmRmNzJjOTRkNWE4ZmYyZDciCiAKIFVQU1RSRUFNX0NIRUNLX1JFR0VY
ID0gImNsaWNrLyg/UDxwdmVyPlxkKyhcLlxkKykrKS8iCiAKQEAgLTIxLDMgKzIxLDUgQEAgUkRF
UEVORFNfJHtQTn0gKz0gIlwKICAgICAiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2
ZXNkayIKKworUFlQSV9QQUNLQUdFID0gIkNsaWNrIgpkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLWNsaWNrXzYuNy5iYiBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1jbGlja183LjAuYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbi1jbGlja182LjcuYmIKcmVuYW1lIHRvIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbi1jbGlja183LjAuYmIKZGlmZiAtLWdpdCBhL21ldGEtcHl0aG9uL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtY2xpY2tfNi43LmJiIGIvbWV0YS1weXRob24v
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1jbGlja183LjAuYmIKc2ltaWxhcml0eSBp
bmRleCAxMDAlCnJlbmFtZSBmcm9tIG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtY2xpY2tfNi43LmJiCnJlbmFtZSB0byBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWNsaWNrXzcuMC5iYgotLSAKMi4xMS4wCgo=

--_004_AM6PR05MB6357CFE97A9BBF608B59C261DB7B0AM6PR05MB6357eurp_--
