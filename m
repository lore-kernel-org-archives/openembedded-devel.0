Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0514106FD9B
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 07:30:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10647.1773387002459179318
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Mar 2026 00:30:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=A5Boh8zU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7532e9d984=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D4b19v4081760
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=Pwbbxvj7foVcLtwzyPiZI2T3/kITMJRUlR36BQmYaFI=; b=A5Boh8zUkYb9
	Xz3zNnZJFTmt5TNTj8kkswKzGTEyiAcPT1lB0zuRh0KNCVqSRhpHCGO0iUpp/HPb
	Wqv+C3suMSLIH8kx57Eu9rOWxPEylmiH0LsnwunwLpCSWi7o1nGP/Gr0/1oJIVvN
	QPrpEsN6Ln5b+rfFjvktsLQ3FzqijZDKYv+Ub4PABVQGWTWQnNMQjGTlKX5goBhv
	zG38puxSYVoHCVXKHQU5YtiShA1Ck/0kNRV1pXbAE8e5G/klr1bY+GrJsRjv0DKK
	zrB74CIcNDOEsMbx01KSReBHqHcCUIZ5zFRKYZRKyQ77FPklpK+r8ZWFN9OYRDi3
	BVRt9PlCYA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh6pstfn-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 00:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MgBnA5/2BowbkNtAqXb01nUUA6sjLKZWToYy+h8/tJyIr02HJVmOLV6E1yfZj8suTiasgXOtAahy8a+jegS5IXVHLLyR+p4LBaczSmKN6xykQvlawkWyFkdvwO70BE+2i97WrhQs8no0mSKcRxYfMZjpel3xkEHqi+TlmsnteuyzvKV6hBtK9k9HlXd8sOSDtaCcihSOJnmS0WdIwp+3Do8zjfdaAfWQ8B+N53JVtD7O5u+g9l0q3f02MLTELxenXis9aK5ikqyrvy8NLZlMRjgUvNadTyvmP97JtKya/4LOx6NAvYr1Ygm1RManWpdmSIIcCxe9zcApjZHQjMaZpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pwbbxvj7foVcLtwzyPiZI2T3/kITMJRUlR36BQmYaFI=;
 b=bvNz+noSRy3oeMwUVZCNkAE7+R4phaSLnXs0C7VYl2mrq0EaHimnCEwFZu1SKUI+gwuZm4d3aP0GYoIM1ZKoJRXRnPS0SNluvHZEgojW7ND8NI6UEzl1yl0crVEusbziw9MRpp4jxDTHtByAls9rjdFQUYw8YGm49Y2vshtq+aLV448UoSjTOBicETc+tIkWEtMmygBV+/kpEuZ0sYw8+Bpx2HDdadzNeiKAsQ4+PJnmH7EaXhKMYOZUFB0iDz3STZ2APnSV86FQxTaj0Y6Ew6F7XFR49775bfKZKddBcbeglW0etRL2WHcmksHO7QkAjJSv4qkwOxIsQ2P1ajgQaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MN2PR11MB4645.namprd11.prod.outlook.com (2603:10b6:208:269::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 07:29:59 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9700.009; Fri, 13 Mar 2026
 07:29:59 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/4] lockfile-progs: upgrade from 0.1.19 to 0.2.0
