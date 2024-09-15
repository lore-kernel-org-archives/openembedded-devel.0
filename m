Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9151BC35FEB
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 12:52:25 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.113767.1726404739887335884
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 05:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FCYPos012694
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:19 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n1f98yv3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m4FkAGZgs/6QFs7bZUufLRJ4PahovMqVV7qanJ4RW9930HMY88ZpYRX09DyBaseXA2XSoIEI4qClafsIUZpWibZnYqxu8eanyv1OFhV/pFa0iiDqTFT/bQglI28r/cwkHUbzt+fjV5nwKTMD2Qgq4TOIkLLVjZ54aYys3a+/G+v0Ja5m+BbaVTg3uefI2zme0ce5/VSFRu+hWWLu8qM5KRPrmP6UwKncokuUCsIEigcFrf/UrpHzC64CNWs3mmdpLUg6G7rXeKAIX8PtASlOjbHY11rUzwg8PpdjT78ZB1+AftwpAJROBioA/EmstlVY06NvXHnk1x9lzbplWklm1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dtf4ZL5IEVJGRcWdKJ4E9B7Aqp7GW75y8XK/lVb5jns=;
 b=XsQ0Q6PskDJQZ5LAZMRJtlvVUwbpGn8m4qV6hsRM0mI5A+ScHv7AWgjs1SquToo2vanwOl1F+0l/IY/U7D6YTi7s159AWMqFhdKbfvmeHZG2P//OpbbZCF8ldKx3PKvM7X7JF4iNXMv5ZJ0ej1f4EPh/ly3LE5Izq+hZt5TmDM0lohUmPiqInaicEejZtmArr8DrTSPTr3fpU8mMhb/Qr0wdsTSl1zOx173lepQgvuw9R46+3XHiO+s0hMSgEOTUnLhLI/fB9xzCxU+kiN/iawqFmKXbbU1L44f1h7dWSWZc09PPuAinqDe8NoYvL8d5lJFLvuFu79T4oEZGArlBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 BL3PR11MB6314.namprd11.prod.outlook.com (2603:10b6:208:3b1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 12:52:09 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 12:52:08 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/6] openjpeg: upgrade 2.5.0 -> 2.5.2
