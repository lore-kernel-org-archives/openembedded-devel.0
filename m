Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D787AEB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 18:53:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.371.1686768778359169325
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Jun 2023 11:52:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=XklU0XBV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5529f8cb46=randy.macleod@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35EHaPg0024074
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 11:52:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=content-type :
 message-id : date : subject : to : references : from : in-reply-to :
 mime-version; s=PPS06212021;
 bh=87Ux8H2x+BuTEV6jO03dnFUl6HgdTItRB1QFC7JoPnQ=;
 b=XklU0XBVLgjb+USq+tr61dr0ovlYayHtB36Dc2gdOOFu4RMsx6w838P2wxlyDnBlYmzP
 rR9SZIu3MAsRQRN1DNfKWnaFqyGRpe0FsMiDXPF89asq5anVUKJMajCTw8SfgpoJBuvC
 Vxy0i2pemA1fH9p2udHzT5xjj5gS5ImjtFRVef5zOftlDsAu+t5pze1z5eUd2iISUjLp
 AcD0Jw9qIOSxQSlVcNlom0n+HBOGALpXywc/tAxtf42qc/RhNPiF6vm9fyq9Q+O+26+b
 1clrWfI8s0ZFCVuCLf47BSiR4QHZC5K2JcWXXEKAheW3cOLWv5YIEwJFr9X47plIEiGf cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphkx4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 11:52:57 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35EIqvFU002972
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 11:52:57 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r4rphkx4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jun 2023 11:52:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PG68wJbpx5scUY1GOo0NuFkfLaz94LH+eNr4yOTJIGw84wRbmB6VCXNh9u6oMvRtIIiyCd2BI+B+rIO8FXbUMWdAXGzvaiMs7eu6Cdcj/MqT1itOmP4sLuhuGllehNZX6x8BcbVpccqqxoaLuTGWZ7Z7D1pMHBRNsUJsffJIvkIhl5IMQnjMF8tzSPJEwZI0aa/ARnX/AZQ3dvDXhtC8cBHBtWFf9ZrU12iKZbublLzlt5E/FukjGfDN494REkxMAtJfOXXD/RqyGYseX4O8o5PNeuIySsNoPo+vufO1Bq73aW6syBBNqZD9F2YOYBtRh4gnDaYhdyRjY5RJtMHWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87Ux8H2x+BuTEV6jO03dnFUl6HgdTItRB1QFC7JoPnQ=;
 b=UvTVXmWyFmFhmI6fsT/eUpLk8CisEOavmAG46OyjUj50fBiHvPwamlOudqrFfDQe0pKt8wM71ZhMN/cXZ7EEMaat69MEEJlmIuq5P4VsP7cWSR8eKdurF/CtI8zfEHnVmzI2W3vVDsc+YW+tlinPXYgVMj3VDnbr1rze5XmJmlYMGuyuPoL3o6/zl4NUeS1xR0k+YJ8gznGkePXD3xKCSHNs4EuKgrD86ERHwB2zlzepIyozr2lxoxhE+ikgfzIzGH/olxjC41q4kPdWpxoUBL+pf1h6bQVEZm/2oYH7l7PZRhyXZNIg+j+t0nnrm8/L6+NKRUULh8lj4pan9bf8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4626.namprd11.prod.outlook.com (2603:10b6:5:2a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 18:52:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5a4c:c35b:8704:34d5]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::5a4c:c35b:8704:34d5%3]) with mapi id 15.20.6477.037; Wed, 14 Jun 2023
 18:52:52 +0000
Content-Type: multipart/alternative;
 boundary="------------Gns4wnQtQa7PChl6klxrbrMd"
Message-ID: <1d4ae35c-2967-b3a0-2eea-358085acd7e2@windriver.com>
Date: Wed, 14 Jun 2023 14:52:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [oe] [meta-oe][PATCH] lmsensors: do not pull in unneeded perl
 modules for run-time dependencies
Content-Language: en-CA
To: beniaminsandu@gmail.com, openembedded-devel@lists.openembedded.org,
        Armin Kuster <akuster808@gmail.com>
