Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F41D18127
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 15:21:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.57872.1728919258944061794
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 08:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001727433e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49E6U3sB031024
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:20:58 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2046.outbound.protection.outlook.com [104.47.70.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 428jvtgxn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kAvpNWD1CERj2y8CHZf7+g3u202FaR4RpXKQ2qqOKV2Awlg3KkssgZi+TzEqeVj+QCPF/0Qqe4L79XUWhWlnQF5wmzbZgqH/Mosbsdga+6C13dvFp7x87UebLbVdapEMeBKVjWGDTu17RUlM5LmUY8bV/7cj0gbIXZjsybolOEqVk0gb36jj97RQPn9aKmodEAVVspls+gapwe9G6jHt7QXzpZw2rpgXFNC8bKDi31aZAaJrtgJBbxVL16Fif6QBBbFEre0EwhfXvC8XvRh87+NtD7uCbkBvhjOQglz5I3AgPpin5mcWJ7nuWM0E+iY4FP8ZkGPf2ra5lYrd4U4lgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oCTTFzigqzjgLh0xATViiNYY/sqFCCBgRiYa0IXbZm8=;
 b=G0+n1Jptg1TFhP6gTGt4BQ34vSRExnq/Y9CtmzxpOneQ+XkcPtGArrtLYKhsuf2unk4vq7n52sFsL1Vndkz+O6mALh6kI5mLxJXHrMb23Zd/EM5eXOx/JdIrWqbI4DxTzJxraZ1tIW+SMIltodfJ9g9T0mcrNwf6VYSs/B6tNXuaHOOakojMi0I5EBCmjaS+6w9x/6PLocg8BaLNoupKIGIaDtkz88yc4JaeXQG/chiKS5eP/wnWaZ6V6Ag83RevDJqC4Gi3vZc0DEXtupuXqktud+5D8jnIuWRPZijYoSkPIIv4p97pPq4dwDlY4HaI5gnwbnZMzxSk4Njy3kkf8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ1PR11MB6225.namprd11.prod.outlook.com (2603:10b6:a03:45c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Mon, 14 Oct
 2024 15:20:53 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 15:20:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] graphviz: upgrade 8.1.0 -> 12.1.2
Date: Mon, 14 Oct 2024 23:20:37 +0800
Message-Id: <20241014152037.561342-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR03CA0116.apcprd03.prod.outlook.com
 (2603:1096:4:91::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ1PR11MB6225:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bdfb912-1830-4872-b9ca-08dcec63caeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UDJYV0F6K1diWllHKzBBaWc5VjB3amRSTWc0cTJwb3lGYm9DamVWOEE5bGlW?=
 =?utf-8?B?NTdxM1I1aDhnc1E0WVp1czJ0NWNzOW5xNXZNUGZoaFNHbUlpNXFzVHN3bXht?=
 =?utf-8?B?UUFMVzJZaC83dDlUdDN3QlQrd1drb2RDb2hDc3NCSURkWi81S0hRZGhOMEVl?=
 =?utf-8?B?T3pYVjNIY3ZOZDRwSU9jYWVBMFNGT2FLWDJNWTFmcHMzVUNWUVczcFRhVTVt?=
 =?utf-8?B?R2Z2bUNrc1ZxdXVObTh4bVNuNDRHSnFvN0puTzRZdmdzZGlSN2d0bWk3WUpT?=
 =?utf-8?B?VnRURDJaSnFWTisrWU53dGZkRWprVTRhbU5kTmFCWHhtZUU3cjdMajlsVUd2?=
 =?utf-8?B?cVNNdlpoU3VFbHBxdldWaDNVSEhqeFF3TjZOdHJkVktsWEdzeHUzMEVxNTNC?=
 =?utf-8?B?S0IvVTZzSVE4VHlGRHQrbkJnYW1LODhCWE1nVEZOd2lFamZuc05hTnoyekhC?=
 =?utf-8?B?SWNKSkYrYmZtU1B1a21KdWVGb1lqMWJVdjBnVnRCYjNodFlOSGNtUFdWbHAx?=
 =?utf-8?B?WlJud3E0cHZ1RzR0R1FIV1czSU5zcC9ITXQzeWxwajAwMitvOEFmckJYcFpi?=
 =?utf-8?B?SlVQTWlPeGYrWmdCN0lacXd3TnV1bUtDdE02UGg0eWhjQkRCMlRtVHJaN1ZX?=
 =?utf-8?B?eTNGNlREeHJkTUJDTEpQYUVVMWVRalg4ckRzUm1EQmZJWjk0eXRxNUZGVHND?=
 =?utf-8?B?TkVPdmZDdFZzTElJQ0hpakZPTFE2a09MQXJncEh2UHpLWWp2ZW1zTkp5QWpu?=
 =?utf-8?B?bmRKODIzS01FeDdiNS9HRFpxbXdlUGppK0l2NDBGWmplMThBc0FOZzE0TXYr?=
 =?utf-8?B?ZXNjWnBLb1A0N0lkTlJUVDVkMVdyWlZQZlBWbGI1S0tpemJKeTJDZHAxR2x5?=
 =?utf-8?B?V0I0YjEvV2M1NjRvTXlENWYxY0Zid0FzRFpoTkNVUG83RFRPKzV5SkFVdDNZ?=
 =?utf-8?B?RnZMUFZQNm1yZG1iSGpNRU9QbC92SndrV0wxamZ3UUNiN0F4Ym9xTCtJdzFI?=
 =?utf-8?B?RmlYby9jblN3QkcvemdKQWRYbFhyNHBBZWpLY0Q4bGg2OEUxcjRnOFhjek1Q?=
 =?utf-8?B?UWM5YjIwM1FNeE5qVVNwYVRNOFNEQ1lBREorV2ZDbkJMWEs1TERiRncvVWt0?=
 =?utf-8?B?WlhYbVVDRWE4ZUpQWm9SM0k3cVdDdzc1NlBhRVp0L2JONEE3bUxHUjd2ejBm?=
 =?utf-8?B?TkZnQUxyZU1LWU9QU1VTR0xTRlFnNGxpYU02bUpTajN2bEtRTVBlVGxsSkg0?=
 =?utf-8?B?VTUxd3MrZHRaekdESWo2Kys5SGpUbXdEWWRKMWZDOHdPaHJydVRIMmQwaTE4?=
 =?utf-8?B?TXFTWFZoYW5xUlJSQ05wWFJGSkxka00veW1qZTFUMXpDcUVFNUYxdlMwRkxv?=
 =?utf-8?B?bEhwZ3Q3QWRUK2NmUUZlL1NCZ25WQnFHMjZRVXQyUzlEVlNBVXlwR2M2RmRZ?=
 =?utf-8?B?ekdJb1loZ251cExtb1JVaDEzZ0NPY0JHM2tTeWF4aW90ckF6L2FUVTVqUXlC?=
 =?utf-8?B?akRKRjlaL2IvRWk3Q2lxbXcwVXcyNFQrVXVkbkxlRGVBQzkwZFpBY3dmVWJr?=
 =?utf-8?B?UHRWcndVd2twSjU0Y1grUkIvMkE0Y0ZmWTkwREVOa3BjYmJQVGFpelg3OGFa?=
 =?utf-8?B?YVBnd3FyQnV3ekZjTnNKeC9ScVhQR0ltSUp3M0xwV2p5aFVHaitoNTJFeHJk?=
 =?utf-8?B?MW5RQjIzeGdWOHZoV3JQWTZuZW9Wc2VZWjFaaEUvdG82TGlpNjlWaVJyK1Iy?=
 =?utf-8?Q?aj/Izldqz6CV7hcxl8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TG9pbnpPaGw0RjNyUWI0U1NlN2c5bHpCMEducFN1b25Xb1hGeWN3dTdLZVZj?=
 =?utf-8?B?OHN3bXcxY2VGZUJua1FuM3BzdWN6NkhYZ1ViVmtrcGUvRVRhQzRGbnlObTZ2?=
 =?utf-8?B?RXlJQXN0ZWhZSXV6Q1RCeWFubTZvTk9tc1VZNVU4UHZSVXlVczJBcGxTYWF3?=
 =?utf-8?B?VHJobXBwOUZWeGlxNWo0bWNNeXVHWXVJRGZTMXY4V3RhMGxnZ2xLZjUwY0xU?=
 =?utf-8?B?c3l0T0RsZlVtY0ppd0JoTmQwN3B1cGJvY1FNOVU1U1dvMlFUenJrOFE5MDln?=
 =?utf-8?B?b2N2OUJEYWRLeTVCWE9rWWl6Z3FKcXFEUk9VR2I0USs0d3FMZ1U2dXRVZVZV?=
 =?utf-8?B?Vk8yYyt3cTJUY0tvWDR4UmM0aS94Vy9UcHpEK2hFSFI3emNiYzVnaDdpdU93?=
 =?utf-8?B?aTVuUWRoaE9xbWRnc09vT1hjbGFTMWM1VzBKNEd2TExyNFgzWjNHa08yVFox?=
 =?utf-8?B?YkdURngxc0hqL3AwWVFkRzNLbXVBcU1NSEwzMDE1MTJPVEw5WFFZdmFQNWhP?=
 =?utf-8?B?WlVyLzU4ZmdCbjljZkVVWktJUzFmeWN1UExFeTlIQ0FEZ3lUZEhSZW5NWUVp?=
 =?utf-8?B?Mk4yZVI5ZzZyODJrcHJtWVcvdXFCSm9KTGltYWhSY0xyZVcwK0tHaFR1cDZF?=
 =?utf-8?B?V0wwU0dnTEJDZGxPYW8wdkZlWTFteXNaVCs0cHdaNVdPMmR1TmtoNXo4QUUy?=
 =?utf-8?B?MER6KzM5M24zRndtQ3k4S2JFeThyM3o0UHp1OTJwcHQ1RHhoTEZ3REhXbzhV?=
 =?utf-8?B?R3Q1b2drcHVqYWxLaVJhSVFqaVFtM2tveVFudDlFTjV6RWVJeXB3UHVIRzQ3?=
 =?utf-8?B?bUtJVzJBS2ttOFZQMzNLblZUR1M3dXlIb0hCVk0zZFZXVXhDY2VrY2FFVHpL?=
 =?utf-8?B?S0FaaGFxeUtNTWp5blc3VERxL3dpWXVWVlRrVHo1VUpoUFhnVWxMcGc0am1s?=
 =?utf-8?B?eUlRWWJvR0g2MS91K1ZWWTh5OTNPdDMzV09nQnJ5NGM2MVdvc2EraHZGaFFZ?=
 =?utf-8?B?b09UZDJHUXlvWUdBbHEzMzU0UnFzeFpDeVVhWmVDM0hLR3Nqd3FMaVpuYUZt?=
 =?utf-8?B?SEIrczl0QjUwME1oZUk3N1BrbzlHV0JBRVFtVjhIV3A5eG5URFVwWGFXQVRU?=
 =?utf-8?B?OEVKSTIrTFp5SEZPWGJiOHZab1lnOVMvUzc4NGJNdEhWSTZQZHBXa29VRk9K?=
 =?utf-8?B?SysyTVQwa2owd3BBN1dSeEdXV0piSkExUURlanBXWnpUUThERU44bU1OdGox?=
 =?utf-8?B?REJWZkNEK3p4TXNFdzhYL1pmcnJpSHlxSmYyZnlLM0RsZlNQby9sUzRMZVlB?=
 =?utf-8?B?SWVhQTM0dFVkcnhUdlZPYmFCSURzdWZFeUpBYTJTL1dpa1drUEl2THVBU0Z3?=
 =?utf-8?B?SUx4LzJYMlBSeXJPOUg4UlFyeFlFUDNIVnlvd1BieHM2WmFGbEIwSThHaVJE?=
 =?utf-8?B?NXpyVlpXdVlzeHdWemIzM0c5eHh0dGZHT1JVc0l2aFdDRjdCOTVFLzFSNytT?=
 =?utf-8?B?azM2anBQWTNtMDBuTi9hdFpMditVQVdtcCt5emxxeFFhQXZKOWswVDlsc0M2?=
 =?utf-8?B?eG5MYmpQWlZuRGwvSlVLS2JiRkoxQmpIKzF4b2VwMEZDRFhSTEdySnRCLzh3?=
 =?utf-8?B?TytzZUVlTDFocGN6SzRDTmNSTnBFU2JpNm02TWF5R2JtUVhSSXhhNUFPdmxn?=
 =?utf-8?B?Vzh2dmtLUmZTZ1ZOeFdZbDZ4Zm1ZVDVENVZVYmtJMkxyTzZIbGtUazJ2dGFp?=
 =?utf-8?B?bURDYTN3WjY0MTd3ZnpnZFZTYTlEQ2R5SEVYVXRDcWcrS1dpdTZCem5oSFhp?=
 =?utf-8?B?MzJIUitxVFNnY0RrQ2JxT1dYZ1hxMmNRNGRWU1ZBZU43VU1OOG10cXNnUDVN?=
 =?utf-8?B?WTJiNS9GTW1lNmUvYWg3YTJWSVNmczUwMHIzNXhkaVlnU2c4T2NHQU1QOVBK?=
 =?utf-8?B?TnN2WWFxNHo5QUpWeVp4UFplM2x1ZVlmSFVUTk1LMDA2UkxvaXR0LzdMVWJv?=
 =?utf-8?B?bEVCUHhoNGJBSTlUWTlKMzJPMWJyRU9VWGJqM0ZONzdkcytQdmdCaTNMRWNy?=
 =?utf-8?B?aWREeGkvWVEwbHk5bWJaRVIzZHluRzhGbEx3SEU1eUpJWVk3OGN2bmZTUzlB?=
 =?utf-8?Q?nEkyukzzYJyfLv9pixhoXm9OB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdfb912-1830-4872-b9ca-08dcec63caeb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 15:20:53.1665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +74Vre//U0OLNbxpsOsqPSPkfjodNKtvW5Rf+DcNM4wa9m1pmGthlJi7WMUEz2WWZri6JndmkHKphcgj7ja1FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6225
X-Authority-Analysis: v=2.4 cv=bIhEI++Z c=1 sm=1 tr=0 ts=670d36da cx=c_pps a=IwUfk5KXFkOzJxXNjnChew==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=2HyfR_PSAAAA:8 a=Hf-4_-baAAAA:8 a=ftOnl28rhwhvWGM3ugEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=0zSPmqmPh2d1CTP8umvz:22 a=ZlNKyJC8Hvw7xOXko2p2:22
X-Proofpoint-ORIG-GUID: T4E6PYSpOnDZgdYsofeTpDG98YUTa9-d
X-Proofpoint-GUID: T4E6PYSpOnDZgdYsofeTpDG98YUTa9-d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410140111
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 49E6U3sB031024
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 15:21:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112908

ChangeLog:
https://gitlab.com/graphviz/graphviz/-/blob/12.1.2/CHANGELOG.md

* Drop backport patch
  0001-Autotools-fix-do-not-put-prefix-based-paths-in-compi.patch
* Refresh patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...-not-put-prefix-based-paths-in-compi.patch | 58 -------------------
 ...o-be-empty-string-if-tcl-is-disabled.patch | 37 +++++++-----
 .../{graphviz_8.1.0.bb =3D> graphviz_12.1.2.bb} |  3 +-
 3 files changed, 24 insertions(+), 74 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/graphviz/graphviz/0001-Autot=
ools-fix-do-not-put-prefix-based-paths-in-compi.patch
 rename meta-oe/recipes-graphics/graphviz/{graphviz_8.1.0.bb =3D> graphvi=
z_12.1.2.bb} (95%)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fi=
x-do-not-put-prefix-based-paths-in-compi.patch b/meta-oe/recipes-graphics=
/graphviz/graphviz/0001-Autotools-fix-do-not-put-prefix-based-paths-in-co=
mpi.patch
deleted file mode 100644
index 0d3f41270..000000000
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Autotools-fix-do-no=
t-put-prefix-based-paths-in-compi.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 671e0d091b40ef7deb4a9d43e0dbed2a44edbec8 Mon Sep 17 00:00:00 2001
-From: Matthew Fernandez <matthew.fernandez@gmail.com>
-Date: Sat, 9 Sep 2023 01:03:04 -0700
-Subject: [PATCH] Autotools: fix: do not put '$prefix' based paths in
- compilation flags
-
-This was causing problems with cross-compilation with a dedicated sysroo=
t,
-because compilation would incorrectly use headers and libraries from the
-`--prefix` path. The `--prefix` path is meant to indicate a target path =
to
-install to, not a path from which to source dependent libraries.
-
-Gitlab: fixes #2442
-Reported-by: Daniel Klauer
-Suggested-by: Daniel Klauer
-
-Upstream-Status: Backport [https://gitlab.com/graphviz/graphviz/-/commit=
/012d250a903e13114bce3ba40995fb957fed7848]
-Signed-off-by: Daniel Klauer <daniel.klauer@gin.de>
----
- CHANGELOG.md | 3 +++
- configure.ac | 8 --------
- 2 files changed, 3 insertions(+), 8 deletions(-)
-
-diff --git a/CHANGELOG.md b/CHANGELOG.md
-index b9b7e8e08..3a15fd256 100644
---- a/CHANGELOG.md
-+++ b/CHANGELOG.md
-@@ -39,6 +39,9 @@ and this project adheres to [Semantic Versioning](http=
s://semver.org/spec/v2.0.0
-   longer fails due to missing PHP files. #2388
- - Syntax for a loop in `gvmap.sh` has been corrected. This was a regres=
sion in
-   Graphviz 2.50.0. #2404
-+- The Autotools build system no longer uses headers and libraries from =
the
-+  `--prefix` path given on the command line. This previously caused
-+  cross-compilation to incorrectly pick up host headers and libraries. =
#2442
-=20
- ## [8.0.5] =E2=80=93 2023-04-30
-=20
-diff --git a/configure.ac b/configure.ac
-index 573a3ee5d..7d53346de 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -190,14 +190,6 @@ if test "x${prefix}" =3D "xNONE"; then
- 	AC_SUBST([prefix])
- fi
-=20
--# automatically check for other dependencies in $prefix first
--if test "x${prefix}" !=3D "x/usr"; then
--	CPPFLAGS=3D"$CPPFLAGS -I${prefix}/include"
--	LDFLAGS=3D"$LDFLAGS -L${prefix}/lib"
--	PKG_CONFIG_PATH=3D"$prefix/lib/pkgconfig$PATHSEPARATOR$PKG_CONFIG_PATH=
"
--	export PKG_CONFIG_PATH
--fi
--
- dnl -----------------------------------
- # Static/Shared binaries
-=20
---=20
-2.34.1
-
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-=
to-be-empty-string-if-tcl-is-disabled.patch b/meta-oe/recipes-graphics/gr=
aphviz/graphviz/0001-Set-use_tcl-to-be-empty-string-if-tcl-is-disabled.pa=
tch
index 99b53e2e1..dda1d4350 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-e=
mpty-string-if-tcl-is-disabled.patch
+++ b/meta-oe/recipes-graphics/graphviz/graphviz/0001-Set-use_tcl-to-be-e=
mpty-string-if-tcl-is-disabled.patch
@@ -1,28 +1,21 @@
-From 564901ab78da2b2b1bed92351dc3c102dc0a8154 Mon Sep 17 00:00:00 2001
+From 62193e52edfc71283b7bbcd6f590d63251290b3e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 6 Aug 2019 17:51:39 -0700
 Subject: [PATCH] Set use_tcl to be empty string if tcl is disabled
=20
 Upstream-Status: Inappropriate [Cross-compile specific]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
+ Makefile.am  | 2 +-
  configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ 2 files changed, 2 insertions(+), 2 deletions(-)
=20
---- a/configure.ac
-+++ b/configure.ac
-@@ -1225,7 +1225,7 @@ AC_ARG_ENABLE(tcl,
-   [], [enable_tcl=3Dyes])
-=20
- if test "x$enable_tcl" !=3D "xyes"; then
--  use_tcl=3D"No (disabled)"
-+  use_tcl=3D""
- fi
-=20
- if test "x$use_tcl" =3D "x"; then
+diff --git a/Makefile.am b/Makefile.am
+index fe373be..5db5cdc 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -11,7 +11,7 @@ pkginclude_HEADERS =3D $(top_builddir)/gra
+@@ -11,7 +11,7 @@ pkginclude_HEADERS =3D $(top_builddir)/graphviz_versio=
n.h
  dist_man_MANS =3D graphviz.7
 =20
  # $(subdirs) contains the list from: AC_CONFIG_SUBDIRS
@@ -31,3 +24,19 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 =20
  .PHONY: doxygen
  doxygen:
+diff --git a/configure.ac b/configure.ac
+index 993a3dd..5e4a1ad 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1086,7 +1086,7 @@ AC_ARG_ENABLE(tcl,
+   [], [enable_tcl=3Dyes])
+=20
+ if test "$enable_tcl" !=3D "yes"; then
+-  use_tcl=3D"No (disabled)"
++  use_tcl=3D""
+ fi
+=20
+ if test "$use_tcl" =3D ""; then
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb b/meta-o=
e/recipes-graphics/graphviz/graphviz_12.1.2.bb
similarity index 95%
rename from meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
rename to meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
index 7548e976f..1843091aa 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_8.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_12.1.2.bb
@@ -19,7 +19,6 @@ DEPENDS:append:class-nativesdk =3D " ${BPN}-native"
 inherit autotools-brokensep pkgconfig gettext qemu
=20
 SRC_URI =3D "https://gitlab.com/api/v4/projects/4207231/packages/generic=
/${BPN}-releases/${PV}/${BP}.tar.xz \
-           file://0001-Autotools-fix-do-not-put-prefix-based-paths-in-co=
mpi.patch \
            "
 # Use native mkdefs
 SRC_URI:append:class-target =3D "\
@@ -28,7 +27,7 @@ SRC_URI:append:class-target =3D "\
 SRC_URI:append:class-nativesdk =3D "\
            file://graphviz-setup.sh \
 "
-SRC_URI[sha256sum] =3D "d593695fdaa8a19297523b679ad13d3ef2027b0b7f14cc2b=
c23e77969ed81565"
+SRC_URI[sha256sum] =3D "cf9e6de9d5949dffbc4dd46f833085ff8e7e55482ffb8464=
1819bbf0d18c5f02"
=20
 UPSTREAM_CHECK_URI =3D "https://graphviz.org/download/"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
--=20
2.25.1


