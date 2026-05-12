Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E68CD4F26
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 07:54:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.70311.1778572451732214872
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 00:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RxXGuVII;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9592267a27=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C4V39E2962360
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 00:54:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=XswzEVuxjH/+kwxsuL7Lse70eFxefpuhtutaoUpsMIA=; b=RxXGuVIIoCQU
	pDHU91PALN25IdtAqFnkpDA6Fl1vaOOAA4L/KS1Vb7dP/fV0oXXQICbRPsFG0FXq
	pWa/1XW7MpVPU0aUJa/T5LDMypIVpfH6rIo0FReiZIkr4hpIK7XnnO1MShFQ4Wqz
	w/tgAgSupcyTsZeyUCsdtReYgMQpFQKLyBezZ6XHYy3RkWkx4eAB+SOvgG1mIaHF
	/Fa2rThL7XO8Q8wcg3ibrg0u/DDRovZ4lh+BxdFGJ/vFg6RqzK+x7I7R9+zZI8G6
	T6jUrLmDvqG3EzhQhDNhFYXI6HGePNEY0xURHp/rLtFsXw5jsrgkYe2woCqg6P4h
	uB0aDxmykA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010017.outbound.protection.outlook.com [52.101.193.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e3nv90kgx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 12 May 2026 00:54:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCPb6CrpJKpwjo7r723Jn/tDTe/oWprprdNPG/wnPLZsBiwf8JBbJuISpVRxd4JtFUaMquXQY+UzyXxBGne6ZR56dfVxJRs/o9kfIG2Q/un/vOxno+KP1m4SSNpgkiivxj3QzuhfhBZnW3zRTM0vGLe3czphG1wxBwWQK4ouKQRi9H2+ISAM6YZLmppJgYgo/Rh1h4kvc164TO1QGE327KVviqFfPmsOALtWWLXocyDyTZ5GwcDEtoi8yS/NYSTKfzUApstCUuPAfQgWenlVBhB6DZ/bL0ksHSsaFDpTngQVFrT/g/BRO1eCFh5OUd44atdqZXDIvhStTdkdULdyfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XswzEVuxjH/+kwxsuL7Lse70eFxefpuhtutaoUpsMIA=;
 b=UnL7avRSh+oPhfp6BqcN+1eCkQXJcQ9PAqgnNazUQnfI5qIEBHC4/S94NKh1ZiNQiWPvB7MV6kF6e1H4DY9gfGd+4cf3D5VPPvuS92hdIffhXpz9LevQ6VCncdAddqzg0VFeO/tCJJTM9GEuNcOWKYdlSAuBLUQwHTRxx6j+gWevF9b1zTtRspnl71hlW0B/8Nc6ivrRyNG68ST3OZXHx3xw2MEw2xwtTbBfUfz6kgZSmk8RNC+CY9hAx84Qdk7cHhfBDgV5LkCsYxfFZgOaapuUTi/BQoMuE2JL9SSkcoIAZsKSxKZvyPz1BJecucEUBGxpHkC6XBW+B3+hz+v0sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9913.11; Tue, 12 May 2026 07:54:07 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 07:54:07 +0000
Message-ID: <0dc83936-76e4-4612-8ca2-7ee180db53fd@windriver.com>
Date: Tue, 12 May 2026 15:54:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] nftables: improve reproducibility
To: Yoann Congal <yoann.congal@smile.fr>,
        openembedded-devel@lists.openembedded.org
References: <20260511142142.3620917-1-yi.zhao@windriver.com>
 <DIFXDYIPL4EY.3BAEX7B7MNLX0@smile.fr>
 <836eae13-2219-4e9a-82a0-660cd230e687@windriver.com>
 <beba177b-c00d-4ecb-95d3-0b1b64a94dea@windriver.com>
 <DIGIQTEBEP9P.237SS5QSX0NT4@smile.fr>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <DIGIQTEBEP9P.237SS5QSX0NT4@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SL2P216CA0181.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CO1PR11MB5009:EE_
