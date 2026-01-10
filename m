Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56731D277E7
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 13:38:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8612.1768052308416751793
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 05:38:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mgyonDZx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54702d1050=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60ADK7MJ1074946
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 05:38:28 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JNxRT88mst/C3SB62ucG
	h4/3yHVkGXLg56iqpuSYovQ=; b=mgyonDZxXpOlQrUJOdiKV2GhKk/mpzGuC2R0
	lt1axDEwP3msUEPxq1HfM56IBvBjL55rZ3g54I2HahvTNdzrkFjgphWkJVDriPMf
	PROjhLPQYNVM18i7iSSWTBA67rLhapzRsGXTDjGwRuzZUw5RUPvYvMWN/AiXofqm
	hYFjxEYF+ZXpbPkaOkUEiAw4CGifnjER3MJ3fT0rFOPCubcMHAwBOMHdGIqRugx9
	j4ziadl7kcJBCSoMEFk5TrStSSEB8uDNaynHqDdhj7sENwphYE9DsOA42kcV0Uil
	ywDXxjv2zqWes6JShALcoMoUg3PK/aRiZW8RxeopLBXdpw6iXQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013071.outbound.protection.outlook.com [40.93.196.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkjx0r50j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 05:38:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPZK+7olmC9bZpXzsgBzqGjFySK+LZyprWGBphg5yyhkognHKxg+uR1rKCmgCbsv6y0yyW/6x9jQxnVGO2whcmqpZjH0cnsIhrHp3mddUEcfWKbn/VRncf7KmjeLpVdVHo31uJhSKmcptktpXi7ThEsbKKsEFZZ/h8fnIeabOFOL0hm3iZP0q4mKh8nX/x99os3jPWcRs3oct7/8gWTah5pzbxuR79fmCbvZImKQC5z/py/R9bFS4N+lMITyZVs2hDEgnnvjgz1aO7POuDsmz+gLqRGrpsDYJWD6TKnR7wLBsIzmUQ2pd6FlzfxjceekG8PHzfV/SpPz9KCm73YTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNxRT88mst/C3SB62ucGh4/3yHVkGXLg56iqpuSYovQ=;
 b=C1mjC5v/ZZmIMHwQvbxwNJ58612fNrcnG6rwLi/r4fG2CngjNkDpn+s2XB/1nkowvHYsIulGH2j/3A7lMEbf5+qltbYVnulMtYw+ghcfoSwrRT6nmJx20MTY2PbBsRU5AuAM2Ab37TZDqcGGAdENVX9biJMRvBTzcmHMmFYPK38xKlxR/tDOSq2TdUI49IqDoaI63+9D14hvALNmM0UOuegkhISwnEcEPDgJ2KxR6Xtp6UWa+e6kj1RaCyihU7wIfcAeq8VKYseMQVZ0zhmqDE2qug5eC3P4P/ngAGf9+IP2iwiwg472Idl+dtlAtmeTC50WWDoQ7c9QdQY92l3UCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Sat, 10 Jan 2026 13:38:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9499.005; Sat, 10 Jan 2026
 13:38:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/4] nanomsg: upgrade 1.2.1 -> 1.2.2
