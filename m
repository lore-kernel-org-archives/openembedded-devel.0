Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F591FCD0DC
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 08:28:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9236.1773822531180377573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Mar 2026 01:28:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=M8iPwtuK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753792e7cf=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I4Y4vX2913440
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=xBCBpo0OwWA7MJLXNat4
	jtL2YlTVm/mNFERjD+N96rU=; b=M8iPwtuKb/O4+u6ompDXOCOHfbd3XIUduo9o
	m+oPi8B9pU35XlUhCQjJ1Q7fAPspLnEKxuTxWLXgEvSAM7liq/AWdfjAg1jwTQfv
	cVG/pXCh1/KZk1ZDi2X4ZktLgAy92uqNZ++B+jNUTDjCN7nP5TG4oaCBeslcapv2
	dW5E1bc1jpK+I+OfGLQywWyZJfnCqf9t3KO+ZLY0iwJnKJ89S5ZI7slnc8L2fZWX
	DpHtN2MXzvBTOJvGrV2EJdGrHH0Uy9WmQfkHv4HHgLJVHfxgWl6CnQvn+pXaym1s
	s+z6qHpoJLwt/NACL02oWRYetY9J7ovPCY+HNuHllKTEK/Qyxg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010041.outbound.protection.outlook.com [52.101.56.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cy9ans1yn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:28:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XH2y1fxAiSqZZhCq9w3tACV27bFHLVT5fWYnZgIgxbxeOnj6DKjVVjNEuBHqfkM30YTFobgM2/s2Pjw1d0RMQ6MoBkLGw6KkAh8FU8GoNKdNsmL5rIGKTukYYgByjNpq0Kq+SfXIWKip4NvcuJzo7/wzZBpfpbwTwBzL1MMXLXAwWa4eYu2qOtSvWbWHhfcxQ2vJBUeBp7PiAFOsW1fnnq/5jRvGb5dKxLdBiVZzhN7k37IYXvrMZtIkkLQfZBA8aIc0cKn6xYhAylS8LYo9zXqGobVoZ6z02gC/11Sfhyw7GIJWhn6ovSZXFyvNJk38JtEI8I6ABKMmqV3MoiMrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBCBpo0OwWA7MJLXNat4jtL2YlTVm/mNFERjD+N96rU=;
 b=naHRRgbCaUFueK19aRz/aWwogCSUnOiZcFbYphKlZ/7qn/8pjU6qi5MNqHdyuC7nP3zElaOrR9BqSJ5bQzTNWjl98YU6JQq59fvpQNJBn06/Ig6YqecItFZWZSX70sS/V4cTU7ifW0jvgHR8TqzZbbuUiuk9uXqFZW2hsYikVbiBTygb2AlFLLlxfRb2CQqrXIDqJVQigrq79yYizvj+weKDn6u8vCQmuv+oAtQVptAbRUqlJc+gkLnCjw2HsprbgNX4PIq6PKAe2iaSDCkD5/I/PiGYHqnABSRGF4Rv81g1O5Enmko01QHjlSr2z2kF3OtEzBLitcT3RpVaZhKaVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by CY5PR11MB6413.namprd11.prod.outlook.com (2603:10b6:930:37::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.17; Wed, 18 Mar
 2026 08:28:43 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 08:28:43 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH V3] dlt-daemon: upgrade 2.18.10 to 3.0.0
Date: Wed, 18 Mar 2026 16:27:01 +0800
Message-Id: <20260318082701.281912-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0043.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::12) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|CY5PR11MB6413:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e0a9ab-bdf5-4279-3fe9-08de84c85d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|18002099003|56012099003|17002099007|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	f7boXRj7eMdjB3dU0ovdWdpHzy8iGdVtipV/xHCYd4gNXn3ELK6dxXC+IQzRzIvrDW/dzRNjk9gOnADd0NpgoAUtEuYqf8etUwtuBi8xuo9C3TBn57wiJylRi966ueDx0nPKEyCfyGgjg4tCjVijZUzegUA/jwtOEkkM+mEjPfohJgmcOz0A6FwuPqJ9BPh3NuK4jmUOAXFEH8GSHT3UufR+9oChuTqBMNpjpCJHJr35XzYLXEmCJacykZOx05YP+NKI4KeQkpzJVxtS97PphChdi7qOXJ7McWgJh8Lo1x55u9QlBxYgWU9q/CCG3DFV1NO0oOvfFP3TjnapBPusOtjWR5gCCCdHcaNmNeOvq3ibtnfLkhvxYkK3ZGbQx03qZ5AsHS/zTSWBkVAY7SOkrBbbAydt26UXvp7ra08t6kDuCR77VxVbH2WvzY1+3ukGulsJOIXvTGLFi1e85XRENrFEf9DvKQGxsXpSi01PwgsSSAvTSv46gdnO1GberkSBkJIlQ9MFBcl3kG3hxZuIfb/YvMM0PHQpNUQfFJjZoGUVvxsy+T69RhH+o30WxyRPOfDqoxo1Zq2Lpj3yluR9R8xON2q5mI5hnRu9HRDdVLoBQzTNzxlp1g7hdznc/jc5dD+fBPKqaxQxggVvYD15ebwa2k8zp8vD9Gxyl1sIi645FU8VxEGHsi0iTpgVZH+mC12tyqRPDrfEDuXwfEaCJWFQ1rQ5OhBTPAT3zG+yeUDkBWCo8flmai3yNZJ4Qwho
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(18002099003)(56012099003)(17002099007)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N0JyNU5UNC9sc2doRmdHaFM4Z2ZyVWR4OHVwakt5TytwWDJiY0wreWVDdzZu?=
 =?utf-8?B?YkR1bTRUNldaTDNkUmFKbXZpMG5Pd1puenoyd05yTEFzdVdyRm5pVk5YM0da?=
 =?utf-8?B?b3hxS2VpWGgyU3NkUyszTEFUcWlPVnc2dDY3bzVOWG9IQ21yOXUrSlJTbUNN?=
 =?utf-8?B?ckFwWTZROTZ1c2liYjNWWXMwQ3F5UDdCTk9LTHFlajJ3L21WM3FjcGpCamJT?=
 =?utf-8?B?UDNHS2VGMHhBUVNUMG42NnVRR1dQNXRrUEMwdEczeC9zemhoSmM5QTZFTEZs?=
 =?utf-8?B?bk4wcXVXZkhGaGF4R1diald4OTlHT0pYSmxaS2ZacXZqVzAvSk9DL3NuaVMz?=
 =?utf-8?B?VkxvTTg3SDB1TU8vM1FEYXdxd0RLZkc5UHZLQ0l2OHpFeWJhekIxMkpqOUZP?=
 =?utf-8?B?SWRrR2hzRWRBNmw2eU5Nczh5VUFSd3ZYNTBDRXFCWmoybVR6QjhVUy9VdzhW?=
 =?utf-8?B?TUlKalgwOXNFQzAwYUJRNGJabVBlRVo0ekxKRkhHNG9YZmczT1FRUEt3TGVr?=
 =?utf-8?B?S1BXYTlJeGh4R1BmajZPaTc3c2ZJNTNSc1I2QUxQQkpzaStJN1NwcGhNYTdK?=
 =?utf-8?B?QmY2dU5JN3AxVmxoK2ExSWNzbUVBaUh6aTA4ZVVBelBJdjg3dFlqTzROdXNx?=
 =?utf-8?B?Zml4eWJreElxbDhFc1ZrVVF6ZjU4YVpzVTJiS0xGRi9Eb0ZzYlVra1VzenZt?=
 =?utf-8?B?cDFMUFg3QXRUdUJxSHdvemVXNHJOaVBoT2JhQXdIOVpmU20yblJESTl3aDI4?=
 =?utf-8?B?Uld2MWI1Y0JZU3RxVHRhRzZFWEtxQUFVNVk3RGx0VlUvL25nUVpXUEdnS1FL?=
 =?utf-8?B?a3BHRThhOGtTU0ZDbk1GUWh0aGNqbFQxWkU0RzlqZ3lqdjkyWWQ4L1VuT25n?=
 =?utf-8?B?LzNVWEpMRkF5Tnk4eVNBNU8xYit2UENxb1VPWEQyMi9haEJwZHJjUUV3ZHVs?=
 =?utf-8?B?WHh6b3JDSzZzcjZRMHpna2FSdVFrZTYyd3RMdnkzRFFYTlZtK2ZmV1ZhdytF?=
 =?utf-8?B?WDJ2UzNQa1FuY0Y2T2VTVnArVk5VOVV2dnl6WlZ5YmxPL3J4OGprRTZieDVs?=
 =?utf-8?B?VElDeUUvUnFhcHRDbDlJZDYwM0xEcG8xV3hOTm1VZkIxem5XMDAvNm1YMjhO?=
 =?utf-8?B?aTlIUmowRVVYV0NjdTdkNHlvQTJhQk0yMGhzZDBEU0VaZ001bDhxbFJvOGxL?=
 =?utf-8?B?em5FRFJqczZqcGhuamJtVGVSQ3JuaFVjWm9OYTFBUFNET3dKMHFnbFdlNUpj?=
 =?utf-8?B?bTJyWStSMXAyZGxEcVZpTFZJbWNvSnBEa2d2OW0rZDZidC9DeElQbGUxSVU1?=
 =?utf-8?B?ZUNmZWRXWlA4NFUrK3JzNUNGRWxpWHErZFpoZW02aW5MT2ppNjdzUkRsSi81?=
 =?utf-8?B?cTlVekFEanNaYk1qc1Z5aFpmN2ZhdHF5dDRTZGtXTFJWZjBUT1RsREp5K0ZD?=
 =?utf-8?B?N0ltaytNdkxockR1MTFZUE1CWWxheFVqaHRYZnk5U1Q0V3hXYW84OXhmSXcv?=
 =?utf-8?B?Vk9YbGEza05TM3ZOYnFUbzUvanFSZ0hMSjJVU0lXcXJCTUlwc3MwaTRYTm1F?=
 =?utf-8?B?Q2tlSWcwVTFvQUFFZ1BIdTlJaDJNNjd2N2JUY1RxZ1FlVUc4SGRpWDVlTXdU?=
 =?utf-8?B?a3kyV2lvTm5HeFpoellObzh1TmVaMHFFVjdtRVJ6RC9SQzd2SjRSNFhIblhD?=
 =?utf-8?B?MkFHLzRoR0FFTHVZOFNSa0tLTDFPLzFMRytuQnFENldIQUJpdjc3NHRMaWt6?=
 =?utf-8?B?eEY4M01WZDZya1Z5eks1bUVZcDhxajRheFRCRnpsZWowMHVwQkk3MGFSUFM0?=
 =?utf-8?B?eUpXSjVRUWhYMElVdnBXTUVOeFRNNGM0R0hTSDg3UzJGTXFzZHV3ZHM4eG1k?=
 =?utf-8?B?UjhpUHhKbElpU1dNL2tHV3p3TUpiOW1MWHY2M3JESU5TL056Sk8yQUJYTDJo?=
 =?utf-8?B?ZzUyQkpIcGpSc242OC9rR3ErSnB2Sm44bzI5MHZNYm14TDRSelhLblZBRWM4?=
 =?utf-8?B?RlFpSFE1MlgrejJGbWZoNnA0NVY5dmRPRlREdEc4OTduOXVIaUtxY1h4VlJo?=
 =?utf-8?B?UzZqR1NFSUtNaFRlM2lWOW53c1ZqazZJbFV5QlhRWlRFa3lhejU5M2dwd2Fv?=
 =?utf-8?B?dHgxbjVqbGo0NDFXNVVOaW1nRVdvRFlnZXRPeE5tekMvamY0TmI3K2xqazJM?=
 =?utf-8?B?UUIyOEJsU2pJNG5ZaUc4RkNIeTlQbG9VaGlQUFJSK29CbXZ5M0FKVGRhM3ha?=
 =?utf-8?B?MTVPTXZzbmlUUlcyWmFITFBwcFFPcEt6Sk5jM1FOZ1hMWWcwQWZMVWZ1M2FF?=
 =?utf-8?B?SUtrTGE4KzVIUDNUaHJGZmcwQmZJUUVTUVpDK2RJYzM5NU9OOUsrWEs2WlJJ?=
 =?utf-8?Q?P6PNW+6rt+/ujJnk=3D?=