Date: Fri, 13 Mar 2026 00:29:46 -0700
Message-ID: <20260313072948.2254502-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313072948.2254502-1-Qi.Chen@windriver.com>
References: <20260313072948.2254502-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0123.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MN2PR11MB4645:EE_
X-MS-Office365-Filtering-Correlation-Id: cff2c807-66b1-4d33-61f8-08de80d25484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	BFdohffXfRBq0JZyhJhv7jN+cJpz2ngl4hmMrXiaUWyAIHH/jrc/tBZU1+ydI/lomLGyzHrCT+eR3larFT5l+y17R0k9EX3TsGJxfFHg4Z1EjrirqHeIRTD5O56X1iEpdZQc5LKsOm7ZAL3R9XZ4GZX6a4EbL2kUp3ECmu3uLzKTuq4ydiiLGI+9ip8Wuf8wZr24YA1n9snZeoMwFOjyEGaYMhgwGiuIMYbIjQ+5MyB7LvnINXbDS9T0/s6bRiMUeVL3SsaDbyPNkLpWU5s1EqhvM3VLytucJhQazRMgrt97cd2Hj9LER4+jifVyY0cQC1u12E/uQwljqQd5639RV5BA4r5aJKs5DviPY934FxjdraCug9sv4qWGF7OflmAMWCkoyio3QUIQGbZFDv4sWimNfzV+22+opX/RL1oM/7B+YQJtco8RExhuDrRBZ3MXBDy778zyWq42Br+1ajtkyh8khNAFGrvXWFavLr/4arbgfbn9BruHMNjar6rkRYt99+w3QVIfKWE7cRsxwyl4ldwE9aNc5XhjleRRCHf2Q67FNyMhfT/48Q6oKlwVZdCaWTGU/6+sSX8GSPvhjPuy8UBJJYuGYTGamkKC1GYEwClim/4iv8qw3kgwUS5P4MGvHc2Vrlv8SWplURh4fzLHp443r/BhorUnK9BOvjwMV2Xyk95ht44cE0cseqGzBHftWQaHjZpL8YmKhqUvmFs7C/EX3dVEb10eA4UpdNq/FZQ2XrOZ447aa5gC1NSBErrbn4LDMfSHeV+OvbijvooSFaI0z9RfFeZ+NoRDnsMb4tI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N8Q1/H0lIee+8vyXsRKguSWuZNd3p4ehJvaxrXEaE0IgRsIO1VY1xiZsvCUV?=
 =?us-ascii?Q?i+7P8j/u+Sh1+icpuDEQhAOKTHaPqHEdG3oCYeSAJT56NJOTJrq8pWt2RQwP?=
 =?us-ascii?Q?pmkrvEO/S6yjlLWCCQQLgXx4a9DwoxvEJhqJJX8xsxLxoFCjevpC7sNsMfCY?=
 =?us-ascii?Q?W2nUAXKPSg6+tp5O0EZBEtcITQl1Rsyo6emqrocQRx2d3WbzBGVqqWeRhiYU?=
 =?us-ascii?Q?aDuyqwH5yoPiTaGvkgLrX9KcickbFrR2KTvojpPceuLohd/cR3ND1ACwqQuK?=
 =?us-ascii?Q?8CJHS/quiNWOaFkdWxWzjOVkoYhFiIQR9JBKko+5pl3yfXk2ciJPWWafyxcV?=
 =?us-ascii?Q?kRlpnBTkP9qOR3UU/QmT2aPvMXPF+vF9g84FhGcKnY14Cbs53qeFcArsYnij?=
 =?us-ascii?Q?gKDidcRfoaJ1fTOXMJn+R4Gpp8vUzRyJHKVCvvbV5Mcg1JTTp2fLsD4Pfwju?=
 =?us-ascii?Q?dZMx/y/GXbhy/MP+DcmRdYPXZ3KUo7na+5qx7PokKjMf7xzF4bpeJp7CvISu?=
 =?us-ascii?Q?Xxw7VplswsB8H+5Dd9T4fbL4BeJzbvRNtrnzHYb0B+q+bBAapLBR4q0Vbxfs?=
 =?us-ascii?Q?qmEyPf8mwR0++LFqbS6FjTP5s5QRpYUCt2jxNUuySzsyBf18/ZQ1ryRwz5Xq?=
 =?us-ascii?Q?/382JgtBoaqqzIN8uQmef9kX7Ep763S435DuwnyseM0nxD8XDIHWEgAhfoch?=
 =?us-ascii?Q?rVlcDPSRbX0JTCe6qdchOvrRWk2A8iyLG6lQaIZGVKoXACrHvU3sWojXRwcX?=
 =?us-ascii?Q?rXr97aTFS5TfyrUDv0HRqNVw16PM8uA3n0hjFZqbS3OIwZxbgrGXUM9wrvgP?=
 =?us-ascii?Q?9t6/chO28OkW1G3RAHhIlHu7tzGk7RFPLXinZ+iSIsiIrT1PDB7Y1S54tMuE?=
 =?us-ascii?Q?Uf+mriSp90Hs3YYBs4Z3KBroSdNg3sFwp7fWW07ftRdo0+nnOguU7+MFsvq/?=
 =?us-ascii?Q?ruBfAbFIpvCHHhSIIbZnVtN2z4q6QEnQQrLe6A+zKjCuepNbVJ/h5/fcRd8Q?=
 =?us-ascii?Q?95395jlxGCudoqppx9WHd6ahPfOiR7L9NEX5N/fR12/hcRFKcPacQqwaBajZ?=
 =?us-ascii?Q?aHkZRfRff7VWu2fWOGytswRXPysUh2XtwLIqZIiEy4zDxB5I5C7g/MYgaC4i?=
 =?us-ascii?Q?OghZxTv4APio2XqxUaavM4Cv7inwtJCTbyNFoDBmaofyhTrR8eRSKdfeygPo?=
 =?us-ascii?Q?QtZrVp3dA5AenuhNOnmobN72fp9NnErGXlfot88VpedD34o88JfRIJKb+8vD?=
 =?us-ascii?Q?4DQUtjimbzj84tqc6zqywZLTp/+u0HzHzgePuuFQwNS40KI08OZAplxLde0B?=
 =?us-ascii?Q?hggiLX/ga9g14bUjBIYG2/AQ3egHA+/bMF5JJA8ARMifjjqvt/l8/OXxKH1u?=
 =?us-ascii?Q?FzO8XPcIvOGZcXMEtTA9UltBTusSdwJho98bQ2SF1Eyk7725QB3fZV1RGY6g?=
 =?us-ascii?Q?0fZnx8ZsCc2GlJ9IahJ9pDfPkxeasXea5xF3pIOxbd9sFlnIMb/7baZGChGl?=
 =?us-ascii?Q?hsFehGdUdLV6qtfGk5hbtm8WEkvu3+6r6mFEeLUc4kkEVG2leuyM0infCjVU?=
 =?us-ascii?Q?0tYiIZbXmJZ/Qc/+WmMmkSLFegDrJYk2mPmE6q9f8Ty2GGRZ+LKvUr5tfDUZ?=
 =?us-ascii?Q?yQnbnf38wsZ8SonspBzIStvf4BuI7xZ75E53ZTjhn/BTRSqYN1suVIoYQvmI?=
 =?us-ascii?Q?9dW6Q6JvvRNy4O4CFv6Qjx6Yx8kIT/+87epAzoEuCZTKIE5o5Ec6+p6cIn22?=
 =?us-ascii?Q?VYVb2YXxkQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	wIbXrMB1UP/zsyG87LNdyXWsG3OPE5s3VY5gP9c7RgvqT8tJfv/EM0vQTagzcnYR4+JEVXptgIKCnfllIN4GgFZuqTupQIvIn9NJpigitiuNPn/83TXGPJR+WoGGd14Q//tqEExwHLaMqrFtiPwbKWoyOoPrISJp1vaJ9xBw2g4+dZl368NKUGjgtSG8lFaG/0SXqcIRfwzz31fs9Ds04PfkiwVCwM40GeYmwbKaoCCLUb09Ik772Cjf+o2QV4Lx6py8Ron3qaCf3qsDeKQLpvki9TIXDcdqJPzd/I8x1SigMiqetV6lDVt7KtzBXE1PxUrzOye5slHWNYE1JmVTtw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cff2c807-66b1-4d33-61f8-08de80d25484
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 07:29:58.4108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtAlCm83p5y2lLCULaCxXkwquY9bUhrKB7KNhroHBycey3SPTfGzqGMxzRbNBdiXbauPQWVctALnBZKzqO4F6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4645
X-Authority-Analysis: v=2.4 cv=ePAeTXp1 c=1 sm=1 tr=0 ts=69b3bcfa cx=c_pps
 a=WVTIIPXEjO/6WBYygohQVQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=7zQfPaYUCcVhg64d3hQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Z8MVDil2TjMqOojcSdiHgGc1tHENmCnh
