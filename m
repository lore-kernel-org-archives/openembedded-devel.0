Received: from EUR03-VE1-obe.outbound.protection.outlook.com (EUR03-VE1-obe.outbound.protection.outlook.com [40.107.5.81])
 by mx.groups.io with SMTP id smtpd.web09.5045.1612511271438281530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 23:47:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@skidata.com header.s=selector1 header.b=HOJzCzeA;
 spf=pass (domain: skidata.com, ip: 40.107.5.81, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TL/TgaxYAfCKVVu6hNciOVJdOs5vSABALeQEwk2KoWxEaW6F0k0gVRAbUVNH0fCWk8ae4Z/NKLvpTwCUwjCJ/HL4FMPxEGAx264qsT1D27uZ/5AtneYxxvlaWYvWHs5hKpbxMlVBBofPKtUHpNE68fa38bgIuxYYBMpMXWLFNoJ9ym9ZU4eWeg9q6A/pFHGAIc8PKnHYNx4fCjqsogTEDNCedQ+TifOn5ZMORRd66ykd9NnN5Y/0TtX3tvL3fxC7gOxWeuxv8ShV6pHA6Z1pBF1f4v4o4URV4R1D/lnGqZFUmlCNxC+/G7mRYG8n0vzc9/E9zDa5vR3sNAlpv0QF0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I/HPcrBVpA28VBQrzGwxWlAooNC6bcZHwtJa79Vvak=;
 b=WR4PdFroXm1mbLVyKl5a7rHQpGIoNQ452h4bjMgR6bNKBHWrIudeM6JO1rLR/ZqtaLqQQhQnmu12bz8orHSieccrkUO4SPmn7DpbnWqsmqJdbnxMnaouiqSYWKznG246Wfpo/py4CFEyjXr2kfQvVQPSr0CJwtR3cAUIvlilN8dsBROfi2zCzjV81eqTHrEu279bUhh9Qv25xFkpP0KdPhWUTtWiGzM5BjBa72gARibtvhy0IJEwpq5ftZ/WrrCsDAE6SebgzpDa94PjOXVV0F9P2dE1Y7XAJo5bvwuY/8PokhPO3wRV8yCSTYBrHdNTyokhTLh0egxErA8O0Jt7xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4I/HPcrBVpA28VBQrzGwxWlAooNC6bcZHwtJa79Vvak=;
 b=HOJzCzeAwhTJjYq7yBOHgLEmbHTTe1mBgpr5ZlNDW1MAzR9Ahj9dZcFoR1ogVG2cqmEqu9bc6BfGkqfdKMAfkhxlzcdajJHPwzixxyWVNg0QHS7jib3uR5uV/qB8Vo7DN62+lhl2g/cLjlwrJUqt3ral7iiSnsmslW5VaCcPtUY=
Authentication-Results: bmw.de; dkim=none (message not signed)
 header.d=none;bmw.de; dmarc=none action=none header.from=skidata.com;
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19) by VI1PR01MB6496.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:155::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Fri, 5 Feb
 2021 07:47:48 +0000
Received: from VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::5064:aac6:7226:7221]) by VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 ([fe80::5064:aac6:7226:7221%7]) with mapi id 15.20.3805.024; Fri, 5 Feb 2021
 07:47:48 +0000
