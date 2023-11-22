Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98874C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 08:57:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15119.1700643429735627787
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Nov 2023 00:57:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UuwBD63a;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9690644334=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3AM8FBbI026179
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 00:57:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:references:in-reply-to
	:content-type:mime-version; s=PPS06212021; bh=0LRahgxVFnH67HStl5
	mWgcEBX23AfrzVM4RgOmm1VkA=; b=UuwBD63ai2wnih7NGh2drJ4TyCmmMLSTMp
	HJwWrYRUnZoWacAzftR21RZik+RL+sPDZaxG8/zeqBc4R/YkSxd2vOekxlib3gjH
	ASSX4Cezs6D1S3Eg/8d3o/Vao3Vn83+eSGG46bdqk7vd07+LkUwvsYrbsrPyb3D6
	QqqBuXKPAsE8Y0NNi81/3H+L2tnXQZ/bU4DuHBSMO9SeArWgPQ87N7P9x1MKWRDU
	Ql3nU9aQ3TByBQlnPMHtS3n197xGmVB5SqPa3B1FNEk5BD0hxlLvKd4DW9ZlEcQP
	DZZT/rZ8OBs8NWEwh2VYmiJ3SY9CmMxUNOQKCuQJLUn7+bbpSpLg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnku1c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 00:57:08 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.24/8.17.1.24) with ESMTP id 3AM8v8OO002341;
	Wed, 22 Nov 2023 00:57:08 -0800
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3uewnku1c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 00:57:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dn97tM81b4ovCadfPqOLCzYP3KY1dnJddvsn/kUdKhYJb9AkDehfEn5M1wKo0J2q69sRA/7KdcsCDcZD1GxbBD5AluAtKAc7YgUlPwMdITvfazjOQpKnHaOcQFzBnR9rxjeucVnI5cvqlV6gLNx0q20HesJIMOfMni33myVGa/wsYbEPEwTMEPKoRv0IK47Q9NLu3ZNk11l4Ie/JwSmh+jN6e6ACj+2QFr6o5j72+M4RrwSsbBcssfsGqkcFQ8SHeMSDRrRAaPj6Z4sA1je8IbNOanM6PbYxOWTpIqUlm8KXL+jpD4JCu7APDNuWkWCDCYARGFOXCx9D3JFHMa+fPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0LRahgxVFnH67HStl5mWgcEBX23AfrzVM4RgOmm1VkA=;
 b=YkBFpp90K6fE3hXIWldFqtVAaSaQIZurEcDCfolq54LEm1lY/tVF+zXP518MOiW3xeqLzYjgmcUc983SEFcAdNtPoW/yhUGMyKdVetzgzvCf3DqK2Yvb7MZQ0Wt0b+QFCl2v93fs7/h8gPb1zbbGHoyI2X7hTxoC9Isw8uSS0ND1jZsfGhB/p8Hv/3doQs6BMTO9/0gEmU56PTZ9F6ycN12PR5SA0v74+156VoylhLAVa+bPX5KzH3H8vKpZIWdUdGbBIzjXRtIlU7mgVWWKtwxx3bv7JzCBqsm3d4JSzhmBD4UQWj9e/1vg4L0Qax2hATiEEBGNNo63tRESDtSvHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28; Wed, 22 Nov
 2023 08:57:04 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::d836:9049:e781:2391%5]) with mapi id 15.20.7025.017; Wed, 22 Nov 2023
 08:57:03 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/2] samba: fix
 CVE-2023-4091
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 1/2] samba: fix
 CVE-2023-4091
Thread-Index: AQHaHQAw/hzJVzbIQE6MvlvhssOYZrCF18QAgAAxDog=
Date: Wed, 22 Nov 2023 08:57:03 +0000
Message-ID: 
 <MW4PR11MB5822FD2504A1F5D34E19DFA984BAA@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20231122045524.53871-1-archana.polampalli@windriver.com>
 <a860322667c2a74eb4f256dee0e303bb67b47878.camel@intel.com>
