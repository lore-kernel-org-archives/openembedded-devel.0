Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.55])
 by mx.groups.io with SMTP id smtpd.web09.8745.1611759255801671611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:54:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=AYUXM1Sn;
 spf=pass (domain: windriver.com, ip: 40.107.244.55, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfMuEYLNMDfLRG/nJN6+C1sAkhzWr3NSZPGRiA4YPEdMNrCXEYYiWEwpZcyDSpnBb19bLvaKVVaUZl5c9j/hnV3TQabOizRi0nQrjybClg1P3JQN9FNfCSuFV2vY5xYk2MHCAaD6zjEXoS31TDomQmwUrYJX+As9FUndOcvREn3ysazc/YwpCgOJNVWFUlBZF7geFIJPcMCf+fc0Zl2L5BluK3ymO34OM2b9sFqToUctgfOROdlml+kfTzBj0dsNFxpnchL8S6ktbmRgiItSATY2VQIuR8fbvt9Bl14G/p07Yn6l8z81flC0aA60h6RfAHsEPosV9qVA4yI+4DjNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YlWUY1Ah0RWptwW10zdhcJdwq8ckRhpMGjvSWQjUys=;
 b=NAhLDVrubhL478tIAUHxLy0nsV2lfo3emXKeTP2Wm2Ne20WHxm3NaHCAuGlDuL4VxQYAvnvLdToCGILcDCA2BWBg7lU+Rn2L9gk+Piv3QnNOcCI+ryqwU4GTLVqUlBTl7XrGUGbWGhsC4IT9IZAHyIWueaEBGKaG0Gy3v/R7E65b74KFHEO3uM7rKyjr7Hk++6lRKgsr0yAXOZPTHmlquMfC+EXmYSt3careqldXB8H5edr6YYVGB6SlEDkKxCA5VlyMCRCUTRK96RivZhKKdqvonyKcvHgcvGxRQ8ZsoDTOLGViujbyyK6wiL2rNdUZqmYNOpJ3lPzErbh9RQuMEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YlWUY1Ah0RWptwW10zdhcJdwq8ckRhpMGjvSWQjUys=;
 b=AYUXM1SnobvLU+pVo+9yH0HUs/ynK9Bf0fQKbQAD4tpAoG11RPvz4kE96rIM37CiJokNejZvQ9h2ZohGGg+/49dSHXY/beC++dyLNRegjkKlvzVQYTV8z8tq3Af6y95Gfn+8ZfPtw/0NT4ZHKaaJErFCE9iz9KlEso2NipCLki0=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 14:54:14 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 14:54:14 +0000
Subject: Re: [meta-python][PATCH 3/5] python3-send2trash_ initial add 1.5.0
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
 <20210123192513.2663547-3-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <36ede4b3-539c-cb1a-9cf2-003ded8724bf@windriver.com>
Date: Wed, 27 Jan 2021 09:54:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210123192513.2663547-3-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:160::20) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0007.namprd13.prod.outlook.com (2603:10b6:208:160::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Wed, 27 Jan 2021 14:54:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5a65d70-6897-465e-b8d5-08d8c2d36a09
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB31121BEA9D0746D954DBD7D99FBB9@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EhblZI8hKPVREvZWw7djFLfGYv3AeoHbP4hpqtGSjGAP4ksNL0E/ZEfnCSS/UEGT10lyZ69BdEy8U9JUMOsRculTS+KcFgYK4z3yaoNuUfExgwH3iNJhdOBnyy+aMUoPxlPt+7RVQwiNM/JVCJ2lLHJ/KUqPVEQ1BUbpKOTtWYcYkB4MMdCfPgu/d1P8JvG/owRxAAPxD0cF1DF00f35yz7pmSdFf9y55NM4Xv1BRe1kZjSkKSZv+2S2w3uU/KLF7e8hiVk9qEYx0ImFE5quezoFrE6TYikg7F3VrZUIvtLl08nMSkNvL98c1bMMCI4x8xteykynSl8QQm1+1mqJE0VwHmni3odxX/Gby7nd2WG7POME4O3Rc7c8piEkc/CqkpqNL9UZk6xdmFTtcWqCyT9kv16AGCp6dqNZW3ZN+7lfXnYyoOdOd7I/woZvDciW4ROaEs5O6CX6BiTqbZ7R7R35oWzhtPxdCMlOt8xzqxDGTBHaOj2kdXslfHj1WJNpGvyijx4SfZwP3uZ08xY+Hnrplh/7lTmz05Y/YoqkT8jz5M5RrnR7pg33QpxIApVfRIN++5rAkqxtQSku+jNo/NjDWiE9017A91wCN1yy9ug=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(44832011)(5660300002)(52116002)(16526019)(86362001)(6486002)(186003)(2616005)(2906002)(53546011)(316002)(66556008)(8676002)(16576012)(66476007)(66946007)(478600001)(31696002)(956004)(31686004)(36756003)(26005)(66574015)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?hIDCbddcUE6bvfpN9MULjjDuEPSRrE2i7PWgZzZIsz50kbQtAX5D0kHxHcYV?=
 =?us-ascii?Q?xrvhGdrajVe6CdAEsO1vmCzFSKm/Hs3FnZXWtQS2tfEEA/Fx53JE6t+hRc83?=
 =?us-ascii?Q?zEqKWmBD1GkAN8dqSUU+EcfugY35yTRKm+hFe1xtoEM+yhofiaoACeHY28Gn?=
 =?us-ascii?Q?+y8ndo/5gRi6k7rOWiznvSdbTthp9pPf2ZDFZDJQMg6bYO9l+HsXkZa1OODv?=
 =?us-ascii?Q?m9p3l6hawIMXHJjUjQBZuV/f+7GSHd71VpMj7VIHqBByu9HXW92FVe2Ksks9?=
 =?us-ascii?Q?xhaYWOwOH5CXvDzVWGGTGqMj+Fz45ZWkiB/zcRQypb8UF/QZVKXmd08NRz8j?=
 =?us-ascii?Q?36kQ8Buo2BN2cvB2/pKsv/3Cj+PachtKCaSO88FaP2c+a3nYPFYPOFTdsaxh?=
 =?us-ascii?Q?KEqEIMwOM8/6loSHFVQDQGCa6ak/qw66Wbwq9H7OmUfJxNTxHK6M7DSDAC+J?=
 =?us-ascii?Q?b8trTk7yb1D6DfM+FBrI4l1HteKpDIPSsfR/oO9Xu5xCylIMw3/IIItswbmg?=
 =?us-ascii?Q?Psz9m7c/aw1NrYSPy9Yg3to5bEYFeFiI38g86ZsyQL9bjL6didKOtmkXmC7m?=
 =?us-ascii?Q?C2Saqq2fEwsgeEUsLSrdQcl+P4wCjQ4F7jYm5Yc4AT1hn1GvD0o6FQ9qMHFW?=
 =?us-ascii?Q?T9bEOJPq89OXZNc956vxIvO/IVFQ0C2fvsDLEkqcjFRkcLewbnYQV7PPxzsa?=
 =?us-ascii?Q?6GMLH0+PPxxwrMZHRxPr6F2MtbbMc3Z47G1cLFtXm1IMBbfaZcq9RGWM+CqI?=
 =?us-ascii?Q?TG3/NthRN9jZqKuN+L7enB++k/KeTwllCPm47WNuxdvg1809DD4swD8UWn6i?=
 =?us-ascii?Q?hivjXecywt6bobK29/JlvpXPe9gZXYG1LCh9oq6qO49W1En4e9dsFivg8cwD?=
 =?us-ascii?Q?zpaV/8MpcazRiG7JrQ48hrfg1+bxZfK0jbgsQTC/gTqjQboFD1ZGvfGvxcKO?=
 =?us-ascii?Q?4ZtYxI1FUOMLjJFbXtAvaQtyVV9gsKffAvwCFoSJGpBAsFYPj/qBf8DJG079?=
 =?us-ascii?Q?oHLq4j86khXH+1SyNkaDQOO6f+Jd/kgleOEpTvUezyVX4cdBzcryPILFlRJA?=
 =?us-ascii?Q?k5g0ahSB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a65d70-6897-465e-b8d5-08d8c2d36a09
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:54:14.7624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgRzTsmRL2eS5Fx52Pe/6Hu8ppMLft7nzEvp0tzKFxXmy1rxhc5firTSK0BPWt74SHa0+EPIh25MzdT19cqW8Rubh6MoZpItT6Ah5ALI0MA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-01-23 2:25 p.m., Andreas M=C3=BCller wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Currently it lives in:
>
> * meta-jupyter
> * meta-microcontroller
>
> Seems important so add it to meta-python
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../send2trash/python3-send2trash_1.5.0.bb               | 9 +++++++++
>   1 file changed, 9 insertions(+)
>   create mode 100644 meta-python/recipes-extended/send2trash/python3-send=
2trash_1.5.0.bb
>
> diff --git a/meta-python/recipes-extended/send2trash/python3-send2trash_1=
.5.0.bb b/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.=
bb
> new file mode 100644
> index 000000000..d906c0b9e
> --- /dev/null
> +++ b/meta-python/recipes-extended/send2trash/python3-send2trash_1.5.0.bb
> @@ -0,0 +1,9 @@
> +SUMMARY =3D "Send file to trash natively under Mac OS X, Windows and Lin=
ux"
> +LICENSE =3D "BSD"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D05faa35ba1ca10b723f19d286c9d5=
237"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "60001cc07d707fe247c94f74ca6ac0d3255aabcb93052969=
0897ca2a39db28b2"
> +
> +PYPI_PACKAGE =3D "Send2Trash"
> --
> 2.26.2
>
