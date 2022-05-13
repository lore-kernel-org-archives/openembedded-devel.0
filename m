Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED96C433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 03:02:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3978.1652410925844659428
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 20:02:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=kOl4+OgX;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=21328e4ffe=kai.kang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 24D2fbcq028549
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=34IDvZLfKKckBXkU3sfq2nd5a9wuLvm/r2OvvCKM5Y0=;
 b=kOl4+OgXvlsB6VZiePJ/40qko1pFqkdeoArxT5bhoSU6wUvOqmzU+0dLzNoAGCE29JxT
 rw8QvRSIJW07tiqwys4VcNxcEMMp3cPWAc7ckdFRmTSRQbq2oY8cfMONLqNcUiRdvuqw
 RT6IzUT1AlK5xD5YJ1/Gi//+9ArU00upKAtW3wSlaHHIJNZFsOqhN2MtD9LyjEhziz6O
 DZq9DsyE2+tN1cV7ZSPY1zlV2IOb6mUDr4B3aZ50NrA9ikyaF1Faxzrjs+hCfaSGDaf+
 H3lgtw51/motMcIXU08NBk9z5+xdqzyzzBOdrybvo7IHuqGv23CXGSrRsfNLgoFh0GJy Lw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr8cfej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:02:04 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24D3243F001573
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 May 2022 03:02:04 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3fwfr8cfeg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 May 2022 03:02:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O5JqbotoJz8QXkHrzFSf3JcghKFCb2tkBwvUiq/2YjQbQsmas9A8K8RBOfMdSb5P1AdugU/sUJ8B608Yb4BSI/fa6pcG4Mkp1darCD+Gw9pREXL7itBUJxAdfax5Ja2d+SOxJjcgKqdLg6RrT0jg8FmEwh9c3sxDAne/vd/8kiq20+hmaiOr6iT4fZfX225u8/7rs57qTyj7EN3X6C+480WFYNQdFhnddf6eLLCzNdMXzNVmTPEowS8DcfU/VbZ0Rcu/sIXbLWpY7EmJAnYcv3o+BjPeiArciJNKtC6VcY8H4jd1BxvSw1Rej0wXToZGMzY6jh2Ttr9g6crybJnjyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=34IDvZLfKKckBXkU3sfq2nd5a9wuLvm/r2OvvCKM5Y0=;
 b=ImKOAAYuWSzqeaNqTovSuZ0lg5neV9pZEYoyrVOfDDnd+7L9qxPqsxD0gTG5tOhT/+hjDKUc+jyCFw/o/mDWfTT4tsYsTw12Z5T+I8sIEqxM3cjXrw6dKxy8DfFwYw63gA0lmSExR3B0JQFjqAyugJyDVUNEGfgqrHnMKVHzMPsDGLnCE7GrTUoOwESwV9RuIaIr7wu9O9NkZnbYP9vlJbWp389MLi3wdtncKrUFMccFj8KSb0I4ACTDa+qUWDirPoPHU45qOvaiMBSpSGjvFa14yL/tDesl2Vrc6ekYBQeJ6wyDMWnUy595LgUTha+LgCIs3iLEEUMenVqkiTxmQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) by
 DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5250.14; Fri, 13 May 2022 03:02:01 +0000
Received: from DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68f2:234c:af29:f0bf]) by DS7PR11MB6064.namprd11.prod.outlook.com
 ([fe80::68f2:234c:af29:f0bf%7]) with mapi id 15.20.5227.023; Fri, 13 May 2022
 03:02:01 +0000
Subject: Re: [oe] [meta-oe][PATCH v2] wxwidgets: enable to use private fonts
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20220511074522.28499-1-kai.kang@windriver.com>
 <CAMKF1so30+Ec6+vMCCaKaXy8hrJUeT3pDk=sE2Xa=DPY-VxHFQ@mail.gmail.com>
 <12c05411-f04e-f956-4ca7-051bc4c0a5fe@windriver.com>
 <CAMKF1spQcoh8NQ8-cd13jNKewtWhMYwZaAT1A53n71Fb2Gv9EQ@mail.gmail.com>
