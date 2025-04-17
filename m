Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CBAC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:05:36 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3718.1744877131864061486
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=62023c0ecd=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H60XU3002201
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:31 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2043.outbound.protection.outlook.com [104.47.58.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 461u2ma8hp-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQwMJ4N18brp5uUoIT/CEcbTBxYee9DOVrxi6DA5itMhCJM4MzmcjnBH987rEOJoebTnI9INW4KSqDTOiHegjgIp0HnVG0dImxDN1lWgs+KyfjyMCHKToWOslD7MzNsNc2AW8AD0yAwlLJXLXv661Rmxc+my1egvn0wZ5JnK2tsuuDMx3zmDMenqpHKVm5Lw3/8ZasNeN/G1cHvc/zqQ9RS0g9mT4FuDtOiCky1Uk2prSQBQWH9h/QL9relMPU6tp2dJnFvo34NB35+Vbik1dsKZ6Cp7ZDYFw0S17J6MnsnK4XxNqHuJhdcrO2GOmn9ylliV6u8yxez7PoMBkNuUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hjPDwb54j1brogoiuscuPoa/gv5Z0/RmdQpg04SXfg=;
 b=ovh/gpeE7a7lCQglsYSFRhM+2qvkCqK5NYzhDkK2zzurO+CXaa7RTJuvjWqeqbiEhVbng1FKO900frYd22pE/X2rkm25HVwTNrDqdliR1zez4lN95IaAsXgPSFAXl3sZdeX5IE2LcBO3HBGL4sQv1RgZCWZkhpdQ51iCWPQbZF/Mmd6cjt5z75/Xv7lZ62dA/ok8n/3HYtPbRKcMEtnoM/jyjCut9tTJuoc5jW3ppwwT2TnPKKoS7ESx9iDU08Uc7uQsNh0qRFJTc5xdw8JAw33KoQaMEKY0ipSJVIGUQu0t1VUOJd15GxZWH6ndrRD69x3d0TaL2NsUsVgkM4GaMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SA2PR11MB5163.namprd11.prod.outlook.com (2603:10b6:806:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Thu, 17 Apr
 2025 08:05:28 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%5]) with mapi id 15.20.8655.021; Thu, 17 Apr 2025
 08:05:28 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/7] check-version-mismatch.bbclass: avoid meaningless checking
Date: Thu, 17 Apr 2025 01:05:11 -0700
Message-ID: <20250417080516.3158818-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417080516.3158818-1-Qi.Chen@windriver.com>
References: <20250417080516.3158818-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH3PEPF000040A4.namprd05.prod.outlook.com
 (2603:10b6:518:1::53) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SA2PR11MB5163:EE_
