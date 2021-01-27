Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.44])
 by mx.groups.io with SMTP id smtpd.web11.8589.1611759230793174261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Jan 2021 06:53:51 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f1THzRUS;
 spf=pass (domain: windriver.com, ip: 40.107.220.44, mailfrom: trevor.gamblin@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJaJsG/+kUfhv0q/ky3dvH2JrovMD18j+TXblKczKnRMxYtsnOEk6Yx2l+D/hvV0jpf4XyUbil/6P5Z+CaGxCIFjpYh4fLfz42GhRl2eTERDj3++/SE3+PIQlBAQaK4V4rQFk8XjOwNKUn78HiEQx3YY4Argxe8i79ktIqfyG4vip5eNZv2E6Isk4H2DaV5p7DC4Y2a/CUDsFZ88q9ETbCS9Rd89IccO34WIivjsLARpLO7j7Qn2qYMh1Cki8m+tUQtabFcpPbBeExhqaf+ASxvtV0pzHTZ2Q5RhoJ3vQjMTk/nS5b3WcnyEij7HzvNRgk2DlNMqXlnlawccL9NhbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNUaYB/LNOps/xz4+DrvKwxgeExMiuXVT2SxyfU4oTM=;
 b=N+WXfbZJufZ831EE7v7bnTIFfnoqTUgh9ImL5DulcTB6TZzUT9oyQ3gJv7/by5z+lWxcFeuLdxDFlAJfuFmgTf+rhoH0i56FUX5Z7MQt/TNqtrFXrPEgbKtz/LGWIiWoocE26eyGJxpKpTQkjFXd5YmS/3SwUe4s7sTdzWJ5VA6OS+3nJs2mDo1TJgQKPObuU9nbp4AhPWCags6c13ZcAnj/wB6uPqbgtaZrUdN8eS2pFIhcV5PRwyKWp7ArUL0JiCzb5mUaSrfA94DoxlIdlig9ASY9hexnpiLefusBk+5C429VBRM1s4r0FYzlZTgtyfHHTa3jphH6+8C01TKSMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNUaYB/LNOps/xz4+DrvKwxgeExMiuXVT2SxyfU4oTM=;
 b=f1THzRUSg6+/ARMi4sceI/hY3gxztECVzK9/Nx+fZiZsfqT+tPcalxEMAbYv0JXDg/4NlcxvyaykBZ7sTbSRG9vsTPb72Qss9X6xXIqZMLzRLDKNVrCy8uCWZ02bZo1k6AaVVLWmgOPRuJduyY+VeQoTHhOpl2KLB1uMp3amO3M=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5039.namprd11.prod.outlook.com (2603:10b6:a03:2da::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Wed, 27 Jan
 2021 14:53:49 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::68f7:ac3d:b5c2:3447%7]) with mapi id 15.20.3805.017; Wed, 27 Jan 2021
 14:53:48 +0000