From: Kai <kai.kang@windriver.com>
Message-ID: <263b0c48-8eeb-f136-6e06-9a430b984fd1@windriver.com>
Date: Fri, 13 May 2022 11:01:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: 
 <CAMKF1spQcoh8NQ8-cd13jNKewtWhMYwZaAT1A53n71Fb2Gv9EQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: SL2P216CA0098.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::13) To DS7PR11MB6064.namprd11.prod.outlook.com
 (2603:10b6:8:77::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3132d9e-7a2b-46d9-87e6-08da348cf398
X-MS-TrafficTypeDiagnostic: DS0PR11MB6471:EE_
X-Microsoft-Antispam-PRVS: 
	<DS0PR11MB6471652202EFECC2E0A6A4D695CA9@DS0PR11MB6471.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	T3kO9AALlRUcyOll0Pw225Fd3xuNyQP9pdGB5tTp83I2ZecTwxt7PmUqeLwpNDdRYAGu9mi5cEfg+8GMVaRI3Z+U0ANJWQsClD77FLvxbp5oFEB4UANk7k/SiAvQY0u6LhaaK51Yh7iGKCsVPUrx56RkYzgxW6z9Dlo6V1jJ3mCMZlsOPaOb61r6JQPtQj7VhDh3A7V6cIMdIsj1KMsACdVNS1gqhfdf8pvBsB5kv6fNljI2a68BBV/0Vj/qulDgNRmtcNouC3JtsyAE5c0ctNSJ9ioxGoWxVNLD1mMAFmGaHLUtm85vAuBhBzRKAKVuS6qVijuYJ7GFhCRDfXGX0yYp99nxyEfbjk3IB8D0/6s+UUwo9rRqu1Kwti5bUgSfztHaGYLpejuqEolkeoO0sasFNxJQFmS2s0Ns9wkT8UUxPxsJgXZLoeMAKGGpYqCOYqWaVBkDVr5Vild6gfEsiRNBdmlVXsWYI3+EWp7rgX+rcZIwcsuyqgBmqpwfgtQTBRiVMlB93f/WOnFFa4h2icJA+EVemlyNT6Hn5Jre9agB5/vRjc07rfVQmx+suxQr07BFtCJZcY3Q6VrLuSlXca3Y3TArKHV8zzfMvevDX2kOc53Eha/EavGGB8HHzT3hx/WtEKbx5XZ2Yy60AfDE/psM2xe2u88ppDF3+y25Eg32FCvPpy8ZZLr34YzFifhd3cQ60hjP5bSKAEpx1mK+FE1WRxoxIPWMGWyYhwvmbPrrG7YeuG7PbPIWZT7EFOA42gTzw55X5R4UYijDBnty7IQ9OtfcwvzNGydw85OlnpYGe6F1gg1/Py3svk6svDmxH5m0sRvuw0YQVJK1gP6rb5Nupv77iuz8dSTtYswauNJIylR9fUPPGYNj33NSAJ4Dzh4oWzuKZ11LOYHiUlN0jA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6064.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(38350700002)(5660300002)(2616005)(2906002)(186003)(8936002)(86362001)(31696002)(66476007)(83380400001)(66946007)(66556008)(8676002)(4326008)(6486002)(6666004)(36756003)(31686004)(966005)(6506007)(508600001)(53546011)(26005)(6512007)(6916009)(316002)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OU5rRGdnRzZWY3d2b3EwQXBtc1NSdWFzZDMwbWo4N09YYzRvYnpCdDA2dTFI?=
 =?utf-8?B?VHpFdFlNMlc1b2VCQ1FCQzZaU0MxWGdQZm9qYUY0Z21tRUdVMzF4cDNiRElL?=
 =?utf-8?B?VE9UdU1TbmRIRW0xalFuTDdSTG55akM2U3F5TzBlVTRYcnY0bWl0dDZlajBM?=
 =?utf-8?B?blBkQytWSm8rN0V2ZEVUQnN6QmRDSlY2Q0l5MjVnTGlHbDZUTkc4cFhPZUVv?=
 =?utf-8?B?QmtwbVVtRk9waWJlY3VXcW9kY1NvdExocFlnMGZyOXhkZnVQcTJDVUJXR0NL?=
 =?utf-8?B?R1BFSmZseVlDSmp3U1JVOGpRbEJjTnNuVHAwQ1BlMlVseHVOMEpZZmFOTi9j?=
 =?utf-8?B?bFk0T3BPVFFQemU1bytiQmsrV01Id2lvWE5sWFVMRTU2UitkcG45emJVOHl0?=
 =?utf-8?B?cHNIYzVuUFVrVURKc05uTTVrUW1LWHJtWUJ4a2pqTkV4UnV6cTEzeDd6c3JI?=
 =?utf-8?B?VnlBRjJpenRRNG02U3IraFE1bFo4SkFlR2N3YkV3eTBLc3hCcnMyc2x5cWNC?=
 =?utf-8?B?KzVXY2dwOG1uclhobTU0OXEzOE1YNUordEhZanU4OWZxSUZXbzljQXhXMU1o?=
 =?utf-8?B?WGY2ayswTDNoc08yYWFNRVhIR3Vwa1hIQnJqUndWUHoyVUlQNDBZV2FoTjh4?=
 =?utf-8?B?a0VtSjMwdFpGeGgvT2pQTG1SbjRhN2VLTTJMZzV0WDhqZVNRNkNiM2tBc3B5?=
 =?utf-8?B?UFhQYW5qdk5BL0NkenBmbnJjbFk3SEh2b0Y0aks4a3R5VlRXQWhzQkRid0Y0?=
 =?utf-8?B?MHRPb1RCMEtlb2x3S0JTNzlqbkRpbStTVzFjc05rUlJJb09Zc3A2VFQwdnZa?=
 =?utf-8?B?Q2FKSlE0b2t2dkdHaWFpWWdSYUY3Nk5reEMxN1plNmtBdTAvdlBVenFPM2Q3?=
 =?utf-8?B?Q2QvalE2Q0ZIYXFUYnFYTW9qZ094Zm0zSjBLeDd5OU1KMDJRY20xcHdya1k5?=
 =?utf-8?B?bWR4eVowazhrODI1Z2lFR1JuSUs3d2Z3UTNtdjdYeU5MY203a0pWQk5SSndn?=
 =?utf-8?B?NHlVTnI5cm82VVBKamxVTmV5OVZFQno3UnRheXFvMFR5eElSQ3hsb3c2VG9X?=
 =?utf-8?B?MHdDU213amYwOWE4cHUvUmRaTWtGVG1vSHBTaWJFVHMxQ0pyRzNheWFZRitY?=
 =?utf-8?B?N1FndVZPTmRWMlZSTXZCMlEyZVJBWS9NV3htWDlzdUpvcWFIUjlHbDdEYkFF?=
 =?utf-8?B?azN5NG9VNUR3a1NYZ0F6UjBXU2tkMDY0bGRsV0hEbEVucmcxWWFnSDB1cHVs?=
 =?utf-8?B?RDlXOHNIbmRSWGJIT3F1WjhqeXJtV2kyelhNaWZjWW1uU3ZlR3JyS3lQSmRz?=
 =?utf-8?B?aVN1SmhYcURRYUc1dWFOVVVhUER1V2FFcUZzOUVkMHBDem9Eb1pnbHM2Q0dH?=
 =?utf-8?B?b0hJcUl5ZHpYTXh2b2FMUHRoUTFNTU5hbXJXRnE2UGtTOXRaZkRkcjZic093?=
 =?utf-8?B?a1hXR25yRGMrbmNBZ01tWHRrMmcvTkNnbU1NendiaUtWaUlZUGFlUTRCRTB2?=
 =?utf-8?B?UjM4c01ydzBZVDErUlZHOFNyVEdMTW9sRGNKc0RaUTVoNmJaQzVkSjBvR3NS?=
 =?utf-8?B?VXpWVjhDd1llNGpScEFaYTJ4NllzdEdvZW9jZHQwdU92RUhJQUR4RWFZZFly?=
 =?utf-8?B?cGU2K1A2M203Ly9BWFBKUFQxbFFxM1QxUm03ekk3SUhNQW9iaUtPLzZRRjVY?=
 =?utf-8?B?OEN2UzV3R0pxK0dEWWJGWTVvYjJJU0Fmb0FTNW1iVVpSZk9oOGhTM2NHTkNr?=
 =?utf-8?B?Nm14TUxwbnVJUGh2ZmszaFNhemVTOWE5TVZLUHV4U1BwTndwSjl1Nm00MnFW?=
 =?utf-8?B?eGRyeFZDS3FTbmloWThjK1VwbzVLTlM2bTluWlg1SmkzUnRWYzJsR25VTEs5?=
 =?utf-8?B?ZFJXVzRDWlZxbk95eDIzUnhQV0ZRTjBMVitsOGNuazZxUEZ1dzF1ZUxKYWE3?=
 =?utf-8?B?UWNJRDRwWDlqSjFCRXArcXhITFlWUXFOY0VVRXVidm9ZUVdDU2poUTQyRFhN?=
 =?utf-8?B?UE9JRXM5ZVRlaTZOZmxNaVZkZmt1NTBxN2ZTRS9zRkxYdEZpTDNMNmxCRGlz?=
 =?utf-8?B?N3BheGdnTWRpY2hteWRMR2ZxbnFoMmJpL1FpL0JhaUp3M2Z3QjNUa3hhdVFW?=
 =?utf-8?B?QnVzYXkwV1hKL2p1NFN5NmQ2THF5V1BkVXNZdCtVamRxSnVqMjJ1ZTgzVXZC?=
 =?utf-8?B?NGFpMlBJUGtFcG1Td2xaK1pKMjVSUVJBZDB6MDhIQ1FDb1p2cytHTzRjOUMw?=
 =?utf-8?B?Q1hESkNhVHJwUTRhMVVOZkVmR2tpazRaWTZoV1ZWMzlIMnFpdXJYQmtKTXov?=
 =?utf-8?B?SUJjK2gybzVWZzQzZHZPZnF2djA4NVhxMWdXSHlETFBaa0pDbEhnZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3132d9e-7a2b-46d9-87e6-08da348cf398
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6064.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 03:02:01.5459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 g1OKaeYOOdI706WFd0CMr2BsAqNVUu5goKsOwCSbWZCpVzqBWrS9BsTXSQVkbmVSJEvEHSf+hoQ2R69oVl0j2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-Proofpoint-ORIG-GUID: T4f8PNZFfbfomiThEPkPHN_qdNyS4zn_
X-Proofpoint-GUID: ItH2wqYaw5lKrTb9EvrkW0r9E3Ghwme_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-12_19,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=591 lowpriorityscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205130015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 May 2022 03:02:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97091

On 5/13/22 12:15 AM, Khem Raj wrote:
> On Wed, May 11, 2022 at 11:23 PM Kai <kai.kang@windriver.com> wrote:
>> On 5/11/22 11:21 PM, Khem Raj wrote:
>>> On Wed, May 11, 2022 at 12:45 AM kai <kai.kang@windriver.com> wrote:
>>>> From: Kai Kang <kai.kang@windriver.com>
>>>>
>>>> Enable option wxUSE_PRIVATE_FONTS of wxwidgets if build with gtk. It
>>>> allows application to use the font from the given file even if it is
>>>> not globally installed on the system.
>>>>
>>>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>>>> ---
>>>> v2:
>>>> * use upper case 'ON' to align with others in oe
>>>>
>>>>    meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>>> index 6b57cb54c..b9b1dcf0d 100644
>>>> --- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>>> +++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.1.5.bb
>>>> @@ -39,6 +39,7 @@ EXTRA_OECMAKE += " \
>>>>        -DwxUSE_LIBTIFF=sys \
>>>>        -DwxUSE_REGEX=builtin \
>>>>        -DwxPLATFORM_LIB_DIR=${@d.getVar('baselib').replace('lib', '')} \
>>>> +    ${@bb.utils.contains('PACKAGECONFIG', 'gtk', '-DwxUSE_PRIVATE_FONTS=ON', '', d)} \
>>> why not add it to the packageconfig setting itself ?
>> It is an useful feature for wxwidgets with gui, so I want it  to be
>> enabled by default. And it requires pango to make it work.
>>
>> I can see gtk3 depends on pango but qtbase doesn't. So only check 'gtk'
> I meant to do something like below instead of this patch.
>
> PACKAGECONFIG[gtk] = "-DwxBUILD_TOOLKIT=gtk3 -DwxUSE_GUI=ON
> -DwxUSE_PRIVATE_FONTS=ON,,gtk+3,,,no_gui qt"

OK. v3 will be sent.

Thanks,
Kai

>
>> here.
>>
>> Regards,
>> Kai
>>
>>>>    "
>>>>    EXTRA_OECMAKE:append:libc-musl = " \
>>>>        -DHAVE_LOCALE_T=OFF \
>>>> --
>>>> 2.17.1
>>>>
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#97033): https://lists.openembedded.org/g/openembedded-devel/message/97033
>>>> Mute This Topic: https://lists.openembedded.org/mt/91031050/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>
>> --
>> Kai Kang
>> Wind River Linux
>>

-- 
Kai Kang
Wind River Linux


