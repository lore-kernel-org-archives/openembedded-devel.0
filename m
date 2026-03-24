Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C35B5FC72D2
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 12:59:56 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19067.1774357192038690774
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Mar 2026 05:59:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=JGZeqQ4w;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7543866fef=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3ASKu3548742
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=kcGiMvQzdui1JDhY/7eIvMJu2fIBry1MNwhsbJnxgZk=; b=JGZeqQ4wVxMk
	mp8yyT+vyWFB/glSgNu/Zt7gmEeQ/UJiy3MOZk/50dlkKN5OlYMP/NDOE6cUB3V9
	Meh8zIDVeQn5W/elPmKP92j4JySG8TH2hFE4A93Gt8sv94wHCD48t0utSuWS09Ew
	DO1IvLb9OjJIiW1YCUIXk1yRfvve8OBOAa15JrvHrzBfu5k7KJqS77PxWPdd5veV
	9rpQL1ba9MMbY8dk1xxHL56ZBZnmhGBQOvMewrCEeuWcUMCB7U6fXQ7vSRCI4l8c
	Peg8K8jbLhvoLHQLDCfGgKpzxQN8n27vcnIJ8iQ4zGIgGBvBX5YjDkgQyUmRXyoZ
	20qsKQ3aGw==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011057.outbound.protection.outlook.com [40.93.194.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6ubgy-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZpTRBLGJqaZO+h2mU7Yh6YGSodqYWbFa+GEH6TSZgFLYohyKQ8qEQkkGSMwSDCls16pO37jg5cDVbLeo8H5mA+5bj8rGfFfLT7EImyr/O56xyFE3CisNVQyLVCyxsBbgtLG8F/HJDrAKjR93dpS5u/IwyqK4c59KYnfYo/JONO2b6uj7RH3z9kdY8uOhy2w2Tla90f/kM3SZ8ZztFxH2iljUYj2ZvxS+kTEaoNm3geK8CgzplImgKpNwu/vA+jqZ+Ti4El9Vp4PwxWCJKnPOIP+tBD1zjJcPSkl+k4ClXZFCOestjxJjQkzvnUFbBgJ3qNL/2tHa86KoLtrAjM0K4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kcGiMvQzdui1JDhY/7eIvMJu2fIBry1MNwhsbJnxgZk=;
 b=SdCB1/DBLFKq+vU5hzvHKTWIOka+9YQvAUO8a3RGwnBcnlguodFaTVAEkUJzl0zXE6kyunYihYvl/Ry8Q+YCdEWIItrkRnfKtqch13SfzsVHrowGVHfRQ/GV1zh1oMSqmTy07dt8tfJUSiwpx8FyL9Mk+ik7QlUMBu2rZdeDsJr6e8wu8wXUpR0E7R8zcJC5lD67vfdzWqnzRv3APGWD5FIr4eVrb/9rKjhJFiB4m60wR7w0zr/hrendPovMxIYNp52vFrbB+D5VfjAF4d9pb5+SSXk+x31wR1+BSw2vuE8g8l32f30oeOjp8sO+kPVV/63tijR0Lemiy5oqX1TJfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7297.namprd11.prod.outlook.com (2603:10b6:610:140::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 12:59:48 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Tue, 24 Mar 2026
 12:59:48 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2 05/15] xfce4-session: upgrade 4.20.3 -> 4.21.1
Date: Tue, 24 Mar 2026 20:59:17 +0800
Message-Id: <20260324125927.1070644-6-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
References: <20260324125927.1070644-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR01CA0114.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::18) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7297:EE_
X-MS-Office365-Filtering-Correlation-Id: 184db400-493e-4962-c10a-08de89a53a8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	htlmpnx0hV82QI8ZqOtmRqj1PhAdkyId7fZm0PqTwjcpC1PlPmZzBWmTP2C+EbGZcpmTNL3fueO6rjf3f4pg4faHmAqL+qVB6DiZMvKJRvffCuLk6pUV7Zthz/6/OABzrEC5pldKobOB8H+XzWzPMDCi87AZeATAynBaPfJwLYYMub3/g1tFUHGjHEkGHvUoxFUvfy3qzh42/Edx6zqJ+rtbJQGeJfpCNqwFUNs0kPdrJLTZnrWNyt5UfEjDWINvdCCva2srbv/u6XRKZbzOJkoxBSN+4fT6G57mCp38Y1J7Qlexg78wAhoYIyCrQhouIagVIk/78nxZbLARuggh6n4i2DbW5zYel0yYxTXXPMBwkBIwS/Ll/CqpjljYxNZ80gCmmOutacp4eYKwMTkv7owSohN81ewx7IsdHysfq8TkgGwY/fxX+DAZntln7BDI1ozQj4biYkFUhcGuAhmVOAFPGD7r/Z6HQA2DKPMDgwf/gAxkR8jiMpPG/ZnpBnNh57QfS6cCm8FbCDS7X5PrqC0qFwTVdz0YNXeyX76tItoFRVqETMWXPr0mzAWPGpbD79rUU1MSgI/iDh/FyCw3Dh9gMjGMcmtn50W4Z75CGZk5tWGmpFZVuZu+Rw95Ms5pdBsb0BaPE0Cwn92JpbOitDQy8hVWJ5t2vzvdUgTWE5zKJfCyinScnil5VP3NynNrRW8/laawyBcvI6n2hVMEXmWZRE5GwiJseLrdGH1nGSpXsOKlUDzxxR3FWERROK+P44kH/lrbqpKuoMmGDnPE8gob1rjAc+Yq0ALA5H/ATjY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?czdDNmlpV0dJUXNpcVFGTG5YYkVyOGExanZlWk1adExaN3pBUFBRMmpRVVAz?=
 =?utf-8?B?Qjlhc0JlUVcxOHZNVnA4SzRrOW94OTZRcDgvMzdrelMzSFdmR3kzUzJSK3Na?=
 =?utf-8?B?ZUliVHM5NHNpeEl0NjJFejlRNldadHhrZEhhMGFhaHlOSmZ3RC92RnBwMjV1?=
 =?utf-8?B?aVBYcEhpOHk4UnNZeHk5RFpUcHlQRXl3UmxTTmJ1UC9FZTRWTHgrNzg3ck5Q?=
 =?utf-8?B?cGI2Vm8zaUlZaTJmM3dUYXlWQko0Nm4zUDNRd3JUZlhJREpmdm9DYXl0TmtH?=
 =?utf-8?B?ODJTZDZSSkxQTHNaZjJaZWsveXNqcVA3WU41TnVVdGIzY1VLNUh4MS9ORlZ4?=
 =?utf-8?B?OTJCSTU0aW1nVVJCUHk0QnVTMzlCRXZPRFNHWlVmTFVvOS9lSzV5VUNkdENx?=
 =?utf-8?B?cUM0MGY2R2RIWVJxaXFUWGFyTVhYUVhBeHl6dFRtQzNGdlB2NXBRNDgxbkZs?=
 =?utf-8?B?NXhRejkwN0xUWXpNZjlpV0piejRqYVJ5VkVSVlRnMUhmZ3hudmFhekNwZE9y?=
 =?utf-8?B?MUNBYUhTZnBJVG1VUEpidUx6c1liVFk2L2x1d1BVZ0VVRXhFeXl3UURER0pa?=
 =?utf-8?B?Tk9VLzFFNC92Sm5yVDN3RnV2c0FGekh2V21jV3pkTG0vYms2eUgvLzhSM2Rw?=
 =?utf-8?B?dXBIOGp5V0d5OGRCaGQwMDlNK3ZTWkVuVFp3ZE9nNVVQSnBzZnFsc01CZnFt?=
 =?utf-8?B?RmdUK2plU2RJVXVNQkhUTzFnbjNTVXVZQzJrTSs3M3VsZVdMbU1qYWRvWUI0?=
 =?utf-8?B?eUpxVTJqYjZqY2xPQVA1aXZtMzBRcnJkWXhnQ3c2eXpWSU1Fa0pUOE9KNUwr?=
 =?utf-8?B?WlBjSktrSFRkWnZ1VGhaVGpZc3NabmRiRUZFWVp6NWhkSnpIV2g3OUVJRWZ5?=
 =?utf-8?B?T0QrRlJkMjNFOEVGazJsUWJzb3hyNDFGRmNPeG92dnlqL3NadEtJMFVQVzBy?=
 =?utf-8?B?Wm5HME1STnNxWjRnSlJNbkhUODJOcjN6VWVLeUZZejZNVVg1MHlmUUtmcVZr?=
 =?utf-8?B?TTN0UFBKekxFSVRvdDFick10RkZHZTVHUVVjOEFrTkVvRnFJT294c0hHUDQv?=
 =?utf-8?B?and2ZXp5VzNSTTcxNU5TUi85R2lxSFBhNlRic0lMNlgvY3V0SEg5YUdIbXFL?=
 =?utf-8?B?SzdqeUl0dXNMSTc2eSs2M2Y4WFFKTDRpUmFCV3cwS2E4ZVJKMTZnNFpFcEhl?=
 =?utf-8?B?VXMvRjBoWmgvSFpkQjcrbWFFQlNSV1lQcUtEK1lnM2lOblFYRlIvN2VEM3cy?=
 =?utf-8?B?am4zUERSR2xCNFN1S1F0RHRJcHZZRC8veXR5Z0ZGZFp6NThIbHBaQjdLVkxS?=
 =?utf-8?B?WHpRejEwMUtRUTFKNFVRVEVQRjBVaWNaMHlTYXAwWSs5ay90TFhvaWNJV3JV?=
 =?utf-8?B?L2hLODNCZ0llMkpuQ2U4MHNSV05DUmJGNGs4Wk54YVBWMlJ3ZFk5QktMNGJS?=
 =?utf-8?B?ZnlwS1ZmQThhUHNNcWd5YkJBc2ZSRVFkRE9FRWlLNWhnanBmUGVmYldyMUl6?=
 =?utf-8?B?TjJaVFFXWHhyTXR1RjU1cnpoMFM1bktmdnVUMkhFRDNvQWYrdy9GVDlqVCs1?=
 =?utf-8?B?alRvYjRjRDJkMTBpU2RHd0JTU2cwVzcveUdmbW9kSHZ2WTJMaUlTRFFnek81?=
 =?utf-8?B?bDJwTHNZUlZYV0UvRVFnUHpuaUoxZSs2N3RzcUZyR1JIVTNBYk04ZmZwWStZ?=
 =?utf-8?B?THpWZEFtYjlDRFBFYUdicEpBZElEVGVSMllTQU1UeGsvUG9UR2FqVlErMlY0?=
 =?utf-8?B?dWZKT2tBaEU1RHNVSXJKQURoekdKTEcwTDV0TVVaWlFGd0dlR0V3MC9SYThw?=
 =?utf-8?B?WEVzYXlhaUpKeU1JVDk2WkIxRExwOHN3c2xkZVA2RHVQYzcyQnFXVDZGNHRW?=
 =?utf-8?B?QWNXcW15ckgzdW1pRnNTRmdkeUczaDJnVDRYVElkRm9aNWJFVEJDQUg0ZzJ3?=
 =?utf-8?B?TEIzb0drbXorVGtJdzh4azZyRFZKSHp5YnRFbVN2ODBOS1VwdTNlYkdHTFdB?=
 =?utf-8?B?V0F4cEFmTTI2eXFsa1FXUXArNzhXYmwvVWVJOGptUHdOK202VVB0Zk1WMkg0?=
 =?utf-8?B?dmwyVWF1azBtK1dxVjdtbkt6UXdBeGhPcHZBZ3pQM0ZDazF1YldBdStSdlN0?=
 =?utf-8?B?VWtWRC91cVFzcEQrVStvM3lJN3UwNnR3WG85N2ZuWlRoQVc1Tk03WHVaNW15?=
 =?utf-8?B?T01VQmpSOFNOd2hpL0dCREhCd1BzZXVIajZmSmlyRHlYTnoyaXllSjBRVGE3?=
 =?utf-8?B?V2tYMENMRWNvQkxndGpyTW1JWGRUWlRQN1JiVldQdnVNTXdFWUE5Yk43bksy?=
 =?utf-8?B?ay9WSHRRK3l4K2VHcWdXWEhkaHBSNkV3a056eG10QnJrTkpXbmVCWlFOSFNC?=
 =?utf-8?Q?wUrPYGkR/I9zkkfY=3D?=
