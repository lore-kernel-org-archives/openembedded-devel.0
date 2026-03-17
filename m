Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8527FF33820
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 09:25:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.71933.1773739520771736760
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Mar 2026 02:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Yp+qTQaf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7536a35c2e=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H4nWkc494843
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=PUlM64w2nKDcrJttqfI0iKt+InW5u+P3VVboZCvM+2g=; b=Yp+qTQaftAvQ
	2cFGm7dhP/aUigW5mJ/yEuHwco/7z56D7NIISoPIBxkpFbqginoRWKzOxbhMMDDE
	foWQSGenJ1Wd74cZY9HOMPtxpP9z1mjzy7Y7gUOKMHYITGYctzXKwYVnG22VSwA9
	Ef5lq3QfDAmCDOCJSCXukZmUqFMdQjXspqKTX1E3/7p+npyqm70EdFuxapIm1/Fg
	R9U9WgnfUl1e8S2zoTnq47bSiM2TeSL5hw1FIOpCJneM/dAiufIq6ux5V5hMlI3/
	3U1CWB6/JXB79VwyP5rgQ0df+KojW+S/Xa/5PQmXfLmTL6TMZPFl4HV74K1XLeGz
	GEuC5tdGAQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010028.outbound.protection.outlook.com [52.101.61.28])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvvvyk72e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 09:25:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGH4h57dJ0onK7g11rDVB66qca2q1vqOVxZgizX6kh603O9/tY8jd81/8NLayp5/NUB+p/OdUO6tZyI+VcsGKG8EszYFY4A6xiyf6fnijXq1KcLdOOpuEWLM5d4xHA3ZRCa49qm33pl3tCKexNNIsXUkvsWM6I+ZrYFkTE1QdM8MS0BBvMAX6Q639k0sawAksuzMAHKJ5DbrlDwMrdbU5xHWPHcOdXbw7m0VQxKYL8jvrmiBMrgm06KRXFkA90xGZekci+xe0RmEulkZvIWi0p/Jnvm6JJY3BM8xPV3I9Sjs1CcJ+KOh306jeZPRQLeWckozWrwLD3pyE6vmLHwutw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUlM64w2nKDcrJttqfI0iKt+InW5u+P3VVboZCvM+2g=;
 b=GpxU5/T6oMLG1S71LpLulxcvA2LJFN1+4UApq5RrL0v0MrsazjBl6nmG8IiYIJZSU8GF+qiyKuDj01PNZV5w/Tso4m4KM+p23TFuCfchhUwvld/6anYZF33cwUbM4D3w7tkgpG/2WVGUzBJl5AgBkHtCxKfZd8tj7XtCu2ZCbip2+DoSGOm7zTLFw+PuMHPV0vIx4u9/ar00GtpFDia8Z6qYlZhqerwKOVwyqhT0Gv5fGE/xX7Pny+S/DxxZRvdFgg0u2IwajVEJ1GQ5sUuecre7mOec5D0U28WU/fUH0pyoi9RVkqEuPk3DaY/b4Z3HST/6hVI+DJCUD0Prjol0bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SN7PR11MB6969.namprd11.prod.outlook.com (2603:10b6:806:2a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Tue, 17 Mar
 2026 09:25:16 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Tue, 17 Mar 2026
 09:25:16 +0000
Message-ID: <9e4de336-1673-4ff8-90fc-878f99ff4888@windriver.com>
Date: Tue, 17 Mar 2026 17:25:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] dlt-daemon: upgrade 2.18.10 to 3.0.0
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20260316083826.1550599-1-changqing.li@windriver.com>
 <20260316083826.1550599-6-changqing.li@windriver.com>
 <64b43660-a810-4ea1-a1b3-3015a0c47e1d@gmail.com>
 <9e353be2-26c5-46c4-8cdf-4ea33d24ac8a@gmail.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <9e353be2-26c5-46c4-8cdf-4ea33d24ac8a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0267.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::10) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SN7PR11MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: f8ad14a5-ffe4-4fa9-70d2-08de840719af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ty58+v87pQ14y/7g9zAX+xfzW6ObGaA3XUAC8Q8F/MG35MNYAGfTY6y9s1VfNgW6ssx/Fi1R01lWblMMEKO0Uq6DOJUjeqCJIbq4SuHL8Bg+3ucgwXak10ajSpZkFtC4c5ymbT4pRKuEbH/NeyLJX65Ps3kzB9VoVvOlmlXPsAmm7VPylKBr0cKYQdhOUyMJvXK6DMK27Vopulfj5Gso74lgTtSycO+gK7/2LuWfQ0HlWkRlmwc5DsfNP5A1too8lzmEyGo8reO55QygyHANXiXK+Bc17ytKu6hGwRuEYKjo2r29iPaCAQJC1eoAkixuXxjR2wluEmu40T82uS+N6sdXaFTyg02F09z9mBvoq0XdwqcpX+NuROLCRUJR577eAqDZIZWSgx1pARSOx6DDpz7ufZFWNaar4izLF+XRBMIbd4zN5UbCfBA80rO6F3cL/gHJMjn4Qxs6dPA3Tg+1xpK59WD8v/SX3mpiXtxydqMuk+gb++aBMlFQchGMUfSqoRzNWre7pE20fLAkWpTJ9Pu9CBA7v/kV2Mho9zai7y5aTWOw8uKMg3rW9Ye+bmxdIZl5l7Xx8/kug3QmPjGQcu6OvoPJk73X602uInirisNlufrSwNdaxFhgk8plcnpJDDxJpBTvgGRUdBB9ZUHcMo34X8UpBqurXn+yU5HdbhmHTAIVABc9J4e0Hn2H9Ew2w6WZwVceGvrzHgI03aEa6nYtDKYyGHjxVy2IzV0cxNE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1IrekIwZU1KSnpBSTl4em92ZUg3ZWtxa0lvNzZFZDNSYTM5RW1Nc2pxSGV2?=
 =?utf-8?B?MGFxelJHTGpad2FOWS9XNlgrOXFwQkpLV0s0QmF1d0psZkVpQjdlb2o1VG9S?=
 =?utf-8?B?TFBzbHZEZlZOT2YwRmNiaGxJcC9LcGtYRENjaGppbnFLSWtnb2JyMUplNkd3?=
 =?utf-8?B?bkY3UGtCVDNkWklyaHVTdlpsSlY2Tk9TMG5iS01YR1RwcDlTL050d2xBVCtL?=
 =?utf-8?B?K3dFYUJrU1VmNFFwZThKVVF0Sms4dGtLUzRDSjNqUmdRbzdHc2tzWTR6Q3o1?=
 =?utf-8?B?clF1TXZaTmt2bTJWajByQ3NaMXZDWmgvVEpMRFZUbXVWYVQ0eXo5aEJMTGls?=
 =?utf-8?B?dzZMdkY0NzJPcktPU1lKbVU1WVNnOVZ2QUtsODBYemoxd2pVa0xjcXZiNHAy?=
 =?utf-8?B?VlFKL0JWRStmWVpwMHlFQWlXbTh0bUhheUQ1R0orMHlZN1dzZ0NlZTdmUEEx?=
 =?utf-8?B?RnNTcU8vNzdraXRMQ2lDejZncXRtWnJybkptUENyYW9UendkZ1NIdGpzZm1K?=
 =?utf-8?B?YVRoYjUwclI4R205NzQwdm40dWpzSTN2SGdNY3Jqb3FZQ1Z4Y0ZzQVQrU2g4?=
 =?utf-8?B?SnhoZk5OelB3bGczb0lFM0w1VlRtVVRReEtSdWZQa094aXlNdmVkcTgvRXBv?=
 =?utf-8?B?dTA5UVc0OHBtdkRpb3M2Vm9XSkJzZGVyZkxPbnJaTThJZnQ5dTJpQ3RWMVc5?=
 =?utf-8?B?NThUVFBKKy9lTEc2QVpIT0lGQjdQWkY1T04zNmpFRENtZ29qWklPMUhBSk9q?=
 =?utf-8?B?SmV0b1hNRklPMzd2VWhDbVNmeUdNeUttb0RJOTRUS0w2M09qZngrZmcyaEFH?=
 =?utf-8?B?N040N01aK2hxcHZxUTZ0MjNoeFN3RzBPZDdWcmpsM0F1RlgrV0hKRGxmR0w2?=
 =?utf-8?B?bEVjKzJ3bUVXRW5aZTlObGdhZ3dyOEZXZmxQZElpL3ZBNE1SOWdFSm9Jc0FI?=
 =?utf-8?B?TVMyN2MzOHE3TGl5b3hIMDNRNThXN2NmUUFEcXlYOXRDbCs5aHdoOFdLM2sv?=
 =?utf-8?B?U2pYK0pkK0FmYXBMOUJBK0FWeGxZQVNGZjgxYU44RERFUzJXN3hxVGZaZFMx?=
 =?utf-8?B?WTdtdWxrMzlYOEVoZU5ZN2YzUHgzVUFXOTE2SHJhWkxHQkNtbVZmWDBNVXMy?=
 =?utf-8?B?dDRrWWx6U1dldDk5emNWbzcvMHpxWjFXVnJaaUk3TXdFaGMzSHhXUVZIWUFt?=
 =?utf-8?B?UEd2S21ZdjE3a1EveGdDNFB3Q0pGVHdjVVp1YW5MZ0d6Z20rS0VpMlZzVzM4?=
 =?utf-8?B?S1NXRkE3U1RIemFHQXJsRG5BaW5Da2JxUkhWYS84NnBQMTFsc1p3K0k1L01p?=
 =?utf-8?B?QzZqdjQwT2Mzd2t3YXp5SzJoa25LZ2ZCMTkrZ09tV2w2MElWckxyVTVkOVpO?=
 =?utf-8?B?ZFN4SzRRVGozUzlOSGdqQmJHbHVHaU9pUnVYSm43QUs5T0pwaXhBOENNME9K?=
 =?utf-8?B?VTRueEszcStaZ3JqcTZTVENoZnh2cWF2RTQyVFpRdVhFbndHaDlCRllaU2hj?=
 =?utf-8?B?d0M3WHlXREhXWEtxczhnTnEvWVVMZmkrbVFWVW5WYlh0RmVJbUhIb2UzcTZ1?=
 =?utf-8?B?WE5CSjFRbmRTVXljdVJ3aERDeCtuWmhOb2owRjBXNjIzMjhRbUpURityNHhs?=
 =?utf-8?B?MERoWW9lTVZwV1BlSGI5VXlJZFpXZ2tVcm56cWdheWI3OU9wRlJZRnUxZ2gz?=
 =?utf-8?B?czBsb0lRTklBeWNyUGhSSm4zMXEzTWRpRkhqOFdrSno3eVB4d0M0eXVyRS9t?=
 =?utf-8?B?a3M2ZHM0dnFPT0FRMlNsSlpqOVAxdGRIalBPdzNCMnF2bFA4M0pqS0FZL1ZJ?=
 =?utf-8?B?OHVTbWM1cnQ5eUJrMURiUUNwRktqeFlpa005cTZlVFJVS2FaY2ltcUNwejEx?=
 =?utf-8?B?UVBkWG95aGU0YjVRcEUyQk8waGpnVzBHOFpxQkFESzEvVUI1T1MrK2xiQ3R1?=
 =?utf-8?B?WXNtK1JEdXVUdkpUUFVEYWtNd2JHRWtaSm1IOE5iOERsQ09vTzNLQXMrT2ZT?=
 =?utf-8?B?N2F4QWlESmQ4OW4vVGRDVnBJem4yUlVGMjRuUTBza2hiWFlqY0hPVTJRTTZv?=
 =?utf-8?B?YnhVZTlPUzJqVWdKVDM3aVNPd2hJdmgwN3VERjlkOWRhU09OdUIwSm56cFBW?=
 =?utf-8?B?T3ZXbEU1S3lPRE1Lb3Z0MGYrVnlWaC9jOENVd29UcXNCcU8vUC8xRTR4Y3Fp?=
 =?utf-8?B?a1BiTk5ZUHh5ZFljVldZT0N1SW1XcUxZU0tXblhUd2oxditHaGtEeDdUUUJT?=
 =?utf-8?B?ci9TK25abzM4b3lPVmZTUVE0SVM0enMvZkJ0TS9LbVNJcFpHT2NBaFVxdHNK?=
 =?utf-8?B?M0RadnpOV3RqYVZ3Y0xrVHh1UHcvVzZzUE1GbFVSanoydG10M2Q0UlBoRWsw?=
 =?utf-8?Q?Rm3uJSD6zUZ6WRL8=3D?=