Date: Sat, 10 Jan 2026 21:38:07 +0800
Message-Id: <20260110133810.515672-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0044.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CYYPR11MB8385:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ddd144b-00a8-4b92-c918-08de504d8823
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uvvgPYwwgqn1prZyqKhM882D5xlcB7pek7BBydw26lTzpPL0uCQ+BHClikJ2?=
 =?us-ascii?Q?qTS8Xrf+LTlKzbpCTovj1ZwGwSoorU38nC6BXOnFz8J3fFvZE9y1Hwg40iao?=
 =?us-ascii?Q?+P73twNR7uLiGrBOqC2iHCymtez7amWTT/l5x4vm7yJnR/ypUFuZqpU4ytwW?=
 =?us-ascii?Q?tG2aeumYyWs3i92/3fjbUfoGCtofiAySJbKf82IABtROjZBXQeb9MrnK/Oi9?=
 =?us-ascii?Q?ZIgGhaI7f03VC+65f5xZNdMN1IWfp0k79JcU1CYGx7siNbizQSix3zx60Bx3?=
 =?us-ascii?Q?94ERfZg+2hZI+vaosNUc0lJttwljwKfuIrlHY2x1JOVUOFdJYotHiVxk8k2+?=
 =?us-ascii?Q?Cy2BnaU3t2/PJ7JIsJCgVEYzUXa3LR3xm2ubgK8ssZcSlytEcyDUEdlmSBpg?=
 =?us-ascii?Q?WQJskpBLG9nxQBojYX9y6M0OUwT+aylYKznTf2eUd2nqlncJ0rJUfS/25+xS?=
 =?us-ascii?Q?KBP542mgV9XGUwsghK2BoIzQMQyWjdgXClQRPTlEzOF10OvRSJH1C+//HKpP?=
 =?us-ascii?Q?CF81jcRg9Axy1zeE8CPXdNaM30meO86doPCnvHU+U5YKrFg7+LPJoMlSE51/?=
 =?us-ascii?Q?h3NoGC1Lg4rUXXScj2uUjDaFzvwLNgb6Wu3D0bBbtmF/NsdGJmFNKKHBu1A9?=
 =?us-ascii?Q?7gXEH6KmwETd/TsLIOHnn7StrCUF1DT1Ae6BkKX+peZnGwxNYTxv1YGw7bNu?=
 =?us-ascii?Q?OlD58IpTVdOYF7FjIkKfFSaRiLHnOz9KdghnaHCFDLGJ6dJWBXTO/2767Mz6?=
 =?us-ascii?Q?XKkHturbI8SA5ue6QWSDDsfKM4R1oAYJiwEmAcqAAvie7He+92JE1xnKkk46?=
 =?us-ascii?Q?ZmV9E/31jOsDr2hc8s+sNT+qvK+qSpcB8QkeZ7KKhMb1bPtOUp7qTaPKzzz+?=
 =?us-ascii?Q?oLZJtj6SRwctztbh+riTJxc5N6a0cxHivyYDUKPUU0pTSrBhBNRJnQlYoX2d?=
 =?us-ascii?Q?UwGK/R3FB6uoPHwcotxTbxSGuQi6ta4PBBvdS1neJxuaf38u0XKooYRosjH5?=
 =?us-ascii?Q?vN2xF2iwLIVkqcKMo/1db6y5+UGEJBNJ+sy4eoQuXMN/oZHutfxDhZBTux1h?=
 =?us-ascii?Q?zky62QWmxvV3MITxWwkBrdQ2KEP9+OqpCkp8bJsjV6aEdAkHbt0h96zIv4rs?=
 =?us-ascii?Q?n2b3D5GhVish78XXor91Bqwsy8O/wKTJugnFTqzT7us94qhlf6IVGl3N4vsv?=
 =?us-ascii?Q?e8pNiAfHSVhp6Ja4QmOZp/BjI/6YpxZqIkqelC/W/rNKVf2G6G3zZg6kI1Pp?=
 =?us-ascii?Q?Fuw2xly9KdpcXHGDL/CK+CmwbX1ROBO/C5/JZ4+MPDnsI+7VXUsgSvNI4yxG?=
 =?us-ascii?Q?YQMu0Rk2lKBcELbJWREFptlVhr0HkOxj+4sqm8l8qv8CwVl1dlwVYnrtkkoo?=
 =?us-ascii?Q?6yo5Rjtl/fG66Ws7+7UGtmkO5ce0+cEf/2eKwsevLSZf/+YzLa5OYaM/ZpB/?=
 =?us-ascii?Q?vELufiwn4aaFwaq4Yd6b+oy+fY7RrUKNhi3A5uehxVGBAAdUU51jYTSu6omI?=
 =?us-ascii?Q?kfZVbxwBQy7G1+Tgedd1t3UtDqDbwuzSsrIpQmtBzstJHDbXL6yGwBMAPg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nd46Sh9QLDHaytZYXfhSLZJVmCbfhK4cifdMQr2EZhheIuWBfTFF48pdLqfk?=
 =?us-ascii?Q?KwRzmj5cLuVn6RyBJC0YQBSNI6hFf7/Kk+b653DjraD/vPNnP2+BwcMdDgrN?=
 =?us-ascii?Q?G37S90uosJ/Z5rgTQ02E8rzFzY0KrFjsW1Oafc2n65GzPpLML4WhHsyY2eBE?=
 =?us-ascii?Q?J+ZgX2JXv3oOgSFfGDj+pGPA0udZQKnTU4IPE3EzuKgC3F2mNVHbTh+mabzd?=
 =?us-ascii?Q?3A9gxv3G3KAlKukvRk4aItjZP3ekQAUFO1/wedEz5KuJ0FkUVw/JR3krWvqj?=
 =?us-ascii?Q?9a9pQMu4gZ39HtoM67otbynt1u59PwuYLRS3IZLWAe3REg5YLBaO6uqSommV?=
 =?us-ascii?Q?hO4GFtilG11t3aa335Y/lHIuqrotKn6Biki9be2YVXgge6KKMmftCzzY9+UQ?=
 =?us-ascii?Q?PrukwfbWHcQHX8akxRZi0vA38PXM1FKKc9WaOStSTOBT3Fg3kdW0fNn1MNQD?=
 =?us-ascii?Q?LkJsR1au3e4oEFaXJG0EtKPD9A5nt/15WE05SnwSVa3WKWGWuovGbEiW82mT?=
 =?us-ascii?Q?G1yc4Hyzoquzx4+wyWTbx9Is+WQVwF+0mVrZ3vLPkNiLYmQNARMG5cCX8LrP?=
 =?us-ascii?Q?BWeJHqHoXmZa5cIuwlad9FNDujTyFb9w2deim9D+5ogkXSCKN1bMw6JWfMp2?=
 =?us-ascii?Q?O5Pp/oz1C43LMvK93uvxvEfOtarkWcK3jvj2eDQMKOrAScOEACBZuKczpge6?=
 =?us-ascii?Q?gndFuduIWJrEgItByj2KOtlFDkjt4gJlywXgoYFgvdEqLL+FGq14W5FJNNSY?=
 =?us-ascii?Q?P526YdSOmXdLc+OJWJnpp5nN8cogsMrB/mOwgzye8KCQZIkaBdWkD5LJ7NFg?=
 =?us-ascii?Q?TytRnHFxbsQQDTXf34cDhiEQNoPJ2SLZzkcA4PfPBjEfAwSzLhPVZdR7nKfp?=
 =?us-ascii?Q?QvL4Q3U00Pc59z05GR6RU5F2KoPxvnaKbICmV964nMDJf9lQqEthX9NWBNAz?=
 =?us-ascii?Q?DDd2FbJV1y2G9/VENfCEPgiSFJE3JiwK7+C1z2/UG1EJqE1plgBRMSlCB1Y3?=
 =?us-ascii?Q?n6Gnvj7en7tp3Y2RT73/wA6B+0CrFMFDMCz04jyDWSJGA1amwVMlux4ryeee?=
 =?us-ascii?Q?cvYfXjtBnrgkdTOYAW0MdbzvEwiBohkiV2flwpWrgW9g49R/OHF/rTZb18a3?=
 =?us-ascii?Q?/SVcgkfng3mCrcCg3NtkryPQ1JwhPNoNTCNkexAY+6Tf40YlbaNw4JILGxnf?=
 =?us-ascii?Q?9kT9jrCCMC4eytdw/BFuWFh0MOMPBrV8F4m/lNrRZ4NtD2nbqnY4Wkmrtgq2?=
 =?us-ascii?Q?19QimQ0WKJaEonF2rsoHfgOnBqCtl7bnh3PAnUUOzpoqy40ACjOgACY8gsxO?=
 =?us-ascii?Q?vH7CgnvEpkSzglnYPnFrJPKzFXuP7mDJ4jQvGW1MaG4by18Je916DHZSwvqM?=
 =?us-ascii?Q?FHanTSKr/Lq8HhgmTmy7QLls4uJ/yhC/v3UJZ9/Wnafoi2zPoj3fc91vrJAZ?=
 =?us-ascii?Q?403eJFSujJ/bkye3QoBhARDkAyw5Afsv/zkxQtTmu1WbjZMXx4UprXycc/yC?=
 =?us-ascii?Q?PE6/TTTEhC7EaVbJP/j40/32ditWnmpge9KPlGXavp9wGf/IvoW19kzjNVIJ?=
 =?us-ascii?Q?2HLtAnVHPM6oKakMudYgx+JUwJsru5pVanEA3Ncc/YhcXV8m141OToHczHqg?=
 =?us-ascii?Q?zUc1pg26RxFTbPOWnlQKZ5MNd1nQZlruHYfsd7v/GNNcBbtGr1D9lb14CX+7?=
 =?us-ascii?Q?ulG8cRD+By3hAS/bNxLoPQgoyeAuTzUeF/DvLI9x+jZuAz3hjn77xGAZ5k4+?=
 =?us-ascii?Q?lCftjKd9vg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddd144b-00a8-4b92-c918-08de504d8823
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2026 13:38:26.1407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VtUP9GD6MnViMrqoigdbHxOQWuPPLPaF3T2wm5YsharEEek7/xqdnyRf6jxslWIL/shaX7DXSb1i47V6k01S3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
X-Proofpoint-GUID: cBGBMn2hRT27bu-kJA3YoOThpPpQbicb
X-Authority-Analysis: v=2.4 cv=e5ULiKp/ c=1 sm=1 tr=0 ts=69625653 cx=c_pps
 a=5eE4sFn3BonZCz/fQf+K5Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=TzD7TGKFF4AFXD9YHUEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDExOCBTYWx0ZWRfX8cP9G+pUJ5tE
 tQhMztksrhxTrSpRriZ+JiR60WcS3N1qQYvoxXqDv4u7j+CfqV2WSru1co32knZT3WZMQupkD/G
 uL/1ZPyPunIOjF+KdLLEYG+fZWL1fT+6mMQJhqX1MoOmYUYLR8iMdhYIehJhtMt9sDlI6e2zLRf
 xEHqWBHQKVXnM3vGiH+w0n6p2WlgUwffV00s3azyksFpSa2aRYOlndtGyfXBMfQBJZmsqYviil0
 EvMj1MpKktSCGem+C+4hVXrYfiRHOUQPxYqVZtz+qHe4+EviQE4+EhEkSWwVotdLp4ArHLoiTZQ
 SCd9AvdduYbh+GZes/zdzCvQrIqO6hwsOpFci9G4MPiejOmvyl2xQN82yUQxgl5grKPzzAbs7hv
 IwMoJZFG3gLSdpJDx69kDMM9fmr5hJBtVFAM+e6m1nGsCn2wTKh55yiWngDMC0KRA1Jzlbc4+Zc
 oONWQ127jMefvi49L2A==