Date: Fri, 5 Feb 2021 08:47:41 +0100
From: "Richard Leitner" <richard.leitner@skidata.com>
To: Michael Ho <Michael.Ho@bmw.de>
CC: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-java][PATCH] openjdk-8-cross.inc: exclude BB_NUMBER_THREADS from sstate hash
Message-ID: <YBz4HRpw6ZBjzN/g@brokenbit>
References: <1611911961-96454-1-git-send-email-michael.ho@bmw.de>
In-Reply-To: <1611911961-96454-1-git-send-email-michael.ho@bmw.de>
X-Originating-IP: [83.215.125.121]
X-ClientProxiedBy: AM0PR02CA0216.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::23) To VI1PR01MB5007.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:9d::19)
Return-Path: richard.leitner@skidata.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brokenbit (83.215.125.121) by AM0PR02CA0216.eurprd02.prod.outlook.com (2603:10a6:20b:28f::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.19 via Frontend Transport; Fri, 5 Feb 2021 07:47:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7f1b2a4-bd5c-43b3-de43-08d8c9aa554f
X-MS-TrafficTypeDiagnostic: VI1PR01MB6496:
X-Microsoft-Antispam-PRVS: 
	<VI1PR01MB6496B3D38B6E84656754836AF0B29@VI1PR01MB6496.eurprd01.prod.exchangelabs.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PONa+V27cdKk5KKLgZLztHAqRmbYeBMMNMCBioAS24S+RhIzG2ovswqSrPX1njG3Tke2kh+Z59rdl3+CGG37fFKjaVwdb4IvoAvT5D+tVjjX1hahRk4eCkdE8c9A3WIL9XWorkNV/xNmN0Paltm23RcgRflDbMdWv8IrzCFG9BEMpZUfa8Y7gD9Yz6TJNkFNEOBmOADQ1kCRvBbR032hMZoC5AJiZZKQFT5Ckif/06hjxdDYeG6wH+X0opyoGuBY7brIJ8PbFT7H6qawKxuk3CWe7IzN/Jr5gQiCagDFy5v2QPoQzmPxRk8n37CEYkbNUvln3Cwai/HGDNnYgtDSJkDOOB8OwiS0CkgbJXZoFfwdPlBRvtGgfGyEYPbVVXp1qiKTNeP9gdXz6FAPsz5nD3ztShKbFPCK5yrOlDnS3hZj2+snZPGj8Y0QhGs9U+dMCxjmCOToWRoq+prgMh3STaHlmk9LxOhMISRLyNHbPo8i45kI0Ho6yiEHpAuLKea/b0jXEuF3IqbtkISTmpREjGveZbALC7qL0/BzmcBwXl4bNUY0AAmqjbeUXsNCRLG4zNFUobkEFe43JjVloIBsYDqPVqX8d8y5/O5BWVnMITFvJX7bOWOAqjxn+f5k0xgYIzcgBnwrEDHbfG/eKGKtBA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR01MB5007.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(136003)(376002)(366004)(346002)(39850400004)(396003)(66476007)(66556008)(6916009)(8676002)(4326008)(5660300002)(6496006)(9576002)(2906002)(66946007)(52116002)(44832011)(86362001)(186003)(9686003)(15974865002)(956004)(316002)(55016002)(6666004)(33716001)(26005)(16526019)(83380400001)(8936002)(966005)(478600001)(66574015)(18886075002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?w2D6OpI5kXRicRDP8bxy6whWGb1mp6P7TFoaBXjQ7PAqoCwWi1vc74Swpe+C?=
 =?us-ascii?Q?2ya2Ec+L+wbOsZGwGRjp50q1PlXJrqj3NRVdyw7W1GMG+qDSvUnH/Ol7Q6K+?=
 =?us-ascii?Q?hLiWKrlZnS9aHMH4fGCJjpawePp81KWwMEjnxgoP8xFn3deCG2WLB2aShxZV?=
 =?us-ascii?Q?BowFOITssBk7Ko2mDoPcgqML2QylTBvkBW+g8U/s80OGyeTLHo2VbdH3TfAU?=
 =?us-ascii?Q?0nVJrkshoElxK4ET1b46PSzZQSRQsaHiZ0WYiodh9JL6UhbWm304prw59TDq?=
 =?us-ascii?Q?tKNqn/2bI5tuYJNx3b/wtyZiMOwBQimq75N3YO2nsk1htDNRnC166pMPaSZN?=
 =?us-ascii?Q?ggsOlyr8BOExWXZgHlOm6rzrraHE0+0a6C2qRIjNdGwTKdSYmY/hPfu5sBAf?=
 =?us-ascii?Q?A3RkOffHSzml4VGbJEDDF6Vj0iSwODkFnNv54qdofATEEREa/sGM3EqjBEHo?=
 =?us-ascii?Q?foZPIvzeZx/m8HmjU6RdY4KNbGk02Q5kVn+xDvifbTDZH1mbJLKDRZUq0KqH?=
 =?us-ascii?Q?eduM3kQcwz1SkeSkj7KOwkIO+C/XM2M7FwiomSckrHxWpNk0KHRVsfiByhKB?=
 =?us-ascii?Q?toRStc2Oa7si+vlb6p1X+G1R7n+QrvcczfPWsp5ymLTCjKeSrZNXonWean9Z?=
 =?us-ascii?Q?rRVXFMP6FaABv0q6eaVU5MWdwgweYYOHvES2pR4gyq/YroBrQD+0eXi15jdA?=
 =?us-ascii?Q?XxSjQz0YKj8JMvUeAk8/vl3ig8Uzv4kDQvcughxzsvrY2HxI2TXCcfT7hU25?=
 =?us-ascii?Q?Yg3fu4lZRIjs/jZ4K88Zvw9oe9Se8TGxMun5/6YjtivSEi9uAZEcGlT/Ivyu?=
 =?us-ascii?Q?yKggahmRQePtIlnaTRHLWhBv///YAkp80+P4xoBcU7UkVgMWbioWUr1ISthQ?=
 =?us-ascii?Q?Y08h67RCsyYe09k5Iyr4UciDxSBH0/CPOQlDpeuADD+RhPu9cl9PdTnngGl3?=
 =?us-ascii?Q?UENC6Pk7JLGfIV9BRk4yYeeggbZhWBh3RvZ5deAoSM5B+FVCewbTQcjJwOM/?=
 =?us-ascii?Q?DYrVLgokbHyXiksLfrduL1pZQG5Zi8d/5hMO9TTX+R0EdV02SP9bYGry48ji?=
 =?us-ascii?Q?+UjLfvW3JlQEOHlN2tHo8AZcusdAQVIXBU8i4K7ib0ijIheNitRYitlf2S+W?=
 =?us-ascii?Q?bcZmuijLGTOjUAkKvJIEsWDR4pZyStMVC+I0BhukA3eOpWKdecfJkNGXbuk6?=
 =?us-ascii?Q?j5Hu7/YP/cKEt2abTVOlcrs2ObdpydeDcM8pt3Tffjvt8zKZVfoQzASYWtTv?=
 =?us-ascii?Q?M8TRguO1dUUKXL5i/tvCL+AEc4Pzerh2NzrDQNr1zgJVrTSUyTtYHLtDoig5?=
 =?us-ascii?Q?3Qjd+mRN73acrsjyF3LUwaeE?=
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f1b2a4-bd5c-43b3-de43-08d8c9aa554f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR01MB5007.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 07:47:48.7375
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WqbSEJEsVQvwxnOd8x75KxNjSPuWB2m5bC5/4PHKVILKoXdNElCBG6RXZzZUb1MrpA2fcDgf0j2FcgtorzUcP/+ZGmPjcGPDtm3KZ9s1A8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR01MB6496
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Michael,
thanks for you patch!

I will review/test it in the comming days and give feedback!

regards;rl

On Fri, Jan 29, 2021 at 10:19:21AM +0100, Michael Ho wrote:
> From: Michael Ho <Michael.Ho@bmw.de>
>=20
> The sstate-cache for openjre is not shareable across multiple machines
> because the parallelisation configuration of Bitbake is being embedded
> into the sstate hash of openjre.
>=20
> Exclude BB_NUMBER_THREADS from the do_install sstate hashing to avoid
> this issue.
>=20
> Signed-off-by: Michael Ho <Michael.Ho@bmw.de>
> ---
>  recipes-core/openjdk/openjdk-8-cross.inc | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/ope=
njdk/openjdk-8-cross.inc
> index 9f68d08..25d971f 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -99,6 +99,8 @@ do_install_append() {
>      fi
>  }
>  
> +do_install[vardepsexclude] +=3D "BB_NUMBER_THREADS"
> +
>  export MAKE_VERBOSE =3D "y"
>  export MFLAGS=3D"${@jdk_make_options(d)} MAKE_VERBOSE=3Dy QUIETLY=3D VE=
RBOSE=3D-s LOG_LEVEL=3Dtrace STRIP_POLICY=3Dno_strip"
>  
> --=20
> 2.7.4
>=20

>=20
>=20
>=20


--=20
Richard Leitner
Hardware R&D / Senior Embedded Linux Engineer

SKIDATA
We change the world of welcoming people

SKIDATA GmbH
Untersbergstra=DFe 40 | 5083 Gr=F6dig/Salzburg | Austria
[t] +43-6246-888-4245 | [m] +43-664-88616370
[e] richard.leitner@skidata.com | [w] www.skidata.com
