Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A6B2CA0FEF
	for <webhook@archiver.kernel.org>; Fri,  1 Sep 2023 17:53:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2096.1693590821412431382
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Sep 2023 10:53:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XdXE0/F6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=760814c0ff=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 381GvkH5010966
	for <openembedded-devel@lists.openembedded.org>; Fri, 1 Sep 2023 10:53:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=+eQNE4eTsVc4b0BD/q
	YKaCDbY3IEk7ptHM/Uoom0g4k=; b=XdXE0/F6PNEfgg9XJTmKlGoQw4TjxJnLYx
	rCZu0MhHiw2m/FAxgUQLVpZqsDb0ZQsZtk6sWTEpNp02+yfn1Fc/GDjTrmobMhzI
	X8R6zFdS+Q7tYxRWrw9TBW/+9AaUTKxSQYoQIUMMv7/xWqppJi4cgeEqluAJLFBg
	v8FpC5um8ONJ9YLEYsieeSQ2Acd+xSRbbyta5gpzE1XxHytnoaClrpMC9m4N8O90
	GfCwRsPakCOY293+Us71CtKjN8eFz90M3iMBbV6neXxwg/z++z5CUVxZcU6d+n4v
	jnN9D1+ghyA11qVkg5mIr06/AwHb51gVAk9ZOET3i0o1Ac/3s74w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfntg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 10:53:40 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 381HreJV020053;
	Fri, 1 Sep 2023 10:53:40 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sqgwfntg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Sep 2023 10:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OP2drjCTUftibZGOZkUAKnX89W/WWPoGxbZQfS6N1/ZDTy7zy1ysL50/4GaME+I4AjFSsydoTKOqVO5lx0flyZHsZadCqFuipY7R2zo8aT9GgKQVvRfWIg1ozJHZ4W3efQtxQMHdct2cTeYANFeVQbUCtUVxpWm1elYw6NJvs9QMrT6ryzY0Ii/NxJnLlTUIIpxPV9CkOohq8jEPAsrEn1us9fqGBVLt+QaxdZcG9WZYvpxrVkCiCdGUlmJ/ISGAT9FL/wtHncTfzNq3bhKuhGmIuUWOmdk9JWBaNiT/qk0MBnmTrFNSrr2HTvAX9AHZPdPwTa3k8cetXWsb5a9m4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+eQNE4eTsVc4b0BD/qYKaCDbY3IEk7ptHM/Uoom0g4k=;
 b=OOQT5w4sf9ez4Bk1USC4VG7RMxHu7VKZSYLNU0YOMaKePlq+4HuDmdIO9fl7+5FXeTfodz7wMzzHeANBftrfnTX4GHkUXZnFhAhzJbUY5NoWU4RrGiSsPGOP5T5k8tqLEorPdahYVUj6gLZPqCXcPK6e3Shfj9tqb/ad8AoctoMyZZbtOHzAInl5jkSKcFgolBloIKOaE09DfWwz3UP6VDVvVJb2oIyISjtmWtQFzUJEOFR7SwrvDEl9/wVNiIqJnIJo/dMlb96Sma2YTR/ssmvsULE6iAlu/V4/hqpqsjrGUHJT/2l/hpwWDwcTeTF29ff03XcimWBKdEiyH7N1UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BYAPR11MB3397.namprd11.prod.outlook.com (2603:10b6:a03:1b::29)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.26; Fri, 1 Sep
 2023 17:53:37 +0000
