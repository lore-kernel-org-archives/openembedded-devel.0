Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7EFC02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 13:45:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49031.1737035115114876043
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 05:45:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3111d49cac=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GD2q3S021049
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 05:45:15 -0800
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt75e1q-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 05:45:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oR8/4DBe0BcSrYVbYEj2QOyjBdZfrBPHWD3OrtwqUrzwIeAyiSLSTnfzm28iKAvwRNlv9rJsLsCBmnPh1gaagm7m7hbWKbRHxHbcLvvtBV3BBt6o5KihRcrf0o05keDaPw4PF+9ocn92sNz5XqnhMMoHxH7As/53QZmgxH6XoaCPs9pVpIUFpu/J2OAjlg1aaIOuECHyUTC9I4LxPgTXWqxB0UFy7sr/no9/YTV1BfiEIezP13y+rHJM7IS1aov1LaiHjjv0Tpyo86v1CUL2Xv/+FGmZMNy0UZHGl7VCR0PRAOt5wai0NnPO7VFcY0aV+LtoLjUkjV8SXD6t1t3EIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dkSrl6++cQBCwkF65TolIb+sYAhhk1otaeN7plFWPg0=;
 b=yq4z9V04Tq8EX30NPLLztCiqhRU4EFwXJjB055/fxs8y6zBZXT4YR5SfE5lhsIUq5dRVaAUGuPWHXHfm6VPiAg42SyLolG2JndpAFHuVcqwkC3yIKIhf4gSAJv/Wzxd6ydV/eJ5hCQt40PNhzoxKmT0u1QOgVtEE4woRnZOiFMzO34t2i/02pIIy0BrXWa8Zmb5SNEbDiGMXENZSgD6W5EjWH9QQe0PAD1Ic/qESpS9gcik9iLmueF4xyrtIjPp4sRkNpMVJh0LVfaEDRBw6dxfyHBJgZF95i+FX2ac/7OaBRYkwQOm7VIMtlcfRLsJpxQODsA0QQl9ztyXHMp24VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DS0PR11MB7444.namprd11.prod.outlook.com (2603:10b6:8:146::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 16 Jan
 2025 13:45:12 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 13:45:12 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/2] opensc: fix CVE-2024-8443