X-Exchange-RoutingPolicyChecked: 
	P0E+gZqg5unQYC6slN1MxUs1xKSyfZCSu7xDE9MHliNq+oOY+Uy9x+poubRxZkM+b236JysrYdAM7uSlgoz/TfUObZhO+RVOUSinnVZ89jgbVHpXnbw2BXzafIEuvVcHyk/lohMYDarTXpXeAPcy2bDXm2wYMD9bQE7Tp/yZedRLEkKv4Nd6K4IuIcnodDkY3KQH0y+Qit7zabybyfdwL1C6l/8643A1u/0+X7bAdb5kGyJLF8YOyPrOkdpLffVKyS4XXmbgp0ujYxlPU9uI/Er9L/ePy/AM/DLbYTm7k18OsB+++nCb+JCg2odqv223w3FW3sNq7s+qXeMW2GUHNg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8ad14a5-ffe4-4fa9-70d2-08de840719af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 09:25:16.6606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7rObN/G84HLLfVtWqMhvN6PZqhkQX8RU/jnGgul6XnQphqbdSxCugFA46T79+HLkGPZRJlehXwZRKCh2xcrspL+nKP2qvm7UJNzSp3y97U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6969
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=E4XAZKdl c=1 sm=1 tr=0 ts=69b91dff cx=c_pps
 a=zBqzCUVTuw7ADAyXD+R5NQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=XMC4lU5bAAAA:20 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=f3Bns0kYH1ALxDO9ci0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA4MiBTYWx0ZWRfX6kQtlyxqUHxv
 Cys9hwcit+K1e3Ci4umU95P7sMI+A9fowwfnlmRt43ReIFnmNDgqeZoceBBeZWB5fWbgiST7YBY
 +iOmWSfkeQTxeYd5VQdNkroWgZe961gs/GtkMycz0LP9iRim/FpOSLH468GUGfSOMecwxfqqQLk
 ZAHnnU/rljUIolzmCAbRWVUTnZuxqQye/SbnR004QlHL0sJsEDvGNbs1ocIY0ikr6Yzz5w507fV
 bRm2alQ4vs9QIi/iSG4NnxJZh5xfKD/YXfh/XFejgvhbZe/baRObF9tb6czefParNpc84jFakmU
 R8P6Fu4R4u2IfgpMIRxaArhWnjZaa6HDq34oddTHp5JrG81utzqxrI6Ou2QK6HrayC0AXHAcvNO
 d1SwQhYMFXVX/HeY4gUF0Vykq5dd+qhJubUBBLWuR4tQZynQDyap5lojp4/4tqyHc4GzCAdzVCE
 1cnJt0mK1Jxs+D7LikQ==