Received: from BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::5ab9:4452:a5a:534]) by BYAPR11MB3397.namprd11.prod.outlook.com
 ([fe80::5ab9:4452:a5a:534%4]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 17:53:37 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix
 CVE-2023-36054
Thread-Topic: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix
 CVE-2023-36054
Thread-Index: AQHZ1ydU/2/SfwE68kaxaCyEyhgUf6/6qEYAgAujRyE=
Date: Fri, 1 Sep 2023 17:53:37 +0000
Message-ID: 
 <BYAPR11MB339733702285E2EADC3CBB2481E4A@BYAPR11MB3397.namprd11.prod.outlook.com>
References: <20230825073923.1528500-1-soumya.sambu@windriver.com>
 <246ba86d016be47bf1f1a34c4d28302c8186836e.camel@intel.com>
In-Reply-To: <246ba86d016be47bf1f1a34c4d28302c8186836e.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3397:EE_|SA1PR11MB6781:EE_
x-ms-office365-filtering-correlation-id: 579dc9e7-e16d-4cbc-c59d-08dbab145e27
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 m1n6I+wWUuxk47zEf/Ct3zvb8VWoD8a3hrjsDZq2uuwUQpfFkX14WguwMnEpQWhtw9vCUlgPOptQXuEp+ofPs4yv8PHVQ14czvCFkGlwMAdrTvrYYmqc0YuvfZEy4OVSJJOwcmuvQ7XjYZ/MR63NRjJ1sp6DwpGX93RBdgVMlF26gxv/t2+W5tJTOeEFwB3GO89HTU/m3OhaxSKlT0q8hQaRn2k8Ix8HXBPeiEbFNORUop3T1SYVGhA5BZptgLszwDUi8pRTY8IdagPf2f3ybBEwtZHnZeMV76Ta9wDMp+Mu/XN9FXaRjyNWed9HX3hEC3bT/H4CCwPpfcQyXbQ5cZ+YhJmtjaVu5MyCwC/XzwIZxFnQDJraUJuIQ9ybeJ0W5D4TFhVIVx9WXGs7qEiP3nVuuSN70UNyX4Ujr8ScS71S59nEle0q5hJGMHoamFHX861TcKGlWtw/Y5RwBWFZpo0D/LSYePJXYIJIV6bGgoT3VSjXbNwLpWWM4aqqol0wfM01kH/Te/jNKBP+G0rpHHNeaZA/0+PrUBAutpmxEU9Y1hKCmwml/gdPNPBlMvYX0a/r7Cr6oIWWBrQosMnzx/V+l9XdInNolQFtgrW2x2UthW8QKO7ISHyrtknCFju8QB69lTFeRj6LYOJAjAUzEDYzC3kNT103+eInxWlLeZo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3397.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(39850400004)(346002)(366004)(136003)(186009)(1800799009)(451199024)(18265965005)(41300700001)(66899024)(83380400001)(316002)(55016003)(53546011)(2906002)(26005)(38100700002)(38070700005)(52536014)(122000001)(5660300002)(166002)(8936002)(8676002)(71200400001)(33656002)(19627405001)(966005)(478600001)(110136005)(7696005)(9686003)(6506007)(86362001)(91956017)(76116006)(66556008)(66446008)(66476007)(64756008)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?sYiLZL+UXOQtgdGZd1T8FV9PeYh+yqNj+DgmZwZbpp/JOl00jx5d+HIkTIpS?=
 =?us-ascii?Q?dZBuxLGnTxVtAjZWtV7H54cDTSGc2Q3O9m3ucL1OI8Vxh1FxMEj86bykn6MB?=
 =?us-ascii?Q?lqTYG6mLltLw6nSVnXHebzlXZEaDhiDl6ujrbDnp3OEUbdmnMCLeWnY6Jb5b?=
 =?us-ascii?Q?C2gmshc2cQjSaeAz0xN/xIjO5u9U1D9GTmwKfsoA0hs4qqgj2K1eUi5oarxs?=
 =?us-ascii?Q?Xkx+rci7EsVBVOHpOdSDcOe9rSNy4Z9XOY/C1ca9eAAbwTh2SJSgi00exnbb?=
 =?us-ascii?Q?2POVuhNw289/aZCHqSqLppC8LlBfpfd6EsjhrQ87ppVFbIroN/4EDnU0jzsm?=
 =?us-ascii?Q?k6gH+1Vp1lEfaimrWXiUe4wHX5gL1juhqZOKomyXSNFqOYFTGazlkrM+Ih6e?=
 =?us-ascii?Q?otOif3FI/FvvzoL1UGhTl81mQhCl5ORRublEVywur0EKX8Pzf15a2KyoVns0?=
 =?us-ascii?Q?F/cMcut7vmKT/k6Nz/sOdNOkex58nn64ARt1To5zdPiVp2isw2/GqLBlY35W?=
 =?us-ascii?Q?RuYv7+2aJBbQPy56+vLntjthJ9t8v42QeRN37mzKh4RRREOxcfPZ69xFs+Er?=
 =?us-ascii?Q?Iua1zsEaWRPmLUPKXM48/Q2V5BEKHj/te+JTwg4Sqt4wUn6LfWoTHCfNkOjL?=
 =?us-ascii?Q?v9a/qUiVdlKHnweESeTBDDQ/2qvDz7Vqa+NEaBXB1yMVBLZ+uBjP0xQl77Mn?=
 =?us-ascii?Q?kYXM3zgZlU0d/75EKXkliI6z46Wd0RoBE32BbhJ8ZyGfliESD337s1avKUtb?=
 =?us-ascii?Q?nJibWenGoiHqX4OSki2jsQPJyI8sjj4tkNtjrQO2psHvaXEZy8lZwvOODZTR?=
 =?us-ascii?Q?CjFUd2uoZJmrVzUW8jZlcynOMw8e7/ddXzMI4Obn2+7Ks1arrHhfwoqVoZjJ?=
 =?us-ascii?Q?T4PYHnAfHWXtAMDk+1DyARR5uilaaXem/QBmzpCqyI50ZLoEoSZheOziOVT+?=
 =?us-ascii?Q?mPheCkVSNTXTDIezmuRcbbxaHIrsN6tA3nA/4KTXdjGrBZU2hQtrTPciyrEx?=
 =?us-ascii?Q?JWYoOZ3/eWWCtphberg7bBnZPP/ZRqfNhmgs9/QO9v2JZzqWFeoRsFSEg8m1?=
 =?us-ascii?Q?/QQrByvbRaglR1CE8awiH+8fm4LDXcpkH9KNNuoXtN+Z6t1Obu+M+OJykEKL?=
 =?us-ascii?Q?rxa/8vBXWZkuH1OFQHzO2nWDq7jf2tksqoMrerAWGMcoDQXrNcImm+fmEYMz?=
 =?us-ascii?Q?yo+1nhIy500YBgzPkkho0tsegC4DHwCoVR85XpCUYp1jsYOMSX7zvmrBaYof?=
 =?us-ascii?Q?UqJ3TdCrQNWedU0bGidrfGjmzen+Yg9VzVxjNzAbSzGZoicdJ7WzcZflfHMW?=
 =?us-ascii?Q?nxXHntQmK+jaQB1Wwn66i6wCuajMa1fECHiQIVsV6LcC4wpImPAysqfGhEWD?=
 =?us-ascii?Q?ohgzuRqDAqWT9w6OtMGr3+lC8llYwoP689fKqGnP0gWe8E9DYb/wm8bbYkFO?=
 =?us-ascii?Q?+EKOFGTZ5+gRQVphe/z4Y6H6jqsQxy5Ww0GQBs+1x6FPL2u57/dC6YZOQ60h?=
 =?us-ascii?Q?bJUzYmp1UWi7xO0jPSGtDCydPqM1Y+O1PHzzd4Vg1ZsQkgBdP8IagKf1lti1?=
 =?us-ascii?Q?y9K4jZawTfOm5WUWmahPy6jBP8s/2DtvUqU57REI4DXIawJRuAeyIMLzXwzN?=
 =?us-ascii?Q?dw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_BYAPR11MB339733702285E2EADC3CBB2481E4ABYAPR11MB3397namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3397.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579dc9e7-e16d-4cbc-c59d-08dbab145e27
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2023 17:53:37.0341
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UfGAxn/YVJKbJqeUcW+4ZP8v7OWUb/7l6EeIW1geX8Fntrh1dL1yivRogI1XhHoO2rxGwBPAIBrJNWj8P3z6vK/pB+rbSFVI6eMt+vxFvW8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-Proofpoint-GUID: GyhxC-pn8jdWW0cLIwJTE7XQslZ6Mt-S
X-Proofpoint-ORIG-GUID: 0_EE6qkw381JzohHaAR44nzNh-WqsbFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-01_15,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2308100000
 definitions=main-2309010168
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Sep 2023 17:53:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104695

--_000_BYAPR11MB339733702285E2EADC3CBB2481E4ABYAPR11MB3397namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sent patch for master branch to upgrade krb5 1.20.1 -> 1.20.2 - https://lor=
e.kernel.org/openembedded-devel/20230901171832.276070-1-soumya.sambu@windri=
ver.com/T/#u

Regards,
Soumya
________________________________
From: Mittal, Anuj <anuj.mittal@intel.com>
Sent: Friday, August 25, 2023 1:38 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>; Sambu, Soumya <Soumya.Sambu@windriver.com>
Subject: Re: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix CVE-202=
3-36054

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Fri, 2023-08-25 at 07:39 +0000, Soumya via lists.openembedded.org
wrote:
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> lib/kadm5/kadm_rpc_xdr.c in MIT Kerberos 5 (aka krb5) before 1.20.2
> and 1.21.x before 1.21.1 frees an uninitialized pointer. A remote
> authenticated user can trigger a kadmind crash. This occurs because
> _xdr_kadm5_principal_ent_rec does not validate the relationship
> between n_key_data and the key_data array count.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-36054
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../krb5/krb5/CVE-2023-36054.patch            | 68
> +++++++++++++++++++
>  .../recipes-connectivity/krb5/krb5_1.20.1.bb  |  1 +

I think this recipe can be upgraded to 1.20.2 instead.

Thanks,

Anuj

>  2 files changed, 69 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-
> 36054.patch
>
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-
> 36054.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-
> 36054.patch
> new file mode 100644
> index 000000000..160c090bc
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch
> @@ -0,0 +1,68 @@
> +From ef08b09c9459551aabbe7924fb176f1583053cdd Mon Sep 17 00:00:00
> 2001
> +From: Greg Hudson <ghudson@mit.edu>
> +Date: Mon, 21 Aug 2023 03:08:15 +0000
> +Subject: [PATCH] Ensure array count consistency in kadm5 RPC
> +
> +In _xdr_kadm5_principal_ent_rec(), ensure that n_key_data matches
> the
> +key_data array count when decoding.  Otherwise when the structure is
> +later freed, xdr_array() could iterate over the wrong number of
> +elements, either leaking some memory or freeing uninitialized
> +pointers.  Reported by Robert Morris.
> +
> +CVE: CVE-2023-36054
> +
> +An authenticated attacker can cause a kadmind process to crash by
> +freeing uninitialized pointers.  Remote code execution is unlikely.
> +An attacker with control of a kadmin server can cause a kadmin
> client
> +to crash by freeing uninitialized pointers.
> +
> +ticket: 9099 (new)
> +tags: pullup
> +target_version: 1.21-next
> +target_version: 1.20-next
> +
> +Upstream-Status: Backport
> [https://github.com/krb5/krb5/commit/ef08b09c9459551aabbe7924fb176f15
> 83053cdd]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + src/lib/kadm5/kadm_rpc_xdr.c | 11 ++++++++---
> + 1 file changed, 8 insertions(+), 3 deletions(-)
> +
> +diff --git a/src/lib/kadm5/kadm_rpc_xdr.c
> b/src/lib/kadm5/kadm_rpc_xdr.c
> +index 2892d41..94b1ce8 100644
> +--- a/src/lib/kadm5/kadm_rpc_xdr.c
> ++++ b/src/lib/kadm5/kadm_rpc_xdr.c
> +@@ -390,6 +390,7 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs,
> kadm5_principal_ent_rec *objp,
> +                            int v)
> + {
> +       unsigned int n;
> ++      bool_t r;
> +
> +       if (!xdr_krb5_principal(xdrs, &objp->principal)) {
> +               return (FALSE);
> +@@ -443,6 +444,9 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs,
> kadm5_principal_ent_rec *objp,
> +       if (!xdr_krb5_int16(xdrs, &objp->n_key_data)) {
> +               return (FALSE);
> +       }
> ++      if (xdrs->x_op =3D=3D XDR_DECODE && objp->n_key_data < 0) {
> ++              return (FALSE);
> ++      }
> +       if (!xdr_krb5_int16(xdrs, &objp->n_tl_data)) {
> +               return (FALSE);
> +       }
> +@@ -451,9 +455,10 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs,
> kadm5_principal_ent_rec *objp,
> +               return FALSE;
> +       }
> +       n =3D objp->n_key_data;
> +-      if (!xdr_array(xdrs, (caddr_t *) &objp->key_data,
> +-                     &n, ~0, sizeof(krb5_key_data),
> +-                     xdr_krb5_key_data_nocontents)) {
> ++      r =3D xdr_array(xdrs, (caddr_t *) &objp->key_data, &n, objp-
> >n_key_data,
> ++                    sizeof(krb5_key_data),
> xdr_krb5_key_data_nocontents);
> ++      objp->n_key_data =3D n;
> ++      if (!r) {
> +               return (FALSE);
> +       }
> +
> +--
> +2.40.0
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-
> oe/recipes-connectivity/krb5/krb5_1.20.1.bb
> index 10fff11c2..e353b58aa 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb
> @@ -29,6 +29,7 @@ SRC_URI =3D
> "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}.tar.gz \
>             file://etc/default/krb5-admin-server \
>             file://krb5-kdc.service \
>             file://krb5-admin-server.service \
> +           file://CVE-2023-36054.patch;striplevel=3D2 \
>  "
>  SRC_URI[md5sum] =3D "73f5780e7b587ccd8b8cfc10c965a686"
>  SRC_URI[sha256sum] =3D
> "704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104600):
> https://lists.openembedded.org/g/openembedded-devel/message/104600
> Mute This Topic: https://lists.openembedded.org/mt/100951656/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> anuj.mittal@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_BYAPR11MB339733702285E2EADC3CBB2481E4ABYAPR11MB3397namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Sent patch <span style=3D"display: inline !important; background-color: rgb=
(255, 255, 255);" class=3D"ContentPasted1">
for master branch&nbsp;</span>to upgrade krb5 1.20.1 -&gt; 1.20.2 -&nbsp;<a=
 href=3D"https://lore.kernel.org/openembedded-devel/20230901171832.276070-1=
-soumya.sambu@windriver.com/T/#u" id=3D"LPlnk744743">https://lore.kernel.or=
g/openembedded-devel/20230901171832.276070-1-soumya.sambu@windriver.com/T/#=
u</a><br>
<br>
Regards,
<div>Soumya</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mittal, Anuj &lt;anuj=
.mittal@intel.com&gt;<br>
<b>Sent:</b> Friday, August 25, 2023 1:38 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;; Sambu, Soumya &lt;Soumya.Sambu@windriver.com&g=
t;<br>
<b>Subject:</b> Re: [oe][meta-oe][master][mickledore][PATCH 1/1] krb5: Fix =
CVE-2023-36054</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Fri, 2023-08-25 at 07:39 +0000, Soumya via lists.openembedded.org<br>
wrote:<br>
&gt; From: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt;<br>
&gt; lib/kadm5/kadm_rpc_xdr.c in MIT Kerberos 5 (aka krb5) before 1.20.2<br=
>
&gt; and 1.21.x before 1.21.1 frees an uninitialized pointer. A remote<br>
&gt; authenticated user can trigger a kadmind crash. This occurs because<br=
>
&gt; _xdr_kadm5_principal_ent_rec does not validate the relationship<br>
&gt; between n_key_data and the key_data array count.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-36054">https://nv=
d.nist.gov/vuln/detail/CVE-2023-36054</a><br>
&gt;<br>
&gt; Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../krb5/krb5/CVE-2023-36054.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 68<br>
&gt; +++++++++++++++++++<br>
&gt;&nbsp; .../recipes-connectivity/krb5/krb5_1.20.1.bb&nbsp; |&nbsp; 1 +<b=
r>
<br>
I think this recipe can be upgraded to 1.20.2 instead.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt;&nbsp; 2 files changed, 69 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/CVE-20=
23-<br>
&gt; 36054.patch<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-<br>
&gt; 36054.patch b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-<br>
&gt; 36054.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..160c090bc<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-oe/recipes-connectivity/krb5/krb5/CVE-2023-36054.patch<br>
&gt; @@ -0,0 +1,68 @@<br>
&gt; +From ef08b09c9459551aabbe7924fb176f1583053cdd Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Greg Hudson &lt;ghudson@mit.edu&gt;<br>
&gt; +Date: Mon, 21 Aug 2023 03:08:15 +0000<br>
&gt; +Subject: [PATCH] Ensure array count consistency in kadm5 RPC<br>
&gt; +<br>
&gt; +In _xdr_kadm5_principal_ent_rec(), ensure that n_key_data matches<br>
&gt; the<br>
&gt; +key_data array count when decoding.&nbsp; Otherwise when the structur=
e is<br>
&gt; +later freed, xdr_array() could iterate over the wrong number of<br>
&gt; +elements, either leaking some memory or freeing uninitialized<br>
&gt; +pointers.&nbsp; Reported by Robert Morris.<br>
&gt; +<br>
&gt; +CVE: CVE-2023-36054<br>
&gt; +<br>
&gt; +An authenticated attacker can cause a kadmind process to crash by<br>
&gt; +freeing uninitialized pointers.&nbsp; Remote code execution is unlike=
ly.<br>
&gt; +An attacker with control of a kadmin server can cause a kadmin<br>
&gt; client<br>
&gt; +to crash by freeing uninitialized pointers.<br>
&gt; +<br>
&gt; +ticket: 9099 (new)<br>
&gt; +tags: pullup<br>
&gt; +target_version: 1.21-next<br>
&gt; +target_version: 1.20-next<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D""></a>https://github.com/krb5/krb5/commit/ef08b09c9459551a=
abbe7924fb176f15<br>
&gt; 83053cdd]<br>
&gt; +<br>
&gt; +Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
&gt; +---<br>
&gt; + src/lib/kadm5/kadm_rpc_xdr.c | 11 ++++++++---<br>
&gt; + 1 file changed, 8 insertions(+), 3 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/src/lib/kadm5/kadm_rpc_xdr.c<br>
&gt; b/src/lib/kadm5/kadm_rpc_xdr.c<br>
&gt; +index 2892d41..94b1ce8 100644<br>
&gt; +--- a/src/lib/kadm5/kadm_rpc_xdr.c<br>
&gt; ++++ b/src/lib/kadm5/kadm_rpc_xdr.c<br>
&gt; +@@ -390,6 +390,7 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs,<br>
&gt; kadm5_principal_ent_rec *objp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; int v)<br>
&gt; + {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int n;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool_t r;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xdr_krb5_principal(xdrs, &a=
mp;objp-&gt;principal)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (FALSE);<br>
&gt; +@@ -443,6 +444,9 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs,<br>
&gt; kadm5_principal_ent_rec *objp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xdr_krb5_int16(xdrs, &amp;o=
bjp-&gt;n_key_data)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xdrs-&gt;x_op =3D=3D XDR_DECODE &=
amp;&amp; objp-&gt;n_key_data &lt; 0) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return (FALSE);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xdr_krb5_int16(xdrs, &amp;o=
bjp-&gt;n_tl_data)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +@@ -451,9 +455,10 @@ _xdr_kadm5_principal_ent_rec(XDR *xdrs,<br>
&gt; kadm5_principal_ent_rec *objp,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return FALSE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; n =3D objp-&gt;n_key_data;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xdr_array(xdrs, (caddr_t *) &amp=
;objp-&gt;key_data,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;n, ~0, sizeof(krb=
5_key_data),<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xdr_krb5_key_data_noco=
ntents)) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D xdr_array(xdrs, (caddr_t *) &am=
p;objp-&gt;key_data, &amp;n, objp-<br>
&gt; &gt;n_key_data,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(krb5_key_data),<br>
&gt; xdr_krb5_key_data_nocontents);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; objp-&gt;n_key_data =3D n;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!r) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; return (FALSE);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb b/meta-<=
br>
&gt; oe/recipes-connectivity/krb5/krb5_1.20.1.bb<br>
&gt; index 10fff11c2..e353b58aa 100644<br>
&gt; --- a/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb<br>
&gt; +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.20.1.bb<br>
&gt; @@ -29,6 +29,7 @@ SRC_URI =3D<br>
&gt; &quot;<a href=3D""></a>http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_=
VER}/${BP}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://etc/default/krb5-admin-server">file://etc/default/krb5-=
admin-server</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://krb5-kdc.service">file://krb5-kdc.service</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://krb5-admin-server.service">file://krb5-admin-server.ser=
vice</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-36054.patch;striplevel=3D2">file://CVE-2023-36054.patch=
;striplevel=3D2</a> \<br>
&gt;&nbsp; &quot;<br>
&gt;&nbsp; SRC_URI[md5sum] =3D &quot;73f5780e7b587ccd8b8cfc10c965a686&quot;=
<br>
&gt;&nbsp; SRC_URI[sha256sum] =3D<br>
&gt; &quot;704aed49b19eb5a7178b34b2873620ec299db08752d6a8574f95d41879ab8851=
&quot;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#104600):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/104600">https://lists.openembedded.org/g/openembedded-devel/message/104600=
</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10095165=
6/3616702">
https://lists.openembedded.org/mt/100951656/3616702</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub">=
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<br>
&gt; anuj.mittal@intel.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BYAPR11MB339733702285E2EADC3CBB2481E4ABYAPR11MB3397namp_--