X-MS-Office365-Filtering-Correlation-Id: 34db0786-8295-4b68-4590-08deaffba4ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|4022899009|376014|11063799003|22082099003|18002099003|56012099003|12006099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	ntXPqWZFzBNh4T1P1rcq0SoeYvl+CYx9QsKAuDT2VT6pjj8NZ4EVKNhB3jCJwmf5jqWbUcki3NYRnIQYJ2EKXQ1C1d78+6vCt0j5Ox0k6Fs7e993tWIqlIIAM9tKZCRexBfgj4QcLa+KjGj/JkW1s23uYgcC7Bk705PUgcReMXPFm39GkqfaKSB8KjT2liSBKkUo8+Oa4X/lOcTUoYpSVD10/GczEJhbF9Vk/NWg1H7nDgEUCrkfJ0T/kOvHNBOdH5JACGAZyWjQ04ROEPkxi6jMCtLyBdKHBkPSA68HmA5Hor4u7KRO54MrzylwQQXPTMfLUO738Ry7Hn0vXJR9aidiniLnJxsFHb/cMhatV2zbIJRSk/GoYXXOij46pNlSWWpCowV7AeAmk5+KGP5vLYsMIkx2/Mloo3BjZrdR2jPT6zX26sdVhNBMn6jRYR8TPR0ozApRskx+9ax4vNz74AtyIPvRb+6j+2n5Fm7Bu40IRMDjdNoJuQc9D/4J6QEwAc2Hnd72rG2p1hAHkxKBLQBxBdL/s+ARbijhPiTuRHpN+pA7OV86lTg3u/BjLnBl5ltxUrMw9KamhZAi/r1QlvFIy4foQprvi6bKXb5eD99ZAJTUnjezp42Epzpl98CBQVz45LRmbtceU/KAIRRduQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(4022899009)(376014)(11063799003)(22082099003)(18002099003)(56012099003)(12006099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MWMxdGREOVdVY2Z4TG9KTWZNSjE5WVB0M1ZxSTErWFd3cmluUHMwRUU4bW1p?=
 =?utf-8?B?dm05TEkzRm8zMFA1VkxVVnY5QkhCdXA5SlF2Y29ocktObHJyQjU3T1IvRXd3?=
 =?utf-8?B?Tk1xV0xhNzlnay9EelAzKzF0d1BVSHd3MytRd0t1M1l3RU01V2J5QllqeElP?=
 =?utf-8?B?cTRFVkk4WENLdHBOeExiNHlGZmpCaGYwa1VVQ1RZc2VpelBXZHpmUzZKblFs?=
 =?utf-8?B?WkZsbHNlYWdmRTFRNEJadGZ4QjV4T3djc2hjQ2FSUURsZUNDeEJIMTV6ZVQ5?=
 =?utf-8?B?T25lcnVlRzJTQnV5RkhENTlQZytGMFM1M0Y1VEpXYlVhQU1meFhCODBJR0ZY?=
 =?utf-8?B?ejEwckVxNmhhK0ltc3NSVVJwbkxVbkJYN05HSy9ZbFhoRTZlSG5YOVEzS2JT?=
 =?utf-8?B?dWtvNTFmQktnSnJvSSs1UFBkQXNZd0VyYjJYamUyTWJwL0xROXF3aXcwUGlt?=
 =?utf-8?B?Um84dXM1c2QxSlRpTklJNDh3TDlxNWZWTWdjcHg5eVlpNVA3dHZjNHR3NzI4?=
 =?utf-8?B?QjlpdHg4UHhCeERtVUpFb3VEM1YxNXhQZTJSRkFlNGFlMXY1OHBvaTBBN3Bx?=
 =?utf-8?B?S2JCZ3NkSzZ3ODV3NGVuOXZrcEpvNGNSL3J1NEU4OTZlajhKdXN2NGVzWWQ4?=
 =?utf-8?B?MWk1Q05leklBVms2VHJPcGdtRGFsS1E5S2VVZFpnalpMMndkTU9aaEVLS0kx?=
 =?utf-8?B?SDdWN3FwZERyWFdMSUt1ODJsd0JXeURJQ2s4RGNrK2pBazlFamxpcndxNEg1?=
 =?utf-8?B?T2tXMjlFVmhMK1puQmJCVjdnb1FDUXc5QjFZdmREWGdFbW1Ic25TVTBieGtm?=
 =?utf-8?B?SmxUR2dScVVFd24zRE1xT2dFTlQ0ckpUR05pck9zZVdHQ3hIM2hHSlZhVGlj?=
 =?utf-8?B?THFvc2haRkJtcnM0WUU3SXQxR3l4QUlvL0Ezcmc3eDc1eUptZXRuQ2Qva0li?=
 =?utf-8?B?VFFtWFhYeStEajJKaW5vcDZFbDdOd3puTVMrdzY0T2VqVkdKU1paREJVR2lJ?=
 =?utf-8?B?QlF1WEdDMExaRDNnazVQSXBueVlLT0ZrZDF6THdxcGFvS3Zxckl2akc4MXUz?=
 =?utf-8?B?V0V6Q2RNVEtjd3dtWklQZ0lvY1VEM09kTXRDcDBGUmNSRWZyaDdvN2JvWFZz?=
 =?utf-8?B?OVFaSGRlUEZKblF3S1lwYlhwUlROcHc0TWtkREJDMHozN29CYUF5VTJiNlJz?=
 =?utf-8?B?VDlINDMvdytLYUVUL1lUbkxUQllvTlcvZHQzSVpXeklvczh1TC9hSTRCRFli?=
 =?utf-8?B?YnNuNW8rbTZpOGlJL05KYWcwQ25Fcm5uYkw3aUJCQmo0WGZib013UytMekt5?=
 =?utf-8?B?YVdvU3hURVFpOUFMTjEwWDRQcTdGWktGb05PZ0I3b1Z3R0RXUEFQKzkzZC9S?=
 =?utf-8?B?TEtkTVNRMVJYcDhHeTl1TXZBa0FxWG1qMDRDRm5UUlUyZmd5NWlPQ3BlTWR1?=
 =?utf-8?B?TmhoUkZtWkZNbHplNUlNSXcvS2pBYUVvS2pPN1BiTlZENHZwSmVEVjlHcW1q?=
 =?utf-8?B?RXRpTHlkUG1EYTA3ZElLV3FNOFlRUDdHY2pQcGE4eHk1STBpVXdKek45bWoy?=
 =?utf-8?B?cnlkZnlHQ2FQSTdyS2N3Sk12OGduYkRudDFVTHc0U25DeEE2MnZYZHlkd1o3?=
 =?utf-8?B?U1IzQkN5dVpYcVpWaGZRdW00RUI0aU9zOFZ0a0YwSk9BaUxzVllIaG5HWVQ1?=
 =?utf-8?B?OVNObk5jQ2tXNUF4Zkc1RDlBZ2JDTEdhd2RNWGhBOU9jaWtZb1hXZHhiL2ZM?=
 =?utf-8?B?d3ozNjRTdk1lcGY5ZVJPK2kzTjZnNFBxSTYzT3c0Tit5aGNsVWlFYk0wTUJ2?=
 =?utf-8?B?V1YvYnpvaW5QLzNwcjBCbkRUaWlWcm5lT3dCQlBHRDQybXBwdjljdlc2Y3VD?=
 =?utf-8?B?ODZyZmRKRWplcExyZjIvVUQyYkJwcDY0eENmQnU1cEMvcmVYa25zdXJ0aHlq?=
 =?utf-8?B?MmsxM2xneWV4azdCYzljMlRvYTd0NmtPM3RKVU1oY1ZsUC8rUE4yQ2pIbHhi?=
 =?utf-8?B?NGFhaFI1VXN6bHVoekx4ZHM0aE5QRnc5SmtpQVhyOGN4TkZ5dWhEWUJtWlZo?=
 =?utf-8?B?YVVMY1QrQTNBWDU0WEFqYVE0anhVelZyQkcwZVB2eVE5TTBWK2RqUEJBZmpz?=
 =?utf-8?B?UXV2R20zM0tNeVVRb0VEcXNWcnBadUdjSTZGOVJNakJNV09XMDZEUGE2cnJq?=
 =?utf-8?B?REozTWZKTGt4UFV2N0Y2VDRLajFXZUNMZStFRmhhMnR4bXIrelpNd1dvTEdZ?=
 =?utf-8?B?RDEzUFVZR1JYR1hSSk5DZkhqa0prS1NYK1Fwb2F1SktrVE5pdVlEWmFZMkpH?=
 =?utf-8?B?RTAvNlFnY3FKcEdVRFVJMGgzVzdRMGNueUxXcVVMdDVvYWR2V1F1dz09?=
X-Exchange-RoutingPolicyChecked: 
	t1OdDiH67l25VWTiyR+aEcIvNS4QZ7kkOLcl/YueklaqnWHkxrgmP+wWGgaoMv5aPA+Hz4ceOzpoTjExUKot+RPUF4GQyEuZTQpUSV/db9+cG6qdDTNTcI6zkqJGkEos2ikrpaY6Oc+EOrh/4kfZvjAXqSLfuzbidhZIpTs6Caz8MF5ZNZZu1ZwnQcFeIZdFDUUUXIQkVyvZHw5yUZLFZd9Zxab4nspsBjbHn+8UE/UNxWE1+/FVHuOFEAQ46IqbrcSTGwHndTTiItwIfDxtppQ6WYIpSSOR0ElA1Eq7ayGA8iWoHMwyMekaY0MQzBVmkfmW8Ps2PtHq2lUjG/MPSA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34db0786-8295-4b68-4590-08deaffba4ca
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 07:54:07.2131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHL8jakx/ZBrNM/vBUQIX44IIXgEDqXxdB2Sab/FyCuMtNxqyXU/su114kbmHmnNCbP5vfNBZIt4Q1jjIfEEQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5009
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ux2zh0n0OWl8gzxyd0DBxamwe89qyNi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA3NyBTYWx0ZWRfX2r5ANovC/4am
 2HJLvleKZTSr1kJIQHAab/rRl/qRVYZ0kMf50HrkXLP81wLNx+IkFBuryKy/SVCGd2mtoF0Aa+H
 d3+UgEackdIM00KR6KBxCHzjLWNxXgTmVh1JVHRh9FQStPThzuOj7XRY19fynuoHXs2dyDhZEq7
 l/pJiU+gzsP0JCfu48mS5NB7Pq2gTsXgi778UTQUsDbuHNc9gm5ndcCudpkzXohS5jacaypM2sX
 vtPjXwVLjp19S9Irv8iEOOaBcd0ORn4FlmiLqj9HMZ9atc4thJaKOaFYdW9IMSEcn7Rq7FUNXwa
 +UmXYUVwnqJQx/KQTJBwPeAPtBbchuv8VkjCpml0Akqu5Cil1UQ/DJ/Pct2jrj+y6UvlmYEIE7R
 cQwOyHUBY7KwqA2fNRetYqj2tH+r3f12sN3Lm0K0RFYKmOZ/xTqrEEzU3dirTjb9FvXnysfEwK1
 mxMyaYwm9+D+QUNrHjw==
X-Authority-Analysis: v=2.4 cv=OaWoyBTY c=1 sm=1 tr=0 ts=6a02dca2 cx=c_pps
 a=ZlG836pX3zBvGR9gn4UHEQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=SsMK-6ewAAAA:8 a=3HDBlxybAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=uWR9H-FPo1m1SLhwROoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=49hUO6naoDravHwzbBTq:22 a=laEoCiVfU_Unz3mSdgXN:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: B5xDCxz0_5mFS2g-FJ-xnM7Xp9mY_jCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 64C4V39E2962360
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 07:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126861


On 5/12/26 15:27, Yoann Congal wrote:
> On Tue May 12, 2026 at 4:02 AM CEST, Yi Zhao wrote:
>> On 5/12/26 09:00, Yi Zhao wrote:
>>> On 5/11/26 22:43, Yoann Congal via lists.openembedded.org wrote:
>>>> On Mon May 11, 2026 at 4:21 PM CEST, Yi Zhao via
>>>> lists.openembedded.org wrote:
>>>>> Use SOURCE_DATE_EPOCH to set MAKE_STAMP instead of using the curren=
t
>>>>> time, thereby improving reproducibility.
>>>>>
>>>>> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>>> ---
>>>>>  =C2=A0 ...-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch | 34
>>>>> +++++++++++++++++++
>>>>>  =C2=A0 .../recipes-filter/nftables/nftables_1.1.6.bb |=C2=A0 1 +
>>>>>  =C2=A0 2 files changed, 35 insertions(+)
>>>>>  =C2=A0 create mode 100644
>>>>> meta-networking/recipes-filter/nftables/nftables/0001-configure.ac-=
set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>>>
>>>>> diff --git
>>>>> a/meta-networking/recipes-filter/nftables/nftables/0001-configure.a=
c-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>>> b/meta-networking/recipes-filter/nftables/nftables/0001-configure.a=
c-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>>>
>>>>> new file mode 100644
>>>>> index 0000000000..7d2f9c0dfe
>>>>> --- /dev/null
>>>>> +++
>>>>> b/meta-networking/recipes-filter/nftables/nftables/0001-configure.a=
c-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patch
>>>>> @@ -0,0 +1,34 @@
>>>>> +From 77de073b1cc7413b1d230995851338345d56a8f8 Mon Sep 17 00:00:00 =
2001
>>>>> +From: Yi Zhao <yi.zhao@windriver.com>
>>>>> +Date: Mon, 11 May 2026 15:52:29 +0800
>>>>> +Subject: [PATCH] configure.ac: set MAKE_STAMP to SOURCE_DATE_EPOCH
>>>>> +
>>>>> +If SOURCE_DATE_EPOCH is set, use it to set MAKE_STAMP instead of t=
he
>>>>> +current time.
>>>>> +
>>>>> +Upstream-Status: Inappropriate [embedded specific]
>>>> I think that this patch should at least be sent upstream.
>>>> Reproducibility is not "embedded specific".
>>>> See https://reproducible-builds.org/
>>> Thanks.=C2=A0 I will send it upstream.
>>
>> I have checked upstream and found that this commit[1] in development
>> branch has already resolved the reproducibility issue. However, since
>> the changes involve multiple patches, backporting them is not appropri=
ate.
>>
>> Therefore, I think we can keep the current Upstream-Status in the patc=
h.
>> It will be dropped upon the next release of nftables.
>>
>> [1]
>> https://git.netfilter.org/nftables/commit/?id=3Dca86f206c92704170a295b=
8dc7a41f6448835dde
> Awesome news :)
>
> In that case, your patch could be seen as the "Upstream-Status: Backpor=
t" of this URL...
> At least, please add the URL to the patch as a reference so this
> precious information is not lost when the upgrade will happen.

