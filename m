Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8BBCF2588
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 05:58:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.437.1763531924401857418
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Nov 2025 21:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nnM3PzDM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34186c0f38=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ5t2w01261837
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 21:58:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ckL772cMO+DwxHirl4MX
	2xxXkotUtwhJJLc2YGMmNDM=; b=nnM3PzDM3Dui5aUHXhE7BMoZirBfogniU9E6
	gSWu7Xh8ASpROY9Uv+30apMXDQFDeSEoIXjYnmo0sHKLWEfcDRAoutnolB1Qj/Do
	2ES+6IaxB4P+W/vxiJASK3w075YjXLNy4RuFNCHY62wEP+25SSTvIrCzbnVdkVtV
	TgdaSKAmsSJN8NsCH57gGvwSH8R8dcCaSgR12FA3MkXMp2ZGzq49+qyXKSAfFM2x
	KSU4Tm490K94UdCCCZXl1QePTTJ1aA3pDBVj4wWKX6/E0jAcfsTYbx4bC39OXtp6
	hXvew+1SqqGIlXb4cUPlAcmXdRPLDOKRH7CzThU1V0QXV0p18w==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010000.outbound.protection.outlook.com [52.101.201.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjcd1v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Nov 2025 21:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVlbMazucR7ijVwrEVv9RmtrQxEo+qAE1blrZ+sB5Tmu1/mQzpPALArHmi0sTJTLNvRoF7Pa06mi1rlzb9Bs3TSHrZ9BawLNNzA+oZhS2wNbFT8xII5+5DGEvCHFbNdkB+21V1IFkQSqM/zOGfIkGm+LliEMlY56IkN9s7x0sO5azvdRHBt98aJ4hN2zPf6RrMGZHwvWkx2u0BPnrVaja+4IBlWVhvCWh3FhLvvWNhvik2f5ttiJ2ni8zhKiYlNlW9XSdrhYgZNve1kXRwdxMIADEifYbpngdyMOuVLzojOj1tuPAUaf+0Bp9qbfCOBQlMEgHkZglkMirE1kcAmk8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckL772cMO+DwxHirl4MX2xxXkotUtwhJJLc2YGMmNDM=;
 b=eCXllDQiDYC2bhGRfzMhcA5chvIySl/u/04anJAfCmO+qtlUV1dHvo5Q0DVjRlMcAkzjMVXcWd8vA+9yEwcOdw5zkQDjJM5PLh4/1YvIy+keMhLzKR24hisqZlPcaD7x74njFBYsaU1c0gsc8nrAkPBE7bsPEmdEsR2Q7cmB60FZtmIhVuaFTSdtF011kHDdfOnxO5ufaDNcw5iT0N6iGJ7asdUdWiFXmk9BG3kK7jxFJFv42wFcpdMAZ757k21or0BYvuyfRTrnDECTLX4za2W71DgUehl+ng3MBniBihuu6wBFuYGS8srssvzgA095F13m8y0iYEGh2zbMaLhf9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by DM3PPF6A4412A55.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 05:58:41 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 05:58:41 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH] frr: fix CVE-2024-55553
