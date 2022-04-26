Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3865DC433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 13:52:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.6773.1650981167494078885
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=s2ZjxOwk;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=11153fc67e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 23QDd2QP014505
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:52:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=EwLfc29+g4m+JsIKMMRkvkf86PqNMWnysEoZOC2BdC8=;
 b=s2ZjxOwk0EmkeavJ5TFnHLpvxJpYn65HpLdkr4wjnAkbbBruoYDI1CC6vv66uIUXNjl2
 pQONysnhfcryi4tMZivz9B/VDi3oh02f6hUWYnepVyUXXhmwBdo0J/RHp4VS9v7HoUTu
 zStLDAmPrDdcmz6usxiAPTsAxYbJCKv8wXC9rAlKqpH6NX6kOIkSJPiEHMSejCCpyHp8
 0MbLbg1gtT5oObhFG5DbMPUxigar/HVxKiljs3RyMfyP+UR93bouDLEHRMEQDiua7iPw
 vCcrtUpPq7ya7vLlA431TXXfP9qgJ4upCWPENil551rPnFaRJ2dE+kPmxExcZOm75FTN yA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4aar5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:52:45 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23QDqjxv002815
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Apr 2022 06:52:45 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fmcr4aar3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Apr 2022 06:52:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IT773vS5Oah9rmZsyIAm4J1WyNWS8jPoasfEXbgr8S617It2byaxeopMrS+TX3ecnj4IbNVlyBIeWwH1UlQGZOExlgozCU9OGytuMSv7TbztSrBxYW/WR5zI2/X2t6bWi2Lu83ikp0mdZ2NoQpwFDSWgnmNnCISFGcDjSikZnsg33y0PzCLV8S4rzOzyvoxAmfN8q/KMm5Yy4k3HvKoAiV8SIsy56PFCOz+SII2f2el7C6YIM7k5v8SdparDbj95UWHtE0wvVRcllQ+ZMIKzdF0dDeu6MGC+vxOg+YNzD+T07jJfLE7zP2PV/xKimt78nS6+jS93jj9s+j/qxe3dRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwLfc29+g4m+JsIKMMRkvkf86PqNMWnysEoZOC2BdC8=;
 b=FGvpNSjZCLsw/8zwxzx2VnRUUwMSoRWH6frkO2JsmX5629uRxPeHUKVdM1SqGR1cBoMDjXavUVuPkqBDHNWt6pP/B3Y3jgRkaDXK8nY+xMqDmMuwkxDWPnL7Difh9Z4myDUkVlVrZPn35jXx15ccb+ZjnfWzvfMHsuuwqVOZStSvXLZzQkEKpV8T1oSWDmthbCusXPUwgk/tVxTXSvmKp91opLTE7o/QP+GPsMcRu2NbiLRWnjwuqBG4Ywsy4lmXg3efYKc04ahoyGbTzjv72kWvdIpXg5iPxXTPYdXtHyKV+w6+IDCdr6JrS8NDMbJizpXeE3P2T9iznqc2r5z8UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by BYAPR11MB2694.namprd11.prod.outlook.com (2603:10b6:a02:c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Tue, 26 Apr
 2022 13:52:42 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::5424:a286:7b98:903%4]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 13:52:41 +0000