Date: Thu, 16 Jan 2025 21:45:01 +0800
Message-Id: <20250116134501.348974-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250116134501.348974-1-peng.zhang1.cn@windriver.com>
References: <20250116134501.348974-1-peng.zhang1.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: TY2PR06CA0024.apcprd06.prod.outlook.com
 (2603:1096:404:42::36) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DS0PR11MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: e406b434-5c3f-450a-b697-08dd3633ffd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WmhHZ0x6eEZrQ2UvUlJPMXlyMDRGbktXeHFRbm5WdWZvdTBaa3UvSUdrcnBU?=
 =?utf-8?B?U0RFdmpkTGlpOWxsM3haTk1jNHp2Q2F1TklHV2ZhOE1zVG1RY2xQNFBJTXVU?=
 =?utf-8?B?c0J3bzFUNFU5NFdhM0RKZzJIMTIzajdWakVrMVVZRzdJNDlBVTlENFFNMFE3?=
 =?utf-8?B?Vy9hQUFCc2p3WkhUaU4vaWtQanZUMVhvS0hQaHpNRkZ5MFNrRFlOd3Q4VG90?=
 =?utf-8?B?cHJBRU53WVZSTTJLanFteko5VVNPRkEzRmRabGl1eTJEZzNEcGswdlF6OXh5?=
 =?utf-8?B?M3UwSUZyRW1RZncydUFNN0NqSGJ0N2RnNlFiLzY0TGVoQlFJMXhwSmN3elor?=
 =?utf-8?B?azh1NDV5amJzZDVxYXI5MXRvbkZJeklCd0lTTHpHL1RDZVQxMUFjMFlqVUlC?=
 =?utf-8?B?VlFUalV5ZzFoU1dwQUN4SVJ4YVdETHdENVkzdzJqKzNVbUYxRUQ1MVNwTnYv?=
 =?utf-8?B?WndVTEpjRjEwWFk0S0pheWJ3cmYwSHhiZUpqcHcvYUhKbFlLUDh3bTM2TDIy?=
 =?utf-8?B?SHF4SzF0QTFvVVJ3d3VuaUEyd2JzRXI4UTRTVXdWRGxxbGF0eTkzMHFlalh2?=
 =?utf-8?B?L0k4Q3hQN0ZyNlZnV3R6aDQ2WlZIR0w5SW01R1l5S25rSXFvbUxwV2I4SEVm?=
 =?utf-8?B?cXJwSndLdUQwWG1DZ1F1ZUhLTWZ4VVVzWktreCtpREtjOWY4bEZtUjRpQW1m?=
 =?utf-8?B?TGN0NVFRUjJlN2YwNE1INTc5ZU1mQ0pnRVRESE1rVXJNZ2FMRzYwTkoxaVls?=
 =?utf-8?B?QzY2ZFY0aXBsL05IRXN1amlIV3pMdGR6Y0Z1dW9GSUdkV3haOFBLMFg1NlE2?=
 =?utf-8?B?MDl1OUhBNGFJRkFrUk0xcWd0WWNQREJoSStvd0xxN2VjcFdtVHBWdkVGT3NH?=
 =?utf-8?B?M0paRXRQY3lGNmNnbDliTXU3eUovMTRzQUQzWEd1bVAzMms3T3AxWGl3eGZC?=
 =?utf-8?B?RzJTM1ZPWUZ2OUl0WUk2WTNGU1ovT0VsSnRWU2RqYmlsdU12VTYrUktMSjlm?=
 =?utf-8?B?RGtlOTJEU0VwL2NOc2U4Y1l4b2VoYnpEZ1FzM1N2SGY2WTc3Q0liMFJ0QkdU?=
 =?utf-8?B?VDVPaVlxNXE0U0QrWjdaYkd5RXdZRXlrMExxeVpEejNVNlBFYWJmK045S05G?=
 =?utf-8?B?NkVvVDIzV0MwZjBRbzNYNzNteEVBYkl6c0VSM3FFL3RNVmt0WlpYSU95RUhR?=
 =?utf-8?B?a1ZDQmNyQnIwNEM0N2sxaGNMQTI4TGk1K2czblJteXl1c20rVWJpSXMxZVdX?=
 =?utf-8?B?bjJndEVtMlZZUkFqOVBRbGJLdm1vamtyQm5JeVp4emJoWmhZRVN0b0E2Qmdu?=
 =?utf-8?B?Zmp1TEZjelJ4dzBkMk9uaVZSYmhXNUFTOUhpNHVBZFdKaU45ejQ1a0pKakVa?=
 =?utf-8?B?dCtMR2d4UDhNbDdtQjM3OTgxaFZudkpCZkhlZktMZk9xK2t5bmNMUmxmdXVS?=
 =?utf-8?B?OGpmYVhiaE15SDNlR2ZDNWpwOFdHUFdPY2FDOG1KcXBwUFlOKzAvM3ZaN1BE?=
 =?utf-8?B?VUF6TlpwSlFzODEwemI4c2F4eDFtUTE2T0ovb3lsdzl5RzVlVHduS1VlbEUv?=
 =?utf-8?B?a0ZBc2N0alVHcnJWdkNBNXcvejlhQi8xMCtwVnFwYUhZU01MRC9Sb0lSNE1V?=
 =?utf-8?B?Nmg3UmQ5a3JabkdsMXJ2RmIxTVpLS2IyaTZBUTBMeTFrVXFzS2paTG14eFFD?=
 =?utf-8?B?RlpDUThzV09ObHFmWERGYkNaOWY5SzNxbkJ2U1hCTnd1OEdHZnRBcWtHekRQ?=
 =?utf-8?B?aEZnbHl6UmxjRzBZbVE3RStiOGZ2WGhuZ0hhTkhPMlpIMGhkT0tyTVc1dE9Y?=
 =?utf-8?B?ZTNwNjlhYjhISmVoclFNUXFnOUdiUzVVMUo4cTVGN2tESk5yb05wQ0FlODY4?=
 =?utf-8?B?Y2REQUNQS055YjFhb2hWNXJHc1RTOXNxeE4yLzZZS21OYkE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bHhFWGg4bUFPU2dnTXlqZElFTktqQnQ1Ky9EOGQ3anlLNG5NT0d3Y1YrSlpP?=
 =?utf-8?B?MjJ2eHc5SHdSTjVSbStaSTRSSHozU2NWQ2VlN3VjNVRickhneUkydUZLZit3?=
 =?utf-8?B?cWlkOHN3ZXhXbERPTnZlSTkzZVAvU1V3ZmNWdEI4cjFxR3FlNlJTOXhWTWha?=
 =?utf-8?B?OFo1cWdFRHBOVWZYOEplQ2ZzbFpBVHlmdytLenFEUzBJREJ0T3B5bHl3c3d0?=
 =?utf-8?B?cUJPUXZZNjFDUEhxSWdLQ2kxQTNXdFd3RkxYRmRHZGp4LzNpVXRsZzdBWU44?=
 =?utf-8?B?dGJhNTJQNEw3Y1NMNXI5bVFia2JLTjB6bExSMWdZcFQrTSs3Ykp0QTFiTnVQ?=
 =?utf-8?B?WW10ZW44TFdOWVRnWSs3L0JTMHQrMVFxMFM0azBqMU9NdFRsc0J4aktBTFRU?=
 =?utf-8?B?dTVIS0J1dm5HaStVYnFHQmJoT001M0NTaWQrb0J2VWFjU2daNmxpdHQxcEhv?=
 =?utf-8?B?L3dDUW9sREZsbjB5aDA2MzUwNVg2M1h6K1JsZHRaV2lVS3JqTk84N3VXVCts?=
 =?utf-8?B?MC9jTWdtWERZbGR0Z3dqSHZzczlvdW9scVhGOHNlcXd6NnI5b2F4V3RzRnJh?=
 =?utf-8?B?WDJkcW9oNVo3Y1JKQmorMGxqUWtaNHpnR2I4ZlZuaXQzb0lXbFZ1RmJ5azdw?=
 =?utf-8?B?WS9BOHpQQjlrOG8rNmRCNHhaOXQ2VWw4elBFVXZ6UkpXZjRvcVJWTDZsK1VC?=
 =?utf-8?B?RlBqU0ZqSGorM3A5aGxOTnF5cmo2VThNNUxZZi9nbTV3c0lUMTZLQmVSTHNp?=
 =?utf-8?B?SUhNK2pIZGpOMW0vUiswMDlDTVVzcE54YWhkZjNYMnpRempVK0xtM0xYRHpC?=
 =?utf-8?B?c05yUGp1cllnRmNUbkxnaVA5Q3ZxWjhGWUtXRGcxaDU3QStVckFpRjdLeW05?=
 =?utf-8?B?L05ZNFl1T3NkSmxkY1dyQndEYURGc3lXKzcvYlpaeklmVHJscFZxNERMTXY3?=
 =?utf-8?B?cjliM1dIRFNjM3JTcnk1cnpZcldHalVjMThNTmNuTEpWRlRmOUlnODlNUHZD?=
 =?utf-8?B?Q3g5Y2pDOG50QklIbFdxMFBodnZjRnZxMk10Tk1QWXQ4UUo1K2lpaFVOTFJh?=
 =?utf-8?B?dXE3WkpTd2Z5RDRtOEdadzFMcDErUEVtbGpVR0M4dTlOUVp2ZDU1ajdRTGpl?=
 =?utf-8?B?SkFQTXdiQjlxQlJRMTh4WHNteWNHQ0M4SXhyVnJ1K1l2WXY5aVJWSGFXeFZV?=
 =?utf-8?B?bEVuUzdUSFp3ZGlJenBHM1dUMXlnSzFjNWs1SjJ1NEJVQWZzTXV5L0pZUDhM?=
 =?utf-8?B?NW9WdE55RC96RTFkL05pOWtuM0dGdnVUQ1lhdDdLSWNVZCtWcjhxNFR4UWFk?=
 =?utf-8?B?UEhVeTdrN2dvakJ2eWw4Y0tzd3MvVVNac3AxT3RqcWhubTZmREpMZENCOEZs?=
 =?utf-8?B?L1pvNmhmNEd0NFFLai8vN1E2ckZWYS8xWHJPc1pET2ZjaDJ2andxbkU4TlVI?=
 =?utf-8?B?WDAwUklFdjBQZ0xTcWx6MG5Va1lSZ0liQythUmVOOFczcVkrU2x1a3JLajc0?=
 =?utf-8?B?R3l5WTNOTm9SWmlvcVlwenNTZ3NnZktjQ1Exa3h6QzhiUkozYkZUNU9PeVRi?=
 =?utf-8?B?bElyamNHd2VEVVBnUTQzYmdsRnFZWEovYk55NXZJd3pibGcxdVhKUVhVekIw?=
 =?utf-8?B?KzV1cEErWTFneWJDZ2ZmSmtZbjNDZ0ZPZEQ1RkZPVU9VT3BYR1laVHp4c0Rh?=
 =?utf-8?B?MzdCeGwrTHNRdlh5KzRlZHl3N1dsOVhudDJ3SUoyekZTWDhJREVUek1oRjVy?=
 =?utf-8?B?MXlFQmhJY3F4WmhldXVmcTFXNC9QdWNtZys3V0ZydGFORFNpNnVPdUNMT0JT?=
 =?utf-8?B?VVBoM01uQzJVY1lNYTJWTWFRVEV2QzZjbWhiMG90Vm1VQkd0ZkxWUmxtQWcz?=
 =?utf-8?B?TnJDbmVpRXUzaWE1K1dNZm9hT0dqampEMkl2SWhRa0I4VHV2RTdHTVBDK1Yy?=
 =?utf-8?B?c2lxREJ5enZhck9wNlppTFFnOEQ3NE1ueDV1Nm5KN1pBWG5lMnk1Y0FwZUxD?=
 =?utf-8?B?OXRiT09veThNZTFMbkM1RU9pK1dvY2xiZ3BsRVk2RDh3cFhiWjk1ZTl4SVI0?=
 =?utf-8?B?RW1aTnZwWjhoaHY0Z3h4b0NBWGQ0OEI1aUJoTVZpMTdROE8xaTVsWWR2Wjg3?=
 =?utf-8?B?YTc5OGZKUWF1VlVXZHBXRzhqdHg5eW4yR2c4TENySXBLbi8xWm5qWEtTdkwy?=
 =?utf-8?B?eHc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e406b434-5c3f-450a-b697-08dd3633ffd3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 13:45:12.1404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2NRjeunX/39bGClyGkQftpGTXatWOg+776Azxg5YUivAEpgdZyFon+98POftuv0GOQU32fStc0YFAGqvTkoj8iJlN+9384kYxQ1NL7nl1SA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7444