Date: Wed, 19 Nov 2025 13:58:30 +0800
Message-ID: <20251119055830.1695000-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0173.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::16) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|DM3PPF6A4412A55:EE_
X-MS-Office365-Filtering-Correlation-Id: e8bd5de8-820f-47d7-b829-08de2730b08c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FrA58M2JEU3han2e0l/ovQRfn7y9NUhWx7OuRn+kD80t3cgPg+OXKMEAU81Y?=
 =?us-ascii?Q?2Nw3Va9UQGiO1xxKWUESDJsaeVUVBdk/BXYaSQ4KCio9Z/yksii+mfqrUjvG?=
 =?us-ascii?Q?Ps/4wMzeh9nzuIUG9X5+tX8b2o3gIW1DCUAYt2n5FxRSxDSG9NFjCxluXdKn?=
 =?us-ascii?Q?5rd81Og/B50fvjkiXv9AA7ihF4/bw4v02/mGRBqs0H6Yu6QO71U1i4IR11Ly?=
 =?us-ascii?Q?WT2avurf3/pMjWP+n0L5Liyp8WB+8c71Wq2x13KMASUgRLLsZquGxW0TGk8X?=
 =?us-ascii?Q?CtF+LJK+1HfD+5Wu0aQFmAvWXWkhc+tHn6XURdkg9DciAE8rdGPCtZOZJ4l0?=
 =?us-ascii?Q?GGxF5GDLQn0CpeGX3j+H3XJAOSgwYQy/18cAccDglTWqRJdsObfJUjryh7WU?=
 =?us-ascii?Q?XUkbh8w/u3gUev7BObWlwF5TZO0V/CPX0RZJkEraTmn9fZxDZ5+vmKjpfZDh?=
 =?us-ascii?Q?M6gUvLWe84cVPaaDPlHI/RTDRRANMcEPvU90ByF8oI5xgo/vEcWZhrsa9pZG?=
 =?us-ascii?Q?Ew2vdAS6pXsSbf7UULhJmI9FV5S0/NapT2RxU/c8C6lVdWDGrkd82xVMfvth?=
 =?us-ascii?Q?izVhp/c80hS+qHeaH76qPNj/gaj0lqc07L/OqgXoVmjdWFkIakH+q7QHoBQN?=
 =?us-ascii?Q?RrS6RjUWcl+M1ItmxmeMrAp+9xmciWx2dlX7H2eNIPI+x+7rw0/s0nCTi7Wo?=
 =?us-ascii?Q?BTPZdwbD+ej1aIl7ID42ZxGynfO9ihhbcvGYq3mAbDVgzPRaCKozeFd0ZAY9?=
 =?us-ascii?Q?29xqdxRUhlPLbWbL+E7ww0xkNDTrkmpXQdIQj2mDBKcZy+//Z7p322IDTH8W?=
 =?us-ascii?Q?GAB7UXV+KudTuGh1VBjuk1mYcT9N9zHSio37sT+pDqVgkjpKcJz1lKmN2QKg?=
 =?us-ascii?Q?C7ZK3jofCXkUFgsrO/b3VxDQuXfWEzKFbN57ClMBy437W++SAzPcQ0+cd9KQ?=
 =?us-ascii?Q?sO6qvIhmZ/ZNDDcRIBXIVD1spXmGPfDp+F04TIQ2siNkOZfBL6r2VRse6Vhe?=
 =?us-ascii?Q?EU3+XPpgugISk6Zs0M0XP3H+v/8iLuBemnTXnbHZrhSjJWTtpDXrkazSCqhh?=
 =?us-ascii?Q?p0qjEEQlDdRY05xvYRVtK559FTDY+LCfo63RJ74zMhjZTh4hu56VZks6xiZf?=
 =?us-ascii?Q?guhy58+N1Qz0nLj0B3tz+R+ZNvUyMT8ZiYnxNNBeokPJn9CWVhu/XOrI9GMB?=
 =?us-ascii?Q?qKEqrM11ITOQ9ZgSP/VMduX4+i4Jo/AyBd0G/WEn2vrNP73FWVZWF/eG7RC/?=
 =?us-ascii?Q?Clx1r0jglfMtFtJLY8i1zKBYGKp344ZSPSch86PPzlZghAnr88VAb6klELkP?=
 =?us-ascii?Q?DnxbHCn5pZHiPXR9PQaQEtVR97Cm+Z1xIm5A8LtFqcyD8qmlfdtzyAj6HyUA?=
 =?us-ascii?Q?+ELdtYY4zfy487UKat+Ko6eK1zyjUXfw37vN/IM6yExZS2FOG94I3arfkJMl?=
 =?us-ascii?Q?61eb39nhKCAzXyz2YVvlY0g6fqDCla8yJfyK8T4u3YHwpYI0YRBzg2pKi0jw?=
 =?us-ascii?Q?EqFhcB3gwaOq6SLIKQuPIbf+4ZnwutspIYir0KK2OxbTw1748ilhddRVHA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?j/0MIyTVmBXX6TLk7+ku+IGjORklzMgyzIUPYEfwaB1f/z0n8kYuoSQltYPz?=
 =?us-ascii?Q?TWGoEAaJkOk3btuhHfaMXKOITSNBmf+NnPgtRa53KIvuxsU5NYJYC0pbFzVr?=
 =?us-ascii?Q?lcqr5eMIztk/F1uhbw6CMOi9x6NPtyz2rJIBsp1taksQeeT6TACKaq5dD6Y0?=
 =?us-ascii?Q?eVb3nbOMUlLbvzTlr0o9X418ku/0qftdu09yEnj87A1btvL7F4oBLjvORPxi?=
 =?us-ascii?Q?2wCtcZGVvbZ/ez2O71w+cqzaIrOwS6LADq+T0uuKkuxbFrjFoDBHDJZ87Nm6?=
 =?us-ascii?Q?J2yuQxmOXX786P8HJ3duBP7LkZYJwRVSUdum3cxaLcKDmjaU/PICmliBJuec?=
 =?us-ascii?Q?AL3IxV4QYus97FLrcNwjRvs6y1x2CFjgzyFAG+WpIWxxgkzMX6hjfHWFgC95?=
 =?us-ascii?Q?YeQfVF064FhjafkLQPQ+EpgbXbjdNAQ5jjJoPk1P4Uo/3uzaoICuJI8i3EYA?=
 =?us-ascii?Q?p7UAGcOijxt+AKqUvXp3ShjJQZ51Q6fp/8lQ4C07keqxeu597YGT9b4RUE1m?=
 =?us-ascii?Q?3Z8my3lk7dzjuetB2ziBWBIqN/PQ5cz3t0T2/O2cooYRs4EI2tPw2Kc+M113?=
 =?us-ascii?Q?hIVMBlvj6oxZqOnKP1PHGKajj73IAo1dgdeo/Ne7bKTbeKAtVBTe3JTc+R7W?=
 =?us-ascii?Q?LvxKg3NUqRZYh/mBm5e0JngpFp668UsP9pAh3x2hT8OtyO3LcHCYFn4PaxF2?=
 =?us-ascii?Q?FwXn3XTC/D2MLC9MhOOrJvbQPf0DNWA24joVoDEhVmzyivj5k6H0QE9ICUmf?=
 =?us-ascii?Q?Z8Pd+GPIXriMMLfULPZuRYeZvxmandTX2QFue6Jl57/OBLVR71AuzXOQkiWF?=
 =?us-ascii?Q?rCoK5hqAUZhN/bZbeS0yG/xND+3wmATfNExeGFtQiPaCxOI37xE/OlabJgdr?=
 =?us-ascii?Q?QCHdNP49y0b6759pBrGsSOegHedOwogQlST2p4anZ9SC91Fj74mp0KHWB+Gv?=
 =?us-ascii?Q?pzVsFQ6YO5a8JvcLiye2NfB7nCqBii9SSkYn9Imls09Ids0eF6VbJ8lBoSiv?=
 =?us-ascii?Q?z6l2lkTMq3433n4AUXBEy/l8e5bVNWqcz7d1o2cIOzuB5WR8DqmBzqE/iSUz?=
 =?us-ascii?Q?KlOLeQja0T8h8uMoUfERmHy8JFO5dy5aYgldlscqADM2uG2D/qKSFj+M5byl?=
 =?us-ascii?Q?fRrIRZ2jrhFiDUWP6WzZ56VwbrThXqoIl9zMxH93GJBfE2eVpJQ8CZbH6QX/?=
 =?us-ascii?Q?bMdaEQzD0kBvKK65SRlwrqZta80Q82WhiCkQ8bqS9xoB8htWENgY8/tG8b5K?=
 =?us-ascii?Q?mFRLTnur5yrSebHei83gb2sHtNuZXcML14alBa93NUQgliBHOtXrsH6eXDid?=
 =?us-ascii?Q?f7gcyAfyKGpclKtOR7Lb573dn6StlIl1cNDEKTe35zSN6XB1TiPc5vBYMozZ?=
 =?us-ascii?Q?pgjrrsZXWhuBvG8CE2EYE9/H0Lb9cd0LFbOoJc0mpLTbkoHLwToOcmbHL4a/?=
 =?us-ascii?Q?ghvRn6R9nFmwsEp8JbYfKZ0XJyVX2VrFb89JZ5EBqyuaMzr+efqWDo+G79/u?=
 =?us-ascii?Q?iQ3BMOxJ2JLzp4A00uTwQ+di24T4swP5L/4Gb2V2gfqWvb/8KAx2C3sNvDRe?=
 =?us-ascii?Q?zOy7tpZyaBiBbxmxmoaiJVbb6zOyABfZWJEZW59JdYcAEBgTtjYIAFtAtEoU?=
 =?us-ascii?Q?fA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8bd5de8-820f-47d7-b829-08de2730b08c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 05:58:41.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lKFIO545YNzNsCI/juNhCzq20yEQEdKjte1vN7SP+n2mwJfiaMCEcpETZGaa5n/oHz9XyQo6+Z+dku2afMJ6Ta/kMxfwOE4Kyxom9S69pM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF6A4412A55
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691d5c93 cx=c_pps
 a=0bDVNUKav+K/acou55tioQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=87jn28RfAAAA:8
 a=i-QeA2Zi-sw-G6TxG8UA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=aVDrfO6s1PESLM1EhDzk:22
