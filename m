Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989ECEC01D4
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 11:42:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15351.1774266131073978930
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 04:42:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=myxG4QLN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7542b98c32=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N5kqHH3731459
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=j/wyS5Ox25DgeRpgL3WA
	nBTZvnpaDSxKHFl1v95s7/U=; b=myxG4QLNa/3IpQp464iDhkEFEL7U2sfbfYHU
	Ymm1T/PUCcyrtqrAP0z3kdkDK5+bDeFxPdMEUBzlGBtwsEmy8F2TMji+WooG3HX0
	zdhOoxxW3TeXRyW0JF6R9cz8Ks59iiAjXKeTTRFIBw8votu5SIHhy/xv+t8/dEz/
	G0W7QvBUD70oGJIGdEOD6HsuWWc01eN211c2eACQuRo8Uch6DLODfZpLcVlkK/F0
	es20Pyw2wiveErhCQfr2SfmDkHoADOJF9KronMJEOJ88XupHg30BTttj5bvhEADH
	e5drpUjB154q3Mveqg3gB6sz/WOaxh1qqNHam+cr8Kpk4gxGJQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012003.outbound.protection.outlook.com [52.101.43.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1pky9k2h-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 04:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JpB5WlMofgzAUkZP9VFXbcOIuKJWb+iXZcCD18T2WjehTaCytTj7HEYnMhH5zEQPSYb9nwkEmz0NGFk2nvWczUrLtsIEKjAzBwXdXwTom0NSQQ+PlLFhsnvR8TrMkUQmhyNcewtZkwRS6UwZjD1/W356GDVpSP+9UtLlpQHqRQjL/NAseyDJQQCE9TfYeGoEvGDkyUQxEZc+BwYAwfokZD/xtjR7IA/INpYeniG20acSqjm9c7YYYAld1fweLQktIljonsATsdDZUTrMwm1h2cMEZmXsFM/SGFpHECP/JAxszbmzMooE4lOw8Otl540wN2oLIh67ksEl56ht518QLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/wyS5Ox25DgeRpgL3WAnBTZvnpaDSxKHFl1v95s7/U=;
 b=it12f96rMp0DykWUb/5iuUtDtGDRhJsRDuYDFjRhh2PBbbGsmVrqeUvb2bbYMC9DMrX9jTRUBkVJSY7miH0il40lkGyTPzfRhohMz1QYuOmJfDc5CQxCP+gCPDtU1cuStCaYF89lIPU2vFG6Hjlxf9NilVo48/sKurbVoK4+Eg9h/6ybQyx8DGBPLDE5tIvDFUg+LSHLX5jrmE5NQDlbhb4HPeI43r7XrcDPPB5Ol+drcrhxfeaOhHUB+ILFVRt6IYljUJll5wj9JEeQgY+ysivxkWAHYzeDkjM+zK8tR64qiXCQXe2WAUk5WVhSKCRjCv6TLWHF6RGPX4LAPI22rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CH3PR11MB7763.namprd11.prod.outlook.com (2603:10b6:610:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Mon, 23 Mar
 2026 11:42:03 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 11:42:03 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 00/15] meta-xfce: upgrade core components to 4.21.x and fix cascading build issues
Date: Mon, 23 Mar 2026 19:41:37 +0800
Message-Id: <20260323114152.4178269-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYCP286CA0108.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::14) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CH3PR11MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: d11e78e0-4aa5-42c3-48dc-08de88d133dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	N1Wlw8C+TATWVggJd0pEmW0MW18aV0/ijV3tMJNkPDkXPF74LdnNpKRIQwgdb2cTiRSRTw8kuKHLh9qVF0ePBwbiIqgvfjHi54sfNJUGoPPQ9aHLemLCZv6zsn5e1Ers8MphOY0wPUsyp48LTPD7/UahQ+VC4HBDnQmtHnRupsSM9Ce3d8DVChb3u1eU1xjc3tcgWPdYlZPQ2uEUvXsDI7wiZp3QA626ZIaWu4O8Vm4WiYBR53U0sN/76RLpq/rGsW0S7PCXf4zczNF2JMh4XrgJngc1jUh5J8QRmktGljq/wZv64TGIE3bhYv4kKnImZ3cZxBxS8xI3/50wHGE7OKSH8/zUpoXrkTSuQjaIX6LWT/TuQ3Dz4dtZolYABklEH/eK/vi/Op9G9SiHgbDcCgYYjKRcg4ASdP9xpI9s63it8nzYrZ5zuNQ7sWpFHrEmwgy0TxglLBVk3oqdc6a0zBmSdACDaKN+vk7SNnu5QJMsqJg3yFov+Mf+3SF78+3lqg93wRJjEJ2gfViDGc885KyRByqPxISm+Y0doNia0g/u66XJAs3tovqySaLCcUNdlmk8xSMN75iID/JJmWkiVGQ5N/CIFKBV5wBqYX1SgRmEi+0BxZ8ieArbbXwtrYVm4cmqc51EDTfXX8QOsqHLQCI9jSr0gk78XQwsAphoCo+uwCDJxEQkB6UtYemXECEr8WU766YcqTxOEZUSvyM9Q7M8sHHrQasyiS+4QBAObat36mxOYU9ZuJ42OkJ/1TacyG1oZlLJYIot9LzmnX62vuSQkoCYSeTKkVxZMlh/pE4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aitqQjU5azNjSXpPSWV2a2tEMVpjMTIrY1BoV3VSVVVzKytSRjFCR0puMTdv?=
 =?utf-8?B?MkdYZU4vRUdicmhrb1FUQmtRQjJzK2t4ZG9Sa1JNVHMzS2ZCTDNCMTlIQ2ZN?=
 =?utf-8?B?anJHRzFhOFQyR2NwaWljMXloaVpOaUhJQ3psNmNVT3cvN1pXbkhtR3M0NHVU?=
 =?utf-8?B?ajVjL0preWRsZ2taUlF4WXJlVHNpWjR0dk95WFJyaFlwa01PVFVweHMycHdm?=
 =?utf-8?B?NnBnOUk5d0lPQWd1bjVGdlNuSnVmZlNqVm5uUzFia2hhVVlzZ05qRGw0dWMw?=
 =?utf-8?B?L01XdGJZelVtNDZwVldnbjAyd2t0RmI1Y2s2akRwTllBbW9RWnNTa2pqY21k?=
 =?utf-8?B?RmdGUk5xb25WcTB2NFVCdVFQNWNTZjd5Q1ZoK05VVWhQM3NYR1FoeE0yTkFp?=
 =?utf-8?B?L093dFRSY0k5alZQcUZybnZyL0NXK1JsVU4yMU05bWpRaGw1UzJqaXVqTmor?=
 =?utf-8?B?WG9VM2NTenBZYTJ2QmxhbG93Mk1nYVh4amNXOExGcHZCd2g4bmVwRlZubThE?=
 =?utf-8?B?czRvZUFFamFFUlZneDdKMm9oaTFRS3lqNE5SbHdZWlFPSnp4T2cvRWlGSU9O?=
 =?utf-8?B?RFZwRWVCVkR5VzMzOEl6Z2NsWjRtUy9TVnJNZEpCNkRvT2NZVXBTVlpjbnYv?=
 =?utf-8?B?TUR4eDZPODMydURZTlRlMElBQlFwVHZRa1RvaTZDQmZPKzBRRGoxRWtaWWll?=
 =?utf-8?B?cXAwTjVQV0JsZ3hUcGcvd1pxWEtRbVpYSHZ4SCs0UUZaZnUzWVpNNWJGMVpV?=
 =?utf-8?B?R2tHUlVTa3pod2FqRGFpVENnWkt3Y0lKWmtJT1VWNjllVm1wU1dxVDJhVkM1?=
 =?utf-8?B?OXY4OUZyWEk5QXJsRXlvUms4cVVDL0RtREp2VG5GaFg2WHhoWnlrQU0rNzBB?=
 =?utf-8?B?cXVoSlV6YzJNU001TCtxU0ZOUTFzSVd2SVRKejBRZmUveURMMXB1THFrUFNl?=
 =?utf-8?B?STdoRG1VS3A1bmM5bGtHbklqYndaaE00Qy85cisvYkcyOHdMbEwzckltUVBL?=
 =?utf-8?B?RVRmMG0rM1dYSFNNbDNIRURpSWRPd2s1U2wrd3gvTkEyM3N6VmNSNUVSNzFj?=
 =?utf-8?B?dC9wZk9LWHhmcWVnVDRPbGRRUVNWN1FVdW16S1lXMzUvQ05KYUZVa1dpSVZ3?=
 =?utf-8?B?b3JsV2pKVVJqbjEzcWRLME9DODdUU1ZBU29KV0RDZEtONFVPTjUybzNnYkxR?=
 =?utf-8?B?VWYyeFF3NEJGM3JPNHNnd3RVY1RDeUFzUm9FenYyK3pWWEdWSkxSUHYrTXhx?=
 =?utf-8?B?VHZwNTlYM1FGd1NkMHR2ZHVQU01LdDlrNmxObkhSTTBHSE1aTkJ3MWdYVFNk?=
 =?utf-8?B?VElNTXZ4ZDJReWJYcmluRDVnamhKVHV5akR4b252alBFWEtqRHJrSDZLMlhI?=
 =?utf-8?B?aHhucnJ4c3EyN3kzNEdxWUdkSXdPaXRVbTJTMlVxeE1Hc3lERllzSnRBOHN6?=
 =?utf-8?B?czVaVVlxUU5CT1RsckxJVXpjbWVSQ1pNMHMrSkRUOXdLUlBRWG5qbnBuSU9Z?=
 =?utf-8?B?MDh1ZXl0akUycWxsN3QwKzl3RitXL1BZOWM3dU13M0pmZUhsOVhtVFNhSE5U?=
 =?utf-8?B?WWF6NkFPZ21aZEc0V2hDM2xDRVZ2M085TllSUkMzaXVMSHNWdFNOd08rcVV6?=
 =?utf-8?B?SzRXNUhWdk03VWh2VXJNU0tKeUkrQTRSZmJ1NlRVUkdCOEtoRlI4TW5sNVBJ?=
 =?utf-8?B?dDFoNGNNVzF6ZzBTR3dhcU5KMkE4cWp6MFl6RkRQbER4QmJQRG1vWkl3SVlY?=
 =?utf-8?B?dm9ObnQ4TExiNHhzaFBPN2FGVjdtMlg3L2prbTh1d2ttUHJObXpBUGZDNDdj?=
 =?utf-8?B?K1lyVjV2V1NwWmVjT0NxdHpNZ2REemY5eitZK2hkSU9RMm5DUVlKdXB4TnlN?=
 =?utf-8?B?ckZwVVJKczQrTVBWTlMxZHFCbU5sRVZVVTRGU1NPVG9TYTRRSk43Slp0eE1o?=
 =?utf-8?B?MWJxbzRXZ2pORDZWRXNuREt1dHErbFV4Nnl1MGk2UXIwN1dyWWpXYWVNWTJC?=
 =?utf-8?B?cm5PQzRRYnV2R2pLUHVRWmoyQ243bVVObkRyVjUvKzZFV3diSnJON0V5S3pH?=
 =?utf-8?B?MkI5T01UODFwbTdkcGZVbTl1a2svMVZtelNWdGJJeWZ0czVJa1RZcHdKOFgz?=
 =?utf-8?B?ODhONUtqdmhnOStPVXp5aStvKzhabStJK1kxZG9QdGlIVmYwWGN0K29aUzhh?=
 =?utf-8?B?RExjUjEwd3gwY0dHLzNkcGVBU2RobGF3aXhDSjNDSnhYeU02Mk5FKzhTSXNu?=
 =?utf-8?B?OVRrS01rUFFDa2ZYaCs3NWpJNlpQZmQwa3lSY0hjbGJhWW5lTEN0NVMxR2dQ?=
 =?utf-8?B?c21hVUloMm9JVWs3RllKRHZ6ZStiZC9rcUcyQ3J2dkFSdjBaTXU0Y3hNdEJJ?=
 =?utf-8?Q?HbpnCVy6FQFDEnGc=3D?=
