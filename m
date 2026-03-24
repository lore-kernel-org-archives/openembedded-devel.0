Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92412F483CA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19065.1774357186275888459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=Gv0kgzj6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O4QQh91225806
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=5sIKmZaKgHQADWFlwzqkzyoD+o/NGsxzGLHayzltHY8=; b=Gv0kgzj6ss6k
	L4Y0vqFAwPW1tA7C1u+rqIC7entqJGcetemJYEgLma7G7kBMu/Nq30BHxPTa/Q5/
	iD4xBs7tUl9D2qJJa4xTZWm68bHuSJON4bZpOuSK3NzVM/Zezmj8Z49oT19SfBfX
	k6rXucqb+lCLghtREPmUKgE5bU35We8xi96Qz41jSnsoE3fssskYHUgfHu1C9ACf
	zzHfvHzhx2+mHnmns6wbAWeoo8G40Kx8ilbdOHAC4tQijzTxODGqxzZvtkiVGbK4
	RhDzcA5KNsJ2wB9FvRxc3GWwYEB47qua6Pgu7+sIih4WIC1EI+eybNVGVDK+Jxnz
	yjIGDHxGaw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012011.outbound.protection.outlook.com [40.93.195.11])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1gj83d7r-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:45 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YrbfxK/ELtFvHh2OFFmweQhAcricSKvCk3I3unTw+P2XCIwLUaNmbNndiYDulSWxqVpCxnxm0AK+tJHe2+TD/BeCzBoc7cxmJHGEbAOXS3bPhZt6eS/sAIkBBKv2ADpZfHJe6IRPVVnDMJfIHOu61Y3ENVT4oJH1T0LPBBiDFuohV0veyjsCrSxVCAb2fk7EDZJ2vfA89rxLj+DUoYeUrtaapTKQo6K+zdgRCacJDHaYdXqdchcAs3T8KZVDovc6WEKqimbV/bDxNlj09Oh27HOqdCGJ1CByQLInBO4vYaIhx2L6sPcoboZTPW0L15tsxbAYJ3OmXkY/3NipQCSyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5sIKmZaKgHQADWFlwzqkzyoD+o/NGsxzGLHayzltHY8=;
 b=lzKlBDfqr8e1ghCkJPTo/Axd7UYftkrARu06v4btWw24ceSG9vivwFBut3Vx7kJLDWHY/D13hqtBfVGJjaKoihpD9HuzlO86kWpZJsflUtUqk4qfHgqEDkuDGSUoUZcD99u0Uh9+n/m8/ToririUDgR5CUJD9kNkOeuLuCkXgj2zV4g21LMFVsOKk/8lML75uBWQnExPkc/7aU0yCrqtyjr7MMSDVRz0SNAXvLR2zgHE2LSTGqSEM/uip2Ji0wlVO5rnFbhXp25TJLiVRDtb1bfwdgLa3vcE+e9OE2tZo7j3aPTb8MDRGDKjR+XbaO8X2niPoyn/nUY2KfmWhpZ7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS7PR11MB6128.namprd11.prod.outlook.com (2603:10b6:8:9c::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 12:59:43 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:43 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 02/15] garcon: upgrade 4.20.0 -> 4.21.0
