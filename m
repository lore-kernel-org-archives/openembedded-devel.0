Return-Path: <alex.stewart@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54760C47088
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 14:20:52 +0000 (UTC)
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.156.75])
 by mx.groups.io with SMTP id smtpd.web11.44674.1669904451560242478
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Dec 2022 06:20:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=EeaMuHuF;
 spf=pass (domain: ni.com, ip: 148.163.156.75, mailfrom: prvs=93349a59e9=alex.stewart@ni.com)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B1BtWxx029617;
	Thu, 1 Dec 2022 08:20:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=message-id : date : to :
 cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version : subject; s=PPS11062020;
 bh=yMTCnPgxUNjwKwVimK7UazCrJl9KCZ/mTrjgGhxvkGQ=;
 b=EeaMuHuFMbn/UCjMY0ndM6fZZPbcgPgCu1Ryzg/sqM3wmboAEQTKgmDnfrvrU1moyN38
 TytKZikest2GkNc5rW2Z/7TPzh1NpDsajRyScL9IRqiQWRnWkUWxTWHixPo03Q9Wa+Zd
 Bbhmyu9JUN1szPitlO/V0g00Ls1J3gc06rVUMy58j+ZaATx2VeMnCx/dec9yhJpUy3rz
 54iSGmss9oUJtHLU8NE9nAt1fAHjpqy4hd4vJvgVIvlofTIIMP/PcfCLUD3FtJwifeBi
 n5uNwO3F2AwBHO6sSuo5vBC2DyetFEWtRK8JzZtXxtMtjxUkRGeR9iWYAAMiICRCLc2W xw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by mx0a-00010702.pphosted.com (PPS) with ESMTPS id 3m6k50s531-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Dec 2022 08:20:49 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lRQoMubpETe2szvXwvShigD+kjpKlqFnZfWNk2ZC4l1zibR87gQpJlj3TEFLT2HRFR9+k8n55xuIxRe2CsGEtmixitQYGoxXuvQ2IKunYnku2XFBrMt6UsGBr/dCrYy3Clalt6NTYn6W+vMD8HxaSrqCvw8LckN4p8GU5KD3WtJyD+T1PxmBqIEthjddc/JSTrSfK8oR4AronG3imxTBBGA/xg+tSbngNrdxaLFPn59SDZEfciJGKEl1z/KohcyYsOEWAxAhDwU+xTHM/tygqyrZTHsHxu4KwClaw6crJm6RQBIjX95TVEgQ6bIOKoY55ZE9PmTc/FZ8OhpWXctdkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMTCnPgxUNjwKwVimK7UazCrJl9KCZ/mTrjgGhxvkGQ=;
 b=Q7KHv6Mh6Bwp3P4SloTJz+CN2Tp+14uGIOQe4Rt+q8PfC8bakH7cHnoEwrlA25D9IOk0uuX9iwFAoRpZ+JecQ7KdoE99ZZ1EZqMr9js0YMlW3R3CSEDZWsEemgp++K0GAKp8ruosBzZ3yqYsioghgB05QBTu1NIpcASvMq/DgGqu6T3qfJQ4IhcaKjTxlJh+sH2GxBYd7LhRBI0e6T3Oc+e+3jFjcth50nrPHYkotmr0GOKaNriMOJr2suUg1zlLH1f9aZH5n2hRZ9Yzl77X5iytC6MSBEJ5//npTZf+ti0p2TJU97N4NY0cvCxFL7ZWBzrCPctOgAoqLnKYw2eByQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMTCnPgxUNjwKwVimK7UazCrJl9KCZ/mTrjgGhxvkGQ=;
 b=g9xVJ+cotLxU7MX10NRbQC/1WCXXqQoaCo56zdXkvprKqa5N2au/pBFJbJJ0wHCMI/w3Dc8LiOyNOhkAVmnUtmJQPWGVGfGFRb+89UsQPS+tH3MyiDcnebd7r9a7Bwpk82f6y48jdKMXDsPOcE/b5RVDmZo34WaLhWTiudlo1uY=
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by DM6PR04MB4970.namprd04.prod.outlook.com (2603:10b6:5:15::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Thu, 1 Dec
 2022 14:20:47 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::d240:66cd:3152:9511%3]) with mapi id 15.20.5857.023; Thu, 1 Dec 2022
 14:20:47 +0000
