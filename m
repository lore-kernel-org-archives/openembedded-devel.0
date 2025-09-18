Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61F7CAC59F
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 08:37:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9106.1758184638175841071
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Sep 2025 01:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=PVuBNPS/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1356ab658e=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58I4ehGm2372847
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:37:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9zS2w6cVUwgQhWdOz7MA
	2XoJ5tkfGpcQJsvMtIrZ8Nw=; b=PVuBNPS/JXQl1wD/IxkOQ1VZ/R8RqT4cX0Xn
	Tdoqk+1Z3w4rM+rJ8aosb0Zt251BdLM8/k948oDZ8nXEHQkBFeJdkCAAH933yXpz
	UFPptxMsyUoyMC32zNoxEIlkIG2cZuSYZIdof4HHhA2H7uwz/8PeDa3d24Ej2crn
	lDzBV4bWfCzt6OGXwfJSukxENlmmI50L9UCIIQDjieDquLlVqse2JRD8Xq0PrQnY
	/e6TSg+T+GDZkVXIjoBQFnnU0F28tWhh9dZx7HYKOYgB/hdZBHFzCRYYcWoK8lIi
	iz5bU3SiQFn5nVlBke4Zb99msBl+JZVJKe8+LIpPaPV2TPQadA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013011.outbound.protection.outlook.com [40.93.201.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwr1svj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 01:37:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PTSjw2NXAV2lOnKorgCu7WINCh/ZErEvqlu+scBwi/qg+Yf3gMwN1E1Orm/hzzEvt9vAoqQe59helvm+E4Pm1N1bDzfIwlKQ6Uwny+SDVh4FJD4JV37D54v6N4PvJkCGJw9A5zwYE6xS6Z2K5hrybTWyXOySTzYJHMjjG8BFsodWiWTazgyzI/0Y5BqoUHlYzJy5fYXdgvMWy74fGDzmvBy6scE8/LUaHuP8dkSS9aj+gthJ2Sp/0F3XwGtjXBTABIibYcNxW/BdO8krSmJc+SUJt2I5ccTQ8QLDQ/+eFJ0Z/qFW9op19x1LGIpcLCGXNjLH2Qk4eA8RUbkfYL8qPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zS2w6cVUwgQhWdOz7MA2XoJ5tkfGpcQJsvMtIrZ8Nw=;
 b=mwCMVAWdaeTDijkpnJoE+MpSluG8TStDnXwmzCi2RhhBymz3kEaX5hHc42aKaYDpxmZEN+M/HgO9hL9PTBAwUEC+tMSBN9qVAzgEFM1WBV0I3mWoOBS4t28p0C2skJNyQZGHTxAR0MG0XkGa5fcNcXZBpVwqdOUwj4khZ/0+f7yGLv5LbVyGmZj9UQi29XCw6LhNh5HbfaClnr7+d03hjVFx/gIH25MSk0Jq7zpsxd+0hqgyTPw/wzJ8tGh5c19pQ2TpOkWsaVZ2bM7ieNAXTlsbhpZf1xDiuRUYfUfi50aOzEb37pVi/3P6+/w0UmDuVYXBg80JGzEPSE5lssX1Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:37:15 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9137.012; Thu, 18 Sep 2025
 08:37:15 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/2] wxwidgets: upgrade 3.2.1 -> 3.2.6