References: <20230608103731.103220-1-beniaminsandu@gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20230608103731.103220-1-beniaminsandu@gmail.com>
X-ClientProxiedBy: BYAPR11CA0078.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::19) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM6PR11MB4626:EE_
X-MS-Office365-Filtering-Correlation-Id: fba624d0-68ff-446d-5303-08db6d088eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	riJJlQHqRmWtPW7aeIPHR+/r0pwxqsZWlvS/IMWuzIp2OyYPWvoYtaDjn02hbz/1QWT+NfkmVW818SD0mNmAARd6+t5EjHCk0QCCOP9EecFIemfDJ4ZjaaFz9BSVrDM/TJG3oBCfQkufs0LKP2wS1Iv9csgMRzKt/R3bI1LSs5u0XehOdl0Akuao85Tb/DI8JK3knLT6bd/iSi9BJnBUxXuEPU6c+5FlBbd1MABgJacLbJ7IKN+/BjKeuZoRas+mxCeDwmGsyMcbDCb8Jiy5Qc57IZ3U2RcNNc7jy77z2VHA92y/7+72WEQkoZFzQ+DeAE187n2swGuC/vkcc2+d89TLbs0JrlX0qAolS2LHHIiayngc5GkMcsCq03X8t8VgcyRc79HPwaaauqc7PH6HvXvZzPK8BQUB2hLNywPMMZU+irRYauCtmJhekGbQRoh7kddJ3gKs+skFPHzGUVkyt4HdQmoXgASAeoLc75YUOTEVs8QlRHPOx5scRiFHoxMBz1vLzE1d6YMhosSR9xhHIs6vpfROkRamO2/m8EGzO+uxxFlZx6kQPAaENZSoi5n4qqWkZ+UtMG/gIdfFyC9pv/srH3UFX9s5uCN5tezbNtRLCX38E2fLhk21ORne4OlBkMY2lmsfeiMhRrbiP5it6g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(39850400004)(346002)(376002)(396003)(451199021)(83380400001)(5660300002)(186003)(6506007)(66899021)(2906002)(31686004)(2616005)(966005)(6512007)(41300700001)(33964004)(8936002)(26005)(8676002)(6486002)(166002)(316002)(31696002)(53546011)(6666004)(36756003)(478600001)(38100700002)(66556008)(66476007)(86362001)(66946007)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?KzFFM0VCVEZPY0FlTS83SnFmS0xqZmJwOWpzUUNTd2hrMHY2MnoyNTlXNnZ1?=
 =?utf-8?B?WVdxaUhQcTMvN1puY2tSZzJIK0xnWmJwd0RTOWtJMm1VUEdmNWtKTm0xdWNO?=
 =?utf-8?B?TFJtUy9hZzM4RVVkRnRxZmVNS0oyWlZYVDFZaHlLWjdlRjZzcC82bDd1L1Zi?=
 =?utf-8?B?RnM3bTFLdlYvVVNRalZNRm9zT3llUDJSTzhnZmlLYzBEbDN5NEhNWW94VTRm?=
 =?utf-8?B?a1ZjSlZPSm5KK2dWNjZHUmlCbmVIaEs5a2VuYlZCOThMTTZhdDRHMGlMNTc3?=
 =?utf-8?B?NFA2WVppTVZpWm5LWGl2NGtPRld3bGsrK0lRYlJxV2dqblIyLy9PSExtWWkr?=
 =?utf-8?B?cWYvTzlES0VoT0FjV1VucExlNjBXYXE2bEZCMlNSN05NZmdHVG9SZmxtQVhm?=
 =?utf-8?B?anBLSzVKallXbDFScy9jbExQaEx1ZWtuYUxpVCtEOHo2MExEYUlPLzdIQWxI?=
 =?utf-8?B?WGNXckJVdS9nMldJS1NZYS96TDhxRC82TWNvV05zY1ltUHBhUzlNbWQrK3Vw?=
 =?utf-8?B?OVc2OU1OK291Rk82QU9URUtUTVVDSmQ1L3JRUVFKTnlhZDV3QVBDKzBUUDFh?=
 =?utf-8?B?cnZFaEhpV0dIbTZNY3hUZjFnNFYySkpWT0hRbHBaMDF3OWxtazBiZUEvTW01?=
 =?utf-8?B?THNrbm5leU5sUWp2S0g1NTZjbGFESGN3QzEvMURETERNOEhPM0VmUHplc2I1?=
 =?utf-8?B?SjRBWWtkZ1FaT09zUWZPcVF0TG83aTgraDVJcTl2VFVKWTlpU2F5WGlBMjJH?=
 =?utf-8?B?RW11R21PRjEwVmdFS2NMUnRIL3dkcXUwalc4SVBCeEw3anVXOUtuL0JLc1BP?=
 =?utf-8?B?K0tPYldhTEd5YmdKdzFBNHAvU1JnbnExaTdwU3pvSDRnYVJ0aWI0alpGamgr?=
 =?utf-8?B?cEI5RlNvVU5CVXJnL01sdmd6aEtyaTluWmFZR0VmUmNOZ1hSTm1ORDhrckNt?=
 =?utf-8?B?YkhLUnRNMCtsQzZycGthbVlnWk40Q294UG9jejF4OENSOFoyQktjalBsbm1Z?=
 =?utf-8?B?ZHZlTGk1a2Zhd3BsWmlpK0o4Ym5jTEVqdlM5VlZMbDdDalBlVGZYUm5vWmxQ?=
 =?utf-8?B?Umh6TzlXK3A0UmQ4MktxVU9aa1UvQXhWVWdCZXNFNldyMXhIY0phZVJacEJW?=
 =?utf-8?B?VkdFMzl3bStHd2pvY2RndTJSU0NmU2JFa1Y3TWJqbGRPbUhtTjgrT0lUTGFI?=
 =?utf-8?B?RGoxQlNhcW1WR1YwcnJpZmIxdk1QSlRId2QwOWJzcERnYWt4Ulcxd0JOK1hQ?=
 =?utf-8?B?d09zRVJ2dFNycDV4elFZQUhlQmJ6K2pPMDlHbzIzanV1enVqaGhnT09FOU13?=
 =?utf-8?B?bVdpb2NpczFzMWZWSjRPQkVCR21CdlhjczVlNHNVNFJIcGVmQ2VDQTlSNjZU?=
 =?utf-8?B?a2N1Yis0NlVkUnRVaW1iNTNiM3djeU5WcWNkYVRLRnRQY0ZTeEw1T1o3Y1Fz?=
 =?utf-8?B?LytXbUtPdmJsMUg3d0d2aFdVR3dQdS9rV0JvZHpLOVd3L09Zbnk2WDJUcG9K?=
 =?utf-8?B?eVJ3WWVEUjJOMmxGdXUrUWRIZWdwekJOdDVkZmRWdzRPK2VCYzZmNGl5bWF3?=
 =?utf-8?B?K2VCLzdJWG15T0hOaDZJa29vMkhSTHVCL3lzZ0hhVlRSTDR1aWs3NUU5Nm1D?=
 =?utf-8?B?QkgxQU1Xb3hUbHI2THIrYTcvSGl1bGVaMW1heGdYYXEwMXZYTm1oNTBhNUFn?=
 =?utf-8?B?SHZ5b0xNRlcveUxlZ2hWek1rRFIzaW1LV0FGNkh2ZzVZalZscUZEVzlvZ1Ay?=
 =?utf-8?B?dExvbGFLQ1d0cWFOa0JCVUloMVk3N05BZWU3SzFMZ255S1k0QWlJRDBIVHZv?=
 =?utf-8?B?WXJVc1doMXJnbEc2OTN4WVE0Q0Q4TXQ3aDlpM2RodzZTaVZFWThnSDdERXlV?=
 =?utf-8?B?RExlcjRYVXhHZElUa3FRRktadldjT1NSZmhkakZOWkQzMmsxLzg0RGpobVcr?=
 =?utf-8?B?MkswUjBqSDZoS0Q0bnViaVArb3FmRXJjVmd5cUkrci92bjVvQVR4bnVVMmlU?=
 =?utf-8?B?WVRpM0tDRk9VWnFjVks1VzdBVkQwejd1QXdKcTNndFE4WWNTekFjV1E2WFV2?=
 =?utf-8?B?czU3cXIvQyszTkRqZ3NJL1A5UFNkQ0dBUndYVnZveEd2VHhUUVY1WFFmbTU4?=
 =?utf-8?B?MDhEdS9kRzZjMFlZTUV2UDA2OGc4YlBsajViMjFpK1FuaERDTzZTcW1iYXBx?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fba624d0-68ff-446d-5303-08db6d088eb9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 18:52:52.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62K+iUl1LGx0MynfCl7VbKsEpEFtmMs64G9UzgpxCOI7vhiWzVuWcDGutco3H6nRfs6qxfaVCwDbgqAdrhPRIsH2G48KP82woELYrAwLN/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4626