X-Exchange-RoutingPolicyChecked: 
	M7B3SExpbSfqlPO/vFJlNkiFo0HA8StDeL7Bsn4Qd2Zh9LQY1SoKQq4tZLpWWBGRf6uhRufto6Y/LuyogZT302nA+LtS7+dFt6GtY9PINLoD+TZbzHrSfP9Ka2vPHvDuE9v0tIdbXFsFzafgLk7K5MZbPLB1dincOc9wJRDKAI+KLb+uLllsPMkC2qp7xQKcs5PAUJY0ozhxD6V8kam1CHCLyo9luEt4MB9bVY9K5pH4GBWqyWzuoiaT5mtZs9r3H/IGItThjMEA1/3ZTHn1QfgIxUIj45Cv5ySu9AkIxs5cbw0ndwixvmPLygHsfyca1JgvIHHViLcIQmtZVZfNNQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e0a9ab-bdf5-4279-3fe9-08de84c85d6f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 08:28:43.5172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16g5LcNzX51c421KpcM0XsKN8hmqI7gW+elTTVJdWtBrmWpTwPpUtziEeWbC8MGv3kZhiDldqLTEl2xs0dk2JsmOj8HFTrPObTQ8rbjxmYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6413
X-Authority-Analysis: v=2.4 cv=IrMTsb/g c=1 sm=1 tr=0 ts=69ba6241 cx=c_pps
 a=XYu8HXWfxIrayFrXgJv6cg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=XMC4lU5bAAAA:20 a=NEAV23lmAAAA:8 a=pQs5aej7AAAA:8 a=rPClnSe_AAAA:8
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=xNf9USuDAAAA:8 a=y6lzDbN01fjIVhibnwYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=npGTQlmte4lqeLD-QWPy:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: uFCtVpT7VWg09lOJIHOkMHc1_o1UZvsB
X-Proofpoint-GUID: uFCtVpT7VWg09lOJIHOkMHc1_o1UZvsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MSBTYWx0ZWRfX7ncTRgruWLId
 IB0b0zpD1e8ubAXxn/3LtguoQmi8iczYsH6pb+tWJ2wfFd86Fk0cK6dtKf3B2uZXdn2iVH8In4A
 5n+2g3mhVmAtcGTGLAq1di0yagizAyLtH9Qmp7MAM9la8VQuCIam3jgjHVpZcVFWu1TKumhJqcE
 lna+Xrhrp8zoPv20E6lZH2sHfpichhXlHVjIEOAp0HgFj1PEZvOHOsusEmdVo+TimCbrlX1EOKj
 AzKJXaVni8QgNeBafzbdReLlk9Gk0kpTDaQPXvbosgsxgPFwbR27p6+0j691YyHItvAx1DM05+T
 B01A2PrOizXPr74Q4KCPg/d4S0OaINky3faCm0e7JxH6leMujjR7G9NX7rucq7qULCJRGT8oTKA
 rPVhm2SaUZ41cnolNNn9wTbSZP08z2iWiR8aw/WwZBLR6Ykajnrlicmy3vdskwZ1sVVzIKp0OKh
 DjzeGp/G70rts5G1lhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180071
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62I4Y4vX2913440
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Mar 2026 08:28:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125352

Changes:
https://github.com/COVESA/dlt-daemon/releases

Remove patches already in 3.0.0:
544.patch
567.patch
0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
0003-allow-build-with-cmake-4.patch

Add patches to fix build failures
0001-Fix-compile-failure-related-to-gzlog.patch
0001-Fix-kinds-of-build-failure.patch
0001-Fix-build-failures.patch
0001-fix-build-failure-when-systemd-is-enabled.patch
0001-Fix-build-failure-with-glibc-2.43.patch

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...e-DLT_WatchdogSec-can-be-set-by-user.patch |  40 --
 ...01-Fix-build-failure-with-glibc-2.43.patch |  55 +++
 .../dlt-daemon/0001-Fix-build-failures.patch  | 360 +++++++++++++++
 ...Fix-compile-failure-related-to-gzlog.patch |  69 +++
 .../0001-Fix-kinds-of-build-failure.patch     | 174 +++++++
 ...uild-failure-when-systemd-is-enabled.patch | 423 ++++++++++++++++++
 .../0003-allow-build-with-cmake-4.patch       |  99 ----
 .../dlt-daemon/dlt-daemon/544.patch           |  80 ----
 .../dlt-daemon/dlt-daemon/567.patch           |  36 --
 ...-daemon_2.18.10.bb =3D> dlt-daemon_3.0.0.bb} |  12 +-
 10 files changed, 1088 insertions(+), 260 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-C=
MakeLists-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-build-failure-with-glibc-2.43.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-build-failures.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-compile-failure-related-to-gzlog.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-F=
ix-kinds-of-build-failure.patch
 create mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-f=
ix-build-failure-when-systemd-is-enabled.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-a=
llow-build-with-cmake-4.patch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.pa=
tch
 delete mode 100644 meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.pa=
