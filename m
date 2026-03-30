Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB172FF494D
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 06:32:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45005.1774852324781888879
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Mar 2026 23:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=l8cwbxGV;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8549bf16ac=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U5efub411066
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:32:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=GgHxSBjIYBLhUaEwhyFp
	7inPDEULabAU76mjLwl1UXo=; b=l8cwbxGV9UH1Gn6gwYhw4F+/D9r4s0wVZEau
	NS9frjMXyAK8//NoV1xQuAxK7rhGUkuKJ8A3UfSi2ve3UIf93+2RrB8fvpAI5//1
	VJAoINOnSI4NrgNd8QGTXyhIVcRP+DO0Qd1qiKQfcVgBkzSTOJYju6MxKQ/sd/Qc
	xYX4cVyvZQuDaakHpyig6vcPdAm7GHBFDRvuRJL5grXdVuSmTAWGWknWEmFs3/F/
	5zmCAfvKGMaHxEhjvGX7mf1ecVRRFCD1Tku/t5pEwrwq9RCLOnTa8sxYX4vLzcjO
	4QG/iTpb+xYM8T9GChCtMy2eg9SHKtKhiQjn9xvB6VM/8gtMoQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012018.outbound.protection.outlook.com [52.101.53.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d6egbsbcj-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 29 Mar 2026 23:32:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=db8oYMxlLd4+8minc8gkE1jqOMtLOhNXqnUw5Icm10KAkdR+0JWCP0XO/G+GzE//SUkoKr+7FoIRsNeBBFryFkTy2QCMCHrrK2kW3FbkWIV2naIthCKXxJPOYPa/pktOPF6a3dqI1hUdctEs3gDIWCWG3EJg6iS2IwnKEt9VM0UBsM7hrcwvIsWi7Q/8fHX4vreiv9+5rFYs5+jxxKAlBMqwHhfaGb5gMd1Qw4WWEVFe0Yk+bx451IAyG2jEygMixUYToBXcrRC+PV9znyFtLt2x+OhStwnG/yX09reqDIqwuSCtg6HO2LB+gnGxc6j2TB9QIjQ+K6JkgRdLcs9c1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgHxSBjIYBLhUaEwhyFp7inPDEULabAU76mjLwl1UXo=;
 b=ldcFXV7sgyru8/ZM92Psobi94yyV2/rFklVTW420JBLk3uaMJVlc7jF3ypQp+qBYt2+iBhg688T+dmFibDaXuHZzBSaofnvaTkiJ9vbnHGVZK4kMRE6rDFS/kTO6QzeaY1dYjQHWOGXZiDq6OxP0AyPRBvPQ2GrKtKQoOJzhd/z430AiXNH418TdBEGQe6tYxQoztiA93EgvdKa23ST58HiUtJlFHDGVjjvtyDqZye7GUZmU9quIJLmOXKOJnVBMdH3kRdIoYmG2GHTbo0kF+gYpzT5b+z2T7wW4qf3bGAe+QA2nkS13mYVnfmTlQL8LJZwrCcqyFDQdtr9+eToVnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Mon, 30 Mar
 2026 06:31:59 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9769.014; Mon, 30 Mar 2026
 06:31:59 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/4] yelp: drop soup2 option
