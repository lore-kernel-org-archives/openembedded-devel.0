Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 100EBCAC597
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 13:29:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.33379.1757942976953841451
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Sep 2025 06:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fgt6q8UF;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1353810445=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F50Ne43646988
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 13:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=2nFfGLAzYpHMb3FIR50W
	vMkmgMrp1/8IKXVjP5GpVp0=; b=Fgt6q8UFw5i6UFdbK+zulxY1n/5MNflV0hny
	5ZIQvdWiX+Yz2fw2T0y/4rt1WRxS6RQM2LsgMAA6ZB+TjUhQx/6/5IKalJ7pnwmt
	THfR3ihkfLFNeBc03obxGOPpj/oEhmceKWWGQe9pHkCXgV8guPr9QwVCPAL4VtNG
	jloQDdMJgjIgW6WNXwniJcKH19gjeyh+dxHDPLgiTQGJ4WgGflwdFa0lkR/XQxx8
	OxKpcTD+agThzcf7xEqnRU0iSxwFJkI5qyK4opWpxMQVF8ajNVrJTQB72gJO6fCD
	O5Hcs10h+y9Pzrb2tFd3wfyiTSikax4PSk00dYO2B7n0E7ThdQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012041.outbound.protection.outlook.com [40.107.209.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu126kb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 13:29:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PbzC3EaydnsNyvKocTuIDKbKcXR0sNbLd5V7I54naoO2ooK+2wkdYx0lPJHVGbvwedYmWfA1P8BMuQvoMDL6/R4MN4THEJjYRyAWQbCbNxzbas3ID+xxzd+xjQfCMRvK8KxWnEciR3fNhUjwwIzpPxKy2gItM3qNSdcjBbxvC0/8ZnbO19sjkBKwXMi0Oe+fwmB+rGrF1Ga7RpsVCcDyjqIn3+9eYo0OV0yjT3EmqxY4KwvcMvX2i79Nv2UwOpDCt3q8bcFizVB2SyClnFshAEQZ641CZVBHsr8BESx8xBa4Y9EaCrs1pDZxMNKGmS6UMzhquI7Q+gGLsTZUscTmOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nFfGLAzYpHMb3FIR50WvMkmgMrp1/8IKXVjP5GpVp0=;
 b=y+H/u8uBTCqGFiy3XC4YsZBnxNsIPzvpfsHebcBt4/4xAZ8txv7N0G4exRJ9idGF21iKD19z1pNoxH4HdodLkbbS7CZc5IvmytpwFSM2QyFDEK1EIB15EGCE415i7ODyR9VwF+W2fPj0yF+/8h4dZGyUpxmrYH+DizjngSb9aIjoig1R67kPOsApBJsSESXNpLS0JHZtS0KVwdkAJgxtVf2GQGumOk2HR2IgfOOdHFqPCs64pY9iGB4bgStT9Uegga04sGcIIF+AHZB0euIACVAYMalhNik5menFEpbu7DOkmaUTsfZ+/SpHoYiBA8x1l08Osr45xR3ZqpP5u1jtDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA2PR11MB5082.namprd11.prod.outlook.com (2603:10b6:806:115::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Mon, 15 Sep
 2025 13:29:33 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%3]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 13:29:33 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][scarthgap][PATCH] python3-posix-ipc: fix runtime error