X-Exchange-RoutingPolicyChecked: 
	JkctCKt2yMIq+LT5JzOkSqupR0y+XBm47j2lWHa5fXfabJLY4x3+myRzKhLuQ3FKBKqYr5Lh/yiIaCVd/RYZujXyDVHWKisN9sHq6JieADKZJNFWFUl7plFIIuJ6/3oznwUj+SRh5vGQ02b7R/2wjYYAevZr5d230IBlk7L+ihO19v1/+FFaSB8dEJF+tHajbJcm+r/W6sMa0w/C4YscezQfzyl5c42UXS49wkwOZPCuih5clCcL5tR7l1q2STg12Hpt5cX84EsHYO6ZmL5bUriZP707aNgbRhLZbeGaMJX7om7KAsCSLsRZU+tEeCdNbC1rpune9bn6hazcI1ezbw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11e78e0-4aa5-42c3-48dc-08de88d133dc
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 11:42:03.5082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5Ob7WLVA7KK9/Yyh0jNWfxVv3Oznmysq3YVSBh08/SrEwqs8lWImIOW+vQEKFGxUj0xUY+EpTgfEptkme1deA7519BIPHagTH6SORJIKPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7763
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA5MSBTYWx0ZWRfXxdZgCGakkG1R
 GfqJ1HISVVfsjZzJOW9QmzqHhjclG4KZ/T4yICnIBvlfwFZF5u4pqbms8WaBk5Pi38rTGKoy7X2
 aYpzPODBsAQ8lg2tmXRgz8zav6gO19hRij56t20CmDShM18aTiq2+LA4glSq5QMBalBa1ZWAWqO
 cvlVKBFINCJJyCXFOno0BFY2J9lN2GaqNPZzKdOck6vBDErnOjEeaE/xEtwmGBcqkJxwO04dpCy
 Q0SgRIuXDOEktoiZBe9pbmFYoQ2VvSRGp6OoGCGxO9RBPgqLTvjLw+80iQ2ur80bXHHjYIfxf6E
 QD2Pmp3uhrwS57BTPzQWzN4NUTj52c/55WPHxkERPCYy+1aviqgS8A6N2Tt7d9t+IsjLdGevQR6
 9PnnjOyWpcwLSk4WQOj/lCEPXqQL8tb3csWeaOBmjtNz1+WNSu6v1aKisBxtBp2G4kj656zV+5m
 V5yFrkQOQ4frD5sPjOA==
