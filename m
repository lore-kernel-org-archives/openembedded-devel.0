Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA34FC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 20:45:46 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.56794.1669927544068119909
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 12:45:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=YOTwZnu9;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1JUZHe023876;
	Thu, 1 Dec 2022 14:45:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=2BW/rjN9WqB/SPaHM8G+pSAyFST68nRV62CN1vhTwMU=;
 b=YOTwZnu9P4BhXRPapkV6JISUvuZze8L661H7qbbmxJAnHDvKCPandTKuYXrQ+GadPmTw
 d0wV02fFUgVReoKxoU0m27xblLIcy1c85BWlsMLT0xPtny90WmORFBY8yoNfTgBUM7i/
 P6y3xcY9+naMjQGkTcnpjkFlyTnALQYR9lKBQLNggTaxVy7n7RZL5CPoqHMIlSvgBTxB
 twflHL/yfE4bMVFW7EZ/6/6OQ91aiGPaPjGZtSnEBwDVJBDgdq8bjBNYCVYc9SkbWHrg
 paiVx5/82j+hat3p+sz1i5YgfMoOSAanXBCmGpRWBrCheq+qU9F03KDtBhp9cym7lY3D og== 
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3m6k371vyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 14:45:41 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TssFFE/WjY9Ji1oTYNYeWQ3oZNjczKelDH6iG/5ao9vxvD47mIguub5B0I2vRtNyDj0u7OEVEylndUUcigJCc2+iyE4qWBkD1hMu8imRSozbv3IiYUAuUGYsvtZlWMXiEp2I8m/lysXZeuz/O9Mqbgj+eaETJsWiR9FtpNFVvOoZ/nvtd/40srwUFpoYu5K8oLXqLnduseCu9CnsVf7iEOkc64Qno1MlQf8mHMJYUiUyzjYh36lMv5al6NGByx4KfGe5ObnThaUvHbHHjrqMxo2hMX/NUSvO7ul1T6SeVcb4R6oqeZNg/xiqOVQjyz1t818d7R3qfzrfXfmKi3/wvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BW/rjN9WqB/SPaHM8G+pSAyFST68nRV62CN1vhTwMU=;
 b=FGldxxX7SYcUcVeLZSH8GH6cHCRdQIHdOjjlbBOSd+sI+iHv5pTdv+GnYWDFJodpgDfBy/ylnf3M9CEXuW+9lYPGOFVJOjD2JbshgknK+P/ELMssL+Mv/YMbiSoV93ZQp7PcKpjQyILtF+ABaN1aWKE3d11vMAaoHu59FWs5laWExmaUgwgewcwU05/swzwVMXbRLnUEBzR40hMce5hQRhNWM7LpAvXxkgxUjehsLZzpYDtwkA+iCp0tE+vBTBLtGkqctRDf0mrm2MilvodOGSN/OsUpJTVmSEwQ8CLrdQL8JnSCxM18I9NPTN+/nHNmtPf1A4s43F2p0zuR5oljhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BW/rjN9WqB/SPaHM8G+pSAyFST68nRV62CN1vhTwMU=;
 b=HpZUUtNrlZITCtOzOGopxg8i8EN0rQ331VLMMNgWKaVFnbkKZt6TFm/9WRVEP7RKv3uAtKjtOG2fh0YETi+2KW7ThP3IiIv3CmKA9njSXJTdeRkLqA9SIvFfxazQYMypUlJ5WzWHXms4/XQWCnWirjklsYOVyKB6Q1cmvZOdXAE=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by BY5PR04MB6389.namprd04.prod.outlook.com (2603:10b6:a03:1eb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Thu, 1 Dec
 2022 20:45:37 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 20:45:37 +0000
Message-ID: <4aadbe36-b9a4-32ab-e2df-a31ec1ac341c@ni.com>
Date: Thu, 1 Dec 2022 14:45:32 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [oe][meta-gnome][PATCH 0/3] gvfs: use native ssh client
Content-Language: en-US
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com, Mikko Rapeli <mikko.rapeli@linaro.org>
References: <20221201134148.116754-1-alex.stewart@ni.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <20221201134148.116754-1-alex.stewart@ni.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0046.namprd12.prod.outlook.com
 (2603:10b6:802:20::17) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|BY5PR04MB6389:EE_
X-MS-Office365-Filtering-Correlation-Id: 20f70466-3d8a-4726-9429-08dad3dd0059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6nvzMv7YhGZzhopQepStuaJflUjVIKM/ntBteJoTx1XPp36vUcH5XnzTnkewokQiURaPta/SiWFiIPGV/VQJu33VmC1HKG5hooO7ak5ebwpnyx5c0Lf7Ary/KFKgdW1Vxpgv8b6Hu3V2RjvvrEX6tu2L41WKcgfTgmNzvZ5pTnMZLXLYnrV0ljzDVgyrU/CpFmqQsMCxMKFIpZ3CSEzQELDJ+8HPOeRY7iSqRVvqME2nhVATCiHgPhWOUHvwnAV5TLpMaB7qLvWYF5Y0dGjs6aswT9cq8SOuEp2a1RpMJRrm5ksODQs+VXx2pjshxZ741aB+H7+ZKxe0aN4/7VfZdjP7e9AL90V+CdGXhrJybCTrogP4KVakw4MF844RRSXaosfpY4p+6p0xHytmqYWCnVTBsfIfDZ6fLp6eRvw6DaSB2qYrpBvaxXA7RIXUhnJQKqunT3Tdfr190NQbUh3jzOHMJ+8Wyec922S7R5j0Z8TnZSiHJJ6nlAI8W+7L8qreK4JX12NnFLN7H1WpXEO68VCvXjzSFUlsTNyVGW5Bq5KaheF/wXTHD5iPIDT02sO4oDBx+JL9bQeyN5hK0IxY1ogAf1mevmLsPSbPdc3D6KPOpE7Xr/itpR71D6ciCi1w2xWz9Nj8bPrH74EHT0akFQ+9FFYmockz2eF60TJasG3Aog+EHjWsEJTyDN6KD1ldrFy5G/grKHtoLqcYdoq6TVCegDOUXPdd4u12UZmBYxr8a4Lgp60caqC487ALP/YF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(396003)(39860400002)(346002)(366004)(136003)(451199015)(36916002)(6666004)(8936002)(4326008)(478600001)(66476007)(36756003)(5660300002)(8676002)(6916009)(66946007)(66556008)(83380400001)(38100700002)(2616005)(53546011)(31696002)(6512007)(966005)(86362001)(26005)(316002)(6506007)(186003)(6486002)(2906002)(41300700001)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SHNSejRqaU5yemFsR0RFbTBVd3NaZTJXZUVIdjZ5SFAzMXVpRUd6V3J0YkNu?=
 =?utf-8?B?NGRva3VpRnd3RTFYdTVJclg5K09uRDNxQmhZUTcxTjUySlZEMmptbTZvRVJt?=
 =?utf-8?B?dGlxQ2FmSmZKd0pvaEpsSHp2eVNPVUxVQTI0TWhuNWRDMnlNaFJXdlFta1NR?=
 =?utf-8?B?SjRUVTlsUFZLNmRUUE1nQnJmd3hGOWxDbnAwSGpSbWNSQkpzc0JmVS85WkFP?=
 =?utf-8?B?Q1h1L0FVVm51WXluYmg4ams3YWZVbTJHeDkvNHFhQ09MOTk3OTBJUGYyWlRy?=
 =?utf-8?B?aDZ6K2QwVERFMWx5bjEzVyszWHpJQlJ4bGV6K0lHbXpsZkhxTkJTWEZ0ZThv?=
 =?utf-8?B?UWlFZmtVNjB0RzFNZnI4QXBwNkxGWHIwYUpadnNWaHA3OGVWVXZOMEJ2SEU3?=
 =?utf-8?B?QisyMkc1OUFpUWo0SmRXV3RpVm5yQ1JLTDZkWkUxYTZjcG5zbG9XeDdoQzBT?=
 =?utf-8?B?MkJ1UHZ6V3NCN3luc1RNRjUzYW9icVVCTWVvZFE3eVd3OVM4eW5oMGJXdVdO?=
 =?utf-8?B?RllBaEpvaVZjZW1seG9rdS9IUE5ERXN6NFBINUFjM01RSTBNdWRBZDZHYVhl?=
 =?utf-8?B?dXJTZmdlRkUwT2YyR3dQZEw2TTNXeHRVMkM1MHlrZ1hjbzc3eWRaZ3Vab1I2?=
 =?utf-8?B?QkFkNXRKYWcwMVN1bFlnNERobUlnSVcvNXdkOHZ1ZmlYaS9sR1lyc05yTW8y?=
 =?utf-8?B?UHNMcisyb1VHLzduSktFTjF2VktHRzJMQjVsT2xlWkhWaVdyTUtaSnBOZExY?=
 =?utf-8?B?ci8vYmFvaENWOWJHTkxacmg3SVFUaXBuQW9yLzljZGNwUytVL0prVmg1anpp?=
 =?utf-8?B?WmlYNk8rL3grNkJWbTJhSElPYkhEemNvVHFvV29OUE80UVBxWmllVXhmUERX?=
 =?utf-8?B?bndnQmxFU2dQZFRPRVFIUVR2aFNCWTZxT2JjNTVxSElDZW9HOTJlcnJzYkxL?=
 =?utf-8?B?ZzhDM1RadUhjTnNOY293NHRWQVk1WHRMNUVTd2w2WTErUUpLT2VPdTZ5bzB5?=
 =?utf-8?B?V3BzK3VJbVQ4OHhwVXR5WjZVZ0JXb2FIV0c5OTZ4RGFRT0FMM2ZpTWF1UStS?=
 =?utf-8?B?NWVmdkR6VW44VzUrWUNqYzd6Nm4xbDcvK2M4YThCM3ZMK2JVRlNSS29yM1ZX?=
 =?utf-8?B?ekVPWE9DR0lRZDN6U1J5MXR6VkFJTWdiK0xEVWRPbWI0ZkJaaWZpZ1Z4NU5N?=
 =?utf-8?B?bFVNYTNuWG9LSE1WZ0laOTNBSUQ4YzkzMCsyd3BPSENwYzNpQ0syVS90OW1Q?=
 =?utf-8?B?eUFieHJZSzlMc1p6OTU2dUxxVTdLMjNUa0x2a0hqdUtEQWdMMUtWc0Nvc2Q3?=
 =?utf-8?B?NVhJRFViUWkxblowUzRvdUZpeTRpanRWMWVtOTNacExaY2hLV09XbUhmd3l0?=
 =?utf-8?B?ejBtTzJMUng2YlZUWGhXT3hUQjJMQkYzejJrdnZEdnQwOTN4NUtkWm16UVVS?=
 =?utf-8?B?MmRrOUx1TGd1MkMrZlBiT2toUXF2QTFsT2lrZGtWVFgxVjg5TUgxcCtwY0NR?=
 =?utf-8?B?TEFkaDVPNDVpMkt2TzN3aVFkU1FFNC9WekRJMkJxVXhocFZoMnpxbktLWURo?=
 =?utf-8?B?WGJNSUpNMjNkaTdXejdaUytUc1pjT2JJSXh5UWdzd3NNZnYxdlhsNW1GMmFJ?=
 =?utf-8?B?NWxPczB4RGdkTGFOdlIxZTF0dzBHdVBGRm1aS05TQWpCekhoS1VzUWlpcGxP?=
 =?utf-8?B?dkNKWVIvaHdsbzJ6dzZYZkhPQ0diczYwcGtSdU50THhaa3RXL0p0UndTQXlU?=
 =?utf-8?B?dEhKMk5OZ3VLMTB2OWRoMGcyak5lU0hYTndDMmU2WWVrKy85MEt4SG54RExJ?=
 =?utf-8?B?TkhoYjdVVjJISXlhMkN4ajBJK0hZREgvNFNiVzUxaDdnMFFWZ09Lek84ZmVs?=
 =?utf-8?B?OHRuMW9ERnYxdDBGbFF2UE5uT000TzVsdExUL2dORlUwc280bHB2SFpQT1VJ?=
 =?utf-8?B?TE1FYVJFWGdhZjliOUEzK3RiZWU1TDlMaTdnRUlxQ2xLOUlYZ1A0cmJ6Zysz?=
 =?utf-8?B?ejRPU1B1cHpJUDFHa2ZjbDQ3QUU4ejltUGFrNW8vT3dMNDFkM1hOK05UVElP?=
 =?utf-8?B?Z2FLcGlLeDByYlBxdkNHaE5JTVU2UXhGNTdCTTVoWE5hNmdaaXlKcmNVdzRJ?=
 =?utf-8?Q?p3pF5N/a+oXWmQYfHLXjSu2I/?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f70466-3d8a-4726-9429-08dad3dd0059
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 20:45:37.4543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0X4Chrf5gYUjQtr9jpNf93uLZejyR4Ko6W2QG3is3SGwUd7a9QO0pTuQhO+Y1avFPUf7GfYi2KbLZF7xzEPIxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6389
X-Proofpoint-GUID: CNK4nKa4_KJ7ru3dWXIaBLOEfejllLjf
X-Proofpoint-ORIG-GUID: CNK4nKa4_KJ7ru3dWXIaBLOEfejllLjf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_14,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 suspectscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212010159
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 20:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99905

I'm revoking this PR for the moment, in favor of pursuing an upstream 
solution.


While doing some more investigation based on the commentary that Mikko 
and I were having in the thread, I discovered more detail about how gvfs 
is using the ssh binary.

As this open gvfs issue [1] points out, meson is configured to find the 
`ssh` binary in the build host's PATH and to then write that path-string 
directly into the `args[0]` for the sftp backend. And that's *all* that 
the ssh binary is used for at build time.

That's obviously dangerous - as the issue points out - for the 
cross-compile case, where you cannot assume that the ssh binary path is 
the same between the build host and the target distro. But it also means 
that using a sysroot-native ssh binary is equally as insane, since its 
path is also different from the final target image. So neither the 
existing implementation, nor this PR, would provide you with a working 
gvfs-sftp implementation.


The proper solution is probably to change the gvfs-sftp backend upstream 
to use PATH resolution at runtime to find the ssh binary. Though I don't 
actually use gvfs-sftp in my use-case, I'll attempt to try and upstream 
a fix.

The other alternative I see is to disable the gvfs-sftp subpackages from 
building in OE entirely - which seems undesirable for those users who 
are depending on it.


[1] https://gitlab.gnome.org/GNOME/gvfs/-/issues/465

On 12/1/22 07:41, Alex Stewart wrote:
> While rebasing the NI LinuxRT distro to kirkstone, I noticed that my
> pyrex container fails gvfs:do_configure with a meson error about not
> finding an `ssh` client.
>
> | Program ssh found: NO
> |
> | ../gvfs-1.50.0/meson.build:462:2: ERROR: Assert failed: SFTP backend requested but a ssh client is required
>
>
> After some investigation, it seems that gvfs is configured to use the
> `ssh` client implementation in the build machine's PATH. If no native
> implementation is provided in the native sysroot, it will default to
> using the host machine's implementation.
>
> My new kirkstone pyrex container happened to not install an ssh client,
> and so would fail. Since ssh isn't a requirement to run BB or OE, I
> don't think it's appropriate to use the host's ssh.
>
>
> This patchset adds the native bbclass to openssh, when the user includes
> meta-oe in his layerstack, and then provides the openssh-native content
> to gvfs through its DEPENDS. This is sufficient to resolve the error on
> my kirkstone pyrex container.
>
>
> NOTE: It's a little odd to me that the OE-core openssh recipe doesn't
> already inherit native.bbclass - when it *does* inherit
> nativesdk.bbclass. I would be open to moving the openssh changes in this
> PR to OE-core directly, if someone can ACK that it would be more
> appropriate to do so.
>
> Alex Stewart (3):
>    openssh: add native BBCLASSEXTEND
>    gvfs: stylize DEPENDS
>    gvfs: use native ssh client
>
>   .../recipes-connectivity/openssh/openssh_%.bbappend  |  2 ++
>   meta-gnome/recipes-gnome/gvfs/gvfs_1.50.2.bb         | 12 ++++++++++--
>   2 files changed, 12 insertions(+), 2 deletions(-)
>   create mode 100644 meta-gnome/recipes-connectivity/openssh/openssh_%.bbappend
>

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


