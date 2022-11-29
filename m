Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4DF3C433FE
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 17:52:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.157592.1669744339402738936
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 09:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=hGA7Vtla;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9332043db8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATCwGck015534
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 17:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HjV9ALqxQrLdoX29i2nVnWeSZK8x+n5leWtVQKO5S30=;
 b=hGA7VtlaiTEQ5nSs+i6+WrfEWS41iAMzay8UrhOEl3jFL3+jqexwT6zSNop97COcRmbl
 TjSvD3XgqI0o9cVhyDMype7R7P+EfJiUaxPOwZf/Q7NdeQcbP7s7Bqu8lG+UCPh7Qbij
 I3zEQ2fE61GLYzSH/p60ltL7ZNI79v4c+Q9Ik3SwXhFgxY9kW8c9mIk8PBHTtuO5xIrx
 rbTKYn0flkwWpmWi1TjnSLwmsBXVDTQ6EH4pEp+Wj5OSWuGOparhvG7V+btMYJN5VnBV
 xfAl16+nh4gSrA+vseXSA07ccGc3s4mffgic+IqcIZhm5cRmN30XcdarIWNI+JHVmDK3 QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbtmvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 17:52:17 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2ATHqHcN031875
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 17:52:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbtmvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 17:52:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UKn8ECjkcF62QwO+9TJXHDyW8znPQJ4gCx6sYQO/sIy2s1RG/9I8j22e52+ifW+r+coZd1LjKSN6BMF/sk/NxJPORXFTuCahz/rQgcHSM6jtF2BIEo9c6epSUM9yKmGPLWsNs9meNtiWbt45FNcVEtt5fCCky3Iir4Q7K5ebQ+Fs/+Fv4+vbOpouu/GhU6TpzohV3uq88H5D6BbRD79UE240JtnZLPjKjIKsYTkvHi6sfOkszz7Y/QHERFhgBY/Z/W5r1XZvTRjsz/07JU7okxjv6cuMYk4lwndf2Xx/fqmAU+LmKRxpdKhPfhAt4OG8H5qn49sFXhvMhAcVSK1efw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjV9ALqxQrLdoX29i2nVnWeSZK8x+n5leWtVQKO5S30=;
 b=hWrFd0ebTN1Yju5JAgMYnbB3QhxU03egaEirerUl2y0Au/JNh4sstwy2V9wR0Wz5CM3r8b5Y0SPRm5znf3iP+1kR91jyde1RKWpHrMWCqbDqUu6uV541d6w1r0ldKPpZiuHyXd4phMcCZ1yY1hME4x5LaSpxazNGN6LzBMtNOEt1Adg+8OHmMZrOTtXvyeLF7CXeBzNCZuJUi4/DkIYtdC4fpp1f8DQnhKv8ccCSQcFxIDNzO644wLA/puJAPt49MUC0nKMUmRHjJ9LHag6ZtvSTNQDd3cmIKmmcgUQGybea/oXA2Pv2U5GstgF5bBsinR4Kc38+r+PQPaKS/gYojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by MN0PR11MB6255.namprd11.prod.outlook.com (2603:10b6:208:3c4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 17:52:13 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 17:52:07 +0000
Message-ID: <8bb10a9b-0d80-3ea6-8f1b-51d25a7d219a@windriver.com>
Date: Tue, 29 Nov 2022 12:51:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe] [kirkstone][master][meta-oe][PATCH] redis: upgrade 7.0.4 to
 7.0.5
Content-Language: en-CA
To: Changqing Li <changqing.li@windriver.com>,
        openembedded-devel@lists.openembedded.org,
        open.source@oleksandr-kravchuk.com,
        =?UTF-8?Q?Andreas_M=c3=bcller?=
 <schnitzeltony@gmail.com>
