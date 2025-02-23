Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2A74C021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 23:28:02 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.77875.1740353277199408101
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Feb 2025 15:27:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4149a90ddb=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51NNLElb020952
	for <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 15:27:56 -0800
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2177.outbound.protection.outlook.com [104.47.73.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44yar7havd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 15:27:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLUXKX9toZD4xw0N9rBcT9ze8T6gnY7Ovrd1pAg7p85GxpWhneL5YotZ8hbyxMpD9wU1rrp1NLgITAzwh1ttIctrN3wrMaQ9lj5/W5OPnnSZ9WrpDf5Ax+GQSJH+duCRK6KEGgZDfuBMpJUIigrTjLU6kI5QUL5ccGeNaGebkoR+fr7om5S6EWZwDZl9q7PuP9eC5RbTCm3oV/teejR6WWUf4oI6nffj38DxeCwAF5ebAUQTfonO84qV96529bj4edt8gDMbQLCQc9/IIn2vTPeynXD0zNVUzm/feS8Qxc/N2/cBOWFefx+ZuqScDAjJyIHotcrWAPVuqEdylt/nnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0PfzfDxHR8ZEZAd33vMjlFoB14CvTuiedDN0Cm8Od1o=;
 b=AXFIMy1Py9Pn2YHMmD0sMF6nLA7EkQ4vw9eKDCvvI16KVx6HqXSNy/rVzjJ5XyPgTIjKualy+PXSbmkJqrORU9+mlGLOAWPTF5+SHnJmjnGwPonBPikla7mtZfdVo2b1y+79+vBfqSmlD2QOHjvhyp7kVnN+sJTV20ErR+RHKBKjHYNSfV2SSIOZObsDRm2+OGf17t60VhqOaICS4LdyLPpZNJenIqJpY+6iWWNDpqpKahCNgtd9sjHA6Ig/4VlWOZXUeznXHNpjqAEohDD1DyrSG0vfkLMUt8izMKaaa6SuMKm9FAMPhe1KBJHPgPuXgMTw0JbdrcydgVWS0LKfxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA0PR11MB4736.namprd11.prod.outlook.com (2603:10b6:806:9f::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Sun, 23 Feb 2025 23:27:49 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 23:27:48 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] recipes: drop ld-is-gold support
Date: Mon, 24 Feb 2025 07:27:33 +0800
Message-Id: <20250223232733.1166522-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TYCP286CA0132.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b6::15) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA0PR11MB4736:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2d18c2-d144-4ebd-de53-08dd5461af39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?N0hOOHBIckRVZ09JVEJEYWRCaUxDZXMxckhMc0w4dE9nN3BzS2JrcUxjTno0?=
 =?utf-8?B?amFWazRhTWJickVJeUZKeXJvZ2hSNGtNY3FyNkQxTzNiQTRWUXovWk02UUpp?=
 =?utf-8?B?RlVjOVNVQ3hvSjhMMU1FME9ZVTFsRFRIZWtQclQwOWZvNWZCbDFvNVBsNFU1?=
 =?utf-8?B?SzI5WjNvVVdPOHE0YmdFWjM3VnN3d1VhL0t3TEN1VERTZ2JRMVlNTlA3bHJo?=
 =?utf-8?B?Nkt5V0c1eDBuMjdqZFI0L09oVHArSlhBQndJaTRQbHl5UHhvRDJlOXM1cHds?=
 =?utf-8?B?SkpmbFI0dDdyMkt3MU5FYlVWU29ZTkFDTzdtMUR6SmFMeGpHckRsc2hJaE9P?=
 =?utf-8?B?QUdsd0pYTFZVcTZpTjk5TWpTckpSTkdibFZDcGo2Nk5DNyt5RGE2bnAzK0E3?=
 =?utf-8?B?SHkyVE82NDg5TXBjejNGSXU1eFdQNjVDSXNLNS81UkxyQnE2cEdZWVNibEx4?=
 =?utf-8?B?V3pPZy9JaUJ5NnpVRS9WOFVINkFoa3hvZFRjTjBFdkpnczNqRUV1Vi9aNENL?=
 =?utf-8?B?R25wa0hsalU5TlBkT2hpdXYxTVdWMC9lYnZYRzExUHVJdzAxdmc0REUrYUFY?=
 =?utf-8?B?Z1RQS3RUaGJVNlFqTDQrdkE2Wm0va1V1SVNJNmgxRm9IYlRQZmp6M0RPSFRG?=
 =?utf-8?B?UlBJYWNZVlFZTFNGY2cwWUVMWVRmNHJ4QmZDNVNxdnB4OG01NS9JUGRCT3V5?=
 =?utf-8?B?VXc5WCtqMks1U3RUR05wSzM1c1dncGU5YkE0eFc2YUlnSklrZCs1cnlVQzA1?=
 =?utf-8?B?VEVYa3NvSUtXbVpJRDZQMWkyOTc3TGJkYlk1ME9FTjVpbklRVTZxaXBsNzZ6?=
 =?utf-8?B?d29BUlFzNExkK010WGtEZGFDS3p5MDZiYXMybThJeVVwYU1FZWJUa0o2akN2?=
 =?utf-8?B?YUlDM1lRUWxNWW14Q3JlZGFNcXNzMUpvUGd6R0drTS9VSnROL2JUcStJamVI?=
 =?utf-8?B?SDBoN2o2LzF0L2ZDMWExUE14ZTd1d3RRQ0xoZzk5V3VSVEtZb1U0NUZyK094?=
 =?utf-8?B?UTlVV0VhUElXRVk0ajhpMnhOYTdpY2FXd1hTTnRNZFJLYVNITndOOVpVa3Va?=
 =?utf-8?B?emlQK3lEY0piWVlpRkdxVXh3YzJveDlReEcwMXpNcklUUVgyZWhtUUJmM0ZW?=
 =?utf-8?B?NjJMS05ZakJoa3NZV1NSYis3QUprNUZFV1RDZGVaN2JzSG1wSUttdkdGZmpF?=
 =?utf-8?B?VDV4cUNiM3RJRVlBNUFZRDIxT0JPQkQ4OGNyc3VaZTNqd1R0L2F0SFVFeERR?=
 =?utf-8?B?V0NqMFd5RFdoTkIyb01pWCs2QS9rMkY5OWNoeGVCTFBCS2J2ME1XKy9ZZGlo?=
 =?utf-8?B?RzNqQXRnTnVsYlVLcUhVbHFIdCtUejFYUnNtSlc4ZEM0b0pNK1JNYTNqN1pF?=
 =?utf-8?B?c09wbHI2VVRXWUZmZ3I0UzFYMWNRd2RpOUNIL0pTRzNabHhSM01kRU5IZFNv?=
 =?utf-8?B?Y2Q2YUJRT0w0SGlRbXBSeXlLVXVGc0VSQkovSVdIb0xXbjVJQXNySlZTMUh4?=
 =?utf-8?B?U0ZkOXFtbVVrTFMveTArSVZvSjRLbGNwRmVTQVlheFFvVGg2aUZYSk5Na0x2?=
 =?utf-8?B?NUl4QkhzQVAxTWYrMEV1U3hxbUhHZ1U1OUwyNlMvbFZTMk8wSy9NdlVkcElM?=
 =?utf-8?B?bFI0dW9ZSkpEdUZXVGlocnpqQzlKRWxxYjZzK01nSVQ0OU1HVkdNWGZmaUtq?=
 =?utf-8?B?T3pWL3ZqRThhVGcweU9FL1N5Q1loQ3F2aGtWclI5WjVETldXd3hGTVU2ZElh?=
 =?utf-8?B?andOWnNIYWdIRXR1Z2k2TVc5VHpjaGNJSy94YnBicDB1YWJ4MWdqeG9Ldlkw?=
 =?utf-8?B?Vy9ET016YktMQTI0MjFlSGJQOEpRNDFFK0s0aFIrWjBuRFMrZHVoMWJ1dlBs?=
 =?utf-8?B?dVk2OXF0ZlgwM2RTMmRDNnlqUzBaTjZqN0ROR1Q1QkdCZkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SjVvQ3JwSTJWQzhwNmdRN3N5YlEzVWdScUlkTW1zNFdSbFRQbEVyUFpCYkQz?=
 =?utf-8?B?NEgxOXVFcEFFRTZ0TDlKbXpLa0dXRm1ZZkJBcTV6bjJiVDY2YTlkMWxUd2Jy?=
 =?utf-8?B?eWE1Qjd5UU9LTUxoWXI3R0NlS2t1M0EwQUw2R09sWnh4TzdvSUdLRFJFSXJV?=
 =?utf-8?B?NHBiQ04rQkVqOHNaanBldkJGNFBlSFUwR29keTc3dm00SFFoMEhLQ2Z6RmNC?=
 =?utf-8?B?SWtaYzhnaUpmcGt5MUFVeDZuc3NlUnVqV29wQkRUb3RPOFRQekJLUFlqMlZO?=
 =?utf-8?B?N1Y0bW9tdGFpeEs1OGdwQ1BVVDVRL25uN1RHQUdEUzJ0cTRRd3lSKzdFRnJP?=
 =?utf-8?B?WGdZcitrVVJRUEpRbS9BWXE5ZGpxSTVXaDVJN0p6alZnUVB3SkJva1JCUTdz?=
 =?utf-8?B?eTI1MEllaXcySGxFalNNQTN5clBiR3lsMTFVb1B3SUlCL3piY01tS3BYcHNk?=
 =?utf-8?B?VkErVlNqWncvWlJKL2JhdVlQcHpPQmhwdXJSdW9XY0d5V2puRE4xelhLMWda?=
 =?utf-8?B?REJteWtIbDFCRks2L1lpWHNiZlE0SGR0YVkzMFJnalc1aXRRRzBMQVZMN1I3?=
 =?utf-8?B?QVFiOHF6TEJ5TlhzTGJQTFhnaHcyMXBUN0RZRy9WcENpTnh1QmdCSG5zakpD?=
 =?utf-8?B?ZEdlSWh4SW5RcDFxNXdvVE5KRjlvMnJPaWl3ZDQrV09teGVwSGtqWkk2YWc5?=
 =?utf-8?B?UmZpOW40dUVqQkZrT1JRYzRpMCtPL05QVXNBeVZJMlU5Nms3eEZKc2JZNUZV?=
 =?utf-8?B?bmJJY3ZkaFlTUThhcWxjYlkvM0RHWVppUzZQUFlBTEtMSnRiYlJiRzhvZnBG?=
 =?utf-8?B?MEZCc21oNVViZ3A2WEF6bGlvTThXaEgzdHdNOVpoU0NxbTQxcVhGQlRrMkd6?=
 =?utf-8?B?c3NuVWJFM3VEVm8yK3FtbE5Ta0Z6aU1VVnBNVCt6T2lXbEh1U3dGNnZYdnJj?=
 =?utf-8?B?VmpXa0Q4SXVoUWhsZlV4a1Y2UlgrN3JoZWF5bWZ4eldRbDRLOTZKVHNuOUVp?=
 =?utf-8?B?dE53VW5aNlNGYWRwRFg0OVorMERXRTFnMnp1RWxKZHArRGxqczVVaXF3TW1o?=
 =?utf-8?B?VEFReUIwZk41ZTV6NzVxaXQreUZUS0dtajlFTXNjdHRVS05aaWtwcXVHQ1FQ?=
 =?utf-8?B?Qk53VXlEVjk5dEFQZHZqczB1NElQbzFWMEZIUC8vYWk0MC96elZCekRNZUt0?=
 =?utf-8?B?dm5EOEFPSkVBeWUrZHFrdC85QzIvc2FuVDBsZ3ZadGgzbFR4S0JPSGxjeFFp?=
 =?utf-8?B?VisvamZVUFFTMGtWNWVVN0svdnRTZUhLRTllaXNRRGZiWktFMkJiVUFtUFNh?=
 =?utf-8?B?Z242YVVlcE9CSzR0UEhrZE9VNnNMUUhMVDRENXNjeHRKVDZ3ZVZRM0dNcFhN?=
 =?utf-8?B?SC9wdzBBZ3lpS2ZiTUUydWo5M044QzBaanBqc0t5c21nRzVBNi9pUGZmSGFM?=
 =?utf-8?B?KzBwSzNTeG1MRFhNcHJtcG1Hc1RnN1pNN2F5bXdRMjVQWlRBS0dMV25sTTA0?=
 =?utf-8?B?MTVGcS9SbGRDN1R1VWZFWVhwRjd3ck9qdTNycW5mOUNRR0R1MHluWllBV2JN?=
 =?utf-8?B?emQyd3FuaGk4WUQzYlJ2aDN4eXQ2enp4cDRwZ2s1Tll1Nk14aTNjU3FEZHNX?=
 =?utf-8?B?UGJiNFRGK1Y2VGlCMEdmQ3lYMnlwT0dndmozNE9DSjVRMTc4N09IUTluakZZ?=
 =?utf-8?B?RGlXRkhuekt1VmRFNllhSC9IcDkvWmdEV2RYbm0ydTVPVUh0dnp1bHhXeG4v?=
 =?utf-8?B?dlhiN1RKZis4LzRxQ05DTnhYY3d0akZqaC9oc2FWWUtyVGpuUmMrMENjdFl6?=
 =?utf-8?B?STZsQWM0NGhYMEhndTlBOWpVcjFFdml5dkVoWi9NOGlIa1MzTkNTWWtwMG4z?=
 =?utf-8?B?ZGJFQWFrWDFYbThhZWZaS0duNWFmVWNLY25iaWkydWd5STkrSWpzVE5TcUJO?=
 =?utf-8?B?YkVsMDRSS3JJNWI5aUFqbFMxSW5YYXlMbVA5cUwzVHNJTVJ0bWFhR21sK3h6?=
 =?utf-8?B?V3N5WnpCUEM5SXNCbm5IVEluYitmYks1alVvL01jbUl1cVNDaWpiTis5NUhX?=
 =?utf-8?B?cUN0czFna29zcll3SWxBQUhGQlZ2QVpaMjI5SWJWL09UQWtKNXUzZWdFR1Yv?=
 =?utf-8?Q?kkZlp6SAYteuxofxV+S+7eKPk?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2d18c2-d144-4ebd-de53-08dd5461af39
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2025 23:27:48.7810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W5OFNZjID27KxySpYPquBgPThlHMhv2mAzU4u9WA+lQgPWKoEF5TL3EmJOGElkX48lPht1hzTjWyg+I6nRVNQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4736
X-Proofpoint-ORIG-GUID: _niTFctQanjHlxF6sVGscISsnOOrPfn0
X-Authority-Analysis: v=2.4 cv=Be0i0qt2 c=1 sm=1 tr=0 ts=67bbaefc cx=c_pps a=VBfpofCtJTW4YIct4dFqXg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=Q4-j1AaZAAAA:8
 a=NEAV23lmAAAA:8 a=KQ0BKDeZAAAA:8 a=XEQRnViFAAAA:8 a=t7CeM3EgAAAA:8 a=lQOv7NOfAAAA:8 a=20KFwNOVAAAA:8 a=TSbVqHtbAAAA:8 a=ewRTMR6aAAAA:8 a=pGLkceISAAAA:8 a=GNEw3xDRAAAA:8 a=mK_AVkanAAAA:8 a=ZZLz4eozypfJlEYqcDcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=b4Qu2kN0ZaZPrownHp55:22 a=1XHicvQM08eBGpD5cucn:22 a=FdTzh2GWekK77mhwV6Dw:22 a=EbehoVYH_zAensOyf1gC:22 a=NJcUIoPEKLAEIzHnl83t:22 a=uSyq2o5xgbcsdybRuoJL:22 a=Gbt7yw0KH3r5R2uzA50C:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-GUID: _niTFctQanjHlxF6sVGscISsnOOrPfn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-23_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502230185
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 51NNLElb020952
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 23:28:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115549