Message-ID: <7197c511-5b80-7682-1c4f-8817f1abccd5@windriver.com>
Date: Tue, 26 Apr 2022 21:52:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-networking][PATCH] frr: add PACKAGECONFIG for fpm
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220425063030.814264-1-yi.zhao@windriver.com>
 <CAMKF1spsLvzBJQrvmVZX3ZKK9a8=-UpcVm54AEqM-PHRgqm-FA@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: 
 <CAMKF1spsLvzBJQrvmVZX3ZKK9a8=-UpcVm54AEqM-PHRgqm-FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR02CA0170.apcprd02.prod.outlook.com
 (2603:1096:201:1f::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a74a5ff-be11-4826-23b0-08da278c0830
X-MS-TrafficTypeDiagnostic: BYAPR11MB2694:EE_
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2694AC39BFC6FC473A1BFFD7F9FB9@BYAPR11MB2694.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YIQ4/HL+Ucy/1LURuy6bxqQoThq1Hx14B7D+ecU1XqtmtLzauaZDIeODlGA28OktwBqMTmd0ITo3EBSc6YZYOv6ZdQ3Q1LuSzSSculzVZcM3jPAmM/HioUFQK5uuJi5OW9QcRP+kmbRUFFF85HRD4x4N70VE65/bfjBCjF+5D3bcCN65kCHmNhhOPcup+xeHGKSBqE23tmy45OJlfe/oz2IhWZ1d5BkV0IPCtOtjZ2orWHzHrIJrjy7lz6R7bCevAtfi37dNX2k20FGeYzeMl/uUm+vhRxFFWxowk1BThNIaE06VBzwOOaUNDZpmIMa6Cqt5Zskn5YOTGyG5IxQwiO3ov40uZyKU+Wko3M9BIBkFqDfL+IVAZQd36XmyDkmSMzaPLNwEFG7WdoIHkSxu8meXJ4+0o9FQYg6gHgY3rw+drEkyd9FHcmqu7BYGpapmAcSZpMPUhvdDGakeTPqs+bjDaaHlYYBaUrLkAnCYj5Ll8b3dktkVEq82HXfUzvWHuGdMo1/KZZv0l5ljjI3/ieWkXeNNpjMaktVwcsovRDMLWBuy+HD4kd8VBAKV3E4By28CQr+srkr5shkjLvlFu4mbH4DlxAeCdDIasunc+XBBLf1YoH/+kCo045p3av2iA0dIhNXhAK1KFAw/Yc00OiI/smUfecyEUNie5i9af44Z2q1IbZbky6ZCCUNfwrfSgM4h4/ztVrj6ydHKjMgdHh77XawIZI9gGx7u+1mSOShw8nHKWoFT1O/dOVQM6s64q62th2U0ZB2aRpQ9Wr6I/YRb6peOz/sORWjcK25rQYs6wW3tb1yUCOwr3C6BTNJF4Lo7R4t09RZPZyTX+ScWF93i2z3GOpZfE44+kIqn6q7KLWb3ZBdg8VjJYPrPwuKW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(8676002)(66556008)(186003)(66476007)(4326008)(5660300002)(66946007)(38100700002)(36756003)(38350700002)(31696002)(26005)(6506007)(6512007)(6666004)(52116002)(53546011)(6916009)(316002)(86362001)(2616005)(966005)(6486002)(2906002)(31686004)(83380400001)(508600001)(44832011)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MlNqbEdSSGdpU3U4aGtTTFhjUnBicUxJUDlBdVc0clBSYXBQKzZ1UTFweTVi?=
 =?utf-8?B?Vk9waXJtOWd5ODZCV1Ntc2pTS1MvY0RiMHZwQ3hEOGlzYkJ5SDExbmV5c3Jt?=
 =?utf-8?B?SjNBNFBHbjFGMmVYLzVlamM0MndPckZZRUh2bWFCQmZia1FiUDQ5T3lkWnRL?=
 =?utf-8?B?MG9vSG85d2IrencyeU9uSkdPT1c2cTlSQnBOTUFPdytlN3lNZFdva3M2SEds?=
 =?utf-8?B?eVRwYVhncDJLRmUrVU5SRytDaHpXaTl5QXNDZnN4dk9QUGpRZnAvSWc0RkI4?=
 =?utf-8?B?Qi8xckFEV1VyZVIrb0ZSaGFObjJSY3BpUkVkSVhDZHlDQjRTTWJPNEU1YmNE?=
 =?utf-8?B?VEtSMjhMWlQ5QnUrWjNpVXBsREs4L0xFVkluZmc2SFlGQklLM295cmRwb0lr?=
 =?utf-8?B?UUlTMnBxbkZjVW1GdGFRRjV2L2NBRnFtNi96ajhaZ1ZlTXBSSXk5UU05Tk1j?=
 =?utf-8?B?emwwcDVIMDFZWmxDbk1CRXVXd2lWY1E0STNCaDJKMm1QcnNtbjR4L3AvSW1N?=
 =?utf-8?B?c2lqakN2VDFtYjF3RVF5b0QwQjdnV1IrVjI5TGEzQ0RnTmJRcmFvRE5ITlh2?=
 =?utf-8?B?RmpiL2tBMFoyekduL3pwLzV6ZEhwUitpR2RzOUMxcVErd01NQTI2QkRTb1dm?=
 =?utf-8?B?T0ZtOHpHclJkd201WjBZdUU4K295ZWY1bkNCckVibkU0V1FFYjdxNGtwYnoy?=
 =?utf-8?B?dHl3VVY3Z3lWL1E0aDF0M1NHamhhSWVvbG5JbFdvVldmajJsaW0zeWcxeWRx?=
 =?utf-8?B?T0pxQUtEY3J0QUpZTm1ReFNmeVZyRDg4ZHRiemFsam5qSVJiK3ZRYmIrelo2?=
 =?utf-8?B?WER2M1BXUncwY0tWL2hFTjJaYXRSdEFCb1ZpQlFMdVBLVE9BRFRzVmY5WHEy?=
 =?utf-8?B?TUtGdlk1WkdUdDJGU05GNlRBY0lTREZnOTFFczZUMWwvZlBBdFBoNDhWRjBK?=
 =?utf-8?B?QTk5UFlTMUd6ZHllZ1A3b0EzR1hHNWNYWnNrTDNVZlNrR29LbXRwVHdvQzY1?=
 =?utf-8?B?S1NTUXB4YVpQTWYrVTNjaUIxVHlzNWg1RnJkOUJCN3RlWTVleUtBaE42aDFB?=
 =?utf-8?B?VlpLVG9vWWJBb0xLZkFPUjdKamVVRVZLYlN5TDJJVkk0N2c0QW1oRGdIMUNO?=
 =?utf-8?B?NXZzaW9rNnJNZGlqTVgvN0RXU2pWYTdOUElGaXh5aUVmZ1AzN2dRYkV4Z2R5?=
 =?utf-8?B?U0g0Q3hod2RHSFc0R0M1dHF2T2dUZmdxd01jQ2VvT2VXaFVMQkZPQ2FQN0RU?=
 =?utf-8?B?dGttdmF2Y2h1VXZ5MjBVaHBMS2Z2VGFxK2JHMEVYbmUwWDM0a3lXUmJrS1NY?=
 =?utf-8?B?dmRxdUJVOTZrdk1hSnlMRjdjb1dwRkl0QkxMYXhCRitHTzFyVkJCcmw4WUJV?=
 =?utf-8?B?UXQyakpMVGx4RHdiZ0tOaC9ZMCttSURqNFN0UW9JU05JZGxxUk40UkZwZHZP?=
 =?utf-8?B?YXJMZzJSVTRTaVRqWHlIREhOWXptd282NjAvTDFITk1CbXBQSXVlckV5VUVY?=
 =?utf-8?B?YXVobFU0US91dkJ3c1IwMklydW1GSkhFVWg5eFVhQlVhUkhGVno5Z2dqaG9v?=
 =?utf-8?B?ZTY1WHpTcE1ELzIrZ1cxcitCN0d2enhzUGVyQUc1a3VFMXpuM1plTmFjcGhr?=
 =?utf-8?B?d2JCT2F3dlNIUGk4Y1l0eVgySDFQYWFLQmdqSklEbWdNc0tOMzlhcnF0d3Vj?=
 =?utf-8?B?QkpGOGlNdmFSek0wcDN5dGd5bWh2ZFVMTzZYQ3B6dktxNE1SQ0sxelZQc2ZF?=
 =?utf-8?B?MWlUbEVGakhCZjJweFFsYkZBMlBVL0pIRG5IclEyWDVNc21jR0lVclc3eFFn?=
 =?utf-8?B?d0oxSlpscjhWcm55T2JTMUtxMlNyNElOOEh5VkpXdGs4bVVYMWJOTnR2amky?=
 =?utf-8?B?RUFzK2ZGNmtlZ3Vod2VaeG9ia0RycERGTE5PS0I2dmZVTTc0UDNTUnFwd0xZ?=
 =?utf-8?B?cGZGeGhkcnhkWUJzK0NYZ1dCR2dpdjBuZ0N5eml2cFRkZzRLeGZpa3Znb1Y5?=
 =?utf-8?B?czZYKzJJRmdpUUlqVWZzQnJZK0FYTkhQb1I1SHdabDNxU2Z3MmRRZnl0TTJI?=
 =?utf-8?B?RWpZd0VmMEFEaGI3SEljM0d2UVZuSzJSWGtwTHNsMFErYUFZbFkrbUdrcE9D?=
 =?utf-8?B?TDBHd0Q3ZWtBdG50TkZydXFPMk9RS2Y0c0Z5ajZWa3FybkVCdkJsRExvWG5P?=
 =?utf-8?B?RHdYek5iVDdGSTUxVGdabFJRTVlyMW16UmcwcjZXSHN3QmxrSndXR0JZMlNw?=
 =?utf-8?B?OVhFcnBIV3RSTkg4NkNxYzU0TW1INitHSWdHTkZCSmZXakJ6YnNybExScTVl?=
 =?utf-8?B?Z2ZqTXduTXhneStLRktrVmNmSDI3YVA3ZTEyY29PdE1mbHdFbFI1UT09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a74a5ff-be11-4826-23b0-08da278c0830
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 13:52:41.8499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 W4NFXw5PxHVlARcvJrlJ6oO/7/4sq3rOUqWfOJrBcjkSCQCTLcoey2u96tMb19ri5Qga4CRp0bmfOB41uafk5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2694
X-Proofpoint-GUID: Z1knJv7WA9LN07jXCIkioZJ6QDwVyp1-
X-Proofpoint-ORIG-GUID: ddsXc8vRoiOdVMjFzmmCMsLYdqL9bv1B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-26_04,2022-04-26_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 malwarescore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204260088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Apr 2022 13:52:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96802


On 4/26/22 14:18, Khem Raj wrote:
> I am seeing
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1681
>
> This could be an intermittent failure due to build time race or
> related to this change perhaps, I have seen this before too. Can you
> look into it ?


OK. I will look into it. Thanks.


//Yi


>
> On Sun, Apr 24, 2022 at 11:30 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>> The Forwarding Plane Manager support is optional, make it as
>> PACKAGECONFIG.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   meta-networking/recipes-protocols/frr/frr/frr.pam  | 2 +-
>>   meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-protocols/frr/frr/frr.pam b/meta-networking/recipes-protocols/frr/frr/frr.pam
>> index 3541a975a..83c403c2b 100644
>> --- a/meta-networking/recipes-protocols/frr/frr/frr.pam
>> +++ b/meta-networking/recipes-protocols/frr/frr/frr.pam
>> @@ -1,5 +1,5 @@
>>   #
>> -# The PAM configuration file for the quagga `vtysh' service
>> +# The PAM configuration file for the frr `vtysh' service
>>   #
>>
>>   # This allows root to change user infomation without being
>> diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
>> index 91e306f08..b6e180e2c 100644
>> --- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
>> +++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
>> @@ -36,6 +36,7 @@ RDEPENDS:${PN}:class-target = "iproute2 python3-core bash"
>>   PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
>>   PACKAGECONFIG:class-native = ""
>>
>> +PACKAGECONFIG[fpm] = "--enable-fpm,--disable-fpm"
>>   PACKAGECONFIG[pam] = "--with-libpam,--without-libpam,libpam"
>>   PACKAGECONFIG[grpc] = "--enable-grpc,--disable-grpc,grpc-native grpc"
>>   PACKAGECONFIG[snmp] = "--enable-snmp,--disable-snmp,net-snmp"
>> @@ -52,7 +53,6 @@ EXTRA_OECONF:class-target = "--sbindir=${libdir}/frr \
>>                                --sysconfdir=${sysconfdir}/frr \
>>                                --localstatedir=${localstatedir}/run/frr \
>>                                --enable-vtysh \
>> -                             --enable-fpm \
>>                                --enable-multipath=64 \
>>                                --enable-user=frr \
>>                                --enable-group=frr \
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96760): https://lists.openembedded.org/g/openembedded-devel/message/96760
>> Mute This Topic: https://lists.openembedded.org/mt/90679546/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

