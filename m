Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E374C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:50:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.40.1686329450044581461
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=pYH/eKWu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5524f7942f=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359G0Y0c014275
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jun 2023 16:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=B9/pQW99V42cFdvlKU0eipQgEPf7FRA14MWViy/H69M=;
 b=pYH/eKWuJ2xOJOCpWSVmjGUPokmVKogjTW4R+td3Tn/RMSm97v0yYPVfGE3C+i0GsRQl
 M9bhNhg+A/6bhvRu+6orVl07f+tE00MHwM9pkcdo2Isl9bjLZ2eRjn3l7bHxHwsxkMI2
 1v21AcNsPrueqS17JsVBUiU6+tASLrzZjEexx9CkW0t22Mn3rLiRwCAHEEeKGwtUGvCe
 nYlwYZiEajEJDwJW6dZ9zREbJkjDMCYakoy78bl9M52g4nLXBxc42ghznNB29mHiLO0V
 xDOTr+MvVLWMYEOu80iKac7ZF6AjuuWf17SzPG7rKy6vbKOn7pSETP9yB3dfjv5a/FwF kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2avq2vx9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 16:50:48 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 359GomjZ008208
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Jun 2023 16:50:48 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2avq2vx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 16:50:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTiiNLfyaB0e71MYRY/VTEp4KjLOdMGhQkd+PjAP0vyzpjEBn9jvCDLgkJ+4daKcP3ooqmDBNMICeBZ5hqKBOnwZPo1Kg65zDxMe4WkZBuVish1yIxEMuOdf6Xghc9IMODuHPoy1kN9M+NUEoJMpuA+vRprzmvum4aVfBs4waFisJZdDfQVQm3FNxlNXvp/KXVZaY1A+HW5fGG0SKcbrtyyxw6pVJJQ4CtZIGrSOVtj5aL5ONo59kpyNGqV3QL4lm0Zb8G1RmlrBoEmgS7gN7rIgRRIt/DTLRWoDcmCEuDJQjN+zBzHwUAPYB13yW9hbIak+fSM1wN4YuLQuMRXwfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9/pQW99V42cFdvlKU0eipQgEPf7FRA14MWViy/H69M=;
 b=lREz4op30qSzy8x9Ka4Z/kfUuYVzpeFIgFXb3LkrgitQj5YkZrYgOlysHGO8OPp2LNnV5G9IRFOQKhAcdbIDeHTNrdAWGzFzZ55iUUP2tC6cXiT9CWLX1B2fz/TF96bPund+Sxqux/ZoTFCtiVqi34BZ+EoKkDXkUVBT/zsABWbfaCgKsCSTcXYWAKhfVzhgC5rqunb09E4unZnCYhOQLdi8TtdP4Is5ZTu8fE55TlPcbm8vj4PTvn5vgr+2GcL0Jb0a1g0ABq0hSB4nbfKPiMX4HRe4276EXA7u6Ijy1CMI42zaOyNXP1lJvnZ8xkuZMCcW+cfn7xCmHYaJsjp6yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB5822.namprd11.prod.outlook.com (2603:10b6:303:185::9)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Fri, 9 Jun
 2023 16:50:45 +0000
Received: from MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a]) by MW4PR11MB5822.namprd11.prod.outlook.com
 ([fe80::e07c:46bf:324a:940a%4]) with mapi id 15.20.6455.030; Fri, 9 Jun 2023
 16:50:44 +0000
From: "Polampalli, Archana" <Archana.Polampalli@windriver.com>
To: akuster808 <akuster808@gmail.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: fix
 CVE-2023-27783
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: fix
 CVE-2023-27783
Thread-Index: AQHZmHCcA/Fp4w8SkUOHR7OgQT0rCK+Cs3VH
Date: Fri, 9 Jun 2023 16:50:44 +0000
Message-ID: 
 <MW4PR11MB5822AA22BCD641248C6363FD8451A@MW4PR11MB5822.namprd11.prod.outlook.com>
References: <20230605085416.4086325-1-archana.polampalli@windriver.com>
 <8bdc3c8c-829b-11e7-8ecd-2c35fbce34d8@gmail.com>