Date: Thu, 18 Sep 2025 16:37:02 +0800
Message-ID: <20250918083704.181400-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYWP286CA0004.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::6) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: b415d9cc-9b2b-4117-0518-08ddf68e91ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aTFEck84cXdPTHVCeTZ3OURHQjQxS1ZTc3Z2R2dackRDdFRtZFlQWlJ5UE5y?=
 =?utf-8?B?R2ZoK1ZSNXEyZm5XaW1oc0hLZ3BGQzkwcjAzbk42T2FvWlkzcTVRK1U1eFRh?=
 =?utf-8?B?azNFYm1pSlhEY3YwUWVmVGdFNGlycDl6bjFsQk5YWFZ2b0RFQ1prb1hwVTk4?=
 =?utf-8?B?U0I0SE5vaTRHZnZLd0ZIVkZGNVkybGFER3RBdTgxM0k0cnRBM2xJUVFOUGZL?=
 =?utf-8?B?VUpwQTJtUzBMVW94TnFjTU1HekZTOWVNeUI3L1JhWHczcGpObGEyWEJXZGIw?=
 =?utf-8?B?M2haR0hNYk15OFkvU2xnMVBGQ2RBNC96aDNGMEZ2SGxMWVYxeWgzMm15aFY0?=
 =?utf-8?B?QndoM0drTFpCajZXWnVQSWkwZXl6VnN2eWltRkI4OW11R2RIK2VUaDFCamRO?=
 =?utf-8?B?RFZnblJHY1h5QUxpUm9SalYvL0x4L0lNK0s0VUFuZTh3cDB2Ri94QmxIQTB6?=
 =?utf-8?B?U09ZTkdldHBLcnZ6ZjJpNzVhV2owWlJHdllRQU1zb2p0cklmbS95ZEtYYjNH?=
 =?utf-8?B?TGN1ZXVKdU94R09YWkJ5bzBSYWJDKzFNdkFLZXRHbkJmUTl6TmMzSDFKUm80?=
 =?utf-8?B?eUpjeHdONVY3TGF5RGNXMWRxbmFzclpKSHV2c0J0bUN2Q0E5eGtzbzdZVjQr?=
 =?utf-8?B?N2hEbytLRTVpdFJzWkxudzRJZWJRenFPUy9GU0NaL2taZVdpREUrVFFleU9k?=
 =?utf-8?B?NzFzbEk5RzdsNjRBZkpTN0M4QmhlWTJBdDloRThQRlNueHZJZml0ZUxlK2gv?=
 =?utf-8?B?YnF1ZWxiVktCWWtmZ0xpNTJjblJVK3FWd2hPaEtmSi9JZnZMOW93VzNRcGIz?=
 =?utf-8?B?Nk5zVTNOVXo2S3FWK1V3NStmUkt3ZTRhL1czMzE3eGl2dEk3dng4alp2cEo1?=
 =?utf-8?B?aW9XUGlQRlpiL2tVV1h0MkJsS0JoWVdWZ1doWk9oRjBZNFNyM2Fsb0dVZlc0?=
 =?utf-8?B?cXpzV3NGam1kN09MOTc3RXl1ekIyOXo3bHU5YlZoS3VNNXFndXpmWkZjNFE1?=
 =?utf-8?B?Qk1hODB3ZHBIUjhPaysyQXZhQzFiUE5KTHIrQmk1d2ZyYjNkVmRIMDVrR1M3?=
 =?utf-8?B?QmZZRUZnZjZwem5pYVhVbDlJZmowR0t1bWZJMjBKWEREMzJTVWZnbTJWbHp2?=
 =?utf-8?B?UUgrY0VSTC9rdTFZeWgrdmJBSUxMSitvYi9pb1BpVUNjcGVYRXNIRDlGdEtq?=
 =?utf-8?B?SWl0WFdveis5VCtGYkMxbWxzSFpVTCt0MFBleHM3YWZHUDlycjdPaFRZa2lV?=
 =?utf-8?B?cm9POWIweko1VTc1cURSR2JiTlNOMDlIZHpTbXRIaU83UzRBMjRnQi9tZnl0?=
 =?utf-8?B?UGY1cUFHNUFXd0pRVUNZZ1NMeDdIajZuRTIzVDhiRzRzZjJReWg5NmRxajd5?=
 =?utf-8?B?S0QyMldCeGdZcVRKL3FYdFByUEx0VjZlVmxLU2FFaDVITzRzdy93T3hsSEVP?=
 =?utf-8?B?b2hrWTJ2M2QzQ0E5MnFrSGtaMUx2dzc1QkVMNkJ1S1NhelozUkJwSitwbG5n?=
 =?utf-8?B?b0VOUFpMYjBhbytjUXBteCtkdTk4cVlXQjBOdW9Na3pKM2ZzalBaT3VDWkJR?=
 =?utf-8?B?eHYrL0drZGs3eUVLVlNKRm9LcEk1TndvUmhlNXkyeDV5TGJsdHBZWVFXMnlx?=
 =?utf-8?B?M09OZ28vT3luOG1veWI0aW5GVkxySTJ1TUpMQlJUQTBCOEhzUS9RS0c0dUVr?=
 =?utf-8?B?UzBVYVhScXRhMkM1UW5WTnl3Y0xQOE1hVHNsZ1k2YWl6NldidmdtOE1QK2dZ?=
 =?utf-8?B?d1Jyb2hOVjFVb09CQmI4a1BIdE9qVlcyd0haQ3R6VUNOUWJ3dzVpNi9tL3N1?=
 =?utf-8?B?VWdjMXMxaC9FWWY4cnRreEZrMmFOMThrWkJoL1ZVSy8ySUdSU0g0VEM5endX?=
 =?utf-8?B?SXZxZVAvYjBVYXRCZjdOWllMWU8zeUhpY3RBY1cyQTBxbWdKdkx2ZUJUQmgw?=
 =?utf-8?Q?0taSZSLpNTo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z04xT29Ec3FUSG43eXNJMGxpTlZ1SjFkYUlJTndHVllYdlR4Q3cwdnRsUmps?=
 =?utf-8?B?TmZiVDJDSERZWTQ5L0Nzc3VObFhzTi84WUhDZHBSYWlwSVd3c0pkb3c3NS85?=
 =?utf-8?B?bzRhc25VK2NsUkpWZTY0Y1ZkQTMvZFYxL0l0MXRTdWNTU0pROTVEZGpBdm1q?=
 =?utf-8?B?MmpkTGJiWWt2SHdPNk5BbU5FaDNnS043bkh0ckpLWWFPalE1VTBsa1NkN3Az?=
 =?utf-8?B?TUxBenRIeGxKdVo4eWZidEtUM2dNb3g4MTdvSVUybGZaQ2JjOVp3VGxMbDQr?=
 =?utf-8?B?RDBDVlM0VTNCblNVZTI3aUZWaTlGdnJHMjZkNTUwTEtESlhIWlhUTldmMVNi?=
 =?utf-8?B?L0ZmMVovSWJNTTRtVmwzMmZ2K2x6LzFaNi9vcDJLRnZrSG1KWDdBOTRhZk9l?=
 =?utf-8?B?YWJkdm1SQnExSGR3ZmpLc3hNNytLdTZOUTZWbzYxMWZWdnk2MkJTK0VQTnBI?=
 =?utf-8?B?RU5hRDNoZGYyMy9ud1p6SFFNQUczc1pVZTIxeDhXMkJORmJjd3F4a3gvQlRB?=
 =?utf-8?B?NmE0SWo1ampxcjVsYWVqRG9DbUxBZ1JEbktySkdnYTdrcGxORy9zMmU4Z0FP?=
 =?utf-8?B?RTRaLytXQ0MyMmlwWHRoSFA2NitiOU82UDJkeDNweTFQWFJKblFFL0xlVHZS?=
 =?utf-8?B?L2IvQStWM0RjYjZ5UmRaTStlMVdGN3ZIbWc5Z2RJYUcwV0h1TDNHdlNRdWZE?=
 =?utf-8?B?WHUyUUdnbzFrSlpraVdCa2NWWnVqaUw1Yk5HWjJ6VWVqMHVTaHErOFhUNTNr?=
 =?utf-8?B?a1U5TGtvOHJqUk1QdUFZQUJVK0FUWE82bkZDYlorZytoWklqOUlWT3lzQ3Rx?=
 =?utf-8?B?YU16dWJKQVptV1F5WDZEeCtXbmVCbVg0ZWk3Z1laZnREQ2F3dzZyZ2ZMZkkx?=
 =?utf-8?B?dW81TGp1cENuM0c3K3hrYkhFY1I0M2hCVDFzN2J2WWNydVB5cEVJbm1sS2dQ?=
 =?utf-8?B?RWRMcVUvUHU1V0lvZUtHeGxUVmphaTBWVVVjczVSdDJZT0FVTGdPQm9BN1ZI?=
 =?utf-8?B?dTNXT2l2L25EZFh0NUNGQS9NYVJFcEt5VURieFJ0dG9UUzkxa3g4c2VSaUVn?=
 =?utf-8?B?NDBiMGVGczYzc3lSdDVCS2xQK0pvYXZ4QUhFT3BucHNBSFU3VFgzVFcyc29S?=
 =?utf-8?B?MTQyYmpudUZzVEpkYmdxTCt0cHFpODAzdWp4Z1FsMm1QVDhndm5XQ2xOTHJU?=
 =?utf-8?B?VUxjVEN4aFc2d0s3YUdxSmNQRXhsNmxCWjhpenZERElTeXdzVitWSjVJTFBv?=
 =?utf-8?B?cXc3UFpyMkdUYS9lMC9JUmF6OU80bGRteHZ5VUtCRWRFSXhjZ0JOTzF0djJv?=
 =?utf-8?B?SURXYjQyTzJNWWxwL1Mza1JYQjBUbDgwK2EvNGlnZU9jbGtLem84S2JMeCsz?=
 =?utf-8?B?UGJtRVYxeVVjWU01anpIVzVVL3BDMCtMbjgzcExUTzQxUHo1TDJKL2t2NHJX?=
 =?utf-8?B?MjU4bUc2dmFGUlVqNzY5SlBScHFVMXpZYXUzdkJld3R3L01jdmlnV3BURDZK?=
 =?utf-8?B?L1AraHN5YVdpcU1tdE5pOCtDOXlNVmxWeGs1MmZ2Y1A3S25mSVBKU1FaRTls?=
 =?utf-8?B?b011cm1nL0s5QlVPRGxqWDA0RE54SVY3NDFwOVB5QTk2dVpLNjV0ejJnb3lJ?=
 =?utf-8?B?TUNFeW9lalZYaThZNCt1VDNiR0F4RUlIeG5HYzlneEpsV0haSVJUeWRHR1c3?=
 =?utf-8?B?WExqTVJDS0o2cGYyYnAvT2JyMlB4YzlpcW5lTkpOUGpGTVlqOWo4ZlhOdCtE?=
 =?utf-8?B?dlZnK0FDTmppODdSeFdxOWhQdkdZY3NoY2piTHFLVDhBd2VsM1pHdTlTaklx?=
 =?utf-8?B?aG5kYWNnMTF2ekdna0N1TGl3TU5xdUtUQWN6aXZSYXh2TWJZazZSVXBwMEVW?=
 =?utf-8?B?VllsQ2k2Mk90M25CSURtN3hWUkl1eUdnTmhndlBOSHVndjZsOGtCbHhDNmtr?=
 =?utf-8?B?TDB2UFFRZUVsaE1ManpQbmFuTTZNd0RncEo1d3FSbGNVZXFnSGh0Q0REeC96?=
 =?utf-8?B?YXdBL1RXclRCU3hqaDZRRC9WOXFSWjFHSVhTTFVlUWxsWXhHdzE1ZXdVeWlE?=
 =?utf-8?B?dy9xQXhXaklGa05hUkY0RVh2VkFkQjgxNmQwai8zQmNmNjdDc2pTQ1lma1Fk?=
 =?utf-8?B?T2ZZdkZ3bWtGVU44TGQ0MzVCUDdwbEoxNDg1WmVkdlppcjhIWERwRHNVKzM2?=
 =?utf-8?B?b2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b415d9cc-9b2b-4117-0518-08ddf68e91ee
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:37:15.3700
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HClh0okve3bPkZmGTWdkuhoyJpjhU3NpSnxjy2DxGwNXwLqUfH0kHAfai5hVDKBSkdB+yvqmxP2r0F0o4rksqHLaXegrUEpJKwRifYyOeH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Authority-Analysis: v=2.4 cv=Jay8rVKV c=1 sm=1 tr=0 ts=68cbc4bd cx=c_pps
 a=NzAOMTrFL2nmaFUJOsdohw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=IToquFxsAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=kJubvfstYM-9OTd9FwYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE4MDA3OCBTYWx0ZWRfX2h55NRpZH7AG
 //2W3Hj+8szDwwKJ8hUIHXe8MolNAbN8TjzTEn92Y87Xape9nlirGzYeBcO741hf8WyXwS2ASEY
 dxDUyvGMRe/81fruhISmYjoChcQFyCsnD2zEFHLDBCxn3JNJRiX+ufQWL+9IMqs7EUXTfZl+jUZ
 84XaqKmiYiLldGlNWnJpLk9NmUWe4Iavneve7EpNObB5J1GQiDmiUoSZr1bNNlsnlhEwILIdHtf
 RrIOOph2NmcQL+3uQVNoTJJEvfvivF9gwcFdUWQpFx3/P2bl15woz62vynfNERhRxDA/VQbZw1J
 viZYV/4bEa5vTHOpiEvt20focBDwdJsdLHQ+T8uRWz6EsRAc/wXPGfJlQtpScI=
