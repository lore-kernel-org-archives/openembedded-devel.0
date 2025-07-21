Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839EBC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 08:20:11 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.35544.1753086008218311107
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 01:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=929781a5cf=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L5Z6CB1158905
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 08:20:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09rkt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 08:20:06 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 56L8K6n41431518;
	Mon, 21 Jul 2025 08:20:06 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2067.outbound.protection.outlook.com [40.107.223.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4800k09rks-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 08:20:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbvMI80ayypm3Xy5E/IFlGksv1xoxWKZ02C2S8gi1V6/lOKOy42SH1dt3/gDuyZfMeN6gTqYUvYAXyGOi0nb2Zn/mP8uCEe34/QQb+V8LjJ3YW0E6r/t7QfqXczdwuFcw6t/EA8QHcsKLYMjmk7Bo2Og0qpQUDQJhLYhsJ5b/UTsYgf+uk+q1BaUUrSAN16gIQcef/w6ctE4gmlOgjzZ9ePVnblLPeiZTcCOyoqthyVM2ID0+PbBbziO6B3z1t4FllYo5mMB9fpzuikSjWNF7ZwsNSdAHtGz++XZ+NcNdBmea3iTBKKnFj1XAt91hnUpcqDroL9oDb9aBKakNtE5Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Is89ipXm2YIL8Ml+6KLgqQbjPiz7PCHHGtOy3CeCqp4=;
 b=JRDFhKE2WjEsIMpdDwhxPQAlNw63ye8C4bBz5/Op04KxwDb0TzaNG+cakebGMUws7jLLyf4F3sWZheKziH2pmFmKmZXoJlFbKshSg92FhOsUesidMMt+uHsBMIzI0piWBGSRdJarUjYQ0WNvo/8I+eYa6b2fJiqpboiYFsEEgMpqnVJINjUwvskkkC8yvxvw2ayDUI8/IwM4wm8K1HAjtVp7xO6+w2okPNS+HJNUHFWiXG7I7G2Pjo1mQF4t7r3KXiJisWBi3Ez/GRqaHzHVdCcbK1Ce3gEa6klnKnIlxn98HlDu7d6I18cZv9kQHevFFUjn8yzbs4pkYaTHEixALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7169.namprd11.prod.outlook.com (2603:10b6:930:90::14)
 by SJ2PR11MB8346.namprd11.prod.outlook.com (2603:10b6:a03:536::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 08:20:03 +0000
Received: from CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::c173:acfb:56ef:8120]) by CY8PR11MB7169.namprd11.prod.outlook.com
 ([fe80::c173:acfb:56ef:8120%6]) with mapi id 15.20.8943.028; Mon, 21 Jul 2025
 08:20:03 +0000
Message-ID: <181e8bc2-3623-46e3-a924-d29f4425186c@windriver.com>
Date: Mon, 21 Jul 2025 13:45:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][meta-oe][scarthgap][PATCH 1/1] mariadb: upgrade 10.11.9 ->
 10.11.12
To: Gyorgy Sarvari <skandigraun@gmail.com>,
        openembedded-devel@lists.openembedded.org
References: <20250718122620.2501365-1-yogita.urade@windriver.com>
 <7b701fcc-5b24-41dd-a0f0-4bab2843e162@gmail.com>