In-Reply-To: <8bdc3c8c-829b-11e7-8ecd-2c35fbce34d8@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB5822:EE_|CH3PR11MB7724:EE_
x-ms-office365-filtering-correlation-id: b964f422-5d90-47c0-f90a-08db6909ab14
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 PKnOsD1zOG61H14VKxSsOa9XJh59zkiEtiZvQ+x4jAHOvejhMmDP4uqJkRNPuUgJVshvaugRMkD0mZnsDCb1QRgmaJ2ClZQhIHi3qWOIFEtEFv1Zb3oYC9tMeDbhWFFMF/HI7wLWVC1txnT7LZV9fbcGStderl06nDn/l0lS5/XX0ri2N36GHL9WI7CuZs85T57n7nGYW7xYkjwvQ9JTgrRLGLQolstuMUT69hUyldo7NX407RwP1/DFbpuUTzYsj4X4bLd+rRpCR+kObVXnl4uzZzbKSX6aR8OiOFhfoHuB2TDJh8NrK01Vf7o8giXX+DQeeMwB/NqVIIv4ayOyd9bdMBLujQoAnOztvP0b7FQQC3Nh9Fj9mLagEm00m41CJfw5Hourh6NWHvZMW8xzdG6ocHQojTEggMBN2f2tYsjVU8dJHpRqFZfUAie3D0GDGrk5rBcPjKssiXl8brU94Ij/VskNb4prGE2IkT66mIpUjmwc6BScYwZsK3cgp6wMBt/2ChTMqon6UBxXeE///r+t64MkcZPKCVdoEAo3HYI5qyZwoQ86F7f3VlXRF8axIzbgub1zxLqN+49GSGfIqN7SWQSWQ3Jqo1q5mnW08l402Z1AqbDbMco6lm8b8NigdF9sHaW4xopeiU/pOivDS4nQdn71C/nqBcIlxS5Yg9UzjyYia2YZoV2y4fpsu77W
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB5822.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(451199021)(83380400001)(2906002)(18265965005)(166002)(86362001)(38070700005)(33656002)(122000001)(38100700002)(55016003)(316002)(41300700001)(966005)(5660300002)(52536014)(107886003)(8936002)(186003)(8676002)(110136005)(19627405001)(7696005)(478600001)(71200400001)(66556008)(64756008)(76116006)(6506007)(66446008)(45080400002)(66899021)(66476007)(55236004)(4326008)(53546011)(9686003)(66946007)(26005)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?q/q6hPsgRZXHQIFEh86QSE9wT+GKUoA0RNbaky3E7ENFyhreeCJEk1lViJvQ?=
 =?us-ascii?Q?IcMPWfBMc77ZXkdP0CqfrlJ5k7K+Dq/6z2udtC9xTTWks6bHNxTOvrgQjlI1?=
 =?us-ascii?Q?9E4wfExYHY2+NZiM4mA9g7WqrP4Q7ECGeanfpoFxUX+mPUqONrsieEx3Ldpp?=
 =?us-ascii?Q?PtdZN3nApH4AfEVZACFL/kfdfcQCxqufOlAVya61JtKz1iR3Xqk5KbQyLqEi?=
 =?us-ascii?Q?mO65hlJ1rOJm4ED5jq3NEnSK790qFiQtaKXNz4Y5BtBBbEP1cXJWJ5ZIh3Z9?=
 =?us-ascii?Q?8FynCOOrWopDi5kbCzMoGV0iM5gvyGOUloM9vKTbZmKBaYMTyaDblLRL5RNF?=
 =?us-ascii?Q?+sMbqYYaWKczDzkbkaSNy9ut/CnVq9s791m340b4KRFaE1QcirZMY0ni74Lr?=
 =?us-ascii?Q?WfUcF6wh8vbjstGmEH2Zwuk16oZ2fUbLwG7fGoGFhf9qcIrzu8xGffKmNhhH?=
 =?us-ascii?Q?Qn3NucXyoqZk0X4DdPJYY8bEoucCzxOz58Sw/sqZ0Ed+4jpsdBwuFaCvXk7e?=
 =?us-ascii?Q?y89CidlXMeZ00NNg38vsBJtHFGSeSfX67SrJ0+QghJmaikGC1XT/0SROFZOS?=
 =?us-ascii?Q?nRTc1sxa3RQ9LvoJbzzgN7AT6Xxab1YA6npf2HCc9uz6udMU0u1QQdCu5Xmo?=
 =?us-ascii?Q?vaySlVGfzZH5lszQm9ZwMsiwTmzExWTp8huO5VS4dLKx3n9nr1n1aFhcLjZb?=
 =?us-ascii?Q?P6XyjgxTgtxkQSKqPBaasc2M6Ya7BDm3sfutl+qUIgRzQqBVe3lqwnzBLW3y?=
 =?us-ascii?Q?7Q9M4Wkfy54PWemlfodul8JU3EYanhT7ZieD7rL1F5eVyg5XioO/NctAZ3z2?=
 =?us-ascii?Q?oaMekc+BykSrxd3vPspFy/cJTsUunCbomf8e/JjyUkoCHg6mqQIAritZSrSA?=
 =?us-ascii?Q?bs3ntN+KH5QgXUPQF6m54WKa0syv8xzGRMxWdxEaFfVrEX8Rsssrlcp0vaQI?=
 =?us-ascii?Q?1+yIVH8gTUcJm+3fR4QbB5Dffo8RdFsesRLhbPVzmzNtOwz8jUqGQZ2ta9Pl?=
 =?us-ascii?Q?JDZB1F6hRM7hyriUhH0ErV4uVXMc0IdQEsuX3JXwLb1GUem0CHha+NnxmRaz?=
 =?us-ascii?Q?YlvUnkx2iN9IxiQpJ2FuHD1j7pNdyjAsdbbh9ge2hGPRjQ8lKJFoDeyy1IFv?=
 =?us-ascii?Q?kjpCGtxMbosDKtpQaBpZEuRoLo3aAsBpl2QTuySx45CIR5z0I6fh+O6xU8Qt?=
 =?us-ascii?Q?fLyhrlRCuLefqFRPrGRcPm1Ki+tX0wk2GJDm3L7OBD98PX8vN4oAOOJagwok?=
 =?us-ascii?Q?Rq600yqPCSgvIUQP3dX+W60rnxHf4dBpdXCcqAwyFq6PABUOa0P+AF9CAuXP?=
 =?us-ascii?Q?9/ONp4tzmqjdrV01A9XzEjWcC/HiRb0cTYxouachNTHC1xZ3MiPVuIEZB002?=
 =?us-ascii?Q?kum2PZVSWef1y6Iq+MSReaeoC60dT3jM/Anuomj/zv1La0YYyN9vHpAGw4us?=
 =?us-ascii?Q?oURvWQ3HewKPcYGCQjiLDZGPKvPMdNY4GPceMLMq5greMGUz21rvWN+qZb6Z?=
 =?us-ascii?Q?CChmWwaSTp1Ogmji8hDpRrjzAgTiNH0vU+c8NRmHxEDLk6pKHCJ/cNGxRep/?=
 =?us-ascii?Q?yATbPBl0F/BCoDmGRcaL89Vx1uH7/x1otfj308A3SSNGxkTcwDZc9h1j32Ot?=
 =?us-ascii?Q?nQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MW4PR11MB5822AA22BCD641248C6363FD8451AMW4PR11MB5822namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB5822.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b964f422-5d90-47c0-f90a-08db6909ab14
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2023 16:50:44.8426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SPp6rgtUVhbs+fo1f/FBDIjbLr2hs+NhDzc7rCNiAVoyxu1FreGYGYg6IA2NwCQrcV8l7WAk0rUYA0RJOBKZD0rvDCbipTNZWJ+1QCCR4lvXPjosfJXoqM9rQDdC+fQM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
X-Proofpoint-GUID: tTppRgX94UXjGNva_N8oAaIN5QItcFDy
X-Proofpoint-ORIG-GUID: iH-HZDLQJCmjXb184Zpvp4qszSCNFJbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_12,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 mlxscore=0 mlxlogscore=675 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090142
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jun 2023 16:50:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103204

