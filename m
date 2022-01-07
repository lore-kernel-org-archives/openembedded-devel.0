Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2502C433F5
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 01:54:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.1254.1641520438150461348
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 17:53:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ivrapBmQ;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=80064149fc=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 2071obv0011042
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 6 Jan 2022 17:53:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=XmIsS59V/ZQ8nSR5Lpl2v412MlGsaWMFVPppGdhGWl8=;
 b=ivrapBmQYy3TxypVSxE+wAIbjreQEvQJyXICUrpz7CU2xP6Y13VIAXfWQvURTHwjUg7B
 CHhni3gGxZ/txniZLijoO+YGoHfsxyujLuYMzjZqxbDZNYa+4OH+q5eS6MZ5VMAlTmOn
 c9Mo8Dd7VQGC6LrcVY+hc6Fj+IEkDZcI8L4Iv3rkH1bE/hmHSaDV0eVhlNiGIU56FJEn
 jyKFcyng/2kTx3NNAOh/d7CUe7y9iExLLz+RNZ7FR+ie1pUIFvZU80qX+UCCZ9UW0aJT
 8H88tGPEqP8svhjE+HNT+D/xLu8iPX90vV3v0G5wW/GOSo0goDr0bLx+8xzKDy53i118 OA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wag94w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jan 2022 17:53:57 -0800
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2071rv6U016330
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 6 Jan 2022 17:53:57 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2105.outbound.protection.outlook.com [104.47.70.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3de4wag94t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jan 2022 17:53:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U3HDuOj5MJGSGZnWGBh1Bu9sV+2p1NSmm23g+yqOq9fZ7PEZ+E3DG2R+O6I09EbzsYVo/J3KX8VnzkBOv4PCDfCFmg15MToxBAgb7iUdcsPV/kR3cAd/82dMAiK0YlAF/HLS1V0hPOIrizwmwGB+ihykqbQKKQcu07AIRLIjoOQTxa+40DHWMU2otaUUIxcTLstKEVm/13JD+8FeUZpGYPqFjS04PWawzjCE2+tGQGNMQJCTpuJrwLjQ3lzEV+4YfA+CeMypSjaNUnjZX4SVjmP2ZJ1NgDbAGqnEGvIy6y68e6l4M4Dm3ruaawbTGD9vdcSxctmmGmAsmv6dHv4BxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmIsS59V/ZQ8nSR5Lpl2v412MlGsaWMFVPppGdhGWl8=;
 b=P3w1wDgFPqz30ZT36onmpz6ciMlWFTYhXmhOC9xBm+oW7euKoSRnc+SL4q5FwWLyMmOChPWmwW+4m8pbRVY/tGX72N189TranhBBVBJxHaldmo0ObNTlWveWaSksfTZDNk8tHClo9viZaL+paSmrQVjRGE7/xBn49t/EKEU5qFkVs7ioNI7hXRAgL4X9Z00W2zxWHByFi9OIf7oENhMOhGzVedJwAaYekR5qyMAxx58XjpF9rCPdFLVDsR9INPQsUEsNKzBIkBk6snU949fk3zzuoI8/iB6+JjSGo87mnHHxGiEEs/dEG/W5H5HBi8WDgbn5M/OstTYTF9BiLI/GRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5636.namprd11.prod.outlook.com (2603:10b6:5:357::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Fri, 7 Jan
 2022 01:53:54 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::f1ef:f6f5:d3e4:27cc%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 01:53:54 +0000
Subject: Re: [oe][meta-oe][hardknott][PATCH] udisks2: upgrade from 2.9.2 to
 2.9.4
To: akuster808 <akuster808@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20220105075924.77639-1-Qi.Chen@windriver.com>
 <c72a57de-8f09-0459-11c1-6c79f50bc933@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <60d16ac2-6d2b-dd92-6dd4-efb4726a00bd@windriver.com>
Date: Fri, 7 Jan 2022 09:53:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <c72a57de-8f09-0459-11c1-6c79f50bc933@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 511cc4a4-95a2-4dab-63fa-08d9d1808f78
X-MS-TrafficTypeDiagnostic: CO6PR11MB5636:EE_
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5636C57A65C191B16FC7B45AED4D9@CO6PR11MB5636.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	R1rCGDg9No/U+SrHlwUBGjk0CMN7VjEmO5hA0ywzfWkj+SrvP9CCbu9f6HPsPmEz05q6e0vvmU20IAiBPsOCvl0Mfy5354oYgAZ/IjZ+uY+LyM8D0KJNuYc+87uFPosgtkEohTaP4Rld8ukmm5mp8huf2jcgYrxG69yzKjdpH/P8X2EoTZY+BE1u1x/OGA/Pw92L/KQmkPmr6k33CrQjBDrat+FKItUVa8bgMNtjxK/XhtBlbMnbHcSx1xPYlR2eHE1mlry2+9K1nlZXmxpMKkeVLsidDxoiJrN0l7HTpJU5nPnYjxFzac/i9nwkq0cTkX6LQmIddgJI2/RZZZtx6800F7lxfMzMqkx318CjefIpnXPwjD5LTJObyHJ06AwluKouDoLa6wd6xmXn9pJGjcx/gbXTIzUF/M3+1mCKySfJSYNy3YZ6w4tbW00V6rNXfVsi0sjtYsDi7NcPM33oOV2V7y3tassWw3SipGAV2/avzbql7mdoOuN/tXLgMP0Gt9RY8B+RIPJ8bSdBKEDUN+OWgNL59ZQhrcbCXFlm9PyDaobvPoPzeJCfIhXuSODwLZ9TplimegQ16E5HMjyyKltyk5lYQ81jxz2K18/n4X9e2ukEZ+qhhK6mijYPV5/tu5HraVEVUMCTyui/c/j+GbEjyN3BDUPMVp+9A9yDfPnGEO6ZxzoFm0D1pEt68wkntMp5aZvgd+czO6ZYEMQ0nV9RrOB8qEJlt5xjloBv8xgiI+TYT8bsui6bQsPppHBFsfO9NyOwf7cS5YnOBEfMNP+btWizU4UvtM6txz20NVRYJnZ+jltQNJQ0nrUs8HPhIkJTlDIEKUpcbZkkagx28UN+wnXa07nNuqzU/mTJppogo3OuYztkVjpA27u41MIFZV98qgmRlMtkPlTABrZIFQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38350700002)(186003)(66556008)(8936002)(5660300002)(38100700002)(86362001)(2906002)(8676002)(6486002)(26005)(31686004)(52116002)(316002)(36756003)(6512007)(66946007)(6506007)(83380400001)(2616005)(508600001)(53546011)(966005)(31696002)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?L3FjYXgwZmYrS1ltQTFqakRwcHRsUHIzbkFST1NuWWhCakFVV1NYaFpQZllo?=
 =?utf-8?B?QkRKK0tGVGxlSWtGcmZHUTZIWjVwd0d2SndjRUdxU0NhZTdIcVNYVTBwellD?=
 =?utf-8?B?cFRmYTdMczNyRFdFTnNwVi9LSWFEdDVRRFBqNXM2Yk9EK3hWUW5iV2FNdGNW?=
 =?utf-8?B?Nyt1Q2wzWE1zOEpMSG9Jb0taeVplek9veVNaVGdiNlRHbXpENXVKVGJOZ09V?=
 =?utf-8?B?UVErbDQ2K2ppSWNnMHFEbHB0K2o3MFhZY2Y4QjlmY3o0SXJCMm5uR0ZGOGNn?=
 =?utf-8?B?RnVjNXZRYVZjbDYweFlpYkdqams5aFZUNmdIL0c0QnVrUEZPVE9nS25wL3dK?=
 =?utf-8?B?RXVDVjZiV1RaalVwUmd2Q1V3eEc4VGloMytieXZqQU1tRXNYY3kwV0U4dnh2?=
 =?utf-8?B?NDJaWkR5WXBTVjVWUXA2QlpwS0M1ZUFwRzJKblhGbTZZVXVYM1VLd1RJMFYr?=
 =?utf-8?B?MjAxUmpVdzV6WWdjVHJOVEh5NEVuQWV1c1gyUVE2dDFkK1l5MzVaVzNjRW4r?=
 =?utf-8?B?Rnk5OGN0NUZjb0laYldQL3M3Vy9VQjZaWXpVSXVEZ055Q29uQndGaEw5V1BN?=
 =?utf-8?B?a3Z0NVBKaXdkY1YvSjNMMnVPc2lWVUF4enRNZDQvSFh3cWNlTnhFYzN3Vkph?=
 =?utf-8?B?eWJhWFB4RTl5SkhhUVVVejJXdHk2eHFhRWtXSVo5MHlrbEdWa2tNVXhUMkNr?=
 =?utf-8?B?K0ZWRGloR2x0cnRJL3FhVWZTSCt3dmlnYWpoWUxEWGFkZ3dKTkV0aUozVjF1?=
 =?utf-8?B?WEM1WWpaUjVjTE9Bdys4WnVkUDA3VERESmN6VzZPS2F0MjBwTk1JYURsM0Ru?=
 =?utf-8?B?OUtLblZpQkRMMXpPR1ovcVdPWGY2K0FWeHZ6SElGTWU4MStQZ2RKQVR1ZlJQ?=
 =?utf-8?B?Y2NHaWVGd0tPelVKUGJ4VzQ0NmRBRjIydjQ1K1AzdDFrYXlyM0ZuM2pLbCtn?=
 =?utf-8?B?bldHc3EvVVcydUgzRlJSK2Y4YmhaM205aFQ5U0w3TjVjcnJFRkNmSDdKSVFF?=
 =?utf-8?B?L0UraWNHU05PNzZWNHlkNy96SCtqSVNuaW8xWVN3VHEzUUxENjE0aHhFdDlD?=
 =?utf-8?B?aUgxVjV3Wk40VCswTk5jY1A3NFhuTjd0NGhJK3NlR0R4dE95OGtGQ3h3dmU0?=
 =?utf-8?B?TDBGZzU1WUxvLzd4RXRWZ1F1bUthN2V5RzNZdzljYk53Nk5WSU5WOGdsT21k?=
 =?utf-8?B?dURRQnpIY2lMb1B2L0FzUTZDTTZ3QTZYZUxheThEZWQ4YU40eDlXNFNzZjZ1?=
 =?utf-8?B?bU8weTZqckFrVXhUa0VBQmh3RHFya2t1NTdZc1VZWi9GenNCTmVNaVgrKzU1?=
 =?utf-8?B?TURXRU93dURrNDFVdlV2b1V5aEoyWWo5dkFlS2VPSVJsNVBVcElINzFKUlNz?=
 =?utf-8?B?M2lCMmlEeDhjaTdxNDNUZnpxSHorSC9YSURnazZnUFpsNlZlR2FOQXB3YWk4?=
 =?utf-8?B?RFJCM2hWVVh2Um1EdGtGaDJuTFYvL3lQUXlvc2tOZGRnSHZCL0ZZVnYxS3Fi?=
 =?utf-8?B?Y29UeEI0WWxicEk0aUpJQUNCMmJVMGQ3YjVoV1ZoR0Y3cFZ5dFJodzMxMFp5?=
 =?utf-8?B?WTlyLzBBK1UwM3FVRW5oNERPa3o2MEQvUmkzUU53bzdsN0UxeXJPMFI1b0tJ?=
 =?utf-8?B?VHhEd3dNbGlKbVU1bHdsMnFjK0wvb1ZINThRMTMzb1dsM2ZQK0p0ck5wbzM5?=
 =?utf-8?B?U2JnalA3dFJxNVlHZm9XU3lJSmZnalEwRyt2VFZCUDd4UjR4TjdiTWJLNHhG?=
 =?utf-8?B?UDU1cWhBcUJpRmdHTHIxYW5DcmdxZFYvcmNLVjdGUnNBY3MyVllIY1hxdnl6?=
 =?utf-8?B?eTYyLy9oQ29MRlNJalFoV2MwdjlSbmtsanFMQStIckVxa3pSLzNENjZZWVg0?=
 =?utf-8?B?Y0VRckEzWmEyY3R6bEtaOXIvZjN1Yk9PWmxHRmhaSTdaME5YSnY5WHZ4bkxr?=
 =?utf-8?B?NlRhb1V6V0czRkpUcU1xODNXMEhrTVBibERhUnVZTTVLYXRoSW9SeHJTYWQ1?=
 =?utf-8?B?UFVoQ1NNenJBdWFsN1UxMjB2MzM2ZWdHMExOb1dHYUhEVXRwVzlha05tV2t1?=
 =?utf-8?B?MFhIb0MyK1VZWFZobTRPbSs3ZVVLNTZwT1kyd1Y5NEFWTmtLSmxiMkJhMDBN?=
 =?utf-8?B?bXB1ODNIallhRGZXM3NrM2o3K003djUyV0FNSkNnajVLWWJjLytNZC9VVzN2?=
 =?utf-8?Q?PFF5fb3oaRJQmNvEvBKI3Dc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 511cc4a4-95a2-4dab-63fa-08d9d1808f78
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 01:53:54.5186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 i6pXQ9NHV7IIlo/YA2FovG3ZzCx45yuPxcM9MQwF1N2CinwOoYUci9PMa6++bw/Vqcq2VJkscMGo2J31msnCQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5636
X-Proofpoint-ORIG-GUID: REozJ4tnSfe30syizFcKflhEstC6MKr1
X-Proofpoint-GUID: 17QHOhOe1zSy8O0_7t4VO1qTvi2RUfZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_10,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070010
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 01:54:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94676

On 1/6/22 1:05 AM, akuster808 wrote:
>
> On 1/4/22 11:59 PM, Chen Qi wrote:
>> Upgrade udisks2 from 2.9.2 to 2.9.4. This upgrade will solves
>> CVE-2021-3802.
> This does not apply on top of current hardknott.
> This recipe already has the protocol changes which this patch is missing.
>
> -armin

Got it. I'll send out V2.

Regards,

Qi


>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb}             | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-support/udisks/{udisks2_2.9.2.bb => udisks2_2.9.4.bb} (90%)
>>
>> diff --git a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
>> similarity index 90%
>> rename from meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
>> rename to meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
>> index f9e127438..ebda86fa6 100644
>> --- a/meta-oe/recipes-support/udisks/udisks2_2.9.2.bb
>> +++ b/meta-oe/recipes-support/udisks/udisks2_2.9.4.bb
>> @@ -17,8 +17,8 @@ DEPENDS += "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
>>   
>>   RDEPENDS_${PN} = "acl"
>>   
>> -SRC_URI = "git://github.com/storaged-project/udisks.git;branch=master"
>> -SRCREV = "da6d9480fefeb0ffdf8a84626b5096827d8d7030"
>> +SRC_URI = "git://github.com/storaged-project/udisks.git;branch=2.9.x-branch"
>> +SRCREV = "001c486e6d099ed33e2de4f5c73c03e3ee180f81"
>>   S = "${WORKDIR}/git"
>>   
>>   CVE_PRODUCT = "udisks"
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#94657): https://lists.openembedded.org/g/openembedded-devel/message/94657
>> Mute This Topic: https://lists.openembedded.org/mt/88209858/3616698
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