In-Reply-To: <a860322667c2a74eb4f256dee0e303bb67b47878.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|SA2PR11MB5146:EE_
x-ms-office365-filtering-correlation-id: 4fef762e-06f4-44b4-5823-08dbeb38ff69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 2ZM49DruyVbPlQ9kzKK/XIl57bLncD70w58evQKCOq+93g4RpyW1Tzm9MMerO1org/zfa9fnorcZlHBgLNyUBuGLbM8+592wPh24QwIdAcPZFqY6ooh3Denx5IEjfRBU7fCW1lsWjNdAFgrP1IYcMf2oh+4HzGL3u263+W7TIzEf8NqpByFSNprgajLI7zdvFdsmlTj1nF1xlYLzZMqHYdKwMPo3LF9E4lXjReXTeKRU7W1iIuZz8HPD7jkOY9DApNijyN+8DgevL+zBgCol5CmahA4XrwBMHxLVJDU1No133v7Rt8IvmavM64+ECycF4txdFvsAMwy8iWOgMjEavtGMPTQVLZCiqvssKg3arZTNTZcJnzzC9PCYukz9vT7sStWJPkH+Z984fkks2wyprPAxJdeTg7TAzIbBoi2LFX2C4PbSgKdSDR1hUZmiVryOWfV9fYmBceBRoTi5vv0oiq264Pd0ulT4bV8dnTP8wQpHa9tq6muUM/obuLwHSuKL1b6fWNZ0pzQ2PFEuBy9tyQAMcPFP6CAd3fVEFtGv8ddyoQ3N6lfbjwMv9PvFkA6YANXeEg8EjOBwXym7cmBNndXmRj7OWhFonV/CxDQy7tnXlfxdDZ6frvjWVG4qbvuv3/2tY++TL+qzUUxldUR4fNQdnzVkpzoJ0jDwmWqpaQ31EBfQgowCMMJ+GYOhQk7E
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39850400004)(376002)(230922051799003)(230173577357003)(230273577357003)(186009)(1800799012)(64100799003)(451199024)(55016003)(38070700009)(19627405001)(86362001)(66899024)(71200400001)(7696005)(110136005)(316002)(91956017)(966005)(66946007)(64756008)(1015004)(66476007)(66556008)(122000001)(33656002)(166002)(9686003)(66446008)(4001150100001)(83380400001)(26005)(53546011)(30864003)(2906002)(5660300002)(41300700001)(52536014)(6506007)(21615005)(8936002)(478600001)(76116006)(38100700002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?LQrahg2aE7mU7qIXoxfBuInLCikHHAah8+XESKF6/m3XnTM3qRW+SSci9z?=
 =?iso-8859-1?Q?lGo/uu8d3EFl1XmX6zVQFX7/ROakXOEVFOjSyDKfeGbSL7gjzRkLARW8aV?=
 =?iso-8859-1?Q?G9AO3jLk7HmLVcy98Pizj7J90oX1cW5fjzrelkDsur6I9S5fGqChFChExC?=
 =?iso-8859-1?Q?uGpImgG4bw0aQd4pno+vK9WkU9Ockq7g/spcNUZN+TrvItnTa+SJysDRL/?=
 =?iso-8859-1?Q?7MWv6KTCkpVrIuNU2p9MwJF7VTB4wJxms7yADaojJPM8DMyZsDHxLe9OgP?=
 =?iso-8859-1?Q?IhoUS0lwlIg9kvlopgSBoo2LtOwebaeQb987FwapIaNXsWyUi5Y/b0L/kj?=
 =?iso-8859-1?Q?YRXg5Xk6iVxnDPq1UyQ50jNvoBcUr7iTih1j5/9kAL1do5PdNf71mPqtBR?=
 =?iso-8859-1?Q?EYSk+tMZw6i+QJcf7ipin7LrOuMOcwYOSiq1FHBhuRh4KCFqUFOvIpyhD3?=
 =?iso-8859-1?Q?2+KTo++LS/YAKFLNFh2Q9IrPOT5EkU9HLQBIQLE7pvWhAvse3lXr3jESd+?=
 =?iso-8859-1?Q?jg2vmRLb5eIha60+n1A9nA0lJqyp/0gOQgOtTYBdIzYCy48hollhJ6vzM0?=
 =?iso-8859-1?Q?ENclf8cMfaGySBTstw3UvdnYeNq/KTbugPts+7LUB2NenKjYzTcNeShFRV?=
 =?iso-8859-1?Q?0R0mq57C8pMmLJTFIRq1DKuO2ycnRy7ZblrzC8SQCBKFu1fSDSOM9gQ2Jf?=
 =?iso-8859-1?Q?lA1NLxLQ4tQaXDXcPpd4wLJiA2MUHPZbUJUA8Ya1tRkj9UBd08NlFjgj0R?=
 =?iso-8859-1?Q?NlztJ1n730wU/lpl+FiPxTGlXzy7gW52kjcfOzDFCfhcjn6JBYRPoDvVbu?=
 =?iso-8859-1?Q?bgJWgE8pBVytn014FyvkT377dM7V+pf+NLVj0C4vb/5HI/RviWzWyX0U+V?=
 =?iso-8859-1?Q?kcNeWaJQRKas+vbQiKQXt2QI6/tncG82ty5OTOb7SFyparbIX0npu8Vaq+?=
 =?iso-8859-1?Q?wdTDiGT7kZ4Ls6E0B8VYD32l8AUi5fCQmJc6RTG4VNOixWaEwmtCvvRChR?=
 =?iso-8859-1?Q?7U1QxuyZO6QaAR2jLCIrqXN/FgG2emGRk9zqCOzFsIl/A0H6lA1sNPVnF3?=
 =?iso-8859-1?Q?TjWD6wluiBwJ5zIYD/nEDWy08xN3CQl2HJPfU/jUTSksSgbQKJ4Mih3LIk?=
 =?iso-8859-1?Q?BTU3FAjckMFk8d1P0+VrSdCJF7LrHep1vofMG9yHg39EBpp/mVaUJEC4wg?=
 =?iso-8859-1?Q?t75iY4T7Ni1jhBuAwk6yhxVUhw4Yg1UiqJdPiQ761fWdIRj+5U1e+iMf88?=
 =?iso-8859-1?Q?OybnP12gqATfupCbL9i+4qjXb7eW0DysX2ubWofBYTdFLTOyNSEkGWy20A?=
 =?iso-8859-1?Q?EQRK80rlFGdCTBPZGGVvxTBzS/xgFD/v516RfWWmRG/KNFm/fwn7jPF1lJ?=
 =?iso-8859-1?Q?wmOmmMlYAmZN6/ukl+9i70hlztKz9xZhz1QaGza4nt+jouYQMxjasndeUf?=
 =?iso-8859-1?Q?f8iNXcNQuR6rxKBnlaSMxf1YnhmSeIe/Ye4qRLTxIltPMK4zgz7yk+4XAd?=
 =?iso-8859-1?Q?QQsdqVuZVEjZO3lGgu/3Slu3zH+Br2QB5q+MSwZdyJBIvpT0fmoYW0IPO6?=
 =?iso-8859-1?Q?P3WGQM35PCe5Lz1/0PFTq13k6ZzWE1VY0GPjIo6f+XjF0rJcchz3eX/3T1?=
 =?iso-8859-1?Q?kemIfH+uOlk5lbUb6vRVzU9mL1cssuUFrMKBKvGiSWGpqiigYaT5g4IA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822FD2504A1F5D34E19DFA984BAAMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fef762e-06f4-44b4-5823-08dbeb38ff69
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2023 08:57:03.8734
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fdwNu6sPKoi/yclyd0WbmOLHGJnrTF4+jdnN12Q/EyHJTfNAeMEfkIQeOdh6D0sQB8bwsM85dsjLAIdvriCXDYpOwCoQi5W/iVnO+cPQfN8Do5MrqnUGLxjNHrwQnU62
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
X-Proofpoint-ORIG-GUID: neQXVBnMHe7DpLZ9wM6kFrbB6Y2lYPMV
X-Proofpoint-GUID: Cmrr3oTj6EiMJ0OOUiXs7qTkrWWkVXGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2311220062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 08:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107007

--_000_MW4PR11MB5822FD2504A1F5D34E19DFA984BAAMW4PR11MB5822namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

It affects all versions of Samba, Sent V2.
https://www.samba.org/samba/security/CVE-2023-4091.html

Thank you,

Regards,
Archana

________________________________
From: Mittal, Anuj <anuj.mittal@intel.com>s
Sent: Wednesday, November 22, 2023 11:28
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-de=
vel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/2] samba: fix CVE-202=
3-4091

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On Wed, 2023-11-22 at 04:55 +0000, Polampalli, Archana via
lists.openembedded.org wrote:
> From: Archana Polampalli <archana.polampalli@windriver.com>
>
> A vulnerability was discovered in Samba, where the flaw allows SMB
> clients to
> truncate files, even with read-only permissions when the Samba VFS
> module
> "acl_xattr" is configured with "acl_xattr:ignore system acls =3D yes".
> The SMB
> protocol allows opening files when the client requests read-only
> access but
> then implicitly truncates the opened file to 0 bytes if the client
> specifies
> a separate OVERWRITE create disposition request. The issue arises in
> configurations
> that bypass kernel file system permissions checks, relying solely on
> Samba's permissions.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-4091
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>  .../samba/samba/CVE-2023-4091-0001.patch      |  40 ++++
>  .../samba/samba/CVE-2023-4091-0002.patch      | 193
> ++++++++++++++++++
>  .../samba/samba_4.14.14.bb                    |   2 +
>  3 files changed, 235 insertions(+)
>  create mode 100644 meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0001.patch
>  create mode 100644 meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0002.patch
>
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-
> 2023-4091-0001.patch b/meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0001.patch
> new file mode 100644
> index 000000000..ff80e9377
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-
> 0001.patch
> @@ -0,0 +1,40 @@
> +From 8b26f634372f11edcbea33dfd68a3d57889dfcc5 Mon Sep 17 00:00:00
> 2001
> +From: Ralph Boehme <slow@samba.org>
> +Date: Tue, 1 Aug 2023 13:04:36 +0200
> +Subject: [PATCH] CVE-2023-4091: smbd: use open_access_mask for
> access check in
> +  open_file()
> +
> +If the client requested FILE_OVERWRITE[_IF], we're implicitly adding
> +FILE_WRITE_DATA to the open_access_mask in open_file_ntcreate(), but
> for the
> +access check we're using access_mask which doesn't contain the
> additional
> +right, which means we can end up truncating a file for which the
> user has
> +only read-only access via an SD.
> +
> +BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15439
> +
> +Signed-off-by: Ralph Boehme <slow@samba.org>
> +
> +CVE: CVE-2023-4091
> +
> +Upstream-Status: Backport
> [https://github.com/samba-team/samba/commit/8b26f634372f11edcbea33dfd
> 68a3d57889dfcc5]

