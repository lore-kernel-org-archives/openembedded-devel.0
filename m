Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62599C433F5
	for <webhook@archiver.kernel.org>; Thu, 30 Dec 2021 04:02:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.60591.1640836921184775113
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 20:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=RHRJ+hLl;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=8998eaba3b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BU420C0013883
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 20:02:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=te+KYfDUt+VArpYi9rrCqAhfIEQJ27FXtMpfK0GykZQ=;
 b=RHRJ+hLlChl/6EQVst4tk0Mj4h/H9LZM7EkDsv2J9NaIVGIqDvb34Tl/fdesTeN5rUIn
 vl2siL5w4ee1YjEbN2fk4tmVINDG+dyoeCGsWc0X0d7n+WIatW9sKTrWrAykavaKT/ib
 mgNCVQJZPztSfqBzcI5UI+Ii3W54W67SFLg1P7XgeCyEWeACmUdJiR858wR5+FpDs5Al
 NHzKiv5N9DVW6SfVJefleCbo7pjUvXmVtdt6VBR4X6j7/lMBiC7sDpxvwGWrowoQIBxc
 aIJ1mRliqmSSEHZjOU06EQo7De/0pMgw0N2K0Ve6/BvaU+DmOXBn88lGT7zrEl3hMkPJ EA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94k6r0j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 20:02:00 -0800
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 1BU40pb1011798
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 20:02:00 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3d94k6r0j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Dec 2021 20:02:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+fuolrA/ck0AJeJOFz28aD+5rCaAgNU+juVsLxKUXXADdeTkf41e6w/LDjSvvNGW/xGfB3mlMYUHc8WBI5ML6GpRxyRWA1LNG8cAUl3q350K7VRM4h9FMoS/RKvtaGvl6Jb+66wjYou+TshniYr7g1AByud25Nkz+s87bVaRoW+wDyno9rAEcNpiLGBVRmMwdtCoIpf5Xht5kXXXjGBNLkX1ifY0Pp0OcE16KBbSLXvz/5tjw1dt0+joyTE91Bv7PMjnrtvstmDe9Jn73McINmjxgQEaXqqRjg+MysaDAlj03JsVuM02If1tnw7LUSsClv6Qhh+VKZVKHRDduJ4Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te+KYfDUt+VArpYi9rrCqAhfIEQJ27FXtMpfK0GykZQ=;
 b=Z73Ynv4HKJvEng+AmMthy1vIE9ZUImWm/JlWXjM5L/jYbX+J49mJ3kCt9EH9gA1LGTsSokT8Ys/ohds+piSdEpCQWeU2qyUk86UMQSH9THNbNy3uNqqCT23HeijtnZITM7+ASb/7THI/gj+Jshhdg2wv4EzITVKPBoqyEATgeHceLVRZM4JcF0l4UHAsxieFaG0nEqC6NVTazFxKRpEauNyNOP2rZsRu38lV96EZlfd+4ZkvUu+5OHUev/zD/vJsfO8Nh9KKc1tB0//PDPkLzKawgW5V3AnTyvVxuJtv5h0+G1YAALppMrh2C3JL9+26J45XeuB8zeKpd/HfcQ1dtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1677.namprd11.prod.outlook.com (2603:10b6:301:c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Thu, 30 Dec
 2021 04:01:58 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8962:26c6:20fe:eaa4%5]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 04:01:58 +0000
Subject: Re: [oe] [meta-networking][PATCH] dhcp-relay: regenerate configure
 for bundled bind
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20211230021012.1046899-1-yi.zhao@windriver.com>
 <CAMKF1sp=TiWg2bcC_RF6wGka-0nzAzpD--d+d6=-vWqFHtn-Qw@mail.gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <5a517a00-ef93-4b9d-402f-616d4443edbf@windriver.com>
Date: Thu, 30 Dec 2021 12:01:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: 
 <CAMKF1sp=TiWg2bcC_RF6wGka-0nzAzpD--d+d6=-vWqFHtn-Qw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK2PR02CA0209.apcprd02.prod.outlook.com
 (2603:1096:201:20::21) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07040c1a-f7e5-41d3-1c1d-08d9cb492028
