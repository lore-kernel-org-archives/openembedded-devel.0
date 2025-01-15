Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15771C02188
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15807.1736925889311392013
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F618DD031512
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:49 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt73qec-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs9U8tMBpWmRmS0zpRDDaDOLvrVW3YPwRCJ4L9QDD7GijNbAo37DFR7obVWD0dPgCuuIghzOHO9conmtHiA45606Orm2wElaZxFjfLSupZfRQqjAKE9ZgETgWiB+Cr6RgjiBjNzhNpXEUl60U2zpEC1K+aqV3JlX5cCiodd3yeAsTTfTH2YkrKWaf0KjWyW3JwoGlwZxOKjHL4ONP046wL6vHhn9i07oDU+Ezb2XHh4UVm7Uv4DK2M4i0noGPeMsSLZr6y91v11/7v7PSp39Z1cvQcLrSBMxUbKdSQAUkXxiaxV3IBGX14MKHnyPaKmXWquoUQh3Uyi6u/8uDwz2RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c4JZ4WbqWZAwCDpvShfNdOx+52MkzuvnPVLpFojnj/0=;
 b=s+qv1pJAZ1MctEbCrI5t0KaGBGxngm+BPblFkh/20xgcEtT1W9qNrK7M0l0AZhSi9bBRLlqM7lTTZXw1dAceHLZbWOCP29O/vsqn04U/ajKEbPYM6N0HPGkg/Wo1YHX6H6nZkNRvhwX5WRkYvWs8KV/7wygf/N0ExyQ92fWi04/8gjt46mzD8RwIeIAwSiem4UBHDwq0NAENIvSK6yUaeU8c+tu7yV+V6MGTkRBsnkedc+iRgvZEZYvnqqNWOcSbOdg/PMdD/61a7MwPJOKQYoOfhvGMQ1BHsANlkU1nJXKhOYFhcOZFZew7LTtBb+LWnirCOS0AmATuJREPuOWaZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:46 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:46 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 6/8] opensc: fix CVE-2024-45618
