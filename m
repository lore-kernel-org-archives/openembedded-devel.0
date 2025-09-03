Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F97CA100B
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:37:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.6219.1756881452694900263
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:37:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=f9yRxfBH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1341c1fd9b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5835vGOo560664
	for <openembedded-devel@lists.openembedded.org>; Tue, 2 Sep 2025 23:37:32 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=FgjDBYBChef3tm/bFDF52W
	8mMOezQ3vt9vAmjLXaWbI=; b=f9yRxfBH6ZKRgyBZDq4t7RUZqIfkaibhe5NjcX
	QORQ2AOKjMXe8SijycfdmCO3Nnz6jAhw39JUOc7knTnehTCfBbI/09WmSsn4xNgd
	A9cXlUpXXvNQsJQyk98cTHLUK3FGnvC2J02dqLXnonku36gR9/hYfXOPEE3Y0Mk5
	xGUdsVpA6MzHxZ+gfydcq1xuyPKWixP+n/N9QBLMuXHGcZd2YLU4zTucLgl4LJ/f
	PPC2jPgHZFb4e0IbtTGhNWzRe8FlC0cqfXcSQciZZkXc0g5j1GOXRB/MHeESH6Yw
	PNMR+0PPYtxOzsLfHFysKeFtvL0u4v719k3/OuXcvD/f8fYw==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48uvjyukke-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Sep 2025 23:37:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1b8617ElEt9pycpXjk1+mrDJ5BfOr2PBkNIrlo9GhaRR2SoE1Yswzg/+nHN6KmhsVxexV64df/ZgUNg0zllu6kLTXrcUUGrdCklxLM3YvZSRKM5jylVFQ2t38oMWA9A+HCsH2pCRolPIu7yY/41nezYPi6Us4w27juUbOnurv9UN9a8SXSQR/mUEFJqpZV/JzdVjcga708ymQJGLKQ9Dln7kHo0sHAn/Lro2te0WgVBn23IXu92rayNyJvcBbHMexjE6txyaEJ6umZCmhlD/KCa87X8L6IAxd3LqkUR0s/4xO0niyamqnszY09lwP1WyQT55N+5wJLSvJ8BwB9AYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgjDBYBChef3tm/bFDF52W8mMOezQ3vt9vAmjLXaWbI=;
 b=u8h+k59Yf94ZbDfN6cO1f3aV/69zytXuIEIih+LQm7d73ZO/SqhbV9Wq1hUT531nqneWWhZ/8DP+UiXtqRiBh3+nhsbLaDE3f6KVJ2PPuOMP0MrH8tZlsb3hscqGRyxMUwEkZj/LHWr8+Hbeaigr1fTNA+SczWWI3+/1KXxmcm+ietfLgj8m9El2oqgp+DP8j9DOj3HxOUEZWL6IoBcNnWJHyc+JBfr773aHvF7ap93jk7J1TRzNIFU6EG8AnnzNjVWT7+KiCUP39Olrt3QC1aH9lkxLQu/I/2NTj3bwc4z+kiT/Kd5UBHImgC24k0PC135LftsMO4PdTCxk0VUIFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS4PPFE901A304F.namprd11.prod.outlook.com (2603:10b6:f:fc02::5b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:37:29 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%5]) with mapi id 15.20.9052.019; Wed, 3 Sep 2025
 06:37:29 +0000
Content-Type: multipart/alternative;
 boundary="------------tgzLqKhHQtUwlpVSMXduG9FF"
Message-ID: <c5043bba-033e-49eb-b8d7-0db80e4f78e3@windriver.com>
Date: Wed, 3 Sep 2025 14:37:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH 3/3] cheese: require distro feature opengl
To: raj.khem@gmail.com, hongxu.jia@eng.windriver.com
Cc: openembedded-devel@lists.openembedded.org
References: <20250903062503.122121-1-hongxu.jia@windriver.com>
 <20250903062503.122121-3-hongxu.jia@windriver.com>
 <CAMKF1srmfThv_-t+EMG2CVHQ_Pnh5rbF_BbD8FdGr87RWMBWqA@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAMKF1srmfThv_-t+EMG2CVHQ_Pnh5rbF_BbD8FdGr87RWMBWqA@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0127.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::12) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS4PPFE901A304F:EE_