X-Proofpoint-GUID: 5AyzmYl4rGEdP5YGugaydxye4u960yAN
X-Proofpoint-ORIG-GUID: 5AyzmYl4rGEdP5YGugaydxye4u960yAN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507300000 definitions=firstrun
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58I4ehGm2372847
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Sep 2025 08:37:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119539

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://raw.githubusercontent.com/wxWidgets/wxWidgets/v3.2.6/docs/changes=
.txt

* Drop 0001-locale-Avoid-using-glibc-specific-defines-on-musl.patch as
  it has been merged upstream
* Refresh patches
* Add UPSTREAM_CHECK_GITTAGREGEX

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>

(master rev: 903ed68669550ccae20bcd0c18c26d0c336da810)
Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...using-glibc-specific-defines-on-musl.patch | 26 --------------
 ...able-cross-magic-it-does-not-work-fo.patch |  8 ++---
 ...tch =3D> 0002-fix-libdir-for-multilib.patch} | 35 ++++++++++++-------
 ...003-create-links-with-relative-path.patch} | 22 ++++++++----
 ...-not-append-system-name-to-lib-name.patch} | 12 +++++--
 ...5-wx-config-fix-libdir-for-multilib.patch} | 29 +++++++++------
 ...-l.patch =3D> 0006-Fix-locale-on-musl.patch} | 18 ++++++++--
 ...E_LARGEFILE_SUPPORT-to-1-explicitly.patch} |  9 ++---
 ...{wxwidgets_3.2.1.bb =3D> wxwidgets_3.2.6.bb} | 17 ++++-----
 9 files changed, 100 insertions(+), 76 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-loc=
