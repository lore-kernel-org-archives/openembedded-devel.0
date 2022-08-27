Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C5EECAAD2
	for <webhook@archiver.kernel.org>; Sat, 27 Aug 2022 12:59:52 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.48406.1661605183827431955
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rVX0ib6w;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=5238d37d9e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 27RCxha9030803
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:59:43 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=HQgZUlbdMAYQ8WT0loF3tCz5som85JCn8Yj/fVCP+iA=;
 b=rVX0ib6wLqsmSEW3VA7HDowwx6K84+nBPqMuAisq3hv1HjTeEsBFeAC6wRPCCG8BW3kx
 a7YlD4pe6toMtjDF4S3kISuWC8QUaBpGD1P4zCzG/5RpGj9ShmdqPOyHvkJW7FOdYGrb
 +Za7Wuycbs/md+Oz6dQPF5Of9cDyNmSxSYHGTM8Q1vu7BM/pF5A6El6R6TTbhNE5f8mQ
 Hvqp6t9iTMuOy/k7f3TLWb5BqhbZSVUyx03lwH+d7QQecPbCgiaaIsCzjrEhm3QMLdXC
 NCFRNrVh0bdVpJ4NMjqWQkBYORz5qHUxM8Prx7VptubyzZv2LREQRdHhZWRbYbQCy+Gb RQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7ej6058c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:59:43 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27RCxgAZ030798
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 27 Aug 2022 05:59:42 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3j7ej6058b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Aug 2022 05:59:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jw/c57IE1OvW7Pytf0dbm/szVbzSoPO4iMy4JKY/y2m3rZnNTXRW7ShV+qqUQnncJ9cCzPSESFZnKnoBUUQOoqPxe8dWPyS5bmV5DfTOAFljio5yZYy67fbDBwbqbbqr+XS06/d8Fs5iMrRVbNKf8OrtwGf2TB2h3FprWWYcneatvVZ1VTB7cnPf3wpIRIEULG48da7E0uBSI415Q8vRAAkS7HOPopWFZlnpBoO7MmRdbaT6+B3okuYBGc07nPPl+fd6N+P8JpXLUxBgnxq/+WZzqyqhPK8NTKiqxe72EMec1PwkY7s6U6YI3xxVw20k9y5HAIsDxRx5H5FMl8hBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HQgZUlbdMAYQ8WT0loF3tCz5som85JCn8Yj/fVCP+iA=;
 b=XpeE95+KwBArzVnYpcS2L63sc0TDIWDdvFsKKh6l5nIgmaL2+RXSB/TFwO242Wjm67VDMpQQ4LeBm6LPcbyUiLma0NyPxK6HDkuMGcWPRHRF4RnVrU3M+bIFsWR8HLOpy+SXnBM3c9bf4zrgTfFZ0jdd1iJoNed1JKoy2kbTrnUjxhgPyf6+VMKqTV8BcS9Bx6y+NtuvhnPslP4z3qQXOxnTMxeMZ3r7Uaoqsknqo3+hxE+N5iZo6SJpX9frI8LcTE2EUaL3D+q446YAHz20jPLj92Gh2Ze4mE5qfqdsAgmgZ+Nf6bYvQyHNawFi48vM024Nih4aiMOfA7TfbqCYCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SN6PR11MB3038.namprd11.prod.outlook.com (2603:10b6:805:cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Sat, 27 Aug
 2022 12:59:41 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::a921:a88e:14b7:56ec%6]) with mapi id 15.20.5566.019; Sat, 27 Aug 2022
 12:59:41 +0000
Message-ID: <64220f5b-102d-d6a8-dfba-9c0951539f43@windriver.com>
Date: Sat, 27 Aug 2022 20:59:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [oe] [meta-networking][PATCH 3/3] samba: fix buildpaths issue
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20220826011930.2818670-1-yi.zhao@windriver.com>
 <20220826011930.2818670-3-yi.zhao@windriver.com>
 <CAMKF1sooV1+yriJF5OCugP=JdpD9ffm6gC1C6pAfXQDZyecv0w@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: 
 <CAMKF1sooV1+yriJF5OCugP=JdpD9ffm6gC1C6pAfXQDZyecv0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0127.apcprd03.prod.outlook.com
 (2603:1096:4:91::31) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac18399f-ec49-4eda-8981-08da882c012e
