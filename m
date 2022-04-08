Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA22BC35296
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7099.1649429929485487748
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 07:58:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=IcX9UtuK;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=1097df4ecc=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 238ETL8j023890
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Apr 2022 14:58:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=NRWdK9xXOfYc9UEsyeiEEnCTg8TyZkjzh4E6kN/WNJo=;
 b=IcX9UtuKIgzZ8AJpScOWRJATnl+ZW6OEa4S4iJGU3u9ec01CDrpVyT3deTzRC6OSbUpZ
 tU4Y6HeBU1CU/vN9FuT4MPaRmWjzrjE2dfeb1YCsg7ZyHlddlH4wfAZGnB9wu2VDXm7J
 5K1/gIhRSSGFY0KdWLZjpwnAAvHiqrhnIXHhCr8E2sGKkrTG2KywZ9ZA0vkWB1QHM/HG
 ZiiY2KiLcqPX+wkv/yDtjH/jAMo4JAkpvEAoXW0wBWWwslVWH8TRP0iJnjypq0+z2xWQ
 P5Q5w+tZWsFfu8Q9rkPxr+DmJf09jGuMOTXkR21h9y8iBKYvyNR82108KI/f81P4rouB QA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6bq25a7q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Apr 2022 14:58:48 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 238EvqQL021897
	for <openembedded-devel@lists.openembedded.org>; Fri, 8 Apr 2022 14:58:48 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2170.outbound.protection.outlook.com [104.47.73.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3f6bq25a7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Apr 2022 14:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hZ68jnEbuVNRgKQRvQBH+YEgOrtFuubxhr8XyBKOX8F9ih4eJiacBEPzrrjDYvf8bIJfFBcwlvNJMflk7ZB3kw8hHzKn4uCkpB5DPLyRPhKofTcTqW318PeNX8Mg5QgB9M1ApOJ3XLJZXW/rtz6MFq6ku6zVDAX2Q2qdF9jStQDbbC07moimjCyyaRrfIcOUQ9x4UHMTWV8k1ollWKDYVpcNaZGtOIKtc5hUFSTQzKldb3XNU5zIzqU8nzmx6cESkHDyZ5Lv/2MT2iuLA/wBvgME6Ay9aKWdr19drJR4gVxZw/+/3hfAXSWMhrkrE5Rub6z7AcaXOqMwjF8Ei5NK+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NRWdK9xXOfYc9UEsyeiEEnCTg8TyZkjzh4E6kN/WNJo=;
 b=ITkWO7kmeLLBoZUROXemVKDpBNsJCSBpmAkShql6a6wCuGCd/yCekJXVUdWkiYRw7zgmL9SOWNnn1LUxbXt0Ru0t8LVH95YhZHtstJDyHruWQzhoGhquhrizcKo5fof1YVCyWUVxS/Mj3iHhEnf3xKsEndRd+dJcfnRIrv+qWM86AjRxkQDtU2D3l1H2iqOjPSStXmtvUBiQXdQWyNib8Z2F7FRk/87Lv6MBUPrC+sKZsy79yb9F2Y7xyOkD+7lpnpdQNwfDRzQwHUINnwQ0jkK9qmFjuhHAlGngZjZIfzCTDN8osDiNfki9RHdFja5dot3L9TCo88S5YaaI6aiYPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.26; Fri, 8 Apr 2022 14:58:44 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4442:39de:d36c:b6ac]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::4442:39de:d36c:b6ac%6]) with mapi id 15.20.5144.022; Fri, 8 Apr 2022
 14:58:44 +0000
Message-ID: <5227143c-b4ef-91e5-bee7-c7b5e99f1bac@windriver.com>
Date: Fri, 8 Apr 2022 10:58:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe] [meta-networking][PATCH] drbd-utils: update 9.13.1 -> 9.20.2
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220406163557.12606-1-sakib.sajal@windriver.com>
 <CAMKF1srDf3-CrpGRD-+=hBt680qb3frAHkFFt5c2cg24f7K0BQ@mail.gmail.com>