Subject: Re: [meta-python][PATCH 1/5] python3-mypy-extensions: Initial add 0.4.3
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <20210123192513.2663547-1-schnitzeltony@gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <d54d18ea-9a5a-81b4-5826-c904ba884151@windriver.com>
Date: Wed, 27 Jan 2021 09:53:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210123192513.2663547-1-schnitzeltony@gmail.com>
X-Originating-IP: [174.115.236.231]
X-ClientProxiedBy: MN2PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:208:160::49) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
Return-Path: trevor.gamblin@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.55] (174.115.236.231) by MN2PR13CA0036.namprd13.prod.outlook.com (2603:10b6:208:160::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.6 via Frontend Transport; Wed, 27 Jan 2021 14:53:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ac36fc-41ca-4496-1387-08d8c2d35a5c
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5039:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB50398253C5473DC7EBC765809FBB9@SJ0PR11MB5039.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uR0gBTES49ADjUSn4xmvw+oZa6yDcdhWzyF1oD3Vn1n9vqFkUJ+syM6IUDLYkbqkcR0HCWCkl7byt4vvhgjXrNbZEyKxi1y5PDc7wIYNlGKoSy9gEyd889gIrVXzbWs56EZysytW/ev/o1A5/7/l+aQQycHGGx/rpXflpiHmTrOEmVkHZ2zmPzBvdDlBw6SpfX3xXQRCu7SgPR69CvyFE5OG+6mnIzmbYVnRu4STUOmewOdbY7QNcDi0pXO7OYNOIiZbmotGIofOv29aL+PDeU55ptIamq9K4Kl72sGmsTZFYjzPqBBq8I4YWB2X1+G3gWWdcgxsAu3HvlLMO0afsTwg7qYEjI8lquI+ttTq8go79T6SGQyHcHyfQYOEc9WVA/HSrJH/IrAwk68MzlAD0mdzlzB00pYLZcWfZR3ACh09VVCA3FycJMeANqvtpFKIh+XCyy9Nenk5TxfvO8kmveDVZZs7YSUWwI4zAyPnohBJkXjc4yZeL5QqWm3966jjdDk6IxE6NwVYVm9NcAUu4btgIV8mvt6UnxhTdaa6cKlkvzQJCIInyAFyrni0YKi0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(39850400004)(396003)(346002)(316002)(5660300002)(44832011)(26005)(36756003)(6486002)(31686004)(478600001)(8676002)(66556008)(2906002)(66946007)(53546011)(86362001)(16576012)(16526019)(186003)(956004)(8936002)(66476007)(66574015)(52116002)(2616005)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?j05VOEs8a/SM0zUu6roqSnw6xMi+tv2oGjCNO5M1NGRkoUS48NvjojyeKYOW?=
 =?us-ascii?Q?/aWjGT9ZnXJWW4a5O23GxmeZwNPj6YnaBgP2OktuRMvW18eHDJK0tX9WpGmz?=
 =?us-ascii?Q?LJNQdpNwO5dxvGCYAnstZMTEcgrxSThdLdobDqgwmDn9ev9mzmPd/n+SgOeJ?=
 =?us-ascii?Q?4lNIVWmQhZualeT8zP7WvnKBdHxY2PZdnXSAXH8n5WIXU0lAKZghRnH9aTrP?=
 =?us-ascii?Q?eJyMxYXWBxCCXXnfxFy8zyJxQ1X00Puwr8Qy7fD5FeMMyLteYzX7+lg2DyKb?=
 =?us-ascii?Q?wKiD+nAr766gzwDaexvQ9VeB5G5H7JIrxid+mV0KbAWGR4ELGpGLx+eFRYlU?=
 =?us-ascii?Q?MPdS5nko4Xrz/EqHi57RZ4eMUIr1bBcTCVJ0jupbewkSJxrN9HAn4xwkElJQ?=
 =?us-ascii?Q?WopyTKK93RwUK4n0kaj2x4OdmhU0V6TfJnIn1cx3A1/FnNfdmjtZBNP9m9Nc?=
 =?us-ascii?Q?hW7n9UREB1xzn6LLF2LiBn9z072GEqKaTKzQRCwHPx37z7B/VtgA2F1tOf6T?=
 =?us-ascii?Q?LLb5SWCp8QprQHJJPA9o55DdG6/1h2ebrXWL7nlwLsTxs5LFFVyC6xLdM3G+?=
 =?us-ascii?Q?mt5YbeZuPmIQGvIHchHV0S+GMdYlBugVL4Bd5YttGUBROM1EaESEJmXEpIY1?=
 =?us-ascii?Q?w+jLwAX7VZYJ5czbsDZKFvprLjYHwgcfRlOfcTGoTLR8l28uX+mcoU7JWxun?=
 =?us-ascii?Q?r3ZhXUnwXTQHoi0PIugSYwnZEU2lK+Q87lvnzNcaqDdolZaAVi8jRckw2zNf?=
 =?us-ascii?Q?+1iec3ajXIqNiElvH92G3/LhNHUqu5ueek4aOkoZy4+x+snhv5Uw4jZ4UXM0?=
 =?us-ascii?Q?MbqSjh02FCWaCrCaidR63BTfzLM1CeuE5mF51pKJlWKhoiGhrEEwXOnzms+e?=
 =?us-ascii?Q?ABvmsNG2kGK0sNpCQppArMvL9dV1rMde1A9I2saGwjjRCzplnlCOH6zi4vwO?=
 =?us-ascii?Q?8CVvNu6j1BTt4NIufGo7IKNjSQ1VIQncshoFABOwcbXiszIO2We8GqVhqUKj?=
 =?us-ascii?Q?D+FsNMw+5+MtA43YhsJPr1rG2qZAxw5u86ifDbY8hev0INm02Ck5T1M1LT72?=
 =?us-ascii?Q?qKuWTq0x?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ac36fc-41ca-4496-1387-08d8c2d35a5c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 14:53:48.7564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qi48PKc3YVxuNxlQjOkdvBBryN8tnsCkrVQ29Glnd5gyIfoLlKTWmJPqQwkK8sVeEgEZYCNZ1aMVJ5yUJTfdbTe4CYa8Ye9kifOAMQeq1OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5039
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-01-23 2:25 p.m., Andreas M=C3=BCller wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> Currently it lives in:
>
> * meta-iot-cloud
> * meta-microcontroller
> * meta-ros-common
> * meta-sca
>
> Seems important so add it to meta-python
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Acked-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   .../python/python3-mypy-extensions_0.4.3.bb          | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>   create mode 100644 meta-python/recipes-devtools/python/python3-mypy-ext=
ensions_0.4.3.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-mypy-extensions_=
0.4.3.bb b/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.=
3.bb
> new file mode 100644
> index 000000000..83ac5362d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-mypy-extensions_0.4.3.b=
b
> @@ -0,0 +1,12 @@
> +SUMMARY =3D "Experimental type system extensions for programs checked wi=
th the mypy typechecker"
> +HOMEPAGE =3D "https://github.com/python/mypy_extensions"
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0fe3219e2470a78c0d1837019b8b4=
26e"
> +
> +PYPI_PACKAGE =3D "mypy_extensions"
> +
> +inherit pypi setuptools3
> +
> +SRC_URI[sha256sum] =3D "2d82818f5bb3e369420cb3c4060a7970edba416647068eb4=
c5343488a6c604a8"
> +
> +BBCLASSEXTEND =3D "native"
> --
> 2.26.2
>