X-MS-TrafficTypeDiagnostic: SN6PR11MB3038:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V261Mz2/oO6lCneX0WO5qr6ggpK3ycMKmvsayfJYOcoNxCguSR8Fy+JCXm8hQaugM4sWRgw3qQEIW6SZEFBU9zG5Z8QTbZjhyWBxnFtOaj+qXBjz89Jg/0ZS5QE5tCNq9Op6Re1iS3jlzjcavwzIWm53svdSNnOPw3+3jFh89JyvFcDyMM47UtfejdpIDBHT29mCy2BrbK+9HDFbkhX1b1mmw5YX9vBaq08xCteW8X6ILQ2HHuKVfdOegReWuuzfFVb9wkVgdtBiJzN3ghMS5zs7/ANYCYJ0mrjEeHUJf1A9qyfBvQdFeVDX+uLnkFqF6+61u9R5De4/RM6+LO0Q4+V/a7DM6oEQz3eZ11B6Z0yyCg54LA2uveIXAtGU1FVzPfgYQ3UVoum4zMhV9Slqrs6fU2vylaq/hw5gL/WRr8lysEh41AZjfzwp+cCdbzgiJc89AoCZuJisKUE7Y3toGSpHI48eM8STn3Xtcygi4gqgSae7K/1fKfaNsa//enbJza/Zmaeq53YS7i+xDLJNxFQqadVUcbTfe/KA3xT453iBaGwSxRxRj/IdRCXqqXqTWVjFO/yrlpu4wRP08itaFllTgPZONU6WoX3tEQXuN+Kx+BTtj0+j0sXuQY3yjk5D+jjSsKpvLyONLmBFrU14vVwkaPAgK5OsrqApFkSSVQKXB9Nm0TLsDrk6glJ4Bj/KwbZ5YH7sb5Yld0HekbYiLIUq3SvP3bkH6CvN9WqVW3YfV6qJNSYs1wRg96tcBabdvK6MO4FONSaLIogGZbGNOv9DhsfPXQtOjZCL+ouWS53lVwgm5T228BZoiVQP+sc+ra6GB00tu91BtVsrz3cQdP+oei1uq/uOHeAvkiBILQk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39850400004)(366004)(396003)(376002)(136003)(346002)(6486002)(6512007)(26005)(478600001)(53546011)(6666004)(966005)(41300700001)(83380400001)(6506007)(2616005)(186003)(5660300002)(8676002)(8936002)(4326008)(2906002)(66556008)(44832011)(36756003)(6916009)(316002)(66946007)(66476007)(38100700002)(31696002)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MmMrdzk0NS9TeFQweTZKN3ZoTDNHL25nUEIzMlFlVFpWMllmanBNcy9kczds?=
 =?utf-8?B?cGQwRkxoODVKUmdPZE1kWmd6NWQweTBwamEwLzEwRlFPRkhvakZESlNNbTBL?=
 =?utf-8?B?Y0t1ZnIyZTRQS05KeVFWczUvS0lYOWkvVi9NbWU3V0FvNGI3ZlNKdm54bDdw?=
 =?utf-8?B?V0cyNndpS2FheC82QTdoWXpXWm1lWXlMdGxEZXRVUHYwVHE4cjBJcmJISHZQ?=
 =?utf-8?B?N3lqS2l5alVHRDErVlZKeWwvNUl1Um9sR3ZESE1McTNIME85TnRjWmxlL1pY?=
 =?utf-8?B?UVhhR3VEVXYwRy9iY2hGaHJRY085UGxwTmozQUZtSnZNZlZCZXZlTW9YTi9J?=
 =?utf-8?B?WUpXekU1aEF4OVZZcnhOQXd1Y3IrSlNXWDJld05qRHFJcHg1ZVZoOFJTbVA0?=
 =?utf-8?B?MTFPWVdmQjEwY00vdE9hU3Vpak84cEVpK1pITjBoU3ZwaVFIMzFOQW1zblYr?=
 =?utf-8?B?V1pEWmFUZ3lXamJNUVUrSGdGdlRFbW80VmpQdUh1d1B5YzNkLzNDc2QwYVFU?=
 =?utf-8?B?M0plMlRXL3hRemk5Y010Y3EwUGFhTjJYb3JmMVEweWJKMTBjcVBaT0RQMTQ5?=
 =?utf-8?B?cTNIQ21GaWpDR2xIS0ZVVzFKbXpiV05IWjYwR25FeUtpN2NFRDlSU1h0N01r?=
 =?utf-8?B?bU5NSWdvY0hRdnpDQ1dxeVpsYkMvRURaVHRaRlZVdVVpdVgrMVFUeGQzYTJr?=
 =?utf-8?B?UUhWby9lNXJXRHhtM3dQeVMrMVN0QU5zanRrN3VnSGU3Y0taZzhGU3gxR0hh?=
 =?utf-8?B?dUYzakZ4OGlNUVpWRUFRVStyMUNMTXJTU0w1OXVaa29SOHNjazV2Vm9CQy9x?=
 =?utf-8?B?MWI0M2RIL3VtQlYrVy92M3l5QVB6S2RYTUVjOHl1MU5MZEtMS3I3QTFiME1T?=
 =?utf-8?B?N3MzM3VrUklkVitQaWtET0ErUHpjd2JtRWFtWmpSNk9XbVZxOGZucmtHZHpv?=
 =?utf-8?B?RUozRlZidC81azRzM1dIWGp0RGRWMDJnOTNjRHV6QWI1VlVxNWw3QW5vWW0z?=
 =?utf-8?B?K2hHNjhTdWdkbXVPd3gvaUhpS1poZzlpa2IwOSt6Y3FIT1ArZFFzSUJ0RG85?=
 =?utf-8?B?RWFHc2xLQ3k2M1J3cnIrYkQ4TnFvRDBtV1hIOFdnVDRnNVB1MDB6QnNYTUdH?=
 =?utf-8?B?NDFGUEg2anVBZFliaThLUVNyZlVMRndLMDVMamZjWURnaHN2bTNlMTZuTDZS?=
 =?utf-8?B?eEZxRmcyZGgvOEozaFM0bkdHcDA0NXNOZ2hPdGpZTXBiaXJjd1FMQjJIRTQz?=
 =?utf-8?B?QVNtV2NkL2pNOFhsMmpNZjYvb1NrQnYyMG1Ta0xGN3htdGlkRHpOY0lMckZm?=
 =?utf-8?B?SUVjaVhXUitpMTFmSjRLRC9ZNU9pSG9qZUJIZXVSMW1VL2xPY0JTdEZsdFgr?=
 =?utf-8?B?WVNWdkhRWUhMaWFJaGViU1RoZ2JrMjdFRWlkQ29xaEJkSDdWcDc3SXhRZHUw?=
 =?utf-8?B?MUwxd1p0ZDJ6NWs5VnRCMVVrUjdkZGRwaEc1T2JHeDhSamNTazF5MnNwZ2pU?=
 =?utf-8?B?VU1uenJsbE9mMkhwdi9rSnlqcGFTTWZ3SzlpNk5NK3c1R3JIcmNqN0pVajVj?=
 =?utf-8?B?dCtIQWk5OVQ1THFrTndYS05oMWV4ZzI1NEFIdUxvV2lsQjZaUXZzQkFDUG1v?=
 =?utf-8?B?TE1sa3lqTmNseWEvTGNCNmJHS0o5UzhOczRoMkF5QXcrNVZDcFQrbkZGZTNN?=
 =?utf-8?B?UTJ0dUtYVFVpYVc5WFhCTzVFWGxFY0NxMjVYa3RNNXdWTDF6dDA4cWRoblZ2?=
 =?utf-8?B?Z05oYmVPYmxQMDRIUTYwM29qWGhKcVk5WGxPRFlDeng4N0Y2eE1TZndQcmUv?=
 =?utf-8?B?SnZObU9KTVlsaDh2Q28xSllYUEZoSm9tRE5MUkhQaElHN2RzM1JqNWFpQncw?=
 =?utf-8?B?cU5SaXZsODFMUkh1bUNhWW8xTzAvdGV3QVYvNDNFc0VxSmF1bkhmeVo4MUd4?=
 =?utf-8?B?b3BPOXR5Z2hpZzFJY2k0Uy9jdmkwUnBmQjlWbjkwZnNmUzhpalVNYXVCTEZL?=
 =?utf-8?B?M09UOU95UXB4RTdNK24yNkcyckhrcmV1R1hqeUxBNEVsZWtGeHFiUUEyOFZx?=
 =?utf-8?B?dzNjc2RwWUV0L3Z0bUhNa09NQVNScFJVNHdnRkZ6YU5lTytVUHYxS29qMEl4?=
 =?utf-8?Q?LeA5axND1fIeF+ZX53H/u7x0z?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ac18399f-ec49-4eda-8981-08da882c012e
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2022 12:59:40.9406
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LA9MXUp0UtMpGpOyuCrW2944uOdksLGdEydhVePzsm/oSqm3FrupKomkPKgTACSV+gYaqf2SAObXVTHSWH4kFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3038
X-Proofpoint-ORIG-GUID: vZttnArQJ_AmUV62qapXx_Dp3bQYvDXC
X-Proofpoint-GUID: d4LQV8EXYkd4ejk2y_cVjUh5JQ03__0-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-27_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2208270052
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 27 Aug 2022 12:59:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98492