X-Proofpoint-ORIG-GUID: 4jT_6ufJ-fB1kNk9NU3eJ5JUg6CY2K1N
X-Authority-Analysis: v=2.4 cv=Scr6t/Ru c=1 sm=1 tr=0 ts=69c12712 cx=c_pps
 a=ayBBURk7jZ4GzqZFlR2IhQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=t7CeM3EgAAAA:8 a=H5Xgqx-34dbRE03u-v0A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 4jT_6ufJ-fB1kNk9NU3eJ5JUg6CY2K1N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230091
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 11:42:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125507

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Upgrade meta-xfce core components from 4.20.x to the 4.21.x
development series.

This patch series must be applied as a whole and individual patches
should NOT be cherry-picked independently, because of the following
dependency chain:

libxfce4ui 4.21.x moved libxfce4util-1.0 from Requires to
Requires.private in its pkg-config file, so `pkg-config --libs
libxfce4ui-2` no longer emits -lxfce4util. This causes DSO missing
link errors for autotools consumers that use libxfce4util symbols but
rely on libxfce4ui to pull in the link dependency. As a result, all
downstream components that depend on libxfce4ui must be upgraded
together, and several packages require additional build fixes:

- xfdesktop: switch to meson build system to correctly declare
  libxfce4util dependency and avoid the DSO link issue