X-MS-Office365-Filtering-Correlation-Id: cf215cbb-59e9-4082-1ff1-08ddeab45a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|4022899009|366016|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?emg5KzlUb1ZsRVB0MHRySTloS1pJL01iWStIYy9UdmxnejVGL0V2cTVvQkZi?=
 =?utf-8?B?bE1tUEsyUGFJeFFVbUhaZDdzcGxOQ2FEM3h2TS90eTF6QWVmVDFVcXczSVo4?=
 =?utf-8?B?cVkyeGczRWYwQTlFZWtZVWUvK0gveGNhTHhlenVIeW5oaTZYTHZ1VWJCcFhp?=
 =?utf-8?B?WkZqSm90blhsVlFGcFh2NTFVZ1JyYlJRSHRmb3hPb3M2MXd6TGpRSXg3QTU5?=
 =?utf-8?B?RkhHd1lKMmdPL3hob3pNOGxmZlJrcHM0dUNKUk10akVabC9QTGNzRERPckh1?=
 =?utf-8?B?cjB1bHJHMUVseEhRZ2UrS0xVZDBmRlBkdnJDWFIwM0dEOEpiSitTU0NpV2Ji?=
 =?utf-8?B?cGYrVWRaRDI1V21UeDkxVTRrdzl5LzU0YjFNV1VKZXBub3FEcTdpK1FMSy82?=
 =?utf-8?B?aVpJdEJMNEhObktEaEIxOWpMelRnZ05RUHhOWHk3RmZSTERXK3NXblJGTDRM?=
 =?utf-8?B?NzRZZkszLy9HZjUwWlFLYkJrbzEweXFqa2U1eFNzaEFYQ0NWbWdyTE1Qbkdi?=
 =?utf-8?B?VXNTbFFjMVVweVJiWXVrRWl4dngvYjJtc2pjbGpVL2JRdjU5VithbjlRSFNv?=
 =?utf-8?B?ME40YXdzUTZDcG5pMitqRVpyNFZTa0dsQ3F6cExMVXduSkMrSVdPTzRYSUMr?=
 =?utf-8?B?eXFFVStmZVRjYS9PYy9PRWtZOW1rbTlrL3pIM3FUWmw4VllnREVzTzJ1K0Nn?=
 =?utf-8?B?NldaYWh1YmpkTGd2Y1FxV29nbHMvbWF4WmxzbjBLdDU3WXJSVjd4Nks5Skg5?=
 =?utf-8?B?dHBxYzdEV0hLdng4UU9VS1FmVTI3TStZaFh3RGIzSmxSNnArZHFacEtNbEJq?=
 =?utf-8?B?cVdGbVlYT3JYeEx2TkgzSHhLYUQ4ZjFKM2VYaFpRV2VEa3NKamU5S0laR2xa?=
 =?utf-8?B?Ry9tanVQOXROQUdhUkpNNnE4Vy9rVXdiVjNIaHg1QzV3WTA0bzJEbjNJQ2ln?=
 =?utf-8?B?aW9SOGFQVEpiTE5mWXVhczhKZERvTjdkSjhyWmJLaG42NkJ5YzlUWTA1THRC?=
 =?utf-8?B?TUluUGU4Z1pHR0tPbEs5Z1VUblY2SHhteFBMYXEyR1lrekR4Z0ErUFVZVXZ5?=
 =?utf-8?B?cXRZak4xQm4zNWdiL3FnMyt3REYxVWtjWU5oTzVmMXBFSC9RVWp4YXlVdXFS?=
 =?utf-8?B?RWFqMThBUGZ3cnlaWEpWQ1ROcXZKaVVLMDNVN01PNW9Bd3lPT016TWZrenZE?=
 =?utf-8?B?VXh3dmhpQldOVmVvUHVJTGttamM4c2ZzZCsrc2VsQmo5dkd2eFc2MUxnS1Vj?=
 =?utf-8?B?L2pTR25iYVAraldOWXV0Z1ZSODNtazNKZ082OHhKemlpZm0wZlJwanNIdHp4?=
 =?utf-8?B?SEJRSlgyMUhSVk9nSTkzcVBqTTlnd0dISExFNFQ2NjMzNmFCNHA4aWR1Umlz?=
 =?utf-8?B?OUswdmhJK1VOdWdFVkJIL1UrZXlzaUJEUFVtbm80WjhHaCtTUDNqY1lYRnRz?=
 =?utf-8?B?dHk0V3gya3V0bVZSMndTRjlhUlNNejRoNEg4TjFLclhFQjJBdUd6cUZLM1Fj?=
 =?utf-8?B?MlVFbUlHL0d2UUw2c25qSzJXV1VvL0tJMVhwNi96Q3dGakkwSHlLVldVcnNj?=
 =?utf-8?B?bnZaMERJWG9MUDd3Q1hRQkF3dm96T3owSVdtcUt2bTVvT0k5aVB5WG5MUE5O?=
 =?utf-8?B?TWVmRmVTQUc0TUREMG9QV3JpTTBDeGVwWkt1L040eHZMcDUrcit2OEhsK0xl?=
 =?utf-8?B?K0RMT3I3bE02QlkxdytZYmFNVnJRajUzM1dTSHUrNXUzazVtcHJyV3M0bElL?=
 =?utf-8?B?Yy9kRGlCMFpzRmd4MmFJLzRYVExsVXZSdHZnRXdFVllSTVowNFpYaVV1ZlhN?=
 =?utf-8?B?Z3EzTlpSd2YwbGtPcFE1bWJPWC90K3hXbDNMQlBpRkFtZ1Z6V1Zpa2hwZFpQ?=
 =?utf-8?Q?Bfz07bdLNKTYe?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?am42ZUFMdW1OeVJUb3FYSE9qOTNOdFFpcHFLNDJPMCtsRCszUkJGSUtuOS92?=
 =?utf-8?B?RHN5N1Y3Ukl1RmtCVTYySnNlN0RTNWkrZFdIT3FXMUREYmxlWmYwdGNCcUxq?=
 =?utf-8?B?dGd3NGorckhYQWZlNmVzTW91ZDd0OFFEVVlKc3FaMzFkbHA2QWZmU0Ryd0l5?=
 =?utf-8?B?dEJTQjNRd1pVK0JoVDA4ZE4yZ0NVVjRoMDNocEdCdStJVlZzcVlKS2laUURB?=
 =?utf-8?B?aEV6VWdKalJpSUR4TGJuWGQ3NDFIREgxS2hTeFhMaGN4L2pXb1R3RDUvY3p6?=
 =?utf-8?B?VXpwTXRYanh4RUV3b042YUZ3NDRmNG9JbEU3aVdNMWVlU1luWU4yWFFGRHFm?=
 =?utf-8?B?Z04zejRncHV1eDRCTVpCQmlGUlRzM0JBQisvTUZTMkZOWmhmZjU3b25pOGJC?=
 =?utf-8?B?ZktFNG0rWTVucG85cHZZM3ZKM0Njbi82MzRPcTUwdEFjR2sxRGhSdlNSWU00?=
 =?utf-8?B?b0cwVEtBdVFBcW1DNFNPOFlMMzN6bzNtY3ltSEd1ZkF0MVhNRHJjSmZnZzFT?=
 =?utf-8?B?RnkrQnVSc3NlcTBHRzBENEtqVmUxSVllcm5UT015emVtb0E5bEwxdi9VTzQx?=
 =?utf-8?B?Y21lTGs0MU5aWUxRWHpYNitZdjhSQzVIcEF2YXBjakFIMVVUYkZNNHJFU2RM?=
 =?utf-8?B?aHgrSmlOQm52d1JPaDAyYnlGenQ3OG1FV2poYlJlaWtqc1hTOVNidVBqdVoy?=
 =?utf-8?B?TmRjMVhMTXd5TEJycE1LRHBBUmJ2Q0lic2JHMXhDRFhpb25POVM0cGx6MXM5?=
 =?utf-8?B?SGpKTWF6dHhDS0hCNFp1ak1Sc3Fyd0t4dkRqdXJYN0NNUFQ3OVVnS3R2eHpR?=
 =?utf-8?B?aUwzdzRzYnNqa3JYalkxUndvc2N3MFVablZwWW1hanlYVnRpNzMyWUxaNjh3?=
 =?utf-8?B?M2pEVVB4blNjV21JckxpQzBXMlJWWjZzYWJrVWcxNVBQWmNsc054WmorUEJT?=
 =?utf-8?B?OHQ4TWYzKzQzNkNGVThZWm0yTVBxTDFJWXE2RXJ3VnY4NkltRnZpcFYxSENx?=
 =?utf-8?B?NTVsaExuaFVhUm5CQ29UMEQ4ZmdNSlFZNlNlK3hZampRNUpzVGlweGFpTE5h?=
 =?utf-8?B?akExZ2dHQ1J6VlV1SVZuc1htbVZSOHlyL3lwTFY3QjV5dm1ub1ZNcG9hb3Fm?=
 =?utf-8?B?Mi9YQ0t2dFhJSmU4Ym1ISzUwZVZNWCszRWNoRVdocmg4SmFKOEp5T296OVNr?=
 =?utf-8?B?L0R3UnR0Q25GYXBwWC93QU9ScWFwcDQvSnpEUlA1Ynh2WnJXcnJJWWFDS3kr?=
 =?utf-8?B?SUw3bi9xSVZnQVR2aWZZOUZHdFBGbnRBbVBMVXo2OUpnVzY0WnVlSGRUVWJu?=
 =?utf-8?B?SFRJMDV0MjFBR0JGdmpiUzQ2MHNZdGkvbEQvYzhjbWhBSm5BTm9hQTQ4Um95?=
 =?utf-8?B?RnBJVlMxbDhmZ2Izb1duMVRrZG8va3ByUll1SG1FdEdGQlc1aTFpdm9qYkZo?=
 =?utf-8?B?b0FSakVhblA3RXZrREhCQ3hjTFJiUTZEVTI2WkhjY2FicjZtWkpaUW9vOTVo?=
 =?utf-8?B?Vy85QlQrYUhqVzhDZVJycXZPODhYbVEzTzBQaStVS2FmSVN0WDNQYzR1M09B?=
 =?utf-8?B?WFNmQmtkVU0rM2liRytON0N3RFFtclpXUnVjSG1YSGEvbWFJZWczZE5MYWMz?=
 =?utf-8?B?STErdUhvM0dialFodjNFK20zYXdrVHN0eEJzczhtaS9BWC9sekVKUWFtWVZo?=
 =?utf-8?B?c2hRWUhrck5sQmxwaHI4MnFFbkZlb01xbWJkOVYvVGc0andmb0ZQZGZSbFAx?=
 =?utf-8?B?dW5NOUFERlBXNStkOXFSVDd0UFBtKzhpenJqQ2VoQTFnY1Z4bVVJelYrRG9p?=
 =?utf-8?B?WHVNMHphbDIxN3dKSFhRZXVIVXpzRGQwSU0zenJTMEttSlN3U2VNSi92enho?=
 =?utf-8?B?YTJJZGUxc1FNekloWGwydmlBZmdjV3JZYWU4NXJFZ0dubm15aWR1azdHRjVv?=
 =?utf-8?B?clZ2UnQ3SzRFaTV3K1FQVUJLWld3RGgwclBuTE9ESktOQmY3R05vd1VmeEVz?=
 =?utf-8?B?V05DL2xhcG1OQlJTQkJ4UU9ydGhCWjJvUHU5dGwveUZYVWZzMGJwOVpHNko3?=
 =?utf-8?B?aXRiU3ZacnBMWGhDLzZWTEJ1NVo1REpEbmtxaFF4WDBQUU00RGRDVE9kWEFh?=
 =?utf-8?B?REJ3eWtxY0IxMyt1Wkp2ak9lSTRFRWRhdXBlMEhmYWk0RjlCU0pmaXZmd0pR?=
 =?utf-8?B?MGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf215cbb-59e9-4082-1ff1-08ddeab45a91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:37:29.3153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kX3crGm7PkcP8oQtuVf0oqmwL7hh5+K53q/h+9NlyDecWtJKsc4SZ1zDz6jLuwG6w5O6czPnzWsV+IuBw28Rt9//D+rimhGkkP7mY0NCI84=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE901A304F
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=K8wiHzWI c=1 sm=1 tr=0 ts=68b7e22c cx=c_pps
 a=YAEMTVrAcchZ2C0DOoOS4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=InH3eJIVdYkMT0mXAOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8
 a=yj-aMKAYKbz0kkd27lYA:9 a=w8vgsolONDGY7BTG:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iGNy4OB7Xj1-dYE7jWKxBEh2ZV1LZ1Zc