Date: Mon, 30 Mar 2026 14:31:42 +0800
Message-Id: <20260330063145.94013-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SL2P216CA0181.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1a::7) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ2PR11MB7501:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a9f0985-0b03-4429-521b-08de8e260bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	qqBU/iYLimLXMOiA6eQxkQj4zpk5YhYuQjHsUf4zAkOFIM7XxLabZEDY2yzMPCPbC1GCu1V99wYX63mnTyFZkmHL6I8/Z5ZWE6Xmu3+KZTrPmnbJ85bTBehN0VD2LbsTyfcweQEQRnpsB8AnvRLRJIJMX+x9FQ+c5/RwLdP94YWnAuKXWs1qakBq7W4ZQMJAM9s7Ya1+Qk2n9r1fPEhJeKLHXqJI77XxmuolyCTKyGK9eHBKuYGneN03PC94YMPhubY9sCbAW0mMoVc7o1xlyZunh4/+zkyxvaa4qpJnqW1Tw9oR7XgBBb8s3B+VFmVVSW/isiWlChrxLutkYCbQ58SmHdn9yoR7Heo+WsJ2BVQRC6ktEb6Dc7CpJiH/s36cQT6PpdaVsodx7sfH4Njn0sb9NgBFOfZ3I1N1wCEGnj7Nfv6hw7kG++3T9egC3idXtmJ2Ar5KQXEW50W0V5mFg27jeSIDQ24iT0UluYwUElajdryA6scuZnUbMf8AYpwRdaf9CLWu66hs8NNVfb6DXOzTdzWiFwD0WY9PDzFomQWshBZ6XOetoBxy7lrDVfB33X0NG3k6Ahs/Ldqurzj1wXnhoz1ojVcjeGRb6Uy8W6EenwhC9goDvOUjD9q6Pugt44cJHkU6PBeFtOzUxGkpdLhAneD2HL+Ogyn4G5N2HpJjte/XQjsSQlOT3FDDEXhdaTzWoSN5qDPFpvUjbVmDzLfJBugm8QePgBVvvAB/KgRa1/BnYrnqAGMew6P6LaPQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGR2dkhSZkNaQlIvWm1HV29DOXRWVWtjTHNIU1k3N2E4cW9UMTdPNVM5OTlp?=
 =?utf-8?B?d0YvS0pSQ2U5ck1ORzdCTnRhTzN4aVN3YmVPMWZrMm5DeHBLL1k1WmVZSWtN?=
 =?utf-8?B?bCs5bFdNbmhnbm94RmJWZks1bDYwVkQ3MVBwelRtSmVPcURFSWNVMUdwTE40?=
 =?utf-8?B?d05PcGh5aXlDQlBLSUtWbVQzL1d3aUtWa2lwenpHaFF6Umg0VGR4enkwSVVn?=
 =?utf-8?B?eDRSaGZhaEZ4MW1ITEtPL2hiODdvZG5NNXRidXgxMUFNZTE1MXF6cVFyTDMr?=
 =?utf-8?B?VnRGVkIrSWdqV0Jra0ZhS1M3bWxUdk1oZk4raUExOVd4WW9zaXhYenRXMU1L?=
 =?utf-8?B?RkFFZjlLQUV5S1Nza3RHanFSK1ZhZm42OWcrL3ZYSThtWUNYL2hOMER1ak5T?=
 =?utf-8?B?Mm1JcEE1VGxvSGVpVDhOUGlyT0R1cUZRVHdIZ2ZmQnExU1QybVFKQlJiR1VV?=
 =?utf-8?B?UU8rT045MUN6czFiMnl6Qk5mRHFaY2hPUUlqejVLU3pRWVYxMSttdnkwYlA4?=
 =?utf-8?B?eGJ3YWs3UGN0NFU5TVQ2c2tjRlAxL05QYVUwaWc2TlROV2FpdDVJbXZMeHpv?=
 =?utf-8?B?QlBWODFxWmRza3g3Y3JlTlZOUS9oTWpYOTNrZlYwaVJXeUxtNlZJZlVJZnRt?=
 =?utf-8?B?OWpQY2pRVS9YVHc5RGVPTmUxOUJGUHFpMFBsUGVJU2o5UnNuakJCNkxPZ25k?=
 =?utf-8?B?OERUeldiejEzZSs1Tnd2RFJFYWhsUVJLY2NNTmVTL0h6K0M2WnVpUVM5T2xG?=
 =?utf-8?B?bHBUd1RobUlrMW9pbktuNytpbFJUa0lHSUFwVnpMdkt3NXc4bzhYbUlvNTZH?=
 =?utf-8?B?azlBeU9LdklkQkdaMXd0UVZzbW5HUzAxRS9Va2VUa2NZckxLQnVZSG4xVGdH?=
 =?utf-8?B?elZNREQyVktsT2hwdWt2dE1Ba2hMODlIK2RJSmQ4M204dUtCdHNyYmJYM2Zw?=
 =?utf-8?B?Q1p5a1FYY0dYNWc5UTlUUGpxdVdEWDYxLzRNMGcvMmJPdld1T0lGdXlxcnVJ?=
 =?utf-8?B?SWdRWlh2cWhZdGx0NXNGUTV6ME84V0tROGZGT2RVM2YvcG10MVk0MHN2MTgw?=
 =?utf-8?B?Snpybi9NZXExcDNzRWQwZy80a01yT0xXWUVBQklSMm9BYS81bjZhMVpIWXRH?=
 =?utf-8?B?MjJKb2R2V200VHZjOHA0K3k5T09pem5CV0twQUpqMmllU2RUaUlMY1ppVlRs?=
 =?utf-8?B?bFZQY0U0VWdxcXdDWFhKMlp6YTFQWFNIdXM3ZVBFVGVacTFNNkt3MWNyYVdP?=
 =?utf-8?B?d3N6MDJ1K0VRdTVGeVlPSkpQZW50VlVsc2pYcHpqQy9TZzNyZnhOSnlhVEww?=
 =?utf-8?B?d0c4YlVKdGYvN0p2VXJsaGNXNTNJWkVFWk44QmFQdlJkTEs3SiswbVR5Ryta?=
 =?utf-8?B?RnZOYXR3UDI3WTlmR2Zndld6aWZyN3gxVU1wL0RwOUlYRHdpK0VGVlE4M3FT?=
 =?utf-8?B?MFJiQ1JqRWRYd0RZSDlTZVNNTmE4R2NVbTBINVhOalQyNG44TGlUWDlub3dL?=
 =?utf-8?B?M1daa1VxQTVsNHkxNUUxWXUraWRBbE01RmhYSW9nSit5dENodUx0S2JiNnNP?=
 =?utf-8?B?dUxlRnZ0Vy9rZ1JGWUxrVHNIVTBKMGRJZUl2dkduK01xWEt1Z0N0dVUzcTNx?=
 =?utf-8?B?WFNzTGsyUldSN3hZZHVjbVBYeEdRbUprZWVVWXpDTU5DZEVQRXpZbjFnbzhl?=
 =?utf-8?B?MytPeTNDTVA5bFdWd1VaYTJNVzNQc205RGh3QlRZcG9DeWxYQlVGNGk0MDRL?=
 =?utf-8?B?cGtxSDNRb0RDSE84Ykw1WncrS09hNTd0bTlOVm9ONHpSWHgwVjRLVnJyRDJF?=
 =?utf-8?B?Y2kvdzlJeXBxK01rZ0VSQ0JVSk56aDJ2NnExTmFwdU56b0cvaGoyVC9UemNw?=
 =?utf-8?B?S05nVitMc3JyUmVQUFVzaG1ncUp5aWlTZGdETmZTL1RIcjVjbitXYnlwN05X?=
 =?utf-8?B?OUlhUmR0K0NvREtTbVpHaUFmcDZkMUUzdkpQaWEyZW1kaGNnYURNTVNsN2o0?=
 =?utf-8?B?emFrR1pLc0k1ejUrUURORTc4Vmhzcno0aHdpbm94LytGSnlJa3RXUDBpQmVY?=
 =?utf-8?B?YW50K3BKeng5NVhIM1RISG03VXJuQU5lRUNOMnByTkRlN2hZNnQ0YmdJQTZu?=
 =?utf-8?B?OElqOGpQd0J4VlZyeFdOdndMTVN6Nzl1U2hzekdGQTA3TUJsdUJ6UlBIRTN0?=
 =?utf-8?B?U3Y1WS8yL3BNalN0Z1hlUDhudnRQMXJibVo1U2R0T1NSaWFkenNaY0tYZTgv?=
 =?utf-8?B?YUZ0MjJFektsYllpRWtNajU2RFlTTTMwUFd5Tk5LL21WVk5hWVMzQ21mZmN1?=
 =?utf-8?B?NWtPeUhiQ3JpYzlDOEoxazFrb1E2QWZJYnV0dm5UbXhhTG9GUDkyaDFzSHFN?=
 =?utf-8?Q?Wteazm2153+lP6po=3D?=
