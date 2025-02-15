Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553E1C021A0
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 16:17:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11855.1739636224637849626
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 15 Feb 2025 08:17:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=414158cd6b=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51FFh2Kn031366
	for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 08:17:04 -0800
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2042.outbound.protection.outlook.com [104.47.55.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44tq380a08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 08:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mi5PpmVuT8ew85ZpaVyCvt8SbHrAwH7LW6fNAdSbgfhYodVKUjA1snYDGvzalvGp+pcqwGFDbgsAh+ahhJ86v/5O8WZqZ4cr8n5i0MP52OKL8GhI6cFR9S2MUvD2o/MZk2PJYMvcWqaszFpykDIWFSvkkWvbxWt8kiidEvwkNFg2DOGQjj0XYL2lPfLh/7hbrtJcepzIj6LsRzqSihLTCLVtf5pDvb9w1NXr3H8rkxmJG68GOn8eXfNNDJwS3OXhU5pbsqgm3aME5XjGCVVZ+zATrg9C38/Jk8x1JObS9xAZxuafgOfa40J9CGKkyTEdmgv5b7sKT2OUKWBFVJV/jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H4/aw64RigYYKjsM1LD5XdU3xHsmrZ2z/uFvnUngs4=;
 b=MpUqKG60Bm9y7LWt1PUD/hbEYEp2tvjnnvzadrz7LnS9NF0hyrPkOZNZkpmFcXY4fS5UVp9E2/8RMf8vQY628jC5pQhGtMtc29SYnUdgdVU7kgqv+JolGnaipWEHcziXpjqI85eUsu2qHHI83SM5Vl9bjJldLK0hKJldY7h2Yhl+t4KYFJEepH3iWv/UwBz1939SSGnroedX0jEQbO+uLu5JJzcnZFSAGdS9vF+F0J+PVfpxnN3cX/3Ovy5z0/xwNSsVE3qQ1bdbtnZ4UDASghqwWu3xv0PcJDcUl9uJw2A3jLsYMWu+RHNh1BRnGJxsbKao7G1APRAqEf36+JlF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB7553.namprd11.prod.outlook.com (2603:10b6:806:316::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.15; Sat, 15 Feb
 2025 16:17:01 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%5]) with mapi id 15.20.8445.017; Sat, 15 Feb 2025
 16:17:01 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lapack: fix lapack-ptest rdepends on lapack-dev