X-Proofpoint-ORIG-GUID: 6ndl-s6Lkhe_wcroQeSDBWbi3-Lquh-m
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=67890d6a cx=c_pps a=+kc2f53xTGsvuL7uaCOpcA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=cm27Pg_UAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=7p7RPr-GalsxoHJJx9wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6ndl-s6Lkhe_wcroQeSDBWbi3-Lquh-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_05,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501160104
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 50GD2q3S021049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 13:45:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114914

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-8443:
The Easy Mega Menu Plugin for WordPress =E2=80=93 ThemeHunk plugin for Wo=
rdPress is vulnerable
to Stored Cross-Site Scripting via the =E2=80=98themehunk_megamenu_bg_ima=
ge' parameter in all
versions up to, and including, 1.1.0 due to insufficient input sanitizati=
on and output
escaping. This makes it possible for authenticated attackers, with subscr=
iber-level
access and above, to inject arbitrary web scripts in pages that will exec=
ute whenever
a user accesses an injected page. Please note that this was partially fix=
ed in 1.1.0
due to the missing authorization protection that was added.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-8433]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/02e847458369c08421fd2d5e9a16a5f2=
72c2de9e]
[https://github.com/OpenSC/OpenSC/commit/b28a3cef416fcfb92fbb9ea7fd3c71df=
52c6c9fc]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-8443-0001.patch     | 60 +++++++++++++++++++
 .../opensc/files/CVE-2024-8443-0002.patch     | 55 +++++++++++++++++
 .../recipes-support/opensc/opensc_0.25.1.bb   |  2 +
 3 files changed, 117 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-8443-00=
