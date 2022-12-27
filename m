Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F3FC4167B
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 19:15:59 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.165454.1672168557041482410
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Dec 2022 11:15:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Xnx7WVRW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=93609ec0f8=randy.macleod@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BRJ2SNd030120
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 19:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=message-id : date
 : subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=h05QyLbDDHDl7MSqvTF2TytnHyFrzr+UjoY0LqM73q0=;
 b=Xnx7WVRWM3n7yjFnIEvKfmRzAsfafvLbzwiyDPziqbJJJR9xlrUj/Hr+75de4VrVSWDp
 E0LRWxEIeVy0sID5oUDDOySM0OrGC0sA0neNAfyRi9s7v9MKGcBamDuUIjnIah5nUHa5
 3mZYCWoKYAoo5SS4ffEU3aqNNqnqe6lLQHcYY8R8xtqDWJkqd6HTkxvwGMmvHrlM1ucF
 rfLZLVN1bpf4hwNGBKUDY3XmIxvYWu15kOI5wwYEpvGP0pn6mLmJp1fziqajjUVZHKNi
 FBs6Z0sUdQb7rsDP8139gdhVzpPkkPmABib5+KLiMZzBLw2Bo/fVQDkRdo+Zhvm0nvj+ ZQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn31xje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 19:15:55 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BRJFtNR028947
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 19:15:55 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2174.outbound.protection.outlook.com [104.47.57.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3mnpn31xjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Dec 2022 19:15:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=houCKg6vGLPElC3X9/yBlF+4gVPPqny7U0+rc/onoZXhga1RXVX8cOveFlSQiP9Jf7/3CNz4SSxnati4s1OVL7g07UO2rrzK+3LGzuAR+wdBYneOPmGsKd/dO9jgM2cXY19AJ/n0FXoh2+GI1t2lqEOS2bvwSUFb7geI6l3plHx8pWO1AsvJ8iige5qTQ42kQDLDHLCzVX8rgsb+TTw93LBOrOrEUJoC0DA0S0NlMLiksE9szuDW5AMwzg5SpYSPI2l/mLcRrWLJ7hZ7SULfHXYUk5bGVHvqbz6gPYDW0IP6pCd/WITUBfZHoafleplXtXzgwBbDJaZW6DL0ZnC9Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h05QyLbDDHDl7MSqvTF2TytnHyFrzr+UjoY0LqM73q0=;
 b=m3+Iwz/GfFrMGY4RK+vb47sRDSiQffi3+jbnMrJaB7Ydv0rtwqjCX84pmoDrClVIsmB7oKcOyGTPtV/N+SGPw3hBwCYjVg8CEmSMHtzy2zxEprEE73ZoswKYHnxRemGyM4Hugbv0ZOoa3LdMPqb6tDSyw8pTP0tjf3OCO9FXwmoDyIUKL3qAM2FHRGmZ17urJDn0pgVpz8z55dhuR/BTcvBp/CzM3JWtMQoznjyuM4Zg/86FwUTvJK2H9BdFrZCTcZj/u3E/2yGkf2+tXz535UKECN52D91SG63EABc63nLJ/Pjr9A+iuzjnYhjQOv1uPRoNT+vUKd+4/knFFRvXww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM8PR11MB5686.namprd11.prod.outlook.com (2603:10b6:8:21::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Tue, 27 Dec
 2022 19:15:53 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::e794:335f:5e0f:8d36%6]) with mapi id 15.20.5944.016; Tue, 27 Dec 2022
 19:15:53 +0000
Message-ID: <5769dac2-e20e-51d9-b617-c76c98154c74@windriver.com>
Date: Tue, 27 Dec 2022 14:15:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2 ->
 4.16.5
Content-Language: en-CA
To: archana.polampalli@windriver.com,
        "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
        Armin Kuster <akuster808@gmail.com>