--_000_MW4PR11MB5822AA22BCD641248C6363FD8451AMW4PR11MB5822namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

Master is not patched, CVE fix is patched in tcpreplay master and 4.4.4 ver=
sion which is yet to release.

Regards,
Archana
________________________________
From: akuster808 <akuster808@gmail.com>
Sent: Tuesday, June 6, 2023 5:45 PM
To: Polampalli, Archana <Archana.Polampalli@windriver.com>; openembedded-de=
vel@lists.openembedded.org <openembedded-devel@lists.openembedded.org>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: fix CVE=
-2023-27783

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

On 6/5/23 4:54 AM, Polampalli, Archana via lists.openembedded.org wrote:
> An issue found in TCPreplay tcprewrite v.4.4.3 allows a remote attacker t=
o cause a denial
> of service via the tcpedit_dlt_cleanup function at plugins/dlt_plugins.c.
Thanks for the fix.

Master will need these fixes. If master is patched,  then we can update
tcpreplay to 4.4.3  all the way to kirkstone since this is a bug fix
only update and then all the versions will be the same.


- Armin
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
>   .../tcpreplay/tcpreplay/CVE-2023-27783.patch  | 29 +++++++++++++++++++
>   .../tcpreplay/tcpreplay_4.4.2.bb              |  4 ++-
>   2 files changed, 32 insertions(+), 1 deletion(-)
>   create mode 100644 meta-networking/recipes-support/tcpreplay/tcpreplay/=
CVE-2023-27783.patch
>
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023=
-27783.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023=
-27783.patch
> new file mode 100644
> index 000000000..59adff615
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-27783.=
patch
> @@ -0,0 +1,29 @@
> +From e831aad6d48874abab6efa37d4460da2be3ac765  Mon Sep 17 00:00:00 2001
> +From: Marsman1996 <lqliuyuwei@outlook.com>
> +Date: Wed Mar 1 14:48:48 2023 +0800
> +Subject: [PATCH] dlt_jnpr_ether_cleanup: check subctx before cleanup
> +
> +CVE: CVE-2023-27783
> +Upstream-Status: Backport [https://github.com/appneta/tcpreplay/commit/7=
aca59e4fc96fc1d0e43a3d64b2f9fc9a46b6ca8]
> +
> +Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> +---
> + src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tcped=
it/plugins/dlt_jnpr_ether/jnpr_ether.c
> +index e282ef4..98b67e9 100644
> +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c
> +@@ -168,7 +168,8 @@ dlt_jnpr_ether_cleanup(tcpeditdlt_t *ctx)
> +         jnpr_ether_config_t *config;
> +
> +         config =3D (jnpr_ether_config_t *)ctx->encoder->config;
> +-        tcpedit_dlt_cleanup(config->subctx);
> ++        if (config->subctx !=3D NULL)
> ++            tcpedit_dlt_cleanup(config->subctx);
> +         safe_free(plugin->config);
> +         plugin->config =3D NULL;
> +         plugin->config_size =3D 0;
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb=
 b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
> index 165a0e735..ccff19f16 100644
> --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
> +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
> @@ -7,7 +7,9 @@ SECTION =3D "net"
>   LICENSE =3D "GPL-3.0-only"
>   LIC_FILES_CHKSUM =3D "file://docs/LICENSE;md5=3D10f0474a2f0e5dccfca20f6=
9d6598ad8"
>
> -SRC_URI =3D "https://github.com/appneta/tcpreplay/releases/download/v${P=
V}/tcpreplay-${PV}.tar.gz"
> +SRC_URI =3D "https://github.com/appneta/tcpreplay/releases/download/v${P=
V}/tcpreplay-${PV}.tar.gz \
> +           file://CVE-2023-27783.patch \
> +           "
>
>   SRC_URI[sha256sum] =3D "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc4=
4e7b5fcb2f395b615"
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103126): https://lists.openembedded.org/g/openembedde=
d-devel/message/103126
> Mute This Topic: https://lists.openembedded.org/mt/99336397/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
kuster808@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--_000_MW4PR11MB5822AA22BCD641248C6363FD8451AMW4PR11MB5822namp_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi Armin,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Master is not patched, CVE fix is patched in tcpreplay master and 4.4.4 ver=
sion which is yet to release.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Archana&nbsp;</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> akuster808 &lt;akuste=
r808@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, June 6, 2023 5:45 PM<br>
<b>To:</b> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;; op=
enembedded-devel@lists.openembedded.org &lt;openembedded-devel@lists.openem=
bedded.org&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe][meta-networking][kirkstone][PATCH 1/1] tcpreplay: =
fix CVE-2023-27783</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
On 6/5/23 4:54 AM, Polampalli, Archana via lists.openembedded.org wrote:<br=
>
&gt; An issue found in TCPreplay tcprewrite v.4.4.3 allows a remote attacke=
r to cause a denial<br>
&gt; of service via the tcpedit_dlt_cleanup function at plugins/dlt_plugins=
.c.<br>
Thanks for the fix.<br>
<br>
Master will need these fixes. If master is patched,&nbsp; then we can updat=
e<br>
tcpreplay to 4.4.3&nbsp; all the way to kirkstone since this is a bug fix<b=
r>
only update and then all the versions will be the same.<br>
<br>
<br>
- Armin<br>
&gt;<br>
&gt; Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; .../tcpreplay/tcpreplay/CVE-2023-27783.patch&nbsp; | 29 ++=
+++++++++++++++++<br>
&gt;&nbsp;&nbsp; .../tcpreplay/tcpreplay_4.4.2.bb&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ++-<br>
&gt;&nbsp;&nbsp; 2 files changed, 32 insertions(+), 1 deletion(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta-networking/recipes-support/tcprepl=
ay/tcpreplay/CVE-2023-27783.patch<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2=
023-27783.patch b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2=
023-27783.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..59adff615<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay/CVE-2023-277=
83.patch<br>
&gt; @@ -0,0 +1,29 @@<br>
&gt; +From e831aad6d48874abab6efa37d4460da2be3ac765&nbsp; Mon Sep 17 00:00:=
00 2001<br>
&gt; +From: Marsman1996 &lt;lqliuyuwei@outlook.com&gt;<br>
&gt; +Date: Wed Mar 1 14:48:48 2023 +0800<br>
&gt; +Subject: [PATCH] dlt_jnpr_ether_cleanup: check subctx before cleanup<=
br>
&gt; +<br>
&gt; +CVE: CVE-2023-27783<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://github.com/appneta/tcpr=
eplay/commit/7aca59e4fc96fc1d0e43a3d64b2f9fc9a46b6ca8">https://github.com/a=
ppneta/tcpreplay/commit/7aca59e4fc96fc1d0e43a3d64b2f9fc9a46b6ca8</a>]<br>
&gt; +<br>
&gt; +Signed-off-by: Archana Polampalli &lt;archana.polampalli@windriver.co=
m&gt;<br>
&gt; +---<br>
&gt; + src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c | 3 ++-<br>
&gt; + 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c b/src/tc=
pedit/plugins/dlt_jnpr_ether/jnpr_ether.c<br>
&gt; +index e282ef4..98b67e9 100644<br>
&gt; +--- a/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c<br>
&gt; ++++ b/src/tcpedit/plugins/dlt_jnpr_ether/jnpr_ether.c<br>
&gt; +@@ -168,7 +168,8 @@ dlt_jnpr_ether_cleanup(tcpeditdlt_t *ctx)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; jnpr_ether_config_t =
*config;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; config =3D (jnpr_eth=
er_config_t *)ctx-&gt;encoder-&gt;config;<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcpedit_dlt_cleanup(confi=
g-&gt;subctx);<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (config-&gt;subctx !=
=3D NULL)<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; t=
cpedit_dlt_cleanup(config-&gt;subctx);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; safe_free(plugin-&gt=
;config);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plugin-&gt;config =
=3D NULL;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plugin-&gt;config_si=
ze =3D 0;<br>
&gt; +--<br>
&gt; +2.40.0<br>
&gt; diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2=
.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb<br>
&gt; index 165a0e735..ccff19f16 100644<br>
&gt; --- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb<br>
&gt; +++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb<br>
&gt; @@ -7,7 +7,9 @@ SECTION =3D &quot;net&quot;<br>
&gt;&nbsp;&nbsp; LICENSE =3D &quot;GPL-3.0-only&quot;<br>
&gt;&nbsp;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://docs/LICENSE;=
md5=3D10f0474a2f0e5dccfca20f69d6598ad8">file://docs/LICENSE;md5=3D10f0474a2=
f0e5dccfca20f69d6598ad8</a>&quot;<br>
&gt;<br>
&gt; -SRC_URI =3D &quot;<a href=3D"https://github.com/appneta/tcpreplay/rel=
eases/download/v${PV}/tcpreplay-${PV}.tar.gz">https://github.com/appneta/tc=
preplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz</a>&quot;<br>
&gt; +SRC_URI =3D &quot;<a href=3D""></a>https://github.com/appneta/tcprepl=
ay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2023-27783.patch">file://CVE-2023-27783.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&gt;<br>
&gt;&nbsp;&nbsp; SRC_URI[sha256sum] =3D &quot;5b272cd83b67d6288a234ea15f89e=
cd93b4fadda65eddc44e7b5fcb2f395b615&quot;<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#103126): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/103126">
https://lists.openembedded.org/g/openembedded-devel/message/103126</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/99336397=
/3616698">https://lists.openembedded.org/mt/99336397/3616698</a><br>
&gt; Group Owner: openembedded-devel+owner@lists.openembedded.org<br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub">
https://lists.openembedded.org/g/openembedded-devel/unsub</a> [akuster808@g=
mail.com]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MW4PR11MB5822AA22BCD641248C6363FD8451AMW4PR11MB5822namp_--

