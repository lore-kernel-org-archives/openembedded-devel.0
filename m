Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65BE3C77B73
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 13:49:09 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.107928.1683553746777609891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 06:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Ktggweev;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4492606137=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348CpMxY017446
	for <openembedded-devel@lists.openembedded.org>; Mon, 8 May 2023 06:49:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : to : cc : from : subject : mime-version;
 s=PPS06212021; bh=RGqdZsGWhfDphYRF+ssk+TLdDPy53i+2KqRUDtPEyDI=;
 b=KtggweevmpmiDJ1n68Zzo31Z36rlohowNUUfiUoHbaEuvhHm27NZWb30mmApPNGHbL1L
 pPoqf70vu4cbgno82YN7PuBAE+HkRZvGj2jQboLzM6R5hMrhlaBHS6+iwueNPZuar/qp
 Et2Sf++2VTdPLBcH1rhvbmVpvE70xvhesSaMlV0Q6+ZAmM/ikalALGCjf9NniUKs+z//
 JQ1W+zzxhZxz0cpzZq2d/EOd/W29503J1P4HU9zN2JQ0OC4oIDdHwVkw2fukP3z4Ofby
 bBpjUlkkWCiWU/y9HVinJhNYuIpE6XWAesdPvILPInwDPIJocP4p0+dXN37EsjuZpMMI zQ== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qdpdn1f1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 06:49:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ScS0rTcIQ2UwYeKBrfynXZVyJlJuoiKisGiogoRgJatILt5//FnHpcEe9iLVqdCmlWldMBkIGq4inzxZq6+vz/vAKrA/LfUloZlrNHGTkEL+sElvxGN/r9nPeAn8br+M++jyGnZgGeOpWE+2/gYLmRVDubaJduzAHBFfxICUGnWY4T/uc56i767dgyhe7F33wK8cAczcqXUlAXY7zkd4z1epPRGVSHJbwheekubkwgILMWSuRlIXHQ4RteAFNounyk9ZnBJ0u7tUW96k8HAqVzNjFNqDYAnO05WYor2XfquTkDgAMf4RoPx9AkZ82dZXOFy8DIdlxNAW9Nq47pj+Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGqdZsGWhfDphYRF+ssk+TLdDPy53i+2KqRUDtPEyDI=;
 b=ijSwDQz5WDxNBJC3QlmNx8d42kS/iug+DD8CooivSiHw5W5lX7zrZwlL5EIIJqiRZ/d6TzCHiRvcZSJ6JChWwfBKb4io8KU3qa+k4T0lZMY1XwaUcptSNyibdZqI4EGflaDAmUsiYfIkERSko1Qd34FfrPHzLuYkhIzeqvMLKmLXRgN0J4r898UROFQJm5CDQfueFFyZOP4KNhmYKJ5PpBjQujkzQxp064P/YC+Mzp/+/biICkPyLkqdqUFMSXQ6fBFooRbMMdYPrDXnl6ice5KJ0pP7ZqCswgQVbaqqAGm+noNEH6zaUrQUt7LSbGe6rFpRAY0n8lhwy9l/9F8Wgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM4PR11MB5996.namprd11.prod.outlook.com (2603:10b6:8:5f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 13:49:03 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1450:e2a0:f220:b6eb]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::1450:e2a0:f220:b6eb%5]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 13:49:03 +0000
Content-Type: multipart/alternative;
 boundary="------------05hlwPfL0SzXk07Ly0mGhf4c"