X-Proofpoint-ORIG-GUID: cMlkFZwM8QRZkVp19r_nLHfny7aIQgPx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA2MiBTYWx0ZWRfX7VlslGezekMr
 GOtgOhEsv/TNnYK+D6i3jTTS0oFs9Dxz1eVxnV6BNA9aKiUqBOikpaZ/oDKsBmPF1tr8SILgiKQ
 IMkVP4HTWKAhyIgeLvnVzl3oQPepQKobcqkU0wTvK+SHPrRjjS3va5hQQB6G5/7o1MbRKVmxWUE
 FJ2lPM8BR1TGoohNZaccePef9If8M7r0hndsL2R3Ls+fWWKR13NOra1sJ4BNtsR2rodI9Xxa8+U
 h7O2t7INEPpy8tM8Z3Tq3q/iDDMq65Od6dNT/RpBPW+UaDvkFC3emXedfZZ65/utTvuW63ltQqC
 pAYqi0Vb3AR2um8/h0sgb0YbMK6QtlPFTC7OOB8ebbVP/pAv3xyCUcRs856PP4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_02,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 06:37:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119195

--------------tgzLqKhHQtUwlpVSMXduG9FF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5835vGOo560664

On 9/3/25 14:32, Khem Raj via lists.openembedded.org wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Tue, Sep 2, 2025 at 11:25=E2=80=AFPM hongxu via lists.openembedded.o=
rg
> <hongxu.jia=3Deng.windriver.com@lists.openembedded.org>  wrote:
>> Make cheese require distro feature opengl. Otherwise it fails
>> to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
>> ...
>> |ERROR: Nothing PROVIDES 'clutter-gst-3.0' (but meta-openembedded/meta=
-gnome/recipes-gnome/
>> cheese/cheese_44.1.bb DEPENDS on or otherwise requires it)
>> |clutter-gst-3.0 was skipped: missing required distro feature 'opengl'=
 (not in DISTRO_FEATURES)