X-Exchange-RoutingPolicyChecked: 
	LWpUIWse+shA5Y/RW/gcNxth+usy3aIuGO+rUc9Hy6fu/WVk9c2Z2en7Wdtu2iiJIUlsbEXE6EKbjstAukbqfSojHqIBIKyKRGXzfLnI1+L3YryzOmu2Bv31mX3L2AN11OkKFgg/59qhSaIPZX4IU++73sFE2P91EiW8nK2+q7DnEtbzZhZscZAU8XtR9QzNf5VdOQHoWbGAx4p/PLmnzxWeCuVV9o2Ij2bCrf/ZWJbfi8WotUHixh/RHNyo1GNKOeGEVz6htHLd26Tzl5Sr2yC5DBbFTTwy67I7wsDTZTPHaBTSZqX78sVdf+U/k90jjBDTdwEt5xJh1veAptKMvQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 184db400-493e-4962-c10a-08de89a53a8b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:59:47.9958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q6/0eMo31UeEZfs9feNaZ7q0/obFNYwGMBpaEG3Nf8+VnPv9K4NcVARCWTht/8iIlTyVeev/XWg0gVrcKA+t/rPy4gDofPcFLnqSVS85bGs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7297
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwMyBTYWx0ZWRfX9bDFPxdYa7TV
 nxeNwRnPQFT6INNwp2rf4sFYAWB4gmihFmpe6XFu3FBvXBxPhlUrWZL4yhReRh0SyJhMZaBu8x/
 CEz4VH7BTjBUCaLo/1y6LMOfhQogtE1wkrJe5gdulT4jVp5qixzpJVce1gMXmxQ4/tkYeNDabwp
 43WEj4xhtxC+885aULLMfIvAeHysxrjiLaerxAgi3K90LLY231xMjbfDK+kEdsMWl02Z4xx+j5X
 CUhTaUnOvvI5n8oM5wx98ac7Ml2R+PkmTgNgQ/yBbx6mbAtoqZ5MATz/SqFNjBkT7rVtMTu3xFT
 5CdSsS2pgxWwArmng6Uo9V58m5IVOsnHLKd3v4B+f/BCXS8JEUP49wWIcjcNx4omZmDwBaRrmoN
 Pzc5/iVWMpruf98FLU+hS+GcAMbnlgsYaYCxLsZF1mhL3+t4xzmKvznzLmZGox22pKb/n6wBMqL
 TnEIPqpUbHV993RuD4g==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c28ac7 cx=c_pps
 a=vEsArsaSdKs0mJrCYyxDvw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=O24Aq5uEAAAA:8 a=t7CeM3EgAAAA:8 a=mK_AVkanAAAA:8 a=f8LJXPsAXp_22yhX5GYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=3gWm3jAn84ENXaBijsEo:22