Date: Sun, 15 Sep 2024 20:51:49 +0800
Message-Id: <20240915125153.2940806-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240915125153.2940806-1-yi.zhao@windriver.com>
References: <20240915125153.2940806-1-yi.zhao@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|BL3PR11MB6314:EE_
X-MS-Office365-Filtering-Correlation-Id: c61ac927-07f3-4a06-52b1-08dcd58535ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VmdTRmNLdy9nZ0M1Y0p1cXBROW9tNjVLZks2TW05MDNvRkY1dUlLZU1uakVU?=
 =?utf-8?B?OVljRVM1Rk1qMTdrb0YvRkdUQno5dFpMKzJtdmtramxtYXBwTWNOWk41YlF4?=
 =?utf-8?B?TTB2RnBtczRQM21OSEo4WU9HNDNTRlA0amtQQjF3T2pna2RObThVcHFHRXY0?=
 =?utf-8?B?OWVOdUs4bnc1SFFaZXRKYUdyYXo3Q2I5THRXZ3dzT0daWmV0SmxkTyt3Qm4v?=
 =?utf-8?B?d25HTUNrQ1d3M1JGNWJ0TVduL1kwOGppRFJreWhRY251ZldwRUdyckJibjRm?=
 =?utf-8?B?RnE2UmlVcHB0R1lJaytldzJPQ2YyU2Z0aDdTOXoySEtDTGloR2ZnZG5EcE43?=
 =?utf-8?B?Q2N4WE1hdS83a2l0UUZ4QnJBVXZCQnVJMnZXblRVWjlIZ3J0OXp0WVVFVEZF?=
 =?utf-8?B?YU9vNlRFajFXSVIzbkErdG5NMW15U0ZKcXo4Vm45ejFodFArTGczRW0vVDRo?=
 =?utf-8?B?MkRoc2xGTm5SR2Vvc1FCakpSWnpROElsQnEvNnQzU0N0NC9tNERhS2NpbFAz?=
 =?utf-8?B?NjMwNlI0WWVjc0QwZnhWODRyT1p0WnNINnNkUTdNM1JaZ1I4MlVmK1ZqUWhx?=
 =?utf-8?B?VVdqUXdtMDFKOS9mOUVKVEpsZ1p0MjZrZkdRRmoxUEgyWXBncVpsUnFNSCtw?=
 =?utf-8?B?WFRsci9CeDNmNUI1T2xXMEkvdkhaUjVhd2lEZk9kbjhZRWNGRnE2TDdxTTAy?=
 =?utf-8?B?MjZENmRucmR0a2Z3MlUrTlAxazh4SmF3bjVFRHRTbjF1bVVXVEhVMW9WMTlJ?=
 =?utf-8?B?MmJyUjVHU1Q3WTFHOHk4bGdDT0hrZTRsdm5OVXF5ekR2Q3BVV2lubjZSQXdl?=
 =?utf-8?B?cjZEUE9FVjhVMXd2TzdqMHpRNlZHODNuUmFyNXdraGIwR2lZYWw1ckhobFM4?=
 =?utf-8?B?eWx4MHhVazRhUTZldWpYRkV2eUMwWWloZ0lLNUc0SmdURkJEWHdQUU8vbWVG?=
 =?utf-8?B?ZHZoZEQrUHNsMEErUzBoZ0JncEFwL0VUamphZU1JUlpRNTh0d0VEajFEcDRZ?=
 =?utf-8?B?N25GOHlzeWowbml0YnlQaGZOelpnNEJIaG12d0wrRG1VRW9MbkdRZDFXWGJr?=
 =?utf-8?B?Q0l6YkJYTzRPcnFWRTZGWWZER1Q3MHRaWlpQN1ZtUGV1Skl2cHpRQmx3bzVq?=
 =?utf-8?B?WG1zbm5jREV2RVQ4WnlrUWdWRk16ZUJTbU84ZGZqSFIydGM0dTh6eUZIV0NW?=
 =?utf-8?B?bGY4SmJSNkl3TFI5ZEhlNWZSRTR6QW0wb2tnSkdKMkZTckU2VDVyZVhQQjdz?=
 =?utf-8?B?TW93UjhESmUyZmtEK1VuTkM2L21ZUHpZRmdRdEg3YkpFSTdqa1hVTXNaaHlC?=
 =?utf-8?B?cWxwNWFaQzNoS0xkT0h6QTRVVE9nOUtDeWFvZkM4TXE1cVdsb1AxN00yYmF1?=
 =?utf-8?B?dWNreElhVE91bHNucGVvcGcvRVpvOXltKzg5OHA2aXhEYVpPbXdicnhzVGZj?=
 =?utf-8?B?YU1vSXozTXViR3Z4L1pYejA3OStVSnhrOVEwZDhJZ1RKYUpBbkVyOG1wYlJw?=
 =?utf-8?B?Zy9WeUNXWXBIb2VKQVBsbnlCUVdCY3E2ZGNTQmpUczRXQzJvWG15WU83dW44?=
 =?utf-8?B?QzBHV0VHMmVobEx2ek9CU2ZmaFNpN0c4UmZxMGd5TmV0SjNMTEhjbzFORjNs?=
 =?utf-8?B?UFF3U1RNaHdIUXpKQ2V6Tk4rcXorSVJrQ2dkQVFZa0N6S2xURXJaR1FsTlh4?=
 =?utf-8?B?NjkwZVpheEE3TEZRVXNNaEJJMTMzOGpVVU5pT1Mxd2ZSSnVZek5GSSs3SWRo?=
 =?utf-8?B?WjVRSFI3TmZkRGxDV2NWb3JoeUZ4MWpwdVBKTytwM1luU2N4YitOMmE2OTBr?=
 =?utf-8?B?elgvOEtXYVNxWlhyOGJqaGF3aFNSVWIyNTdZVitsZytZam9XWW1NcHdvaTFu?=
 =?utf-8?B?bFRRNUdkQmxRNkZzRlVqY1p1OElPbXY0UGV3MGFRVnp3L0E9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NCt6bTZjb2hINnkyTUlINk5MT01teDlqMUZ3R1RJRzdoWENza3ppSno1WmRZ?=
 =?utf-8?B?REIxMW1BK0gvczR6MVQ4eStVWXVEcWNJVGlsL1ZueUlpeXNZNmU1NDhxMy9T?=
 =?utf-8?B?OVdjK0NJNmd0Z1RxeVh0TGY3Q2lJYzN2bDVQVGNJODBtUVJ5WDBTOCt3SGph?=
 =?utf-8?B?NEtUS0dGWFNObDZSUDgrNGZaZHVKelByZ1JnN1lnMkhzMFJLa0FhREMrMGwx?=
 =?utf-8?B?NmE0YWprV1JNWmhYdGgzcTJqM3JBY3kwakxMZmpaVVF4eGpoenFFR0w5VG5I?=
 =?utf-8?B?eHl0aWR4Q3B1WFMxV0VZLzdjc3FFdEZ2ZGZ6NFBDNDRCWVVXUGwwTUszWmwy?=
 =?utf-8?B?Q1RWYWFxMzZIM3l3QlFGNHUxbmFCWkVteGhLZ3ZvTDl0U3VuTU5iN0Zhb3VF?=
 =?utf-8?B?ZTJ2RENtVUhiOTNuYzI1cXYvbHVEMHZHVEl3YTZjVmx2amVqblVxeVRaa0hQ?=
 =?utf-8?B?RW1OQnhQRVd3cCt2cG1NVCsyQ0M2UGZ2NmZtU3VUTWQweHZ4Y2RtY3ZkSlFs?=
 =?utf-8?B?Q1k3RnRRZDc5dEUrWW0rTk0wL0xCaDdTWGZFdFJubVhGWGtYemFDUlFCdE8w?=
 =?utf-8?B?VnMyc2szeUtCVDJTay9oSU8zcU9iOUVjV1F0V092ZHJWR09SemFwdU5kUGNk?=
 =?utf-8?B?TkJlalYvUzFCb3MvR3ZvOXk3bUpiNmx0N01xN3ZoTTlJVGxHUmlqRlcvZUZD?=
 =?utf-8?B?d3gwLzQybENWZ1RMRm0zODhZdkFVTmxlUDJSRzRWb3JURGttUWRNTzhlNVFE?=
 =?utf-8?B?cFlOSkJOUWJMejdTbGFHL0NUUXhFbHJzSVAwVi8vTlYwQ09pMEVKOEdFaVlm?=
 =?utf-8?B?ek5MTTJrZDRJOWJOa2dZLzFEK2hTTXhyQXJEeTRZeG9QbktQOFJpMXB5Mlhw?=
 =?utf-8?B?NDRsbXBraldtaVVETUpEMlhpTFhsZmZGTkE4WnVDa1Q2UmpseE8wdjd1WG5z?=
 =?utf-8?B?Q3Vwd1BSVEE1eTNNY2VnQWZoRlJIOG1ZZzRIZHdzU3djMFZ2SmlJbHpJd2VR?=
 =?utf-8?B?Q2VDcTVyZm5HaDFYS05OVGZhTVRVaHZtdVFlWWlrTnpqV3VrUFpNUmxwSVFV?=
 =?utf-8?B?TFhEdFNlQTBCVlE5UUtZY1U4VEJtaDdyR0wydlpNaVlsSS9od3lpYjFGeklD?=
 =?utf-8?B?SmVBVGMzQU5iN1A2QWRvNFFLN2FseGpqTTkxQTlvdDdEYUdoZGNQbDN3YWN5?=
 =?utf-8?B?RWtXZHN5K3dRd1BCUzJiT1BZb2t4QkRHQjB2N3owK1BKZ2ZHMG14bHNnMU83?=
 =?utf-8?B?RlhFNjhRZFQrdzAzbi9QUGl5RkJ4VXEwVVZtRlB2Rk5JUC9hU2wzckc1anZ0?=
 =?utf-8?B?QTZpcUJUQnFYZWlBclFUQXk0QkJFNjlBTk5hZGdudkh4TVl2eWZ0VzlLRE9X?=
 =?utf-8?B?ZXloNGhadEVlM25LTU9uWlpJa2JyclgyNkE4Y2k4VDNKSWJWNnFYbVhnTVRM?=
 =?utf-8?B?cnFybXk4bERCUW9zcDR5cE8rZFJGcEh2RUFwSjVlZXNJR28vajd6UGxuRGFN?=
 =?utf-8?B?eUxiTEs0blE1VHc5NFlselU3MGJTcWdrODV5R3pqTG1OLzZEd3FGMkdjaDdj?=
 =?utf-8?B?ZGVUZ21YZGNpa1VienA1clhmV0RBY2NpM2NWTFZGQlhkNkhpRHRHMzFRVmNV?=
 =?utf-8?B?YkYyb0RCZ1VObGxwamp6QUdEOWR2Z08zSTRlSDVPeUtoc3V1WmZuOWNrTlRm?=
 =?utf-8?B?YnpIcmJuZ3dHb0JhYlJVODcxVFozRHNiczNyYSs1eGV2THppbnZvclJUbFJt?=
 =?utf-8?B?Q1k5VXVOS2tFZ1Q5aGlOZ0UyTjZQWFg4dlJvM1BERFZqdUEwNkhkNkJXT0dP?=
 =?utf-8?B?VElFNWVhUzNnRnB3Yjl3R1pWUGZVRnBrZ21NNUhoOCtFL0tCODdTcXRWR1NZ?=
 =?utf-8?B?bjlCVFJDZkMxZk5UQTVULzJiSHVLWnBuUVBubzd6blFZRTJVS3pSbHNXNTBC?=
 =?utf-8?B?RjNiS1BqWDl2akxBZld5ejBiS2o5cEFRTGVEcThadjJqMFZHOVJoL0FMbUhj?=
 =?utf-8?B?U1pXdFZaRzBkMld0UFpwYnd0VkRrZ0hxT2V2TUplOTczMDUxc01IaXEvZkRS?=
 =?utf-8?B?R01FSFdVcnpYUnpGR0Z0NHRmbWJHTW9RTFU4OTNjWmRyZTRCTUpVTUg4aTc2?=
 =?utf-8?Q?jIaFQfNhYUG1ECbxmlicPY8nr?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c61ac927-07f3-4a06-52b1-08dcd58535ab
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 12:52:08.9155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0V8tkhRBfxdCKItWiPQ9x/gQw/VyklXr47QK9cPnv0ILugsQnc9r4RhVkfG02l1PGaAfJlyWWS/t0rVoxShDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6314
X-Proofpoint-ORIG-GUID: m3diCzL3SNC0tTMnsVGcoSBlOwNm-QBl
X-Authority-Analysis: v=2.4 cv=afUzngot c=1 sm=1 tr=0 ts=66e6d883 cx=c_pps a=28bFCgguF5sZfysLuYgbMw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=o7uPnlkYjgG7JocAdXcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: m3diCzL3SNC0tTMnsVGcoSBlOwNm-QBl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_04,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409150098
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 48FCYPos012694
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 12:52:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112295