ale-Avoid-using-glibc-specific-defines-on-musl.patch
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{fix-libdir-for-mult=
ilib.patch =3D> 0002-fix-libdir-for-multilib.patch} (82%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{create-links-with-r=
elative-path.patch =3D> 0003-create-links-with-relative-path.patch} (72%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{not-append-system-n=
ame-to-lib-name.patch =3D> 0004-don-not-append-system-name-to-lib-name.pa=
tch} (73%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{wx-config-fix-libdi=
r-for-multilib.patch =3D> 0005-wx-config-fix-libdir-for-multilib.patch} (=
74%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{musl-locale-l.patch=
 =3D> 0006-Fix-locale-on-musl.patch} (70%)
 rename meta-oe/recipes-extended/wxwidgets/wxwidgets/{0001-Set-HAVE_LARGE=
FILE_SUPPORT-to-1-explicitly.patch =3D> 0007-Set-HAVE_LARGEFILE_SUPPORT-t=
o-1-explicitly.patch} (83%)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.1.bb =3D> wxwid=
gets_3.2.6.bb} (90%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avo=
id-using-glibc-specific-defines-on-musl.patch b/meta-oe/recipes-extended/=
wxwidgets/wxwidgets/0001-locale-Avoid-using-glibc-specific-defines-on-mus=
l.patch
deleted file mode 100644
index 52f4449339..0000000000
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-locale-Avoid-usin=
g-glibc-specific-defines-on-musl.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 72c3b7324f00047e6dc5d8380ed2f6ff2494a6f9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 18 Dec 2022 14:51:34 -0800
-Subject: [PATCH] locale: Avoid using glibc specific defines on musl
-
-musl does not provide some glibc-only enum members e.g. _NL_ADDRESS_LANG=
_NAME
-
-Upstream-Status: Submitted [https://github.com/wxWidgets/wxWidgets/pull/=
23050]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/unix/uilocale.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/unix/uilocale.cpp b/src/unix/uilocale.cpp
-index 57773e17f5..86816ba896 100644
---- a/src/unix/uilocale.cpp
-+++ b/src/unix/uilocale.cpp
-@@ -619,7 +619,7 @@ wxString
- wxUILocaleImplUnix::GetLocalizedName(wxLocaleName name, wxLocaleForm fo=
rm) const
- {
-     wxString str;
--#if defined(HAVE_LANGINFO_H) && defined(__LINUX__)
-+#if defined(HAVE_LANGINFO_H) && defined(__LINUX__) && defined(__GLIBC__=
)
-     switch (name)
-     {
-         case wxLOCALE_NAME_LOCALE:
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.=
in-Disable-cross-magic-it-does-not-work-fo.patch b/meta-oe/recipes-extend=
ed/wxwidgets/wxwidgets/0001-wx-config.in-Disable-cross-magic-it-does-not-=
work-fo.patch
index b3b9e79c53..a3b8d0c0ee 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disa=
ble-cross-magic-it-does-not-work-fo.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-wx-config.in-Disa=
ble-cross-magic-it-does-not-work-fo.patch
@@ -1,4 +1,4 @@
-From a071243763f4b06fc7e71f541c49cecf380b6f27 Mon Sep 17 00:00:00 2001
+From 8f582c0ea40ccdb2d439b7614459d752f3606e15 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Sun, 11 Oct 2020 22:16:55 +0200
 Subject: [PATCH] wx-config.in: Disable cross magic - it does not work fo=
r us
@@ -18,10 +18,10 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/wx-config.in b/wx-config.in
-index d132e3182f..d0d162e8a3 100755
+index 4df8571d28..1173d89685 100755
 --- a/wx-config.in
 +++ b/wx-config.in
-@@ -396,7 +396,7 @@ get_mask()
+@@ -394,7 +394,7 @@ get_mask()
  }
 =20
  # Returns true if this script is for a cross compiled config.
@@ -31,5 +31,5 @@ index d132e3182f..d0d162e8a3 100755
 =20
  # Determine the base directories we require.
 --=20
-2.26.2
+2.25.1
=20
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-=
multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-li=
bdir-for-multilib.patch
similarity index 82%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-m=
ultilib.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-fo=
r-multilib.patch
index ea204ed3b1..b599f38871 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/fix-libdir-for-multili=
b.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0002-fix-libdir-for-mu=
ltilib.patch
@@ -1,12 +1,18 @@
-wxWidgets hardcodes libdir with 'lib' and does not support multilib whic=
h will
-change it. Respect variable wxPLATFORM_LIB_DIR to support libdir be conf=
igurable.
+From 9487fe5cd271a4bee96ab590509ef38f6972887a Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] fix libdir for multilib
+
+wxWidgets hardcodes libdir with 'lib' and does not support multilib
+which will change it. Respect variable wxPLATFORM_LIB_DIR to support
+libdir be configurable.
=20
 Upstream-Status: Pending
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
-Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX i=
n this
-patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
+Rebase for wxWidgets 3.2.1. Replace wxPLATFORM_LIB_DIR with LIB_SUFFIX
+in this patch that LIB_SUFFIX has been passed to cmake in cmake.bbclass.
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 ---
@@ -17,36 +23,36 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  4 files changed, 10 insertions(+), 10 deletions(-)
=20
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a49ecd3883..d469471f38 100644
+index f6ae7f6210..2a13e448db 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
 @@ -45,7 +45,7 @@ include(build/cmake/policies.cmake NO_POLICY_SCOPE)
  # Initialize variables for quick access to wx root dir in sub dirs
  set(wxSOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
- set(wxBINARY_DIR ${CMAKE_BINARY_DIR})
+ set(wxBINARY_DIR ${CMAKE_CURRENT_BINARY_DIR})
 -set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib)
 +set(wxOUTPUT_DIR ${wxBINARY_DIR}/lib${LIB_SUFFIX})
 =20
  # parse the version number from wx/version.h and include in wxMAJOR_VER=
SION and wxMINOR_VERSION
  file(READ "${wxSOURCE_DIR}/include/wx/version.h" WX_VERSION_H_CONTENTS)
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index b359560bc0..c59ea60923 100644
+index addd8d6b81..9ec677534b 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -76,7 +76,7 @@ function(wx_write_config_inplace)
+@@ -100,7 +100,7 @@ function(wx_write_config_inplace)
      execute_process(
          COMMAND
          "${CMAKE_COMMAND}" -E ${COPY_CMD}
--        "${CMAKE_CURRENT_BINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_=
FULLNAME}"
-+        "${CMAKE_CURRENT_BINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace=
-${TOOLCHAIN_FULLNAME}"
-         "${CMAKE_CURRENT_BINARY_DIR}/wx-config"
+-        "${wxBINARY_DIR}/lib/wx/config/inplace-${TOOLCHAIN_FULLNAME}"
++        "${wxBINARY_DIR}/lib${LIB_SUFFIX}/wx/config/inplace-${TOOLCHAIN=
_FULLNAME}"
+         "${wxBINARY_DIR}/wx-config"
          )
  endfunction()
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index 7182364e5e..55fbebc7ee 100644
+index 72a34f0b4f..81ede7d8ae 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -435,8 +435,8 @@ macro(wx_add_library name)
+@@ -462,8 +462,8 @@ macro(wx_add_library name)
          endif()
          wx_install(TARGETS ${name}
              EXPORT wxWidgetsTargets
@@ -105,3 +111,6 @@ index 384c6837b8..d3303faabb 100644
  )
 =20
  # uninstall target
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-wi=
th-relative-path.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/000=
3-create-links-with-relative-path.patch
similarity index 72%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-wit=
h-relative-path.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-=
with-relative-path.patch
index 6eef0b6790..dbede0304f 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/create-links-with-rela=
tive-path.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0003-create-links-with=
-relative-path.patch
@@ -1,18 +1,23 @@
+From b86806ef34d4c9171165c1533064bf34ad822e20 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] create links with relative path
+
 It fails to build python3-wxgtk4 which depends on wxwidgets:
=20
 | ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
     absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux
-	/wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work
-	/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bin/w=
x-config
+    /wxwidgets-native/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/w=
ork
+    /x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/bi=
n/wx-config
     pointing at /path/to/build/tmp-glibc/work/x86_64-linux/wxwidgets-nat=
ive/3.2.1-r0
-	/recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
+    /recipe-sysroot-native/usr/lib/wx/config/gtk3-unicode-3.2.
   Please replace this with a relative link.
 | ERROR: wxwidgets-native-3.2.1-r0 do_populate_sysroot: sstate found an
     absolute path symlink /path/to/build/tmp-glibc/work/x86_64-linux/wxw=
idgets-native
-	/3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/wxw=
idgets-native
-	/3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/build=
/tmp-glibc
-	/work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/usr/=
bin/wxrc-3.2.
-  Please replace this with a relative link.
+    /3.2.1-r0/sysroot-destdir/path/to/build/tmp-glibc/work/x86_64-linux/=
wxwidgets-native
+    /3.2.1-r0/recipe-sysroot-native/usr/bin/wxrc pointing at /path/to/bu=
ild/tmp-glibc
+    /work/x86_64-linux/wxwidgets-native/3.2.1-r0/recipe-sysroot-native/u=
sr/bin/wxrc-3.2.
+   Please replace this with a relative link.
=20
 Create symlink with relative path to fix the issues.