References: <20221014022410.644189-1-changqing.li@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <20221014022410.644189-1-changqing.li@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SJ0PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::29) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|MN0PR11MB6255:EE_
X-MS-Office365-Filtering-Correlation-Id: 533cf282-6316-4d45-1da4-08dad2326e8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Xu5zV1vVrwJUPm4kiJ6TlyIndf+CbCUl6pbc9PsuJ685BEj1okNR8Z6eELtEylO9juTV541DP7KwpIFMMDGASc/t+2QJGG6W0bcR6f2RWMSZF48pTGhA4UNDRhnWTCZeZoufSabKJW5x/v6M0v0LpocT3qm1XYztltpSWl3bj5DcHEDBn90UHfiMelQ3fGFa0cqZGBQmdyXs0355mv1tXk2Dv6E8WBJaYvb5+3xLL2ytUXIEWxPAlbquzLMsdRAS3OLwr+/pAx2XifCeHYxU+EKdQtNArPjXKhU+VAMLTSq+QCQrxeQocj0wR3CmeNujuIcsX7/eFVyf486EvUHXlhXaIfAi+/epeQUh2Du+lHod/DDdgC8bI2qBK1fFjonxdVZF/WBs8soIuIeMa9E5L2GoI2YUOTUk1su5LEWBdZjOigkp66vnayUHWojhd68D+rdK5sLYp2PX6LCk2P+tRERxBUv1YgcEaW2P+LTCjqZmku5AdIKdvSg8YLtigILwujfcfK8bT/FN/UC/uURVCZHurB9SSTvEKj8J2ETum0DFkhHPZ6Lm7DL2QqOcbjC0ydqv7kfCMRzwkdjFN9AHfkuyMIbyED27MFPgWi7dgDIrYckCYVQtKj5OajxN1SaY+qXfRIH4L4oGnj8kba7U4M6L3z5OH/Bz7I3LCexu7v9TKJQ1Lw1DsGPVfTOZA3MqXh9ZnYv35Tu6N4FMrW8QTpRlypFD4BwH1lEcMOm5Zhjo7uXysTiEowxnVr2e9VSNUhYhRrJDMBE0SC3Tp3/j9W5Vz8Bgg3zgObd+5JzyMrw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(451199015)(38100700002)(66574015)(83380400001)(31686004)(66899015)(110136005)(6506007)(6486002)(36756003)(6666004)(966005)(26005)(6512007)(31696002)(86362001)(186003)(2616005)(53546011)(8936002)(5660300002)(478600001)(66556008)(66476007)(8676002)(41300700001)(316002)(2906002)(4001150100001)(66946007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3dSNDh2eDJSR1kzbE91WWtsSSs0bEt3bEphZklObytWU1FEZmRpck9maUcz?=
 =?utf-8?B?RkxPQkZKbXlveTNoRHY5bjdZbHFvWmxaU3BUWE5ENWhFQkwyMFVlRDNmUmp1?=
 =?utf-8?B?Wk9PdmQ3dzJwQ3JNcytWTkZndzNoOWxKMVFwdFU0N0FZMTgyK2VEZnBwdGNE?=
 =?utf-8?B?S0JwM2xYdmY5Ukc0RDI0ZDRMUEJOYVdUTXA3WnpHdm9ldzVpY3FsNTlRREJV?=
 =?utf-8?B?am8rWUg1Z0Z5OWhuOE5mUzhDT3BUbEZ4SzhEWmR6cUJ4VXVuQk96bngxL1lR?=
 =?utf-8?B?R1Z6aHZuT3BWMVBvWi9kNi9zdU1oYm9vTDEzbVVibkt6Qzh3SGU4MnNmanBY?=
 =?utf-8?B?VlZGTGtRSjUrUlFad3MvRm8zbEllLzUzVnpBUWRXOXR0TFlPK3JORUdlSksy?=
 =?utf-8?B?Nm5qV1FydjhvaXhmRm1EblR0b01zbmNlN2l5ZkUrVUhFNkxHNTJ2NkpCelB2?=
 =?utf-8?B?akJEcjBqWEpwQ1lnSHpPTlpxZFo4VFhWT2tjWUpRaFdBUHAyczZQRlVOdU91?=
 =?utf-8?B?NWZpQ2RnNlVDNzZaU3JmaysvT0p4MFNVR242Y1Q4dzBqNDZmT0JpNEcvaGQ5?=
 =?utf-8?B?TG9qaHRPaW5LUzFTL1oxVjZibDJ1ZS9iaHJJcFhFRlpWTDR3M3lmYjZDTWtL?=
 =?utf-8?B?c0ljZmVmZWE1bXh6bkxGOXhaa0FkZlZzTTB0a21SbHlLc2JOSVIrRFRzYXo0?=
 =?utf-8?B?N0JtZ3JQTmNmd1daZ2xEZ1Z2WTM4UmVEbVJMYWYzN0VWbmVDSVJLQ1NTUWpU?=
 =?utf-8?B?WWRFYTlTZHo0OXZPU3hRUUxNcmxyRTBzaXViUVRyK3N4aVZNWEk3L3dON2Z0?=
 =?utf-8?B?MURQUHY5SEdHN09ldXRMamtOaUl0dkRTVFBhMmhvOTFldlNTbUUydGtmYjBQ?=
 =?utf-8?B?ci9xeVE0SVFld0JGREpFY0xEak5PRE02WUxJRmxaaVF1ZTRybEVXNXhqRWpp?=
 =?utf-8?B?Vmh6dVYva0RTQyt4L1pIRzVvdExjUXM5RXJjY2o3aEozTGpxWWdZUTZISy9a?=
 =?utf-8?B?aE9KZEswSE1rR2doQUYzVTFEUmdTSlRKOFNYTTczbmwvazlDMnBodTVjOGdO?=
 =?utf-8?B?UFZEaWJsaEN3cFlydDY0QzJnd21xYjZhell5VVhDL0kxUGtkRmhEdlhOVTJY?=
 =?utf-8?B?VDFtd2p1a0J3SWdrUjNtWEZQRzFKOWQ2S0wxTDdPSGRzV0RQVk8zdWRpQzBD?=
 =?utf-8?B?M0ZraUJOM2xQMjVCMmJZcmdOU0ZBRm9OdU53UUFuZXdJYzhCMUFDRW5zTmN5?=
 =?utf-8?B?dVo0aG10dndvSzhqMjNpOVJsdmlYSWRsMWhNNHdxc3krWUJOMitzZk1hUUtj?=
 =?utf-8?B?OElIZ095WFh6Um40aUtXME5YY2lqT0kySFBLd2wvZFJ2QzlqTE1yMThuMU9n?=
 =?utf-8?B?Qk11eGhjNUUrT25YOWFKaC9GQlROeWRIWTFZTExJWEs2eHdSaTJzSHUwbEFG?=
 =?utf-8?B?aFZYaGhkWk1lQlFxWWRsUmJWNFl4Z3lWSEpvRmhMdjMxWHMxeDFTa0lJd1hV?=
 =?utf-8?B?U2RsYTNyWDNyaGo0MDd6dFA2amxCNjA4UXV4bUlhcmIwL1RZTjhaN0dlSFBy?=
 =?utf-8?B?UzhVN3V3d2J5UnZCTEdPU1c5cXU4QVcwaVBGZm1Na2I4QU54VFl4UWdLRFRG?=
 =?utf-8?B?VXVqN3ZtdFU3ZVlUOWpxbWJKTFFyN1NJQnRjczFaOXhaNlQ2NGdDYVpVMTR1?=
 =?utf-8?B?Tno4bVhGKzYvb29PQU84aDBDeFM5WFVsQTZDbDVqRG4ydEFEanIxV2tUaGxj?=
 =?utf-8?B?MHRGeVRmMElNQm5BUi9iUndhRHBzUURLRlZsU1hUajMxSlpOUkEydXZad1ky?=
 =?utf-8?B?Z3BQa21HbUp0Rk5jbWUvaERJMmdiZU1kQ0tOTUZsbkxhUWtGUUJwN2FTcDVy?=
 =?utf-8?B?VzgreTBUbng2bG5jVGlSMjQ5MFZ2VmRNbC9rQTI3MEQvOUJqNnE4L2VIMC9h?=
 =?utf-8?B?YzFOc29PN0c3TWNCd2Q0blZVWC9aejBWeVZ2R1FRUkgraWc2UEx2SWNlKytr?=
 =?utf-8?B?bW0wSjYwMXZwYlUxQ2dtZzg2VmYxVjlwK1ZNRysrTThmUWhHVnJlRnpxWjRO?=
 =?utf-8?B?ZjR6aDZvN2l2SE9WSkdHM0IzZnpGQ0Nja3NGeGpVZk5LM1pBZUM4TGYvYW9L?=
 =?utf-8?B?SWMySHdUb0lnWTVCSVBQZmdpMWNJdlFGOHVVbFRXZ3RZQ3puYUtJU0d2RVlk?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 533cf282-6316-4d45-1da4-08dad2326e8e
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 17:52:07.2445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: McjShmmOvlbYQ6M/hDpsrEqxxvHmoZ8wWOOvsHFXVoRvJmw31h4Z9pTeZI+Wb3tQHfnH1+vBo2gMjuZGhM5762X2s6CF5cvdVh2SMcUjfCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6255
X-Proofpoint-GUID: W5up052Zi1Gvyh6DQFp-XnJO61t0qppj
X-Proofpoint-ORIG-GUID: OuYPQH4SIMaV9SNtTYjcKE67PqXSvNdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_11,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211290100
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2ATCwGck015534
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 17:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99848

On 2022-10-13 22:24, Changqing Li wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>   .../recipes-extended/redis/{redis_7.0.4.bb =3D> redis_7.0.5.bb}   | 2=
 +-


Is it time to remove redis_6* yet? 7 was added in February and
it seems to be the stable version now. redis_6 was added in Jun 2020
and according to the 2nd link below, support is only for 1 year so
it's removal is overdue.


https://en.wikipedia.org/wiki/Redis
https://redis.io/docs/about/releases/

commit c8544b3627fdd026a0e3e85a64f8af37e0417919
Author: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Date:   Tue Feb 1 16:01:53 2022

     redis: add recipe for 7.0-rc1

     Redis 7.0 "includes changes that potentially break backwards
     compatibility with older versions", so let's let folks some time to
     test 7.0 and later decide which version(s) we want to keep.



commit 6045c0dc8a08bd9d74d3d1d160250d00a877822f
Author: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Date:   Fri Jun 19 07:32:00 2020

     redis: upgrade 5.0.9 -> 6.0.4


../Randy



>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-oe/recipes-extended/redis/{redis_7.0.4.bb =3D> redis_7.0.=
5.bb} (96%)
>=20
> diff --git a/meta-oe/recipes-extended/redis/redis_7.0.4.bb b/meta-oe/re=
cipes-extended/redis/redis_7.0.5.bb
> similarity index 96%
> rename from meta-oe/recipes-extended/redis/redis_7.0.4.bb
> rename to meta-oe/recipes-extended/redis/redis_7.0.5.bb
> index e292237097..3c23deb9ce 100644
> --- a/meta-oe/recipes-extended/redis/redis_7.0.4.bb
> +++ b/meta-oe/recipes-extended/redis/redis_7.0.5.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.=
tar.gz \
>              file://GNU_SOURCE-7.patch \
>              file://0006-Define-correct-gregs-for-RISCV32.patch \
>              "
> -SRC_URI[sha256sum] =3D "f0e65fda74c44a3dd4fa9d512d4d4d833dd0939c934e94=
6a5c622a630d057f2f"
> +SRC_URI[sha256sum] =3D "67054cc37b58c125df93bd78000261ec0ef4436a26b40f=
38262c780e56315cc3"
>  =20
>   inherit autotools-brokensep update-rc.d systemd useradd
>  =20
>=20
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99167): https://lists.openembedded.org/g/openembedd=
ed-devel/message/99167
> Mute This Topic: https://lists.openembedded.org/mt/94319515/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
# Randy MacLeod
# Wind River Linux