X-MS-TrafficTypeDiagnostic: MWHPR11MB1677:EE_
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB167705A7B43638457075660BF9459@MWHPR11MB1677.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7lPaVY0QKMtc0YM1cTry0CWSEKgmyWJ38zW7/EfjYR24A4mfP4BV3hZOSpAAmBKTHOBRC32irYdH+U+d12ICZFnLV3jI40fh1zM1vNKThtNRHg+ImYpOZ5MpaZr4e4vC0D05r6K9PKAnqgn3EbgwBs325G6naW+21qY4Das46RbF/HoFeSN6Z+ULeY8wvH/ggGxb1mH3B3CwPXv7v5npWj5K/8MzC/ezAUIZPiksZWf0ryRmOUwOtnL0EsldaGhFdyjvPx0RH/l+fYYPIMqxPV/UyeXsvLSZSuH2Q9ajB28ONaiQZFRB2PcXaarYhfJsx9OROCFJaRNN6o72ogD/YAkvBUf+fK/vfG/mO5rIX14xBIRzf3+s1YqQusEyjKJKbIshkQj6hQR7Vb9au3unvUYYbIvYb4B3rkdEgppdE6EI06G3Jd4SQ9fJNkYV8tJSVlqaXGI1KDTDvDYqqgQ8uNmbWLu5yNj53XDvkFnbBCBIOX+OgVol+GDlbVC2SsDSZQJOeoUO3GuKpuGjk3fQcpNl4bJ4756KX8XT0AG9MqFpMV+LLei2jUe6GxpufbLGbUYF3G8PgA8KT/T7SlrQlyjbZMPhQdNBf2qDU5spSeVWpk1PJUGF3mr+EgSFTa+HHQMdiR4lezeYIC9TARGMUgROoIRYMDfLiKpAruaLYn8Oj+jRNluvH4LLQMFLl1Yf1VAZK/+1/qaa2/eeobcPBkRSO3pNCbc8NhvGpYrucwyqA/vXRZqEw6PgEiuxaFxz105bb13268GkEPZ5Xcdd91w/bdT2QGPzJam8k9jwWCGyvbqwJVuRjXy88g7RTJt/DYLdCNtnvDCBFgczxeeIpO/whATR+zY+xoSK3Wzj/msnGdWwB0d1U3Bfx1YrHFjo
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(66556008)(66476007)(31686004)(31696002)(186003)(2906002)(83380400001)(26005)(86362001)(966005)(38350700002)(53546011)(66946007)(6506007)(316002)(5660300002)(38100700002)(8676002)(2616005)(6512007)(8936002)(6916009)(36756003)(52116002)(44832011)(508600001)(4326008)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z1kwTzBhRkMvSUFJa0UwNUYrMWs4dG1malF4TGZyS1RESzNqNTVsMVFSL08v?=
 =?utf-8?B?TzdYNVhyeDlVblhsS1JTYUpoQ3VONXNjVlVSZzE0N2RxckZHdWQrd0hnSmlP?=
 =?utf-8?B?Z3VkOENpekJNQis2Wk1QRHJ3ZzZ3SjIvcjdUbFlwRDlKY1N1bzFDTW84VVZV?=
 =?utf-8?B?NkUrclpJZGllcVUvdnFpM2xIaVE1Ni9ZWDkyS1ZzNjRaVmk2MEdDNDJpTkxY?=
 =?utf-8?B?ZUpGM3NaSUQ0YVVvRS9OUnhkbGFQWlJweDlmN1owN2xvRUI5cjJvaGhSWFlr?=
 =?utf-8?B?enV3V0N6RWtHeXdMVUMxN2FDdWh2Tjd6d09GMHpqbFR1aExvRlVQbTB6TDBF?=
 =?utf-8?B?QVJOOGg3MmZ0U2I0b216NHUrS0YzT3N5VmFqZGx6cXhtZjVKQ0pNWCtIZzM3?=
 =?utf-8?B?eW9LUTcwYmg0L0hYRnk1SG1EZ1RRWUtmT0F1Ymh3ZFFQU0tvY1puVklSWUEv?=
 =?utf-8?B?WUh6ZkExcW5Meko2aTFxRnlDditjSWhRSTU2TmxrL0ZCbkFaVXJOZ1hpbGtn?=
 =?utf-8?B?YTFjR0haRnNyazI4cTlMdll3eFhVYjVVSGNBdDkxSFg2Z3NpYkViNjVEV2pW?=
 =?utf-8?B?T2Y2cGhxZFlrSElIRkFrWXQyWFNGT2xGM3BjNDJEbW5mQ1RsbDlSSG1SblVz?=
 =?utf-8?B?ZlpGV0QwWnpGWW5HOHovdlNpdDN1ZjdjYVJlbFVhM29GOHBmZ1NRbityV0Za?=
 =?utf-8?B?V3BwS09lWndwTzJTMnRnQlppZUJRMEdqdDNDYjA2WHFLMVFqTGZaRW1Tclgr?=
 =?utf-8?B?emV4dmpYRmduL3YybkI2WDZsZjM2SnpxSUsxQ29KaFRKM0wxR21Fa3NOV3Rv?=
 =?utf-8?B?WVNTUFlGMDdXWmxtNmRFbTdtVHdUR2pvNVBvVGI1UjFOZEN0S0krQmRYdU5P?=
 =?utf-8?B?MnFuZ0xSYTYyZjUwUUhHY1BWQzhvNFQ5L3l4ZnUramM1Zm9lbjNwRVA4NGpx?=
 =?utf-8?B?NVFsWGhGbStmckFuQ3dJcmxPSG9lT2tpSDhKWXFITnc5bUprc0VGSVFVWFpM?=
 =?utf-8?B?Qlg1cG5Kd0pGME1DSWpHajNidDVaaStiNXdoNDNic3lVVDJ5andqdlNGdjU1?=
 =?utf-8?B?Q0V6Z2hLNjVWZEdqYkxxTEVKM2x5WjFlV0NSV1JPeGVyQ2RlQjNTQmgva3Mz?=
 =?utf-8?B?bDlmMXZDRU82dDNJQ2JhdzlyZGJqZmg4QlRvUVdBTzZ4MGNKTTJRWGRBRnNa?=
 =?utf-8?B?cFp6Yll1YUxFY2lXQ1ZNUnlSaW9LeTRVU1UrTXVDSUVGNDQyMWZRVW5hOE0r?=
 =?utf-8?B?QytQenRNTlBuZ0ZyaWJqWTR4RGxDajcxWWR5QkRSeFlBdGczd2pUaWQrcWxB?=
 =?utf-8?B?SHVycy9DVnhlR0U0czBpSDlZUldMaU5kVVhKN2JCUmd0SjNYU2E4dmUrYmdy?=
 =?utf-8?B?clo4bFNUSzkxVW1OMlNBM3RWUlQxc0x5blgxSDlsamI3RGhxSEtQRVBzN0dR?=
 =?utf-8?B?ZGRHR1JDZ2tqbk9BNCtZQVFMT0x4Umo0ZzZtcmdzOGJ5M0pUVHpVYXYwNHAy?=
 =?utf-8?B?VXNTRk9LbEZOUUVhZEM4dFk2eHY3TjVObjF1RGZNTzJFcWFtWkRnRkhDWVpt?=
 =?utf-8?B?MXJYMWJzbHBxQk1NbGJ3c29XWkoyZEhabTVxd1VWNEdQV1JUZ25TOFJrYjRU?=
 =?utf-8?B?bFcyK3lGckpmZ00rb0pGWExQUzdhVXNPTkEwSE1qdG4xRk1OQkZHSitOZlhl?=
 =?utf-8?B?cDV1aHI5Q3BjZEpHZ25FeDMvZm13S1FsNU5FZlI0QWorZi9GeGh4L1h6NlJj?=
 =?utf-8?B?WURHT2NnaUhtamFjeTB1cDFIcFNFdzFmak9Bbmlob0haUHVOUlZsa1VtL3BZ?=
 =?utf-8?B?WmdxMGl6RHI0Z3BmODJxYUgva2xKM3JZR3IybVNnVDRZTDVybHhxbmFOY2pX?=
 =?utf-8?B?eHRXbzJUYnYvUzFQVkNWd0pHZUEyNUhkcUhuVWxEQW85bHdXTGpyNlcxaGtX?=
 =?utf-8?B?ZW9JYTlpSExLRlBlbXVodlZVUUFxQ3JONGtyb2IxVGFRMWJIalBJU2t6bjE3?=
 =?utf-8?B?OFlLY0JZV3VmVVYwbXhmUnpkM2JsV1hhMEprRG90MU1MM0M0TGFNOU8xYi9x?=
 =?utf-8?B?ZDA2NmtZdjNkVzJUMG1ZSGdUczliRys1OFVDbFg5RG1URmhQNzFYSUp3TGwv?=
 =?utf-8?B?T3hHRFh0ZmswdjhXT3ZYSm5LQ05FV1NOOU9yUzlDSUFVUDdPN05OcUF3OEli?=
 =?utf-8?Q?eIvAvuAoavwfP9Fng2JFnJU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 07040c1a-f7e5-41d3-1c1d-08d9cb492028
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 04:01:58.3441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PaKxPv1z20Hs6ZOGPqN/m7vJdB76sArUn8HWZ1Ou3iEznn0/WxgzLHkQsAmLsjAlK5aGbJpaV8mc6bPprKdTAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1677
X-Proofpoint-ORIG-GUID: ScEyoE2owEBSvXjkQvgoM9-cUFWffZT2
X-Proofpoint-GUID: yozWW9tFvL6-kqpZkh_oOiHF5Li_DGXM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-30_01,2021-12-29_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112300019
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Dec 2021 04:02:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94566