=20
@@ -50,3 +55,6 @@ index dbed8cc9b3..1dbc3261d3 100644
              \"\$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/wxrc${EXE_SUFFI=
X}\" \
              )"
          )
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-syst=
em-name-to-lib-name.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/=
0004-don-not-append-system-name-to-lib-name.patch
similarity index 73%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-syste=
m-name-to-lib-name.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-appen=
d-system-name-to-lib-name.patch
index 6329256b0c..e3463ba170 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/not-append-system-name=
-to-lib-name.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0004-don-not-append-sy=
stem-name-to-lib-name.patch
@@ -1,3 +1,8 @@
+From 5e9725c1151e2b029066d61ef5dccf1f3e6cb323 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] don not append system name to lib name
+
 It appends system name to library names for cross compile. For example, =
the
 library name is libwx_baseu-3.1-Linux.so rather than libwx_baseu-3.1.so.=
 It is
 not appropriate for oe.
@@ -14,10 +19,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/build/cmake/functions.cmake b/build/cmake/functions.cmake
-index e374d9a273..c6b1908bd6 100644
+index 81ede7d8ae..23eebeb914 100644
 --- a/build/cmake/functions.cmake
 +++ b/build/cmake/functions.cmake
-@@ -219,9 +219,9 @@ function(wx_set_target_properties target_name)
+@@ -243,9 +243,9 @@ function(wx_set_target_properties target_name)
      endif()
 =20
      set(cross_target)