Date: Wed, 15 Jan 2025 15:24:26 +0800
Message-Id: <20250115072428.3667416-6-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
References: <20250115072428.3667416-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0112.apcprd02.prod.outlook.com
 (2603:1096:4:92::28) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a15f4d3-890d-4b23-83a0-08dd3535b05c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5TIvOb7H2kVyM9BgXrKK5FN75HKemJ3WsW982OgY95087/IVr0davl9AB/Jk?=
 =?us-ascii?Q?ifbnduKX9ChYsm86y2BOtsS2d3ux7RG6pkMa9W6i8/9OdIsVvnzuolaBvIKH?=
 =?us-ascii?Q?GwQSM6nMVLb4H3FCJliUcCLnuZXZnC9JO5G9kZl85mDwJjj46C5K3OjvjrKQ?=
 =?us-ascii?Q?jUbFpbCZ88Cyv37dmnZCU1nC/NcO7d/46eP35IuAyRE7Rc4/UWqFqMUVzdXA?=
 =?us-ascii?Q?kgRSVDqLYWmONFhU2ztq7T6nhVp/qaO8VxzP6ORnxm+hMDoKO6CIFZAAeVEc?=
 =?us-ascii?Q?SonW5DdD46qmEn8HF3+qQJns3QiLNAgEaTQiyn+vjrwURcu1a4vDgArdzwlG?=
 =?us-ascii?Q?AJ/HA+wNoX2clal7EXcwJGPFpWKxuSb7kmKMfDAesBu/CF/Dex6wI21V2CQ+?=
 =?us-ascii?Q?FGNjR1llUe4xVB4u/g/FIfPHEyATr2I9MCbV/MFZz1SqR5ZbNJ68ATsAknm6?=
 =?us-ascii?Q?SfAbbWggtor1hk3rIJpQVZE5g/IcnRtu5wwIZnm4rIw9SU+buZgJZvnZhpqU?=
 =?us-ascii?Q?6B+UTMuPWqb7hv0v+qbHJSIWwutHYzi1FkotLuA5t5HBT3da4lJrGweN0s0t?=
 =?us-ascii?Q?H5MNUmGgKRSoEfkYuUfQprfLtJXu47gB1gPz0u4a+aRHRpASREMdK1dmMJ5S?=
 =?us-ascii?Q?RBRte9hZkNchX5BxRjM30NMrGmdltKzgtBeeUM+Lvi9qLBEQaLwY2OaQQ8PG?=
 =?us-ascii?Q?MwFTnIHox+omtFhy3C4294pZn2OBHeMqdoLF0xxfDLAZu9kNsPFFwTCCS5X1?=
 =?us-ascii?Q?XTSzkH7CKd3ALNlIegPES9jMYnsh4EJy1Zo8TRh6KUVYLBg8RS0B4UqxXR9p?=
 =?us-ascii?Q?GAF2H9zuQs2feCnvOXtVBDgrfqWFJOV8r6pn0rUXADt924uRySRTQoEtAb+w?=
 =?us-ascii?Q?bXqJ5d0C8k6umjZdI1e0zrzQFnU8bpkBW7MlmRhd9auaTe5W56CH65OJkjaE?=
 =?us-ascii?Q?KhE3rpEzjl6i0VIY4eUxcmG07xPkCJFta4GENnpmPjBQC27qflC+4JWBoReB?=
 =?us-ascii?Q?TFI9VUGFQKRUDKrrzXPnZEM+MedS34iXiAgPn3rUygUXNewtCfnfD8KGS0c/?=
 =?us-ascii?Q?d/E/KrnSLqXUE0O0oZ3kjwMsvKxDHa+uLvj9kN9MczUE9BsV1hYKJPKJlaEX?=
 =?us-ascii?Q?BpL95DBk18n9AKz7UuDfaPEyMoJK6VGUbK1cS5Hh6qqPxyKZMW30UmUmPlIY?=
 =?us-ascii?Q?wWMnkIyMFwmsAdfvcz2Gk1q+m4YBdP1vqLwLPi//OBi8MnyQnoeMblZ/Ewy6?=
 =?us-ascii?Q?VxKRXI44ompI9D6phsWET8BxgfMlctTnfi1gW2K15aFrCn80xaxj5xQ9EAmj?=
 =?us-ascii?Q?QwnawOGeiaEVPh4BcGT18MUY76/aKKBFL3Eht/mIVOcJNLCuOh7ZySpprU3D?=
 =?us-ascii?Q?ulL1md1AAA4nO6RglDODCHdw5JxEro0M+mZ03QTbPD5ujQH01w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5YJyMTUkQdqs9yL6IXqVuez101MQPQOuIUxX1XzgXxh7mtT60+Hwc3loz9yP?=
 =?us-ascii?Q?xdqcAoLxwV9bQJobizAj4+BfDByDjLAF/DBIb0czUOrnlgE/RRqkwwJ42Xa6?=
 =?us-ascii?Q?NXiox9P6P7V5EVeJfGSecjNsceo8JXGmk/fjXquVAzQTMf1PYWPsomuXUQMu?=
 =?us-ascii?Q?atwPZHfnc9wpbIx7oamO6quwjIG3XHsNcCrtYl8hHS9h1hcyv2WannNMfFAQ?=
 =?us-ascii?Q?W+Kt+KWcw3QD2Eu+8YtBU2Ld3CPwP3U8oEQcTpMIXknICbxKImD9B4zIOJFE?=
 =?us-ascii?Q?Vs6LdUvLLLyTvkBRsU/3ODRoyqzrGzSegjSxE2kdGPA+2VsPms5cYEdDx7vL?=
 =?us-ascii?Q?AGcMlomYAkNNWv0D2LtVxeTix1kk2At62WsTUorKmpXBDZRsHQvLKbUClGK+?=
 =?us-ascii?Q?VGjAujVm8/GA+rVwEyN7xgK631qzJGbiom4tM5ZutxwcqNe2dGrwqWQ0hKc3?=
 =?us-ascii?Q?YAkxoirurRQby5sXXLad3QE9ZeydEPpDXske2ZJyZ5HMysUtZFCH/T31wCtE?=
 =?us-ascii?Q?st318I9lC2zJvUgIKqFxzP+GnCVKmL6NeQRe99grru0FKsdenGayG6Yj9vOM?=
 =?us-ascii?Q?PCBEYs9AWCsU0wiaNeCHJAQfWvttu0bMacjSixTI4VzTuuk1ItFdndwRFmd1?=
 =?us-ascii?Q?34uYGzQ7Fou//1T8+cdVfeHfREOuKQwZ2ZMsypOjSeAQiFDpr0+nuZfJ6TbR?=
 =?us-ascii?Q?4/Zf9FFJnecuB+Zp4bDyLJdgVpe+W+9YhnPM1xsS+2bD0/2qlugJGNE3Os81?=
 =?us-ascii?Q?IvIdu7nBo2IUkl9MkyuStkUV7VkZsAxMUWcggXt4jEIRcZe+oNX6fkD13+/S?=
 =?us-ascii?Q?MG/jaqWW52qSau5bqzRjrEd7YC1MDGYGcMxIRnQRhyWdDGQghUG1GMo6lx6M?=
 =?us-ascii?Q?YGZF+7I37+HH2HIeUl3cpeTcV5DHxLGXwtQel3kbM699756ZLCMI+OS1agk3?=
 =?us-ascii?Q?18DWlS1k6ImoJQsv1iealhGwhtaRUrmkQcodCVvMKbepJ+M9PVUExRYlWqdA?=
 =?us-ascii?Q?Tj4YJtxZc7rBGq9qqdT1zYvoBjkycDiaw3LphLc79oBeDMMB3fUcxCPyzVXZ?=
 =?us-ascii?Q?8ons00X1A/ycSp4l71zpN1/6yp0RBdcaFV804jP+sm5NwAhRPZM8VAsqdrR4?=
 =?us-ascii?Q?vB+KcU1Qs4LX4BuQpirnIOLuiHhnotMbW/ElI6z8fg/uOUdSLJUvTDLfhbUS?=
 =?us-ascii?Q?993OFvJYoQ9KtmwIZH6S0bLdepy5vJrxht7o7EePxKqy1RbJg0NrEJ6x6MUT?=
 =?us-ascii?Q?X3hjjMEBfr1i9ML3a536gd32y4teiqmFPHnKNPof2jeWYN7jcGyzoXoLUA2/?=
 =?us-ascii?Q?nMTSyajWuM1BDJkZG6G0q5MutSqWmGDTx0sSTC/Ngyb/pTWyvfMKN93xATYZ?=
 =?us-ascii?Q?AjA3G2l3brlp8r9ZtsgT6wv39H2kW419UBaKnu5Z5hr3ZdYYVlqZLxpTRHWD?=
 =?us-ascii?Q?iElOK58557QSMcOKrbpf52RUfnwb5pzdUAprVxDfbLFNNNswn2eMPIOIQf+p?=
 =?us-ascii?Q?kTxX2oQrDq02PiCAQaInZVYW4BFk8A4xb8J2upUtMLqj0aEu8qgvjOQEya09?=
 =?us-ascii?Q?VVeO12linPD0iCcAINXXimfHtNP5wiEdY49YH2t9WbcqHHDYIcqh3x+QlE8e?=
 =?us-ascii?Q?sg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a15f4d3-890d-4b23-83a0-08dd3535b05c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:46.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8Fww+8NeLHRp8MEMH9pcQLUtkHhY3iGk8S3nlHkssxMQdzlQTsxq/0nzB2mYJMGQnnLJ+poYlPCMLNbupAq4HBQLqlzzOe+DBp47rSm3mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Proofpoint-ORIG-GUID: A0AF7Qk7q3FtRZrxW4JWGjuOu5UznsN1
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678762c0 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=yNajnoY2KA0B0FGqRo8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: A0AF7Qk7q3FtRZrxW4JWGjuOu5UznsN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_02,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501150054
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 07:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114890

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-45618:
A vulnerability was found in pkcs15-init in OpenSC. An attacker could use a crafted
USB Device or Smart Card, which would present the system with a specially crafted
response to APDUs. Insufficient or missing checking of return values of functions
leads to unexpected work with variables that have not been initialized.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-45618]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/8632ec172beda894581d67eaa991e519a7874f7d]
[https://github.com/OpenSC/OpenSC/commit/f9d68660f032ad4d7803431d5fc7577ea8792ac3]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-45618-0001.patch    | 42 +++++++++++++++++++
 .../opensc/files/CVE-2024-45618-0002.patch    | 42 +++++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch
new file mode 100644
index 000000000..76311bd1a
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45618-0001.patch
@@ -0,0 +1,42 @@
+From 8632ec172beda894581d67eaa991e519a7874f7d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Wed, 17 Jul 2024 11:18:52 +0200
+Subject: [PATCH] pkcs15-tcos: Check return value of serial num conversion
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_encode/21
+
+CVE: CVE-2024-45618
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/8632ec172beda894581d67eaa991e519a7874f7d]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/pkcs15-tcos.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/libopensc/pkcs15-tcos.c b/src/libopensc/pkcs15-tcos.c
+index a78b9aee5..9f44de6e5 100644
+--- a/src/libopensc/pkcs15-tcos.c
++++ b/src/libopensc/pkcs15-tcos.c
+@@ -530,10 +530,15 @@ int sc_pkcs15emu_tcos_init_ex(
+ 	/* get the card serial number */
+ 	r = sc_card_ctl(card, SC_CARDCTL_GET_SERIALNR, &serialnr);
+ 	if (r < 0) {
+-		sc_log(ctx,  "unable to get ICCSN\n");
++		sc_log(ctx, "unable to get ICCSN");
+ 		return SC_ERROR_WRONG_CARD;
+ 	}
+-	sc_bin_to_hex(serialnr.value, serialnr.len , serial, sizeof(serial), 0);
++	r = sc_bin_to_hex(serialnr.value, serialnr.len, serial, sizeof(serial), 0);
++	if (r != SC_SUCCESS) {
++		sc_log(ctx, "serial number invalid");
++		return SC_ERROR_INTERNAL;
++	}
++
+ 	serial[19] = '\0';
+ 	set_string(&p15card->tokeninfo->serial_number, serial);
+
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch
new file mode 100644
index 000000000..82e52e3cc
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45618-0002.patch
@@ -0,0 +1,42 @@
+From f9d68660f032ad4d7803431d5fc7577ea8792ac3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Wed, 17 Jul 2024 14:56:22 +0200
+Subject: [PATCH] pkcs15-lib: Report transport key error
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15init/17, fuzz_pkcs15init/18
+
+CVE: CVE-2024-45618
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/f9d68660f032ad4d7803431d5fc7577ea8792ac3]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/pkcs15init/pkcs15-lib.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/pkcs15init/pkcs15-lib.c b/src/pkcs15init/pkcs15-lib.c
+index f297a5f48..f4cbaa694 100644
+--- a/src/pkcs15init/pkcs15-lib.c
++++ b/src/pkcs15init/pkcs15-lib.c
+@@ -3767,13 +3767,15 @@ sc_pkcs15init_get_transport_key(struct sc_profile *profile, struct sc_pkcs15_car
+ 	if (callbacks.get_key)   {
+ 		rv = callbacks.get_key(profile, type, reference, defbuf, defsize, pinbuf, pinsize);
+ 		LOG_TEST_RET(ctx, rv, "Cannot get key");
+-	}
+-	else if (rv >= 0)  {
++	} else if (rv >= 0) {
+ 		if (*pinsize < defsize)
+ 			LOG_TEST_RET(ctx, SC_ERROR_BUFFER_TOO_SMALL, "Get transport key error");
+ 
+ 		memcpy(pinbuf, data.key_data, data.len);
+ 		*pinsize = data.len;
++	} else {
++		/* pinbuf and pinsize were not filled */
++		LOG_TEST_RET(ctx, SC_ERROR_INTERNAL, "Get transport key error");
+ 	}
+ 
+ 	memset(&auth_info, 0, sizeof(auth_info));
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index 89e2e0d5a..641d6a807 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -44,6 +44,8 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-45617-0001.patch \
            file://CVE-2024-45617-0002.patch \
            file://CVE-2024-45617-0003.patch \
+           file://CVE-2024-45618-0001.patch \
+           file://CVE-2024-45618-0002.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