- xfwm4: backport patch to add missing libxfce4util build flags
- xfce4-datetime-setter: fix link failure due to missing libxfce4util
  dependency
- xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency
- xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x API changes

Recipe upgrades (patches 01-10):
  libxfce4ui        4.20.2 -> 4.21.7
  garcon            4.20.0 -> 4.21.0
  xfce4-appfinder   4.20.0 -> 4.21.0
  xfce4-power-manager 4.20.0 -> 4.21.1
  xfce4-session     4.20.3 -> 4.21.1
  xfce4-panel       4.20.1 -> 4.21.1
  xfce4-settings    4.20.1 -> 4.21.1
  tumbler           4.20.1 -> 4.21.1
  thunar            4.20.7 -> 4.21.4
  xfconf            4.20.0 -> 4.21.2

Build fixes (patches 11-15):
  xfdesktop, xfce4-datetime-plugin, xfwm4,
  xfce4-datetime-setter, xfce-polkit

Zhang Peng (15):
  libxfce4ui: upgrade 4.20.2 -> 4.21.7
  garcon: upgrade 4.20.0 -> 4.21.0
  xfce4-appfinder: upgrade 4.20.0 -> 4.21.0
  xfce4-power-manager: upgrade 4.20.0 -> 4.21.1
  xfce4-session: upgrade 4.20.3 -> 4.21.1
  xfce4-panel: upgrade 4.20.1 -> 4.21.1
  xfce4-settings: upgrade 4.20.1 -> 4.21.1
  tumbler: upgrade 4.20.1 -> 4.21.1
  thunar: upgrade 4.20.7 -> 4.21.4
  xfconf: upgrade 4.20.0 -> 4.21.2
  xfdesktop: switch to meson build system
  xfce4-datetime-plugin: fix build with xfce4-panel 4.21.x
  xfwm4: backport patch to add missing libxfce4util build flags
  xfce4-datetime-setter: fix link failure due to missing libxfce4util
    dependency
  xfce-polkit: fix link failure by adding missing gtk+-3.0 dependency

 ...d-missing-direct-dependency-on-gtk-3.patch |  52 ++++++++
 .../xfce-polkit/xfce-polkit_0.3.bb            |   7 +-
 ...g-direct-dependencies-to-fix-link-fa.patch |  35 ++++++
 .../xfce4-datetime-setter_3.32.2.bb           |   6 +-
 .../datetime/xfce4-datetime-plugin_0.8.3.bb   |   2 +
 .../{garcon_4.20.0.bb => garcon_4.21.0.bb}    |   8 +-
 ...splay-full-path-in-generated-headers.patch |  36 ++++++
 ...xfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} |  25 ++--
 .../{thunar_4.20.7.bb => thunar_4.21.4.bb}    |  12 +-
 .../{tumbler_4.20.1.bb => tumbler_4.21.1.bb}  |  24 ++--
 ...er_4.20.0.bb => xfce4-appfinder_4.21.0.bb} |   5 +-
 ...splay-full-path-in-generated-headers.patch |  36 ++++++
 ...-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} |   9 +-
 ...splay-full-path-in-generated-headers.patch |  34 ++++++
 ....20.0.bb => xfce4-power-manager_4.21.1.bb} |  13 +-
 ...nfigure.in-hard-code-path-to-iceauth.patch |  43 -------
 ...eson.build-hard-code-path-to-iceauth.patch |  49 ++++++++
 ...sion_4.20.3.bb => xfce4-session_4.21.1.bb} |  12 +-
 ...splay-full-path-in-generated-headers.patch |  36 ++++++
 ...ngs_4.20.1.bb => xfce4-settings_4.21.1.bb} |  17 ++-
 ...gdbus-headers-are-generated-before-i.patch | 114 ++++++++++++++++++
 .../{xfconf_4.20.0.bb => xfconf_4.21.2.bb}    |  12 +-
 .../xfdesktop/xfdesktop_4.20.1.bb             |  12 +-
 ...build-Add-missing-libxfce4util-flags.patch |  57 +++++++++
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.20.0.bb  |   5 +-
 25 files changed, 545 insertions(+), 116 deletions(-)
 create mode 100644 meta-xfce/recipes-apps/xfce-polkit/files/0001-configure.ac-add-missing-direct-dependency-on-gtk-3.patch
 create mode 100644 meta-xfce/recipes-apps/xfce4-datetime-setter/files/0001-build-add-missing-direct-dependencies-to-fix-link-fa.patch
 rename meta-xfce/recipes-xfce/garcon/{garcon_4.20.0.bb => garcon_4.21.0.bb} (68%)
 create mode 100644 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/libxfce4ui/{libxfce4ui_4.20.2.bb => libxfce4ui_4.21.7.bb} (58%)
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.20.7.bb => thunar_4.21.4.bb} (67%)
 rename meta-xfce/recipes-xfce/tumbler/{tumbler_4.20.1.bb => tumbler_4.21.1.bb} (65%)
 rename meta-xfce/recipes-xfce/xfce4-appfinder/{xfce4-appfinder_4.20.0.bb => xfce4-appfinder_4.21.0.bb} (72%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.20.1.bb => xfce4-panel_4.21.1.bb} (85%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_4.20.0.bb => xfce4-power-manager_4.21.1.bb} (77%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-meson.build-hard-code-path-to-iceauth.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.20.3.bb => xfce4-session_4.21.1.bb} (75%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.20.1.bb => xfce4-settings_4.21.1.bb} (67%)
 create mode 100644 meta-xfce/recipes-xfce/xfconf/xfconf/0001-build-Make-sure-gdbus-headers-are-generated-before-i.patch
 rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.20.0.bb => xfconf_4.21.2.bb} (64%)
 create mode 100644 meta-xfce/recipes-xfce/xfwm4/xfwm4/0001-build-Add-missing-libxfce4util-flags.patch

-- 
2.34.1