@@ -30,3 +35,6 @@ index e374d9a273..c6b1908bd6 100644
 =20
      set(lib_prefix "lib")
      if(MSVC OR (WIN32 AND wxBUILD_SHARED))
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-l=
ibdir-for-multilib.patch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0=
005-wx-config-fix-libdir-for-multilib.patch
similarity index 74%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-li=
bdir-for-multilib.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix=
-libdir-for-multilib.patch
index 628f8dee56..b650c50386 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/wx-config-fix-libdir-f=
or-multilib.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0005-wx-config-fix-lib=
dir-for-multilib.patch
@@ -1,8 +1,14 @@
-It sets 'libdir' with path element 'lib' directly which is not suitable =
for
-multilib. Add an option '--baselib' for wx-config to support multilib wh=
en
-cross compile. And set default value of baselib with "lib${wxPLATFORM_LI=
B_DIR}".
+From 4230cd84f156f9eb5c9b80ffbc69dd55fa7c7ca7 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Sat, 12 Oct 2024 18:43:25 +0800
+Subject: [PATCH] wx-config: fix libdir for multilib
=20
-Upstream-Status: Pending [oe specific]
+It sets 'libdir' with path element 'lib' directly which is not suitable
+for multilib. Add an option '--baselib' for wx-config to support
+multilib when cross compile. And set default value of baselib with
+"lib${wxPLATFORM_LIB_DIR}".
+
+Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
=20
@@ -15,10 +21,10 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
  2 files changed, 5 insertions(+), 3 deletions(-)
=20
 diff --git a/build/cmake/config.cmake b/build/cmake/config.cmake
-index 52ae69d3f6..28aa733eb0 100644
+index 9ec677534b..ee61cf7572 100644
 --- a/build/cmake/config.cmake
 +++ b/build/cmake/config.cmake
-@@ -86,7 +86,7 @@ function(wx_write_config)
+@@ -110,7 +110,7 @@ function(wx_write_config)
      set(prefix ${CMAKE_INSTALL_PREFIX})
      set(exec_prefix "\${prefix}")
      set(includedir "\${prefix}/include")
@@ -26,9 +32,9 @@ index 52ae69d3f6..28aa733eb0 100644
 +    set(libdir "\${exec_prefix}/\${baselib}")
      set(bindir "\${exec_prefix}/bin")
 =20
-     find_program(EGREP egrep)
+     if(wxBUILD_MONOLITHIC)
 diff --git a/wx-config.in b/wx-config.in
-index e3f7d115bb..0e78af03c7 100755
+index 1173d89685..8364a33e9d 100755
 --- a/wx-config.in
 +++ b/wx-config.in
 @@ -42,7 +42,8 @@ usage()
@@ -41,7 +47,7 @@ index e3f7d115bb..0e78af03c7 100755
             [--list] [--selected-config] [--host=3DHOST] [--toolkit=3DTO=
OLKIT]
             [--universal[=3Dyes|no]] [--unicode[=3Dyes|no]] [--static[=3D=
yes|no]]
             [--debug[=3Dyes|no]] [--version[=3DVERSION]] [--flavour=3DFL=
AVOUR]
-@@ -137,7 +138,7 @@ wxconfig_output_options=3D"prefix exec_prefix
+@@ -133,7 +134,7 @@ wxconfig_output_options=3D"prefix exec_prefix
 =20
  # Options that permit the user to supply hints that may affect the outp=
ut.
  # These options all accept arbitrary values, to interpret as they pleas=
e.
@@ -50,7 +56,7 @@ index e3f7d115bb..0e78af03c7 100755
 =20
  # Input options that accept only a yes or no argument.
  #