Message-ID: <653e33ab-8ccd-fbc8-a3a1-24faa822e5bc@windriver.com>
Date: Mon, 8 May 2023 09:49:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-CA
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Cc: "Mali, Narpat" <narpat.mali@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Subject: nss: dunfell intermittent compilation error
X-ClientProxiedBy: SJ0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM4PR11MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 76c64b9c-1d72-4cd4-fabc-08db4fcafc15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0xO337kQU+Y+74/1ue0VCOav4y1HzwECH0US+pFBzJnfEAtXbIncwXnDA5oJKQvtefXMe7JR8+jx2jsluaQZktt9AD9vRHrPk5UlE/hMvC8T85l6c5Hk3DSPN7l+VdCQ6SvpNMeu8QBQFuijdnzKYBHew4W1rMDlq/KjwhFIcbIpvZXoPgi5KNiXX9nGZd3aGzd74Xx/jIFRdW/suV7De5NDQuLYowdzlvj9jNjB/8YLV5TzAQqcDiI8Rwgi2FnmDm4jGcI+TmoU3kAseINkBEXjPX6LXwz81o46qSerUGQ0cglOGlO6bTDUjoDYyHwewUoWeJkXel0ig7UEAiOKrFQB5+kxrkqgnADUJwpt1YLvGU+IZeljfjIVsSTQ4qFZ/lNll/pk/ES9Zw/upzf9knP2QjYcgYEE5CzGxW09cTaPFTOBPOAorUmJOgYRa88dt8eHj5l9J2Fj67J80Z25OakTg77oYrIsohVPn57PixiOSdD26UvZ+yIFQ3WOZioEU2lb0j6LqusZLu4tPCIK65BF889hilBGSkWGJz1DujLQzogeo/nXQxP42hWj6wtB8TgPP0NPDO5zBmz5f0hzJq33/9Tjb5nYwlcO1d1dbO3SKPK6j0d/KbYR49hJ9fUUVvrQ5FSDEGAflo0DpPtE9Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(396003)(376002)(39850400004)(366004)(451199021)(2906002)(478600001)(8936002)(8676002)(41300700001)(316002)(4326008)(66946007)(66556008)(6916009)(5660300002)(66476007)(31686004)(6486002)(966005)(6512007)(26005)(6506007)(107886003)(186003)(33964004)(36756003)(2616005)(83380400001)(38100700002)(166002)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q1p6MlJMOUdTcWR4V0tacXk5ZkFWNE9KeTQyTU9wM0JCdnY4VjVxY2FoV0I1?=
 =?utf-8?B?MzdaYnFBM254b0ROUHlZZkNYT2s5dEdLZVh4bmZDTDJBalRUbGdCQ3ZXODU2?=
 =?utf-8?B?OWE5TGh1VjRYRGhrK0hDTk1oZWV4cmJ3U1RXU3VUckIrcy9xMDBUNk9mbGl0?=
 =?utf-8?B?VUJnYStETmd1K3V5UmF6N2NsNjNLTnlkVnJ2TGN2N1ZjSlZoSDJPZjBYeFZ2?=
 =?utf-8?B?Y01NOUhpYjd4MkI3bVhuMmM5SVZUTTdWbExhUDJjZSsvV25uK1RGU05pMGp4?=
 =?utf-8?B?R205R1hFK1gyOThMUy96V2FMZmhDUmFTdmtyRzZEU2dwc1J3WDcwZjQyTmIx?=
 =?utf-8?B?N1ZyUTlxaHZ6R0JMV2ZEa0U4VU5UeXc5T2Q2ME03RGs5MDE0U3RtanZmS3p4?=
 =?utf-8?B?dnRtT3hNSnY3eFRqUDJjdTU2NUkrdzZ5cm1DV2Z1YkRMUUYrYStoZmdVc0JZ?=
 =?utf-8?B?cmhRRDBJaStjTVpaeDJYWHk0cWlqeThORmhUZzV5Tkh3cTFKVC9ER1R4K0t0?=
 =?utf-8?B?d043eHFiTmE4K1BhdTl4NkplY2FySHdWRUc1VkZ1OVJTQWtIeldEV0N1SGpR?=
 =?utf-8?B?K21sQVJJYnRtajhqZXZ1VTVLNit1UGxiUVpmNzVYUXpFS045amF5SnlObkxW?=
 =?utf-8?B?Vm0xTlU2RmdSeGZYR0dKYXpiNTFFbEs4eThXNUxzMEp3QlNNVXNXYU9MMjU5?=
 =?utf-8?B?L3U1YTVDekdVa1lvNEtQQURlRkF1RHBIdkU2aWJNalQ0d2JZZDBuREw5Rjg0?=
 =?utf-8?B?T1hZSkVyZmdTZllwaWt6STV5elJhSjlsQlJ6dUFBNWQwTXpFVUgrQ0lpQm0w?=
 =?utf-8?B?MXhPS2ExamMzUkVnT0Y5UThraGRhUUR1MmIwS0xmTHJLV0R1b2Jibi9rVkw3?=
 =?utf-8?B?TzBqZ01MUkJiZGVTZVZ0TElYK3NEd1BvVWZ0YWJnY3lyWnM2YW52MHd3NHp3?=
 =?utf-8?B?K24vWmR3MWgzckx6TDJqejZIWmErWjE5UEhMSng0NEMxMnRad2RaaVI1ajVF?=
 =?utf-8?B?N0dtUE9Kc0haVDZLQjZSOFc5SGRIVllHazVrb3ZmNDlodUtXS05zalZzTWYr?=
 =?utf-8?B?ME5QcmwrVFBGdTZFbzAxMnVhQWRzckVET0p1WWZBL2R1akNCSGNVK0dpbjdx?=
 =?utf-8?B?OW5vbnp3d2xpeFE0dlBTalhGejZnVkpFRWx3UXRLLzg4YWJtTHo2YThSUjBx?=
 =?utf-8?B?VmY4WThVT0ZSSHBsemRnLzJhbE4zR2lSUFBxQnAveFQ3b3VMRS9iWDRiT3RK?=
 =?utf-8?B?NC9qckxET2xiL3R1LzZnU1V3OU04aHpuTDdTRUZGZXMzWEZWS2FIQXYrL2pj?=
 =?utf-8?B?MzY0bm1Pa1FSK2VEOUUwejJlZ29xbGp1bW5UVE0vR0Q5NlUvYmk0ak8xeXRj?=
 =?utf-8?B?Y3B4RWtDbS9jUm50RkhHZnpBREJWaUZVaGd0WUpoTjhpK0tSMjZTZ1FINFk1?=
 =?utf-8?B?RVRoNktLV2x1NzZWMVlXMDhGV0Y4Tlg0Z2xtVGQwV3BaeFBIMUxlbk1QbDZJ?=
 =?utf-8?B?YU5IS3c2b2pUUHVFU0F0QzZkY1U5Y2pkZVgyS3c2QlZDTStJcEU4RU9IRFJY?=
 =?utf-8?B?b0NDRE5zWHdXSDl5V2tPY0t1ME5CZzUxaGoyL0VGOTloYUFQQkpaalQzQThJ?=
 =?utf-8?B?SndYSm5SaEFUeXJvOWhJSzYwcmh4UXdkVGozenFycm5pdXdyRnFEQXJjTXI5?=
 =?utf-8?B?T3Q5dXFyYlFnVHJQbjZFRjMvaXhJUWw2Ym1QMjBMOHVsN1BIVEx3UmtjM3Q2?=
 =?utf-8?B?cTVQcEdPdTBZZEVKdjhJL2lzWjhTOURuM3MwekxWWHFYT053ZEpQVW5CR3l1?=
 =?utf-8?B?amZwN3k5WXR5OTQ4U0NuN0ZzZG04R0Z4bGp3VnZiWFZCQjRNSHIwQ05DSC8z?=
 =?utf-8?B?MldZV0J6eFNJNXNoV0d2bDFJSVJHQ3VVZXlMTUM1SmQ4QnVxdjBpYTBBQTZm?=
 =?utf-8?B?eVBINGdqOGl4TzE3ak1iWitIY1BGb2luelRqWW5GZGZSWE0vZjhuRnZkeVZE?=
 =?utf-8?B?dEFzbElRa3dmdVc2OHBZblFqQi91NkMwUUpHV0NoakY4L2c2QStRMjFLbTNn?=
 =?utf-8?B?RDNCYmczaUhmdFNjMGdHNytHUjg3YzlES3FtMTYyNVZoZFJJdWw1bndIRXBD?=
 =?utf-8?B?a1EwQ0VoaWNiM3lzRE15STQwOEFPZDdHaFU1YllBQkpqNW15VE81bXhudDFU?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76c64b9c-1d72-4cd4-fabc-08db4fcafc15
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 13:49:03.6176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mr2pEIlDBHO+u7/fIgVk1zkzVSBt699OdPNt+JegOXkBqUizJVs9KWDZT1vFHdvXTVxa3UCwwAJutHs5BKznlczYH2r9jCz3om8tM45urs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5996
X-Proofpoint-ORIG-GUID: YwfWsOtxGEDbPUgAx4XpDe4jd-LKT2ht
X-Proofpoint-GUID: YwfWsOtxGEDbPUgAx4XpDe4jd-LKT2ht
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=814 mlxscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080093
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 13:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102439