ChangeLog:
https://github.com/uclouvain/openjpeg/blob/v2.5.2/NEWS.md

* Refresh 0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...sk-cmake-to-export-binaries-they-don-t-make-.patch} | 10 +++++-----
 .../openjpeg/{openjpeg_2.5.0.bb =3D> openjpeg_2.5.2.bb}  |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/openjpeg/openjpeg/{0002-Do-not-ask-cmake=
-to-export-binaries-they-don-t-make-.patch =3D> 0001-Do-not-ask-cmake-to-=
export-binaries-they-don-t-make-.patch} (75%)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.5.0.bb =3D> openjpe=
g_2.5.2.bb} (82%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-c=
make-to-export-binaries-they-don-t-make-.patch b/meta-oe/recipes-graphics=
/openjpeg/openjpeg/0001-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch
similarity index 75%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cm=
ake-to-export-binaries-they-don-t-make-.patch
rename to meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmak=
e-to-export-binaries-they-don-t-make-.patch
index 0ba13cf88..2e25ecc7e 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg/0002-Do-not-ask-cmake-to=
-export-binaries-they-don-t-make-.patch
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-Do-not-ask-cmake-to=
-export-binaries-they-don-t-make-.patch
@@ -1,4 +1,4 @@
-From 4681de07e21f17aa28710d3a51fabe7da60463f9 Mon Sep 17 00:00:00 2001
+From 805ce4d40c5aaae12aa73452ff07babe8eb43a62 Mon Sep 17 00:00:00 2001
 From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
 Date: Fri, 28 Sep 2018 00:38:50 +0200
 Subject: [PATCH] Do not ask cmake to export binaries - they don't make i=
t
@@ -15,17 +15,17 @@ Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gma=
il.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/src/bin/jp2/CMakeLists.txt b/src/bin/jp2/CMakeLists.txt
-index 4324c36d..2c11fe02 100644
+index 26156bcb..9eff04aa 100644
 --- a/src/bin/jp2/CMakeLists.txt
 +++ b/src/bin/jp2/CMakeLists.txt
-@@ -66,7 +66,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
+@@ -64,7 +64,6 @@ foreach(exe opj_decompress opj_compress opj_dump)
    endif()
    # Install exe
    install(TARGETS ${exe}
 -    EXPORT OpenJPEGTargets
-     DESTINATION ${OPENJPEG_INSTALL_BIN_DIR} COMPONENT Applications
+     DESTINATION ${CMAKE_INSTALL_BINDIR} COMPONENT Applications
    )
    if(OPJ_USE_DSYMUTIL)
 --=20
-2.14.4
+2.25.1
=20
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.5.2.bb
similarity index 82%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.2.bb
index f2d74078e..45f1b5ef4 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.2.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc648878b4840d7=
babaade1303e7f108c"
 DEPENDS =3D "libpng tiff lcms zlib"
=20
 SRC_URI =3D "git://github.com/uclouvain/openjpeg.git;branch=3Dmaster;pro=
tocol=3Dhttps \
-           file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch \
+           file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-ma=
ke-.patch \
            "
-SRCREV =3D "a5891555eb49ed7cc26b2901ea680acda136d811"
+SRCREV =3D "39e8c50a2f9bdcf36810ee3d41bcbf1cc78968ae"
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
--=20
2.25.1


