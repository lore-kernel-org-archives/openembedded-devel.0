Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5946C433FE
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 05:36:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3906.1669786563622481826
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Nov 2022 21:36:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=tDwngErh;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9333fe06fd=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AU5UqKJ004836
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 05:36:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=ivbh2Jsjcs8nTOE9/LFU/g7bO9kE67bjHLB6opqgF6M=;
 b=tDwngErhE00jr9Dn/Iujs/87eXP3HrVeuM1KUIFpGfnTKX0qC9EcJtnkcJS4OPvkpdEa
 KqqIAwa9hZ9nlXedAfPAMvjS6cNFysX/I3VRonzrJ6oHoo32r/IutNf5js2bvsSMpj0m
 VWs11hTFFk5g7YH8ajp8ZMFC3Nj7+Iz+UTASp6taDWtFe4q9WbHfh4bCxgWg8wvuMJpo
 Rrvb8IZsEKBg7zsC3f0kh4qqbAO+G92H+5gkWI+MrEFhnpbGTHzMBCVgi4iZRfwkup6e
 UO6R9VaLc0dOsrXfnxc1l//bWZ5X6ezuV4ab9hjwbFOAfE1/VrO8j0BT8GFUxXVbjgoV Ww== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381333b6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 05:36:02 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AU5Zt19015680
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 05:35:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m381333b5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 05:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W1+dSzaO6FBbiYzcyWM7lTT0ISsz3VdmtzMOxP2YxxNkmjEi+cx4xj5ekNpw0CkX92gYCdM07SrdhihiPhWmPVDdwacSJQMC0Mi8+cSRjEzavjUVZsyHYRiC8/U3t48V1Bv0KaNdhIpG/60RBxOYTUNabKTCNX2GFQ5Wi0OY6pKC2L4yqK2YC8WYITfo3umA0uyPSKUl+qW0JAzJvXM7aKVWUZcB5oeXkoQwExR5Z4HKlL/tCxp5u3pF3f8fnHACwv4c0yvemzPsY3xS5V6Z7EuFIB2XcdSTDC7XvkzYStNYICg+C9LLD6aBbMYAqYD6xWJdeuZcPsZX/zcfQZP4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivbh2Jsjcs8nTOE9/LFU/g7bO9kE67bjHLB6opqgF6M=;
 b=WQ9deFb0Kh2Kmy2qGqxRU86Bw3lgem6quYjcIEQJ89Hbb1Vpec9iLWakYlgwhog3oqtINPBOq/y0t8J3ttudcYChZftbaqTrQ7HtCBIxtP+hKnZ3GjiIcwe5myCZAYZXL2TJRf0It5H7mxppEl+biFIBLM5Rgxid2xDsWgCBKRB4lAFu+IZ5QyWonUHg/LMyPD1JG98Idk+pveYoTKhEQfu3xieb33AIZhHpfx5L1bxJhimFpjtne+uIl2IPEM83cmxpHBQPgWn/zeCEZZVAGrh3oW+zM5QDkK5mqOXuv7zvEpb7qOkZZuI3rZ4R5n/4MMmyAOzo/7OUF0rvn17yZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 SA0PR11MB4656.namprd11.prod.outlook.com (2603:10b6:806:96::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 05:35:51 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8397:585:1500:c7f1]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::8397:585:1500:c7f1%7]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 05:35:51 +0000
Message-ID: <eff2a7ce-c960-d453-2ad0-f883cd79bbaa@windriver.com>
Date: Wed, 30 Nov 2022 13:35:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [oe] [meta-python][PATCH] python3-wxgtk4: replace deprecated
 inspect.getargspec
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>, Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20221129145137.18173-1-kai.kang@windriver.com>
 <CAMKF1srqJdZGB2OpQ3Phb_x_7rHF=hyryW9MhijKmBUkL_ykag@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