Content-Language: en-GB
From: "Urade, Yogita" <yogita.urade@windriver.com>
In-Reply-To: <7b701fcc-5b24-41dd-a0f0-4bab2843e162@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P190CA0016.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::10) To CY8PR11MB7169.namprd11.prod.outlook.com
 (2603:10b6:930:90::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7169:EE_|SJ2PR11MB8346:EE_
X-MS-Office365-Filtering-Correlation-Id: fc27c3ed-0e94-4203-255b-08ddc82f641e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dzAxa1dkVXBLVVAwcXVEU01pSVdYLy9LR0wrUldyQi95OXQ4dUhkWkkybzU3?=
 =?utf-8?B?aVZtRjZZODBVYUJWN2M1eG9FQUh4M3NKVlZMVnRJQ2k2cHNibVlPaU9uOFc3?=
 =?utf-8?B?aGw2RG8zMitMY0xGd0IwU2NaZ3VORkdkQlBJRENnRFpqUmJhbnUvOGRRVmZv?=
 =?utf-8?B?V242ZTdvRTFmN2kyTU9NM2xOTjM4Yy9hZE9GbnNwQkExYUJpQnNsSy9USDA2?=
 =?utf-8?B?aEtXUlg2SDZzSU11K0NMeDhxWGQvTDBCeG1sT25jc0g2QlMxSzdtSHRabkd1?=
 =?utf-8?B?VGFOMnI3bkpRa2YrbkRCRmpicnZXTTV1Z1BReFVDaWZkeHdRZnVSTlVNb3JX?=
 =?utf-8?B?R1B0ZVRvb0t0cFA4ZC9RZWNBVWl0am5OMzNlMWJQL1pyZktFY1lxQWtYWmhT?=
 =?utf-8?B?dmVUQkExV1pPVGg3MnJDYmN5YVdFYVpxbHduR2VzZDBqSjZiQzlsRVRUNlEr?=
 =?utf-8?B?MVVTZi81VWN1YkNsZ3l1aEw1bC9qMElyN1lmUmZxVjd3M2V4dXliNW5Va2tB?=
 =?utf-8?B?NHNHdFl6TU8zanRvTlFEUHdoU0VoQkoxSk0zOHpZeWhRTVRKblVZU2RwYUpV?=
 =?utf-8?B?STEzQ2lJdkJydVpIQitmbWQxTFdkcFA0dTlidTVISnVmWmVxOUs3a0NFY01r?=
 =?utf-8?B?OVNWcGZ5aWg3eFBJSGxSQWo3Q0V3cldZalFHZ1RZRnlQN0ZiQzZCd0JNQS90?=
 =?utf-8?B?bXJpZW1FNGFsaFlVeHZWd0ljdmNiUFpWMUlOV21sOE9ZeVdyQWhQN1ZGcWVR?=
 =?utf-8?B?L01samJwakwrclJPV3ljQmdzOGtWN1E1WnR2aVp0SE1XaWdweHNheE5qZld6?=
 =?utf-8?B?dTRtTDRZS1NjUTQ5NHpteWdwYXhCa1BrSi8xSW1iMDVOSEpDV2R2Rmp3ZFg4?=
 =?utf-8?B?VEpBR05NSlppUVdUK2FpU09UdDVzNzVyaVhWMlFPMVdVV2xRaDIyTC9pbG92?=
 =?utf-8?B?eFV4NzFoVVBOb2VqL1djZDh6ckI5RmQySyt3bTZFTm1XcU8xMXJZS1dlL2lP?=
 =?utf-8?B?dGsvVHRHWmFmTXQwcEFvcFByVGpwVmxVclArNWdNQTVsWkpRUzNuUlhmUzl1?=
 =?utf-8?B?SjByWG4xRlJVZGY1ZG81RFhITS85bWdWYjFac0hNWDZOYytxcGJOdWxHUlho?=
 =?utf-8?B?dU9kT2g4am5tMGV0dlBLamhEelZWNjQ0RldCSWZtU1NReGgyeGZXQVppUXNu?=
 =?utf-8?B?eHVBZFRQV0hiSUJSb2VpM3d6eDBoN1liNys5SElqTCtISXEzS2VBWjN1ZDQ4?=
 =?utf-8?B?QzVMYVpWK0dVemN2WG5CT2thVVhQcUJhMXI1NW9kOXZJdDlydW03TFFYYjh3?=
 =?utf-8?B?dFRzc0ZZaS84cUEyZGI0R2VtMmhkQ2o3QWhiZUdIaUs3bFE2YU5UZHlLMVdi?=
 =?utf-8?B?L2h5aHR5cHZKWUJsY0ZNY2ZtZFpSYXFqSXdtOHFHWXJ6TVMxc1EyZnkrZ25m?=
 =?utf-8?B?UXNGamgxQkwxblZpZEFQbDY3bGhkNmVRSm0vWFJNZS9jdzhNcjZPY2VyQlFn?=
 =?utf-8?B?MXFUOVBCK3NyZzNZUzdndWNMY1ZUMm9haFNGK3NGbzNDM2o3RTF1Wi9CbVlF?=
 =?utf-8?B?Q1FGWXVCcDdJdkVkQ00xRUh1N3dkL3UvK1krN3pBTXhsUWxtdHpQS01idXpN?=
 =?utf-8?B?aC9PbTEwTHFkSE1TZThtVzVyMU1Ram9jQjRFcVhCWkZKUnQwUE9nZDN3ZTJs?=
 =?utf-8?B?eDRwSDkxSzZYWGFENWplZ2JsWjdwbVpHdy9XbDNXcGdEM2RGbGRNUVViYmQ1?=
 =?utf-8?B?cVJRQ3pPU1ppa1ZVcXhDYTM0QmZ2WTJFMEt0bGplTWF6ZXFQcmFjaXlLQVVN?=
 =?utf-8?B?cjY1bUdPZVVySTNKbXFyMFZZUGorTTV4WVV4d0NVQkpvVUhlTGFDZHdXYXJF?=
 =?utf-8?Q?rHA3UPZHhk8Js?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7169.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZGU2UjNxS2p1c0JkYlZOUFJsODB0NTQwMnFISVdzRXRJSW94WkJnOU5vMEJ2?=
 =?utf-8?B?SWhVL3JtRG84ZDdVZWx0SnAxekt0WCsrNTJQQXNhL0hFYjlYQlpERlZoT3Zw?=
 =?utf-8?B?VHU5eXJwaWY5bGxMNG5aWHRqQVZidVhiZGQydGNwTDZVRDYyRkFuOWt1OVAr?=
 =?utf-8?B?UlJqYmhwYmQ5QS9PejVCL2ppZjZLVjlrQVViVDk2YlI0MUhLaWlsS1BBZWFi?=
 =?utf-8?B?VlVsaFlQM2pQenhJcHZEL1JsaytSY1krUVJiRjdhaUVRMndrWVJTaU9UWlI4?=
 =?utf-8?B?UVNFRDVTYkUwN2JTWkk5VThBSUxpa1dEalRXczhWZXArL0hFV0VrblZpdlln?=
 =?utf-8?B?cU5iVEJVNDljdndJOWRUaFRJVExjWk9FQ0kyVFdkWFF5eC84aHBuQmRVMEsv?=
 =?utf-8?B?d29ReGhZNjY4Um1VanZkbEdGank0VndKdEdTc1ZEZ3ljeFJTQ2hEN1owYi95?=
 =?utf-8?B?bmhxbGJCSkFoMGZvNjBoNmNzOVQvNHEzYVlRd09JQkU3TGZCdDBuVGJSQXpz?=
 =?utf-8?B?K29Kd2ZpYXVEa2RFZyt6NkRoZkhPNllMRVBLRkVhcUpkRmVWbENyc29nT0FD?=
 =?utf-8?B?M25abWI5aUZxTWNmRTlMdEhTWFFOUzlkeHExODYvM2FRZFB3UjZGdGpPSnZK?=
 =?utf-8?B?SVlIMnlxZkNuTEJ6U1FnVDZFbWZGQmlKWFc2RnFIVmZEWk05YWRBY1BsVFhq?=
 =?utf-8?B?elJob1lwZWhwaCsyelA2QmFrL21CSnp4NEVrblFKUzdoOTR4ekJUdWlTY0FQ?=
 =?utf-8?B?UytIVjFYVGhhUElhWVA1WjhDdHFSbUZCKzFuUFhCaVE4R0VUZFdrblVWTkho?=
 =?utf-8?B?RHQzZEs3YWtsQXhzNk9pMWFueC9vWUNza0JYWVYyYlRpekVua1pYYXlpNWJU?=
 =?utf-8?B?RTdweGUwcjZYZWtsandLRm9jakxpZWV0bGxwWkJQQVlxR1k0eUxnVkJUdjdP?=
 =?utf-8?B?QXVRSFdUNkFxNDJOczhVZ25mbi8zUnBCL2R5TFloTFFtOHFsNVN1M2xGTGFK?=
 =?utf-8?B?dUM3bWZMYUJWRXV5c2hJV0IzTTJ2WFpYYTRURmU3cU14SmxQNnZJVmxob1ZQ?=
 =?utf-8?B?UmtHS0RncVk2QTNXSldoNTNCQURaQzlNUjEvWFUzV1hIdHFIQkZTRXU2T2Rs?=
 =?utf-8?B?cjQvcCtodCtRR0srOFBOZ1l2V1lnTHlsd08zTUtUWlFrclJjOUhTZkVPQWo1?=
 =?utf-8?B?YjFKWkUydlBMamRMeXlCUU1PeEs0KzhRM1dQUzhHak9kc0VUcGJPNDM4U0U5?=
 =?utf-8?B?T2dwWitYbkRSTVpmVEdEcWhuSlY1bjlwbDhNbWRDZ2xpZVZBMmdsb3VEREYz?=
 =?utf-8?B?TDcxL0dEcEMwblRsWmhLbVFZSnpkVXdGa1JpNVllTjlhc1IvOVpldS9XR1JT?=
 =?utf-8?B?Mks0bFh4b3pQOTNPcXduM0tSY0xVVEFQZ0w4ajJrdG9SVzZSTlN1UzNCNzM4?=
 =?utf-8?B?YXlIMlBkMldDcFBOSzVJQ0JjYzhKeXVOVFdtWlozU3FDb3Q3RVU1Lzc1Zmhw?=
 =?utf-8?B?blU5VTA1QkYvbWhKZ1dMZnNYdlAza3k5YnVCT05SMkdSMENJNU11QWllTjJC?=
 =?utf-8?B?RlhXaWdjd1BUUE95TzJnT0ZCT1pDVHF0dHBuZURQeXU4a0pvZmswR0crQUhi?=
 =?utf-8?B?bXRCWjBCL2o1TUd0bW40a3V4M1Vnb0JTZkI2Y1hSQUVyUlJ5ZndkblJEcXZN?=
 =?utf-8?B?UEhsbHNLVi9ubXZGQVdlZ09lVXYvU2htdTdJN0owTlJvR3NkNjNvQmR0d3d3?=
 =?utf-8?B?U2pIU1h1OVdKOFJ1aXpuRDJ3T3JCcnpTYlJlcUN5UmxzSmppb1lsQzFsUUUx?=
 =?utf-8?B?d2ZRdU52ekJKNSsvRUtLMmZzUTY3aXkrQi8zbEsvemxrTEpDUlhPNzhBSlpq?=
 =?utf-8?B?dWpDb1NZanFkaDA2RzhvTExoWldRalU5V1MzTDg4NCtDMGMwU1h1TVdvaGky?=
 =?utf-8?B?NVRmS09oNTRNaGtkS0tlV1V0TGlkcHRrM1NCN2R1aWRkOElmdDlXMzJFUmlD?=
 =?utf-8?B?RVhuenlTUlVnZENXZHFzL2RvNG1raklZa21GTGp5ektJK1Nub3MzVEJjaXFz?=
 =?utf-8?B?bFVIWHdxcDhYOEhZV0NKYkY2bEs5cjcvNEREd0ZPV08zemtRekNFMDdleXlJ?=
 =?utf-8?B?TlFmN2FMTEF5V004TVozWklsM3lEVnp6UzlvVk1WY2RPd2tsTW9ieG1XZW13?=
 =?utf-8?B?YWc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc27c3ed-0e94-4203-255b-08ddc82f641e
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7169.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 08:20:02.8568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LP2tR55blkCf2nEkIqHnqNn8NVq4OpYdLiCuB3dSKnDKxpcWyIekZS4953VcemgGqZHVhZZmzfFGiLE6rlJdmezAkBpQkOo0iV4i2Hoc4Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8346
X-Proofpoint-GUID: SDOzBtQGfFWfCxtvLvabTN9rqtQLZVa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDIwMSBTYWx0ZWRfXzx+sJ9E5p2Up
 io+oHmfD9kPG0I4D97yV040uqGqrS4IQC7rBfZfEDMlfxT3VPU5veXDWBEjcpuM/0EI51i3uDeh
 9IVpI/oxTtm1Z610Wut9ARjOzWHzkzaPvwz9+fVRbhs/7Hn4xXh8ENpWp/C0XGf3aCcYkAtHvjt
 PzvUtwY7ODxlfsZIsK4OpuqWBjSDfBmVJUt3dswiYV8xLZGfZIn0j36Ys83TWlaJK9YHR+cdnf8
 h/Dbkiejlzc09xTUWNwC9IQfKG2FSQMxwVZUoY4aYoDH5c5AdGDyBRPiapxaOjO5xySjmApeg5e
 5XhL/gGbMOutSKv/uhTKVK83yAo1z1waFcgLmVF+pLcb0TOJo0ntuUUVrBEojY5S0zyBYLidInJ
 DdcO9KBW
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=687df837 cx=c_pps
 a=vLlm6fOi2ONy/6Pih9zO2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=jpp-Wi3FAAAA:8 a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=lCjc_U5ZbssCkvZfm7sA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=3HWhRrkoiJongTt84g_J:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6awxRY6kjOdFSdUKozCMa3Jqz0KJF9OG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507180201
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 08:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118654


On 18-07-2025 19:12, Gyorgy Sarvari wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On 7/18/25 14:26, Urade, Yogita via lists.openembedded.org wrote:
>> From: Yogita Urade <yogita.urade@windriver.com>
>>
>> This upgrade includes fix for CVE-2023-52969, CVE-2023-52970
>> and CVE-2023-52971
>>
>> Changelog:
>> https://mariadb.com/kb/en/mariadb-10-11-12-changelog/
>>
>> refresh 0001-Add-missing-includes-cstdint-and-cstdio.patch and
>> ppc-remove-glibc-dep.patch
>>
>>
> I think that ppc-remove-glibc-dep.patch can be removed altogether. It
> looks like it was fixed in
> https://github.com/MariaDB/server/commit/dff354e7df2fa774ce4da77202a17e2cae99ac59
> which is also present in this new version.
>
> (Unless I'm mis-seeing something)
Thanks for helping me to catch that mistake.

I will send V2 version.

../Yogita