Date: Sun, 16 Feb 2025 00:16:49 +0800
Message-Id: <20250215161649.75330-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB7553:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b50906a-b090-4d82-af50-08dd4ddc2d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?misby6zg7gaH9MgJAW9VNRfyuzV4O2ymjM1eW2ZgUT1sWPlqKVhhofqHz/ON?=
 =?us-ascii?Q?MoHoyVTZ3W2VoN5Zi57HF/yvn8opUIHk3KJbKVU7u+p51+XGY1ARTaaFFGTT?=
 =?us-ascii?Q?dyRG+GPB3X4rZ2YvkfwVdhFOXdWlpSji0bMcMi2x7Ii28AxFOJGDMC9gfXH+?=
 =?us-ascii?Q?egslePfzakaOJbsPs8eYmta7xwwa98RXCBldhSdcCcxdnGL1wf5qM7BFpJ0y?=
 =?us-ascii?Q?8AHVO+N7SQ+lHjiKRYQp9Ic1OB9DjZq6siyHZoR6L8uvgviMHS3Zcc2mh/C4?=
 =?us-ascii?Q?9inXoF9pjm7D7ObwHi7JN2hxt7BqlIs++l41EGiewCyN42YIVz+AHml+SG1I?=
 =?us-ascii?Q?iw4NWPh74wkBKuIPf34sDcygp3IiFgrI1Tvh7wMb3718iQn5ekDSDpHut25t?=
 =?us-ascii?Q?S+ZyfPBlagG2lWKc6+d6m+kh8J/T8oLvECUx6PUitxjsI8s4E54DU4jiH0b/?=
 =?us-ascii?Q?jWVBc4CAIZ8PGOS7ryo/6LlBV2v8Ad9HRCySCijUOC5rrORoLYlWmmLf7XrB?=
 =?us-ascii?Q?+NAe5Yc4wAVg83JiTi8R9treEc2rZVhsol1TvsjD8TZq8cEmtlpCM/fwTGCA?=
 =?us-ascii?Q?dk7bIK4PaCy7IdmO0jwl0TFYYOjaFiMhKp8HE13oRWzsSyUYKOB+wyRwmrLf?=
 =?us-ascii?Q?wB03Qo3VheLPhNX6zwwbVvpkxl5R1EXhHSmSciGhXxRbwtkEoCMu/b+eytfe?=
 =?us-ascii?Q?wd52RFa2/2Cm9Wya0I9bMBJ6H19ZDbifu4ieA3Y03oVHm4qf3TqNHiVUIhar?=
 =?us-ascii?Q?GU7l3yVEVZGyB4wlQgMf2qoS8D0mImVMLdPtmnaJqZMN//r/pipHSAO+xl4L?=
 =?us-ascii?Q?/aKlTa2bhxhOchndyocMCxQvMi4sFwRZ0L7G7dbE2XJQseg3lgxeQtROJMP5?=
 =?us-ascii?Q?TcFaY3xi14GWrZ27iBe1r08gCW6IdgdFcgbvFu/afePnbOtdK65OF9f4F9P0?=
 =?us-ascii?Q?Nq5/OB82LKgNdgtL1cPzeQdqUziMi5M5CEQQtlsBjbf1ztAr4mbcIjAPInSQ?=
 =?us-ascii?Q?et0On+jzlW+OeUGZRkjbuLqIeUioOeWdOsx2xFgSe8THpcw7ruuFbuddKm6X?=
 =?us-ascii?Q?idOuH/3Ak1I+bwMEXdPiOjv9jool3L9AscPyeHvTH1PL5bPMJsEBurGaTbWJ?=
 =?us-ascii?Q?UXQzti1QuwA+Hz6xT8urnHoqjzEa4O0DEckuKPFarIu16iqYy0gDQPnllmwI?=
 =?us-ascii?Q?1CPmlfS1rS1A/PXXz17dN00303KU8PzbOWQax+ooqDQQxKGe6VziqKMT40ko?=
 =?us-ascii?Q?h0Teehwv0K/NfyjgYyPsHcGSIN19R/DaPjfBmv/YN+B904Z9msn1y2xhB3DK?=
 =?us-ascii?Q?sb0qGmlLB/qz9IgCha8KyZlA/XW9LU9FrTJF6P4NbLCpmp+/IxyxuhYoCo9q?=
 =?us-ascii?Q?ThOnw5SvmQ6a18qJX+lb+Qz7CMLrSKRZaIqZAp6o+b3JlRN9T8S5fV1h9HrX?=
 =?us-ascii?Q?knlQvT+Ww7lFDyRV5lg/pShCA7WKLxle?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mNKjD6OiQkJR/vw3bHE6ZXv/2/mTX2wRSIAlHNdPlTMkzegtxH3BHvAREdKE?=
 =?us-ascii?Q?Eon2BTHPOtCamG9sJX7mb0xt2pjQ7W2BLJ1btnMnw6M744GdQ1fOZwNhwwsW?=
 =?us-ascii?Q?+5/ssoaVViXNVmpvM+j8SOn0tA8xujlqeaE1DM5T/AK8zJbDLAoSFvwOfR03?=
 =?us-ascii?Q?KGK2Lh8r5hnw+As11CuTN9uh/i3eSnGpoWfYEkUH8QNqhajBJFIOBn+XLd1f?=
 =?us-ascii?Q?zP5jsIknPNVXGjvC38hS6D1Q2kcdtdw5jr6DDthWlf9jtwGaQEz1tvbYW8gM?=
 =?us-ascii?Q?UVk6jqPGZOe4qRHEr+Jm6Jbl13FYCc8MSq/PM/CEMSgX4CVvBVcFcw7gY14O?=
 =?us-ascii?Q?pQkqKK8SvR83K3viBSneOkv5vCZHLzEBBRGa4cfQj+wgcCekOaCX2kue8/Tz?=
 =?us-ascii?Q?tvkrRS8wDHzsYw1npvsn7qlGoIhl13eA4+fBkED0EcNDt8Fg7ydlEw6wr3ev?=
 =?us-ascii?Q?VEM/8Nv0a78lug8Ickc1tWiXHyGqZA64fCfRkRErz65eDqY3pzx11kZpgJnd?=
 =?us-ascii?Q?OJsbcurX/Av0z9VDT/WPhpkPFhQlkqwVKx+ij6d4N/mRW3K0H6BpUTzCl+1m?=
 =?us-ascii?Q?K/Z64MO+yxtMTPzia3/hTOyEE/t/AEOvi8Z4wr9cy7myfiVUjH6MGC5Qu4x8?=
 =?us-ascii?Q?kyKmEvLEcTAyt8IyXKq185yOxzRlRTDbE8tLqtItnxSiRFN+60uUSfyIDtj4?=
 =?us-ascii?Q?CRywEyTiS+DzeJxIMiwUPaUagdFpTLAtJt2EymHrTzuvZt4wtTZB72HA36Sc?=
 =?us-ascii?Q?/6Fexd2k5zLuuLLCBeIBIZsE5u76gZR0qzFGgSTENrrBmFsf7zmk3m65y0Y9?=
 =?us-ascii?Q?9VncB6gXv/BvDgXcDB+wGUCt8cwLrG0Ucv3UEM5LDp7mOJlrJLlkAySjCt3z?=
 =?us-ascii?Q?JDwZWho0QE1ntI+RRLlaSDpUhppi2wfjNup1N+Vu2iyEHwYkjoXcTYhlZWgB?=
 =?us-ascii?Q?BjpXWj2kYBZLxuqmM5r6q19JcvPkZ+I3vSyer8nd3YzqdPsZKsMgC6+dwdE+?=
 =?us-ascii?Q?wmSSIQS5cglopQkutBlWHTg/xxAM8nwP5dWsNR4Jj4IhWLOjjda+IwhZA5Cz?=
 =?us-ascii?Q?RFccQusddchwalDBFrXThXkI5Zga7o3UgABfndySm3KeVbksTgbqu+6w247k?=
 =?us-ascii?Q?tyOetKB1IMzuTdB587CVVtuZO/zZr9OCdavCQnqKoHpOorBKXm+cYABML3Sq?=
 =?us-ascii?Q?GPRN3m9Z4ax/6hZ5+ZGJy6/jihmIc83oc1oLWzextDUTgED5H4A5DPglkSWg?=
 =?us-ascii?Q?6SvK6zeAnza3ruZt8Ojy264s41dJM/YHiAyD+UzjQ3xw952R9pE96fM2Abxd?=
 =?us-ascii?Q?99yfk17X9KcpiaByQuo1VWJmtqiMwIVhDJecgUMNVdVUO54fF2T6feIL78N7?=
 =?us-ascii?Q?8tzGupASw1j6ZFg4+9UrNonTvckVkEEDhxP0hm97A3H8hDVsckVvJI20Gnlk?=
 =?us-ascii?Q?HVWgVD5NvduYrOQ/DzII67rvQBb3qPja6Y2fpOhkCUHW7zXp8QOE3K6C4ayK?=
 =?us-ascii?Q?YVk0nZIDHxTNas0fermO/+OrOypgqYoQuVdjyT8mfB3O8bLb087GVuwp74dW?=
 =?us-ascii?Q?OdnVarghZQNkRvy95fSO2nmsHxgjPjGNHZuo/q7z4UhVVj9HcjFZ7JfV8UK9?=
 =?us-ascii?Q?Uw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b50906a-b090-4d82-af50-08dd4ddc2d88
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2025 16:17:01.1984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usgwvD0IQvHHhEOW9vat/Vub/72LsMOyo6c8eErzlcN/81DvUCbHKXVviNSWYUDkkSLAOISOLIRllu3PASXYbTUpw+LJlmgdJbPZFWBG7dE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7553
X-Proofpoint-GUID: 12nLY_CaPZplB8qzy3ZSl9cQPi0mFEQE
X-Authority-Analysis: v=2.4 cv=fLPD3Yae c=1 sm=1 tr=0 ts=67b0be00 cx=c_pps a=SXeWyiAXBtEG6vW+ku2Kqw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=ztCK8XmhQVQBSNr1QT4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 12nLY_CaPZplB8qzy3ZSl9cQPi0mFEQE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-15_07,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502150144
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 15 Feb 2025 16:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115496

From: Zhang Peng <peng.zhang1.cn@windriver.com>

When LAPACKE is enabled, the QA check fails with the following error:
  ERROR: lapack-3.12.1-r0 do_package_qa: QA Issue: lapack-ptest rdepends on lapack-dev [dev-deps]
  ERROR: lapack-3.12.1-r0 do_package_qa: Fatal QA errors were found, failing task.
The root cause is that `lapack-ptest` accidentally installed `lapacke.pc`,
which is a development file intended to be included only in the `lapack-dev` package.
To resolve this: Remove `lapacke.pc` from the `lapack-ptest` installation

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
index 87a5747246..f18ef1f292 100644
--- a/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
+++ b/meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
@@ -88,7 +88,8 @@ do_install_ptest () {
     rsync -a ${B}/LAPACKE ${D}${PTEST_PATH} \
           --exclude CMakeFiles \
           --exclude cmake_install.cmake \
-          --exclude Makefile
+          --exclude Makefile \
+          --exclude lapacke.pc
     cp -r ${B}/bin ${D}${PTEST_PATH}
     cp -r ${B}/lapack_testing.py ${D}${PTEST_PATH}
     cp ${B}/CTestTestfile.cmake ${D}${PTEST_PATH}
-- 
2.34.1


