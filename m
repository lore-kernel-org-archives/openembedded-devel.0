Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.75])
 by mx.groups.io with SMTP id smtpd.web12.8573.1611759266924286661
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:54:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=H4TrUxg0;
 spf=pass (domain: windriver.com, ip: 40.107.93.75, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXFDLEDGs5RT5CVKIzw1X8xh9CFjFd1HR+YBcBV9D0MKghTQS3s0QaOHd1yJEozmGvyKWWZQU5Ta5/XSlafIiwEc/bFtZ52u12EtHb4XxZBTGAphxaMt9JUhTVJe5aD84WI1tEhutFJ35i7X3DM4RE7QlNH56cyGihEa9FOHZdP8AOt3/JkRKlAZzjHNTLSnHbbgaDJYkIuB8OTsxBsEJIqm4CNx0vVbFKgFsoiS14joObkl+JJYnKMEWCUm49clEPYhMi5bYo5ewN+ScJrKyzKPmn0FTtDuzi+hdfeEvNhuejxgy+twQ25MGryQ0z9Rz9Yi7qAXHoJ/WEUv+XuUqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JvDDVsylm4VBmfobBOy0+53w0O+vmbPgmlOA3DmWeU=;
 b=ROzmJLbAiWz6udt1LHtpx2oNGUr1x8K+TAGlqYd7abgi8JlopBwT1b9w0PQL9Vy5Zs1cWV9S1s3C6tbvPLncEV3NJQSPApy5LlDnaFBaGoxAxa0SbkvNzOhVCXqGDGhfqiN8blyQgKKoZX1JDtW/o2uISKLGGSIS6u2oGH8wq15eRL82Ab6m+5mZeL44+FKQp3bg8aFb9DHr1dxPN7cceghcJgoujPn1gFXkagLts93nQPxzWmM3+HmF/2h8ouIJoBse0yYSRGwAYeAWWil/d2hrWytioWQHaGMDiZyqeHMNvWC7l40DE57oBFQnHF7M38k9mvFRbTosELMa/SSZ+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JvDDVsylm4VBmfobBOy0+53w0O+vmbPgmlOA3DmWeU=;
 b=H4TrUxg0rFgRAbEGTbAYTfQ7KCu/GqO9fuJs7tug2IpRGEa6ibJd9x6l7ENfUHORgf4jX2QfAebKU17XcB0WBTXGqcVd2P6Bqwa64QAzbFLmuzRXsMUUhcLEhvzq4IPhE7qlO5tQ0LJHzcknVweqKJgmPxN/Vsrl1nKjZN0HP+w=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by BYAPR11MB3112.namprd11.prod.outlook.com (2603:10b6:a03:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Wed, 27 Jan
 2021 14:54:26 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 14:54:25 +0000
Subject: Re: [meta-python][PATCH 4/5] python3-asttokens: initial add 2.0.4
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
 <20210123192513.2663547-4-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <7a8a2f28-e5bb-5f8b-b76f-5d43fb226fd3@windriver.com>
Date: Wed, 27 Jan 2021 09:54:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210123192513.2663547-4-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0009.namprd13.prod.outlook.com
 (2603:10b6:208:160::22) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0009.namprd13.prod.outlook.com (2603:10b6:208:160::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Wed, 27 Jan 2021 14:54:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d79356e-3b5a-4777-a810-08d8c2d370ab
X-MS-TrafficTypeDiagnostic: BYAPR11MB3112:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB3112C69CAE0EAC9BAF2B8EEA9FBB9@BYAPR11MB3112.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xWQqODgPx2s79iI9QyMNKsuoHwH7TrfgxzE+bDLZ6/R87OspKyEdEDzMlcSbyjRewO34I5IyMmFJpxiouDkW4puHAnkJFKQOOcQHCK4EwDkCyMc0ywr2FjNSRFV1Os5HOaLUYsk2aL9x2Ia+7E5ogYMvIzplqI0W2jYidoeAbD0l6WEFn3TrCKiSPPdmqOkHlDLwg078hT5VZ6keOei6QaiWCHrKaQAEynycOw3zxCsLH8NieB9zsAdTxXPcHvli5RBgvs/KiCnrOVjXL2rXVaIE+8RJ1OkevQetHQGo+K1IkFpuZ4nmf5/jgZivII1PC7Rs5gYGaDOHrzhanSIKcYw678q+v6qjC8eeqC0GNmq2Xkm2N+bGo6R5vzoUXIxhfGfY2zvAtABZ9uhRkQ5TFmjPdtbYYVd0gykXXOvKg4n6o39cnDtwUEgLT5+TP+pBrrfsK9qln3mFPDKqWcyyJQnNlEBX+pzU6QhORua468MkCKS8W+BrjJDIxR346QfPGNXxLSfnGVUQa/QH33Q+6oFl6Rir7YDBrVGLi4Uk+QEnyaigAH63M16zAJI7R5lqpfQ4mHo7uvc1ug6lKtKSiR64q4SZm65FdVQ0iJSm50RLgV6ZYCJutVF7NS/6oDXm/K7Dy0qSLk/2esh9SUSKljzc4Rm+9Ww7/4KOzBbEQptmaoAPRPO0pQRZxWxdgd17
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(366004)(376002)(346002)(44832011)(5660300002)(52116002)(16526019)(86362001)(6486002)(186003)(2616005)(2906002)(53546011)(316002)(66556008)(8676002)(16576012)(66476007)(66946007)(478600001)(31696002)(956004)(31686004)(36756003)(26005)(66574015)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?dEMNb31+Q4Gyx6DLcFByeV4TtkKT57HW6thivRtaTOy4zInm83x5qHiEPvvd?=
 =?us-ascii?Q?H8J/tPIjP72axxozk1/T9WlF+FfDfyDqt1ezDnYPgTjOnzRIS9mRVw6lDvVC?=
 =?us-ascii?Q?xvBI2UWA95/VPEMlRe3yt+ESl8m3jBt0854PHQ55WIUJ9UCh8UMszdo/VgQA?=
 =?us-ascii?Q?33KsUd5pYvPKpgI6XShleYpbY7cySldqfRSu3TzaHA1nhqvmZBgRCx23UFAO?=
 =?us-ascii?Q?Cs0ZH658dslDX8OjFosNPdPoMjM7AjR2hYZpOONUFnglJdN64TxMQj0TpaLi?=
 =?us-ascii?Q?fXv3/FuNsikpB7ZCCvB5sYkQa+FdZY0NxJX9xQUbWIbkz+mgGODfAQuc4TWj?=
 =?us-ascii?Q?SZJW+EAm/pfwCdjE96NxdERZkH2OvP+gLYSvsAVWLtx5cL1Z9tdWO/8zx73a?=
 =?us-ascii?Q?FYXiv4TSbuAypSeMbbqoVY+kBQ8WXHHKfsbOPUpPH+bERLxMmQpZFP02hIjP?=
 =?us-ascii?Q?P4qCwOkm6Kg9sgK+qUWktMhlpaVG5qixQUZnn6cnxTiEPm6eQTyPVVhT0zCI?=
 =?us-ascii?Q?7JcqyJ4t93MnE9YTQRnhanTs/aZM5XTSZCRWGvEYr2yRFj3FOPgqvu7k2Orf?=
 =?us-ascii?Q?JPBxdWMBmiur44ZaLJTd53BIMz+jHzJDnNgoaPZr1Kk486iqRCFDBpgIMcXT?=
 =?us-ascii?Q?I7u+xwo8ug+TY9RGH4hjxd+0v48rt3uS4v2ds6BX5ryK3dNmYSgf5fmho/o/?=
 =?us-ascii?Q?MMBkXXW54XqWKcXv2EBwtcitZCBfX6H/vwwmQOJoti1Sfv17Knf9Boy0lmsn?=
 =?us-ascii?Q?eP4ywn+ts6ZuRRRHlOsDLVCpdHGrh6gVPdK/NrE186C3XNPKlU3G9OgpQDhG?=
 =?us-ascii?Q?iKWYYNG01lk2sWWPJwAl2SPXKw3NBBXMAztNU5BeC09CD3MozXy7Kz2m2ilb?=
 =?us-ascii?Q?IJwUEE0eh1eVor6chZEPWAdU/9kNF9TeLoDGx1u9jrsUDKbzDI6tcSjG5yaQ?=
 =?us-ascii?Q?TEQd20qeEsGuHqj+ebDLEpLFLqmIzl9cSB4mEMfaJ9VlmdcJJjVEZIyVKsL2?=
 =?us-ascii?Q?wQR5Hq2NGCrxI+59OYScUFHpOjApo2vfM36I/8nl9QeQ/WFCjy0tvCa+fwil?=
 =?us-ascii?Q?XAo+bIAE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d79356e-3b5a-4777-a810-08d8c2d370ab
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:54:25.8570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXnAa+tnH6unfObHd5Tyd+1enPua8pV65koyzB1OV3sM2HCiTKZoP0cwSs1N7Z2LktY1yKdmsQTW/2cnfZA4a1nuMuBi74gHj5ZXT2jMdww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3112
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-01-23 2:25 p.m., Andreas M=C3=BCller wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-asttokens_2.0.4.bb           | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-asttoken=
s_2.0.4.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.=
bb b/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
> new file mode 100644
> index 000000000..c2149336f
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-asttokens_2.0.4.bb
> @@ -0,0 +1,17 @@
> +SUMMARY =3D "The asttokens module annotates Python abstract syntax trees=
 (ASTs)"
> +HOMEPAGE =3D "https://github.com/gristlabs/asttokens"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De3fc50a88d0a364313df4b21ef20c=
29e"
> +
> +PYPI_PACKAGE =3D "asttokens"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "a42e57e28f2ac1c85ed9b1f84109401427e5c63c04f61d15=
b8842b027eec5128"
> +
> +DEPENDS +=3D "\
> +    python3-setuptools-scm-native \
> +    python3-wheel-native \
> +"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.26.2
>