Date: Tue, 24 Mar 2026 20:59:14 +0800
Message-Id: <20260324125927.1070644-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS7PR11MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d8f241a-4fd9-46ed-b973-08de89a53801
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	YbGDZgubovtP5qDxz94Lc8iUcXcK8Ow16mIWOvncyEgwZgLtrqNn8K0yeGVYBuhnQCoSDjn0fDjqh1dzF9azJkQe/qfq0RXFJkgd0Iz3y+3d8Z1BNRmzCEOlNPuLDdW+40GW/MDTe6Hvqjm8i+uOXGKlPv3/UYL2D4V2E0P7yU0LKjNZg6ItOVhBbJmQXaTa4LwRO7Q1rJYeALR/iGwqJQb/fP9AsvwLLh9zx6Vc8t6ez0EDZJzrNRJer3JN71WwPIJqt7VjosYihW1i4vRUanrDHu4APR5svnBvvVUQXjo5fqXKCL8JdLLJxtf63eFV6yQBVRt8Vu8/1LOhZy4Um1EvwXCLDnwrpIb95j1h7BlqrvnNh8Ts4dfdTH0uxh4+l5PShVFyxmX3HAKZ1wYkk2Ex7/WMYiJLeuT2cNn3NOV3FvZcXQDeZiK1/7MtvIuZBZMbYd5WxL1lV4oQ60TkeuHctoqqygbT3AGyObHO3N63foBJqRf+kJj95HMtIAKzvFGqszTPMizgvK9fihEeNqXEcpwCyrFcHzFYcgsHd6n/0uZLWB6LbuDAWM4xGrRTNMu/Zein7eyCP0nJdKVk7ONU8QrpzkK0zFUIAzko3reJ2CzWLAUtoeY7U/INox5DT5Nyho9yYqpxLTbiB8+P84KrmGRiIOBuNpGAsxrG488neJOrVO4zkh7QpjdfECw1t3WH5vN420x8tHWf7P5JrzQzRM/dOPcRf2iGKY/43GN+0tGhoiH/efMtNm4SqaKZKwBzkk5gtgAPjdRRNmJKCdPB21odY0jdeViEj/KvUwQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?alQzSlEyZnZuOGEwUGVQTjJJdkRzUGVEMnFVWVRqQVRLM1c4TFFVRDdPMXc0?=
 =?utf-8?B?MGkxN3VRTjRQbVZDUXNkNjJpaTJUbjVaRkljOGthbnZHNEZ5aCt1S0wxV3FH?=
 =?utf-8?B?cFQveHFzQjZmZkRtcFFreTFyYUJOUlNpSUphenh4VlVSMzhEL1dGWGE3eXR2?=
 =?utf-8?B?dU5yZm0zUS9nVU9FL1A3cDBNVGZZYWJHQjY1WFhUT0JsOC9pR3ZWMkpIT0lH?=
 =?utf-8?B?V2VHSjlRZC9TZ2FSTnRtdW8vKys1dFU1NlBNbzdVeFVlNVljTjVMakdubGZO?=
 =?utf-8?B?c0NEZ0lITHdVOTl3RzNjMkZzSnFxZXV2RVF2WTQ1YWFacXlGZTkwMnFMbE45?=
 =?utf-8?B?Nk5WVHNJSXk5Q2R1dnA2YTFXTjd5OEQ4Yi9kTVB0L2dRZUpISnA3ME13Wnhh?=
 =?utf-8?B?bis3UnFsK0REWEczQXhoaVZhMmFsZDN3MFkrcG1lZ2JxYkppbndqKzBpbStr?=
 =?utf-8?B?RGU3eGxvY2p4VWFXd0J6bVgyMDRzSXFsTTZ1bm9zakxKcUlyQ0dGTytpaDBa?=
 =?utf-8?B?UTlhMFNnZW1EM2hrYTY0VmRLVVFyUHBsU0cwcVFOeEVmWUpaSEwvZWhtWGc0?=
 =?utf-8?B?ZllxeWZUL2tPaEZIcUxJSGFDOVFZZE1mSGdWckR6eUZuUWQrTFg1MEMzeXY0?=
 =?utf-8?B?UVF4OW9zbmdSQlFWR1k0SEN4b2ZKT3FlQVFyQlcrVjRYQUtnUUZGTjljaUFG?=
 =?utf-8?B?QjdPcUNubFZVNXIvVjZsTzQ2cVUvaGFnMVhFSlJPejZGUUVSWGR2WVAwZmNE?=
 =?utf-8?B?VElCK3M0QVJkMG9rNnk4UlRBdVNjcjBvKzVodnJoODVtNU9wRVlldDd1MGY1?=
 =?utf-8?B?cFd4WHIrcTAwU3liNHhXKzRNc1NoZHl0L2pOY1pMdFNyUWF2YlhpWlpjZTh6?=
 =?utf-8?B?WWxPa1ZXVHBYaXNDVUovNmxWZHBJTEVud1hlQXBBc3ZkMkJzalNsUUZLTVpK?=
 =?utf-8?B?bU1yVW41YlJid3ZVTklYdjNCZWtmdHhpS0JQQVQyc2tCM1JFM0szNWpiUk1i?=
 =?utf-8?B?Ymd1MlBTTTYwcFZLSytjdlg3dEovSVdlL1VRajBTWjZMSTBvOFpCNWkxOVZZ?=
 =?utf-8?B?Vlg4cldjcFV2U1ZSRklRb05KNm5wck5hNmowYk1KUGRoZW9CUTZucHJwVmtQ?=
 =?utf-8?B?dnVybFFVMEpHUWtacG81c0RHaFI5RXZNa0J0OWlsOU1kMjQ4eGltbk5rQkxU?=
 =?utf-8?B?YkNXUkNpem1ZZy9YSVRHcWJWaGpBN1NjdjBQRk1tNENnOTZ0UHF0OFpad0NF?=
 =?utf-8?B?RUxnb0YrQjhiekRWWmVXLzcrZUs2OHAvMmx0MkQzSHUzbmN0MytTSTRMSWhh?=
 =?utf-8?B?b0V1MHZPRytuZ1MrZ1FoNlAxNEFZN0k3a1Bia2lSK2FaS2NYek9JK3VDa01C?=
 =?utf-8?B?WmFMT2ZlU0NFN2pJRytoU2o2aUVxbTVrN0NTbVBZbWdnOGNYMUxCZG1vOVU3?=
 =?utf-8?B?T2s4dUtFZkRnZWhGZFIrQnE1aytxdHVhUWUxSjdLTGJmbThUdjhBWlBrSFNa?=
 =?utf-8?B?aXo0K2Zub3VpRG5yQVRaQXl1YmpCb1gweW9lYUdwZDFja2JuZS9rRUppQURO?=
 =?utf-8?B?NXUyMjJ3Rnd1MDlpUVovc04zZW43T29FRkFFNzBFTXVQN1FGVVd1UUpoYWl1?=
 =?utf-8?B?R01FNHJnQjBNZTdNMmk5QUR3UTE4NCtUN0tva0d3d01oRmhtQW41NkczWjNT?=
 =?utf-8?B?OGZqcUxCTnBIMnFETmUyekU1Zk9hTVkwV0dJeUlibjErbFFvSDJ0V2VwdTgy?=
 =?utf-8?B?SDFsN2M4V0o0a0FtdzFMbVlOdlB0ZExnWVd6TTRlTTBhU3RvMU05U2JVbEZ3?=
 =?utf-8?B?TndJNTVucmRVRkFxd2VvaWhicWdmNGJKc2t3blYvUDZScFNFcnkraWxGbzU4?=
 =?utf-8?B?bUZxcDhtQjVMbExkd1VLVGcvTDl1eGZyRGhNWEVGYnE1TFB5Y0ZhbnhPZWJN?=
 =?utf-8?B?MUEwbWZxT3NNZWVjRHVCVlRHNUZMaCtEVzZGWmRXSzdrQzY1RE1acjRVR01T?=
 =?utf-8?B?VEpnd0tnMjY0aGJ3Q05MWGhkQ09VUnFoQllpYVZoRFhzRmNaTGViME5lV3pw?=
 =?utf-8?B?ZVVFQWhLbjFLcytZZmVMcnEzK1lJSUR6MFZ4S3F6N215Z1NEaTNoR3BhRWRQ?=
 =?utf-8?B?dU1XVi9zajNPUXc0dDZLMTFaVkp4b0E4NStPclZtdUMvd3RxYXc3TDJNSDhZ?=
 =?utf-8?B?aVZkUy9GOTVwbGJvcHQ1YWpmTmpDYlZMNHJPUDlRUnVIVEg2eXlKZzFZY2FK?=
 =?utf-8?B?UDRodlNTZEM5dWo3QlA3SzJpMUh4UFRSdmdnVG1FYjc3dDJlSXU1TmdiNFRJ?=
 =?utf-8?B?eW53MHlEaDdoYVBCM3NyS0pycjBzalg3V1VKZmptbDVieGFZN0QxMVNkaVNY?=
 =?utf-8?Q?UB8+LgjkSEpmtBJ0=3D?=
