Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638B8C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 14:05:43 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.7902.1665669931894453222
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Oct 2022 07:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=L79QTHaf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=72851c93e2=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.5) with ESMTP id 29DBx2kO001919
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 14:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=6iGphR6c9ri8a42Mku8oUFRaUEEdv7aZA3LtM8raKOQ=;
 b=L79QTHaf0LMTOKK7zP4OYIWVsXgG33Ai7jCGPbDnEBgR0MFpPop5aOfWbHMG9RWrRVlP
 klB0tDOkAZWEX+aEznh4YVXYn8/JG2QTHVLOssmJrCoa4wI1FgEwNKPVxLAeTfkBu0yG
 kl6eI0DKhBEvY3sfcV1uGg0G7o9HR0CE8vFYEpsfWg6N/7qbzw4iXmrghkkOBDlcLD/o
 XzAR3XYY9vfM6WgZUBWuC7cMTB+xqqapLSDPBoC0PrlEHz7JuSINHPis9Cp9CxCNpyf5
 JbCGcsRhCGNSeJV576PJHHpV1b2X1l522YGyz+5s3GGAaapLMvdkmA3nNxglQ7TCR+mo VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs473v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 14:05:29 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29DE1U5x007083
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 14:05:29 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3k2ybs473t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Oct 2022 14:05:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mnA35IntnZNNRoQPRPAgLYomHi3YjoB4JHjQvcUljjCzLfFc/IyeiGFcdn/7PqtcwNNdOKdvezm38l+ZUozUJ2qQ9NA8I08f2Y9Gi86saYT02SH2KQRjN5RI79Fz+xJGiiCSVom90xuxcPk86za7AxVIkKyxX8G9bIcg6x9gAD7vqPqhH9O/vBTTKfjdo8pgmzcruCj78Xd9jCPXGqn8YNW0Q/2XTIXVzUXbpu2IPHcMYWju2WlRPvO1UXWfB44l5W00eg/DOaDLYR8ByTh1QwwxVHzJ4g5JTIJNBACeE0LU7BXY/FF/4WPIA7RHQuz+95PoyVq5SilCuKWlmMdfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iGphR6c9ri8a42Mku8oUFRaUEEdv7aZA3LtM8raKOQ=;
 b=f2W8WSr7ScH/P5O53sQsw0Vf1qR7HWnrO75ubtTmVqJozaBDfbqvkJxJXkBlhlfml3atodpnNq2qyg52WAq+le60lLE06IYSi4GnvdrtRiYBNsfZS7Q6dBUBdsJFc/dv6vuh2gJk7Jlr3ULs9Q+/b3kie5+NVDa8ZkZcnhj0C+u4Xf999rBUiIXH0Vi45c7uNe0Nhny+RCbLcDOralN3hw0P1euNPaGzyC31qd9dbZN9JxYGz8tRQYxHSDyCNTnIv3QTJ09o1/ORoRcP7/GrryDW6ajWg741w4AJQmPWM4gjqloy6MhfzcYfnjxNMPN3+SqQvuYGwnc6NZMexmSarQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by PH7PR11MB6055.namprd11.prod.outlook.com (2603:10b6:510:1d3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Thu, 13 Oct
 2022 14:05:25 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::2a19:1d60:6710:ac8%7]) with mapi id 15.20.5723.022; Thu, 13 Oct 2022
 14:05:25 +0000
Message-ID: <3c7d0ac3-642d-8bc6-87b4-cd0d0b6a704b@windriver.com>
Date: Thu, 13 Oct 2022 10:05:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [oe] Security Advisory - yasm - CVE-2021-33461
Content-Language: en-CA
To: Khem Raj <raj.khem@gmail.com>,
        "Polampalli, Archana" <Archana.Polampalli@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
References: <MW4PR11MB582294CA64F65F30BD08496984229@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1srMzGA-y8+6mdV1gtYWfsJYvafhKkwvUu_HN-M=NwBfAA@mail.gmail.com>
 <MW4PR11MB5822CE51AA941EF0BE37115284259@MW4PR11MB5822.namprd11.prod.outlook.com>
 <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <CAMKF1sqHdrf1mK=c7CHVpKF7htPYbGztaG77FXReLMPczgoD4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0368.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::13) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|PH7PR11MB6055:EE_