tch
 rename meta-oe/recipes-extended/dlt-daemon/{dlt-daemon_2.18.10.bb =3D> d=
lt-daemon_3.0.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLis=
ts-txt-make-DLT_WatchdogSec-can-be-set-by-user.patch b/meta-oe/recipes-ex=
tended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-make-DLT_WatchdogSec-can=
-be-set-by-user.patch
deleted file mode 100644
index 335872c40f..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-CMakeLists-txt-=
make-DLT_WatchdogSec-can-be-set-by-user.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From bc03f142507da92add8ba325fdf8187d47a7d719 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Fri, 13 Dec 2024 16:37:24 +0800
-Subject: [PATCH] CMakeLists.txt: make DLT_WatchdogSec can be set by user
-
-In my test env, WatchdogSec default value 2 is not enough, manually
-changed to 3 is ok. This makes dlt.service/dlt-system.service start
-failed during boot time. So, make DLT_WatchdogSec can be set by user, so
-user can set them to proper value at build time, then service can start
-successfully in boot time.
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
-Upstream-Status: Backport [https://github.com/COVESA/dlt-daemon/pull/720=
/commits/bc03f142507da92add8ba325fdf8187d47a7d719]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- systemd/CMakeLists.txt | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/systemd/CMakeLists.txt b/systemd/CMakeLists.txt
-index 16cbe86b5..659378d16 100644
---- a/systemd/CMakeLists.txt
-+++ b/systemd/CMakeLists.txt
-@@ -18,10 +18,14 @@ if(WITH_SYSTEMD)
-     set(SYSTEMD_CONFIGURATIONS_FILES_DIR ${SYSTEMD_UNITDIR} )
-=20
-     if(WITH_SYSTEMD_WATCHDOG)
--        set( DLT_WatchdogSec 2 )
-+        if(NOT DEFINED DLT_WatchdogSec)
-+            set(DLT_WatchdogSec 2 CACHE STRING "Watchdog timeout in sec=
onds")
-+        endif()
-         message( STATUS "The systemd watchdog is enabled - timeout is s=
et to ${DLT_WatchdogSec} seconds")
-     else(WITH_SYSTEMD_WATCHDOG)
--        set( DLT_WatchdogSec 0 )
-+        if(NOT DEFINED DLT_WatchdogSec)
-+             set(DLT_WatchdogSec 0 CACHE STRING "Watchdog timeout in se=
conds")
-+        endif()
-         message( STATUS "The systemd watchdog is disabled")
-     endif(WITH_SYSTEMD_WATCHDOG)
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-buil=
d-failure-with-glibc-2.43.patch b/meta-oe/recipes-extended/dlt-daemon/dlt=
-daemon/0001-Fix-build-failure-with-glibc-2.43.patch
new file mode 100644
index 0000000000..d37489e4b7
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failu=
re-with-glibc-2.43.patch
@@ -0,0 +1,55 @@
+From c833520ac8cb473a6d820a063adb10c49304c4a8 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Wed, 18 Mar 2026 13:42:04 +0800
+Subject: [PATCH] Fix build failure with glibc 2.43
+
+src/shared/dlt_common.c:6477:17: error: initialization discards 'const' =
qualifier from pointer target type [-Werror=3Ddiscarded-qualifiers]
+|  6477 |     char *dot =3D strrchr(filename, '.');
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
8]
+
+[1] https://github.com/bminor/glibc/commit/cd748a63ab1a7ae846175c532a3da=
ab341c62690
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ include/dlt/dlt_common.h | 2 +-
+ src/shared/dlt_common.c  | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/include/dlt/dlt_common.h b/include/dlt/dlt_common.h
+index 85cf5b7..30d3ca7 100644
+--- a/include/dlt/dlt_common.h
++++ b/include/dlt/dlt_common.h
+@@ -2308,7 +2308,7 @@ int dlt_execute_command(char *filename, char *comm=
and, ...);
+  * @param filename Only file names without prepended path allowed.
+  * @return pointer to extension
+  */
+-char *get_filename_ext(const char *filename);
++const char *get_filename_ext(const char *filename);
+=20
+ /**
+  * Extract the base name of given file name (without the extension).
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index aa0aaaa..4c379af 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -6467,14 +6467,14 @@ int dlt_execute_command(char *filename, char *co=
mmand, ...)
+     return ret;
+ }
+=20
+-char *get_filename_ext(const char *filename)
++const char *get_filename_ext(const char *filename)
+ {
+     if (filename =3D=3D NULL) {
+         fprintf(stderr, "ERROR: %s: invalid arguments\n", __func__);
+         return "";
+     }
+=20
+-    char *dot =3D strrchr(filename, '.');
++    const char *dot =3D strrchr(filename, '.');
+     return (!dot || dot =3D=3D filename) ? NULL : dot;
+ }
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-buil=
d-failures.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fi=
x-build-failures.patch
new file mode 100644
index 0000000000..6cfa3a5482
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-build-failu=
res.patch
@@ -0,0 +1,360 @@
+From 4813b72cfe82062db41dd1d8cfa7069634d78d9e Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 16 Mar 2026 13:28:40 +0800
+Subject: [PATCH] Fix build failures
+
+Fix the following similar build failures, some of the build failure
+reproduced with arm64/riscv64, some of the build reproduced with 32bit
+x86/arm.
+
+dlt_daemon_common.c:2785:26: error: conversion to 'int8_t' {aka 'signed =
char'} from 'char' may change the sign of the result [-Werror=3Dsign-conv=
ersion]
+
+src/tests/dlt-test-multi-process-client-v2.c:302:49: error: format '%lld=
' expects argument of type 'long long int', but argument 2 has type 'time=
_t' {aka 'long int'} [-Werror=3Dformat=3D]
+  302 |     printf(" Time running (seconds)        : %lld\n", time(NULL)=
 - stats.first_message_time);
+      |                                              ~~~^     ~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
+      |                                                 |               =
 |
+      |                                                 long long int   =
 time_t {aka long int}
+      |                                              %ld
+
+src/lib/dlt_user.c:5109:60: error: format '%lld' expects argument of typ=
e 'long long int', but argument 4 has type '__off_t' {aka 'long int'} [-W=
error=3Dformat=3D]
+ 5109 |             dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\=
n", __func__,
+      |                                                         ~~~^
+      |                                                            |
+      |                                                            long =
long int
+      |                                                         %ld
+ 5110 |                      st.st_size);
+      |                      ~~~~~~~~~~
+      |                        |
+      |                        __off_t {aka long int}
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
7]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/daemon/dlt-daemon.c                      |  8 ++---
+ src/daemon/dlt_daemon_client.c               | 32 ++++++++++----------
+ src/daemon/dlt_daemon_common.c               |  4 +--
+ src/lib/dlt_user.c                           | 18 +++++------
+ src/shared/dlt_common.c                      |  2 +-
+ src/shared/dlt_multiple_files.c              |  2 +-
+ src/tests/dlt-test-multi-process-client-v2.c |  8 ++---
+ src/tests/dlt-test-multi-process-v2.c        |  2 +-
+ src/tests/dlt-test-multi-process.c           |  2 +-
+ 9 files changed, 39 insertions(+), 39 deletions(-)
+
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
+index 523bf33..2ae5bc9 100644
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -457,7 +457,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
+=20
+     if (n < 0 || (size_t)n > sizeof(daemon_local->flags.loggingFilename=
)) {
+         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n"=
,
+-                __func__, n, daemon_local->flags.loggingFilename);
++                __func__, (long int)n, daemon_local->flags.loggingFilen=
ame);
+     }
+     daemon_local->flags.enableLoggingFileLimit =3D false;
+     daemon_local->flags.loggingFileSize =3D 250000;
+@@ -2501,7 +2501,7 @@ void dlt_daemon_exit_trigger()
+     n =3D snprintf(tmp, DLT_PATH_MAX, "%s/dlt", dltFifoBaseDir);
+     if (n < 0 || (size_t)n > DLT_PATH_MAX) {
+         dlt_vlog(LOG_WARNING, "%s: snprintf truncation/error(%ld) %s\n"=
,
+-                __func__, n, tmp);
++                __func__, (long int)n, tmp);
+     }
+=20
+     (void)unlink(tmp);
+@@ -2878,8 +2878,8 @@ int dlt_daemon_log_internal(DltDaemon *daemon, Dlt=
DaemonLocal *daemon_local,
+         dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon,daemon_lo=
cal,
+                             msg.headerbuffer, sizeof(DltStorageHeader),
+                             msg.headerbuffer + sizeof(DltStorageHeader)=
,
+-                            (size_t)(msg.headersize - (int32_t)sizeof(D=
ltStorageHeader)),
+-                            msg.databuffer, (size_t)msg.datasize, verbo=
se);
++                            (int)(msg.headersize - (int32_t)sizeof(DltS=
torageHeader)),
++                            msg.databuffer, (int)msg.datasize, verbose)=
;
+=20
+         free(msg.databuffer);
+     }else {
+diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_clie=
nt.c
+index 50d8f19..20a512b 100644
+--- a/src/daemon/dlt_daemon_client.c
++++ b/src/daemon/dlt_daemon_client.c
+@@ -551,8 +551,8 @@ int dlt_daemon_client_send_message_to_all_client(Dlt=
Daemon *daemon,
+     return dlt_daemon_client_send(DLT_DAEMON_SEND_TO_ALL, daemon, daemo=
n_local,
+                 daemon_local->msg.headerbuffer, sizeof(DltStorageHeader=
),
+                 daemon_local->msg.headerbuffer + sizeof(DltStorageHeade=
r),
+-                (size_t)(daemon_local->msg.headersize - (int32_t)sizeof=
(DltStorageHeader)),
+-                daemon_local->msg.databuffer, (size_t)daemon_local->msg=
.datasize, verbose);
++                (int)(daemon_local->msg.headersize - (int32_t)sizeof(Dl=
tStorageHeader)),
++                daemon_local->msg.databuffer, (int)daemon_local->msg.da=
tasize, verbose);
+=20
+ }
+=20
+@@ -771,8 +771,8 @@ int dlt_daemon_client_send_control_message(int sock,
+     if ((ret =3D
+              dlt_daemon_client_send(sock, daemon, daemon_local, msg->he=
aderbuffer, sizeof(DltStorageHeader),
+                                     msg->headerbuffer + sizeof(DltStora=
geHeader),
+-                                    (size_t)(msg->headersize - (int32_t=
)sizeof(DltStorageHeader)),
+-                                    msg->databuffer, (size_t)msg->datas=
ize, verbose))) {
++                                    (int)(msg->headersize - (int32_t)si=
zeof(DltStorageHeader)),
++                                    msg->databuffer, (int)msg->datasize=
, verbose))) {
+         dlt_log(LOG_DEBUG, "dlt_daemon_control_send_control_message: DL=
T message send to all failed!.\n");
+         return ret;
+     }
+@@ -1919,7 +1919,7 @@ void dlt_daemon_control_get_log_info(int sock,
+=20
+     /* Allocate buffer for response message */
+     resp.databuffer =3D (uint8_t *)malloc((size_t)resp.datasize);
+-    resp.databuffersize =3D (size_t)resp.datasize;
++    resp.databuffersize =3D resp.datasize;
+=20
+     if (resp.databuffer =3D=3D 0) {
+         dlt_daemon_control_service_response(sock,
+@@ -2572,7 +2572,7 @@ int dlt_daemon_control_message_buffer_overflow(int=
 sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2633,7 +2633,7 @@ int dlt_daemon_control_message_buffer_overflow_v2(=
int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2686,7 +2686,7 @@ void dlt_daemon_control_service_response(int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2732,7 +2732,7 @@ void dlt_daemon_control_service_response_v2(int so=
ck,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2779,7 +2779,7 @@ int dlt_daemon_control_message_unregister_context(=
int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2842,7 +2842,7 @@ int dlt_daemon_control_message_unregister_context_=
v2(int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2909,7 +2909,7 @@ int dlt_daemon_control_message_connection_info(int=
 sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -2962,7 +2962,7 @@ int dlt_daemon_control_message_connection_info_v2(=
int sock,
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -3010,7 +3010,7 @@ int dlt_daemon_control_message_timezone(int sock, =
DltDaemon *daemon, DltDaemonLo
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -3072,7 +3072,7 @@ int dlt_daemon_control_message_timezone_v2(int soc=
k, DltDaemon *daemon, DltDaemo
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+@@ -3127,7 +3127,7 @@ int dlt_daemon_control_message_marker(int sock, Dl=
tDaemon *daemon, DltDaemonLoca
+=20
+     if (msg.databuffer =3D=3D 0) {
+         msg.databuffer =3D (uint8_t *)malloc((size_t)msg.datasize);
+-        msg.databuffersize =3D (size_t)msg.datasize;
++        msg.databuffersize =3D msg.datasize;
+     }
+=20
+     if (msg.databuffer =3D=3D 0)
+diff --git a/src/daemon/dlt_daemon_common.c b/src/daemon/dlt_daemon_comm=
on.c
+index 2f08c6a..65b264a 100644
+--- a/src/daemon/dlt_daemon_common.c
++++ b/src/daemon/dlt_daemon_common.c
+@@ -2782,7 +2782,7 @@ int dlt_daemon_user_send_log_state(DltDaemon *daem=
on, DltDaemonApplication *app,
+     if (dlt_user_set_userheader(&userheader, DLT_USER_MESSAGE_LOG_STATE=
) < DLT_RETURN_OK)
+         return -1;
+=20
+-    logstate.log_state =3D daemon->connectionState;
++    logstate.log_state =3D (int8_t)daemon->connectionState;
+=20
+     /* log to FIFO */
+     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
+@@ -2811,7 +2811,7 @@ int dlt_daemon_user_send_log_state_v2(DltDaemon *d=
aemon, DltDaemonApplication *a
+     if (dlt_user_set_userheader_v2(&userheader, DLT_USER_MESSAGE_LOG_ST=
ATE) < DLT_RETURN_OK)
+         return -1;
+=20
+-    logstate.log_state =3D daemon->connectionState;
++    logstate.log_state =3D (int8_t)daemon->connectionState;
+=20
+     /* log to FIFO */
+     ret =3D dlt_user_log_out2_with_timeout(app->user_handle,
+diff --git a/src/lib/dlt_user.c b/src/lib/dlt_user.c
+index 6d0098d..e432e26 100644
+--- a/src/lib/dlt_user.c
++++ b/src/lib/dlt_user.c
+@@ -5106,8 +5106,8 @@ DltReturnValue dlt_user_log_send_log(DltContextDat=
a *log, const int mtype, int *
+                 return DLT_RETURN_ERROR;
+             }
+=20
+-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n", __fu=
nc__,
+-                     st.st_size);
++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n", __f=
unc__,
++                     (long long int)st.st_size);
+             /* Check filesize */
+             /* Return error if the file size has reached to maximum */
+             unsigned int msg_size =3D (unsigned int)st.st_size + (unsig=
ned int)msg.headersize +
+@@ -5115,8 +5115,8 @@ DltReturnValue dlt_user_log_send_log(DltContextDat=
a *log, const int mtype, int *
+             if (msg_size > dlt_user.filesize_max) {
+                 dlt_user_file_reach_max =3D true;
+                 dlt_vlog(LOG_ERR,
+-                         "%s: File size (%ld bytes) reached to defined =
maximum size (%d bytes)\n",
+-                         __func__, st.st_size, dlt_user.filesize_max);
++                         "%s: File size (%lld bytes) reached to defined=
 maximum size (%d bytes)\n",
++                         __func__, (long long int)st.st_size, dlt_user.=
filesize_max);
+                 dlt_mutex_unlock();
+                 return DLT_RETURN_FILESZERR;
+             }
+@@ -5612,21 +5612,21 @@ DltReturnValue dlt_user_log_send_log_v2(DltConte=
xtData *log, const int mtype, Dl
+                 return DLT_RETURN_ERROR;
+             }
+=20
+-            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%ld]\n", __fu=
nc__,
+-                     st.st_size);
++            dlt_vlog(LOG_DEBUG, "%s: Current file size=3D[%lld]\n", __f=
unc__,
++                     (long long int)st.st_size);
+             /* Check filesize */
+             /* Return error if the file size has reached to maximum */
+             unsigned int msg_size =3D 0;
+             if (st.st_size < 0 || st.st_size > UINT_MAX) {
+-                dlt_vlog(LOG_ERR, "%s: File size (%ld bytes) is invalid=
 or too large for unsigned int\n", __func__, st.st_size);
++                dlt_vlog(LOG_ERR, "%s: File size (%lld bytes) is invali=
d or too large for unsigned int\n", __func__, (long long int)st.st_size);
+                 return DLT_RETURN_FILESZERR;
+             }
+             msg_size =3D (unsigned int)st.st_size + (unsigned int) msg.=
headersizev2 + (unsigned int) log->size;
+             if (msg_size > dlt_user.filesize_max) {
+                 dlt_user_file_reach_max =3D true;
+                 dlt_vlog(LOG_ERR,
+-                         "%s: File size (%ld bytes) reached to defined =
maximum size (%d bytes)\n",
+-                         __func__, st.st_size, dlt_user.filesize_max);
++                         "%s: File size (%lld bytes) reached to defined=
 maximum size (%d bytes)\n",
++                         __func__, (long long int)st.st_size, dlt_user.=
filesize_max);
+                 return DLT_RETURN_FILESZERR;
+             }
+             else {
+diff --git a/src/shared/dlt_common.c b/src/shared/dlt_common.c
+index 6ad354b..aa0aaaa 100644
+--- a/src/shared/dlt_common.c
++++ b/src/shared/dlt_common.c
+@@ -1220,7 +1220,7 @@ DltReturnValue dlt_message_header_flags_v2(DltMess=
ageV2 *msg, char *text, size_t
+             for (int i =3D 0; i<5; ++i){
+                 tt =3D (tt << 8) | msg->headerextrav2.seconds[i];
+             }
+-            snprintf(text + strlen(text), textlength - strlen(text), "%=
ld.%.9u ", tt, msg->headerextrav2.nanoseconds);
++            snprintf(text + strlen(text), textlength - strlen(text), "%=
lld.%.9u ", (long long int)tt, msg->headerextrav2.nanoseconds);
+         }
+         else
+             snprintf(text + strlen(text), textlength - strlen(text), "-=
--------- ");
+diff --git a/src/shared/dlt_multiple_files.c b/src/shared/dlt_multiple_f=
iles.c
+index c4019e5..65529ff 100644
+--- a/src/shared/dlt_multiple_files.c
++++ b/src/shared/dlt_multiple_files.c
+@@ -257,7 +257,7 @@ ssize_t multiple_files_buffer_get_total_size(const M=
ultipleFilesRingBuffer *file
+             if (((unsigned int)res < sizeof(filename)) && (res > 0)) {
+                 errno =3D 0;
+                 if (0 =3D=3D stat(filename, &status))
+-                    size +=3D status.st_size;
++                    size +=3D (ssize_t)status.st_size;
+                 else
+                     fprintf(stderr, "file %s cannot be stat-ed, error=3D=
%s\n", filename, strerror(errno));
+             }
+diff --git a/src/tests/dlt-test-multi-process-client-v2.c b/src/tests/dl=
t-test-multi-process-client-v2.c
+index 2bb1158..ec99720 100644
+--- a/src/tests/dlt-test-multi-process-client-v2.c
++++ b/src/tests/dlt-test-multi-process-client-v2.c
+@@ -299,10 +299,10 @@ void print_stats(s_statistics stats, s_parameters =
params)
+     printf(" Messages received             : %d\n", stats.messages_rece=
ived);
+     printf(" Broken messages received      : %d\n", stats.broken_messag=
es_received);
+     printf(" Bytes received                : %d\n", stats.bytes_receive=
d);
+-    printf(" Time running (seconds)        : %ld\n", time(NULL) - stats=
.first_message_time);
+-    printf(" Throughput (msgs/sec)/(B/sec) : %ld/%ld\n",
+-           stats.messages_received / ((time(NULL) - stats.first_message=
_time) + 1),
+-           (stats.bytes_received) / ((time(NULL) - stats.first_message_=
time) + 1));
++    printf(" Time running (seconds)        : %lld\n", (long long int)(t=
ime(NULL) - stats.first_message_time));
++    printf(" Throughput (msgs/sec)/(B/sec) : %lld/%lld\n",
++           (long long int)(stats.messages_received / ((time(NULL) - sta=
ts.first_message_time) + 1)),
++           (long long int)((stats.bytes_received) / ((time(NULL) - stat=
s.first_message_time) + 1)));
+=20
+     if (params.messages_left =3D=3D 0) {
+         if (stats.broken_messages_received =3D=3D 0)
+diff --git a/src/tests/dlt-test-multi-process-v2.c b/src/tests/dlt-test-=
multi-process-v2.c
+index 44a8622..1d3a54a 100644
+--- a/src/tests/dlt-test-multi-process-v2.c
++++ b/src/tests/dlt-test-multi-process-v2.c
+@@ -393,7 +393,7 @@ void *do_logging(void *arg)
+=20
+         sleep_time =3D mksleep_time(data->params.delay, data->params.de=
lay_fudge);
+         ts.tv_sec =3D sleep_time / 1000000000;
+-        ts.tv_nsec =3D sleep_time % 1000000000;
++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
+         nanosleep(&ts, NULL);
+     }
+=20
+diff --git a/src/tests/dlt-test-multi-process.c b/src/tests/dlt-test-mul=
ti-process.c
+index 016c8b4..00fb11c 100644
+--- a/src/tests/dlt-test-multi-process.c
++++ b/src/tests/dlt-test-multi-process.c
+@@ -370,7 +370,7 @@ void *do_logging(void *arg)
+=20
+         sleep_time =3D mksleep_time(data->params.delay, data->params.de=
lay_fudge);
+         ts.tv_sec =3D sleep_time / 1000000000;
+-        ts.tv_nsec =3D sleep_time % 1000000000;
++        ts.tv_nsec =3D (long int)(sleep_time % 1000000000);
+         nanosleep(&ts, NULL);
+     }
+=20
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-comp=
ile-failure-related-to-gzlog.patch b/meta-oe/recipes-extended/dlt-daemon/=
dlt-daemon/0001-Fix-compile-failure-related-to-gzlog.patch
new file mode 100644
index 0000000000..f9692d9f4d
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-compile-fai=
lure-related-to-gzlog.patch
@@ -0,0 +1,69 @@
+From bee9bce043c72de1d27a4251333ace9fe66bcc74 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 12 Mar 2026 19:37:11 +0800
+Subject: [PATCH] Fix compile failure related to gzlog
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+* In commit [1], gzlog is changed from gzFile to gzFile*, this cause
+  failure:
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:88:21: error:=
 passing argument 1 of =E2=80=98gzclose=E2=80=99 from incompatible pointe=
r type [-Werror=3Dincompatible-pointer-types]
+   88 |         gzclose(data->gzlog);
+      |                 ~~~~^~~~~~~
+      |                     |
+      |                     struct gzFile_s **
+compilation terminated due to -Wfatal-errors.
+
+so change gzlog back to gzFile, so that all the gzxxx function can work
+well.
+
+* Change to gzFile causes the following failure, since fileno need
+  FILE*, according to code "config->gzlog =3D gzdopen(config->fd, mode)"=
,
+  seems we don't need to use fileno, just use config->fd is ok.
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage_behavior.c:1133=
:48: error: passing argument 1 of =E2=80=98fileno=E2=80=99 from incompati=
ble pointer type [-Werror=3Dincompatible-pointer-types]
+ 1133 |                         if (fsync(fileno(config->gzlog)) !=3D 0)=
 {
+      |                                          ~~~~~~^~~~~~~
+      |                                                |
+      |                                                gzFile {aka struc=
t gzFile_s *}
+compilation terminated due to -Wfatal-errors.
+
+[1] https://github.com/COVESA/dlt-daemon/commit/543087ba98c103dc576edade=
ccf614c9dab1b9b3
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
6]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/offlinelogstorage/dlt_offline_logstorage.h          | 2 +-
+ src/offlinelogstorage/dlt_offline_logstorage_behavior.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlin=
elogstorage/dlt_offline_logstorage.h
+index fe38687..09ea5ce 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
+@@ -217,7 +217,7 @@ struct DltLogStorageFilterConfig
+     FILE *log;                      /* current open log file */
+     int fd;                         /* The file descriptor for the acti=
ve log file */
+ #ifdef DLT_LOGSTORAGE_USE_GZIP
+-    gzFile *gzlog;                  /* current open gz log file */
++    gzFile gzlog;                   /* current open gz log file */
+ #endif
+     void *cache;                    /* log data cache */
+     unsigned int specific_size;     /* cache size used for specific_siz=
e sync strategy */
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/s=
rc/offlinelogstorage/dlt_offline_logstorage_behavior.c
+index f17fbb2..ff09c9e 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
+@@ -1130,7 +1130,7 @@ int dlt_logstorage_prepare_on_msg(DltLogStorageFil=
terConfig *config,
+                     (config->sync =3D=3D DLT_LOGSTORAGE_SYNC_UNSET)) {
+ #ifdef DLT_LOGSTORAGE_USE_GZIP
+                     if (config->gzip_compression =3D=3D DLT_LOGSTORAGE_=
GZIP_ON) {
+-                        if (fsync(fileno(config->gzlog)) !=3D 0) {
++                        if (fsync(config->fd) !=3D 0) {
+                             if (errno !=3D ENOSYS) {
+                                 dlt_vlog(LOG_ERR, "%s: failed to sync g=
zip log file\n", __func__);
+                             }
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kind=
s-of-build-failure.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon=
/0001-Fix-kinds-of-build-failure.patch
new file mode 100644
index 0000000000..403d1089e2
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-Fix-kinds-of-bu=
ild-failure.patch
@@ -0,0 +1,174 @@
+From 3d713358fe19ce02e7c580d26222ec2386c94bc9 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 12 Mar 2026 20:06:34 +0800
+Subject: [PATCH] Fix kinds of build failure
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Fix kinds of build failures caused by -Werror=3Dsign-conversion,
+-Werror=3Dcast-qual, -Werror=3Dconversion etc.
+Eg:
+src/offlinelogstorage/dlt_offline_logstorage.h:129:49: error: unsigned c=
onversion from =E2=80=98int=E2=80=99 to =E2=80=98unsigned int=E2=80=99 ch=
anges value from =E2=80=98-1=E2=80=99 to =E2=80=984294967295=E2=80=99 [-W=
error=3Dsign-conversion]
+  129 | #define DLT_LOGSTORAGE_GZIP_ERROR               -1 /* error case=
 */
+      |                                                 ^
+/dlt-daemon/src/offlinelogstorage/dlt_offline_logstorage.c:1303:36: note=
: in expansion of macro =E2=80=98DLT_LOGSTORAGE_GZIP_ERROR=E2=80=99
+ 1303 |         config->gzip_compression =3D DLT_LOGSTORAGE_GZIP_ERROR;
+
+      |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~
+
+src/offlinelogstorage/dlt_offline_logstorage_behavior.c:851:16: error: c=
onversion from =E2=80=98z_size_t=E2=80=99 {aka =E2=80=98long unsigned int=
=E2=80=99} to =E2=80=98int=E2=80=99 may change value [-Werror=3Dconversio=
n]
+  851 |         return gzfwrite(ptr, size, nmemb, config->gzlog);
+      |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+src/console/dlt-control-common.c:922:25: error: cast discards 'const' qu=
alifier from pointer target type [-Werror=3Dcast-qual]
+  922 |     json_object_to_file((char*)filename, json_filter_obj);
+      |
+
+Use explicit type conversion to make the build can pass
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
6]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/console/dlt-control-common.c                       |  2 +-
+ src/daemon/dlt-daemon.c                                |  4 ++--
+ src/daemon/udp_connection/dlt_daemon_udp_socket.c      | 10 +++++-----
+ src/examples/dlt-example-multicast-clientmsg-view.c    |  8 ++++----
+ src/offlinelogstorage/dlt_offline_logstorage.h         |  2 +-
+ .../dlt_offline_logstorage_behavior.c                  |  4 ++--
+ 6 files changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/src/console/dlt-control-common.c b/src/console/dlt-control-=
common.c
+index 2aeea280..4f9e95b4 100644
+--- a/src/console/dlt-control-common.c
++++ b/src/console/dlt-control-common.c
+@@ -919,7 +919,7 @@ DltReturnValue dlt_json_filter_save(DltFilter *filte=
r, const char *filename, int
+     }
+=20
+     printf("Saving current filter into '%s'\n", filename);
+-    json_object_to_file((char*)filename, json_filter_obj);
++    json_object_to_file(filename, json_filter_obj);
+=20
+     return DLT_RETURN_OK;
+ }
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
+index 97af1cd9..94024eb4 100644
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -867,7 +867,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
+=20
+                         if ((longval =3D=3D MULTICAST_CONNECTION_DISABL=
ED)
+                             || (longval =3D=3D MULTICAST_CONNECTION_ENA=
BLED)) {
+-                            daemon_local->UDPConnectionSetup =3D longva=
l;
++                            daemon_local->UDPConnectionSetup =3D (int)l=
ongval;
+                             printf("Option: %s=3D%s\n", token, value);
+                         }
+                         else {
+@@ -884,7 +884,7 @@ int option_file_parser(DltDaemonLocal *daemon_local)
+                     }
+                     else if (strcmp(token, "UDPMulticastIPPort") =3D=3D=
 0)
+                     {
+-                        daemon_local->UDPMulticastIPPort =3D strtol(val=
ue, NULL, 10);
++                        daemon_local->UDPMulticastIPPort =3D (int)strto=
l(value, NULL, 10);
+                     }
+ #endif
+                     else if (strcmp(token, "BindAddress") =3D=3D 0)
+diff --git a/src/daemon/udp_connection/dlt_daemon_udp_socket.c b/src/dae=
mon/udp_connection/dlt_daemon_udp_socket.c
+index 4c40cda8..b3408773 100644
+--- a/src/daemon/udp_connection/dlt_daemon_udp_socket.c
++++ b/src/daemon/udp_connection/dlt_daemon_udp_socket.c
+@@ -66,7 +66,7 @@ void dlt_daemon_udp_setmulticast_addr(DltDaemonLocal *=
daemon_local)
+     struct sockaddr_in clientaddr;
+     clientaddr.sin_family =3D AF_INET;
+     inet_pton(AF_INET, daemon_local->UDPMulticastIPAddress, &clientaddr=
.sin_addr);
+-    clientaddr.sin_port =3D htons(daemon_local->UDPMulticastIPPort);
++    clientaddr.sin_port =3D htons((uint16_t)daemon_local->UDPMulticastI=
PPort);
+     memcpy(&g_udpmulticast_addr.clientaddr, &clientaddr, sizeof(struct =
sockaddr_in));
+     g_udpmulticast_addr.clientaddr_size =3D sizeof(g_udpmulticast_addr.=
clientaddr);
+     g_udpmulticast_addr.isvalidflag =3D ADDRESS_VALID;
+@@ -224,17 +224,17 @@ void dlt_daemon_udp_clientmsg_send(DltDaemonClient=
SockInfo *clientinfo,
+=20
+     if ((clientinfo->isvalidflag =3D=3D ADDRESS_VALID) &&
+         (size1 > 0) && (size2 > 0)) {
+-        void *data =3D (void *)calloc(size1 + size2, sizeof(char));
++        void *data =3D (void *)calloc((size_t)(size1 + size2), sizeof(c=
har));
+=20
+         if (data =3D=3D NULL) {
+             dlt_vlog(LOG_ERR, "%s: calloc failure\n", __func__);
+             return;
+         }
+=20
+-        memcpy(data, data1, size1);
+-        memcpy(data + size1, data2, size2);
++        memcpy(data, data1, (size_t)size1);
++        memcpy((int*)data + size1, data2, (size_t)size2);
+=20
+-        if (sendto(g_udp_sock_fd, data, size1 + size2, 0, (struct socka=
ddr *)&clientinfo->clientaddr,
++        if (sendto(g_udp_sock_fd, data, (size_t)(size1 + size2), 0, (st=
ruct sockaddr *)&clientinfo->clientaddr,
+                    clientinfo->clientaddr_size) < 0)
+             dlt_vlog(LOG_ERR, "%s: Send UDP Packet Data failed\n", __fu=
nc__);
+=20
+diff --git a/src/examples/dlt-example-multicast-clientmsg-view.c b/src/e=
xamples/dlt-example-multicast-clientmsg-view.c
+index c00537e5..f8920453 100644
+--- a/src/examples/dlt-example-multicast-clientmsg-view.c
++++ b/src/examples/dlt-example-multicast-clientmsg-view.c
+@@ -74,9 +74,9 @@ int dlt_receiver_receive_socket_udp(struct clientinfos=
truct *clientinfo, DltRece
+     /* wait for data from socket */
+     unsigned int addrlen =3D sizeof(clientinfo->addr);
+=20
+-    if ((receiver->bytesRcvd =3D recvfrom(clientinfo->fd,
++    if ((receiver->bytesRcvd =3D (int32_t)recvfrom(clientinfo->fd,
+                                         receiver->buf + receiver->lastB=
ytesRcvd,
+-                                        receiver->buffersize - receiver=
->lastBytesRcvd,
++                                        (size_t)(receiver->buffersize -=
 receiver->lastBytesRcvd),
+                                         0,
+                                         (struct sockaddr *)&(clientinfo=
->addr), &addrlen))
+         <=3D 0) {
+@@ -177,11 +177,11 @@ int main()
+         dlt_receiver_receive_socket_udp(&clientinfo, &(clientinfo.recei=
ver));
+=20
+         while (dlt_message_read(&msg, (unsigned char *)(clientinfo.rece=
iver.buf),
+-                                clientinfo.receiver.bytesRcvd, 0, 0) =3D=
=3D DLT_MESSAGE_ERROR_OK) {
++                                (unsigned int)clientinfo.receiver.bytes=
Rcvd, 0, 0) =3D=3D DLT_MESSAGE_ERROR_OK) {
+             dlt_receive_message_callback_udp(&msg);
+=20
+             if (dlt_receiver_remove(&(clientinfo.receiver),
+-                                    msg.headersize + msg.datasize - siz=
eof(DltStorageHeader))
++                                    msg.headersize + msg.datasize - ((i=
nt32_t)(sizeof(DltStorageHeader))))
+                 =3D=3D DLT_RETURN_ERROR) {
+                 /* Return value ignored */
+                 dlt_message_free(&msg, 0);
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage.h b/src/offlin=
elogstorage/dlt_offline_logstorage.h
+index 09ea5ce4..cfb70f33 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage.h
++++ b/src/offlinelogstorage/dlt_offline_logstorage.h
+@@ -192,7 +192,7 @@ struct DltLogStorageFilterConfig
+     int overwrite;                  /* Overwrite strategy */
+     int skip;                       /* Flag to skip file logging if DIS=
CARD_NEW */
+     char *ecuid;                    /* ECU identifier */
+-    unsigned int gzip_compression;  /* Toggle if log files should be gz=
ip compressed */
++    int gzip_compression;           /* Toggle if log files should be gz=
ip compressed */
+     /* callback function for filter configurations */
+     int (*dlt_logstorage_prepare)(DltLogStorageFilterConfig *config,
+                                   DltLogStorageUserConfig *file_config,
+diff --git a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c b/s=
rc/offlinelogstorage/dlt_offline_logstorage_behavior.c
+index ff09c9eb..ae8f4442 100644
+--- a/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
++++ b/src/offlinelogstorage/dlt_offline_logstorage_behavior.c
+@@ -848,10 +848,10 @@ DLT_STATIC int dlt_logstorage_write_to_log(void *p=
tr, size_t size, size_t nmemb,
+ {
+ #ifdef DLT_LOGSTORAGE_USE_GZIP
+     if (config->gzip_compression =3D=3D DLT_LOGSTORAGE_GZIP_ON) {
+-        return gzfwrite(ptr, size, nmemb, config->gzlog);
++        return (int)gzfwrite(ptr, size, nmemb, config->gzlog);
+     }
+     else {
+-        return fwrite(ptr, size, nmemb, config->log);
++        return (int)fwrite(ptr, size, nmemb, config->log);
+     }
+ #else
+     return (int)fwrite(ptr, size, nmemb, config->log);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-buil=
d-failure-when-systemd-is-enabled.patch b/meta-oe/recipes-extended/dlt-da=
emon/dlt-daemon/0001-fix-build-failure-when-systemd-is-enabled.patch
new file mode 100644
index 0000000000..d19a23cd9c
--- /dev/null
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0001-fix-build-failu=
re-when-systemd-is-enabled.patch
@@ -0,0 +1,423 @@
+From 28322f951bb8510ddb4cf767426a67c81ce826ab Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 17 Mar 2026 13:04:11 +0800
+Subject: [PATCH] fix build failure when systemd is enabled
+
+Fix build failures when -DWITH_SYSTEMD=3DON, -DWITH_SYSTEMD_WATCHDOG=3DO=
N,
+-DWITH_SYSTEMD_JOURNAL=3DON:
+Eg:
+src/system/dlt-system-syslog.c:91:39: error: conversion from 'int' to '_=
_uint16_t' {aka 'short unsigned int'} may change value [-Werror=3Dconvers=
ion]
+   91 |     syslog_addr.sin6_port =3D htons(opts.Port);
+      |                                   ~~~~^~~~~
+
+src/system/dlt-system-logfile.c:74:21: error: conversion from 'size_t' {=
aka 'long unsigned int'} to 'int' may change value [-Werror=3Dconversion]
+   74 |             bytes =3D fread(buffer, 1, sizeof(buffer) - 1, pFile=
);
+      |                     ^~~~~
+
+src/daemon/dlt-daemon.c:5513:14: error: unused variable 'curr_time' [-We=
rror=3Dunused-variable]
+ 5513 |     uint32_t curr_time =3D 0U;
+      |              ^~~~~~~~~
+
+src/system/dlt-system-syslog.c:120:22: error: conversion from 'ssize_t' =
{aka 'long int'} to 'int' may change value [-Werror=3Dconversion]
+  120 |     int bytes_read =3D recvfrom(sock, recv_data, RECV_BUF_SZ, 0,
+      |                      ^~~~~~~~
+
+src/system/dlt-system-logfile.c:76:23: error: comparison of unsigned exp=
ression in '>=3D 0' is always true [-Werror=3Dtype-limits]
+   76 |             if (bytes >=3D 0)
+      |                       ^~
+
+ src/system/dlt-system-filetransfer.c:727:56: error: '__builtin___snprin=
tf_chk' output may be truncated before the last format cha    racter [-We=
rror=3Dformat-truncation=3D]
+ 10   727 |                         snprintf(tosend, length, "%s/%s", op=
ts->Directory[j], ie->name);
+
+src/system/dlt-system-filetransfer.c:153: error: declaration of 'len' sh=
adows a previous local [-Werror=3Dshadow]
+
+Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/82=
8]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/daemon/dlt-daemon.c                  |  8 +----
+ src/daemon/dlt_daemon_client.c           |  2 +-
+ src/system/dlt-system-filetransfer.c     | 43 +++++++++++++-----------
+ src/system/dlt-system-journal.c          |  2 +-
+ src/system/dlt-system-logfile.c          |  4 +--
+ src/system/dlt-system-process-handling.c |  2 +-
+ src/system/dlt-system-processes.c        |  2 +-
+ src/system/dlt-system-syslog.c           |  6 ++--
+ src/system/dlt-system-watchdog.c         |  8 ++---
+ systemd/3rdparty/sd-daemon.c             |  5 +--
+ 10 files changed, 40 insertions(+), 42 deletions(-)
+
+diff --git a/src/daemon/dlt-daemon.c b/src/daemon/dlt-daemon.c
+index ef42f89..8c318a4 100644
+--- a/src/daemon/dlt-daemon.c
++++ b/src/daemon/dlt-daemon.c
+@@ -1620,7 +1620,7 @@ int main(int argc, char *argv[])
+             watchdogTimeoutSeconds =3D 30;
+         }
+=20
+-        daemon.watchdog_trigger_interval =3D watchdogTimeoutSeconds;
++        daemon.watchdog_trigger_interval =3D (unsigned int)watchdogTime=
outSeconds;
+         daemon.watchdog_last_trigger_time =3D 0U;
+         create_timer_fd(&daemon_local,
+                         watchdogTimeoutSeconds,
+@@ -5509,9 +5509,6 @@ int dlt_daemon_send_ringbuffer_to_client(DltDaemon=
 *daemon, DltDaemonLocal *daem
+     int ret;
+     static uint8_t data[DLT_DAEMON_RCVBUFSIZE];
+     int length;
+-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
+-    uint32_t curr_time =3D 0U;
+-#endif
+=20
+     PRINT_FUNCTION_VERBOSE(verbose);
+=20
+@@ -5554,9 +5551,6 @@ int dlt_daemon_send_ringbuffer_to_client_v2(DltDae=
mon *daemon, DltDaemonLocal *d
+     int ret;
+     static uint8_t data[DLT_DAEMON_RCVBUFSIZE];
+     int length;
+-#ifdef DLT_SYSTEMD_WATCHDOG_ENABLE
+-    uint32_t curr_time =3D 0U;
+-#endif
+=20
+     PRINT_FUNCTION_VERBOSE(verbose);
+=20
+diff --git a/src/daemon/dlt_daemon_client.c b/src/daemon/dlt_daemon_clie=
nt.c
+index 20a512b..681bf1e 100644
+--- a/src/daemon/dlt_daemon_client.c
++++ b/src/daemon/dlt_daemon_client.c
+@@ -4690,7 +4690,7 @@ int dlt_daemon_process_systemd_timer(DltDaemon *da=
emon,
+=20
+     if ((daemon_local =3D=3D NULL) || (daemon =3D=3D NULL) || (receiver=
 =3D=3D NULL)) {
+         dlt_vlog(LOG_ERR, "%s: invalid parameters", __func__);
+-        return res;
++        return (int)res;
+     }
+=20
+     res =3D read(receiver->fd, &expir, sizeof(expir));
+diff --git a/src/system/dlt-system-filetransfer.c b/src/system/dlt-syste=
m-filetransfer.c
+index c082f22..6024a3e 100644
+--- a/src/system/dlt-system-filetransfer.c
++++ b/src/system/dlt-system-filetransfer.c
+@@ -105,14 +105,14 @@ char *unique_name(char *src)
+             DLT_STRING("dlt-system-filetransfer, creating unique tempor=
ary file name."));
+     time_t t =3D time(NULL);
+     int ok;
+-    uint32_t l =3D getFileSerialNumber(src, &ok) ^ t;
++    uint32_t l =3D (uint32_t)(getFileSerialNumber(src, &ok) ^ t);
+=20
+     if (!ok)
+         return (char *)NULL;
+=20
+     char *basename_f =3D basename(src);
+     /* Length of ULONG_MAX + 1 */
+-    int len =3D 11 + strlen(basename_f);
++    size_t len =3D 11 + strlen(basename_f);
+=20
+     if (len > NAME_MAX) {
+         DLT_LOG(dltsystem, DLT_LOG_WARN,
+@@ -155,7 +155,7 @@ void send_dumped_file(FiletransferOptions const *opt=
s, char *dst_tosend)
+             while ((total - used) < (total / 2)) {
+                 struct timespec t;
+                 t.tv_sec =3D 0;
+-                t.tv_nsec =3D 1000000ul * opts->TimeoutBetweenLogs;
++                t.tv_nsec =3D (long int)(1000000ul * (unsigned long)opt=
s->TimeoutBetweenLogs);
+                 nanosleep(&t, NULL);
+                 dlt_user_log_resend_buffer();
+                 dlt_user_check_buffer(&total, &used);
+@@ -220,7 +220,7 @@ int compress_file_to(char *src, char *dst, int level=
)
+     MALLOC_ASSERT(buf);
+=20
+     while (!feof(src_file)) {
+-        int read =3D fread(buf, 1, Z_CHUNK_SZ, src_file);
++        size_t read =3D fread(buf, 1, Z_CHUNK_SZ, src_file);
+=20
+         if (ferror(src_file)) {
+             free(buf);
+@@ -230,7 +230,7 @@ int compress_file_to(char *src, char *dst, int level=
)
+             return -1;
+         }
+=20
+-        gzwrite(dst_file, buf, read);
++        gzwrite(dst_file, buf, (unsigned int)read);
+     }
+=20
+     if (remove(src) < 0)
+@@ -290,7 +290,7 @@ int send_one(char *src, FiletransferOptions const *o=
pts, int which)
+         char *dst_tocompress;/*file which is going to be compressed, th=
e compressed one is named dst_tosend */
+=20
+=20
+-        int len =3D strlen(fdir) + strlen(SUBDIR_COMPRESS) + strlen(rn)=
 + 3;/*the filename in .tocompress +2 for 2*"/", +1 for \0 */
++        size_t len =3D strlen(fdir) + strlen(SUBDIR_COMPRESS) + strlen(=
rn) + 3;/*the filename in .tocompress +2 for 2*"/", +1 for \0 */
+         dst_tocompress =3D malloc(len);
+         MALLOC_ASSERT(dst_tocompress);
+=20
+@@ -328,7 +328,7 @@ int send_one(char *src, FiletransferOptions const *o=
pts, int which)
+         /*move it directly into "tosend" */
+         DLT_LOG(dltsystem, DLT_LOG_DEBUG,
+                 DLT_STRING("dlt-system-filetransfer, Moving file to tmp=
 directory."));
+-        int len =3D strlen(fdir) + strlen(SUBDIR_TOSEND) + strlen(rn) +=
 3;
++        size_t len =3D strlen(fdir) + strlen(SUBDIR_TOSEND) + strlen(rn=
) + 3;
+         dst_tosend =3D malloc(len);/*the resulting filename in .tosend =
+2 for 2*"/", +1 for \0 */
+=20
+         snprintf(dst_tosend, len, "%s/%s/%s", fdir, SUBDIR_TOSEND, rn);
+@@ -379,7 +379,7 @@ int flush_dir_send(FiletransferOptions const *opts, =
const char *compress_dir, co
+             DLT_LOG(dltsystem, DLT_LOG_DEBUG,
+                     DLT_STRING("dlt-system-filetransfer, old compressed=
 file found in send directory:"),
+                     DLT_STRING(dp->d_name));
+-            int len =3D strlen(send_dir) + strlen(dp->d_name) + 2;
++            size_t len =3D strlen(send_dir) + strlen(dp->d_name) + 2;
+             fn =3D malloc(len);
+             MALLOC_ASSERT(fn);
+             snprintf(fn, len, "%s/%s", send_dir, dp->d_name);
+@@ -394,10 +394,10 @@ int flush_dir_send(FiletransferOptions const *opts=
, const char *compress_dir, co
+                 strncpy(tmp, dp->d_name, strlen(dp->d_name) - strlen(CO=
MPRESS_EXTENSION));
+                 tmp[strlen(dp->d_name) - strlen(COMPRESS_EXTENSION)] =3D=
 '\0';
+=20
+-                int len =3D strlen(tmp) + strlen(compress_dir) + 1 + 1;=
/*2 sizes + 1*"/" + \0 */
+-                char *path_uncompressed =3D malloc(len);
++                size_t length =3D strlen(tmp) + strlen(compress_dir) + =
1 + 1;/*2 sizes + 1*"/" + \0 */
++                char *path_uncompressed =3D malloc(length);
+                 MALLOC_ASSERT(path_uncompressed);
+-                snprintf(path_uncompressed, len, "%s/%s", compress_dir,=
 tmp);
++                snprintf(path_uncompressed, length, "%s/%s", compress_d=
ir, tmp);
+=20
+                 struct stat sb;
+=20
+@@ -475,7 +475,7 @@ int flush_dir_compress(FiletransferOptions const *op=
ts, int which, const char *c
+=20
+=20
+             /*compress file into to_send dir */
+-            int len =3D strlen(compress_dir) + strlen(dp->d_name) + 2;
++            size_t len =3D strlen(compress_dir) + strlen(dp->d_name) + =
2;
+             char *cd_filename =3D malloc(len);
+             MALLOC_ASSERT(cd_filename);
+             snprintf(cd_filename, len, "%s/%s", compress_dir, dp->d_nam=
e);
+@@ -526,7 +526,7 @@ int flush_dir_original(FiletransferOptions const *op=
ts, int which)
+=20
+             DLT_LOG(dltsystem, DLT_LOG_DEBUG,
+                     DLT_STRING("dlt-system-filetransfer, old file found=
 in directory."));
+-            int len =3D strlen(sdir) + strlen(dp->d_name) + 2;
++            size_t len =3D strlen(sdir) + strlen(dp->d_name) + 2;
+             char *fn =3D malloc(len);
+             MALLOC_ASSERT(fn);
+             snprintf(fn, len, "%s/%s", sdir, dp->d_name);
+@@ -564,7 +564,7 @@ int flush_dir(FiletransferOptions const *opts, int w=
hich)
+=20
+     char *compress_dir;
+     char *send_dir;
+-    int len =3D strlen(opts->Directory[which]) + strlen(SUBDIR_COMPRESS=
) + 2;
++    size_t len =3D strlen(opts->Directory[which]) + strlen(SUBDIR_COMPR=
ESS) + 2;
+     compress_dir =3D malloc (len);
+     MALLOC_ASSERT(compress_dir);
+     snprintf(compress_dir, len, "%s/%s", opts->Directory[which], SUBDIR=
_COMPRESS);
+@@ -625,7 +625,7 @@ int init_filetransfer_dirs(DltSystemConfiguration *c=
onfig)
+         /*create subdirectories for processing the files */
+=20
+         char *subdirpath;
+-        int len =3D strlen(opts->Directory[i]) + strlen(SUBDIR_COMPRESS=
) + 2;
++        size_t len =3D strlen(opts->Directory[i]) + strlen(SUBDIR_COMPR=
ESS) + 2;
+         subdirpath =3D malloc (len);
+         MALLOC_ASSERT(subdirpath);
+         snprintf(subdirpath, len, "%s/%s", opts->Directory[i], SUBDIR_C=
OMPRESS);
+@@ -699,7 +699,7 @@ int process_files(FiletransferOptions const *opts)
+=20
+     unsigned int i =3D 0;
+=20
+-    while (i < (len - INOTIFY_SZ)) {
++    while (i < ((long unsigned int)len - INOTIFY_SZ)) {
+         struct inotify_event *ie =3D (struct inotify_event *)&buf[i];
+=20
+         if (ie->len > 0) {
+@@ -712,26 +712,29 @@ int process_files(FiletransferOptions const *opts)
+                                 DLT_LOG_DEBUG,
+                                 DLT_STRING("dlt-system-filetransfer, fo=
und new file."),
+                                 DLT_STRING(ie->name));
+-                        int length =3D strlen(opts->Directory[j]) + ie-=
>len + 1;
++                        size_t length =3D strlen(opts->Directory[j]) + =
strlen(ie->name) + 2;
+=20
+                         if (length > PATH_MAX) {
+                             DLT_LOG(filetransferContext,
+                                     DLT_LOG_ERROR,
+                                     DLT_STRING(
+                                         "dlt-system-filetransfer: Very =
long path for file transfer. Cancelling transfer! Length is: "),
+-                                    DLT_INT(length));
++                                    DLT_INT((int)length));
+                             return -1;
+                         }
+=20
+                         char *tosend =3D malloc(length);
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wformat-truncation=3D"
+                         snprintf(tosend, length, "%s/%s", opts->Directo=
ry[j], ie->name);
++#pragma GCC diagnostic pop
+                         send_one(tosend, opts, j);
+                         free(tosend);
+                     }
+             }
+         }
+=20
+-        i +=3D INOTIFY_SZ + ie->len;
++        i +=3D (unsigned int)INOTIFY_SZ + ie->len;
+     }
+=20
+ #endif
+@@ -741,4 +744,4 @@ int process_files(FiletransferOptions const *opts)
+ void filetransfer_fd_handler(DltSystemConfiguration *config)
+ {
+     process_files(&(config->Filetransfer));
+-}
+\ No newline at end of file
++}
+diff --git a/src/system/dlt-system-journal.c b/src/system/dlt-system-jou=
rnal.c
+index 366555b..9a55c3f 100644
+--- a/src/system/dlt-system-journal.c
++++ b/src/system/dlt-system-journal.c
+@@ -393,7 +393,7 @@ void register_journal_fd(sd_journal **j, struct poll=
fd *pollfd, int i,  DltSyste
+             DLT_STRING(strerror(pollfd[i].fd)));
+         j_tmp =3D NULL;
+     }
+-    pollfd[i].events =3D sd_journal_get_events(j_tmp);
++    pollfd[i].events =3D (short)sd_journal_get_events(j_tmp);
+     if(pollfd[i].events < 0) {
+         DLT_LOG(dltsystem, DLT_LOG_ERROR, DLT_STRING("Error while getti=
ng journal events: "),=20
+             DLT_STRING(strerror(pollfd[i].events)));
+diff --git a/src/system/dlt-system-logfile.c b/src/system/dlt-system-log=
file.c
+index 941a3be..d31441c 100644
+--- a/src/system/dlt-system-logfile.c
++++ b/src/system/dlt-system-logfile.c
+@@ -64,7 +64,7 @@ void send_file(LogFileOptions const *fileopt, int n)
+     FILE *pFile;
+     DltContext context =3D logfileContext[n];
+     char buffer[1024];
+-    int bytes;
++    size_t bytes;
+     int seq =3D 1;
+=20
+     pFile =3D fopen((*fileopt).Filename[n], "r");
+@@ -73,7 +73,7 @@ void send_file(LogFileOptions const *fileopt, int n)
+         while (!feof(pFile)) {
+             bytes =3D fread(buffer, 1, sizeof(buffer) - 1, pFile);
+=20
+-            if (bytes >=3D 0)
++            if (bytes =3D=3D (sizeof(buffer) - 1))
+                 buffer[bytes] =3D 0;
+             else
+                 buffer[0] =3D 0;
+diff --git a/src/system/dlt-system-process-handling.c b/src/system/dlt-s=
ystem-process-handling.c
+index 3e092d4..708e9e3 100644
+--- a/src/system/dlt-system-process-handling.c
++++ b/src/system/dlt-system-process-handling.c
+@@ -201,7 +201,7 @@ int register_timer_fd(struct pollfd *pollfd, int fdc=
nt)
+ void timer_fd_handler(int fd, DltSystemConfiguration *config)
+ {
+     uint64_t timersElapsed =3D 0ULL;
+-    int r =3D read(fd, &timersElapsed, 8U);    // only needed to reset =
fd event
++    int r =3D (int)read(fd, &timersElapsed, 8U);    // only needed to r=
eset fd event
+     if (r < 0)=20
+         DLT_LOG(dltsystem, DLT_LOG_ERROR, DLT_STRING("Error while readi=
ng timer fd: "),=20
+             DLT_STRING(strerror(r)));
+diff --git a/src/system/dlt-system-processes.c b/src/system/dlt-system-p=
rocesses.c
+index c35596c..b17b8ee 100644
+--- a/src/system/dlt-system-processes.c
++++ b/src/system/dlt-system-processes.c
+@@ -72,7 +72,7 @@ void send_process(LogProcessOptions const *popts, int =
n)
+     struct dirent *dp;
+     char filename[PATH_MAX];
+     char buffer[1024];
+-    int bytes;
++    size_t bytes;
+     int found =3D 0;
+=20
+     /* go through all process files in directory */
+diff --git a/src/system/dlt-system-syslog.c b/src/system/dlt-system-sysl=
og.c
+index 59e9d3f..d6b1b8a 100644
+--- a/src/system/dlt-system-syslog.c
++++ b/src/system/dlt-system-syslog.c
+@@ -88,7 +88,7 @@ int init_socket(SyslogOptions opts)
+ #ifdef DLT_USE_IPv6
+     syslog_addr.sin6_family =3D AF_INET6;
+     syslog_addr.sin6_addr =3D in6addr_any;
+-    syslog_addr.sin6_port =3D htons(opts.Port);
++    syslog_addr.sin6_port =3D htons((uint16_t)opts.Port);
+ #else
+     syslog_addr.sin_family =3D AF_INET;
+     syslog_addr.sin_addr.s_addr =3D INADDR_ANY;
+@@ -117,7 +117,7 @@ int read_socket(int sock)
+     struct sockaddr_in client_addr;
+     socklen_t addr_len =3D sizeof(struct sockaddr_in);
+=20
+-    int bytes_read =3D recvfrom(sock, recv_data, RECV_BUF_SZ, 0,
++    int bytes_read =3D (int)recvfrom(sock, recv_data, RECV_BUF_SZ, 0,
+                               (struct sockaddr *)&client_addr, &addr_le=
n);
+=20
+     if (bytes_read =3D=3D -1) {
+@@ -157,4 +157,4 @@ int register_syslog_fd(struct pollfd *pollfd, int i,=
 DltSystemConfiguration *con
+ void syslog_fd_handler(int syslogSock)
+ {
+     read_socket(syslogSock);
+-}
+\ No newline at end of file
++}
+diff --git a/src/system/dlt-system-watchdog.c b/src/system/dlt-system-wa=
tchdog.c
+index 7ed1604..6334214 100644
+--- a/src/system/dlt-system-watchdog.c
++++ b/src/system/dlt-system-watchdog.c
+@@ -56,7 +56,7 @@ int calculate_period(struct itimerspec *itval)
+     }
+    =20
+     DLT_LOG(watchdogContext, DLT_LOG_DEBUG, DLT_STRING("watchdogusec: "=
), DLT_STRING(watchdogUSec));
+-    watchdogTimeoutSeconds =3D atoi(watchdogUSec);
++    watchdogTimeoutSeconds =3D (unsigned int)atoi(watchdogUSec);
+=20
+     if (watchdogTimeoutSeconds <=3D 0) {
+         snprintf(str, 512, "systemd watchdog timeout incorrect: %u\n", =
watchdogTimeoutSeconds);
+@@ -78,9 +78,9 @@ int calculate_period(struct itimerspec *itval)
+     sec =3D notifiyPeriodNSec / 1000000;
+     ns =3D (notifiyPeriodNSec - (sec * 1000000)) * 1000;
+     itval->it_interval.tv_sec =3D sec;
+-    itval->it_interval.tv_nsec =3D ns;
++    itval->it_interval.tv_nsec =3D (long int)ns;
+     itval->it_value.tv_sec =3D sec;
+-    itval->it_value.tv_nsec =3D ns;
++    itval->it_value.tv_nsec =3D (long int)ns;
+=20
+     return 0;
+ }
+@@ -114,7 +114,7 @@ void watchdog_fd_handler(int fd)
+ #endif
+ {
+     uint64_t timersElapsed =3D 0ULL;
+-    int r =3D read(fd, &timersElapsed, 8U);    // only needed to reset =
fd event
++    int r =3D (int)read(fd, &timersElapsed, 8U);    // only needed to r=
eset fd event
+     if(r < 0)
+         DLT_LOG(watchdogContext, DLT_LOG_ERROR, DLT_STRING("Could not r=
eset systemd watchdog. Exit with: "),=20
+             DLT_STRING(strerror(r)));
+diff --git a/systemd/3rdparty/sd-daemon.c b/systemd/3rdparty/sd-daemon.c
+index de3f985..9fde8cc 100644
+--- a/systemd/3rdparty/sd-daemon.c
++++ b/systemd/3rdparty/sd-daemon.c
+@@ -46,6 +46,7 @@
+ #include <stdio.h>
+ #include <stddef.h>
+ #include <limits.h>
++#include <stdint.h>
+=20
+ #if defined(__linux__)
+ #include <mqueue.h>
+@@ -456,12 +457,12 @@ _sd_export_ int sd_notify(int unset_environment, c=
onst char *state) {
+                 sockaddr.un.sun_path[0] =3D 0;
+=20
+         memset(&iovec, 0, sizeof(iovec));
+-        iovec.iov_base =3D (char*) state;
++        iovec.iov_base =3D (void *)(uintptr_t)state;
+         iovec.iov_len =3D strlen(state);
+=20
+         memset(&msghdr, 0, sizeof(msghdr));
+         msghdr.msg_name =3D &sockaddr;
+-        msghdr.msg_namelen =3D offsetof(struct sockaddr_un, sun_path) +=
 strlen(e);
++        msghdr.msg_namelen =3D (socklen_t)(offsetof(struct sockaddr_un,=
 sun_path) + strlen(e));
+=20
+         if (msghdr.msg_namelen > sizeof(struct sockaddr_un))
+                 msghdr.msg_namelen =3D sizeof(struct sockaddr_un);
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-bu=
ild-with-cmake-4.patch b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0=
003-allow-build-with-cmake-4.patch
deleted file mode 100644
index ac5fec5684..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/0003-allow-build-wit=
h-cmake-4.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From ae23f2cccc169874d89903cad24bf36e19bef659 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 18:18:33 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:17 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> =
syntax
-|   to tell CMake that the project requires at least <min> but has been =
updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 to try configuring anyw=
ay.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/75=
5]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt                   | 2 +-
- examples/example1/CMakeLists.txt | 2 +-
- examples/example2/CMakeLists.txt | 2 +-
- examples/example3/CMakeLists.txt | 2 +-
- examples/example4/CMakeLists.txt | 2 +-
- 5 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 94185b8..2a0f619 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -14,7 +14,7 @@
- #######
-=20
- # Set minimum Cmake version and setup policy behavior
--cmake_minimum_required(VERSION 3.3)
-+cmake_minimum_required(VERSION 3.5)
-=20
- if(${CMAKE_VERSION} VERSION_GREATER "3.20" OR ${CMAKE_VERSION} VERSION_=
EQUAL "3.20")
-     cmake_policy(SET CMP0115 OLD)
-diff --git a/examples/example1/CMakeLists.txt b/examples/example1/CMakeL=
ists.txt
-index 60644a1..44cd053 100644
---- a/examples/example1/CMakeLists.txt
-+++ b/examples/example1/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example1 )
-=20
- #
-diff --git a/examples/example2/CMakeLists.txt b/examples/example2/CMakeL=
ists.txt
-index 66a4f24..a8efbcf 100644
---- a/examples/example2/CMakeLists.txt
-+++ b/examples/example2/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example2 )
-=20
- #
-diff --git a/examples/example3/CMakeLists.txt b/examples/example3/CMakeL=
ists.txt
-index 45b7467..4d4958d 100644
---- a/examples/example3/CMakeLists.txt
-+++ b/examples/example3/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example3 )
-=20
- #
-diff --git a/examples/example4/CMakeLists.txt b/examples/example4/CMakeL=
ists.txt
-index 53a4fad..161c333 100644
---- a/examples/example4/CMakeLists.txt
-+++ b/examples/example4/CMakeLists.txt
-@@ -17,7 +17,7 @@
- # DLT example implementation
- #
-=20
--cmake_minimum_required( VERSION 2.6 )
-+cmake_minimum_required( VERSION 3.5 )
- project( automotive-dlt-example4 )
-=20
- #
---=20
-2.43.0
-
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
deleted file mode 100644
index 3699b8c83a..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/544.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/54=
4]
-
-From 8121a979026d5fcb05bd4e5d3a0647f321b56106 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Thu, 28 Sep 2023 12:54:23 +0200
-Subject: [PATCH] Add common dlt_cdh_cpuinfo.c to unblock build on non am=
d64
- and i386 arcs
-
----
- src/core_dump_handler/dlt_cdh.h         |  2 ++
- src/core_dump_handler/dlt_cdh_cpuinfo.c | 33 +++++++++++++++++++++++++
- src/core_dump_handler/dlt_cdh_crashid.c |  2 +-
- 3 files changed, 36 insertions(+), 1 deletion(-)
- create mode 100644 src/core_dump_handler/dlt_cdh_cpuinfo.c
-
-diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt=
_cdh.h
-index d572ecf3..8608c6c4 100644
---- a/src/core_dump_handler/dlt_cdh.h
-+++ b/src/core_dump_handler/dlt_cdh.h
-@@ -55,6 +55,8 @@ typedef struct
-     uint64_t pc;
-     uint64_t ip;
-     uint64_t lr;
-+    uint64_t sp;
-+    uint64_t fp;
-=20
- } cdh_registers_t;
-=20
-diff --git a/src/core_dump_handler/dlt_cdh_cpuinfo.c b/src/core_dump_han=
dler/dlt_cdh_cpuinfo.c
-new file mode 100644
-index 00000000..03509fda
---- /dev/null
-+++ b/src/core_dump_handler/dlt_cdh_cpuinfo.c
-@@ -0,0 +1,33 @@
-+/*
-+ * SPDX license identifier: MPL-2.0
-+ *
-+ * Copyright (C) 2011-2015, BMW AG
-+ *
-+ * This file is part of COVESA Project DLT - Diagnostic Log and Trace.
-+ *
-+ * This Source Code Form is subject to the terms of the
-+ * Mozilla Public License (MPL), v. 2.0.
-+ * If a copy of the MPL was not distributed with this file,
-+ * You can obtain one at http://mozilla.org/MPL/2.0/.
-+ *
-+ * For further information see http://www.covesa.org/.
-+ */
-+
-+/*!
-+ * \author Gianfranco Costamagna <locutusofborg@debian.org>
-+ *
-+ * \copyright Copyright =C2=A9 2011-2015 BMW AG. \n
-+ * License MPL-2.0: Mozilla Public License version 2.0 http://mozilla.o=
rg/MPL/2.0/.
-+ *
-+ * \file dlt_cdh_cpuinfo.c
-+ */
-+
-+#include "dlt_cdh_cpuinfo.h"
-+
-+void get_registers(prstatus_t *prstatus, cdh_registers_t *registers)
-+{
-+/*    struct user_regs_struct *ptr_reg =3D (struct user_regs_struct *)p=
rstatus->pr_reg;
-+
-+    registers->pc =3D ptr_reg->pc;*/ /* [REG_PROC_COUNTER]; */
-+
-+}
-diff --git a/src/core_dump_handler/dlt_cdh_crashid.c b/src/core_dump_han=
dler/dlt_cdh_crashid.c
-index bca44e0e..8dd98d70 100644
---- a/src/core_dump_handler/dlt_cdh_crashid.c
-+++ b/src/core_dump_handler/dlt_cdh_crashid.c
-@@ -30,7 +30,7 @@
- #include <stdio.h>
- #include <string.h>
- #include <errno.h>
--#include <asm/prctl.h>
-+#include <sys/prctl.h>
- #include <inttypes.h>
-=20
- #include "dlt_cdh.h"
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch b/m=
eta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
deleted file mode 100644
index fd36480456..0000000000
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon/567.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Submitted [https://github.com/COVESA/dlt-daemon/pull/56=
7]
-
-From c84e48f6986054cf8b9459e608235b7bd1635746 Mon Sep 17 00:00:00 2001
-From: Gianfranco Costamagna <costamagnagianfranco@yahoo.it>
-Date: Mon, 13 Nov 2023 12:37:23 +0100
-Subject: [PATCH] dlt_cdh:
-
-Make sure on 64 bit we read an ELF64 structure.
-Otherwise we get a read error, and the context file is missing some good
-to know information
----
- src/core_dump_handler/dlt_cdh.h | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/src/core_dump_handler/dlt_cdh.h b/src/core_dump_handler/dlt=
_cdh.h
-index 8608c6c4..3dac480a 100644
---- a/src/core_dump_handler/dlt_cdh.h
-+++ b/src/core_dump_handler/dlt_cdh.h
-@@ -45,10 +45,17 @@
- #define CORE_FILE_PATTERN           "%s/core.%d.%s.%d.gz"
- #define CONTEXT_FILE_PATTERN        "%s/context.%d.%s.%d.txt"
-=20
-+#if ((__SIZEOF_POINTER) =3D=3D 4)
- #define ELF_Ehdr    Elf32_Ehdr
- #define ELF_Phdr    Elf32_Phdr
- #define ELF_Shdr    Elf32_Shdr
- #define ELF_Nhdr    Elf32_Nhdr
-+#else
-+#define ELF_Ehdr    Elf64_Ehdr
-+#define ELF_Phdr    Elf64_Phdr
-+#define ELF_Shdr    Elf64_Shdr
-+#define ELF_Nhdr    Elf64_Nhdr
-+#endif
-=20
- typedef struct
- {
diff --git a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb b/=
meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
rename to meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
index 82edde6c9d..5e80acd67e 100644
--- a/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_2.18.10.bb
+++ b/meta-oe/recipes-extended/dlt-daemon/dlt-daemon_3.0.0.bb
@@ -17,12 +17,13 @@ DEPENDS =3D "zlib gzip-native json-c"
 SRC_URI =3D "git://github.com/COVESA/${BPN}.git;protocol=3Dhttps;branch=3D=
master \
            file://0002-Don-t-execute-processes-as-a-specific-user.patch =
\
            file://0004-Modify-systemd-config-directory.patch \
-           file://544.patch \
-           file://567.patch \
-           file://0001-CMakeLists-txt-make-DLT_WatchdogSec-can-be-set-by=
-user.patch \
-           file://0003-allow-build-with-cmake-4.patch \
+           file://0001-Fix-compile-failure-related-to-gzlog.patch \
+           file://0001-Fix-kinds-of-build-failure.patch \
+           file://0001-Fix-build-failures.patch \
+           file://0001-fix-build-failure-when-systemd-is-enabled.patch \
+           file://0001-Fix-build-failure-with-glibc-2.43.patch \
            "
-SRCREV =3D "0f2d4cfffada6f8448a2cb27995b38eb4271044f"
+SRCREV =3D "f595ea29d1007ca1c3b2d1fd3a88adf7d3db6320"
=20
=20
 PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '=
 systemd systemd-watchdog systemd-journal ', '', d)} \
@@ -71,4 +72,5 @@ FILES:${PN}-doc +=3D "${datadir}/dlt-filetransfer"
=20
 do_install:append() {
     rm -f ${D}${bindir}/dlt-test-*
+    sed -i -e 's:${RECIPE_SYSROOT}::g' ${D}/usr/lib/pkgconfig/automotive=
-dlt.pc
 }
--=20
2.34.1