--------------05hlwPfL0SzXk07Ly0mGhf4c
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 348CpMxY017446

When Narpat and I were testing chromium-112, we noticed an intermittent=20
nss compile failure for dunfell:

/usr/src/debug/nss/3.51.1-r0/nss-3.51.1/nss/lib/freebl/gcm-aarch64.c:91:=20
multiple definition of `gcm_HashZeroX_hw';=20
Linux3.4_aarch64_glibc_PTH_64_OPT.OBJ/Linux_SINGLE_SHLIB/gcm.o:gcm.c:(.te=
xt.gcm_HashZeroX_hw+0x0):=20
first defined here

It's intermittent in that a bitbake -c clean nss and a recompile worked.=20
We don't depend on dunfell other than as part of the chromium update=20
testing so all I can take time to do right now is to report the issue=20
here in case someone else wants to work on it.

Similar errors have been seen by buildroot and tracked here:=20
https://bugs.busybox.net/show_bug.cgi?id=3D12501

If you run:
=E2=9D=AF git log --oneline lib/freebl/gcm-aarch64.c
2cf7fd12a Bug 1580126 - Fix build failure on aarch64_be while building=20
freebl/gcm r=3Dkjacobs
02cb61a77 Bug 1559012 - Improve GCM perfomance using PMULL2=20
r=3DKevinJacobs,jcj

then 2cf7fd12a seems like the right fix but:

nss.git on NSS_3_51_BRANCH
=E2=9D=AF git tag --contains 2cf7fd12ad2895b13c9dea6717843bc15ca46ca3 | r=
g 51
NSS_3_51_1_BETA1
NSS_3_51_1_RTM
NSS_3_51_BETA1
NSS_3_51_BETA2
NSS_3_51_RTM

so it's already part of 3.51 unless we somehow managed to revert part of=20
that change and I don't see that.

Has anyone else seen this error on dunfell?


../Randy

--=20
# Randy MacLeod
# Wind River Linux

--------------05hlwPfL0SzXk07Ly0mGhf4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 348CpMxY017446

<html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p>When Narpat and I were testing chromium-112, we noticed an intermi=
ttent nss compile failure for dunfell:</p>
    <p>
/usr/src/debug/nss/3.51.1-r0/nss-3.51.1/nss/lib/freebl/gcm-aarch64.c:91: =
multiple definition of `gcm_HashZeroX_hw';=20
Linux3.4_aarch64_glibc_PTH_64_OPT.OBJ/Linux_SINGLE_SHLIB/gcm.o:gcm.c:(.te=
xt.gcm_HashZeroX_hw+0x0): first defined here
</p>
    <p>It's intermittent in that a bitbake -c clean nss and a recompile w=