X-Proofpoint-ORIG-GUID: VIVF2JeKcobsqbJuqMZEur_gbXXBbeaB
X-Proofpoint-GUID: VIVF2JeKcobsqbJuqMZEur_gbXXBbeaB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240103
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 62O3ASKu3548742
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Mar 2026 12:59:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125564

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.21.1
https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.21.0
https://gitlab.xfce.org/xfce/xfce4-session/-/tags/xfce4-session-4.20.4

Refresh patch to algined with meson build.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...nfigure.in-hard-code-path-to-iceauth.patch | 43 ----------------
 ...eson.build-hard-code-path-to-iceauth.patch | 49 +++++++++++++++++++
 ...sion_4.20.3.bb =3D> xfce4-session_4.21.1.bb} | 12 ++---
 3 files changed, 55 insertions(+), 49 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/00=
01-configure.in-hard-code-path-to-iceauth.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/00=
01-meson.build-hard-code-path-to-iceauth.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.20.3.bb =3D=
> xfce4-session_4.21.1.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-conf=
igure.in-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-s=
ession/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
deleted file mode 100644
index 0e20143f10..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.i=
n-hard-code-path-to-iceauth.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From a629b051f4e5462150c77b95574bbc7a33bc9666 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@googlem=
ail.com>
-Date: Mon, 31 Dec 2012 16:35:29 +0100
-Subject: [PATCH] configure.ac: hard code path to iceauth
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-workaround AC_PATH_PROG which was meant to find programs required at bui=
ld-time
-not at run-time.
-
-Upstream-Status: Inappropriate [config]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
-
-Rebase for xfce4-session 4.20.0.
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
- configure.ac | 8 +-------
- 1 file changed, 1 insertion(+), 7 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 81b362f..ccde685 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -136,13 +136,7 @@ if test x"$ENABLE_X11" =3D x"yes"; then
-   AC_CHECK_FUNCS([_IceTransNoListen])
-   LIBS=3D"$ac_LIBS"
-=20
--  dnl Check for iceauth
--  AC_PATH_PROG([ICEAUTH], [iceauth])
--  if test x"$ICEAUTH" !=3D x""; then
--    AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$ICEAUTH"], [path to iceauth])
--  else
--    AC_MSG_ERROR([iceauth missing, please check your X11 installation])
--  fi
-+  AC_DEFINE_UNQUOTED([ICEAUTH_CMD], ["$bindir/iceauth"], [path to iceau=
th])
-=20
-   dnl Find a location for the session desktop file
-   AC_MSG_CHECKING([what xsession-prefix to use])
---=20
-1.7.4.4
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meso=
n.build-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-se=
ssion/xfce4-session/0001-meson.build-hard-code-path-to-iceauth.patch
new file mode 100644
index 0000000000..0a34f8f039
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build=
-hard-code-path-to-iceauth.patch
@@ -0,0 +1,49 @@
+From d3561f125e6e6d6bfea0b41ba1ea02d14eb07244 Mon Sep 17 00:00:00 2001
+From: Zhang Peng <peng.zhang1.cn@windriver.com>
+Date: Tue, 17 Mar 2026 17:14:33 +0800
+Subject: [PATCH] meson.build: hard code path to iceauth
+
+Workaround find_program() which finds the native iceauth during
+cross-compilation instead of the target path.
+
+This is the meson equivalent of the autotools patch that modified
+configure.ac to hard code the iceauth path.
+
+This patch is replace the patch 0001-configure.in-hard-code-path-to-icea=
uth.patch
+
+Upstream-Status: Inappropriate [cross-compile specific]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ meson.build               | 2 +-
+ xfce4-session/meson.build | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7ab81ae5..c54ebafd 100644
+--- a/meson.build
++++ b/meson.build
+@@ -75,7 +75,7 @@ if enable_x11
+     feature_cflags +=3D '-DHAVE__ICETRANSNOLISTEN=3D1'
+   endif
+
+-  iceauth =3D find_program('iceauth', required: true)
++  # iceauth path is hard-coded below for cross-compilation
+
+   xsession_prefix =3D get_option('xsession-prefix')
+   if xsession_prefix =3D=3D ''
+diff --git a/xfce4-session/meson.build b/xfce4-session/meson.build
+index 56a297f9..e36885e4 100644
+--- a/xfce4-session/meson.build
++++ b/xfce4-session/meson.build
+@@ -42,7 +42,7 @@ c_args =3D [
+
+ if enable_x11
+   c_args +=3D [
+-    '-DICEAUTH_CMD=3D"@0@"'.format(iceauth.full_path()),
++    '-DICEAUTH_CMD=3D"' + get_option('prefix') / get_option('bindir') /=
 'iceauth' + '"',
+   ]
+
+   session_sources +=3D [
+--
+2.50.0
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb=
 b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
index af7ab98ae5..61a059f051 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.20.3.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.21.1.bb
@@ -6,18 +6,18 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
=20
 DEPENDS =3D "libwnck3 libsm libxfce4ui libxfce4windowing virtual/libx11"
=20
+XFCE_COMPRESS_TYPE =3D "xz"
+XFCEBASEBUILDCLASS =3D "meson"
+
 inherit xfce update-alternatives features_check
=20
-SRC_URI +=3D "file://0001-configure.in-hard-code-path-to-iceauth.patch"
-SRC_URI[sha256sum] =3D "dbf00672c5316a30b7001fe852e6a5ba9f889afeab8a2475=
45a160d4302f1fa2"
+SRC_URI +=3D "file://0001-meson.build-hard-code-path-to-iceauth.patch"
+SRC_URI[sha256sum] =3D "a8fe873fdb20366a44f1345400bfb29c2ff0cfe89dfefd85=
2e2575464b80567c"
=20
 REQUIRED_DISTRO_FEATURES =3D "x11"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'polkit', d)}=
"
-PACKAGECONFIG[polkit] =3D "--enable-polkit, --disable-polkit, polkit"
-
-EXTRA_OECONF =3D "GDBUS_CODEGEN=3D${STAGING_BINDIR_NATIVE}/gdbus-codegen=
 \
-                GLIB_COMPILE_RESOURCES=3D${STAGING_BINDIR_NATIVE}/glib-c=
ompile-resources"
+PACKAGECONFIG[polkit] =3D "-Dpolkit=3Denabled,-Dpolkit=3Ddisabled,polkit=
"
=20
 ALTERNATIVE:${PN} =3D "x-session-manager"
 ALTERNATIVE_TARGET[x-session-manager] =3D "${bindir}/xfce4-session"
--=20
2.34.1