X-Proofpoint-ORIG-GUID: oZw_CA-IFu5qEqvr68AQ2AJw3GBs13IM
X-Proofpoint-GUID: r8EMW3bMCaFPB_dqzIaRQgFlFIc19RK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-14_14,2023-06-14_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306140165
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Jun 2023 18:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103288

--------------Gns4wnQtQa7PChl6klxrbrMd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 35EHaPg0024074

On 2023-06-08 06:37, Beniamin Sandu via lists.openembedded.org wrote:
> Signed-off-by: Beniamin Sandu<beniaminsandu@gmail.com>
> ---
>   meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-o=
e/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> index f821cdaf4..aba5ab587 100644
> --- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> +++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
> @@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol =3D "lmsensors-confi=
g-fancontrol"
>   # sensors-detect script files
>   FILES:${PN}-sensorsdetect =3D "${sbindir}/sensors-detect"
>   FILES:${PN}-sensorsdetect-doc =3D "${mandir}/man8/sensors-detect.8"
> -RDEPENDS:${PN}-sensorsdetect =3D "${PN}-sensors perl perl-modules"
> +RDEPENDS:${PN}-sensorsdetect =3D "${PN}-sensors perl perl-module-fcntl=
 perl-module-file-basename \
> +	perl-module-strict perl-module-constant"
>  =20
>   # sensors-conf-convert script files
>   FILES:${PN}-sensorsconfconvert =3D "${bindir}/sensors-conf-convert"
>   FILES:${PN}-sensorsconfconvert-doc =3D "${mandir}/man8/sensors-conf-c=
onvert.8"
> -RDEPENDS:${PN}-sensorsconfconvert =3D "${PN}-sensors perl perl-modules=
"
> +RDEPENDS:${PN}-sensorsconfconvert =3D "${PN}-sensors perl perl-module-=
strict perl-module-vars"
>  =20
>   # pwmconfig script files
>   FILES:${PN}-pwmconfig =3D "${sbindir}/pwmconfig"
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103185):https://lists.openembedded.org/g/openembedd=
ed-devel/message/103185
> Mute This Topic:https://lists.openembedded.org/mt/99403887/3616765
> Group Owner:openembedded-devel+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub  =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
The original RDEPENDS on the full set of perl-modules was from:
 =C2=A0=C2=A0 c00f3c285 lmsensors: Initial commit