orked. We don't depend on dunfell other than as
part of the chromium update testing so all I can take time to do right no=
w is to report the issue here=20
in case someone else wants to work on it.</p>
    <p>
</p>
    <p>Similar errors have been seen by buildroot and tracked here:

<a class=3D"moz-txt-link-freetext" href=3D"https://bugs.busybox.net/show_=
bug.cgi?id=3D12501">https://bugs.busybox.net/show_bug.cgi?id=3D12501</a>
</p>
    If you run:<br>
    =E2=9D=AF git log --oneline lib/freebl/gcm-aarch64.c<br>
    2cf7fd12a Bug 1580126 - Fix build failure on aarch64_be while
    building freebl/gcm r=3Dkjacobs<br>
    02cb61a77 Bug 1559012 - Improve GCM perfomance using PMULL2
    r=3DKevinJacobs,jcj<br>
    <br>
    then 2cf7fd12a seems like the right fix but:<br>
    <br>
    nss.git on NSS_3_51_BRANCH <br>
    =E2=9D=AF git tag --contains 2cf7fd12ad2895b13c9dea6717843bc15ca46ca3=
 | rg
    51<br>
    NSS_3_51_1_BETA1<br>
    NSS_3_51_1_RTM<br>
    NSS_3_51_BETA1<br>
    NSS_3_51_BETA2<br>
    NSS_3_51_RTM<br>
    <br>
    <p>so it's already part of 3.51 unless we somehow managed to revert p=
art of that change and I don't see that.</p>
    <p>
</p>
    <p>Has anyone else seen this error on dunfell?
</p>
    <br>
    ../Randy<br>
    <p>


</p>
    <p style=3D" margin-top:0px; margin-bottom:0px; margin-left:0px; marg=
in-right:0px; -qt-block-indent:0; text-indent:0px;"><span style=3D" font-=
family:'Sans Serif'; font-size:14px;">
</span></p>
    <p><style type=3D"text/css">p, li { white-space: pre-wrap; }</style><=
/p>
    <pre class=3D"moz-signature" cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------05hlwPfL0SzXk07Ly0mGhf4c--

