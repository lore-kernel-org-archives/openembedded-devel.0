Return-Path: <changqing.li@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AA3C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 08:27:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.128946.1671092838161305687
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Dec 2022 00:27:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=oS/EvSa8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93488afd4e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BF7ui3s015508
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 08:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=2aYOkALQJS7rc3nyFPVPleCHTTLhl1TVTxTyM6mu0g4=;
 b=oS/EvSa8i+HXvLpaeUeGd1UyC3+MOcr7jL1UPtNvFeucVTc4OERcUmLqYh29OEblhqXb
 BbJrF0BLxZ8tnUzFFSQUxQNnePct+08GmLInzLG7/t6ZnZ8cN3YcdV8TAmvoQKtwQKt/
 CH+bFaohGnf68WCtM8UzhcrZgIPQb9njk+5GHhbnBadbxESm48lRb159NAO/jOaT9ZRy
 nQmpYDZU7wU/iXOInLPRPFNJaLL/CwdMEek+gqLLUPwpw1aOMc43aJYceignrWdwrxEc
 fsNBocZ3DPLCdleXKvR+EJRxIR1mt1T9qeA2nHfXb7vWfh67c20kMhQhi3dPsVt1wDhT AQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3meyfysbcn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 08:27:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPTDP3SUN3S1MwmnJo/9xd/ZaiNxTHIMo9Dvn0JdlY17cXbrASCMg11aUXFXm6kFIBFK1EhF+5kVQdSHxIbSkyBgHtzIekeuxlBs1UrsYPfAU7eWbxfF6O8GgBWIVD3ZKNb2BTgnTayjvFwaLYDi0v45RIesG59rpYycg8Tl80NXVjYJ0YrTsjKzN/0sMi1L/DtjK67nYiFMhsi0U6eRtSvZJDuj3I5BsYyb9Io+HQqQvPRjXHolAOHVx4R59cS8dLr9WXexAA4h+nny/LaBA0QFJdhsFNGehqjH9rDxsNne39vZwY9V3zA0UC8jWzUs8KX1kZ76Pf9noa/Aan4nSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2aYOkALQJS7rc3nyFPVPleCHTTLhl1TVTxTyM6mu0g4=;
 b=bco8TT3kxDgJo0/jM5g8bbsf7Woz4how/0ZqGNJ3OAGygsjTYB4FVf6P8HEem+gLn4k3AVc0GKFcI91si7ohRquRF6KnH/K8G97AF+9Wn/JPPlfURumwMqDzBtdECTSeB9IxhSA27NRiG3hiJw+RhykRLtA92QNYftophSnzCNXmvEcJST1D3+EhYz2VIk9qkY6YvoaxrcnAwyUh49sMB9c0N1H7QAvvrVmpgeeWp4sr/S+w7GyUJPgEhb8iWEhidrWEoB9yLL//yIJKu5F37MWWpC8U3g+rkzWj7YhiOxMplPbbLu5fSlIgM4v3KgZ76lVoKvsES5T5hfnc+W8gyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by CO1PR11MB4770.namprd11.prod.outlook.com (2603:10b6:303:94::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 08:27:14 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::accf:48c8:40d3:da7]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::accf:48c8:40d3:da7%5]) with mapi id 15.20.5924.012; Thu, 15 Dec 2022
 08:27:14 +0000
Message-ID: <48eae8b8-9528-a099-d57c-12f968310b9d@windriver.com>
Date: Thu, 15 Dec 2022 16:27:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [PATCH] graphviz: Do not build tcl support for native
Content-Language: en-US
To: Changqing Li <changqing.li@eng.windriver.com>,
        openembedded-devel@lists.openembedded.org