The gold linker support has been dropped in oe-core[1]. Remove related
special cases and patches in recipes.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3Da4addb9ab=
63011e7c604fc5daff95559e7d214e7

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fuse/files/gold-unversioned-symbol.patch  | 92 -------------------
 .../recipes-support/fuse/fuse_2.9.9.bb        |  1 -
 .../samba/samba_4.19.8.bb                     |  2 +-
 .../recipes-dbs/mongodb/mongodb_git.bb        |  4 -
 .../libhugetlbfs/libhugetlbfs_2.24.bb         |  6 --
 meta-oe/recipes-dbs/mysql/mariadb.inc         |  6 --
 .../konkretcmpi/konkretcmpi_0.9.2.bb          |  2 -
 .../0001-detect-gold-as-GNU-linker-too.patch  | 29 ------
 .../recipes-extended/newt/libnewt_0.52.24.bb  |  1 -
 .../openwsman/openwsman_2.7.2.bb              |  2 -
 .../sblim-sfcb/sblim-sfcb_1.4.9.bb            |  1 -
 .../recipes-graphics/directfb/directfb.inc    |  3 -
 meta-oe/recipes-support/lvm2/lvm2.inc         |  4 -
 .../webkitgtk/webkitgtk3_2.44.3.bb            |  8 +-
 14 files changed, 3 insertions(+), 158 deletions(-)
 delete mode 100644 meta-filesystems/recipes-support/fuse/files/gold-unve=
