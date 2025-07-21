Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424EDC87FC5
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 07:21:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.34790.1753082500771257696
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 00:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9297ef113c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56L70e1v1259417
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 00:21:40 -0700
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0sfcq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 00:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeHXaqa1lRysfebq3IWGMyINn54ZfcmQ4Kfa5sgAN/E8lYKAvAQTJa0ebFMtGr7ECeTAYZ5q0bY5Tp7udkd1IV5+dzrGPyS7tnYXcLvnu8GNsn1qR1QWa/eg4qNNWHrz571Z0AeIWmeaK+WyPV3UJLYyari2DrD9KWjpavcrmsKrD/HiYioefDUzo9sGhMH+5TreQgfPfNhjvSPommnl1V/smQw5aX1yxbAzQFvnqf4pPoym7u3PI8seepRGGrkD7nV0Nkd2+1PRZ6pCzc/UmHW6OJ0t0EH82Sc8hncKKpwEePewJRvJrv/Dlbg1W3wApAoCFTiJhN0eNPh3CUxoQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJ5HcsDvVhjd6FBIvt/fGMxPeRn/mDIxsmsuU2tKBo4=;
 b=svtvJCdpbZSCJ38pCwwo1BdeO8pZ2/9uxzlU28qdoHJT7sRtLnK/scg21yhTR03Wy13qAao12BHY5pEQs44QT1AQoxR6aNSOm6vAA5W6UkBx7SFhCr6S4drFhKSYbhxY0J9ee446Q5qVGBflTqDQJsQQI4r3T1MJggxzlQPaahhWQagJHgBu4rfTyguEFlorUFzaJNjTefY2wwhkHaeoSclgOFBmr89cOi0X7p8j43jtrPbtvITbBJxs5TIMdoI3LlvpnIyIw6HNWet8qFf5yIw9JZG2BCBnjlqDWzwIjHnDi/ILVejMsKQLxn8GcRCK+dcTpybb7VwEsPOSQ8GiQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.37; Mon, 21 Jul 2025 07:21:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 07:21:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] valkey: upgrade 8.1.1 -> 8.1.3