In-Reply-To: <CAMKF1srqJdZGB2OpQ3Phb_x_7rHF=hyryW9MhijKmBUkL_ykag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SL2P216CA0125.KORP216.PROD.OUTLOOK.COM (2603:1096:101::22)
 To DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6064:EE_|SA0PR11MB4656:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c5698ed-681e-488e-e263-08dad294bdef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+gd8tpidhUDBP8ii70sDwHsQFHaF/DcVY1oQS/QQspZo/oqusX8lEyV+JNJKjIp2FBnKXUddBDYJh1WDZSkgB+BN0UlZaj0ExEtB7dyCI2E57wxA2Qx7+NUvh4mvmQKdxNrnSETtxSg5olhTzMdiW7XiZlda4JNGmRfW+sNXedE891vkM6SSZ1lnxyHNXeMpWfjgLxmGcJrAdUm2Sq7r5tEC+mSpjMORvEOeMAlNPt+Vx28i2CplCyICzss2Z5aC5Fgi25W0+NkcUXK46sMi95qaxQhHwUAunj+CZjtIdDDSK2xP+VAE/WE2udiEHD/aQIbDw0YCnAwmHRoPF4oYYH4R4+qns9l4iyciNxX7LosLhWs77z8kjwTanOsXbGZpxW7sFWz6fhk0l1iJENX1+RysJsyfYW3f/WrTJvtD2OV9XimClFiIR2d2FMjx5Bk7uj63Daw64xbUqy2bdSHdc/0bQqSAGQ94ArSBI71+OoT+kv2yiIQZ2wBIeljcndyMl/herMVKN82X8kE/ItgynMW3cqpy+s0nU1yEMyusdk26yroe8dfHDL9EzZZCsnWyXuiIDfoJv3kl0U/iWWxQVLFwNGpaJ6QZnsdWCiSXcTnR5NAxD90Gs7pBZ0d9TKB0wDDk/X5/NiJ1VHBI+GoIvyq1pfNxis8vfZYjcSmkLHOf7Hrwd/62AS+s8QYlkFpvYokrokRgodols0vRdk4Kpkwe6xLeDuzOJ5HJXPW5hDomdh5KlMtbf2pnadROSQLL3xuCZ78Wlw/qEJod6QdvQreqJz41XGdYf2KprIrXMDM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(451199015)(478600001)(316002)(2906002)(66946007)(86362001)(36756003)(966005)(6486002)(110136005)(38100700002)(6666004)(83380400001)(26005)(6506007)(53546011)(31696002)(6512007)(186003)(2616005)(5660300002)(66899015)(41300700001)(31686004)(8936002)(66556008)(66476007)(4326008)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Q2ZHaDlXcm5CSmZ2WEx1YkVCbHJzUHgwL3RTY1F2cjFMalZmQ0F3Q2I5QTRK?=
 =?utf-8?B?WXk3dEV0Q3lhbEx5YVRlRXdwTklhNllrWnprWllkQmwxditKb0VaSzRtNW9r?=
 =?utf-8?B?dzN1TzNNZWQ5SnZFNE8xUmFKb081YUJwN01GWVR5YjA4RDIwUEs4TCtzY3lv?=
 =?utf-8?B?NnBvU2oxdGFTUVMxZlN0M3NOeXNxRFVRU0pURGk1TU50VXNoOWZkQkZtVXh6?=
 =?utf-8?B?cDZDYkEwb1ltb2QvM1ZNc0ZzUkFPUVNBRHlIU3J2S0Nwd1BPanRVUXNORXVa?=
 =?utf-8?B?cm8zMnZKSzF6WlhVV0xOMUQ2QWRjZkllbTZBZnJrYkJYaGlqMjgxR0pRcm5u?=
 =?utf-8?B?MmVtNWEyNTVFY1BZVzVCWE1RV2N4cVNqRzRiaGtmWC9rZFJVQWkwR3BKQnZV?=
 =?utf-8?B?WWZ0TU90RnRQZ2RzVmVUajhXcThMRG56MDlzbUV3N0dZaWg5ZmpSUlNIQjU2?=
 =?utf-8?B?NlRNWkdUT1F5SzYyekYvQTgvR0R4aUpBNlN4cDk2VkFrZVRKSnpCUU93UWZF?=
 =?utf-8?B?Sk1hZTh1ZFg1RWJQSEZCMWRwbUgzdmtYLzJyNjJUQkNmK0dmM0hDaWl6bWpP?=
 =?utf-8?B?VVJlRkM1cGhVZ3kvY2tJcUowa3pKN09JelNXVC8rT0ZwamhyY0R2SFRranU4?=
 =?utf-8?B?enZjQTVOMFFNeml6N0ExelkxVWJVazJ6eTFRdnhrbFg0SWZYSWZDcHpGVFBo?=
 =?utf-8?B?VDgxbDYrSEswWWlpRXNHZERNaStmMk1CbmpUK293YzVEL3V3Sk1BMnlIOUFr?=
 =?utf-8?B?OEVuWXY2YkZUWk5kZWNyb0czem5maVgweXkxZnRUSElEa2dmc0sydnB0ekNk?=
 =?utf-8?B?MXJCcXpxbU05QlIzd0FxZ0VtUGVRMjBMVnRjRFlBdElnamtCK3l2bHZTQk1o?=
 =?utf-8?B?M0RlRFZ6RGxRaURPbmxuSnpHRXhvWVhJSSt2UDJLRjJQMWt3SXF3dlB2dzFa?=
 =?utf-8?B?dE1CZi9QSnpzU1NSampETFo0SEx6QVJmYzE1UGl6NkdLNVRPeHkwMGRUTlB5?=
 =?utf-8?B?clZkSjBlU2JSOGNyUWZaUUFFM21zWjRFRlNWNWZVS2xyUmxQN0xJQkRyUGR2?=
 =?utf-8?B?d1JaaFJtRFNaZ2tvdzg0Q21sV29sYjdYR0NQTmFiSTNTcWJsZG5XWUNjU3Jw?=
 =?utf-8?B?bERFMGNYK1RCQzRmbXp2NnJCUkpsQm42TjNDckg2ajFxYURPVDdJdU9yRXlS?=
 =?utf-8?B?MzBpNWFDK0puaHFDdm9SUlFiUCt1T2lmaUk5WjcydkcxbEV4c214T2d1a0Vs?=
 =?utf-8?B?QVp3VlUvVndPeXVFMk5sYU05T1NxVllMQnc3ZVpHRDNUN09CaEVCYUNVVURT?=
 =?utf-8?B?ek96SVk4T1pyRmw2YmMwOFlqZ2tubVdrNGhOdDNIY29kaFFIRDBlSU9pNGFw?=
 =?utf-8?B?Z0FwZGwvOFdQZU56Tng2Q2gzMHVsb0Z5bUZESGt3SDBLT0hTYWhJN2RMdGp6?=
 =?utf-8?B?K2lwVGdvSkxaZC9DbERNcTJTVERhai9jQmlnV3V6czUyTzNyVGZpcGhoL3lE?=
 =?utf-8?B?Wkd5ZGtOQ1p5Rlp1MDAvN0lQR2V2TUZ2aUhBMzJNS2l0ZEYvSjF6dlBIWUx0?=
 =?utf-8?B?THBYS1dkWVJzUFdDbGplQmZSTmNuNEVKbU4xZVhncWM5QkkyZmFCN21VUGwz?=
 =?utf-8?B?bTE5RnYvUTFkUmpoVmNLenJUbTFzZCtjY0dRTittUHZiSmdrS2xXT0FsbTFG?=
 =?utf-8?B?UUpCT3g3MVd5SW9Wc1hGejFpTXcwUVZ3anpRN200VFNVSmpFSFNsUGcrYVcv?=
 =?utf-8?B?cXFUREdhdE5wZXdtMStjamNHam5TdkNSNVM2cUtuTnFWM2hHUGdWamozTTRM?=
 =?utf-8?B?Q3FIMDNGL21mR3B2NWFWdHZYN2w1cDBiQk5TQlZ6MmltMWd1MXV2bHRpMWNl?=
 =?utf-8?B?ZVBBaEtqQzcwVjV4M2lNUm0xMmJTVHZmUXVXU3IrL3hrSVRGZ2RIeTFpU0Z0?=
 =?utf-8?B?cGZDWnpUQjVPQWhyTHVjSkJVVlpQRTNzNkEyczBqbSsvT0RabTFOSzkxN0Qw?=
 =?utf-8?B?ZWF5NmZVcm1WVGNWd3JEM2NKWDROWUxVb0xHQUR2aGswN3o4emZORS91RHJr?=
 =?utf-8?B?ZE5jaXFuKzZDekNJemFxZjluOEo2anpCYWlVRkYxb1F4Rnhnc0k0eXNPVjRR?=
 =?utf-8?Q?ONJRjyweDo07RrFK4bRTCnnoe?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c5698ed-681e-488e-e263-08dad294bdef
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 05:35:51.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jEuiC5H9OcK7TamuP/H+MuYZX4CYG1JoyMZ3k6wTMyanwjTPMx2phx8o01W7DyjLcN4ZR7dXoSbq37sJHtYyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4656
X-Proofpoint-GUID: De5ObNcn8jLjt6HoB3d6rxgAeMfcWMBk
X-Proofpoint-ORIG-GUID: iVvaiVKcgqWnMKlbMVD6MbVSqwRO14Y0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Nov 2022 05:36:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99857