Date: Mon, 15 Sep 2025 21:29:52 +0800
Message-Id: <20250915132952.1092546-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::9) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA2PR11MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: 0090c458-5888-4a51-e346-08ddf45be826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?odXUn/kV8aiFHD1VlVgUonDZhAhagj6qUNv2oskiQgWErXBkvxdVBaA25jZ8?=
 =?us-ascii?Q?3wM5ZakC+S5ddExECs3toIftHaJ3/BHCCSmuxlAi2yJu/1IJ0IdWDYCCZezS?=
 =?us-ascii?Q?l7RWfPXspjEJdD1B9898r/2w4eHp/NBBbDrtSR5GmdB02f7XBAs4/liHRgsL?=
 =?us-ascii?Q?WmGcqZEWuI8lxtTfNMY62MajTql6qcLBMrhTyh0Yx6sbwmei4jbbhdyoqvSI?=
 =?us-ascii?Q?QSjHTSfwUwOlAYjtLRSGtzRD154sqIIXDdO333xGQyePzJr4NhXqoH8mt+2P?=
 =?us-ascii?Q?h6TVe3jhriY+Hxi2LfbKg951ILmQu7FOtWnzZm6CaRDzp8ae1rk/H8b5LPgr?=
 =?us-ascii?Q?1qvRh+UM1o7iGYzEbJy4MCA4rd8yIuaS9ut7ysZoUUSjHq9ejPXWt+kJRO5p?=
 =?us-ascii?Q?u0gMrVt4neTLUPh0OYMcrfS5b7jD7n31AcJknMqWw294gDTHPtKe2bjt1tE4?=
 =?us-ascii?Q?Dj4v8f4V1bmxT3QYVkfjsUWb8UAiPiAeqhgCntB+NFGEtIK1U4dbWdYnJIrk?=
 =?us-ascii?Q?aDwgRoo4LnjKKq+LuEF77AgBZs8q5XKKmVGdGAkD6LALVIEwM105U/qPQ3tg?=
 =?us-ascii?Q?AMVBR18MyAoXRpbVRqauhJEcsHWUX2aSkIJMiOhELGqGO2gzTvwfb8/PeAiR?=
 =?us-ascii?Q?N1OLndca2FWMu9hHS4GKiqDJCEaJ7AA3jn/GmlawhVqbf84tqDvvSrvrkcQp?=
 =?us-ascii?Q?NKzjVU7VmI+P+C7o9vpp6CjHTjCz2i7WWma7aeV42gs089Ri960yryLQCx8I?=
 =?us-ascii?Q?xKsJU12dxqNWRLAHr2wTd05fKAYXomYM4ocf7SQRHcOVy/graWmc6Bl/2umQ?=
 =?us-ascii?Q?GDrITgxxb0zwWkbL2efjgORRQPh761AZVtmvzrW75rSSl44+Cveam32yD6wK?=
 =?us-ascii?Q?SwyMcU7uhB51oihgCOpg9zDxYF1OqQpcpEwX+8F70Tx9Xa5mSRt42drh1iPN?=
 =?us-ascii?Q?E52iXRiQ3HD7Ch6iXlgHQ+U0kx44yF7Wapc2kCXpkPCtKRDlUgklVVtT2Zd9?=
 =?us-ascii?Q?iJp5MTYJP7Nc7yGCebjfmyqk1D9LKm7sSSBXfvz2UULra7P0VzOhxtTHBQ4d?=
 =?us-ascii?Q?e2zBznvos3RCMXtw5pA41hv+FCBnHg/wr2cowHyHaN1dkmrao0OVdBhnxKtZ?=
 =?us-ascii?Q?fh0WlNxI7Z9vHedUIKfSswCeVFikMxB/FBQMhQ1qrNUFLOEKrDYF+CvCKlnn?=
 =?us-ascii?Q?LbUqAIzgBZADhH5ckFyRafuOYAquhtj9UwyUUnhfU7Z+n+ITiJYguYgl4FqE?=
 =?us-ascii?Q?KBN/VtP9f96JsB69saZf0X5MWF/CuQOmkWK9wcdo8Crpi+ktiFGdY5xG8IvS?=
 =?us-ascii?Q?HhbsX9FSF62hT9Kwme0irBhrchXAml/aneYctojqBkbfkjnkpwRoqcUhbdJ6?=
 =?us-ascii?Q?VoUY78xGP4046r3loTFhWe8Le0xknBU685mSs5gRtUf8Tccmh+NTRRc2FWSm?=
 =?us-ascii?Q?SHBykPV5RtPM+4A0/igckCZ5HOdHrOyefBfNfhfTAq3XKd93SdS71g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ga7Cs5EBp6yJUwOOzwnZlVu7upLwnA9gm8XvSGMsufqeVWj7QLepf+0Oo+s2?=
 =?us-ascii?Q?JHhxgPyvqECBWRuhgqTDcqYnFTykr4oySAS/zGExEbOrICCbCZ3onx0OkUmR?=
 =?us-ascii?Q?XG9kB2DaEp72EXUCGt6kYI8P7ec5+euUuqvXAPcY3OBlMd4GAVFmnqQqzFSx?=
 =?us-ascii?Q?2UgpWL6BKrM/B4AayPIvrnomraLh4YVOOG1uVrIBcMqf2YlOd+S4yZmvlCvw?=
 =?us-ascii?Q?9KOjzPV7UhIXffUnHw2PTrSJVxcRwMNl7HCTWKYrWJU+MtYdIesXW/LxvWBS?=
 =?us-ascii?Q?zM0spjUQaangt0ULxUp9oxpd2Yw1PRa1EgUz0zHk4KgyePMkaPyBfMkV0yfi?=
 =?us-ascii?Q?7Zf2IvgnRxKuVQ8kXHDPdWICCz5rqYIVHUzmNmG7YjlYI5JoFG6/rXAwiQim?=
 =?us-ascii?Q?d7F0XVSBjzee3FO7GXJbXPQpy62heo8pF9UM8wWpEBOg4+CLBKoXEVeO/vOK?=
 =?us-ascii?Q?N4iNXQN8e+JnkMCSL013SzicsZHvsjt+hR2BIn3EFEXLxafMmq4DezriRPlM?=
 =?us-ascii?Q?WtTK2lcWNQGKTfEhlwNIl+bCpUH2LBlhEgMBxvDVVt/CtolJmj5SjDy9P/im?=
 =?us-ascii?Q?NcStxqmYaRi7XupZTka5y7ZBmbO8EVRT4SCZkkuSprLcpBiVAG1yoGSxFG1F?=
 =?us-ascii?Q?DP+oJfhbfukTT39JtqlKp5Fr9G4wSM8w8JU/Qg2smSDXc006QSsg6Pfma7wo?=
 =?us-ascii?Q?7DIqa7ed3Ln7XMTNc9YKno4a8Z1wFHPy69JbZWriNkgTMpcQ8E4Ikl5/kIK8?=
 =?us-ascii?Q?eODcGN0RMjtgULALZOsbsvIEgkOP0jxfArPMv9xvLm49J4nOEXZIDpSxPSmJ?=
 =?us-ascii?Q?zydZqKskdkFCA+m6Flpz1wHw6OixDBhilTbZANPIqzDyKB1RaJzIWYLnGGLr?=
 =?us-ascii?Q?WHegKS8/Qfa25Sl7BkULi3LHxpVhkwyRHPyil//CRMW6jmPqxCe76wadJua5?=
 =?us-ascii?Q?TY57LgNlgVs5dvE5oXSqysb603OW+3dnNmPG0jBmi4dqpXs2ORrFv5SEBQZ1?=
 =?us-ascii?Q?43Bg5ai5HD1xOBO59etSZpw9D38Jz+fRNuxiqlfBA1vksa++AU9gMyrPQjVZ?=
 =?us-ascii?Q?tp5OaEROlJGz05gtEY2gFUek13jSB0uX5hQFdQDHdhtgjmdKOXmP0mLe2mtD?=
 =?us-ascii?Q?3vi+lfEdAh4nZhyOB9J9+cc9H6vrD3GpDescju0CNFXDeLadE6zfcU5x3+Jk?=
 =?us-ascii?Q?os+oGmbKhu/+kbxD074DQOMYgFJijnaauOsPor4vEr1gmvk6t5H2K7Vogdhp?=
 =?us-ascii?Q?awe3FV0HkJzdgdXW82Rs4ofM+AxbnLvfYZqhWOJCytOOJ+UP/H/LNFO3k995?=
 =?us-ascii?Q?+I/kcs0RXtbMQNsBNl61Xfwt3c1+UKQOz8S2pQ0zICbRgOHg8s6cyWwhFtau?=
 =?us-ascii?Q?fVuq2oaCvOE6R1zIhQxVIybm/Wh83zlyHoL+z89KQGLnHl002WZjeIb0zoh5?=
 =?us-ascii?Q?VdSYZ+gupSJCg4KMzA/olGauJHHrTHcTzl4d07E+9mnN05a+j8IWM1Ry1iY3?=
 =?us-ascii?Q?KWr0lARuNOck728EPxHf/qoAscIh+45klli4a089s1G4oBJ2JW255s5L8wH7?=
 =?us-ascii?Q?Q5YzgQWvadBMrmBL80nRvQqi/JGP9xCMShhv7GcIiUuMs13BuXtWVWG8RPxw?=
 =?us-ascii?Q?6Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0090c458-5888-4a51-e346-08ddf45be826
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:29:33.3113
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAaGOWyZJGT99aQxBTPI0kQE+Uns7jLlGh5NkWmQ966+0KdNnqeI8sKdVEBoMrUMEbmqIOVPj0w31te9hCCiyYYhCOtf/pr2hSptq8INylM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5082
X-Proofpoint-ORIG-GUID: IX-_bgLRYGrioAANhnISSrrTn4qJeTKl
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c814bf cx=c_pps
 a=hT+s7xQkU6anaY/BUKCaTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2gxSeYEUM00A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8
 a=UxSvbUf5MOKH7wX9ivsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IX-_bgLRYGrioAANhnISSrrTn4qJeTKl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDEyOCBTYWx0ZWRfX+2kIy+owkd3K
 sdT5idATSe8C6tVUGcTMkIDbqSJ76yuh8yyWSQ8NfbKiyRcWTHVxKxdq0CtcybbuDbwpKU3I9Uw
 M9Q7PDrmB9aloAFcmmO8CpzO5PwC77c0E+sgFGo5gFfai3bfbvWvDgfM4JLIi3aKyv1fEMTlsKt
 70BnitXDCgHyZgjLp5dlt37prmVtHl6m3QIjK1b1I8KfdJ/4EAmph4j5YmXyEvX06RpbuSvIpVK
 XW3L/aQTN7L5Iep+EtwKQ8pOvYInTZtxPzNgSp+WKynyT6qfYgYxQNXNkceVB7RBpI8Yjz9oQWp
 2FXRF7lVsLoYR5MSH+4LKw/omkcuD0BHtCKRKt/UCy4hjZKUXk66tJgIYNJSvU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Sep 2025 13:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119409

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix follow runtime error: ./build_support/src/sniff_mq_prio_max:
/lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by
./build_support/src/sniff_mq_prio_max)

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 ...ndle-runtime-errors-and-return-None-.patch | 47 +++++++++++++++++++
 .../python/python3-posix-ipc_1.2.0.bb         |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch

diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
new file mode 100644
index 000000000000..e84345a39737
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc/0004-build_support-handle-runtime-errors-and-return-None-.patch
@@ -0,0 +1,47 @@
+From b079074048bc33b206b21f73fecb8173cf8adaf0 Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Mon, 15 Sep 2025 21:15:45 +0800
+Subject: [PATCH] build_support: handle runtime errors and return None for
+ invalid max_priority
+
+When cross-compiling, test binaries may fail to execute on the host system if
+the target toolchain was built against a newer glibc version than what is
+available on the host.
+
+For example, on Ubuntu 20.04 the following error occurs:
+
+./build_support/src/sniff_mq_prio_max: /lib/x86_64-linux-gnu/libc.so.6: version
+`GLIBC_2.34' not found (required by ./build_support/src/sniff_mq_prio_max)
+
+This change ensures that such runtime errors are gracefully handled, and
+max_priority is set to None when the test binary cannot be executed.
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ build_support/discover_system_info.py | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/build_support/discover_system_info.py b/build_support/discover_system_info.py
+index f6e6c8cbe6ba..4fec48b5529d 100644
+--- a/build_support/discover_system_info.py
++++ b/build_support/discover_system_info.py
+@@ -75,8 +75,12 @@ def compile_and_run(filename, linker_options=""):
+     if does_build_succeed(filename, linker_options=""):
+         try:
+             s = subprocess.Popen(["./build_support/src/%s" % filename[:-2]],
+-                                 stdout=subprocess.PIPE).communicate()[0]
+-            return s.strip().decode()
++                                 stdout=subprocess.PIPE, stderr=subprocess.PIPE)
++            stdout, stderr = s.communicate()
++            if s.returncode != 0:
++                # runtime error
++                return None
++            return stdout.strip().decode()
+         except Exception:
+             # execution resulted in an error
+             return None
+-- 
+2.25.1
+
diff --git a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
index 8147e4108b72..cad140381344 100644
--- a/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-posix-ipc_1.2.0.bb
@@ -12,5 +12,6 @@ SRC_URI += " \
     file://0001-build_support-use-source-filename-instead-of-foo-for.patch \
     file://0002-build_support-handle-empty-max_priority-value-as-Non.patch \
     file://0003-build_support-use-does_build_succeed-in-compile_and_.patch \
+    file://0004-build_support-handle-runtime-errors-and-return-None-.patch \
 "
 inherit pypi python_setuptools_build_meta
-- 
2.25.1