rsioned-symbol.patch
 delete mode 100644 meta-oe/recipes-extended/newt/files/0001-detect-gold-=
as-GNU-linker-too.patch

diff --git a/meta-filesystems/recipes-support/fuse/files/gold-unversioned=
-symbol.patch b/meta-filesystems/recipes-support/fuse/files/gold-unversio=
ned-symbol.patch
deleted file mode 100644
index d47f692c0e..0000000000
--- a/meta-filesystems/recipes-support/fuse/files/gold-unversioned-symbol=
.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-fuse: Fix linking issues with gold linker
-
-fuse has problems when linking with gold since it uses version
-scripts in a way thats so perticular to bfd ld
-
-/home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_6=
4-linux/usr/libexec/armv5te-angstrom-linux-gnueabi/gcc/arm-angstro
-error: symbol __fuse_exited has undefined version
-| collect2: ld returned 1 exit status
-| make[1]: *** [libfuse.la] Error 1
-| make[1]: *** Waiting for unfinished jobs....
-
-For more details
-
-http://blog.flameeyes.eu/2011/06/01/gold-readiness-obstacle-2-base-versi=
oning
-http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D10861
-http://comments.gmane.org/gmane.comp.file-systems.fuse.devel/9524
-http://www.airs.com/blog/archives/300
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- lib/fuse.c             | 10 +++++-----
- lib/fuse_mt.c          |  2 +-
- lib/fuse_versionscript |  3 +++
- lib/helper.c           |  6 +++---
- 4 files changed, 12 insertions(+), 9 deletions(-)
-
-diff --git a/lib/fuse.c b/lib/fuse.c
-index 067d0dc..6d27711 100644
---- a/lib/fuse.c
-+++ b/lib/fuse.c
-@@ -4873,11 +4873,11 @@ struct fuse *fuse_new_compat1(int fd, int flags,
- 				      11);
- }
-=20
--FUSE_SYMVER(".symver fuse_exited,__fuse_exited@");
--FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@");
--FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@");
--FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_fun=
c@");
--FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@");
-+FUSE_SYMVER(".symver fuse_exited,__fuse_exited@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_process_cmd,__fuse_process_cmd@FUSE_UNVERSION=
ED");
-+FUSE_SYMVER(".symver fuse_read_cmd,__fuse_read_cmd@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_set_getcontext_func,__fuse_set_getcontext_fun=
c@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_new_compat2,fuse_new@FUSE_UNVERSIONED");
- FUSE_SYMVER(".symver fuse_new_compat22,fuse_new@FUSE_2.2");
-=20
- #endif /* __FreeBSD__ || __NetBSD__  */
-diff --git a/lib/fuse_mt.c b/lib/fuse_mt.c
-index f6dbe71..fd5ac23 100644
---- a/lib/fuse_mt.c
-+++ b/lib/fuse_mt.c
-@@ -119,4 +119,4 @@ int fuse_loop_mt(struct fuse *f)
- 	return res;
- }
-=20
--FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@");
-+FUSE_SYMVER(".symver fuse_loop_mt_proc,__fuse_loop_mt@FUSE_UNVERSIONED"=
);
-diff --git a/lib/fuse_versionscript b/lib/fuse_versionscript
-index 8d91887..de16ab2 100644
---- a/lib/fuse_versionscript
-+++ b/lib/fuse_versionscript
-@@ -1,3 +1,6 @@
-+FUSE_UNVERSIONED {
-+};
-+
- FUSE_2.2 {
- 	global:
- 		fuse_destroy;
-diff --git a/lib/helper.c b/lib/helper.c
-index b644012..c5349bf 100644
---- a/lib/helper.c
-+++ b/lib/helper.c
-@@ -436,10 +436,10 @@ int fuse_mount_compat1(const char *mountpoint, con=
st char *args[])
- 	return fuse_mount_compat22(mountpoint, NULL);
- }
-=20
--FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@");
-+FUSE_SYMVER(".symver fuse_setup_compat2,__fuse_setup@FUSE_UNVERSIONED")=
;
- FUSE_SYMVER(".symver fuse_setup_compat22,fuse_setup@FUSE_2.2");
--FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@");
--FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@");
-+FUSE_SYMVER(".symver fuse_teardown,__fuse_teardown@FUSE_UNVERSIONED");
-+FUSE_SYMVER(".symver fuse_main_compat2,fuse_main@FUSE_UNVERSIONED");
- FUSE_SYMVER(".symver fuse_main_real_compat22,fuse_main_real@FUSE_2.2");
-=20
- #endif /* __FreeBSD__ || __NetBSD__ */
---=20
-1.8.1.2
-
diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-f=
ilesystems/recipes-support/fuse/fuse_2.9.9.bb
index fca7d42b39..094ed8c8ad 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -11,7 +11,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=3D4fbd65380cdd255951079008b36=
4516c"
=20
 SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/${BP}/=
${BP}.tar.gz \
-           file://gold-unversioned-symbol.patch \
            file://aarch64.patch \
            file://0001-fuse-fix-the-return-value-of-help-option.patch \
            file://fuse2-0007-util-ulockmgr_server.c-conditionally-define=
-closefro.patch \
diff --git a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb b=
/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
index beff73b1b3..05dca8d9c0 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.19.8.bb
@@ -125,7 +125,7 @@ EXTRA_OECONF +=3D "--enable-fhs \
                  --pythondir=3D${PYTHON_SITEPACKAGES_DIR} \
                 "
=20
-LDFLAGS +=3D "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES'=
, 'ld-is-gold', ' -fuse-ld=3Dbfd ', '', d)}"
+LDFLAGS +=3D "-Wl,-z,relro,-z,now"
=20
 do_configure:append() {
     cd ${S}/pidl/
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongo=
db_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongod=
b_git.bb
index ee5c77a85d..b4864defb7 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb_git.=
bb
@@ -73,10 +73,6 @@ WIREDTIGER ?=3D "off"
 WIREDTIGER:x86-64 =3D "on"
 WIREDTIGER:aarch64 =3D "on"
=20
-# ld.gold: fatal error: build/59f4f0dd/mongo/mongod: Structure needs cle=
aning
-LDFLAGS:append:x86:libc-musl =3D " -fuse-ld=3Dbfd"
-LDFLAGS:remove:toolchain-clang =3D "-fuse-ld=3Dbfd"
-
 EXTRA_OESCONS =3D "PREFIX=3D${prefix} \
                  DESTDIR=3D${D} \
                  MAXLINELENGTH=3D'2097152' \
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb =
b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index d82e03e81f..afed3b4a81 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -50,15 +50,9 @@ LDFLAGS +=3D "-B${S}"
=20
 inherit autotools-brokensep cpan-base
=20
-#The CUSTOM_LDSCRIPTS doesn't work with the gold linker
 do_configure:prepend() {
-    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; th=
en
-        sed -i 's/CUSTOM_LDSCRIPTS =3D yes/CUSTOM_LDSCRIPTS =3D no/'  Ma=
kefile.in
-    fi
-
     ln -sf ld.hugetlbfs ${S}/ld
     ln -sf ld.hugetlbfs ${S}/ld.bfd
-    ln -sf ld.hugetlbfs ${S}/ld.gold
     ln -sf ld.hugetlbfs ${S}/ld.lld
 }
=20
diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
index b620355730..51eaf4a502 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -69,14 +69,8 @@ PACKAGECONFIG[krb5] =3D ", ,krb5"
 PACKAGECONFIG[lz4] =3D ", ,lz4"
 PACKAGECONFIG[openssl] =3D "-DWITH_SSL=3D'system',-DWITH_SSL=3D'bundled'=
,openssl"
=20
-# MariaDB doesn't link properly with gold
-# https://mariadb.atlassian.net/browse/MDEV-5982
-TARGET_CFLAGS +=3D "-fuse-ld=3Dbfd"
 LDFLAGS +=3D " -pthread"
=20
-BUILD_CFLAGS +=3D "-fuse-ld=3Dbfd"
-BUILD_CXXFLAGS +=3D "-fuse-ld=3Dbfd"
-
 LDFLAGS:x86:toolchain-clang =3D "-latomic"
 LDFLAGS:riscv32:toolchain-clang =3D "-latomic"
=20
diff --git a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb b/=
meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
index 6b60d89187..bd3a8f2ff5 100644
--- a/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
+++ b/meta-oe/recipes-extended/konkretcmpi/konkretcmpi_0.9.2.bb
@@ -24,8 +24,6 @@ EXTRA_OECMAKE =3D "-DWITH_PYTHON=3DON \
                  ${@oe.utils.conditional("libdir", "/usr/lib32", "-DLIB_=
SUFFIX=3D32", "", d)} \
                 "
=20
-LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd ', '', d)}"
-
 do_install:append() {
     rm -rf ${D}${datadir}
 }
diff --git a/meta-oe/recipes-extended/newt/files/0001-detect-gold-as-GNU-=
linker-too.patch b/meta-oe/recipes-extended/newt/files/0001-detect-gold-a=
s-GNU-linker-too.patch
deleted file mode 100644
index 090ed5c1c9..0000000000
--- a/meta-oe/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-=
too.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 08ba909500412611953aea0fa2fe0d8fe76b6e24 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Wed, 21 Sep 2016 21:14:40 +0200
-Subject: [PATCH] detect gold as GNU linker too
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 468c718..cd93f30 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,7 +28,7 @@ AC_CHECK_SIZEOF([void *])
- AC_MSG_CHECKING([for GNU ld])
- LD=3D$($CC -print-prog-name=3Dld 2>&5)
-=20
--if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ld") =3D 0; then
-+if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ") =3D 0; then
-   # Not
-   GNU_LD=3D""
-   AC_MSG_RESULT([no])
diff --git a/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb b/meta-oe/r=
ecipes-extended/newt/libnewt_0.52.24.bb
index 1e39a1c5ca..834dddd0b5 100644
--- a/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb
+++ b/meta-oe/recipes-extended/newt/libnewt_0.52.24.bb
@@ -20,7 +20,6 @@ DEPENDS =3D "slang popt python3"
 SRC_URI =3D "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
            file://cross_ar.patch \
            file://Makefile.in-Add-tinfo-library-to-the-linking-librari.p=
atch \
-           file://0001-detect-gold-as-GNU-linker-too.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5ded7e221f85f642521c49b1826c8de19845aa372baf5d63=
0a51774b544fbdbb"
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb b/meta=
-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
index 5437ea13e8..d8dda6d090 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb
@@ -34,8 +34,6 @@ inherit systemd cmake pkgconfig python3native perlnativ=
e
 SYSTEMD_SERVICE:${PN} =3D "openwsmand.service"
 SYSTEMD_AUTO_ENABLE =3D "disable"
=20
-LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, " -fuse-ld=3Dbfd ", '', d)}"
-
 EXTRA_OECMAKE =3D "-DBUILD_BINDINGS=3DNO \
                  -DBUILD_LIBCIM=3DNO \
                  -DBUILD_PERL=3DYES \
diff --git a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb b/me=
ta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
index 083cfcb810..622c5ce07c 100644
--- a/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
+++ b/meta-oe/recipes-extended/sblim-sfcb/sblim-sfcb_1.4.9.bb
@@ -42,7 +42,6 @@ SYSTEMD_PACKAGES =3D "${PN}"
 SYSTEMD_SERVICE:${PN} =3D "sblim-sfcb.service"
 SYSTEMD_AUTO_ENABLE =3D "enable"