On 11/30/22 06:19, Khem Raj wrote:
> On Tue, Nov 29, 2022 at 6:51 AM Kai Kang <kai.kang@eng.windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Backport patch to replace deprecated inspect.getargspec in lib pubsub.
>>
>> And add python3-pip to RDEPENDS which is required by utils wxdemo,
>> wxdocs and wxget provided by python3-wxgtk4.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   ...eplace-deprecated-inspect.getargspec.patch | 65 +++++++++++++++++++
>>   .../python3-wxgtk4/python3-wxgtk4_4.2.0.bb    |  2 +
>>   2 files changed, 67 insertions(+)
>>   create mode 100644 meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
>>
>> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
>> new file mode 100644
>> index 000000000..4501667f9
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4/0001-pypubsub-Replace-deprecated-inspect.getargspec.patch
>> @@ -0,0 +1,65 @@
>> +Upstream-Status: Backport [https://github.com/wxWidgets/Phoenix/commit/9986a0d5]
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +
>> +From 9986a0d5c24b5d45ddf571d60351f68765a8a9be Mon Sep 17 00:00:00 2001
>> +From: Scott Talbert <swt@techie.net>
>> +Date: Mon, 8 Aug 2022 22:35:58 -0400
>> +Subject: [PATCH] pypubsub: Replace deprecated inspect.getargspec
>> +
>> +inspect.getargspec was removed in Python 3.11.  This is a backport of:
>> +https://github.com/schollii/pypubsub/commit/089c7a73f85c76a3aa22e4b10c71db1bf65a8637
>> +---
>> + wx/lib/pubsub/core/callables.py | 23 +++++++++++++++--------
>> + 1 file changed, 15 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/wx/lib/pubsub/core/callables.py b/wx/lib/pubsub/core/callables.py
>> +index 65eb1ebe..7e798c54 100644
>> +--- a/wx/lib/pubsub/core/callables.py
>> ++++ b/wx/lib/pubsub/core/callables.py
>> +@@ -12,7 +12,7 @@ CallArgsInfo regarding its autoTopicArgName data member.
>> +
>> + """
>> +
>> +-from inspect import getargspec, ismethod, isfunction
>> ++from inspect import ismethod, isfunction, signature, Parameter
>> +
>> + from .. import py2and3
>> +
>> +@@ -133,19 +133,26 @@ class CallArgsInfo:
>> +         self.autoTopicArgName = None."""
>> +
>> +         #args, firstArgIdx, defaultVals, acceptsAllKwargs
>> +-        (allParams, varParamName, varOptParamName, defaultVals) = getargspec(func)
>> +-        if defaultVals is None:
>> +-            defaultVals = []
>> +-        else:
>> +-            defaultVals = list(defaultVals)
>> ++        allParams = []
>> ++        defaultVals = []
>> ++        varParamName = None
>> ++        varOptParamName = None
>> ++        for argName, param in signature(func).parameters.items():
>> ++            if param.default != Parameter.empty:
>> ++                defaultVals.append(param.default)
>> ++            if param.kind == Parameter.VAR_POSITIONAL:
>> ++                varParamName = argName
>> ++            elif param.kind == Parameter.VAR_KEYWORD:
>> ++                varOptParamName = argName
>> ++            else:
>> ++                allParams.append(argName)
>> +
>> +         self.acceptsAllKwargs      = (varOptParamName is not None)
>> +         self.acceptsAllUnnamedArgs = (varParamName    is not None)
>> +-
>> +         self.allParams = allParams
>> +-        del self.allParams[0:firstArgIdx] # does nothing if firstArgIdx == 0
>> +
>> +         self.numRequired = len(self.allParams) - len(defaultVals)
>> ++        assert len(self.allParams) >= len(defaultVals)
>> +         assert self.numRequired >= 0
>> +
>> +         # if listener wants topic, remove that arg from args/defaultVals
>> +--
>> +2.34.1
>> +
>> diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
>> index faea43777..df23037fc 100644
>> --- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
>> +++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.0.bb
>> @@ -13,6 +13,7 @@ PYPI_PACKAGE = "wxPython"
>>   SRC_URI += "file://add-back-option-build-base.patch \
>>               file://wxgtk-fixup-build-scripts.patch \
>>               file://not-overwrite-cflags-cxxflags.patch \
>> +            file://0001-pypubsub-Replace-deprecated-inspect.getargspec.patch \
>>               "
> Fails to apply
>
> patching file wx/lib/pubsub/core/callables.py
> Hunk #1 FAILED at 12 (different line endings).
> Hunk #2 FAILED at 133 (different line endings).
> 2 out of 2 hunks FAILED -- rejects in file wx/lib/pubsub/core/callables.py
> Patch 0001-pypubsub-Replace-deprecated-inspect.getargspec.patch does
> not apply (enforce with -f)

Sorry, my fault. v2 will be sent.

Kai

>
>
>>   SRC_URI[sha256sum] = "663cebc4509d7e5d113518865fe274f77f95434c5d57bc386ed58d65ceed86c7"
>>
>> @@ -29,6 +30,7 @@ RDEPENDS:${PN} = "\
>>       python3-image \
>>       python3-numpy \
>>       python3-pillow \
>> +    python3-pip \
>>       python3-pprint \
>>       python3-pycairo \
>>       python3-six \
>> --
>> 2.17.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#99845): https://lists.openembedded.org/g/openembedded-devel/message/99845
>> Mute This Topic: https://lists.openembedded.org/mt/95335564/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

-- 
Kai Kang
Wind River Linux