back in 2012!

Armin,

Would it make sense to backport this change that saves quite a bit of=20
space in images to
mickledore and kirkstone and maybe even dunfell?


$ git cherry-pick c07fe3639a48602c7ed79e5b96b5f732c537e858

works cleanly for mickledore and kirkstone but not dunfell so

can you pull them into mickledore and kirkstone=C2=A0 or do you want some=
one=20
to send a commit?


--=20
# Randy MacLeod
# Wind River Linux

--------------Gns4wnQtQa7PChl6klxrbrMd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2023-06-08 06:37, Beniamin Sandu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20230608103731.103220-1-beniaminsandu@gmail.com">
      <pre class="moz-quote-pre" wrap="">Signed-off-by: Beniamin Sandu <a class="moz-txt-link-rfc2396E" href="mailto:beniaminsandu@gmail.com">&lt;beniaminsandu@gmail.com&gt;</a>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
index f821cdaf4..aba5ab587 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.6.0.bb
@@ -151,12 +151,13 @@ RRECOMMENDS:${PN}-fancontrol = &quot;lmsensors-config-fancontrol&quot;
 # sensors-detect script files
 FILES:${PN}-sensorsdetect = &quot;${sbindir}/sensors-detect&quot;
 FILES:${PN}-sensorsdetect-doc = &quot;${mandir}/man8/sensors-detect.8&quot;
-RDEPENDS:${PN}-sensorsdetect = &quot;${PN}-sensors perl perl-modules&quot;
+RDEPENDS:${PN}-sensorsdetect = &quot;${PN}-sensors perl perl-module-fcntl perl-module-file-basename \
+	perl-module-strict perl-module-constant&quot;
 
 # sensors-conf-convert script files
 FILES:${PN}-sensorsconfconvert = &quot;${bindir}/sensors-conf-convert&quot;
 FILES:${PN}-sensorsconfconvert-doc = &quot;${mandir}/man8/sensors-conf-convert.8&quot;
-RDEPENDS:${PN}-sensorsconfconvert = &quot;${PN}-sensors perl perl-modules&quot;
+RDEPENDS:${PN}-sensorsconfconvert = &quot;${PN}-sensors perl perl-module-strict perl-module-vars&quot;
 
 # pwmconfig script files
 FILES:${PN}-pwmconfig = &quot;${sbindir}/pwmconfig&quot;
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#103185): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/message/103185">https://lists.openembedded.org/g/openembedded-devel/message/103185</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/99403887/3616765">https://lists.openembedded.org/mt/99403887/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p>The original RDEPENDS on the full set of perl-modules was from:<br>
      &nbsp;&nbsp; c00f3c285 lmsensors: Initial commit<br>
      back in 2012!</p>
    <p>Armin, <br>
    </p>
    <p>Would it make sense to backport this change that saves quite a
      bit of space in images to<br>
      mickledore and kirkstone and maybe even dunfell?&nbsp; <br>
    </p>
    <p><br>
    </p>
    <p>$ git cherry-pick c07fe3639a48602c7ed79e5b96b5f732c537e858</p>
    <p>works cleanly for mickledore and kirkstone but not dunfell so <br>
    </p>
    <p>can you pull them into mickledore and kirkstone&nbsp; or do you want
      someone to send a commit?</p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------Gns4wnQtQa7PChl6klxrbrMd--