Date: Mon, 21 Jul 2025 15:17:26 +0800
Message-Id: <20250721071726.2277033-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0195.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c5::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e395b0-bdf9-4759-5916-08ddc8273a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BYPyFiT0PaIOVw7FiUxEMmZacvpw/TPbjOlqOUZpZsQKR+aw7RHP6Gr2T6eK?=
 =?us-ascii?Q?den8/J1tJqv15O5sOMK2h+JDxT8p/Xbcvclp+RI/TjwyQOCsS0tbui5QWdvR?=
 =?us-ascii?Q?Ad/PrfN+Cd4Pzc80TjpqZkIZUZmf56mrlgUToeIFdGXtpuZnbH0JkDD0NF94?=
 =?us-ascii?Q?Jm32Ub1ngbSdEuZr0iyomr8gkOjqinfXVQgPaAC/fs2wh2ZLOR7VkVouFUUW?=
 =?us-ascii?Q?SrdQLf7tVW/SrZUVvzPG2fbPunP4Bf3juQRDkskBwYEdv8UyCXOszXLRyPwj?=
 =?us-ascii?Q?hk7fRauI5pnm1RVqkYXkgm/3zwdKn9u0oqnxfXIX7bIunNzv6m+3pn5HPju2?=
 =?us-ascii?Q?NPMqTY5PobQ83E245o38RIMOqSVsQ6dQCNS8Sj013PUzWzG9+khCk5aTREzN?=
 =?us-ascii?Q?9lbenH5qMEr4AYQGm57WtWtsmqc942rKctfgMzWXzjb5aKKx/3a4khzlrN2j?=
 =?us-ascii?Q?lKspzsGVkFeM1LV8HX8Y0/iQG4vlGzunh+S0NKAflzoEmJTKYAQ3O9C7BuFb?=
 =?us-ascii?Q?sDhTlGXWmMYrwjxy3lvj/yhxbeDRY/YOzCOT+dYpzDiDyh8EJ3M2In7/4d/7?=
 =?us-ascii?Q?r9+KZZ2llDzSS9dWXB6KyAqTe6E/AuapyKh1MEyxhgUlDYOKrJLMYXrWTzMK?=
 =?us-ascii?Q?yoIQlpbHvGWRpheFbOB+wKnT4wSSPTgwgpRqMNIhm9F+01KcRnV1veOVmFx5?=
 =?us-ascii?Q?A5eQg+erK9Z9isXqaMVpfbJks4UQJomhwaLclOHkALZC+jdWxWgJk57DjfLl?=
 =?us-ascii?Q?sQSj060drNlxlNvOXVhcL+hYKo0appxUtw0Oe2etjCWNvpFmoqvmIeo6Sf6l?=
 =?us-ascii?Q?Pz2OGABgWY/KqhXkJn0VGYvusZ/02BmAzS9jz1Akl5oW37A53nBXg54wXk0j?=
 =?us-ascii?Q?LDJWTYECkMRwrjTKsbMOX3EBa/mPj0um4U8WRLfHmoUqOCTk3pI6YZsd3Iq6?=
 =?us-ascii?Q?6eL+VeMXG0mqHv4Uw1mE5d46dIRsBknHA6dcmic8neVT/++8a8A0UYxf/NtN?=
 =?us-ascii?Q?o+vSkqfDleuIqHMUs7S7lS91xzXZFnwYfDIUFXiJws0XNOgdN2tr+KhWJJCn?=
 =?us-ascii?Q?yS7BvicR/NoAGbdiEASMK0gfgZifpOGKI/eCvKFFfoL2YAfTLiScG8zejXJj?=
 =?us-ascii?Q?/MwNM/ntX9+naung5ZNqkL71ITG5vFPdK+3Ojp+PjNdfbsLD9cj0xwGk43P7?=
 =?us-ascii?Q?wPnD3aUe4VA6E0nw2Al7NBL0Z/8eYdAxK6dmdUCoEGpAgTQuWQc21X3XXXv/?=
 =?us-ascii?Q?nvkijENHw5hBj99PXFz580gL5SnIhYvWdPsj1z+/oJjQVyw1asqsFGYlgEY9?=
 =?us-ascii?Q?6GhX3ew7Gt2s9w4spQWWQLWA/nmdahB0iHWJc+W4cK/4tUhkoC4+bkeFOUZp?=
 =?us-ascii?Q?IN72+b80SXn9XevUlaKbDkk5lYw3o73SDw9gBIDKKLilo58iZdNljOB+9RMP?=
 =?us-ascii?Q?EfdBmzfXF8PXE8vWtD0Lrv5eAwaECo34CozH2eEeYWjaly3I8l2Ca1LDC8TA?=
 =?us-ascii?Q?G620tEs6uXsfqvY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pNIH38u5/8f6g2p8+u6sPakQDO/fACHuMPql7Zf40juNt5Pgo0EOru8NGUSU?=
 =?us-ascii?Q?Y5pSYA1MzoOnKaWx8KY34fx1Gl7F4GbbwlZcjvByT4N7BpvNuaw8dMj8Uxul?=
 =?us-ascii?Q?6WNvGedHe8vexgdgEWVxCwR/rGByRwLYbxWLMjXatOiuIRP7w44cip5sMqJm?=
 =?us-ascii?Q?9dnMMvSMnsolwd61urVTwkfTJGrDBqQk+gnOY2IhVUZmsiNSKFgMXJFqS8aA?=
 =?us-ascii?Q?CG5dRy2H2Wb9KYvcrzYEMgtUamXLRBaFSWO9u8MVbGsssCjD3s0ZPunKihs+?=
 =?us-ascii?Q?jJgbYhQmNKgJ6NyuKIa7RMPmM0q24LI6N99t4XlRFPM3RqHVBnEvJwvBEZj8?=
 =?us-ascii?Q?CZQJH3L8irJAUEnESnINN4Zi8R5VQrPTwD5YF28IuHyYpCdaebZso3wnQY0o?=
 =?us-ascii?Q?layGHAiN4sILtA9N/CkYPkhzkz+s/Uq1NX0XZ020qnkhmLGU5s91xAwG9Z4H?=
 =?us-ascii?Q?vGQnKS+1bpUOoUcgVF4UGbrUqMRZGHUNg/MwCihYGcH/yLQmpGh8Wer/cEui?=
 =?us-ascii?Q?rNoEM9Q0ECwDtsThpN5g+q6H1JXLRTXgU+qedHeX795ZkqrW7DszcNH4RQ+k?=
 =?us-ascii?Q?bWAXr4V1Fo9dH+KGsZsS5opDigqu6BkH3CXI7xaMlm1YasrP6NuViHv3K2EV?=
 =?us-ascii?Q?JNHWU6x2B3AhQbDYKrZKQlPgoDRZtaqHQzspiPmduXaMAhUbggOCzg08iTef?=
 =?us-ascii?Q?U7POkOVCN1WmfAzeIqaDnwSjECYzzfyv1W+Tlp5VNLJ+q6ZomY0cAvtlD43+?=
 =?us-ascii?Q?XcdfT9nPVCPN4nMa1LIemVxGZT2bMYH7lAanYXGrHVY/f8fatEL3ac5yPiAx?=
 =?us-ascii?Q?0T7bATW23tMjpYEHMkYYIkFllg+DyjPlFZeozccXNDD2WscTIwXVC2GKiScw?=
 =?us-ascii?Q?ze8hjROkCYrGqA/QqoSZfvpBI5sTjB9pzTl2326xU8T8sie20LuIJn37Qeqk?=
 =?us-ascii?Q?5Rn7x4h6DwcMOVaLZt1JrQ3YXwuUe8vimnz0j+JOKzU/BN1PZPd0nDas3SUl?=
 =?us-ascii?Q?y8icCOmBZvfT8TE5e/y8sg7cMRrc+TdaZ6VOU7SWBtJWg76Zkba2emQYNq3/?=
 =?us-ascii?Q?xvrBzEB8x4EgfPvRU3YfZLACpz2LApoQpeWwdOCNjxZ8BdTnaR4tKNHhiTNF?=
 =?us-ascii?Q?TYxkNuMtkIDOsmkL4X4UDMml7wzrMYCsKaI3swjWN2Xz4/hB6OMwYCWOoDfG?=
 =?us-ascii?Q?vt0yNYDt6eV6BNT6YaPMz86wY5mB1s0RDhg5A37bN/rFYhGu0Y/iCUJoQQao?=
 =?us-ascii?Q?n1kLfCsxHbpNezbQubENfsYaG/GICc4CRdL+6PMIfuEBGyn1PshmLNsIVnee?=
 =?us-ascii?Q?HcYR4bzDXVyfdiq1PAL0g3auqocc4E8xUI959h7mHzveTuly237xZSdqOJx1?=
 =?us-ascii?Q?LjXs4WjLuVEMB6LjVqYB/ErSmwh/kPpZ3id1/Eg7YZqYmRTXM2kBzlCsJCfX?=
 =?us-ascii?Q?7Dh0pm2CkaOO9hvsVItsP8Ii+NncLASXb5rvNymEyzhTAA51rGwTIpyQ55w7?=
 =?us-ascii?Q?/03tyxGdibAiQpgc5QQBiEhqlBGKzwf6coxaOG6fVgODqj6KV9wxePffr3Us?=
 =?us-ascii?Q?aSFxbJBi2HwZ4hAi1up3lzH47G5ojoeC3Tc/tde9?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e395b0-bdf9-4759-5916-08ddc8273a84
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 07:21:36.9570
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnOT2GGRcygo42GyprMKvQj+p5kRuHqZNAYB/iPScVyCWECQERDd6W9lVbAev5Hwfg5NuDVjmBW8rujhUq5tdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX8aKa0NnkurE/
 J7fnhPq7FnJ1L39ZNtGU/om5qe3zzHWzikeBytcF4zxIYHJ0H3LT+9brxxEN0fp1sDnc7/H5Qrf
 lkFLt0dl79YYLhlnDP+3f5zTPDRhxiCEuBErGgGZyAmyvpuRGNbANLwc0Yd6iD8cqe7UNZV1Db6
 LAs9pviPBkoTbIW02nvDFjEi4DnyM6YS6+LlLoNdjBZIuQ3SUhlP3OcIId5dkfhdXrsUVxPjJUt
 E5WckNMUYd1fuvV+YlL1WEi2/F9PIKHhQV0c1LIS7Ty0MBXTolVllqfpMNv0Y6lJG8JBUQNFaaG
 CoJH8hk4NtPUvX97yIivoUdDKosZFq4lM8TzMk99Owzw+zfFP8F3X+MwmGvdfSTlYHh3lLWbbYh
 TcKqYJMB