X-Proofpoint-GUID: Z8MVDil2TjMqOojcSdiHgGc1tHENmCnh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1OSBTYWx0ZWRfX/ScDDDFAnoLH
 AZGQC7PGjEcbRF0HM6xHZmvA1T94F6xEjrpdcdgMg+xsjnryz2g9D6QjvwS7e9gl38rX/GzC+0E
 RboxYJxlWyuZLce/bIwnIMBMPq4eN7HmKEykeFdLwavC+K7PcDqzPgGzagJ30/6xH2xUk7CuQSb
 xvtYis2lw92VTtnp2aINBSSB1B5LDeWGgPDKK/www9uWO1KSLN7+i5AUgYl+NrN6Fe4tNiCjgEv
 sqg/UWowhtmTU2LftBuFmbJ7DP4To1OejbCjhDHJjD3FgCAf8BqYzu+/wJ/AyujGYqcpBxvCCFx
 qopZGErpAUJobOz+KRPvQfcElMjqD1FLGXW6bNLmtxkQgrccLfjPY8iaMzm3xugE1mE06BGVJb0
 C7JljuvZegSdMMaxFt2bMrL6Y+ZQT8U77PuA16tSVb8AiES53ZjEfODOAWON97ByIdvbkGntZ/J
 I69ewIJpj3yiuRUdj7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130059
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Mar 2026 07:30:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125183

From: Chen Qi <Qi.Chen@windriver.com>

In this new version, we need to 'rewrite-time' first as
it's a build host tool that is used during the actual build.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../{lockfile-progs_0.1.19.bb => lockfile-progs_0.2.0.bb}   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/lockfile-progs/{lockfile-progs_0.1.19.bb => lockfile-progs_0.2.0.bb} (73%)

diff --git a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.2.0.bb
similarity index 73%
rename from meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
rename to meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.2.0.bb
index 834687b43b..a8c5bab78d 100644
--- a/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.1.19.bb
+++ b/meta-oe/recipes-extended/lockfile-progs/lockfile-progs_0.2.0.bb
@@ -8,10 +8,12 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 DEPENDS = "liblockfile"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.gz"
-SRC_URI[sha256sum] = "2c5704b01c8f474f82921780e4592a927b2bf6a6d7616354a6c5d7cd5664857e"
+SRC_URI = "${DEBIAN_MIRROR}/main/l/${BPN}/${BPN}_${PV}.tar.xz"
+SRC_URI[sha256sum] = "2988fb5a8b407e52e2aa6282ce45497f465c921d591138c100f4898215844c90"
 
 do_compile() {
+    ${BUILD_CC} ${BUILD_CPPFLAGS} ${BUILD_CFLAGS} -c rewrite-time.c
+    ${BUILD_CC} -o rewrite-time ${BUILD_LDFLAGS} rewrite-time.o
     oe_runmake CFLAGS=' -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions -fstack-protector --param=ssp-buffer-size=4 -fasynchronous-unwind-tables ${DEBUG_PREFIX_MAP}'
 }
 
-- 
2.49.0