X-Exchange-RoutingPolicyChecked: 
	BuZISHYbQ5CEdILkFpkvlYeHO3MpxkEpta+iARIVJensFJ3w4xmJsdSCGEA3CJSPGw0vr0QivAVyTG7I6yjvHUfn8ffsZPpuExWgs8bMyCrYY9LIBNknBJ1k/KvqaKYCU0HAiKMhni/HFOlEUWhCVF8qfKUmimxQpzS/fE/tPuqs0PXJp05J7kIOFOGPCIE5G4t5iX6dvAFByr2/ZgETL4dGm2dRzy8KKnT98rxYStYHkCtQPjb4KG/Sh34H7SreHtRK763RukXEa/v/PI2btnGIAyy1oMWASnHekMdYdqLi8oeEXKddIQiDdfW67QJEjN6ObTpsQrJAmtYTrRDs7A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a9f0985-0b03-4429-521b-08de8e260bc4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 06:31:59.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpKsFdRCi0ZQHPMuRAwq4Ra/IY+dKlD7QTFu1CwtuSSVQpgNZoGev+KTDLJ9ECwjI4xFGlt56QYmAdA13dDAe5rp4tKxkQ5Z1xaAd/xzdaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0OSBTYWx0ZWRfXzjBqPHrYoU68
 P487U2iIeGDUQ1Xyrg9R+C7ePccYzExMyFsQbGv7/3hKT3NRaGWGcitgSwIBqmKnfZrlpVRQuPi
 2km10aiVvdLQMXHpz5OJPc6UkI6AOZ5uzca7uuZJbXFrMPDRotJmQmYx9Ys5RL/UbrzN+9+pYLu
 /978sjs5PlPIvccuLaiDVgowyaUy+fdTcn19vWeQNhGSQTcgYsQEcQB8eMfLgd72tp7gQhWncbD
 aoeeDaHAKs73S1NQq5pOxjPzTtjPl1v4+YQahY0gdz8/enuIC0DN/zknV2FHe4nmG5HeH+piXCt
 FwV9fWmMlQhUwlQyOJ6uwV6kSgGGeLuyvVlDJY2s1JYQibrxrd+XDG2exBVXr1+JP9qG8j4351Z
 uKiEL23j7h8njhIoAcY7+WO53nYlvjN1zHrP5p4yBXOi/2f94Nx6xZo/KMgPRWgym4yx1jJ1cI1
 OR/yhp6fMR60D70FS4g==