References: <1730E6FCF730855B.9432@lists.openembedded.org>
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <1730E6FCF730855B.9432@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0158.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::14) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2557:EE_|CO1PR11MB4770:EE_
X-MS-Office365-Filtering-Correlation-Id: cea0eead-6878-40eb-db24-08dade762b10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WFtPUx1L665VnjHTmDcau7H7kAyUN6tZDtXDtWw5YAqttF9yQMls6i3XtDzUh4vXLjsMpdMhzAwCloM+dVBCf7p5IizK0WE1tzS7mpxNlwA3nc/YFCqnuc64SAcI220qVPyvLBUqspRF58pRKmXUnQorOeZv30V7YokA3dMwwWjaYQ+ZktdkuUAbHBGW6wzyHOFZUw0l6KWKSQoTclYQbiCTFzcUZa2VqHrZYRWF5LDaX5t1TaoO9RsdY2+CWQQyZLtoccT7NTBF51LPaJcqpFJ4BbRvSyuBzSFNkgWSthl5Mf/inxEdBRfCpc4C7bA8YhSBsNds+ypM0pyTqF4cBAQ6LjnCd6b4tbU/R1gYzSaLYWWwblIS1+yajvY6sxJvAD1IH396BsK4xeYVEmtFcA1DryKiKiYycBR5UOTS3SP7r4x4Vo4gDqOzqmnTlSmH8tjzCQ+8d3jb+KPOOC/uoSuOOiobdgZiQXmZQ+BxtA2QvCILwluPFCNHIg2cFvTOEnqJ0lZ4X8VVT0ObQ32CY/OObPNYZawFfmBp90xJ2jx1LqNLMvIdwUvKNHE9zZR5bfr8qHz9AOD0zz8CmgThudlokAOZLVZ1cvkaIvKJ7zlrp93yGQwAqhb7zf0xUZgNassXbQT1o4vqRmSUyowPGJY4sln3OVOu48+U54FV3i32mKCwbT45NeTiCr5U8aJV6nCG7IajtSWGuzWfSN1K92/Onc82YmZR73NTJ7PEVAOQxyej2VeGcXgr2o9xJMOJymNbEWDpmrPEyNMbqjdJmtPV0OKkVufvSeX2wJ+MME8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(39850400004)(376002)(136003)(366004)(451199015)(2616005)(31696002)(83380400001)(38100700002)(86362001)(2906002)(5660300002)(8936002)(44832011)(41300700001)(26005)(6512007)(966005)(6486002)(6666004)(478600001)(66946007)(53546011)(8676002)(6506007)(66556008)(66476007)(66899015)(316002)(186003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1Bqa2owcTludWZLVGNuOFdHNUxOUklIcnZBejY4UmNsV1lpWVFmUkpRdGxJ?=
 =?utf-8?B?ZzZwR3pXM0o0Y0syQSsvOU5ua3VhNDQxc1cyaklLaDBla1J5TVA5QlFacGc4?=
 =?utf-8?B?TXBlTGNPbEdVcDlpcE1RUjI5M1d5elhWYjB4MkFJcUhwVzl1bnAzZE93VDdP?=
 =?utf-8?B?QmgxcGxuSDNVTkFxRElWNkhuYzdHRDlqZnlwY3BWS25NUTVBeGlWQStGK1U0?=
 =?utf-8?B?SDlTMktYQ0NHTVJkakRSa0lzUnRmaG9pOUNZVzduWlIvcDBFTzkwNit2NENP?=
 =?utf-8?B?U0JTUVU4STB1Z1hrZkxDcVFFOHBWd0FwTGxDRkVDSldzS2dsdWdiVmxnbXRk?=
 =?utf-8?B?eFFTb1grL1Y5UjlQOTZRbnBNL1NkNnVTNjgwb3g0VzBiSVR0SDE2Mjl2ODU2?=
 =?utf-8?B?MlBDVXZTeFpHWEwrbGVYOTF1TU4xTGtWa2MrK3ZWNkVZanRNKzJnVHY5Rmc1?=
 =?utf-8?B?UnNSZ0RGek5RZkFSaHpFNDc2ZnF2RFlXcktGdGV6Qjk3RDBmS05acWJQNmpP?=
 =?utf-8?B?NUlLSWpyNW9xRzBMVEh5dThjTzlDTWV5a09pdUNLUUZVSzZRcVEvK3ZjMUZj?=
 =?utf-8?B?WTJZUTBPSlo5Njk1RkxPa2tqTEY4a2FYb05ET2MySTdCaXdGcnFpWitGL2NT?=
 =?utf-8?B?Ry9rWnhaUjRTV2pJWHlaeEg0R2I2VStvNHFudHYvUEg4TVd6NmQ3eGdZVFpW?=
 =?utf-8?B?MU85K1QrcGNJd1ZzSWVyT2d5dXpBYStZN3QyanpHSC90WUM0eWJETkpvM24r?=
 =?utf-8?B?NXFlOEFSWmJ2SzluZHA3aFhVMCtzZGovdDVxWFUxYWRLdWNlb08xSFFqcVVR?=
 =?utf-8?B?OWcxRWtFTnFocDZaVjZqNUpjTm1mWnBpeDhMSVRoWWxHc1YzaFN2Z3R0L2dq?=
 =?utf-8?B?WWZRUlNTTklOZHJMQXNTc2RqUUVNa1ozZFRyNkdaRk5TYTZZSU5JNWVPVXlt?=
 =?utf-8?B?N3dJZ3d0dStLVWJHNHR5ZnluNkdkcmp5d0t6VElIN3h3UmszYjhaVmJpRnh0?=
 =?utf-8?B?cHFQOHNWK1plRGJPa2FGMEJEMTZaM3Y0NTAzdUQydWRUa0dKYUV3Z0NCTGxV?=
 =?utf-8?B?V3JmUXVBYzU4NU5xdGJnd0FxQi9SRjhwR1RheTJSYWxMNUhmck80Z0R6VFJI?=
 =?utf-8?B?dGNHSW52djZlZTMyTWJpaGVxNEJNS2NmKzJBaFNPT011cnMwSlZlZWdMTm1L?=
 =?utf-8?B?NUR1YkFXL3EzMDYyQXZjT0d1dXpRRitHQ3FYTllMREV1UnVqWXlQM0xxUENa?=
 =?utf-8?B?TVBFMG5WeFBCQWxYczZuV0NBVyt3N1N3Y0luZldmMzN1aVgyK05KMStPN0Za?=
 =?utf-8?B?Y2ROOXdUeFVYRUYxcVNFQXdGamJYVmowUjhXbFh1U1YwaWd6UVVJdkVTbGVB?=
 =?utf-8?B?OEU4YzFETjJkRDd5bll6K3BteHBmSHcvdFUrSDNFWnhsdlpUQzhwa2JBZk1X?=
 =?utf-8?B?OGQyRnUwcGRBaFVlVVNYQXMrTU5ZcmtmdHloR0cvMEFnbFVFNDBlYWJSSk9Y?=
 =?utf-8?B?NlpPMnhOMjhUQkJ4dll2ZFR3N2hSYlJGY0VPZ3VRQWRSZ1p6ZDR0SCtjc01J?=
 =?utf-8?B?ZTdnZys4MGR2cHNWQU5Lb3o5VmN4U0ZjaGJFYlpmWi9aSW83bC9CMllOTm1F?=
 =?utf-8?B?UVpHaDNaclNhdk53d2tqdkNjcldrZ2VoM0FLZnVFK2M4OHQ5M2w1K0RyQUti?=
 =?utf-8?B?TVNnSFZXekJoakxQMm1qV1lHWEJid0htOHAzSHVGVVk1bTIyNW4xVHd6WGNp?=
 =?utf-8?B?bUlQZUo1L0ZpeUxmalJuR0pDN1k2YW5kTnVUSkFYcWZBV3kyQ0JIdFpFZDUy?=
 =?utf-8?B?akZmS1h5TjJka2pMS04zeHZhR2JxUWFLTGhnMFJadVVXbHdxNGJvNU5CaFha?=
 =?utf-8?B?U0tkdWtFVlN4RGpQeWFPUnNlRFN2bnE5WG5jVkxQZHpLRUZZcTVlV3dYRlU0?=
 =?utf-8?B?a0dqWWd5bWVKdkJrTnU3VE9xTG82K1djMkQxd1BrQXpmQmpmS3lRVUkxMHRK?=
 =?utf-8?B?aUhSYVRwSFhpcktmV0g0eUxBUjQ4QzVnQmlyV0hvdkhqQVBGbHhURWhYUVI4?=
 =?utf-8?B?S0VoYmV2Qkt1VDRXOVFmUmxDczZLWGhraVdrZmRpeHVtVTZPUTJOaWdGUDR3?=
 =?utf-8?B?SDZtL0UvdWE3b0NtUmdTNkdJTks5ZGgvWVErVmx4VE5UQThtTGRFb3FSd2xp?=
 =?utf-8?B?d3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea0eead-6878-40eb-db24-08dade762b10
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 08:27:13.8878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r5R5gzoBTop/YkZ1Fp9VNpmpgdownJAYAbOkrouxAhotqvNKzYRpKa3QV+AuXe4f7n6mCbGU2+SYm4Pzfgfhey6JS11pIV6WJMz5ZwVoRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4770
X-Proofpoint-ORIG-GUID: zx7Myy599K5Bz3-psujFZc_-Rin8sxCN
X-Proofpoint-GUID: zx7Myy599K5Bz3-psujFZc_-Rin8sxCN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-15_03,2022-12-14_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212150067
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BF7ui3s015508
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Dec 2022 08:27:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100081

Sorry, Please ignore this,=C2=A0 Seems I send it twice.

On 12/15/22 15:30, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>
> with enable-tcl=3Dyes, task do_configure looks for tclConfig.sh on
> buildhost, and source it. But there is no dpkg-architecture in current
> PATH, and the tclConfig.sh enter into an dead loop since
> dpkg-architecture not found and finanlly Segmentation faulted. Therefor=
e
> it is better to disable tcl
>
> do_configure failure:
> using /usr/lib/tclConfig.sh
> /usr/lib/tclConfig.sh: line 2: dpkg-architecture: command not found
> /usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not f=
ound
> ...
> /usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not f=
ound
> /usr/lib//tcl8.6/tclConfig.sh: line 2: dpkg-architecture: command not f=
ound
> NOTE: The following config.log files may provide further information.
> Segmentation fault (core dumped)
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb b/met=
a-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> index 4c51af669c..967b9321b8 100644
> --- a/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> +++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.50.0.bb
> @@ -58,6 +58,9 @@ EXTRA_OECONF:class-nativesdk =3D "\
>                   --disable-r \
>                   --disable-sharp \
>                   "
> +EXTRA_OECONF:class-native =3D "\
> +                --disable-tcl \
> +                "
>   CFLAGS:append:class-target =3D " -D_typ_ssize_t=3D1 -D_long_double=3D=
1"
>   CFLAGS:append:class-nativesdk =3D " -D_typ_ssize_t=3D1 -D_long_double=
=3D1"
>   do_configure:prepend() {
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100080): https://lists.openembedded.org/g/openembed=
ded-devel/message/100080
> Mute This Topic: https://lists.openembedded.org/mt/95684473/3616873
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[changqing.li@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