X-Exchange-RoutingPolicyChecked: 
	XckFVIU174NfrzMsqRJgNjRjYfrgGSxmkckKqudaIMlWBFjv2CX4GZSJ7LOJ65hNU9Hwotz0TOWtlUQe/8dqhqdW2i1AOQs0lTJPbrjjmr7v8rvx/RhblTF2CKav/G39oRMs2x+CC0GwA9tN5Du7Lnu5Z0sGvw5GKpKlBTATeI7J43gqk2la1FqfCcnYreu4o9OeqMpOLYAvvvLjb8Kzkit2jLbaBS/kki8lSGwHoV68IDHkl1yOUeP973IXR3+L/H8ThYTeIq0QWOce9deIrtoASZidZHqtno/V6ZwNuLZdiQzhbXfPL5g2Z4CqskLMdnONts8Z8G4SnXN2nR0mPA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8f241a-4fd9-46ed-b973-08de89a53801
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:43.7322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bm6c8StFUfRQ1LndW/tB+LvO31veKa5BrRJX1xNOUhW6g2EDlMMV1R055zSr6UyeICB0YpAR8VBRkFLdM8KWkwpvtMFtdBCl5jN2WRIgdG4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6128
X-Proofpoint-ORIG-GUID: eqfluZUB_yJ2O19jLpUVIeOgzMaajcIE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX0KWDV7GollwP
 egFomNzk3yYRvNjzoD0NxYe4Bi311yqfFSmNnKuTK7ZVjCmXBN/gNrxS7RKKm0piWznqTV59qvz
 JZskbrwD/8QGfDqynpHFEOH/Pt3etGFroFY+ueZhZStWt7F4o1qE48kjwziciwflPmumTTkup1D
 bLrub+v4S56Dc+ClNC7U55wOOEEqhukgQa5RBHsbw88RwzDbNnlMvdeP8xEdOU6xyyvHiyTEXHZ
 9JvXQXu8Cin/Y4e8GtjCAOHwkOiOLLzoEmTDnor8PJF39Md71pPABF9OkYiG6koXpSqSpVX3wl/
 dxOSMBQdtXhtcwop7DxtMBQhV/rE12WdmU0exOqiAadi87IboCB07Wr88DIYFTvw5Gfm3rQolhm
 oztK+hiGw+CIDXBhRRAdKIMlsus8OWWOUQEks5x9m2VEHnQuwQGO6bpqaZCPfC5HmporYdTHycO
 C1oLCUMRrpbsZ+1q6jQ==