From: Sakib Sajal <sakib.sajal@windriver.com>
In-Reply-To: 
 <CAMKF1srDf3-CrpGRD-+=hBt680qb3frAHkFFt5c2cg24f7K0BQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR01CA0055.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::27) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b07dff07-3ac6-4f33-8ea4-08da197046a0
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_
X-Microsoft-Antispam-PRVS: 
	<BN0PR11MB570916CAD7AD57C074FCFACAF2E99@BN0PR11MB5709.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wK8173W+KbZ8+nArdLcBtoj0rVIP52m54ZZwHALb6lqEdZcQf/zT/NgevWPAAKDlyGdTDnr9Ln4q5NLbhig9J2IUaBSw8wKA5AWxm2X3f2jVDazrGh0mUiXjz95mk9l46dbxOaIX+mciwVAiyq0kDAnopdK17zBp2W0NnTZdAGKAOn6r5chs14LXPluGmfON5vN1t6cRgbBDbkrxdxqgm2trCQaytAkLa5tq68m5Ndo9jckyhIdCB1IrwWdsry+YwAdANH7o+h2ayaZg2Y69bPmjCJpB0SFUiV+Ea47SoP4jPqzkkC2uJampZiQBrxZ9Rpi/VPhesnxaHBTHq5cjanSW2aprLIoHnCGevwA4vfgUbX99Qz0xIo3s6uhJN8PqnjL0de+U2Qg1pto5yBAtr/yxsK4lQhnWG6FoxF68xz1mZKbKjB9v8zq5pFPz91pGX76rYf9ABpD3c17NHAWY3Ei/TC/+/hZA/x7bNNjD+GHVxIjthgiIKMlJaW3a5Jw4pAPdng+r7O0kgYq0FQKslZD1BZeo+/8RCEiE+XV15ACUfAevvmoLWMgV7/KsO7DQUywl6R1UF8HT8Sp/irfQx9afckdZe2SlQbCsj+sEzULtpXDXDW3GZy8GKdvV79xqSdmX+//Ds5W2kcIxPrnnkWlw02BU2x+dRdMYXMD3kP4JwYYAj9u1+DD0MuFDT3ItFZSFu+gjuNuPNd4CXrxy+Htd6cUc9N7ge3tasfsctudAgeb/DcKMlFCajxOYt1eLAuJU1Nq2MCrLTmuqOYGyF6GQFV821CSIIwEww4qiM8GZoMYquViwfcJ6jFYTjRhtq/ecb7/P9Rx5KT6lMOTvLtVX0siLpc/GYgK67261dDEccc30QxibjwSRwI/mbO2I
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(316002)(83380400001)(6916009)(26005)(186003)(2616005)(31696002)(86362001)(5660300002)(4326008)(53546011)(52116002)(8676002)(36756003)(66476007)(2906002)(66946007)(66556008)(15650500001)(6506007)(6512007)(6666004)(30864003)(508600001)(6486002)(966005)(38100700002)(8936002)(44832011)(38350700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?djUxcUlidWNwcW9DL3p1MnoyN0I4dGU2dmVxRVJFbDFVdThLNkZ3c0tiRE9z?=
 =?utf-8?B?UzBvNm5aMGphOWNsNzNZdXdjTUF4eUg5RlZHdEt3TmdCVFREanlKeEFTZkkz?=
 =?utf-8?B?c1lBU0t2dmdvY0ZaZDYzS0hwalFLTHRkMzl2VmIwQU9RTFM0RUpPWTJYdFhS?=
 =?utf-8?B?MmQrOUlNMDRWVjNVR2hCeFRhcGljb09sU1RRMk1mcmRBSVFmdkNxTEN3Nlha?=
 =?utf-8?B?U3BhdTZOcE5HemR0TVphQVNjZzVjYXQraDRaaStOUHhndzd4ZU5nZWdGRk80?=
 =?utf-8?B?OEF2SDVxdnZaSTRTYXFpMlRrTXFVclZ4eVFRei9lSDUrRGJQOG11NUhLZ0FS?=
 =?utf-8?B?RytmNEhtdjVwL0NoY0xqdXRYUStPc2hHaFA5MjNUamVaUFJkQTgyS1dFbmww?=
 =?utf-8?B?UU5JazZHN0RnT0FSVFZNRERUTXVRREFvbHFXeTI4RS9SMTJ0aTl4MVNXWVZ1?=
 =?utf-8?B?S1ZHMU5FNXlGY3dBS0pCcEJmZTVFWmVsZ01TR0d3R0R6V2xXeTlhaXMyMXM1?=
 =?utf-8?B?K2Z4bDFMWnlIVFNGVFJSdForUnE2ZHRrdExnWHpZQmlKbTZzZnRLUmFCaVU3?=
 =?utf-8?B?aUZJTnBxeVpvbkJ2TldkSUE5TW9sSkJleUZUcFNCYkZ0OGV2VDUvQUxtNnpT?=
 =?utf-8?B?MnRWOW1sanZmNXhzVktnSkRJejhZaUd0cUdYRHh6ZHNnWEpLcFR4aWtmblpM?=
 =?utf-8?B?dkxWaGt3UGYzTU5YQmZtV0pQWDJ3Ti9HOHIrWm1va1piSnMyRjNLTVB6WklE?=
 =?utf-8?B?RVlxUVdnU3pVSmdNU0x4L1JWZjFxOHk0YTBHMHlBUXlOUjNsc242RTVESEd6?=
 =?utf-8?B?Z21KM0R0YjYyaDBYQktvMmx0MVpiUWhrNmQ5WHdsVnoyQU9nSko0VE1kQ2M5?=
 =?utf-8?B?Mjh0cFFSN1BrTXBITk8yZWFhK3E0K2NadDZ3Sk9Mem9tN2puTWhqWGN2K2Uv?=
 =?utf-8?B?VkJDRlRKN0V0a0pQUFZ6dGJkcmVheVAvaTd0azNpK1ZFaVMvN2tjcW5DZmxM?=
 =?utf-8?B?L1Uya1YvQUkrTmZDNlRFcWZ3NFBsMW5qNGI3dFpub3dpdXF1d3ZCcW1GWlg2?=
 =?utf-8?B?ME5aSm9ETWlCZW9RRTFDaEtBWTBNV3JaRzFuWDhmL3JkUUFGTnN4YjNHZGJy?=
 =?utf-8?B?ZHhKS1UxRXdWOHdLcDNvM282SDVzQVlPS0Nnby9MMlBjbldra0JTTTl3OVla?=
 =?utf-8?B?ZDhOZklmc1pRcHdabnB4MTdmRUEvcTVKUmRObU1hc3VYTmxrS0xVY05OeFoy?=
 =?utf-8?B?VjFUeE54UUNLVEo5a0NCTHd0eExzdm45MUxmcnhCU1RNWFJEcWZVRlFuKzhH?=
 =?utf-8?B?Si93VHpER2lieFBhS2FJbjMxU2E5dFpneG5iS295dEdiMjNsckhpL0pSbEdn?=
 =?utf-8?B?QXlpVEs3NGoySkRBbithUmZwVWRiSFVodmdzZFpCS1pmZGZyNVlFK1hnZms4?=
 =?utf-8?B?dnVubVBTV3hoZlJPbjcrZExHNVBZV0k2VnFNcmE4Z1FOWEo2TWtDVTBBRGtI?=
 =?utf-8?B?VGs3a2h2RFJubldMNnFLYnJhOVp1QXY3UHd4cEd2VURjZDJDUUJFTGhodmds?=
 =?utf-8?B?N09JZnFITEYrVGlrL1d4cFlzSzFEek80eDJlQzMwRWlNSXFFVkF4aHdpZGdQ?=
 =?utf-8?B?MmFsRTBncnVkMlJVVEwwVXc5akI1aGNjSFRLcTNLY1duek55TmRLZjQzRlhB?=
 =?utf-8?B?bUtYMVozZTMxa0tXeVZLS3A2VnQ4R1J3Qkx6RjhOU0h5WVQxb3c2aERKUktR?=
 =?utf-8?B?ZDJiVVBXUm1vYnFHeUdzM3E4YlV4YkVySFFlMUoxUGl3YnFEcWs0ZFRzVWxH?=
 =?utf-8?B?Ym5MaEpaTG9PcjFGWDZqZGxnRjI2VDlsUjFWMmNWdzZhTUQzTkRtWFlCTjVR?=
 =?utf-8?B?Tm9PWHdTWitQQjVOWnE3NEs0QUFuR3ZBcG52UDFNKzN3VzJmem9xcW1mWTE2?=
 =?utf-8?B?UXZQTmxVLy8xU2xDMDNTZ3ppWVlyU0h3UHd4SFhQbVc3WTRweWZRa1ZKd1hS?=
 =?utf-8?B?VXZmbm9UQlJxNFc5bEpOVXhFTVBxMlZmSzJmMWJOV1Blc1ZrRm8zdEJxSS8y?=
 =?utf-8?B?YXlPeWh1N00wS2xCSEZXN3B0RStKVmZNWlRjMmJ0bjlSR1hyb0lCVjUzYm11?=
 =?utf-8?B?MlVmSnQyaWRPMnFOL3laNkVGbkRHQ0l5OTZwMkFZLzlQQU1XRmNoVDcycmVx?=
 =?utf-8?B?S0pDRDhjdnZmZ0E2eTJoTmFrN3FVbGs4c2J2NDdUSjVHZlM1SFJ3Ti9zQk1p?=
 =?utf-8?B?U3NoU3FaaFZXYXBSb3VscTc3Q2lZMVF4SmJSMWIzZFRzUSsrNEhNSUxVeDNj?=
 =?utf-8?B?ZTFHbGV2WWpyRTdGaFNZdHFpbFlEMjhZbC9RWlc2SVZBeTRQZFd5Nkp4VGlY?=
 =?utf-8?Q?iUSNDb7LOj70J6as=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b07dff07-3ac6-4f33-8ea4-08da197046a0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 14:58:44.0336
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PJz0+FM20e3LsQjFzV2MdBHfWXsWHVmckzxLtwMG2PXf5xBrvponbz2/mRhQMhCJeJ30tttYy9yO3YXJAWL8XuCXvAmpc7ARWZ3raRz2XvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5709
X-Proofpoint-GUID: JlTbPW7QW4zSLZilUEWEzm80u3OmDAA_
X-Proofpoint-ORIG-GUID: rSwHm1vpwjOHZqPRC6W2A1K3GYtn-o7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_05,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0
 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 malwarescore=0 clxscore=1011 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Apr 2022 17:09:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96478


On 2022-04-07 15:30, Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> fails with clang
> https://errors.yoctoproject.org/Errors/Details/654033/
>
> Perhaps we need to pass -Wno-error to silence this warning.
>
> On Wed, Apr 6, 2022 at 12:36 PM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>> Dropped patch which is merged upstream:
>>          0001-v84-Make-setup_options-definitions-as-extern.patch
>>
>> Refreshed patch:
>>          0001-drbd-utils-support-usrmerge.patch
>>
>> The compiled binaries are not linked to LDFLAGS options provided
>> by the build system cause QA issue:
>>          do_package_qa: QA Issue: File /usr/sbin/drbdmon in package
>>          drbd-utils doesn't have GNU_HASH (didn't pass LDFLAGS?)
>> Add LDFLAGS when linking drmdmon binary.
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   .../0001-drbd-utils-support-usrmerge.patch    | 39 +++++++++++--------
>>   ...001-drbdmon-add-LDFLAGS-when-linking.patch | 26 +++++++++++++
>>   ...-setup_options-definitions-as-extern.patch | 32 ---------------
>>   ...d-utils_9.13.1.bb => drbd-utils_9.20.2.bb} | 13 +++++--
>>   4 files changed, 58 insertions(+), 52 deletions(-)
>>   create mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
>>   delete mode 100644 meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
>>   rename meta-networking/recipes-support/drbd/{drbd-utils_9.13.1.bb => drbd-utils_9.20.2.bb} (85%)
>>
>> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
>> index 5e128727d..d976680e3 100644
>> --- a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
>> +++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbd-utils-support-usrmerge.patch
>> @@ -1,4 +1,4 @@
>> -From 642b5823abeee27a0fdc2d12d0e1235461ace9ed Mon Sep 17 00:00:00 2001
>> +From 83764f5d57b3370e0b04a70f814ca49237a66eea Mon Sep 17 00:00:00 2001
>>   From: Changqing Li <changqing.li@windriver.com>
>>   Date: Thu, 5 Sep 2019 18:57:39 +0800
>>   Subject: [PATCH] drbd-utils: support usrmerge
>> @@ -6,18 +6,19 @@ Subject: [PATCH] drbd-utils: support usrmerge
>>   Upstream-Status: Inappropriate[oe-specific]
>>
>>   Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>>   ---
>>    configure.ac         |  2 +-
>> - scripts/Makefile.in  |  4 ++--
>> + scripts/Makefile.in  | 10 +++++-----
>>    user/v83/Makefile.in | 14 +++++++-------
>>    user/v84/Makefile.in | 14 +++++++-------
>> - 4 files changed, 17 insertions(+), 17 deletions(-)
>> + 4 files changed, 20 insertions(+), 20 deletions(-)
>>
>>   diff --git a/configure.ac b/configure.ac
>> -index 4df1b4d..c4ef1bc 100644
>> +index ae575586..3d7deeae 100644
>>   --- a/configure.ac
>>   +++ b/configure.ac
>> -@@ -176,7 +176,7 @@ AC_ARG_WITH(tmpfilesdir,
>> +@@ -180,7 +180,7 @@ AC_ARG_WITH(tmpfilesdir,
>>    AC_SUBST(tmpfilesdir)
>>
>>    # set default early
>> @@ -27,22 +28,28 @@ index 4df1b4d..c4ef1bc 100644
>>       test x"$with_udev" = xyes ; then
>>          if test x"$PKG_CONFIG" != x; then
>>   diff --git a/scripts/Makefile.in b/scripts/Makefile.in
>> -index fbb0beb..da701a1 100644
>> +index fcd298e9..2521fb08 100644
>>   --- a/scripts/Makefile.in
>>   +++ b/scripts/Makefile.in
>> -@@ -75,8 +75,8 @@ endif
>> - ifeq ($(subst both,systemd,$(initscripttype)),systemd)
>> +@@ -88,11 +88,11 @@ ifeq ($(subst both,systemd,$(initscripttype)),systemd)
>>          install -d $(DESTDIR)$(systemdunitdir)
>>          install -m 644 drbd.service $(DESTDIR)$(systemdunitdir)/
>> --      install -d $(DESTDIR)/lib/drbd/
>> --      install -m 755 drbd $(DESTDIR)/lib/drbd/
>> -+      install -d $(DESTDIR)/${nonarch_libdir}/drbd
>> -+      install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbd
>> +       install -m 644 $(SYSTEMD_TEMPLATES) $(DESTDIR)$(systemdunitdir)/
>> +-      install -d $(DESTDIR)/lib/drbd/scripts
>> +-      install -m 755 drbd $(DESTDIR)/lib/drbd/scripts
>> +-      install -m 755 drbd-service-shim.sh $(DESTDIR)/lib/drbd/scripts
>> +-      install -m 755 drbd-wait-promotable.sh $(DESTDIR)/lib/drbd/scripts
>> +-      install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/lib/drbd/scripts
>> ++      install -d $(DESTDIR)/${nonarch_libdir}/drbdscripts
>> ++      install -m 755 drbd $(DESTDIR)/${nonarch_libdir}/drbdscripts
>> ++      install -m 755 drbd-service-shim.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
>> ++      install -m 755 drbd-wait-promotable.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
>> ++      install -m 755 ocf.ra.wrapper.sh $(DESTDIR)/${nonarch_libdir}/drbdscripts
>>          install -d $(DESTDIR)$(tmpfilesdir)/
>>          install -m 444 drbd.tmpfiles.conf $(DESTDIR)$(tmpfilesdir)/drbd.conf
>>    endif
>>   diff --git a/user/v83/Makefile.in b/user/v83/Makefile.in
>> -index 27516de..b301376 100644
>> +index 08cfe574..4c4971b6 100644
>>   --- a/user/v83/Makefile.in
>>   +++ b/user/v83/Makefile.in
>>   @@ -96,19 +96,19 @@ install:
>> @@ -73,10 +80,10 @@ index 27516de..b301376 100644
>>    .PHONY: install uninstall clean distclean
>>    ../../configure:
>>   diff --git a/user/v84/Makefile.in b/user/v84/Makefile.in
>> -index 38977c6..05ef060 100644
>> +index 0fcefc5f..81f7d5ec 100644
>>   --- a/user/v84/Makefile.in
>>   +++ b/user/v84/Makefile.in
>> -@@ -109,19 +109,19 @@ ifeq ($(WITH_84_SUPPORT),yes)
>> +@@ -110,19 +110,19 @@ ifeq ($(WITH_84_SUPPORT),yes)
>>          install -d $(DESTDIR)$(localstatedir)/lib/drbd
>>          install -d $(DESTDIR)$(localstatedir)/run/drbd
>>          install -d $(DESTDIR)$(localstatedir)/lock
>> @@ -104,5 +111,5 @@ index 38977c6..05ef060 100644
>>    spell:
>>          for f in drbdadm_adjust.c drbdadm_main.c drbdadm_parser.c drbdadm_usage_cnt.c drbdsetup.c drbdtool_common.c; do \
>>   --
>> -2.7.4
>> +2.33.0
>>
>> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
>> new file mode 100644
>> index 000000000..bdc173fa9
>> --- /dev/null
>> +++ b/meta-networking/recipes-support/drbd/drbd-utils/0001-drbdmon-add-LDFLAGS-when-linking.patch
>> @@ -0,0 +1,26 @@
>> +From a61b9ff2d2cb7387a5cd347b2201535ee45a46ee Mon Sep 17 00:00:00 2001
>> +From: Sakib Sajal <sakib.sajal@windriver.com>
>> +Date: Thu, 31 Mar 2022 15:09:58 -0400
>> +Subject: [PATCH] drbdmon: add LDFLAGS when linking
>> +
>> +Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> +---
>> + user/drbdmon/Makefile.in | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/user/drbdmon/Makefile.in b/user/drbdmon/Makefile.in
>> +index e07eb772..17166098 100644
>> +--- a/user/drbdmon/Makefile.in
>> ++++ b/user/drbdmon/Makefile.in
>> +@@ -51,7 +51,7 @@ $(dsaext-obj): $(basename $(dsaext-obj)).cpp $(basename $(dsaext-obj)).h
>> + $(integerparse-obj): $(basename $(integerparse-obj)).cpp $(basename $(integerparse-obj)).h
>> +
>> + drbdmon: $(ls-obj)
>> +-      $(CXX) -o $@ $(CPPFLAGS) $(CXXFLAGS) $^ $(LIBS)
>> ++      $(CXX) -o $@ $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS) $^ $(LIBS)
>> +
>> + # do not try to rebuild Makefile itself
>> + Makefile: ;
>> +--
>> +2.33.0
>> +
>> diff --git a/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch b/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
>> deleted file mode 100644
>> index 6702f3bde..000000000
>> --- a/meta-networking/recipes-support/drbd/drbd-utils/0001-v84-Make-setup_options-definitions-as-extern.patch
>> +++ /dev/null
>> @@ -1,32 +0,0 @@
>> -From d095caf6f8f77fe056fb90ccd5d89c207a7f346d Mon Sep 17 00:00:00 2001
>> -From: Khem Raj <raj.khem@gmail.com>
>> -Date: Wed, 12 Aug 2020 12:59:38 -0700
>> -Subject: [PATCH] v84: Make setup_options definitions as extern
>> -
>> -This is already defined in drbdadm_main.c, therefore make this
>> -declaration to be extern for other modules
>> -
>> -Fixes compatibility with gcc-10 which uses -fno-common by default
>> -
>> -Upstream-Status: Submitted [https://github.com/LINBIT/drbd-utils/pull/7]
>> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ----
>> - user/v84/drbdadm.h | 2 +-
>> - 1 file changed, 1 insertion(+), 1 deletion(-)
>> -
>> -diff --git a/user/v84/drbdadm.h b/user/v84/drbdadm.h
>> -index ed63d78c..8469f1c4 100644
>> ---- a/user/v84/drbdadm.h
>> -+++ b/user/v84/drbdadm.h
>> -@@ -251,7 +251,7 @@ struct setup_option {
>> -       bool explicit;
>> -       char *option;
>> - };
>> --struct setup_option *setup_options;
>> -+extern struct setup_option *setup_options;
>> -
>> - extern void add_setup_option(bool explicit, char *option);
>> -
>> ---
>> -2.28.0
>> -
>> diff --git a/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb b/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
>> similarity index 85%
>> rename from meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
>> rename to meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
>> index a246464b2..d9cd94c04 100644
>> --- a/meta-networking/recipes-support/drbd/drbd-utils_9.13.1.bb
>> +++ b/meta-networking/recipes-support/drbd/drbd-utils_9.20.2.bb
>> @@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5574c6965ae5f583e55880e397fbb018"
>>
>>   SRC_URI = "git://github.com/LINBIT/drbd-utils;name=drbd-utils;branch=${PV};protocol=https \
>>              git://github.com/LINBIT/drbd-headers;name=drbd-headers;destsuffix=git/drbd-headers;branch=master;protocol=https \
>> -           file://0001-v84-Make-setup_options-definitions-as-extern.patch \
>>              ${@bb.utils.contains('DISTRO_FEATURES','usrmerge','file://0001-drbd-utils-support-usrmerge.patch','',d)} \
>> +           file://0001-drbdmon-add-LDFLAGS-when-linking.patch \
>>             "
>> -SRCREV_drbd-utils = "b24b0f7e42d500d3538d7eeffa017ec78d08f918"
>> -SRCREV_drbd-headers = "c757cf357edef67751b8f45a6ea894d287180087"
>> +SRCREV_drbd-utils = "087ee6b4961ca154d76e4211223b03149373bed8"
>> +SRCREV_drbd-headers = "f1529aa84e9d2f66c96ad283a1bbb708aabf03f7"
>>
>>   SRCREV_FORMAT = "drbd-utils_drbd-headers"
>>
>> @@ -40,6 +40,8 @@ EXTRA_OECONF = " \
>>                   --without-manual \
>>                  "
>>
>> +CXXFLAGS:append:toolchain-clang = " -Wno-error"
>> +

Forgot to mention this was a V2. I do have the line that you suggested. 
Do i need to add something else?

Sakib

>>   # If we have inherited reproducible_build, we want to use it.
>>   export WANT_DRBD_REPRODUCIBLE_BUILD = "yes"
>>
>> @@ -56,7 +58,10 @@ RDEPENDS:${PN} += "bash perl-module-getopt-long perl-module-exporter perl-module
>>   FILES:${PN} += "/run"
>>   FILES:${PN} += "${nonarch_base_libdir}/drbd \
>>                   ${nonarch_libdir}/drbd \
>> -                ${nonarch_libdir}/tmpfiles.d"
>> +                ${nonarch_libdir}/tmpfiles.d \
>> +                ${nonarch_libdir}/drbdscripts/* \
>> +                ${systemd_unitdir}/system/* \
>> +"
>>   FILES:${PN}-dbg += "${nonarch_base_libdir}/drbd/.debug"
>>
>>   CLEANBROKEN = "1"
>> --
>> 2.33.0
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#96439): https://lists.openembedded.org/g/openembedded-devel/message/96439
>> Mute This Topic: https://lists.openembedded.org/mt/90293849/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

