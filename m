Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76871C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:29:52 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web10.44844.1669904989539377824
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:29:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=okBNb+yi;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1BtW1j029617;
	Thu, 1 Dec 2022 08:29:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=YgrV/mLs3Ustk1OwoZK8lMg/Z+qwS19ExzNsTdnMj3g=;
 b=okBNb+yiShzaeh8bfu8XrlPSC268FasEhb7kmKLwbegiMxmWeMDDvAdJ8jhmjUNm9JQl
 YhfjO8QEXvyJlKEaRyer21frPD9EDjgCKfunuwyTjL/9w5f8C5YKhtJii4233g65vBIA
 7h9D+hKVXyPPzw54Pm17dyB/4Awih/SksPOUOINabbHkWBnnfywk1VsIng+z3hPfJDY2
 pZHcl1BqaHPLQM6NImqEV+3q2nwkWdvi49RLjs7zunKIMgptN3ke5L6I/3iAARTalsy3
 OD6FSzA6FUfIO2CJfCh4FfGHf2mn+uKKJNHEF3KHbG7l33BfMI1Ey96SgcvSCxlY2xCV lQ== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3m6k50s5rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 08:29:47 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqs689b8ZZQDZx4caJ9pEKKN5YsToXaE9Pid6dL6VdqZQ7+u1g4FrVMzfwsF02mtjHWaNo2KsJEaichFDCLWL5GU6WZvCkLLXifDP69s3nf861v5aXh97jhqVCbDnE6N2gQaMAV3E8DZbO3VDRZeelEqwJo2FuniWQEn3APj9HD0LWHGee44/gbR8OBmKft2hwYPtfyVcnxZ7teSmelO56e0Dp4+j2JCa/lNNiSNoB77pnLvB2oR+PrIkILFc2k3GjIwEO/NOTl6r6cBIHezKeRAI6X9PlntoJxEsl+DLzf88Itwh5aRQiYgje13j6S03ml8NUkzkIoOblSaZ9MmcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgrV/mLs3Ustk1OwoZK8lMg/Z+qwS19ExzNsTdnMj3g=;
 b=W5FPqyQ9howspTBrf+UlkxLMUhAEWfLZLG1wODTcb+jSuF5/MGIA0MKbVBaFOgx3waJneBYkHDYFIVTxM/byUZR3mexCXH9iuds7J6MfECjBrcun5z9fTNRLSWIWB/WYoW/ANXmFY7jXgoci4Iv1oadSv3c8ddWuM3e/Lci+vJ+iuLUcNZZknRprVL+8fW9Awof+/3/s01YlaWO/Nu6DUTGnwD7c8PUSqHJ9DY3OOysxlE2ySvK8PzXsJ7LrIfqgH1c35xcsyAgyqSaUIEXNONCiARpkZIZRNPy+/zjDBrDQ22scLercGz5ATYf2XykHx4CQLDEe2e55phRitUycEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YgrV/mLs3Ustk1OwoZK8lMg/Z+qwS19ExzNsTdnMj3g=;
 b=G9wd9aJfi7DMKlj5Go5im/8Y+NELvSiYServVPG/U7NMaiP1U2txbRQlPcXyBzEARGztmhUHRC88HHdg726iVduV7N908ePQ89zNpmmqGDTijhXFsaNuUe/LFn3a33Y2QOM/EtJVIZSi5876/X0aibpqGFuoqWf6OIdTinxF9AU=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by MWHPR0401MB3564.namprd04.prod.outlook.com (2603:10b6:301:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 14:29:43 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:29:43 +0000
Message-ID: <e91ec15d-8fa9-06c1-4251-113231f1a557@ni.com>
Date: Thu, 1 Dec 2022 08:29:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org, schnitzeltony@gmail.com
References: <20221201134148.116754-1-alex.stewart@ni.com>
 <20221201134148.116754-4-alex.stewart@ni.com> <Y4izUPTB/BlGf+vU@nuoska>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <Y4izUPTB/BlGf+vU@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0029.namprd11.prod.outlook.com
 (2603:10b6:806:d3::34) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|MWHPR0401MB3564:EE_
X-MS-Office365-Filtering-Correlation-Id: ccae0119-162f-4b63-e858-08dad3a87d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hxuT5dnz5/TU2UhVlNCvugHGz47s/9VhDmJCVVwzRxhibH3zbmssIOJEYZUz/3kyJGL8WXpX4YxjqNQF+RaiVenMLBVDesoHBJ3rPdLdCF+TGddG5BkbgEdXGHWeiotzalcxIE7pL/tGepKqsAx0mxEb5ITow3HwHcfWqVn+EKWm6n7uZbaX/TBvdP+k7YzO0PYExHPhXllcUWQigS8avzS/sZWk5D3ulD+mcCFkWgtXK06L+AAkQbS0paHcjnVLwQj1zU/TjENvKof7dnWioFlrcyTebjwJGClrXvle0e0dBpjRUDcbpauroZi2vlLpZd69qcwmiifvapmM1ccesNnmvFB87Ik+3/OoBROnGObwzBA1/upcTY4IUcpq8TyKo/gl79vz8AXArXCA9PxsiNbjUoBcg5AzNyBScS3aAwZxjIHmrsWqTVVEfE3lx50StCkfNXSVyqWXxDsWvkDfChrBZz26wpvVZSW/w4XUoMfstbW4vKaUDRR3jpVmjdNyEx6sjD1AM2eT8lXOXM3G3QAS8fmwJvT5+pQ3TCObhPOk6Pjxutda/N9xYzMbFJBjeYpzv52nj6rkrjI+1XO2B0ki2NAll4zXAVn1SQhmaclwk79e/5attFTGT6tM39gYWx5AtNHW/1+5GH1Gp8ZjvLAkZ2vC9xTT+L/fffKjd+rm+ulirXPHFbl0dvw6gdj7vg6wj9VolMhX1BPoyutJCEWY4xVbnIQbweKxJ21vKLEJ4pZ1EwjijubDsq6xU2d3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(39860400002)(366004)(376002)(396003)(346002)(451199015)(31696002)(86362001)(36756003)(966005)(36916002)(6486002)(478600001)(2906002)(53546011)(6666004)(6512007)(6506007)(26005)(44832011)(4326008)(5660300002)(41300700001)(66946007)(66476007)(8676002)(316002)(6916009)(66556008)(8936002)(38100700002)(2616005)(186003)(83380400001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkROekZrdjZCcE1rc3IxRWxvOS9INVUvb2RJWVNEa25XdWtPYUkwN21xTExy?=
 =?utf-8?B?R1hCa05vbGFSd282TjIvdy9uTnlxNmF6MWY3UjAzekpINit4K1JoWFoyMDdw?=
 =?utf-8?B?aWEzN0g2ckpaVXlMQlJXeVRSejNieUlRckxnYlJkWTNHMDRCMGkyQ0FJK0JT?=
 =?utf-8?B?d1p4RmxQcmtKa29BbWlLMmx5TUk4UWk0UFhpVDFHclpGM3VUczBPY1N4QU1l?=
 =?utf-8?B?RkJjQ0VJYmxDSEdGVDdGN2FQVm8yQUlBUXZpcmtwbnJLMWx3K3VYLzFvQy9j?=
 =?utf-8?B?NFBqWXpnKzdQaTlBZGhpS1g1cGtjRVJKbDNjcDVCcHBwdHAxYnVralNxU2tn?=
 =?utf-8?B?MTE4aCtIblJ1N0UrYjlQMXJCNFFjRU1VTXVKY3hsTExXVjE5Z1VLQVkvbHpQ?=
 =?utf-8?B?N2dhN3hVU2lIZ1A5S1ZnTTA4eEJyZmdZZ0ZGMTZYak9zM21zODVwK05WMFBh?=
 =?utf-8?B?NnJZSE9hOVhwZGRGemhZZkZZS2kxNjE0YTM2c2k0eXJML0FhdDU0dGdVakxV?=
 =?utf-8?B?MkQ5bjhuM0ZaM3M0c3lOekIzdlNzZTRqWXVObVZpVzZCV09YTXNVZkZYWWlL?=
 =?utf-8?B?N0lCTG9jT1VkeVlDQlViQUQ2TXhGT2VPaTdnYTVaeHIrMkxEZXZPWmtrTkF3?=
 =?utf-8?B?Y1dGZGFQN1JaMTZqOGthRXFkWHhDZEdxeVk0TStJMjNsZ1RPYmpndkZYQUZY?=
 =?utf-8?B?Qzc5Ri83bGZVd2R0SXZSY21TaVZNallLUnVPbll6UW9SOUl1bnpDM2w0OU11?=
 =?utf-8?B?N1dtQ05zTW1NeHoxZDJxOTBBUjhkaGJ6cWtYeSs2aDI3UWwvVm9teUVGb1Nh?=
 =?utf-8?B?bStoeUZUV3EreENSVVU2cmxSZS9Ydy9EdDk1TDVBK2ZDWE5SakNtUVcxNHQ3?=
 =?utf-8?B?cHpGTnlkV0xqb1lJdHIxR1RPUG5kVGZWUDVCSmFybWZobVlzam1ybllESnhz?=
 =?utf-8?B?a2hTcGlQVTRCelZBN1dqSk4zTldRQUpSUWk2WTZ4emFjT1g1NXdLSlhvemtQ?=
 =?utf-8?B?c2VpbzhNbmdTY21KeUNTZ2dIeGc5N1dDVVlPVmRpQUZnb3RtajdGMWFTa0tC?=
 =?utf-8?B?ZXVSTnhqQkQvZjlKSVcyOG5icFVPRTBqcC8vQ2lNZHpReGtKa0RmNy9CL01K?=
 =?utf-8?B?dWowRm5WajUzVDRnRXNKTHgwWGlldlk3VTNLY1k1OWVNRXFzVWJKQTJnMWl1?=
 =?utf-8?B?dmRwRUZlZ2FOMFVjblJlMVNNTm1wQllRb2o0Wnd3UzVwU2hMTzd0UHZQSFFF?=
 =?utf-8?B?Wi9tSThtZHJFWHg5L2pXNUk3Z05BeEdJNWRHK1VOV3NzMjVjVFNTbjB4RWVW?=
 =?utf-8?B?cEYwbWwzSFZmS2ZhL1REdkxMWWVnT2dPRm1LcFl6M2FsVmdzSDc0cGlsOVRl?=
 =?utf-8?B?dFFTSG82MkE3bkQrMHExY1NhTzc5ZjdaeFpFMGJKQVZpZkZFeVh3NWhHaEFL?=
 =?utf-8?B?aWxYczUwTFN6L3F1T0RWa2RKeXhPUW0vdXFBM0h4R1Z5RVNsaU95ek1jemlu?=
 =?utf-8?B?ZnhmV2NKaGJLSU56Y1hLOUJzR1B2Z1lFaDNkc2kwTS9mbzBCaVlXZnJlK2lH?=
 =?utf-8?B?aURUTkNMa3BHbERmb3lRTWEzOHFKU2kzY2RqVUd1dit1cXNsaUh4QkUrNVE5?=
 =?utf-8?B?QkpsbWlHWkxyTS9vQWt0b0ZseURDUzM0NTZ1ZDBsZTBsTnlyVVRlMnFERHd3?=
 =?utf-8?B?ZFNtZjU0eWk4djV4eVZtUnl5UlNncUtrN2hRbVZ5RytZREg0WFNTckZHbVhO?=
 =?utf-8?B?WFIvU21XcnBrYm40UWkreWtubUxlS0MzNGNtNHVmSnI4SFJaNkJYYzdVdUZL?=
 =?utf-8?B?NTNnY2JrNVBSaW9uN05xSzBmdnk2OTVZMWFneGtlY1dlandnQjl6VmZVRHhM?=
 =?utf-8?B?L0ZWWlVGYzkzZm96YXdWQjI4OGNFOE9hUjZscXFtc3dWSjNnLzFGVDBKdTJx?=
 =?utf-8?B?VERXbjYwTVEzcFYrZTNpN1h5T3VRQ2V3NTE3eTRVRlNEUmZMQUliQ0dRWlFE?=
 =?utf-8?B?S0RETnJNam0zUG5HZk5pUHFlMGhhUlo1OEFDYy9ST2RIWUM0bndza0puS2JM?=
 =?utf-8?B?TUw1N3pRRHhkY24rZWtya2p6SmZCeFg2Rk9sYzVpM3l5eWs3WjJqeHJXUE52?=
 =?utf-8?Q?DIM2i05v0/oVTFQGWn52WGJd9?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccae0119-162f-4b63-e858-08dad3a87d42
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 14:29:43.6943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8TevRM5OraPzW6TX8f6IQrnCdcDguYv4y3tH2yok/po8osPoHQx2xLnjd2CXq2pmat4c2BRt0+AgRjMm9AuNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0401MB3564
X-Proofpoint-ORIG-GUID: eg2idE3idSu2RYvcXWz-cjySJ1bNkVRZ
X-Proofpoint-GUID: eg2idE3idSu2RYvcXWz-cjySJ1bNkVRZ
Subject: Re: Re: [oe][meta-gnome][PATCH 3/3] gvfs: use native ssh client
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010104
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 14:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99893

On 12/1/22 07:59, Mikko Rapeli wrote:
> Hi,
>
> On Thu, Dec 01, 2022 at 07:41:48AM -0600, Alex Stewart wrote:
>> When the `sftp` option is enabled in gvfs, meson tries to find a valid
>> `ssh` binary in the build host's PATH during do_configure. If a -native
>> implementation is not found, meson will try to satisfy the binary using
>> the build machine's hosttools directly - which is generally undesirable.
>>
>> DEPEND on openssh-native, so that an ssh client implementation is always
>> in the PATH during configuration.
> This sounds wrong. Why doesn't meson look into the sysroot and add the
> dependency to target "openssh" (or "virtual/ssh-client")?
>
> If the path to the binary will be hard coded, then that needs to be
> fixed to be the path in expected target system rootfs.

I guessed it might have something to do with `ssh` not being defined 
within this `meson.cross` binaries list (or maybe the .native version) 
[1]. I tried adding it, along with a DEPENDS on openssh, but that didn't 
seem to work either.

I'm not very familiar with meson configurations. If you have some 
guidance on a better design, I'd be happy to give it a shot.

[1] 
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/meson.bbclass#n65

>
> Cheers,
>
> -Mikko
>
>> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
>> ---
>>   meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
>> index 4c251d2f4..9e29afd48 100644
>> --- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
>> +++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb
>> @@ -12,6 +12,7 @@ DEPENDS += "\
>>       gsettings-desktop-schemas \
>>       libgudev \
>>       libsecret \
>> +    openssh-native \
>>       shadow-native \
>>   "
>>   
>> -- 
>> 2.38.1
>>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