On 8/26/22 16:25, Khem Raj wrote:
> On Thu, Aug 25, 2022 at 6:19 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>> The test case tfork_cmd_send in smbtorture fails on target as it
>> requries a script located in the source directory:
>>
>> $ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
>> test: tfork_cmd_send
>> /buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
>> Failed to exec child - No such file or directory
>>
>> This also triggers the buildpaths warning:
>> QA Issue: File /usr/bin/smbtorture in package samba-testsuite contains reference to TMPDIR [buildpaths]
>>
>> Skip this test case in smbtorture to avoid the warning. And also disable
>> rpath build.
>>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   ...orture-skip-test-case-tfork_cmd_send.patch | 38 +++++++++++++++++++
>>   .../samba/samba_4.14.14.bb                    |  2 +
>>   2 files changed, 40 insertions(+)
>>   create mode 100644 meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
>>
>> diff --git a/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
>> new file mode 100644
>> index 000000000..90ee31786
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/samba/samba/0001-smbtorture-skip-test-case-tfork_cmd_send.patch
>> @@ -0,0 +1,38 @@
>> +From 059b517f9ef6cbdc696e0983ce255b1728042827 Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Thu, 25 Aug 2022 16:46:04 +0800
>> +Subject: [PATCH] smbtorture: skip test case tfork_cmd_send
>> +
>> +The test case tfork_cmd_send fails on target as it requires a script
>> +located in the source directory:
>> +
>> +$ smbtorture ncalrpc:localhost local.tfork.tfork_cmd_send
>> +test: tfork_cmd_send
>> +/buildarea/build/tmp/work/core2-64-poky-linux/samba/4.14.14-r0/samba-4.14.14/testprogs/blackbox/tfork.sh:
>> +Failed to exec child - No such file or directory
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + lib/util/tests/tfork.c | 4 ----
>> + 1 file changed, 4 deletions(-)
>> +
>> +diff --git a/lib/util/tests/tfork.c b/lib/util/tests/tfork.c
>> +index 70ae975..4826ce6 100644
>> +--- a/lib/util/tests/tfork.c
>> ++++ b/lib/util/tests/tfork.c
>> +@@ -839,10 +839,6 @@ struct torture_suite *torture_local_tfork(TALLOC_CTX *mem_ctx)
>> +                                     "tfork_threads",
>> +                                     test_tfork_threads);
>> +
>> +-      torture_suite_add_simple_test(suite,
>> +-                                    "tfork_cmd_send",
>> +-                                    test_tfork_cmd_send);
>> +-
>> +       torture_suite_add_simple_test(suite,
>> +                                     "tfork_event_file_handle",
>> +                                     test_tfork_event_file_handle);
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
>> index cb3678d7b..8877b8e1a 100644
>> --- a/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
>> +++ b/meta-networking/recipes-connectivity/samba/samba_4.14.14.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "${SAMBA_MIRROR}/stable/samba-${PV}.tar.gz \
>>              file://0004-Add-options-to-configure-the-use-of-libbsd.patch \
>>              file://0005-samba-build-dnsserver_common-code.patch \
>>              file://0001-Fix-pyext_PATTERN-for-cross-compilation.patch \
>> +           file://0001-smbtorture-skip-test-case-tfork_cmd_send.patch \
>>              "
>>
>>   SRC_URI:append:libc-musl = " \
>> @@ -114,6 +115,7 @@ EXTRA_OECONF += "--enable-fhs \
>>                    --with-modulesdir=${libdir}/samba \
>>                    --with-lockdir=${localstatedir}/lib/samba \
>>                    --with-cachedir=${localstatedir}/lib/samba \
>> +                 --disable-rpath \
> this means that private libs installed in /usr/lib/samba are not
> detected by dependent packages anymore
> try to build meta-filesystems/recipes-filesystems/smbnetfs/smbnetfs_git.bb
>
> It errors like this
> https://errors.yoctoproject.org/Errors/Details/669955/
>
> but the real error is a configure test failure
>
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/smbnetfs/0.6.3-r0/recipe-sysroot-native/usr/bin/x86_64-yoe-linux-musl/x86_64-yoe-linux-musl-ld:
> warning: liblibsmb-samba4.so, needed by
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/smbnetfs/0.6.3-r0/recipe-sysroot/usr/lib/libsmbclient.so,
> not found (try using -rpath or -rpath-link)
>
> this library is in usr/lib/samba


I can not reproduce this on my host. I have sent a V2 patch without this 
change.


//Yi

>>                    --disable-rpath-install \
>>                    --with-shared-modules=${SAMBA4_MODULES} \
>>                    --bundled-libraries=${SAMBA4_LIBS} \
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#98439): https://lists.openembedded.org/g/openembedded-devel/message/98439
>> Mute This Topic: https://lists.openembedded.org/mt/93261519/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