X-Proofpoint-ORIG-GUID: LO8EOkndTVozbN0V-NDEqMf_vfTQ9XDg
X-Proofpoint-GUID: LO8EOkndTVozbN0V-NDEqMf_vfTQ9XDg
X-Authority-Analysis: v=2.4 cv=fvrRpV4f c=1 sm=1 tr=0 ts=69ca18e4 cx=c_pps
 a=eZ5Ua+8tQ3RPWrQJUiaIvA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=GHR8O2WEAAAA:20 a=t7CeM3EgAAAA:8 a=jmkyWzQy7MOhuRdFQhIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300049
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62U5efub411066
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 06:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125831

libsoup-2.4 is deprecated, and other recipes already stop support of
soup2, soup2 and soup3 cannot be used together=EF=BC=8C and the latest ve=
rsion
of yelp also drop option webkit2gtk-4-0

[1] https://gitlab.gnome.org/GNOME/yelp/-/commit/1b0ccdae25d0a788a2b44960=
db7273f2d1dacb4d

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_42.2.bb | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb b/meta-gnome/reci=
pes-gnome/yelp/yelp_42.2.bb
index e1c9324940..4ebb5bb3b3 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_42.2.bb
@@ -23,12 +23,6 @@ DEPENDS +=3D " \
     webkitgtk3 \
     yelp-xsl \
 "
-PACKAGECONFIG_SOUP ?=3D "soup3"
-PACKAGECONFIG ??=3D "${PACKAGECONFIG_SOUP}"
-
-PACKAGECONFIG[soup2] =3D "--with-webkit2gtk-4-0,,"
-PACKAGECONFIG[soup3] =3D ",--with-webkit2gtk-4-0,"
-
=20
 do_configure:prepend() {
     export ITSTOOL=3D${STAGING_BINDIR_NATIVE}/itstool
--=20
2.34.1