=20
-LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, ' -fuse-ld=3Dbfd ', '', d)}"
 LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld',=
 ' -Wl,--allow-shlib-undefined ', '', d)}"
=20
 EXTRA_OECONF =3D '--enable-debug \
diff --git a/meta-oe/recipes-graphics/directfb/directfb.inc b/meta-oe/rec=
ipes-graphics/directfb/directfb.inc
index 59796cc65f..df65478b40 100644
--- a/meta-oe/recipes-graphics/directfb/directfb.inc
+++ b/meta-oe/recipes-graphics/directfb/directfb.inc
@@ -34,9 +34,6 @@ LDFLAGS:append =3D " -lm"
=20
 CXXFLAGS:append:toolchain-clang =3D " -Wno-error=3Ddtor-typedef"
=20
-# Workaround for linking issues seen with armv7a + gold
-LDFLAGS:append:arm =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-g=
old', ' -fuse-ld=3Dbfd ', '', d)}"
-
 BINCONFIG =3D "${bindir}/directfb-config"
=20
 inherit autotools binconfig-disabled pkgconfig
diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-supp=
ort/lvm2/lvm2.inc
index 1f608c29d0..9ff7662a51 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -58,7 +58,3 @@ EXTRA_OECONF =3D "--with-user=3D \
                 --with-thin-repair=3D${sbindir}/thin_repair \
                 --with-thin-restore=3D${sbindir}/thin_restore \
 "