X-Proofpoint-ORIG-GUID: cBGBMn2hRT27bu-kJA3YoOThpPpQbicb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100118
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 13:38:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123326

ChangeLog:
https://github.com/nanomsg/nanomsg/releases/tag/1.2.2

Drop 0001-allow-build-with-cmake-4.patch as the issue has been fixed
upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-allow-build-with-cmake-4.patch       | 57 -------------------
 .../{nanomsg_1.2.1.bb => nanomsg_1.2.2.bb}    |  5 +-
 2 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch
 rename meta-networking/recipes-connectivity/nanomsg/{nanomsg_1.2.1.bb => nanomsg_1.2.2.bb} (89%)

diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch b/meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch
deleted file mode 100644
index f61966134d..0000000000
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg/0001-allow-build-with-cmake-4.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 2e293eb9d3753ef87a5e05bc6ac270add0ad8fa8 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Wed, 9 Jul 2025 13:25:54 +0300
-Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
- compatibility
-
-Fix:
-
-| CMake Error at CMakeLists.txt:27 (cmake_minimum_required):
-|   Compatibility with CMake < 3.5 has been removed from CMake.
-|
-|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-|   to tell CMake that the project requires at least <min> but has been updated
-|   to work with policies introduced by <max> or earlier.
-|
-|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
-|
-|
-| -- Configuring incomplete, errors occurred!
-
-Upstream-Status: Submitted [https://github.com/nanomsg/nanomsg/pull/1123]
-
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- CMakeLists.txt      | 2 +-
- demo/CMakeLists.txt | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index a9ae6a24..2e93724d 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -24,7 +24,7 @@
- #   IN THE SOFTWARE.
- #
- 
--cmake_minimum_required (VERSION 2.8.12)
-+cmake_minimum_required (VERSION 3.5)
- 
- project (nanomsg C)
- include (CheckFunctionExists)
-diff --git a/demo/CMakeLists.txt b/demo/CMakeLists.txt
-index 4807f160..5ea96c4a 100644
---- a/demo/CMakeLists.txt
-+++ b/demo/CMakeLists.txt
-@@ -6,7 +6,7 @@
- #
- # Thanks for the idea goes to @maddouri.
- #
--cmake_minimum_required (VERSION 2.8.7)
-+cmake_minimum_required (VERSION 3.5)
- 
- project(nanomsg-demo)
- 
--- 
-2.43.0
-
diff --git a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
similarity index 89%
rename from meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
rename to meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
index 3aaf056adf..10ae7a61d7 100644
--- a/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.1.bb
+++ b/meta-networking/recipes-connectivity/nanomsg/nanomsg_1.2.2.bb
@@ -10,10 +10,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=587b3fd7fd291e418ff4d2b8f3904755"
 SECTION = "libs/networking"
 
 SRC_URI = "git://github.com/nanomsg/nanomsg.git;protocol=https;branch=master \
-        file://0001-allow-build-with-cmake-4.patch"
-
-SRCREV = "fc3f684a80151a3319446fc96083a9ff384ee4fe"
+          "
 
+SRCREV = "ccd7f20c1b756f7041598383baffcdc326246db7"
 
 inherit cmake pkgconfig
 
-- 
2.34.1