X-MS-Office365-Filtering-Correlation-Id: 191c4339-9c24-43c7-d77d-08dd7d869daf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gwbGIKaGjQ1umYmti7xPMsUZo0HVmaHQb6hTQwivlYGUmoIVGcNCUZaT6Qs7?=
 =?us-ascii?Q?zpTfg56AE1yobDlMoTgPqdbeQ4nhG5YYlalxiLlUg6WzjfrSzLRORqYsM1je?=
 =?us-ascii?Q?27FSDkzgFtk9xJvJlWJk0dvbsZBpoaFvJzz54j2rzkMSEDhmZOlD8u+TtBG/?=
 =?us-ascii?Q?gFiKduBQerRbMZhyIgMSORj4UVU1qHiIcuHaoBMVgezwX4dIF84S2No0bc9G?=
 =?us-ascii?Q?JP1Kvx9quBIHdJlnXeur6isAhUt3QOhvNvbwuqYmg++4QA5NGvgzqf3yq6ak?=
 =?us-ascii?Q?aLUPiWOCxTvI4+yArD+SGUQ62is2xujakuvrBWGsi2Nop9DxOh127e5zaQ9b?=
 =?us-ascii?Q?f3II2ceiKslchMls3TV/uoG0VBoxGnd3z13DlwLWBA1+eUOPsBSXZFBnCOqg?=
 =?us-ascii?Q?wlFIRfhpIBb06GpIvFQc34sgPCpMZt98JY68GJkccQJHFLp+LIdfwZkFREuA?=
 =?us-ascii?Q?nXdcrBHqCasCD+qXa/opUO4RyDXBTn8TpHxin595sWGGoyPWP9EACDh8KqwB?=
 =?us-ascii?Q?D5ZnUPuaGuwlof4GguAZoqBpgLdD+me3QwUxQvQZuYqhjYojshr3EslPex5R?=
 =?us-ascii?Q?0pfvJR4TUqUi2p7YAA1mF+JurBsXK5Yv/dK59G4cDzwq/6V0ET9R6ur1Cmnh?=
 =?us-ascii?Q?0KAhl4uuoVQhbzKaOQ8cnloTD+u8sCJ/Ijl3kXPC1CPLoo1f0ZUG3MTGm43o?=
 =?us-ascii?Q?B+31WEErg0AK7tUYfVViKPTyWJDOfYcljs/xp59MAla19cByXEbjFXvMGXzS?=
 =?us-ascii?Q?+SfG7CVxWBlKI1FigqFYhZDKw+tEUyb87n0Qe+vUhs1x87p9B2DnKDgpWwUI?=
 =?us-ascii?Q?WoLilXA8YoldG14ZTolkuHofrT8yd1dGX/0UmYzV0lKiaCbbYURKSKE5qgYT?=
 =?us-ascii?Q?yODuseh4n1TsuyN5hOum8IDfo2iuNPXOtTyjFdLKWv7PsoJxTdBKOkyFyF66?=
 =?us-ascii?Q?mDpWABqbbNhPVm/WOmnP7HWSayz7oBKy+dgEKflwPfI2u0QvVISt4mhHYCyv?=
 =?us-ascii?Q?/SxEQYq7hs4aLluGDBLimSO35n7E2bw/uGNkMc6gHJN9UzlWK3VjB6hWdSnz?=
 =?us-ascii?Q?hfx3Dh3Z/lEZoBqAunVMHBDNkJVZWWIwy8MjZUqoNcjbufiYNhDXyj1WU798?=
 =?us-ascii?Q?ccQURqvpafv23mIPOXAmifDTN2+IMAMHWVXq+t6PxBNUhnDRnK+8AfVh6QCe?=
 =?us-ascii?Q?U5RLHgj6fffkVzag7EJvbetiHjzE/DnWPmiXzVR6GsOGq2VqA/PKI80REoTp?=
 =?us-ascii?Q?F8kDUVC4rKKosOfLVlzfDQtkPkZpjUZ6cM0p63B5A8P+8ZlHmVNwBcJn7nsL?=
 =?us-ascii?Q?lGaB0vitKnBks28SnsFgzM0BwCzLkHxNvFqlf6ijsoKVFsARcyiOIU+7NMXh?=
 =?us-ascii?Q?IflkYnCiCX7tC+o80NarTbcvDDizpUDB5KPQ+mVIzK6JLkmEh7onFiPYXHOK?=
 =?us-ascii?Q?kVQgkFJny1mGfqw5etgz26kVKCLSBIOUt3ceI4/UpQspPl7oxePGMA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xtbyytyaOqBolSsC4l/38exQ09u4+2chJBqY+0NjVSv73ZAKqO1iTyFUViNk?=
 =?us-ascii?Q?xOn67fTREkdr+LnBlm64iau2sYYUiDWZULaENA2G93ERuRPy5pNEMkI3KnfG?=
 =?us-ascii?Q?PaMRGADWCrUuPPEXWHd9NHuogrMVLtbDL5cfHraZzUr1LJ+gYXD0L4QRk6M0?=
 =?us-ascii?Q?QW1q4OzstdatrDznGytFGetjz95G/n096qqZ4pOs7ly/0Hx7kWVFpFZargVh?=
 =?us-ascii?Q?6Bb00lmT9BCqyh5kMJUsHPfWGiDMew5eH3gvuHfroAcKD2hGeFXOsUDfyI7z?=
 =?us-ascii?Q?8nkLqqyhmsn5/x7fLfMpYOiGQMnUJQwHwf7Btw06vp5Zbe7bcbIjzQI3FHC4?=
 =?us-ascii?Q?6F0caToVUiW4Uv5Gqg6Qi6l7hv0PU3rJ0s17gi+XTFqCrT4+0FOKR1AGvy5+?=
 =?us-ascii?Q?ctlROWGhwnPrFBOY8cTf9RxbgHq9CxZTSEtfcEBXA5xvzM0VsR+K2iBRw7Hg?=
 =?us-ascii?Q?OaYAdK1o8ZBz9meOitkifMlbH1TUquNfe5Jl34lqMY+Dnp/yoa1/FfP80dc4?=
 =?us-ascii?Q?M+w2mlE4m5e9sEPcPaUpqN3ZhcIVYYCFGqXHPROeMO2QVGczx8ABt3bXyOIQ?=
 =?us-ascii?Q?mUn78ta5dsrJNxh8uWUsIoRBuYbL4EpnQaSHQWljiP3z5kzhlTQXHXC4LL5S?=
 =?us-ascii?Q?3tX9NZeUSvdQL7keZhFG0zwflZ3Eg1cYzgI9+UMy2IO+JlQQN40zh4aH5B61?=
 =?us-ascii?Q?jS9XQLAJ4JxG7n3aQMML6LDBOuZQUrs+1+4gurw8QAvmbjDBN1Bnj+W9Dqsl?=
 =?us-ascii?Q?USyOBeqQnso0fjXYpMk0GqfmJr2Q9fPihSFX9WPXw6yrm3iiZEwCAA/uY3ph?=
 =?us-ascii?Q?7TjGNMsdRazgzfLJspYJ/iR3mMhELmABsYocQ6gt6NW/d6i+0JxOCnr/CQOO?=
 =?us-ascii?Q?QjVNBg8Kj6yOZ9FH8tMTxsSiRKXq63r8T7lCPUNwlaFhUiM4eR/RpXJEzhWz?=
 =?us-ascii?Q?o1QJ/kbsVrMVyN1lGmL6HE7YKcOgUBf1evT9YS8lXp0coNIpjPFSyluNXkaQ?=
 =?us-ascii?Q?yeeNyk5zMRyOt2HNBgHiCxOpZ1K1mA4x7slU5hC9k5Jrw2212+BZ/Jp/UF7B?=
 =?us-ascii?Q?fYmilyHsc1zIv6Dd0UifnnVmSyjhMr3gF9mdWaBf/zuBZibX4Q2BBdz2niQw?=
 =?us-ascii?Q?no4Bp2PxTzWxMxTn2todkexBDsfa+XeSZd+b4Ef3rsaaYyINnqH434JnjLl9?=
 =?us-ascii?Q?yvFn6GQFS65eW0Ghet7g4yZphDRyj1oWDQu/9CvtEOCMlgt8EQboCK9JwVvn?=
 =?us-ascii?Q?15q9av5d6We+ICWSPRq+Mb8EaFIRxzniTFMsQjhbkW779oTqn4C6ucc/+aTL?=
 =?us-ascii?Q?pLSHutSomiFbf39Sw665kJ5F018nfurJ/0y7V3QK3zcPCm3uNx5BIhCevhu9?=
 =?us-ascii?Q?4GfD4zK1VXgmCdxnOigkg8JugzlgSeyJpl91r7YQdVlUF2VIsiEn6y0HH6uq?=
 =?us-ascii?Q?pqTqdWEsMBcTAurhHaaBg1ssC3UZpMjZT9J5kl1XN68cqN4kMZZU79x+T942?=
 =?us-ascii?Q?bXCSE6dhCKr1oXa6k+rfSzuQ/GOO6Lq5+R65ervn+HA5tr8ZsMEfsgu4kCiz?=
 =?us-ascii?Q?46OWvZLXUsHO3dvR0xXW+Di2nKY34RWNr4Gtz2lKL/O8NRxJHb80WjnjPbKH?=
 =?us-ascii?Q?Yg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191c4339-9c24-43c7-d77d-08dd7d869daf
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 08:05:28.2808
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eERKq5nqvPx62XyuCMLvuTrRpp4cnRqz19H0O4yoTm4C6a0gIs8c+5eR3x8vU0qASeoB+sWWXMB+1KB8SzHYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5163
X-Proofpoint-ORIG-GUID: JOCg4-ntTH4TaczzXZXFWHDQK-Zc-fNu
X-Proofpoint-GUID: JOCg4-ntTH4TaczzXZXFWHDQK-Zc-fNu
X-Authority-Analysis: v=2.4 cv=BaLY0qt2 c=1 sm=1 tr=0 ts=6800b64a cx=c_pps a=S2IcI55zTQM2EKrhu3zyRw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=t7CeM3EgAAAA:8 a=DeIZd99nhQelyWH27ioA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504170062
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Apr 2025 08:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116921

From: Chen Qi <Qi.Chen@windriver.com>

If users set CHECK_VERSION_PN for a recipe and its value is a single
'%', then it matches anything. So there's no point doing any further
check.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-oe/classes/check-version-mismatch.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/classes/check-version-mismatch.bbclass b/meta-oe/classes/check-version-mismatch.bbclass
index 100cf09ac2..676f7fe755 100644
--- a/meta-oe/classes/check-version-mismatch.bbclass
+++ b/meta-oe/classes/check-version-mismatch.bbclass
@@ -205,6 +205,14 @@ python do_package_check_version_mismatch() {
         os.makedirs(debug_directory, exist_ok=True)
         data_lines.append("pv: %s\n" % pv)
 
+    # handle a special case: a pure % means matching all, no point in further checking
+    if pv == "%":
+        if enable_debug:
+            data_lines.append("FINAL RESULT: MATCH (%s matches all, skipped)\n\n" % pv)
+            with open(debug_data_file, "w") as f:
+                f.writelines(data_lines)
+        return
+
     got_quick_match_result = False
     # handle python3-xxx recipes quickly
     __regex_python_module_version__ = re.compile(r"(?:^|.*:)Version: (?P<version>.*)$")
-- 
2.49.0