X-Authority-Analysis: v=2.4 cv=LtqfC3dc c=1 sm=1 tr=0 ts=69c28ac1 cx=c_pps
 a=ekzRQQX7ZilozLPATeYkEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=t7CeM3EgAAAA:8 a=4ETO1KklNzmHfn55AIEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: eqfluZUB_yJ2O19jLpUVIeOgzMaajcIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O4QQh91225806
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125561

From: Zhang Peng <peng.zhang1.cn@windriver.com>

4.21.0 (2025-03-23)
=3D=3D=3D=3D=3D=3D
- build: Automate copyright year management
- build: Define xfce4 min version >=3D 4.18
- Replace deprecated exo with libxfce4ui 4.21.0
- meson-build: Add tests option
- meson-build: Use SPDX license expression
- meson-build: Update debug/optimization flag management
- autotools-build: Fix EXTRA_DIST redefinition
- Add meson build
- Set up GNU symbol visibility
- garcon: Remove include guard from private header
- garcon: Don't install garcon-marshal.h
- Translation Updates:
  Albanian, Amharic, Arabic, Armenian, Armenian (Armenia), Asturian,
  Basque, Belarusian, Bengali, Bulgarian, Catalan, Chinese (China),
  Chinese (Hong Kong), Chinese (Taiwan), Croatian, Czech, Danish,
  Dutch, Eastern Armenian, English (Australia), English (United
  Kingdom), Esperanto, Estonian, Finnish, French, Galician, Georgian,
  German, Greek, Hebrew, Hindi, Hungarian, Icelandic, Indonesian,
  Interlingue, Italian, Japanese, Kabyle, Kazakh, Korean, Lithuanian,
  Malay, Norwegian Bokm=C3=A5l, Norwegian Nynorsk, Occitan (post 1500),
  Polish, Portuguese, Portuguese (Brazil), Romanian, Russian, Serbian,
  Slovak, Slovenian, Spanish, Swedish, Thai, Turkish, Ukrainian,
  Uyghur, Welsh

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../garcon/{garcon_4.20.0.bb =3D> garcon_4.21.0.bb}         | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.20.0.bb =3D> garcon_4.21.=
0.bb} (68%)

diff --git a/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb b/meta-xfce/r=
ecipes-xfce/garcon/garcon_4.21.0.bb
similarity index 68%
rename from meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
rename to meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
index 5d7282ecbf..06ad0b9fbc 100644
--- a/meta-xfce/recipes-xfce/garcon/garcon_4.20.0.bb
+++ b/meta-xfce/recipes-xfce/garcon/garcon_4.21.0.bb
@@ -5,6 +5,8 @@ LICENSE =3D "LGPL-2.0-only & GFDL-1.1-no-invariants-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D04a01abcbdabffae1ca26335a2932=
76b"
 DEPENDS =3D "xfce4-dev-tools-native libxfce4ui intltool-native"
=20
+XFCE_COMPRESS_TYPE =3D "xz"
+
 inherit xfce gtk-doc gobject-introspection features_check
=20
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x1=
1 PACKAGECONFIG.
@@ -12,12 +14,16 @@ inherit xfce gtk-doc gobject-introspection features_c=
heck
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
=20
 SRC_URI +=3D "file://0001-xfce-applications.menu-don-t-bloat-settings-me=
nu-by-.patch"
-SRC_URI[sha256sum] =3D "7fb8517c12309ca4ddf8b42c34bc0c315e38ea077b5442bf=
cc4509415feada8f"
+SRC_URI[sha256sum] =3D "3acc3f6b81059199f4e6646da7b6ca39edf84ea90dd3ff87=
088ffca6aa108269"
=20
 EXTRA_OECONF =3D "--disable-gtk-doc"
=20
 do_compile:prepend() {
     export GIR_EXTRA_LIBS_PATH=3D"${B}/garcon/.libs"
+    # g-ir-scanner needs garcon/garcon-config.h but it's generated in ${=
B}/garcon/
+    mkdir -p ${B}/garcon/garcon ${B}/garcon-gtk/garcon
+    ln -sf ${B}/garcon/garcon-config.h ${B}/garcon/garcon/
+    ln -sf ${B}/garcon/garcon-config.h ${B}/garcon-gtk/garcon/
 }
=20
 FILES:${PN} +=3D "${datadir}/desktop-directories"
--=20
2.34.1