The changes in this patch are different from what is being patched here
in this commit. Different function call so do these changes apply to
4.14 as well? And, it seems you have missed one function call as well.

Thanks,

Anuj

> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + source3/smbd/open.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/source3/smbd/open.c b/source3/smbd/open.c
> +index 2c3bf9e..2b19aae 100644
> +--- a/source3/smbd/open.c
> ++++ b/source3/smbd/open.c
> +@@ -1402,7 +1402,7 @@ static NTSTATUS open_file(files_struct *fsp,
> +                                               conn->cwd_fsp,
> +                                               smb_fname,
> +                                               false,
> +-                                              access_mask);
> ++                                              open_access_mask);
> +
> +                               if (!NT_STATUS_IS_OK(status)) {
> +                                       DEBUG(10, ("open_file: "
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-
> 2023-4091-0002.patch b/meta-networking/recipes-
> connectivity/samba/samba/CVE-2023-4091-0002.patch
> new file mode 100644
> index 000000000..908ab85ba
> --- /dev/null
> +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-
> 0002.patch
> @@ -0,0 +1,193 @@
> +From b08a60160e6ab8d982d31844bcbf7ab67ff3a8de Mon Sep 17 00:00:00
> 2001
> +From: Ralph Boehme <slow@samba.org>
> +Date: Tue, 1 Aug 2023 12:30:00 +0200
> +Subject: [PATCH 2/2] CVE-2023-4091: smbtorture: test overwrite
> dispositions on
> + read-only file
> +
> +BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D15439
> +
> +Signed-off-by: Ralph Boehme <slow@samba.org>
> +
> +CVE: CVE-2023-4091
> +
> +Upstream-Status: Backport
> [https://github.com/samba-team/samba/commit/b08a60160e6ab8d982d31844b
> cbf7ab67ff3a8de]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + selftest/knownfail.d/samba3.smb2.acls |   1 +
> + source4/torture/smb2/acls.c           | 145
> ++++++++++++++++++++++++++
> + 2 files changed, 146 insertions(+)
> + create mode 100644 selftest/knownfail.d/samba3.smb2.acls
> +
> +diff --git a/selftest/knownfail.d/samba3.smb2.acls
> b/selftest/knownfail.d/samba3.smb2.acls
> +new file mode 100644
> +index 0000000..18df260
> +--- /dev/null
> ++++ b/selftest/knownfail.d/samba3.smb2.acls
> +@@ -0,0 +1 @@
> ++^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE
> +diff --git a/source4/torture/smb2/acls.c
> b/source4/torture/smb2/acls.c
> +index 4f4538b..d26caeb 100644
> +--- a/source4/torture/smb2/acls.c
> ++++ b/source4/torture/smb2/acls.c
> +@@ -3023,6 +3023,149 @@ done:
> +       return ret;
> + }
> +
> ++static bool test_overwrite_read_only_file(struct torture_context
> *tctx,
> ++                                        struct smb2_tree *tree)
> ++{
> ++      NTSTATUS status;
> ++      struct smb2_create c;
> ++      const char *fname =3D BASEDIR
> "\\test_overwrite_read_only_file.txt<file://\\test_overwrite_read_only_fi=
le.txt>";
> ++      struct smb2_handle handle =3D {{0}};
> ++      union smb_fileinfo q;
> ++      union smb_setfileinfo set;
> ++      struct security_descriptor *sd =3D NULL, *sd_orig =3D NULL;
> ++      const char *owner_sid =3D NULL;
> ++      int i;
> ++      bool ret =3D true;
> ++
> ++      struct tcase {
> ++              int disposition;
> ++              const char *disposition_string;
> ++              NTSTATUS expected_status;
> ++      } tcases[] =3D {
> ++#define TCASE(d, s) {                         \
> ++              .disposition =3D d,               \
> ++              .disposition_string =3D #d,       \
> ++              .expected_status =3D s,           \
> ++      }
> ++              TCASE(NTCREATEX_DISP_OPEN, NT_STATUS_OK),
> ++              TCASE(NTCREATEX_DISP_SUPERSEDE,
> NT_STATUS_ACCESS_DENIED),
> ++              TCASE(NTCREATEX_DISP_OVERWRITE,
> NT_STATUS_ACCESS_DENIED),
> ++              TCASE(NTCREATEX_DISP_OVERWRITE_IF,
> NT_STATUS_ACCESS_DENIED),
> ++      };
> ++#undef TCASE
> ++
> ++      ret =3D smb2_util_setup_dir(tctx, tree, BASEDIR);
> ++      torture_assert_goto(tctx, ret, ret, done,
> "smb2_util_setup_dir not ok");
> ++
> ++      c =3D (struct smb2_create) {
> ++              .in.desired_access =3D SEC_STD_READ_CONTROL |
> ++                      SEC_STD_WRITE_DAC |
> ++                      SEC_STD_WRITE_OWNER,
> ++              .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,
> ++              .in.share_access =3D NTCREATEX_SHARE_ACCESS_READ |
> ++                      NTCREATEX_SHARE_ACCESS_WRITE,
> ++              .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,
> ++              .in.impersonation_level =3D
> NTCREATEX_IMPERSONATION_ANONYMOUS,
> ++              .in.fname =3D fname,
> ++      };
> ++
> ++      status =3D smb2_create(tree, tctx, &c);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_create failed\n");
> ++      handle =3D c.out.file.handle;
> ++
> ++      torture_comment(tctx, "get the original sd\n");
> ++
> ++      ZERO_STRUCT(q);
> ++      q.query_secdesc.level =3D RAW_FILEINFO_SEC_DESC;
> ++      q.query_secdesc.in.file.handle =3D handle;
> ++      q.query_secdesc.in.secinfo_flags =3D SECINFO_DACL |
> SECINFO_OWNER;
> ++
> ++      status =3D smb2_getinfo_file(tree, tctx, &q);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_getinfo_file
> failed\n");
> ++      sd_orig =3D q.query_secdesc.out.sd;
> ++
> ++      owner_sid =3D dom_sid_string(tctx, sd_orig->owner_sid);
> ++
> ++      sd =3D security_descriptor_dacl_create(tctx,
> ++                                      0, NULL, NULL,
> ++                                      owner_sid,
> ++                                      SEC_ACE_TYPE_ACCESS_ALLOWED,
> ++                                      SEC_FILE_READ_DATA,
> ++                                      0,
> ++                                      NULL);
> ++
> ++      ZERO_STRUCT(set);
> ++      set.set_secdesc.level =3D RAW_SFILEINFO_SEC_DESC;
> ++      set.set_secdesc.in.file.handle =3D handle;
> ++      set.set_secdesc.in.secinfo_flags =3D SECINFO_DACL;
> ++      set.set_secdesc.in.sd =3D sd;
> ++
> ++      status =3D smb2_setinfo_file(tree, &set);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_setinfo_file
> failed\n");
> ++
> ++      smb2_util_close(tree, handle);
> ++      ZERO_STRUCT(handle);
> ++
> ++      for (i =3D 0; i < ARRAY_SIZE(tcases); i++) {
> ++              torture_comment(tctx, "Verify open with %s
> dispostion\n",
> ++                              tcases[i].disposition_string);
> ++
> ++              c =3D (struct smb2_create) {
> ++                      .in.create_disposition =3D
> tcases[i].disposition,
> ++                      .in.desired_access =3D SEC_FILE_READ_DATA,
> ++                      .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,
> ++                      .in.share_access =3D
> NTCREATEX_SHARE_ACCESS_MASK,
> ++                      .in.impersonation_level =3D
> NTCREATEX_IMPERSONATION_ANONYMOUS,
> ++                      .in.fname =3D fname,
> ++              };
> ++
> ++              status =3D smb2_create(tree, tctx, &c);
> ++              smb2_util_close(tree, c.out.file.handle);
> ++              torture_assert_ntstatus_equal_goto(
> ++                      tctx, status, tcases[i].expected_status, ret,
> done,
> ++                      "smb2_create failed\n");
> ++      };
> ++
> ++      torture_comment(tctx, "put back original sd\n");
> ++
> ++      c =3D (struct smb2_create) {
> ++              .in.desired_access =3D SEC_STD_WRITE_DAC,
> ++              .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,
> ++              .in.share_access =3D NTCREATEX_SHARE_ACCESS_MASK,
> ++              .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,
> ++              .in.impersonation_level =3D
> NTCREATEX_IMPERSONATION_ANONYMOUS,
> ++              .in.fname =3D fname,
> ++      };
> ++
> ++      status =3D smb2_create(tree, tctx, &c);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_create failed\n");
> ++      handle =3D c.out.file.handle;
> ++
> ++      ZERO_STRUCT(set);
> ++      set.set_secdesc.level =3D RAW_SFILEINFO_SEC_DESC;
> ++      set.set_secdesc.in.file.handle =3D handle;
> ++      set.set_secdesc.in.secinfo_flags =3D SECINFO_DACL;
> ++      set.set_secdesc.in.sd =3D sd_orig;
> ++
> ++      status =3D smb2_setinfo_file(tree, &set);
> ++      torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
> ++                                      "smb2_setinfo_file
> failed\n");
> ++
> ++      smb2_util_close(tree, handle);
> ++      ZERO_STRUCT(handle);
> ++
> ++done:
> ++      smb2_util_close(tree, handle);
> ++      smb2_util_unlink(tree, fname);
> ++      smb2_deltree(tree, BASEDIR);
> ++      return ret;
> ++}
> ++
> ++
> + /*
> +    basic testing of SMB2 ACLs
> + */
> +@@ -3051,6 +3194,8 @@ struct torture_suite
> *torture_smb2_acls_init(TALLOC_CTX *ctx)
> +                       test_deny1);
> +       torture_suite_add_1smb2_test(suite, "MXAC-NOT-GRANTED",
> +                       test_mxac_not_granted);
> ++      torture_suite_add_1smb2_test(suite,
> "OVERWRITE_READ_ONLY_FILE",
> ++                      test_overwrite_read_only_file);
> +
> +       suite->description =3D talloc_strdup(suite, "SMB2-ACLS tests");
> +
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-
> connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-
> connectivity/samba/samba_4.14.14.bb
> index aa27592cb..dcb4d8137 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
> @@ -49,6 +49,8 @@ SRC_URI =3D "${SAMBA_MIRROR}/stable/samba-
> ${PV}.tar.gz \
>             file://CVE-2023-34968_0009.patch \
>             file://CVE-2023-34968_0010.patch \
>             file://CVE-2023-34968_0011.patch \
> +           file://CVE-2023-4091-0001.patch \
> +           file://CVE-2023-4091-0002.patch \
>             "
>
>  SRC_URI:append:libc-musl =3D " \
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106987):
> https://lists.openembedded.org/g/openembedded-devel/message/106987
> Mute This Topic: https://lists.openembedded.org/mt/102743948/3616702
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> anuj.mittal@intel.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_MW4PR11MB5822FD2504A1F5D34E19DFA984BAAMW4PR11MB5822namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
It affects all versions of Samba, Sent V2.</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><a href=3D"https://www.samba.org/samba/security/=
CVE-2023-4091.html" id=3D"LPlnk531387">https://www.samba.org/samba/security=
/CVE-2023-4091.html</a></span></div>
<div class=3D"elementToProof"><br>
</div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Thank you,</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div class=3D"elementToProof"><span style=3D"font-family: Aptos, Aptos_Embe=
ddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 1=
2pt; color: rgb(0, 0, 0);">Regards,</span></div>
<div class=3D"elementToProof">Archana<span style=3D"font-family: Aptos, Apt=
os_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-=
size: 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif; font-size: 11pt; color: rgb(0, 0, 0);"><b>From:</b>&nbsp;Mittal=
, Anuj &lt;anuj.mittal@intel.com&gt;s<br>
<b>Sent:</b>&nbsp;Wednesday, November 22, 2023 11:28<br>
<b>To:</b>&nbsp;Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt=
;; openembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.o=
penembedded.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [oe][meta-networking][kirkstone][PATCH 1/2] samba:=
 fix CVE-2023-4091</span>