Cc: "G Pillai, Hari" <Hari.GPillai@windriver.com>
References: <20221214043337.2695189-1-archana.polampalli@windriver.com>
 <MW4PR11MB5822FB712CA3B228C645AD9984EB9@MW4PR11MB5822.namprd11.prod.outlook.com>
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <MW4PR11MB5822FB712CA3B228C645AD9984EB9@MW4PR11MB5822.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB3994:EE_|DM8PR11MB5686:EE_
X-MS-Office365-Filtering-Correlation-Id: 19399995-f9c4-42ff-215f-08dae83ec5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pnGdsoF55wrLchby3odDv0gUy2z5BL0eTsUc7O0fUuK9GgVP3xqm60WxFCTpztwJu9HIdSmTV2eoeuQag8vE8lKEHS3N+jGdL/pqQ7XbdHdAAa5At2AqXyXRm40FRvrNwV18PAy4PeZMzQFui0Z5gMa0+oUVemHrgtPSb6WWjleIysJBcGDuQhC9VRuWeRGkHjCR4iT0q1rKDr8Rek8kX8NexeTbwpBnFE8Ts0O7/RsmJpOnvY43NFnf0pj03F+/X8z20u7UX3UPHcg4dqTCama51mQU+oRghqdfNsslyVlRJQrgB/FjfYbDL0yU3YPlVic7IzvkMcLUG91GidqSCaV5sWp9W/sBerOeN6uQ11jeQtEpKEoJwzIF7ThgKbg+ZIlrUMssQecPfYVVt3Yk/4wou2Pam2Qz2OifZSDgaed1pcvc66QnbdbPC2wEss161FIUoE/xWbM7rRPBlWRhg5fyio9+ziAnh606gGMw4Z+zdp4NKTzn7TSZHuhA4OQqFtrGOmQ97WjzXGM+03MRKwxMWBWt6VsQjPPqJUh9Z81JpOxcXK799oFFV0dd7rlMo5LadN6gmju0DxvSrHKA8NzfDpcODRAtIw6kmdMyeq7Q17TBu3N1RvJBLYAjNMsxUzcCBxDQoK0EPQhZyg2ypBtSpVzT0+/exk/QOfrVWB1zfeEkB/PKc/fA0zW8RqmME48rUtSz/1rnkAgG3GzFKLz+KMoTEn5UoXZxrtxeYyCv31a5xlm5gXNkQpgJEB7kcVcpx4FlsIZISPQzrC3NCBbkKMoHFzyUNktwlJDifjVttHBqkCXTjR5a+ogfSu0l
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(396003)(39850400004)(136003)(451199015)(36756003)(2906002)(4001150100001)(8936002)(5660300002)(86362001)(41300700001)(38100700002)(83380400001)(31696002)(966005)(66899015)(66476007)(316002)(31686004)(66556008)(110136005)(66946007)(6506007)(478600001)(6666004)(4326008)(186003)(6512007)(107886003)(2616005)(26005)(8676002)(6486002)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFNnM28wUklBaEJjVUdjUUs4aE1tYkZZd0xSNVEwMUJoU2dCMDZ3bEJlK3Q5?=
 =?utf-8?B?NmhBeUFTS0NmVElyVHc1U1RuNjl6L05udGdYUXRFNHVWbXBQMUhKRGwwZ3cy?=
 =?utf-8?B?NkFFdEh5U2ZyQUJKV0UzUmozV050R3hXV3RlMGsyNWRhc0V3QTRUVC9GbFVN?=
 =?utf-8?B?dzA4Tll1WTFVaysyeHJRdTdqd2djdlZEekdSTEtSMFloWDJxb0orcEY1SURr?=
 =?utf-8?B?Wk9vTlBGekxEajZOc0lZcE9aMFZvaGR6S1FzYVdmR1daclRYNFRjSE03V0dY?=
 =?utf-8?B?LzNhaXhaSWQ1a3R6T3owelcwcGo2VFFGOXlDK0ZLTW5FZWVseTVvajhmYkV5?=
 =?utf-8?B?ajgvdDVJaTA3MVp5OEhtSGcvaHVtb09uQjN2TGVPRXVoZ09hOXRyVTRkZDZr?=
 =?utf-8?B?ZVpqV0dIM2F4V1hiRXp3VkYzeUNwTHE3TkxDM2h2V0V3cXVOdDZFaHVPTFdr?=
 =?utf-8?B?RktEMFBDQm53Q0FYYVNkclR6TWx2dGI1SzdIdzkxOWdaYmZiSDRRU0JKQWs3?=
 =?utf-8?B?OFkrVExjZ3Z0R0Y0bXdUMURSM3BsQVNwaWdzZTJ3QUZSUVlMNGoxeU9zeE92?=
 =?utf-8?B?VmRJcW16bUNkRWtQeisweWNkd3M3NldGcVZuMjBHMGxoYnNDbU1nVlZydDNk?=
 =?utf-8?B?SXRPei9XS1l5VmY5QlpXeEdGTHZYNTFINWNqM2lVWit3ekk1SlJpQmRuV3FO?=
 =?utf-8?B?N0tia2Uyc0xqSmZhT1N1MlV1ZU1paURkdWRaaGNXaEtDc3QrRzFvbW0xOUQ0?=
 =?utf-8?B?VjBFb0V4ZDV4Tkl4TDNsM2NKY0JkTE1OajFUaklXbWk4YVBTT09ZSXc5eWRj?=
 =?utf-8?B?YS9jS3V3dkhYTUc3WkVHQnZFNXROY2hCb3M0ZDAvTUFIRHNzZXVETHgxNldK?=
 =?utf-8?B?WW5sWkl0U1lLdTZRNk9mbE9pM3FFS0hGM1lpSjlmZEdOZUxieXpCVUk2WC9F?=
 =?utf-8?B?djFMYzU4WjFTSFRDQmUyZzdNQ09sR0doRExyY2R0SkNGQzlTaThocCs3VHov?=
 =?utf-8?B?T09IQUFwOGFlbCtsQ2dZNlNvNVZYaVNWS0tqS1lzdFc3VjZ2ekFveDd5OHdD?=
 =?utf-8?B?RWRMcjd6QTVITFU0L2J3UHZwMFUwdEk1aW50R3ZDT0pkVnoyT3VmdExWTWNx?=
 =?utf-8?B?SDI2emlhSEZMWWNzM1RWeEt2ZHRYY01peDgwTXlQZkpVK1MwdUZsY2JCL091?=
 =?utf-8?B?RmNNNW5ySExjclQ5OUwycmhGWWgxQ2YxSVNvQnhCMjdweURJb2lLaWJFejhj?=
 =?utf-8?B?cXJ0aWZYWTdUTWdYYWp0dXV1VDFmcWR1MzU2dUVBdmNpOGNTUFpqOFVVZ2hi?=
 =?utf-8?B?RGtDS3FwZzdWYUlGRXI0L29UVE5naS9rVXk2NXJSd2F0bFlDQ0FYZnIrMmhz?=
 =?utf-8?B?SGt1WjhkY1Q4RHRKc3VCOHRiSmtOQnd1aXRLTG5PL3NwYUc1ditHZkl0K0dJ?=
 =?utf-8?B?RDVBUkVtM3FxVE1EV1NPYUl2UWNNSEt4WHQ3ektSL3FzWFNHK3E4c2hCcXJJ?=
 =?utf-8?B?WC9FYmN4NGNxNjlxbUttTjFsbGdrN25GelhnOCsraEVqMEZwQmlJQTBMVHJV?=
 =?utf-8?B?VFRZSlBhQUd4QmRpTU9vWHowdm04R0g3M3o2UEc5V3VTdzBGY2FwczlsWEQy?=
 =?utf-8?B?YkZETmR1bjFldUZOc3c2eGVTcklOUUVObGZUZHFkR1lVOUJ5Umd6VWNsSTFO?=
 =?utf-8?B?eDZwTkNKN285V0N6djJUbXJ2dEhDY3R3VTQ1SWNWSjd0ZTZ6cXJVcysxblVX?=
 =?utf-8?B?ZnltUGRySHgyUlRsSEw3U0NJd3JKUEFGdGg0eDUxYmJDSXpFM0QzZ2ZpWVU0?=
 =?utf-8?B?NS8xbUhCUlJGcmxSRWxtWTVoa3g3TjVudmNEQzA5VFY1RXgzZURETDY2eDI3?=
 =?utf-8?B?ZlRpMWlJbURpdytRL0MzL1dGeFhKL1I3eWNZaWtibmIvT2xPcEFUYSthTzJy?=
 =?utf-8?B?c2xIeStBRXBWNG5Dam1LeDRaQ0xYZEcvM2VwVHZlS0NyZk9qMlBaUDBtMHNn?=
 =?utf-8?B?WXlsUWRzQjcxNHFSS0Y3NTI1Um9QbnE3RTdmbEQzaG40WXVUb0ZoV3hOMEhH?=
 =?utf-8?B?NnNoMUFHSHNzd05oZitXSDlkRnBCSjVkejhWcXR1YVJJbE43cDJrQVNOZXV0?=
 =?utf-8?B?MlF6Vnl5LzBVVGhENkdncFlVWFM4M1IxbW1wbzVRSzcrSlRZTnZERGhjZUNt?=
 =?utf-8?B?QUE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19399995-f9c4-42ff-215f-08dae83ec5b7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2022 19:15:53.1732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpVk28XGqP5OBNrlNc524YMw0k4RfNvXIzo5Oo7zgTA9e40DGzMEE+Ct1d7LncYUGLVZ9n1SQI4f3bjBcVgPcyRgDKo6bSsHsHlrELs5oIQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5686