X-MS-Office365-Filtering-Correlation-Id: d54b3fdd-7107-4ca6-8fe2-08daad23f9c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+jWbVCZZSIXnTkozj+g975SZfl6wJBHB0iP57r3iPlAGcUky8ku8RO3mX1Y0mhvRXnHPVz5hfFfYlcRpPR4kDoYm5lHHOxG+avBkRbJAqFK4QLURPg/fT0kTeXKJL7bAymFSXSF+w0TUz0ZqDa2ZoTVYe1bIavFxgcjk1I0D3sn3ChUqJlu56AhBn+xbENGYoRTZ7fw3I6PIfTEGIA9tQ1U+EIkP8TPagbzyszl2wo6NY2OaCPszjwHokn3f/aQBILPrAbbNUTxn6caIdLqhhxD/mZTjYVr1Z+YEFZtc419JtW8djTwc6zXHKbNLFd9uuxGpKd4NbcdO2INRxn3FManIkaV1yse1CxOtqYZexYY30udS+8cs54ooc2wtKbpvjvWuUmmI7nX2Rn2ld94Lr5jd1kh6eACMIe+W2ElnA/iOn/lr9DiGh+9jhG920E4gZ2sOYnlHzZ3tvLe6q+zz4S3yJ1ynwbFqkMXw93+Lm4bWBFmZi1GHl1Oxj2nHgUtzs9W308jOMDcI0ByiNG+hq46KsAgJsb1jxRtQp+es3H8pqJ7qiI0Xqnt6IPyl3Noo7ZXk2VyKW4tbGZuXSpEgRo3UpMxkKI/Cjxl1wsyFbNM9YHroRTWcSk11vfxa3iAL81iGe08CQJKPvah0VbDNJThw0l9juN3XmCLoMZketenA9snjVAREFEUEurZuxqlIwK5v4rsmBiU6GNqNgfD0j9lSUtBZEkKL6272+Do/kJvrDjvm4xZ3mNFUZK0TPGM3kxkudeELOx6at98lIM+3oWYzXo+BuYmyyIttJuBAsPBSz7jQzRY503HY++brggOq4xGsClRMN3aE5Xi0hgfMzkDC1I77HhTcPAYb7zIrlhA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39850400004)(366004)(451199015)(478600001)(66899015)(966005)(6486002)(86362001)(41300700001)(110136005)(6636002)(38100700002)(83380400001)(36756003)(31696002)(66476007)(66556008)(66946007)(8676002)(4326008)(6506007)(26005)(53546011)(316002)(186003)(31686004)(2616005)(2906002)(6666004)(4001150100001)(8936002)(6512007)(15650500001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXNCeE5jaFd4R0Mzb3pWS25aend2SUxkUExpQ0tsOWp2K1N2MW5yeG5HbzN4?=
 =?utf-8?B?R3owM2VlM05HVjZDMVd1M3pwSkI1NEFXbnVGYWU5dFZYYzB2VEJSTU4xajhv?=
 =?utf-8?B?MjlBVlZCY1dYK3pWdngzMnJsVXR5bmY4ZFF5ZDYvMFV0YWxkL1NDV3k3QmNP?=
 =?utf-8?B?RW94eTVlazQ1MDBNdEtwOWVyd2pjQ0F0UXdFRGt4ZGYzY3Z2cmo0UXBwODlB?=
 =?utf-8?B?QTR1RDc1Y0Nob2dVNnhzNmhyZEIrWkFJUjc5ZUxaeWRqNHVSZ3ErbytXSUlh?=
 =?utf-8?B?d2J0SURmZ0E4ZEVjZ2l0Mm85TTlmZ0JiSTQ1N09rVXlPK2habElTV0dmZ0Zl?=
 =?utf-8?B?VGwxOE5EUWxPbEdHcWxtT2VsUWRkbC9xcDBmVFNCK1FvL0tKcGhsczVzS0ps?=
 =?utf-8?B?V1lmZUJYRWNmcXpLUzNIWFFKcEdaYzNWNWU3VW1xcFJ5ZlhZVGpVWk8rL3Uw?=
 =?utf-8?B?SlVNRkhDOFJmOGJiNVAzU2NuYnFMTGlZdlFRNlkvampyOVZZc0U2Qm9ObEVZ?=
 =?utf-8?B?WllkTS9QYzZZZXJhTTJIbUF2U2RMK1NZM0VaMlRPbGpuWkV5N2p2RGRJd3RS?=
 =?utf-8?B?c29pVjNFMVpoWG9lK0NObERNUkliWkVHSmFJQmdJSWkwMmtORnJkMC8rU0FS?=
 =?utf-8?B?UmxzQ3Q0RVprT3JpM2JROVBZWHlkQUE5aDh4TnhNVmFXK1V2S1FLd3VJajdB?=
 =?utf-8?B?Y0kybnYwbEVBT2xqU3lrNlI0WHdwM0ZRNENYTFdWRmI0TUFZSjcxL1hUYzJn?=
 =?utf-8?B?RCtRZHhaeTRMQU5JeldYZWZPNkNRWmk5S0g1TkRUZllrblNvdkl5M2FBZDUw?=
 =?utf-8?B?clNFbm5aMGVjdEsyOXVsZ2pkQ0d5b1Y5T3RoZ085bGE4M0grUFpnOHZhcFFy?=
 =?utf-8?B?eXpMOTJnYlE1c0FTRTZidTNsWitTbUVsbmlOUWg0NmlWL2FISkExem1Oc243?=
 =?utf-8?B?dFg0OGRhcnRleTJXS0xhR0EwQ25oTUY1S2ZmNkt1VFNnR3gxRmJrYjlrK2hK?=
 =?utf-8?B?TTJNTzM1d3R1bUhPN3N3OU9WVFYrYzlmK3RZWmpET0pMNFRpSzNUZSsweWZF?=
 =?utf-8?B?QVN2eERXZVQwQ2lGYmN6TEY0ZCs2R0dLUW5BajBGWXIvYzFtM1dlM2NxanRa?=
 =?utf-8?B?a2NXNTkvNnhQZW9xZTcxNjlZWWd5eDZOY0UzRG5rd0x4N2xCMGcxdUxKSEVs?=
 =?utf-8?B?M2ltcmZqaTJwZ3RCcVhaeStsT2o3OGxWdzZHOE0zWjRUT1o5R1pTbjNab3BM?=
 =?utf-8?B?eU54RGp0ZFp1Yzl5Ri9wTlk2QVE2VEtDSHNXYmFYc1NPNmI0b2NBNks5b1pI?=
 =?utf-8?B?RFZvMG1iUjQxN2ZpaXViOHdySXI3Z2tWWTljYXJWNnZST1ZSbE13TC9GS2NY?=
 =?utf-8?B?TVR2WEs2R3VxcUVsSnBZcUcvUEtFeTF2NUk4UGc2NHRFbjNQS0RUL25FczNZ?=
 =?utf-8?B?VGZJQkNIUFBUZHhHNjcwTG5pengxUWh5N3lLa2ZFVm9zMlhXMUNMSHZveEtK?=
 =?utf-8?B?VXpYV08relF0TFBkQlJjb2E5Q0dxWkNkU0xlcHNwU0Jaci96eUwxMUlGNzRu?=
 =?utf-8?B?TkQxdWo2amlTYVpKUHpETlhsYUxpdW83NTh6VlZPa0lSeFhaS1puUytTeGNu?=
 =?utf-8?B?TjBXSDdYRzVvM0hDSGhWeG5TR1NRYmk3dk1Gd1NINDBLVklBdHV3QTZ2RHJM?=
 =?utf-8?B?dlV1aXczU1lBVDRVekltdnBGaUVRUWp4bi9TeTd4YmhNQXpqUnNETGo4eTRP?=
 =?utf-8?B?Y2NpeDhRck9YeCtrSVZMU3NUaEJHUU56b2FnR2FoQVpBbDRmQzBpRmpqd3V3?=
 =?utf-8?B?UlIydDFoM1I1VElmajZKNW5DcGpyRGZCSmFteEQ5cUN6UWZqT211MXpwNFlF?=
 =?utf-8?B?anFhbnpwVlQ1emR3dnJOUjFWRUtxcllISWhMazJqV1ZyUlhlOU14bDdHRk55?=
 =?utf-8?B?RUFTdWxXaTBzUHBJNkViR2Q4Ti9UYTlMSmhTMzVWL0FtTWkvM1plNnFscjEz?=
 =?utf-8?B?RmdZVHQ0RUFHaGZBQ3hpc1ozeXF2YUZEaWdGUGJCY1VNV01iRWtsRjM5WWZY?=
 =?utf-8?B?STJ0eitVb3hrOG9PS3paK2Q5SWJBRkJhbU45Vkd1QzRsQnFERGozSDlmc1dk?=
 =?utf-8?B?MGdQWGtCOVVYZGNueTJZVnFyaDlWRzVENlRaL3FheWIza1ZBN0MxYlR2ME5H?=
 =?utf-8?B?MUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d54b3fdd-7107-4ca6-8fe2-08daad23f9c9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2022 14:05:25.3949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFmBYG0aZZq6KKZlC23lEKuM5zLzi83zhxgS/j5L3gLUVx7o4fXnKErqB3Qe6TTni9CXI/pN9qA0gHNjMBItLrtdx625r6J4/Q/pOyrTYsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6055
X-Proofpoint-ORIG-GUID: MyV5gFEYAC1Dcfydr1WMVb2aeB-0ggol
X-Proofpoint-GUID: _tQB51HdXwP7z2m09t_DTHESAaNUMMyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-13_08,2022-10-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210130084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Oct 2022 14:05:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99158

On 2022-10-13 02:33, Khem Raj wrote:
> 
> 
> On Wed, Oct 12, 2022 at 10:59 PM Polampalli, Archana 
> <Archana.Polampalli@windriver.com 
> <mailto:Archana.Polampalli@windriver.com>> wrote:
> 
>     Hi Khem Raj,
> 
>     I Have seen the link, issue is in Open.
> 
>     Could you please confirm open embedded is going to provide the fix.
> 
> 
> If someone in community signs up for it then yes


and in this case, the community is us (Wind River and other folks using 
yasm in OE)
so that may be you providing the fix Archana.

I'll explain more offline.

../Randy

> 
> 
>     Regards,
>     Archana
> 
> 
>     ------------------------------------------------------------------------
>     *From:* Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
>     *Sent:* Thursday, October 13, 2022 4:00 AM
>     *To:* Polampalli, Archana <Archana.Polampalli@windriver.com
>     <mailto:Archana.Polampalli@windriver.com>>
>     *Cc:* openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>
>     <openembedded-devel@lists.openembedded.org
>     <mailto:openembedded-devel@lists.openembedded.org>>
>     *Subject:* Re: [oe] Security Advisory - yasm - CVE-2021-33461
>     [Please note: This e-mail is from an EXTERNAL e-mail address]
> 
> 
>     On Wed, Oct 12, 2022 at 10:24 AM Polampalli, Archana
>     <archana.polampalli@windriver.com
>     <mailto:archana.polampalli@windriver.com>> wrote:
>     >
>     > HI,
>     >
>     > Could you please confirm is there any security fix providing for CVE-2021-33461.
> 
>     seems to be open https://github.com/yasm/yasm/issues/161
>     <https://github.com/yasm/yasm/issues/161>
> 
>     >
>     >
>     > Regards,
>     > Archana
>     >
>     > 
>     >
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#99156): https://lists.openembedded.org/g/openembedded-devel/message/99156
> Mute This Topic: https://lists.openembedded.org/mt/94286070/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [randy.macleod@windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

-- 
# Randy MacLeod
# Wind River Linux