Thanks.=C2=A0 I will send v2.


//Yi

>
> Thanks!
>>
>> //Yi
>>
>>>
>>> //Yi
>>>
>>>
>>>> Regards,
>>>>
>>>>> +
>>>>> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
>>>>> +---
>>>>> + configure.ac | 5 ++++-
>>>>> + 1 file changed, 4 insertions(+), 1 deletion(-)
>>>>> +
>>>>> +diff --git a/configure.ac b/configure.ac
>>>>> +index 6825474..2b147af 100644
>>>>> +--- a/configure.ac
>>>>> ++++ b/configure.ac
>>>>> +@@ -165,7 +165,10 @@ AC_CONFIG_COMMANDS([nftversion.h], [
>>>>> + ])
>>>>> + # Current date should be fetched exactly once per build,
>>>>> + # so have 'make' call date and pass the value to every 'gcc' call
>>>>> +-AC_SUBST([MAKE_STAMP], ["\$(shell date +%s)"])
>>>>> ++AS_IF([test -n "$SOURCE_DATE_EPOCH"],
>>>>> ++=C2=A0=C2=A0=C2=A0 [MAKE_STAMP=3D"$SOURCE_DATE_EPOCH"],
>>>>> ++=C2=A0=C2=A0=C2=A0 [MAKE_STAMP=3D'$(shell date +%s)'])
>>>>> ++AC_SUBST([MAKE_STAMP])
>>>>> +
>>>>> + AC_ARG_ENABLE([distcheck],
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 AS_HE=
LP_STRING([--enable-distcheck], [Build for
>>>>> distcheck]),
>>>>> +--
>>>>> +2.34.1
>>>>> +
>>>>> diff --git
>>>>> a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>>> b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>>> index d27e60a18d..5ab31f9b0c 100644
>>>>> --- a/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>>> +++ b/meta-networking/recipes-filter/nftables/nftables_1.1.6.bb
>>>>> @@ -12,6 +12,7 @@ DEPENDS =3D "libmnl libnftnl bison-native \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'mini-gmp', '',
>>>>> 'gmp', d)}"
>>>>>  =C2=A0 =C2=A0 SRC_URI =3D
>>>>> "http://www.netfilter.org/projects/nftables/files/${BP}.tar.xz \
>>>>> + file://0001-configure.ac-set-MAKE_STAMP-to-SOURCE_DATE_EPOCH.patc=
h \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 file://run-ptest \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 "
>>>>>  =C2=A0 SRC_URI[sha256sum] =3D
>>>>> "372931bda8556b310636a2f9020adc710f9bab66f47efe0ce90bff800ac2530c"
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#126851):
>>>> https://lists.openembedded.org/g/openembedded-devel/message/126851
>>>> Mute This Topic: https://lists.openembedded.org/mt/119256992/7283133
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe:
>>>> https://lists.openembedded.org/g/openembedded-devel/unsub
>>>> [yi.zhao@eng.windriver.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>