X-Proofpoint-GUID: qraOY5XC1DZt7jf7gV_v__Ques4lxPSN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA0NCBTYWx0ZWRfX634MgtD50G/T
 plc4q2xNnpCfjyvCXiXAMBmq6cuvWB7I+HY7a69gw8YaOBbHMSUMneBLHFTl0NRUEgidj0HjSjo
 5d6JSujWXTjCO8ezdorD8L/lhq3XCOkWukfwfcvePMwEsUBDJmVDud2/6RV/TG3bCQSgxFYqau7
 5XMiSLWXj2q7s2gohVC/yyU812R6gSdKEbtuUlCgIJfz4ohp350K54TSP35kAjiWhkioPIz3lpi
 URzQqdDt69Pf4XLLvHsLXmXYmHtycWvykUltql/YaElu0L+sG+kvBkA18fG9YNrM+vm3NT2jBhn
 XtRrUqXvtEme2x8Z0AhUwoGzZ0CwdyI1YUM9Eavr3PT9wKOdwIYkPs5JvPEhMUpSzb35ZTIDayg
 uR5o5wWLJJMJQOJnXqx51vZv/oJdVw==
X-Proofpoint-ORIG-GUID: qraOY5XC1DZt7jf7gV_v__Ques4lxPSN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511190044
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Nov 2025 05:58:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121887

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-55553:
In FRRouting (FRR) before 10.3 from 6.0 onward, all routes are re-validated if the total size
of an update received via RTR exceeds the internal socket's buffer size, default 4K on most OSes.
An attacker can use this to trigger re-parsing of the RIB for FRR routers using RTR by causing
more than this number of updates during an update interval (usually 30 minutes).
Additionally, this effect regularly occurs organically. Furthermore, an attacker can use this
to trigger route validation continuously. Given that routers with large full tables may need
more than 30 minutes to fully re-validate the table, continuous issuance/withdrawal of large numbers
of ROA may be used to impact the route handling performance of all FRR instances using RPKI globally.
Additionally, the re-validation will cause heightened BMP traffic to ingestors.
Fixed Versions: 10.0.3, 10.1.2, 10.2.1, >= 10.3.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-55553]