-
-# gold doesn't like multiple dm_bitset_parse_list definitions in libdm/.=
exported_symbols.DM_1_02_138 and libdm/.exported_symbols.DM_1_02_129
-# after it was uncommented in the later in 2.03.12 with https://github.c=
om/lvmteam/lvm2/commit/60eb608d66c2056a78e81f27db3da14139d9faab
-LDFLAGS:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold'=
, " -fuse-ld=3Dbfd", '', d)}"
diff --git a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb b/met=
a-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
index 52bf2eb399..07fa0d06f7 100644
--- a/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
+++ b/meta-oe/recipes-support/webkitgtk/webkitgtk3_2.44.3.bb
@@ -135,12 +135,8 @@ EXTRA_OECMAKE:append:armv7a =3D " -DENABLE_JIT=3D${@=
bb.utils.contains('TUNE_FEATURES
 EXTRA_OECMAKE:append:armv7r =3D " -DENABLE_JIT=3D${@bb.utils.contains('T=
UNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
 EXTRA_OECMAKE:append:armv7ve =3D " -DENABLE_JIT=3D${@bb.utils.contains('=
TUNE_FEATURES', 'callconvention-hard', 'ON', 'OFF', d)}"
=20
-EXTRA_OECMAKE:append:mipsarch =3D " -DUSE_LD_GOLD=3DOFF "
-EXTRA_OECMAKE:append:powerpc =3D " -DUSE_LD_GOLD=3DOFF "
-
-# JIT and gold linker does not work on RISCV
-EXTRA_OECMAKE:append:riscv32 =3D " -DUSE_LD_GOLD=3DOFF -DENABLE_JIT=3DOF=
F"
-EXTRA_OECMAKE:append:riscv64 =3D " -DUSE_LD_GOLD=3DOFF"
+# JIT does not work on RISCV
+EXTRA_OECMAKE:append:riscv32 =3D " -DENABLE_JIT=3DOFF"
=20
 # JIT not supported on MIPS either
 EXTRA_OECMAKE:append:mipsarch =3D " -DENABLE_JIT=3DOFF -DENABLE_C_LOOP=3D=
ON "
--=20
2.25.1