<div>&nbsp;</div>
</div>
<div><span style=3D"font-size: 11pt;">CAUTION: This email comes from a non =
Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On Wed, 2023-11-22 at 04:55 +0000, Polampalli, Archana via<br>
lists.openembedded.org wrote:<br>
&gt; From: Archana Polampalli &lt;archana.polampalli@windriver.com&gt;<br>
&gt;<br>
&gt; A vulnerability was discovered in Samba, where the flaw allows SMB<br>
&gt; clients to<br>
&gt; truncate files, even with read-only permissions when the Samba VFS<br>
&gt; module<br>
&gt; &quot;acl_xattr&quot; is configured with &quot;acl_xattr:ignore system=
 acls =3D yes&quot;.<br>
&gt; The SMB<br>
&gt; protocol allows opening files when the client requests read-only<br>
&gt; access but<br>
&gt; then implicitly truncates the opened file to 0 bytes if the client<br>
&gt; specifies<br>
&gt; a separate OVERWRITE create disposition request. The issue arises in<b=
r>
&gt; configurations<br>
&gt; that bypass kernel file system permissions checks, relying solely on<b=
r>
&gt; Samba's permissions.<br>
&gt;<br>
&gt; References:<br>
&gt; <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-4091" id=3D"OWAa1=
46b88e-720a-a3c8-86c9-10b7ab879b78" class=3D"OWAAutoLink" data-auth=3D"NotA=
pplicable" data-loopstyle=3D"linkonly">
https://nvd.nist.gov/vuln/detail/CVE-2023-4091</a><br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../samba/samba/CVE-2023-4091-0001.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp; 40 ++++<br>
&gt;&nbsp; .../samba/samba/CVE-2023-4091-0002.patch&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; | 193<br>
&gt; ++++++++++++++++++<br>
&gt;&nbsp; .../samba/samba_4.14.14.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; 3 files changed, 235 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0001.patch<br>
&gt;&nbsp; create mode 100644 meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0002.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-<br>
&gt; 2023-4091-0001.patch b/meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0001.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..ff80e9377<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-<=
br>
&gt; 0001.patch<br>
&gt; @@ -0,0 +1,40 @@<br>
&gt; +From 8b26f634372f11edcbea33dfd68a3d57889dfcc5 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +Date: Tue, 1 Aug 2023 13:04:36 +0200<br>
&gt; +Subject: [PATCH] CVE-2023-4091: smbd: use open_access_mask for<br>
&gt; access check in<br>
&gt; +&nbsp; open_file()<br>
&gt; +<br>
&gt; +If the client requested FILE_OVERWRITE[_IF], we're implicitly adding<=
br>
&gt; +FILE_WRITE_DATA to the open_access_mask in open_file_ntcreate(), but<=
br>
&gt; for the<br>
&gt; +access check we're using access_mask which doesn't contain the<br>
&gt; additional<br>
&gt; +right, which means we can end up truncating a file for which the<br>
&gt; user has<br>
&gt; +only read-only access via an SD.<br>
&gt; +<br>
&gt; +BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15439" i=
d=3D"OWAd8ce1971-c2ff-1597-dd9d-50f94d32b676" class=3D"OWAAutoLink" data-au=
th=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://bugzilla.samba.org/show_bug.cgi?id=3D15439</a><br>
&gt; +<br>
&gt; +Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2023-4091<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [https://github.com/samba-team/samba/commit/8b26f634372f11edcbea33dfd<=
br>
&gt; 68a3d57889dfcc5]<br>
<br>
The changes in this patch are different from what is being patched here<br>
in this commit. Different function call so do these changes apply to<br>
4.14 as well? And, it seems you have missed one function call as well.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
&gt; +<br>
&gt; +Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&gt; +---<br>
&gt; + source3/smbd/open.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/source3/smbd/open.c b/source3/smbd/open.c<br>
&gt; +index 2c3bf9e..2b19aae 100644<br>
&gt; +--- a/source3/smbd/open.c<br>
&gt; ++++ b/source3/smbd/open.c<br>
&gt; +@@ -1402,7 +1402,7 @@ static NTSTATUS open_file(files_struct *fsp,<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conn-&gt;cwd_fsp,=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb_fname,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; false,<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; access_mask);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; open_access_mask);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!NT_STATUS_IS_OK(status)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; DEBUG(10, (&quot;open_file: &quot;<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-networking/recipes-connectivity/samba/samba/CVE-<br>
&gt; 2023-4091-0002.patch b/meta-networking/recipes-<br>
&gt; connectivity/samba/samba/CVE-2023-4091-0002.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..908ab85ba<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-connectivity/samba/samba/CVE-2023-4091-<=
br>
&gt; 0002.patch<br>
&gt; @@ -0,0 +1,193 @@<br>
&gt; +From b08a60160e6ab8d982d31844bcbf7ab67ff3a8de Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +Date: Tue, 1 Aug 2023 12:30:00 +0200<br>
&gt; +Subject: [PATCH 2/2] CVE-2023-4091: smbtorture: test overwrite<br>
&gt; dispositions on<br>
&gt; + read-only file<br>
&gt; +<br>
&gt; +BUG: <a href=3D"https://bugzilla.samba.org/show_bug.cgi?id=3D15439" i=
d=3D"OWAeb9a5e02-3c3f-b7fb-ef61-11213547ba75" class=3D"OWAAutoLink" data-au=
th=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://bugzilla.samba.org/show_bug.cgi?id=3D15439</a><br>
&gt; +<br>
&gt; +Signed-off-by: Ralph Boehme &lt;slow@samba.org&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2023-4091<br>
&gt; +<br>
&gt; +Upstream-Status: Backport<br>
&gt; [https://github.com/samba-team/samba/commit/b08a60160e6ab8d982d31844b<=
br>
&gt; cbf7ab67ff3a8de]<br>
&gt; +<br>
&gt; +Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&gt; +---<br>
&gt; + selftest/knownfail.d/samba3.smb2.acls |&nbsp;&nbsp; 1 +<br>
&gt; + source4/torture/smb2/acls.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; | 145<br>
&gt; ++++++++++++++++++++++++++<br>
&gt; + 2 files changed, 146 insertions(+)<br>
&gt; + create mode 100644 selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +<br>
&gt; +diff --git a/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; b/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000..18df260<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/selftest/knownfail.d/samba3.smb2.acls<br>
&gt; +@@ -0,0 +1 @@<br>
&gt; ++^samba3.smb2.acls.OVERWRITE_READ_ONLY_FILE<br>
&gt; +diff --git a/source4/torture/smb2/acls.c<br>
&gt; b/source4/torture/smb2/acls.c<br>
&gt; +index 4f4538b..d26caeb 100644<br>
&gt; +--- a/source4/torture/smb2/acls.c<br>
&gt; ++++ b/source4/torture/smb2/acls.c<br>
&gt; +@@ -3023,6 +3023,149 @@ done:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; + }<br>
&gt; +<br>
&gt; ++static bool test_overwrite_read_only_file(struct torture_context<br>
&gt; *tctx,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; struct smb2_tree *tree)<br>
&gt; ++{<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTSTATUS status;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smb2_create c;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *fname =3D BASEDIR<br>
&gt; &quot;<a href=3D"file://\\test_overwrite_read_only_file.txt" id=3D"OWA=
f4b8a7a1-8f9b-cb5c-a423-7dbabe042811" class=3D"OWAAutoLink" data-auth=3D"No=
tApplicable" data-loopstyle=3D"linkonly">\\test_overwrite_read_only_file.tx=
t</a>&quot;;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smb2_handle handle =3D {{0}};<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union smb_fileinfo q;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; union smb_setfileinfo set;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct security_descriptor *sd =3D NU=
LL, *sd_orig =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const char *owner_sid =3D NULL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret =3D true;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct tcase {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; int disposition;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; const char *disposition_string;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; NTSTATUS expected_status;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } tcases[] =3D {<br>
&gt; ++#define TCASE(d, s) {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;\<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .disposition =3D d,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .disposition_string =3D #d,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .expected_status =3D s,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_OPEN, NT_STATUS_OK),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_SUPERSEDE,<br>
&gt; NT_STATUS_ACCESS_DENIED),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_OVERWRITE,<br>
&gt; NT_STATUS_ACCESS_DENIED),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; TCASE(NTCREATEX_DISP_OVERWRITE_IF,<br>
&gt; NT_STATUS_ACCESS_DENIED),<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++#undef TCASE<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smb2_util_setup_dir(tctx, tre=
e, BASEDIR);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_goto(tctx, ret, ret, d=
one,<br>
&gt; &quot;smb2_util_setup_dir not ok&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D (struct smb2_create) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.desired_access =3D SEC_STD_READ_CONTROL |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SEC_STD_WRITE_DA=
C |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SEC_STD_WRITE_OW=
NER,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.share_access =3D NTCREATEX_SHARE_ACCESS_READ |<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NTCREATEX_SHARE_=
ACCESS_WRITE,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.impersonation_level =3D<br>
&gt; NTCREATEX_IMPERSONATION_ANONYMOUS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.fname =3D fname,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_create(tree, tctx, &a=
mp;c);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_create failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle =3D c.out.file.handle;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_comment(tctx, &quot;get the o=
riginal sd\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(q);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.query_secdesc.level =3D RAW_FILEINF=
O_SEC_DESC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.query_secdesc.in.file.handle =3D ha=
ndle;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; q.query_secdesc.in.secinfo_flags =3D =
SECINFO_DACL |<br>
&gt; SECINFO_OWNER;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_getinfo_file(tree, tc=
tx, &amp;q);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_getinfo_file<br>
&gt; failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sd_orig =3D q.query_secdesc.out.sd;<b=
r>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; owner_sid =3D dom_sid_string(tctx, sd=
_orig-&gt;owner_sid);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sd =3D security_descriptor_dacl_creat=
e(tctx,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0, NULL, NULL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; owner_sid,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; SEC_ACE_TYPE_ACCESS_ALLOWED,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; SEC_FILE_READ_DATA,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; NULL);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.level =3D RAW_SFILEIN=
FO_SEC_DESC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.file.handle =3D ha=
ndle;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.secinfo_flags =3D =
SECINFO_DACL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.sd =3D sd;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_setinfo_file(tree, &a=
mp;set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_setinfo_file<br>
&gt; failed\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_close(tree, handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(handle);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ARRAY_SIZE(tcase=
s); i++) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; torture_comment(tctx, &quot;Verify open with %s<br>
&gt; dispostion\n&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcases[i].disposition_string);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; c =3D (struct smb2_create) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.create_dispo=
sition =3D<br>
&gt; tcases[i].disposition,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.desired_acce=
ss =3D SEC_FILE_READ_DATA,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.file_attribu=
tes =3D FILE_ATTRIBUTE_NORMAL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.share_access=
 =3D<br>
&gt; NTCREATEX_SHARE_ACCESS_MASK,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.impersonatio=
n_level =3D<br>
&gt; NTCREATEX_IMPERSONATION_ANONYMOUS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .in.fname =3D fn=
ame,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; status =3D smb2_create(tree, tctx, &amp;c);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; smb2_util_close(tree, c.out.file.handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; torture_assert_ntstatus_equal_goto(<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tctx, status, tc=
ases[i].expected_status, ret,<br>
&gt; done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;smb2_creat=
e failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_comment(tctx, &quot;put back =
original sd\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; c =3D (struct smb2_create) {<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.desired_access =3D SEC_STD_WRITE_DAC,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.file_attributes =3D FILE_ATTRIBUTE_NORMAL,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.share_access =3D NTCREATEX_SHARE_ACCESS_MASK,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.create_disposition =3D NTCREATEX_DISP_OPEN_IF,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.impersonation_level =3D<br>
&gt; NTCREATEX_IMPERSONATION_ANONYMOUS,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; .in.fname =3D fname,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_create(tree, tctx, &a=
mp;c);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_create failed\n&quot;);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; handle =3D c.out.file.handle;<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.level =3D RAW_SFILEIN=
FO_SEC_DESC;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.file.handle =3D ha=
ndle;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.secinfo_flags =3D =
SECINFO_DACL;<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set.set_secdesc.in.sd =3D sd_orig;<br=
>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D smb2_setinfo_file(tree, &a=
mp;set);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_assert_ntstatus_ok_goto(tctx,=
 status, ret, done,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; &quot;smb2_setinfo_file<br>
&gt; failed\n&quot;);<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_close(tree, handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZERO_STRUCT(handle);<br>
&gt; ++<br>
&gt; ++done:<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_close(tree, handle);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_util_unlink(tree, fname);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; smb2_deltree(tree, BASEDIR);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++<br>
&gt; + /*<br>
&gt; +&nbsp;&nbsp;&nbsp; basic testing of SMB2 ACLs<br>
&gt; + */<br>
&gt; +@@ -3051,6 +3194,8 @@ struct torture_suite<br>
&gt; *torture_smb2_acls_init(TALLOC_CTX *ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_deny1)=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_suite_add_1smb2_test(sui=
te, &quot;MXAC-NOT-GRANTED&quot;,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_mxac_n=
ot_granted);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; torture_suite_add_1smb2_test(suite,<b=
r>
&gt; &quot;OVERWRITE_READ_ONLY_FILE&quot;,<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_overwrite_r=
ead_only_file);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; suite-&gt;description =3D talloc=
_strdup(suite, &quot;SMB2-ACLS tests&quot;);<br>
&gt; +<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-networking/recipes-<br>
&gt; connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-<br>
&gt; connectivity/samba/samba_4.14.14.bb<br>
&gt; index aa27592cb..dcb4d8137 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
&gt; +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb<br>
&gt; @@ -49,6 +49,8 @@ SRC_URI =3D &quot;${SAMBA_MIRROR}/stable/samba-<br>
&gt; ${PV}.tar.gz \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-34968_0009.patch" id=3D"OWAc39142b4-3218-cd1a-=
5e2f-6f0199d5531e" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">
file://CVE-2023-34968_0009.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-34968_0010.patch" id=3D"OWAfc492423-713c-a49e-=
a1ac-edf58d94284e" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">
file://CVE-2023-34968_0010.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; <a href=3D"file://CVE-2023-34968_0011.patch" id=3D"OWAdd461c65-07da-d5f5-=
12eb-b5429d9a57f2" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-l=
oopstyle=3D"linkonly">
file://CVE-2023-34968_0011.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-4091-0001.patch" id=3D"OWA06ef5b65-5e8c-3856-6050-e2cc1=
9c6984c" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-loopstyle=
=3D"linkonly">
file://CVE-2023-4091-0001.patch</a>&nbsp;\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-4091-0002.patch" id=3D"OWAb87ad223-c62d-f33f-364d-45366=
c46a0cd" class=3D"OWAAutoLink" data-auth=3D"NotApplicable" data-loopstyle=
=3D"linkonly">
file://CVE-2023-4091-0002.patch</a>&nbsp;\<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &quot;<br>
&gt;<br>
&gt;&nbsp; SRC_URI:append:libc-musl =3D &quot; \<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#106987):<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/message=
/106987" id=3D"OWAcdce99ff-5565-bd52-9b02-39e52ea7458e" class=3D"OWAAutoLin=
k" data-auth=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://lists.openembedded.org/g/openembedded-devel/message/106987</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10274394=
8/3616702" id=3D"OWAcfe32cf2-7f8c-70dd-c820-03c82d896263" class=3D"OWAAutoL=
ink" data-auth=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://lists.openembedded.org/mt/102743948/3616702</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-devel/unsub" =
id=3D"OWA1fe0ca32-5247-846c-fb2c-c0dda8a03cf2" class=3D"OWAAutoLink" data-a=
uth=3D"NotApplicable" data-loopstyle=3D"linkonly">
https://lists.openembedded.org/g/openembedded-devel/unsub</a>&nbsp;[<br>
&gt; anuj.mittal@intel.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</span></div>
</body>
</html>

--_000_MW4PR11MB5822FD2504A1F5D34E19DFA984BAAMW4PR11MB5822namp_--