Upstream patches:
[https://github.com/FRRouting/frr/commit/b0800bfdf04b4fcf48504737ebfe4ba7f05268d3]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-55553.patch              | 253 ++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.3.bb        |   1 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
new file mode 100644
index 0000000000..ac8dbcc2ed
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-55553.patch
@@ -0,0 +1,253 @@
+From c66b72ef6d10f3f77d4bdddd849436a16270dfc4 Mon Sep 17 00:00:00 2001
+From: Donatas Abraitis <donatas@opensourcerouting.org>
+Date: Wed, 4 Dec 2024 23:38:34 +0200
+Subject: [PATCH] bgpd: Validate only affected RPKI prefixes instead of a full
+ RIB
+
+Before this fix, if rpki_sync_socket_rtr socket returns EAGAIN, then ALL routes
+in the RIB are revalidated which takes lots of CPU and some unnecessary traffic,
+e.g. if using BMP servers. With a full feed it would waste 50-80Mbps.
+
+Instead we should try to drain an existing pipe (another end), and revalidate
+only affected prefixes.
+
+Signed-off-by: Donatas Abraitis <donatas@opensourcerouting.org>
+
+CVE: CVE-2024-55553
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/b0800bfdf04b4fcf48504737ebfe4ba7f05268d3]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ bgpd/bgp_rpki.c | 148 ++++++++++++++++++------------------------------
+ bgpd/bgpd.c     |   4 --
+ bgpd/bgpd.h     |   1 -
+ 3 files changed, 55 insertions(+), 98 deletions(-)
+
+diff --git a/bgpd/bgp_rpki.c b/bgpd/bgp_rpki.c
+index 375b041853..402ff24b50 100644
+--- a/bgpd/bgp_rpki.c
++++ b/bgpd/bgp_rpki.c
+@@ -116,7 +116,6 @@ static enum route_map_cmd_result_t route_match(void *rule,
+ 					       void *object);
+ static void *route_match_compile(const char *arg);
+ static void revalidate_bgp_node(struct bgp_dest *dest, afi_t afi, safi_t safi);
+-static void revalidate_all_routes(void);
+ 
+ static struct rtr_mgr_config *rtr_config;
+ static struct list *cache_list;
+@@ -403,36 +402,10 @@ static void rpki_revalidate_prefix(struct event *thread)
+ 	XFREE(MTYPE_BGP_RPKI_REVALIDATE, rrp);
+ }
+ 
+-static void bgpd_sync_callback(struct event *thread)
++static void revalidate_single_prefix(struct vrf *vrf, struct prefix prefix, afi_t afi)
+ {
+ 	struct bgp *bgp;
+ 	struct listnode *node;
+-	struct prefix prefix;
+-	struct pfx_record rec;
+-
+-	event_add_read(bm->master, bgpd_sync_callback, NULL,
+-		       rpki_sync_socket_bgpd, NULL);
+-
+-	if (atomic_load_explicit(&rtr_update_overflow, memory_order_seq_cst)) {
+-		while (read(rpki_sync_socket_bgpd, &rec,
+-			    sizeof(struct pfx_record)) != -1)
+-			;
+-
+-		atomic_store_explicit(&rtr_update_overflow, 0,
+-				      memory_order_seq_cst);
+-		revalidate_all_routes();
+-		return;
+-	}
+-
+-	int retval =
+-		read(rpki_sync_socket_bgpd, &rec, sizeof(struct pfx_record));
+-	if (retval != sizeof(struct pfx_record)) {
+-		RPKI_DEBUG("Could not read from rpki_sync_socket_bgpd");
+-		return;
+-	}
+-	pfx_record_to_prefix(&rec, &prefix);
+-
+-	afi_t afi = (rec.prefix.ver == LRTR_IPV4) ? AFI_IP : AFI_IP6;
+ 
+ 	for (ALL_LIST_ELEMENTS_RO(bm->bgp, node, bgp)) {
+ 		safi_t safi;
+@@ -455,87 +428,76 @@ static void bgpd_sync_callback(struct event *thread)
+ 	}
+ }
+ 
+-static void revalidate_bgp_node(struct bgp_dest *bgp_dest, afi_t afi,
+-				safi_t safi)
++static void bgpd_sync_callback(struct event *thread)
+ {
+-	struct bgp_adj_in *ain;
++	struct prefix prefix;
++	struct pfx_record rec;
++	struct rpki_vrf *rpki_vrf = EVENT_ARG(thread);
++	struct vrf *vrf = NULL;
++	afi_t afi;
++	int retval;
+ 
+-	for (ain = bgp_dest->adj_in; ain; ain = ain->next) {
+-		struct bgp_path_info *path =
+-			bgp_dest_get_bgp_path_info(bgp_dest);
+-		mpls_label_t *label = NULL;
+-		uint32_t num_labels = 0;
+-
+-		if (path && path->extra) {
+-			label = path->extra->label;
+-			num_labels = path->extra->num_labels;
++	event_add_read(bm->master, bgpd_sync_callback, rpki_vrf, rpki_vrf->rpki_sync_socket_bgpd,
++		       NULL);
++
++	if (rpki_vrf->vrfname) {
++		vrf = vrf_lookup_by_name(rpki_vrf->vrfname);
++		if (!vrf) {
++			zlog_err("%s(): vrf for rpki %s not found", __func__, rpki_vrf->vrfname);
++			return;
+ 		}
+-		(void)bgp_update(ain->peer, bgp_dest_get_prefix(bgp_dest),
+-				 ain->addpath_rx_id, ain->attr, afi, safi,
+-				 ZEBRA_ROUTE_BGP, BGP_ROUTE_NORMAL, NULL, label,
+-				 num_labels, 1, NULL);
+ 	}
+-}
+ 
+-/*
+- * The act of a soft reconfig in revalidation is really expensive
+- * coupled with the fact that the download of a full rpki state
+- * from a rpki server can be expensive, let's break up the revalidation
+- * to a point in time in the future to allow other bgp events
+- * to take place too.
+- */
+-struct rpki_revalidate_peer {
+-	afi_t afi;
+-	safi_t safi;
+-	struct peer *peer;
+-};
++	if (atomic_load_explicit(&rpki_vrf->rtr_update_overflow, memory_order_seq_cst)) {
++		ssize_t size = 0;
+ 
+-static void bgp_rpki_revalidate_peer(struct event *thread)
+-{
+-	struct rpki_revalidate_peer *rvp = EVENT_ARG(thread);
++		retval = read(rpki_vrf->rpki_sync_socket_bgpd, &rec, sizeof(struct pfx_record));
++		while (retval != -1) {
++			if (retval != sizeof(struct pfx_record))
++				break;
+ 
+-	/*
+-	 * Here's the expensive bit of gnomish deviousness
+-	 */
+-	bgp_soft_reconfig_in(rvp->peer, rvp->afi, rvp->safi);
++			size += retval;
++			pfx_record_to_prefix(&rec, &prefix);
++			afi = (rec.prefix.ver == LRTR_IPV4) ? AFI_IP : AFI_IP6;
++			revalidate_single_prefix(vrf, prefix, afi);
+ 
+-	XFREE(MTYPE_BGP_RPKI_REVALIDATE, rvp);
+-}
++			retval = read(rpki_vrf->rpki_sync_socket_bgpd, &rec,
++				      sizeof(struct pfx_record));
++		}
+ 
+-static void revalidate_all_routes(void)
+-{
+-	struct bgp *bgp;
+-	struct listnode *node;
++		RPKI_DEBUG("Socket overflow detected (%zu), revalidating affected prefixes", size);
+ 
+-	for (ALL_LIST_ELEMENTS_RO(bm->bgp, node, bgp)) {
+-		struct peer *peer;
+-		struct listnode *peer_listnode;
++		atomic_store_explicit(&rpki_vrf->rtr_update_overflow, 0, memory_order_seq_cst);
++		return;
++	}
+ 
+-		for (ALL_LIST_ELEMENTS_RO(bgp->peer, peer_listnode, peer)) {
+-			afi_t afi;
+-			safi_t safi;
++	retval = read(rpki_vrf->rpki_sync_socket_bgpd, &rec, sizeof(struct pfx_record));
++	if (retval != sizeof(struct pfx_record)) {
++		RPKI_DEBUG("Could not read from rpki_sync_socket_bgpd");
++		return;
++	}
++	pfx_record_to_prefix(&rec, &prefix);
+ 
+-			FOREACH_AFI_SAFI (afi, safi) {
+-				struct rpki_revalidate_peer *rvp;
++	afi = (rec.prefix.ver == LRTR_IPV4) ? AFI_IP : AFI_IP6;
+ 
+-				if (!bgp->rib[afi][safi])
+-					continue;
++	revalidate_single_prefix(vrf, prefix, afi);
++}
+ 
+-				if (!peer_established(peer->connection))
+-					continue;
++static void revalidate_bgp_node(struct bgp_dest *bgp_dest, afi_t afi, safi_t safi)
++{
++	struct bgp_adj_in *ain;
++	mpls_label_t *label;
++	uint8_t num_labels;
++
++	for (ain = bgp_dest->adj_in; ain; ain = ain->next) {
++		struct bgp_path_info *path = bgp_dest_get_bgp_path_info(bgp_dest);
+ 
+-				rvp = XCALLOC(MTYPE_BGP_RPKI_REVALIDATE,
+-					      sizeof(*rvp));
+-				rvp->peer = peer;
+-				rvp->afi = afi;
+-				rvp->safi = safi;
++		num_labels = BGP_PATH_INFO_NUM_LABELS(path);
++		label = num_labels ? path->extra->labels->label : NULL;
+ 
+-				event_add_event(
+-					bm->master, bgp_rpki_revalidate_peer,
+-					rvp, 0,
+-					&peer->t_revalidate_all[afi][safi]);
+-			}
+-		}
++		(void)bgp_update(ain->peer, bgp_dest_get_prefix(bgp_dest), ain->addpath_rx_id,
++				 ain->attr, afi, safi, ZEBRA_ROUTE_BGP, BGP_ROUTE_NORMAL, NULL,
++				 label, num_labels, 1, NULL);
+ 	}
+ }
+ 
+diff --git a/bgpd/bgpd.c b/bgpd/bgpd.c
+index 4de5964c39..9bf964c45f 100644
+--- a/bgpd/bgpd.c
++++ b/bgpd/bgpd.c
+@@ -1248,8 +1248,6 @@ static void peer_free(struct peer *peer)
+ 	bgp_reads_off(peer->connection);
+ 	bgp_writes_off(peer->connection);
+ 	event_cancel_event_ready(bm->master, peer->connection);
+-	FOREACH_AFI_SAFI (afi, safi)
+-		EVENT_OFF(peer->t_revalidate_all[afi][safi]);
+ 	assert(!peer->connection->t_write);
+ 	assert(!peer->connection->t_read);
+ 	event_cancel_event_ready(bm->master, peer->connection);
+@@ -2640,8 +2638,6 @@ int peer_delete(struct peer *peer)
+ 	bgp_reads_off(peer->connection);
+ 	bgp_writes_off(peer->connection);
+ 	event_cancel_event_ready(bm->master, peer->connection);
+-	FOREACH_AFI_SAFI (afi, safi)
+-		EVENT_OFF(peer->t_revalidate_all[afi][safi]);
+ 	assert(!CHECK_FLAG(peer->connection->thread_flags,
+ 			   PEER_THREAD_WRITES_ON));
+ 	assert(!CHECK_FLAG(peer->connection->thread_flags,
+diff --git a/bgpd/bgpd.h b/bgpd/bgpd.h
+index b139b2c1b4..c4faacc6dc 100644
+--- a/bgpd/bgpd.h
++++ b/bgpd/bgpd.h
+@@ -1571,7 +1571,6 @@ struct peer {
+ 
+ 	/* Threads. */
+ 	struct event *t_llgr_stale[AFI_MAX][SAFI_MAX];
+-	struct event *t_revalidate_all[AFI_MAX][SAFI_MAX];
+ 	struct event *t_refresh_stalepath;
+ 
+ 	/* Thread flags. */
+-- 
+2.50.0
+
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
index f3b4816941..c5f626a35a 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.3.bb
@@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
+           file://CVE-2024-55553.patch \
            "
 
 SRCREV = "ad1766d17be022587fe05ebe1a7bf10e1b7dce19"
-- 
2.50.0