On 12/30/21 10:28 AM, Khem Raj wrote:
> On Wed, Dec 29, 2021 at 6:10 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>> Run autogen.sh to regenerate configure for bundled bind. Then we can
>> avoid copying config.*, *.m4 and libtool from external. This can also
>> eliminate the relink warnings in do_install:
>>
>>    libtool: warning: relinking 'libdns.la'
>>    libtool: warning: relinking 'libisccfg.la'
>>
> wouldn't this now delegate downloading of bind to do_configure ?
> if so then its not good.


No. we still download bind in do_fetch. and copy the tarball to build 
directory in do_configure:prepend.


//Yi

>
>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> ---
>>   .../dhcp/dhcp-relay_4.4.2p1.bb                | 14 ++-------
>>   ...ind-Makefile.in-regenerate-configure.patch | 30 +++++++++++++++++++
>>   2 files changed, 32 insertions(+), 12 deletions(-)
>>   create mode 100644 meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
>>
>> diff --git a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
>> index c86926813..f374d75b3 100644
>> --- a/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
>> +++ b/meta-networking/recipes-connectivity/dhcp/dhcp-relay_4.4.2p1.bb
>> @@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/dhcp/4.4.2-P1/dhcp-4.4.2-P1.tar.gz \
>>              file://0001-Makefile.am-only-build-dhcrelay.patch \
>>              file://0002-bind-version-update-to-latest-version.patch \
>>              file://0003-bind-Makefile.in-disable-backtrace.patch \
>> +           file://0004-bind-Makefile.in-regenerate-configure.patch \
>>              "
>>
>>   SRC_URI[md5sum] = "3089a1ebd20a802ec0870ae337d43907"
>> @@ -30,7 +31,7 @@ UPSTREAM_CHECK_REGEX = "(?P<pver>\d+\.\d+\.(\d+?))/"
>>
>>   S = "${WORKDIR}/dhcp-4.4.2-P1"
>>
>> -inherit autotools-brokensep systemd
>> +inherit autotools-brokensep systemd pkgconfig
>>
>>   SYSTEMD_SERVICE:${PN} = "dhcrelay.service"
>>   SYSTEMD_AUTO_ENABLE:${PN} = "disable"
>> @@ -50,17 +51,6 @@ do_configure:prepend () {
>>       cp ${WORKDIR}/bind-9.11.32.tar.gz ${S}/bind/bind.tar.gz
>>   }
>>
>> -do_compile:prepend() {
>> -    # Need to unpack this now instead of earlier as do_configure will delete the configure script
>> -    rm -rf ${S}/bind/bind-9.11.32/
>> -    tar xf ${S}/bind/bind.tar.gz -C ${S}/bind
>> -    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/bind/bind-9.11.32/
>> -    install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/bind/bind-9.11.32/
>> -    cp -fpR ${S}/m4/*.m4 ${S}/bind/bind-9.11.32/libtool.m4/
>> -    rm -rf ${S}/bind/bind-9.11.32/libtool
>> -    install -m 0755 ${S}/libtool ${S}/bind/bind-9.11.32/
>> -}
>> -
>>   do_install:append () {
>>       install -d ${D}${sysconfdir}/default
>>       install -m 0644 ${WORKDIR}/default-relay ${D}${sysconfdir}/default/dhcp-relay
>> diff --git a/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch b/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
>> new file mode 100644
>> index 000000000..d97b2f7c4
>> --- /dev/null
>> +++ b/meta-networking/recipes-connectivity/dhcp/files/0004-bind-Makefile.in-regenerate-configure.patch
>> @@ -0,0 +1,30 @@
>> +From db4bfa34ff6e083936bc7d62908790b4d9f0ed8c Mon Sep 17 00:00:00 2001
>> +From: Yi Zhao <yi.zhao@windriver.com>
>> +Date: Thu, 27 May 2021 11:38:36 +0800
>> +Subject: [PATCH] bind/Makefile.in: regenerate configure
>> +
>> +Run autogen.sh to regenerate configure.
>> +
>> +Upstream-Status: Inappropriate [embedded specific]
>> +
>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>> +---
>> + bind/Makefile.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/bind/Makefile.in b/bind/Makefile.in
>> +index 1058160..f9c9f86 100644
>> +--- a/bind/Makefile.in
>> ++++ b/bind/Makefile.in
>> +@@ -55,7 +55,7 @@ bind1:
>> +       else                                                            \
>> +               echo Configuring BIND libraries for DHCP. ;             \
>> +               rm -rf ${cleandirs} ${cleanfiles} ;                     \
>> +-              (cd ${bindsrcdir} &&                                    \
>> ++              (cd ${bindsrcdir} && ./autogen.sh &&                    \
>> +                  ./configure ${bindconfig} > ${binddir}/configure.log); \
>> +       fi
>> +
>> +--
>> +2.17.1
>> +
>> --
>> 2.25.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94564): https://lists.openembedded.org/g/openembedded-devel/message/94564
>> Mute This Topic: https://lists.openembedded.org/mt/88027875/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