X-Proofpoint-GUID: FJZ___WWYYdPomJhYFYN9wgt2k8jBapx
X-Proofpoint-ORIG-GUID: mhoE77oTZiwzh0jOeT-sKX65p1JWsMZ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170082
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62H4nWkc494843
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Mar 2026 09:25:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125307


On 3/16/26 19:29, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On 3/16/26 09:57, Gyorgy Sarvari wrote:
>>
>> On 3/16/26 09:38, Changqing Li via lists.openembedded.org wrote:
>>> Changes:
>>> https://github.com/COVESA/dlt-daemon/releases
>>>
>>> Remove patches already in 3.0.0:
>>> 544.patch
>>> 567.patch
>>> 0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
>>> 0003-allow-build-with-cmake-4.patch
>>>
>>> Add 3 patches to fix build failures
>>> 0001-Fix-compile-failure-related-to-gzlog.patch
>>> 0001-Fix-kinds-of-build-failure.patch
>>> 0001-Fix-build-failures.patch
>>>
>>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>>> ---
>>>   .../glib-2.0/glibmm-2.68_2.86.0.bb            |   4 +-
>>
>> Is this glibmm change intentional in this patch?
>>
>>
> It seems that there are some compilation failures (different errors wit=
h
> different libc implementations):
>
> musl:
> https://gist.github.com/OldManYellsAtCloud/9ec67b1fae3daa99f2a8d20baba3=
a19a
after research,=C2=A0 this is reproduced since systemd init manager used,=
 so=20
the PACKAGECONFIG is different.
>
> glibc:
> https://gist.github.com/OldManYellsAtCloud/4cd6a4d28156eb486efff8338139=
4913

I cannot reproduce this.=C2=A0 =C2=A0strrchar return char* is aligned wit=
h return=20
type. seems should not have this error.

I build with sysvinit + musl , systemd + musl , sysvinit+glibc , systemd=20
+glibc with V2 patch, all can build successfully.

//Changqing