>> |ERROR: Required build target 'meta-world-pkgdata' has no buildable pr=
oviders.
>> |Missing or unbuildable dependency chain was: ['meta-world-pkgdata', '=
cheese', 'clutter-gst-3.0']
>> ...
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gno=
me/recipes-gnome/cheese/cheese_44.1.bb
>> index 180f3f6319..8e78162991 100644
>> --- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
>> +++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
>> @@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D"file://COPYING;md5=3Da17cb0a873d2=
52440acfdf9b3d0e7fbf"
>>
>>   inherit gnomebase gobject-introspection vala itstool gtk-icon-cache =
gsettings gnome-help gtk-doc
>>
>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
>> +
> this also needs inherit features_check

It is not necessary, because bbclass gtk-icon-cache has inherited=20
features_check already [1]

[1]=20
https://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/g=
tk-icon-cache.bbclass#n16

//Hongxu

>
>>   SRC_URI +=3D"file://0001-libcheese-Add-GtkWidget-cast-to-avoid-an-in=
compatibl.patch"
>>
>>   SRC_URI[archive.sha256sum] =3D "5f2185c4c99e54ddf2b8baf60c82819950e5=
4952e132e8639875f3edcbf8f68e"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#119194):https://lists.openembedded.org/g/openembed=
ded-devel/message/119194
>> Mute This Topic:https://lists.openembedded.org/mt/115041303/3617049
>> Group Owner:openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-devel/unsub =
 [hongxu.jia@eng.windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>

--------------tgzLqKhHQtUwlpVSMXduG9FF
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5835vGOo560664

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 9/3/25 14:32, Khem Raj via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srmfThv_-t+EMG2CVHQ_Pnh5r=
bF_BbD8FdGr87RWMBWqA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

On Tue, Sep 2, 2025 at 11:25=E2=80=AFPM hongxu via lists.openembedded.org
<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:hongxu.jia=3Deng.windri=
ver.com@lists.openembedded.org">&lt;hongxu.jia=3Deng.windriver.com@lists.=
openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Make cheese require distro feature opengl. Otherwise it fails
to build world if 'opengl' doesn't exist in DISTRO_FEATURES.
...
|ERROR: Nothing PROVIDES 'clutter-gst-3.0' (but meta-openembedded/meta-gn=
ome/recipes-gnome/
cheese/cheese_44.1.bb DEPENDS on or otherwise requires it)
|clutter-gst-3.0 was skipped: missing required distro feature 'opengl' (n=
ot in DISTRO_FEATURES)
|ERROR: Required build target 'meta-world-pkgdata' has no buildable provi=
ders.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'che=
ese', 'clutter-gst-3.0']
...

Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta-gnome/recipes-gnome/cheese/cheese_44.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb b/meta-gnome/=
recipes-gnome/cheese/cheese_44.1.bb
index 180f3f6319..8e78162991 100644
--- a/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
+++ b/meta-gnome/recipes-gnome/cheese/cheese_44.1.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM =3D <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"file://COPYING;md5=3Da17cb0a873d252440acfdf9b3d0e7fbf">&quot;file:=
//COPYING;md5=3Da17cb0a873d252440acfdf9b3d0e7fbf&quot;</a>

 inherit gnomebase gobject-introspection vala itstool gtk-icon-cache gset=
tings gnome-help gtk-doc

+REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;
+
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
this also needs inherit features_check</pre>
    </blockquote>
    <p>It is not necessary, because bbclass <span style=3D"white-space: p=
re-wrap">gtk-icon-cache  has inherited </span><span style=3D"white-space:=
 pre-wrap">features_check</span> already [1]</p>
    <p>[1]
<a class=3D"moz-txt-link-freetext" href=3D"https://git.openembedded.org/o=
penembedded-core/tree/meta/classes-recipe/gtk-icon-cache.bbclass#n16">htt=
ps://git.openembedded.org/openembedded-core/tree/meta/classes-recipe/gtk-=
icon-cache.bbclass#n16</a><br>
    </p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAMKF1srmfThv_-t+EMG2CVHQ_Pnh5r=
bF_BbD8FdGr87RWMBWqA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D""> SRC_URI +=3D <a class=3D"=
moz-txt-link-rfc2396E" href=3D"file://0001-libcheese-Add-GtkWidget-cast-t=
o-avoid-an-incompatibl.patch">&quot;file://0001-libcheese-Add-GtkWidget-c=
ast-to-avoid-an-incompatibl.patch&quot;</a>

 SRC_URI[archive.sha256sum] =3D &quot;5f2185c4c99e54ddf2b8baf60c82819950e=
54952e132e8639875f3edcbf8f68e&quot;
--
2.34.1




</pre>
        <br>
        <fieldset class=3D"moz-mime-attachment-header"></fieldset>
        <pre class=3D"moz-quote-pre" wrap=3D"">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#119194): <a class=3D"moz-txt-link-freetext" href=3D"h=
ttps://lists.openembedded.org/g/openembedded-devel/message/119194">https:=
//lists.openembedded.org/g/openembedded-devel/message/119194</a>
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://lists=
.openembedded.org/mt/115041303/3617049">https://lists.openembedded.org/mt=
/115041303/3617049</a>
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:openemb=
edded-devel+owner@lists.openembedded.org">openembedded-devel+owner@lists.=
openembedded.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://lists.ope=
nembedded.org/g/openembedded-devel/unsub">https://lists.openembedded.org/=
g/openembedded-devel/unsub</a> [<a class=3D"moz-txt-link-abbreviated" hre=
f=3D"mailto:hongxu.jia@eng.windriver.com">hongxu.jia@eng.windriver.com</a=
>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------tgzLqKhHQtUwlpVSMXduG9FF--