X-Proofpoint-ORIG-GUID: 3slL441sM32rLWLJxGpUxS2pqv2eVjFc
X-Proofpoint-GUID: eIWRCmcNzeJ_7t9LbRrt5ljKr0DeqZbW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-27_15,2022-12-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2212270159
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 2BRJ2SNd030120
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 19:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100292

Add Armin who maintains kirkstone.


On 2022-12-21 10:32, Polampalli, Archana via lists.openembedded.org wrote=
:
> Hi,
>
> Could you please review and accept this patch.


Archana,

Thanks for the reminder.
It's the holiday season so things will take a bit longer; check back in=20
the 2nd week of January.

../Randy

>
> Regards,
> Archana
> -----------------------------------------------------------------------=
-
> *From:* Archana Polampalli <archana.polampalli@windriver.com>
> *Sent:* Wednesday, December 14, 2022 10:03 AM
> *To:* openembedded-devel@lists.openembedded.org=20
> <openembedded-devel@lists.openembedded.org>
> *Cc:* G Pillai, Hari <Hari.GPillai@windriver.com>; Polampalli, Archana=20
> <Archana.Polampalli@windriver.com>
> *Subject:* [oe][meta-oe][kirkstone][PATCH 1/1] xfce4-settings: 4.16.2=20
> -> 4.16.5
> It fixes CVE-2022-45062 in xfce4-settings 4.16.5.
>
> CVE: CVE-2022-45062
>
> $ git log --oneline xfce4-settings-4.16.2..xfce4-settings-4.16.5 |=C2=A0=
=20
> grep -v "Update translation"
>
> 83ea11cf Updates for release
> f1cb5bda mime-settings: Properly quote command parameters
> f7707d8b Revert "Escape characters which do not belong into an URI/URL
> (Issue #390)"
> b532324f Back to development
> b9729c85 Updates for release
> 55e3c5fb Escape characters which do not belong into an URI/URL (Issue=20
> #390)
> 341443f8 Prefer full command when basic command is env (Fixes #358)
> 8d4106b3 Back to development
> 024399b1 Updates for release
> af601e32 build: Fix intltool lock file problem during make distcheck
> 0875cfba xfsettingsd: Fix recursive lock in libX11 (Fixes #369)
> 20d866dc Back to developmen
>
> Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
> ---
> =C2=A0.../{xfce4-settings_4.16.2.bb =3D> xfce4-settings_4.16.5.bb}=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> =C2=A0rename=20
> meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.16.2.bb =3D>=20
> xfce4-settings_4.16.5.bb} (93%)
>
> diff --git=20
> a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb=20
> b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
> similarity index 93%
> rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2=
.bb
> rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.b=
b
> index aa4265f7b..4a4e9f188 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.2.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.16.5.bb
> @@ -9,7 +9,7 @@ inherit xfce features_check mime-xdg
> =C2=A0REQUIRED_DISTRO_FEATURES =3D "x11"
>
> =C2=A0SRC_URI +=3D "file://0001-xsettings.xml-Set-default-themes.patch=20
> <file://0001-xsettings.xml-Set-default-themes.patch>"
> -SRC_URI[sha256sum] =3D=20
> "4dd7cb420860535e687f673c0b5c0274e0d2fb67181281d4b85be9197da03d7e"
> +SRC_URI[sha256sum] =3D=20
> "7a4f74802486d7e77a1c9fa4fda19b13fc8a8dec3e5074f367e34fa82b40d28e"
>
> =C2=A0EXTRA_OECONF +=3D "--enable-maintainer-mode --disable-debug"
>
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#100182): https://lists.openembedded.org/g/openembed=
ded-devel/message/100182
> Mute This Topic: https://lists.openembedded.org/mt/95660818/3616765
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[randy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux


