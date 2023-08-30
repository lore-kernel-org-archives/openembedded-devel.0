Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0E3C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 08:39:21 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9613.1693384756453802760
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Aug 2023 01:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=MUUYDepF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7606fdbd6a=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 37U7lM9w017800
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=P6aE2mtMYY4H+reNL7bt6I6/XoMb5oQCQQmLrDSLL3Y=; b=
	MUUYDepFe97bNgniEZuJJZkCNpIpCUmkm/okyz9V02oM19nDMFL1E0N+ABjrasue
	6Tm6Sn6RUTN2GcsZ+1Lz4i6EvBhrf7+oAxCxt/eWqfvhvlpoFLaOCr2Nn0BkY0SS
	yLULCi4vJGESdjzqB3QxDLK+J1R+KasG2AvWHQJVPrdX9ZqpNrqc2a9eWDJbxmGP
	1pWRplCL070PHFBM5boVnVHQfOQI6RHxpUWp4rH34j0xjxH4NkTMsevfYV/t1Ggt
	pNIfpNvjegCtVeQoi38DqKFO7PeeplgtNU3UMFEjdVTAZ1ZVvGXHq1kG7CmVDHdJ
	aOHG8t6mi2YMBpW7hRBKPA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c63gnx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:39:15 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 37U8dFI3024632;
	Wed, 30 Aug 2023 08:39:15 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2176.outbound.protection.outlook.com [104.47.59.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sq8c63gnw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Aug 2023 08:39:15 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n67B6joyR/TI5GJsO/Oa1K87TclsteUZ6QtK4foD59UCaXavUL4Szyb3N6gCwnIb0SahWHTsC/230tmDfyhmCQsS42HnCiBc8jsW3npwkU6RS6vcMky1KAKT+UL+csoiU9gBj/yOptDiGRHsd2+AoLcA4ScPaVmrHAZmAuBFftHPKe0aDKoodzGgbEH7Ok6B5qORRDL3HL9eDAz9GlGoSWqkLZx+nxzhCW0EfiBUliFjFhzJ7IDQYKejL5JD5XEyIrVGrS+TdyoM6chStUzyKolYy9+4r8OYOmELWeu434tmnrbAAlrqZCJ+koaPNtdOZTvkGDjEqrQIqJ1sUVXNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P6aE2mtMYY4H+reNL7bt6I6/XoMb5oQCQQmLrDSLL3Y=;
 b=T8MClkB7LbpB9ck3YT8OpwDX4F0Tlk7kroOSeTCvm+ktbMlFNJ7/jJQZkM3qtV/4rQ4REyGnV7gTS1o00CQ1ztiXJC4DHBDJIIC3OFKxfBDS+dNyQyTAqABJUrCGSSJdbxvfL/xfS3Dxp1QiSS51c8c+KWaKOxArj8UuESrIb9tOvSpiUbhhxGB7L0hdwUA326ZfBXyeDMfy71Y1i3qToXjFU2oSPxD0WsACjsMxbpYvAEC67jz/oFdfpq+TfBVZyl8rvkoBcZYpYtvNbq6wNkZxt0p8Sze2EUxFIVrUxUhK/iEeQZbVDmQKy2tXsz2pv8+qrn9dN3grx54hsS8rfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
 by SA0PR11MB4622.namprd11.prod.outlook.com (2603:10b6:806:9c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Wed, 30 Aug
 2023 08:39:13 +0000
Received: from PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::6960:a57b:43a5:8f10]) by PH0PR11MB5014.namprd11.prod.outlook.com
 ([fe80::6960:a57b:43a5:8f10%4]) with mapi id 15.20.6699.035; Wed, 30 Aug 2023
 08:39:12 +0000
Message-ID: <254cf86d-6836-4d69-55f9-517b0b9fafa0@windriver.com>
Date: Wed, 30 Aug 2023 16:39:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-oe][PATCH] thrift: Remove buildpaths
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20230829095438.2747087-1-mingli.yu@windriver.com>
 <CAMKF1sokrpgNY1dhBk6Hu7rOn+J7eu7kvWaR9qfGOnP-a7tjbg@mail.gmail.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CAMKF1sokrpgNY1dhBk6Hu7rOn+J7eu7kvWaR9qfGOnP-a7tjbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2P153CA0015.APCP153.PROD.OUTLOOK.COM (2603:1096::25) To
 PH0PR11MB5014.namprd11.prod.outlook.com (2603:10b6:510:31::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5014:EE_|SA0PR11MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: d9a63f76-1c46-47d7-e0a9-08dba934961e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SmnhfHV9Xvcxxqft2H6KOs9lZ6vQWqHvJ5abdwFKSAaJfsJJyv6sxXUVwRy53ZrD/7V9guUfoX8O60/7eYRnxSOgdCLhrlpOycihDst8WLizToFSfW8/yTiE5jOVoSrkWegA7mVkMI9oxjnmvJtqwKtwAyerrsNSLQR07TZcxnlNSleJc+sLnyCR6e3z86u6XiewL6n0KiLmf936dACry9+/jHucIFesChMjYMab1APl5Gx26VuvaGy6c6y8Tz5xqfUYUjH3qO9RaBnLYiX4m4v0dstngpv9EHkVnyS5YBNSyqZDku8U6wGjSNyIF85pW6W8NvwTWPltVQTh9JqmFyq2l5IUzH4zCxVjrJCctSEnyh+zqOjxoK77u+CRjFCCLdvk81vTgpLPd1/TxNHW7o7dZO5u915hFglm9R8ifHJw9juGBP+qIFlwEzr6ohQ6lBw3xwngqQ4ymj82TtDLnUxTgu5hQvhAus8p4suls1onMamKtzmAf1zR6bEcugWXfRftguumGEW89nb7qArgJ4xPJnBxPEM+H+dQ/u6VA3sgEi8rzSc+gW6VfDUmEoPn99wzctLNdlnP3rX0aKf40VelZ0uPqVPcPKGz/9w1hfV4v6IF81qgplGuKgRe8f9c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5014.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(366004)(376002)(396003)(39850400004)(1800799009)(186009)(451199024)(8936002)(6666004)(110136005)(53546011)(478600001)(31686004)(66556008)(6506007)(66946007)(66476007)(966005)(6486002)(316002)(38100700002)(41300700001)(66899024)(6512007)(26005)(5660300002)(8676002)(36756003)(83380400001)(2906002)(31696002)(2616005)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alJHLzBJQ3RVZXdtcHFzT0NQenBtTmhiaTBCek43dGxFVTg4UTdDRlZlaEFx?=
 =?utf-8?B?eVFNY2dUNlNJUnY4QklieEQzY0p6MzVocjhwNHhaSFdSNXRMS2Noa1gvQWJP?=
 =?utf-8?B?UjJZbkZVK2p0Mi9nL2NpaWNyWWcxenBjMHh1S0hleGh2Z05xUHpnbTBMa3NG?=
 =?utf-8?B?emgyZEIwVmordEJUTXAvZ2lzbDBqRk5zemY4R3NBZlp0VSs5N3NSaC83Rzk4?=
 =?utf-8?B?WGRnTnp6SWFYa3pBM2xmY0p3RUZETFRYNEh5VFBvVEZrVmdRbzhQZk9vTWdv?=
 =?utf-8?B?dVh4Z0J4TitFclRRVFVqUjc5V29nQk5wRS93WEpQZmJkY0Ztd0ttTlpMN0cz?=
 =?utf-8?B?R0QzU0xZRm4wYis5em1mcExORVBRcGt2bHpOZXNhOGZ3OHJsTnpkU1A5N29S?=
 =?utf-8?B?QWJHenBHZVhvdmQ1aHdIcmVFNUsvdGJvay9sbWFCR3IyempLYUZ6VGNWNnJs?=
 =?utf-8?B?Rjl4TmV2ZGxPVWZEK0ovbDFCSW9Ub1IrZnhyTWdCQnhNR3QvekZGd1NTS0FW?=
 =?utf-8?B?ckJsUGtIem44TDZZS2JINTB0NFdGc3FMQ1Y2YXlibXB5RmJjV2FuMENnVlZs?=
 =?utf-8?B?MFVxTnBueDAzblZuZTNIbWFoYmx2aC9sZElaQUdtbWdmYWl6OWszNTBiaXBh?=
 =?utf-8?B?TkNwWVBLUmZFTnloTU5pZ2ZrUkhiN3Nkbml5eUt0QUhGekR4UmRUMVR3dG42?=
 =?utf-8?B?dVJEV2hXYWptbnpPeWtDVndHSjRyQUxsREFWdHRlOGx1ZkNaMEVycjhEa3Zs?=
 =?utf-8?B?YW9qYU1CNjF2aE9sSVo1K3JRdEZrYnFpYWpCOHZKVjdVWVhGYkF3cXpQeU5Z?=
 =?utf-8?B?bStXSUQ1eGNkby9lMysxdzIzUW9IbHR1NXBpckJGR3U0NVpTYlE1eUQ2bUZv?=
 =?utf-8?B?M0dnc21nckgwM1BGb2U1bjJwWDdPSTViSlFBbnN0SlZiMEF0WVJTNFB2NDVK?=
 =?utf-8?B?UEpmbzRwRldTT2lCdFlQWFRQUm1rVkFmWER3akN0NjcxYW9Oell4SGFocmVt?=
 =?utf-8?B?ZUlaQlpRbHowY0wzbnBjWURneWZ4WnM5MXEwNHV1TEtKN0NydUNSa2VXQ09v?=
 =?utf-8?B?WDQxRzl5QXl3V0pMM2lkVmJ6SXpCYUcrMnB2c1FYTE56RUdtblVuazZpaVhh?=
 =?utf-8?B?SEZHZWNPRXZyMjREVTdYeWNJWXFmbE53NGNJUGZMdUFDckFNS0F4U0hJSVFJ?=
 =?utf-8?B?M0Nab2cwYUhGVTd2Vis0TEllVDY3STV0bGNpbGE3NEJLMjBGaXUremp0ZEkx?=
 =?utf-8?B?b0RaMjNQWFc4MkJHSG9MZGt2RCsreklrV3lNN3dFTzBCV2V3d091YTVUVXU1?=
 =?utf-8?B?UGdYRVJQTW9NTC9YVG1YUE9Mdk1URzlJcGZNNElXTjNObjN3aFcyZUx3Zzdl?=
 =?utf-8?B?Q2hUT2RCZzVOb09INEVwRC9vQXZUMS9pYWdjOExBRXFkcHBsNUFJdmdwbDBr?=
 =?utf-8?B?WXNoR0hnd1VUY2hyRFVzdWJmTG5oU1poZDJSdHpLYytNOFUyNG5FTk10TVF5?=
 =?utf-8?B?N2d1TWU4Ym8weTRhYThKaCs1QzhxVDloeGJBanlpY3pockpMU1dNckxYTjlt?=
 =?utf-8?B?SVdLd1JoRGxmZW81OUM4dnJjT1d2U1liR2d4cHVYcnJtazY2ZlMvN3VDN2N0?=
 =?utf-8?B?UXMzbUlNTFdNZ0lvbUYxWU8relRDYmNqTFNaSUNMaS96SFVoMzZwdzJqRW8z?=
 =?utf-8?B?YlR1dlA5T01JTGJpNlljZ2ozcGZhSmxpcVlqbTVPUUN2SDkwS3h6NXUzSVRH?=
 =?utf-8?B?aU55NHQrUUYvZ2xTeFIwVU5GeFVXSlRhU0tvMjcwODhwanVnVVNEdGtjMm15?=
 =?utf-8?B?M05VbGprd2VPb0tiUHpuMlFwLzJVblJmeXRReDMrdnAxMWFNRUFJVUFuSlpq?=
 =?utf-8?B?UFpMY2c5VTZHOVhuQllrbjdZNzFsL21mQUlvNnN4bElHd2xhS3YxdDI4UXIy?=
 =?utf-8?B?YVF4NVE0K2szSUtKdVpzdU9mYk8wWlIwbU10RmpxVHBKUms0OFFVU2ZHbXZr?=
 =?utf-8?B?Tms5aUVWc290TFljbVI1V3oyRFE4bCt0M0RjdG5qYnJqdW9UeUgwMTVaZUE4?=
 =?utf-8?B?ejdneU5uNU1BMkR0UjhoOXF0RUNkWlgwZjRwMHZzQXEyM2lzcE5wQ1hTRnJ5?=
 =?utf-8?B?VmRrVllUTFpIRkxTcWxXT3RjYlZZSkFDVUhMdnBhNzRTTklJUTdNaXljdkhy?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9a63f76-1c46-47d7-e0a9-08dba934961e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5014.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 08:39:12.8084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG1sG3tkA8TuYEKVq/wGcAItpIg7wQgExfzUJ85vy3eEuPeSF/GsqumDzKsVrim67R0NmCpuGlRzYAeA2DoF4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4622
X-Proofpoint-ORIG-GUID: jqA58-70X0r2TCpWpoaBaX3mK2enA5Ld
X-Proofpoint-GUID: tIb7Xqp7CyIvBsdlJPcxZ61BN338QXXD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0 mlxscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015
 mlxlogscore=719 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2308300080
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 37U7lM9w017800
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Aug 2023 08:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104664

Hi Khem,

On 8/30/23 00:14, Khem Raj wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
>=20
>=20
> On Tue, Aug 29, 2023 at 2:54 AM Yu, Mingli <mingli.yu@eng.windriver.com=
=20
> <mailto:mingli.yu@eng.windriver.com>> wrote:
>=20
>     From: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>=20
>     Fixes:
>      =C2=A0 WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File
>     /usr/lib64/cmake/thrift/thriftnbTargets.cmake in package thrift-dev
>     contains reference to TMPDIR
>      =C2=A0 File /usr/lib64/cmake/thrift/thrift_c_glibTargets.cmake in
>     package thrift-dev contains reference to TMPDIR
>      =C2=A0 File /usr/lib64/cmake/thrift/thrift_c_glib_zlibTargets.cmak=
e in
>     package thrift-dev contains reference to TMPDIR [buildpaths]
>      =C2=A0 WARNING: thrift-0.18.1-r0 do_package_qa: QA Issue: File
>     /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.hh in
>     package thrift-src contains reference to TMPDIR
>      =C2=A0 File
>     /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thrifty.cc
>     <https://urldefense.com/v3/__http://thrifty.cc__;!!AjveYdw8EvQ!aQBY=
HC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q5xzlUF=
lTGUpfdhVA$>
>     in package thrift-src contains reference to TMPDIR
>      =C2=A0 File
>     /usr/src/debug/thrift/0.18.1-r0/compiler/cpp/thrift/thriftl.cc
>     <https://urldefense.com/v3/__http://thriftl.cc__;!!AjveYdw8EvQ!aQBY=
HC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q5xzlUF=
lTGLv1WKXA$>
>     in package thrift-src contains reference to TMPDIR [buildpaths]
>=20
>     Signed-off-by: Mingli Yu <mingli.yu@windriver.com
>     <mailto:mingli.yu@windriver.com>>
>     ---
>      =C2=A0meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
>     <https://urldefense.com/v3/__http://thrift_0.18.1.bb__;!!AjveYdw8Ev=
Q!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q=
5xzlUFlTGr8mRPcY$>
>     | 6 ++++++
>      =C2=A01 file changed, 6 insertions(+)
>=20
>     diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
>     <https://urldefense.com/v3/__http://thrift_0.18.1.bb__;!!AjveYdw8Ev=
Q!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q=
5xzlUFlTGr8mRPcY$>
>     b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
>     <https://urldefense.com/v3/__http://thrift_0.18.1.bb__;!!AjveYdw8Ev=
Q!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q=
5xzlUFlTGr8mRPcY$>
>     index ea5a3972d..2809e24ad 100644
>     --- a/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
>     <https://urldefense.com/v3/__http://thrift_0.18.1.bb__;!!AjveYdw8Ev=
Q!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q=
5xzlUFlTGr8mRPcY$>
>     +++ b/meta-oe/recipes-connectivity/thrift/thrift_0.18.1.bb
>     <https://urldefense.com/v3/__http://thrift_0.18.1.bb__;!!AjveYdw8Ev=
Q!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q=
5xzlUFlTGr8mRPcY$>
>     @@ -35,6 +35,8 @@ EXTRA_OECMAKE =3D " \
>      =C2=A0 =C2=A0 =C2=A0-DWITH_OPENSSL=3DON \
>      =C2=A0 =C2=A0 =C2=A0-DWITH_QT5=3DOFF \
>      =C2=A0 =C2=A0 =C2=A0-DWITH_ZLIB=3DON \
>     +=C2=A0 =C2=A0 -DFLEX_TARGET_ARG_COMPILE_FLAGS=3D'--noline' \
>     +=C2=A0 =C2=A0 -DBISON_TARGET_ARG_COMPILE_FLAGS=3D'--no-lines' \
>      =C2=A0"
>=20
>      =C2=A0PACKAGECONFIG ??=3D "glib libevent"
>     @@ -46,6 +48,10 @@ PACKAGECONFIG[python] =3D
>     "-DWITH_PYTHON=3DON,-DWITH_PYTHON=3DOFF,python"
>=20
>      =C2=A0do_install:append () {
>      =C2=A0 =C2=A0 =C2=A0ln -sf thrift ${D}/${bindir}/thrift-compiler
>     +=C2=A0 =C2=A0 # remove absolute paths
>     +=C2=A0 =C2=A0 sed -i -e 's|${RECIPE_SYSROOT}||g'
>     ${D}${libdir}/cmake/thrift/thriftnbTargets.cmake
>     +=C2=A0 =C2=A0 sed -i -e 's|${RECIPE_SYSROOT}||g'
>     ${D}${libdir}/cmake/thrift/thrift_c_glibTargets.cmake
>     +=C2=A0 =C2=A0 sed -i -e 's|${RECIPE_SYSROOT}||g'
>     ${D}${libdir}/cmake/thrift/thrift_c_glib_zlibTargets.cmake
>=20
>=20
> Are these still working ok on target it would be good to check that=20
> while you are here. I know they don=E2=80=99t work before this patch pe=
rhaps
>=20

Yes, the previous path which includes buildpath doesn't work on target.

And I don't verify if if works after the buildpath removed and will=20
provide the update if I have then.

Thanks,

>=20
>      =C2=A0}
>=20
>      =C2=A0LEAD_SONAME =3D "libthrift.so
>     <https://urldefense.com/v3/__http://libthrift.so__;!!AjveYdw8EvQ!aQ=
BYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q5xzl=
UFlTG-uCL9Fk$>.${PV}"
>     --=20
>     2.25.1
>=20
>=20
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#104638):
>     https://lists.openembedded.org/g/openembedded-devel/message/104638
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/message/104638__;!!AjveYdw8EvQ!aQBYHC3Pp7A3cjHlbgj3EQEtTprk=
19AI3swVtDGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q5xzlUFlTGjeblbDM$>
>     Mute This Topic: https://lists.openembedded.org/mt/101028035/199791=
4
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1010=
28035/1997914__;!!AjveYdw8EvQ!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVtDGwMH3=
pVrcOrMyylWFw84z8G08tvZGSQ0q5xzlUFlTGBWQ6GQc$>
>     Group Owner: openembedded-devel+owner@lists.openembedded.org
>     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-devel/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-devel/unsub__;!!AjveYdw8EvQ!aQBYHC3Pp7A3cjHlbgj3EQEtTprk19AI3swVt=
DGwMH3pVrcOrMyylWFw84z8G08tvZGSQ0q5xzlUFlTGQylcAqY$>
>     [raj.khem@gmail.com <mailto:raj.khem@gmail.com>]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