X-Proofpoint-ORIG-GUID: OkeSfyvn-qH_tUtfkU7n9CMzffSrA1ey
X-Proofpoint-GUID: OkeSfyvn-qH_tUtfkU7n9CMzffSrA1ey
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687dea84 cx=c_pps
 a=beKarbE+Mk3HYUGHxDyRTQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=A1h8ctYM7AAxWu_-aYAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_02,2025-07-21_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 07:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118651

ChangeLog:
https://github.com/valkey-io/valkey/releases/tag/8.1.2
https://github.com/valkey-io/valkey/releases/tag/8.1.3

Security fixes:
CVE-2025-27151
CVE-2025-32023
CVE-2025-48367

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-extended/valkey/valkey/init-valkey-server    | 0
 .../valkey/{valkey_8.1.1.bb => valkey_8.1.3.bb}              | 5 ++---
 2 files changed, 2 insertions(+), 3 deletions(-)
 mode change 100755 => 100644 meta-oe/recipes-extended/valkey/valkey/init-valkey-server
 rename meta-oe/recipes-extended/valkey/{valkey_8.1.1.bb => valkey_8.1.3.bb} (96%)

diff --git a/meta-oe/recipes-extended/valkey/valkey/init-valkey-server b/meta-oe/recipes-extended/valkey/valkey/init-valkey-server
old mode 100755
new mode 100644
diff --git a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb b/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
similarity index 96%
rename from meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
rename to meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
index 35b3d3c4a7..28b375bde2 100644
--- a/meta-oe/recipes-extended/valkey/valkey_8.1.1.bb
+++ b/meta-oe/recipes-extended/valkey/valkey_8.1.3.bb
@@ -17,15 +17,14 @@ SRC_URI = " \
 	file://0001-src-Do-not-reset-FINAL_LIBS.patch \
 	file://GNU_SOURCE-7.patch \
 "
-SRCREV = "fcd8bc3ee40f5d7841b7d5a8f3cd12252fec14e4"
-
+SRCREV = "d063dff523340e5a075f7ddc436e0c2a43d04061"
 
 RPROVIDES:${PN} = "virtual-redis"
 
 inherit pkgconfig update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
-FINAL_LIBS:riscv32:toolchain-clang = "-latomic"
+FINAL_LIBS:riscv32 = "-latomic"
 FINAL_LIBS:mips = "-latomic"
 FINAL_LIBS:arm = "-latomic"
 FINAL_LIBS:powerpc = "-latomic"
-- 
2.34.1