01.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-8443-00=
02.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patc=
h b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
new file mode 100644
index 000000000..7d80aba76
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0001.patch
@@ -0,0 +1,60 @@
+From b28a3cef416fcfb92fbb9ea7fd3c71df52c6c9fc Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Mon, 12 Aug 2024 19:02:14 +0200
+Subject: [PATCH] openpgp: Do not accept non-matching key responses
+
+When generating RSA key pair using PKCS#15 init, the driver could accept
+responses relevant to ECC keys, which made further processing in the
+pkcs15-init failing/accessing invalid parts of structures.
+
+Thanks oss-fuzz!
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D71010
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-8443
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/b28a3=
cef416fcfb92fbb9ea7fd3c71df52c6c9fc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-openpgp.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/libopensc/card-openpgp.c b/src/libopensc/card-openpgp.c
+index fad32f0ce..f99ec0db9 100644
+--- a/src/libopensc/card-openpgp.c
++++ b/src/libopensc/card-openpgp.c
+@@ -2877,6 +2877,9 @@ pgp_parse_and_set_pubkey_output(sc_card_t *card, u=
8* data, size_t data_len,
+=20
+ 		/* RSA modulus */
+ 		if (tag =3D=3D 0x0081) {
++			if (key_info->algorithm !=3D SC_OPENPGP_KEYALGO_RSA) {
++				LOG_FUNC_RETURN(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++			}
+ 			if ((BYTES4BITS(key_info->u.rsa.modulus_len) < len)  /* modulus_len =
is in bits */
+ 				|| key_info->u.rsa.modulus =3D=3D NULL) {
+=20
+@@ -2892,6 +2895,9 @@ pgp_parse_and_set_pubkey_output(sc_card_t *card, u=
8* data, size_t data_len,
+ 		}
+ 		/* RSA public exponent */
+ 		else if (tag =3D=3D 0x0082) {
++			if (key_info->algorithm !=3D SC_OPENPGP_KEYALGO_RSA) {
++				LOG_FUNC_RETURN(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++			}
+ 			if ((BYTES4BITS(key_info->u.rsa.exponent_len) < len)  /* exponent_le=
n is in bits */
+ 				|| key_info->u.rsa.exponent =3D=3D NULL) {
+=20
+@@ -2907,6 +2913,10 @@ pgp_parse_and_set_pubkey_output(sc_card_t *card, =
u8* data, size_t data_len,
+ 		}
+ 		/* ECC public key */
+ 		else if (tag =3D=3D 0x0086) {
++			if (key_info->algorithm !=3D SC_OPENPGP_KEYALGO_ECDSA &&
++					key_info->algorithm !=3D SC_OPENPGP_KEYALGO_ECDH) {
++				LOG_FUNC_RETURN(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED);
++			}
+ 			/* set the output data */
+ 			/* len is ecpoint length + format byte
+ 			 * see section 7.2.14 of 3.3.1 specs */
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patc=
h b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
new file mode 100644
index 000000000..30a7e63a7
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-8443-0002.patch
@@ -0,0 +1,55 @@
+From 02e847458369c08421fd2d5e9a16a5f272c2de9e Mon Sep 17 00:00:00 2001
+From: Jakub Jelen <jjelen@redhat.com>
+Date: Thu, 15 Aug 2024 11:13:47 +0200
+Subject: [PATCH] openpgp: Avoid buffer overflow when writing fingerprint
+
+Fix also surrounding code to return error (not just log it)
+when some step fails.
+
+Thanks oss-fuzz
+
+https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=3D70933
+
+Signed-off-by: Jakub Jelen <jjelen@redhat.com>
+
+CVE: CVE-2024-8443
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/02e84=
7458369c08421fd2d5e9a16a5f272c2de9e]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-openpgp.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/src/libopensc/card-openpgp.c b/src/libopensc/card-openpgp.c
+index f99ec0db9..3957440de 100644
+--- a/src/libopensc/card-openpgp.c
++++ b/src/libopensc/card-openpgp.c
+@@ -2756,14 +2756,21 @@ pgp_calculate_and_store_fingerprint(sc_card_t *c=
ard, time_t ctime,
+ 	/* update the blob containing fingerprints (00C5) */
+ 	sc_log(card->ctx, "Updating fingerprint blob 00C5.");
+ 	fpseq_blob =3D pgp_find_blob(card, 0x00C5);
+-	if (fpseq_blob =3D=3D NULL)
+-		LOG_TEST_GOTO_ERR(card->ctx, SC_ERROR_OUT_OF_MEMORY, "Cannot find blo=
b 00C5");
++	if (fpseq_blob =3D=3D NULL) {
++		r =3D SC_ERROR_OUT_OF_MEMORY;
++		LOG_TEST_GOTO_ERR(card->ctx, r, "Cannot find blob 00C5");
++	}
++	if (20 * key_info->key_id > fpseq_blob->len) {
++		r =3D SC_ERROR_OBJECT_NOT_VALID;
++		LOG_TEST_GOTO_ERR(card->ctx, r, "The 00C5 blob is not large enough");
++	}
+=20
+ 	/* save the fingerprints sequence */
+ 	newdata =3D malloc(fpseq_blob->len);
+-	if (newdata =3D=3D NULL)
+-		LOG_TEST_GOTO_ERR(card->ctx, SC_ERROR_OUT_OF_MEMORY,
+-			"Not enough memory to update fingerprint blob 00C5");
++	if (newdata =3D=3D NULL) {
++		r =3D SC_ERROR_OUT_OF_MEMORY;
++		LOG_TEST_GOTO_ERR(card->ctx, r, "Not enough memory to update fingerpr=
int blob 00C5");
++	}
+=20
+ 	memcpy(newdata, fpseq_blob->data, fpseq_blob->len);
+ 	/* move p to the portion holding the fingerprint of the current key */
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb b/meta-oe/re=
cipes-support/opensc/opensc_0.25.1.bb
index 74738247b..e41c457fa 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.25.1.bb
@@ -15,6 +15,8 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcb8aedd3bced=
19bd8026d96a8b6876d7"
 SRCREV =3D "0a4b772d6fdab9bfaaa3123775a48a7cb6c5e7c6"
 SRC_URI =3D "git://github.com/OpenSC/OpenSC;branch=3Dstable-0.25;protoco=
l=3Dhttps \
            file://0001-PR-Fixes-for-uninitialized-memory-issues.patch \
+           file://CVE-2024-8443-0001.patch \
+           file://CVE-2024-8443-0002.patch \
          "
 DEPENDS =3D "virtual/libiconv openssl"
=20
--=20
2.34.1