-@@ -404,6 +405,7 @@ is_cross()  { [ "x@cross_compiling@" =3D "xyes" ]; }
+@@ -400,6 +401,7 @@ is_cross()  { [ "xno" =3D "xyes" ]; }
  # Determine the base directories we require.
  prefix=3D${input_option_prefix-${this_prefix:-@prefix@}}
  exec_prefix=3D${input_option_exec_prefix-${input_option_prefix-${this_e=
xec_prefix:-@exec_prefix@}}}
@@ -58,3 +64,6 @@ index e3f7d115bb..0e78af03c7 100755
  wxconfdir=3D"@libdir@/wx/config"
 =20
  installed_configs=3D`cd "$wxconfdir" 2> /dev/null && ls | grep -v "^inp=
lace-"`
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.p=
atch b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-mu=
sl.patch
similarity index 70%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.pa=
tch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on=
-musl.patch
index e4ca6579f8..37d61dcb3f 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/musl-locale-l.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0006-Fix-locale-on-mus=
l.patch
@@ -1,8 +1,19 @@
-Upstream-Status: Pending
+From 64d5d7f68cde208c6f8a5e0b71da93f98e4720f7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Oct 2024 20:30:16 +0800
+Subject: [PATCH] Fix locale on musl
=20
 these macro'd away functions don't exist in musl (yet)
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/wx/xlocale.h | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
 diff --git a/include/wx/xlocale.h b/include/wx/xlocale.h
-index c433d25..3ab9d84 100644
+index c433d25d05..794cf0b66b 100644
 --- a/include/wx/xlocale.h
 +++ b/include/wx/xlocale.h
 @@ -33,6 +33,26 @@
@@ -32,3 +43,6 @@ index c433d25..3ab9d84 100644
  // The platform-specific locale type
  // If wxXLocale_t is not defined, then only "C" locale support is provi=
ded
  #ifdef wxHAS_XLOCALE_SUPPORT
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_L=
ARGEFILE_SUPPORT-to-1-explicitly.patch b/meta-oe/recipes-extended/wxwidge=
ts/wxwidgets/0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch
similarity index 83%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LA=
RGEFILE_SUPPORT-to-1-explicitly.patch
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARG=
EFILE_SUPPORT-to-1-explicitly.patch
index 5160f2e1fe..ef94e3551b 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets/0001-Set-HAVE_LARGEFIL=
E_SUPPORT-to-1-explicitly.patch
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets/0007-Set-HAVE_LARGEFIL=
E_SUPPORT-to-1-explicitly.patch
@@ -1,4 +1,4 @@
-From e108aff9d6dae613f486c1b1681f4a3cdf17b845 Mon Sep 17 00:00:00 2001
+From 22f70d5bd039b20bfdad522341412ca001c639db Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 19 Dec 2022 15:07:55 -0800
 Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explicitly
@@ -6,16 +6,17 @@ Subject: [PATCH] Set HAVE_LARGEFILE_SUPPORT to 1 explic=
itly
 nothing sets this to 0, but for some reason it gets undef'd
=20
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  build/cmake/setup.h.in | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
=20
 diff --git a/build/cmake/setup.h.in b/build/cmake/setup.h.in
-index bce33a73f3..22afb4cfa0 100644
+index fcc282980d..767adbf658 100644
 --- a/build/cmake/setup.h.in
 +++ b/build/cmake/setup.h.in
-@@ -869,8 +869,7 @@
+@@ -867,8 +867,7 @@
  /*
   * Define if large (64 bit file offsets) files are supported.
   */
@@ -26,5 +27,5 @@ index bce33a73f3..22afb4cfa0 100644
   * Use OpenGL
   */
 --=20
-2.39.0
+2.25.1
=20
diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb b/meta=
-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
similarity index 90%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
index 91653e2852..71e2a60e0c 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.1.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb
@@ -20,17 +20,18 @@ DEPENDS +=3D " \
=20
 SRC_URI =3D "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3D3.2;pro=
tocol=3Dhttps \
            file://0001-wx-config.in-Disable-cross-magic-it-does-not-work=
-fo.patch \
-           file://fix-libdir-for-multilib.patch \
-           file://create-links-with-relative-path.patch \
-           file://not-append-system-name-to-lib-name.patch \
-           file://wx-config-fix-libdir-for-multilib.patch \
-           file://0001-locale-Avoid-using-glibc-specific-defines-on-musl=
.patch \
-           file://musl-locale-l.patch \
-           file://0001-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch =
\
+           file://0002-fix-libdir-for-multilib.patch \
+           file://0003-create-links-with-relative-path.patch \
+           file://0004-don-not-append-system-name-to-lib-name.patch \
+           file://0005-wx-config-fix-libdir-for-multilib.patch \
+           file://0006-Fix-locale-on-musl.patch \
+           file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch =
\
            "
-SRCREV=3D "97e99707c5d2271a70cb686720b48dbf34ced496"
+SRCREV =3D "5ff25322553c1870cf20a2e1ba6f20ed50d9fe9a"
 S =3D "${WORKDIR}/git"
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
+
 # These can be either 'builtin' or 'sys' and builtin means cloned soures=
 are
 # build. So these cannot be PACKAGECONFIGs and let's use libs where we c=
an (see
 # DEPENDS)
--=20
2.50.0