Message-ID: <dd3ef019-e802-d192-c608-ce30376d3889@ni.com>
Date: Thu, 1 Dec 2022 08:20:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org, schnitzeltony@gmail.com
References: <20221201134148.116754-1-alex.stewart@ni.com>
 <Y4iywSGqI+lA2qkV@nuoska>
Content-Language: en-US
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
In-Reply-To: <Y4iywSGqI+lA2qkV@nuoska>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0133.namprd11.prod.outlook.com
 (2603:10b6:806:131::18) To SN6PR04MB5151.namprd04.prod.outlook.com
 (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR04MB5151:EE_|DM6PR04MB4970:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b34bb6-5c76-434f-9991-08dad3a73d5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tfJNcR4FBp/RKWRdacMvGJn86PYLGYmqmGIKsAfVFN75lcBt2FKQRJAa4OG5V9HqujzANuKOtjX2aqVgJXZfuoGuQRgdoekQBmMAU8hs3TirOKQ/ExwHZBWVng42ET4MqX/rq4oWWnDTmh+3LH65+NenQsx+vtzLUklCgR4Lyszm+3ZwT4LYzpzcxygP5VeFEuazHXx0WK4ii4xwMgEWdeG22CmaKoZ5wOSZQUFqRpfViSY9pqblocg3ZedItPo47g9rRaPQu2H8j1X6HzQtmE31I5zyjiMhS0HkPRl3DCI2vDycoSv53zlXMqG3tFk8JfJqiI9houR8BGTsvO1BJ3w65amONo+ovo5JQdmbv/M/0pW4W+rR1TcgZS+AKIQtJdzjlbFgB0uVJBOGWbJVZKzPTm/zuRWerfTuEtBZM1WVi2nIEZSq2jeupxKwpKgMOaximy/rn0N8HdLKkQ68SZqhTo6nAH8vGrURPDntsq0mht29PuRkLZt71wCOI0IMsu5Xnp5MkvnhXRQ5i/6WPT17XIJHr3MUoz76nKhueVFqtV+9oqG7eirvVa6tDQeHPmIZeJLe5NRi8kUd1708Sb1wgPHz5j5VZlVp0VyeIp6Zw5w6MSrPAJKzf/B00rAQZjclyalxDtxFl8bv9cM+6sOChExgPLy0zi3kyEKrUIj2V05J3YhbID2ICjD6A7+Ig2ikbt4kt+xrLs383nBhW7LcDOKv6lKfjaB4PmYVdwk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(376002)(346002)(39860400002)(366004)(451199015)(36756003)(31696002)(86362001)(31686004)(6486002)(6916009)(316002)(36916002)(5660300002)(44832011)(66946007)(8676002)(4326008)(478600001)(66476007)(41300700001)(8936002)(66556008)(6666004)(83380400001)(38100700002)(2906002)(53546011)(6512007)(26005)(186003)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RmI1SEFtZ2tqbkRTcmJkUDJwUXhqd1owdmpyZWlrUkhLd1didGVZS0k3T05y?=
 =?utf-8?B?NExxVTFmcXhNbWExVmlONUtmZmVXbmFWR1N5WW1GQ2VRUUdRSjhYS1Jmc0V3?=
 =?utf-8?B?cU93MUo1cXZIRWVSRnphQklXeEFNQ21meEtmYVd5WGhzSHRRdEk0ZFlCdy8r?=
 =?utf-8?B?L3JmN0dDQnc3SDc4MWNPL25WMVpXUU9tZGt6Ull4Q2doeVhsQkhDaW9yMFJR?=
 =?utf-8?B?V3pFYzBtRmVPc0xJazA0VTZBS3NqdVVXV3Bwc2ZRNjZ5Z3lxYXIxakI0Ym5S?=
 =?utf-8?B?TmJ6QXA4amlEV2d6MnNKRUMxVHVrbzF3aW9nMWRlOVZaTEx6K0ZOMWdHS3RO?=
 =?utf-8?B?RE5VQit0U29vTWEvQW83Z3k4K1JTWGtZM2hpcWRWdkRWQ3Q2L0Q5QkM5Q1Bj?=
 =?utf-8?B?TXd6NnJUY0QzOEtyaUlxVHcyRjlOV0xWeVpEZU9NMUMxdXprUUNyT3VkQjZ0?=
 =?utf-8?B?V3dHelI3MExCWlFaVGwvK2Y1VHN3YzYrMWVSdHNkbG9FSHNJSCt6STJiU1JG?=
 =?utf-8?B?RFNncThkaGVqTlJaZmV4Ym9hR2FKdXIva1pUaVJma1lFK2pzUUR6NHJDb0VZ?=
 =?utf-8?B?MGcvVEFUcTZEdmc2bmtpMmJBTVdMWXVFMTVra09YU3hpblhNeHk1ZWxNYkxG?=
 =?utf-8?B?a0pibG5JUDB2UUtERmJFbStYYVN5cHNjNTRkWml3UnAwOTM1SGJIRHMzdTA3?=
 =?utf-8?B?TEh4SkFFU0VlVms3a2JvVC9XcmRoU0tzbVBDeUR4cUo5RTZuc2paOWtHOHY4?=
 =?utf-8?B?UzltU0pYSTVONDltRmRRRzMxcGZaQVZ2emNycXlmR3UvUDBMN1llTWZQbHM3?=
 =?utf-8?B?Nm14SXg1S2w5U0F4dDBRMmlVdEhhZjZJazhtRS92cmwyT2JpOWRTcFpjeG16?=
 =?utf-8?B?dlJZTXdxbk4zZlMrV2FMWmk2WTA3YWR6VkhaMEE2QnRwc3B0VUhleThqby9O?=
 =?utf-8?B?SURYVi9YQldnREpwU3B5MWFVSGFsT21pMXJudGx4dFYvSkNsQmQvS3hqNnZi?=
 =?utf-8?B?WDh0eXZIUjB2U3V4OUM2Qi9NNmZxWUN4OWxvVzVPbHFLVEl1RER4YnpmWDdO?=
 =?utf-8?B?SXpTVGlPUkxJOHhUb09DaHdvbjhtSU9SSUFyb0RmUzB6eEZsamh0OFRqS1lj?=
 =?utf-8?B?WkdvNUEwc2xIY0Z1RFZLY3grM2xCbkd2Z3phdG5NLzlxZ2NjRHV3UlNZaHlH?=
 =?utf-8?B?LzFuV3prODRoVEVNbEZnRHp1cjh1TUgvcHVaY2thSmdrMytaTFZjZmxIaTJk?=
 =?utf-8?B?Q3g5T3ZMZGRzbEV5Vm9qMUwvSEdQaHJydlBvSXhmQTVZMkpqSGJQKzFEazJO?=
 =?utf-8?B?YWplNzdQVTZYY0dnSllILzJGc3VUUUNWNzhVdnMrNDJkcHJMejV3d1kvU2NR?=
 =?utf-8?B?YkpDZEsrR0Q1UjNxWnZtTHZXRHp0UmxoWGNLQmxCcGVCRHJSTDRaYXJVL3RI?=
 =?utf-8?B?aUNWQ3NJSVFMeDRNNlRteHVFbmR3Uk1LYkxpVjJLUmlZcmFtanJwVE1la25Q?=
 =?utf-8?B?TDhxUll4TGtpMzJiTVloNHorU1BrUml3ZVZFK09rVW51SUpXcnE1Um5WSXpu?=
 =?utf-8?B?K0c0eUMvN3BtWnBiU0g4MXRQN2lDYWhZVVF6YU9EcWdvVGl1REFYVzRRYzBW?=
 =?utf-8?B?S0VXejBmQ2RMdFhybkxKbUp6U25EY0NXeG5ielFoc3VUZDkzYnRPYU9lb3B4?=
 =?utf-8?B?SWdpNEpYM2xDTXlHY3RDLy83VG90MENqTTRySXY1OVFuTkFrbFNDcisxcU1V?=
 =?utf-8?B?UnZyTnBLYzFFcHU1b2haWmIvaGpHa2ZVTFNYTnRGMDJuR2lIZ0ppeUdYbTF6?=
 =?utf-8?B?TSt3eEp1a25XWVMzSVloY3ZTMzdXeER5YXV1UmtUV2s3enEwd2FXeURtTXdm?=
 =?utf-8?B?ZkVrdHBwUVdDMlJ5VkpmVExqR0FUUFdzODYvVHNqNFhMeTE2ZHVDYXhJcjVB?=
 =?utf-8?B?VEtQZi9tTUQ4bnB1OC9kTlFKNmx4c0lOSlpBSDhtcSs3d2pyazZ5VlJ5Qmd1?=
 =?utf-8?B?WGRqcUh0cVdSOGt6aTZqSWhrdVJZZnBzdmZLQjRJejNVR0kwNVZKaWkrK095?=
 =?utf-8?B?SUJPOXJOSFdTbkZ3VzN5ZXRSSm9aK3ViMWttZUpKaTBwcG82T0crR1Vjcnlv?=
 =?utf-8?Q?4N+8piKGkhT0w7jaszCWyCHid?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b34bb6-5c76-434f-9991-08dad3a73d5d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2022 14:20:47.0296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DT6iGiP2t8AVnFAk+I96sQ0OP2V/rzoM0lARsWWbLp4EPrGTyv0WYLsj5Y5+lwZnDCUaUAKl4qLata+zSaEYTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4970
X-Proofpoint-ORIG-GUID: sVFk3-FupAM0QIRErQwX9UxzkAY8T51F
X-Proofpoint-GUID: sVFk3-FupAM0QIRErQwX9UxzkAY8T51F
Subject: Re: Re: [oe][meta-gnome][PATCH 0/3] gvfs: use native ssh client
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-01_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 clxscore=1011
 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=30 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212010103
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Dec 2022 14:20:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99892

Hey Mikko,

On 12/1/22 07:57, Mikko Rapeli wrote:
> Hi,
>
> On Thu, Dec 01, 2022 at 07:41:45AM -0600, Alex Stewart wrote:
>> While rebasing the NI LinuxRT distro to kirkstone, I noticed that my
>> pyrex container fails gvfs:do_configure with a meson error about not
>> finding an `ssh` client.
>>
>> | Program ssh found: NO
>> |
>> | ../gvfs-1.50.0/meson.build:462:2: ERROR: Assert failed: SFTP backend requested but a ssh client is required
>>
>>
>> After some investigation, it seems that gvfs is configured to use the
>> `ssh` client implementation in the build machine's PATH. If no native
>> implementation is provided in the native sysroot, it will default to
>> using the host machine's implementation.
>>
>> My new kirkstone pyrex container happened to not install an ssh client,
>> and so would fail. Since ssh isn't a requirement to run BB or OE, I
>> don't think it's appropriate to use the host's ssh.
>>
>>
>> This patchset adds the native bbclass to openssh, when the user includes
>> meta-oe in his layerstack, and then provides the openssh-native content
>> to gvfs through its DEPENDS. This is sufficient to resolve the error on
>> my kirkstone pyrex container.
>>
>> NOTE: It's a little odd to me that the OE-core openssh recipe doesn't
>> already inherit native.bbclass - when it *does* inherit
>> nativesdk.bbclass. I would be open to moving the openssh changes in this
>> PR to OE-core directly, if someone can ACK that it would be more
>> appropriate to do so.
> Why would one really need to build native, the compiler host machine,
> version of openssh? Why even gvfs is needed for native?!
> For target or nativesdk the needs are clear, but for native?

I'm not sure I understand the question. Are you asking why the gvfs 
compile requires an ssh client in the build host toolchain?

If so, I don't know the answer. Trolling through the history of the gvfs 
project didn't provide me with very much context as to why it is 
required. And I didn't see an obvious way to work-around the requirement.

> These kind of things really need good justifications or the whole host
> tooling graph explodes and build times with it. In most cases the native
> host target has a lot less build dependencies and features enabled
> because of this reason.

Agreed. I'd love to eschew this requirement; but that is probably a 
conversation with gvfs upstream about why it exists in the first place.

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com


