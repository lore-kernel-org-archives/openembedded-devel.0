Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076BEC02187
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 07:24:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15806.1736925888625153433
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 23:24:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3110a90dd8=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F618DC031512
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:48 -0800
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt73qec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 23:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ifh4bpUBWTDclOxmKnZy9Xp/q0Cd2OAm6xkNFsgu3msXWX8n1YJRRMS1n7EenOco3Ysv1aR44+kztuolTzfpJ7L2q8E6MB5xemxPX0adB7YlLYZlhCdXD2+n3lSo8+G/oJM7YDq9yv72tf0Qn0sH6ngPhbbBlNCDR7g8KNpvNAtHDgdhitGae5zDcpq1Dp2kjEygYFfsK9MS0DvCbl3LqDUnnUg300OjXWusHhmsJ6Jzy/LGcBau9Zs2G/CaZvrl0yZzl7Oyl4Www83xx/YZWoDoonyOVIzFGVoUlOXzwxLCdC7Zu676oeimQ4W1nhLf8rFZK3YL5tFdCbI1sb6s6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XbJeqo6HJ0/jhoPULb088syHhpAm2nNw6yryAm0hhSs=;
 b=Q98CZoeQ5c2K2A+NRzQ4aAuAOnDXskbmJdjgjE7YR0weoVhifJ//Hjz2iC1iOs4tx9LpNUSkoPHA3XxUwciOsADhpGmLZr8oezeCzeZ3rw0VBHczzcwIEfHzXdev/m1HxTc6OYnJCqdHfEkh1sNYWFJbmtTJFvPU7y9LggbQeelXCLjQUhEW3B5CXg0hmp2B2Awp3xZa0KcK39WMd6RM9TQotwga0HI5nuBTQd6IJqliGNqE8zeap3qwL/ey8/nqrPHa3D6HKP6WckmvnZi9p6Nl8JZHTHcFZY2itH7tvG+7iwQzqe0oyG2LxJJkGA1hqHm1/yvGD29zahwqtBV+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 07:24:45 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 07:24:45 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/8] opensc: fix CVE-2024-45617
Date: Wed, 15 Jan 2025 15:24:25 +0800
Message-Id: <20250115072428.3667416-5-peng.zhang1.cn@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9b14f050-361a-4c82-daf6-08dd3535af93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?rKihn1J2RdgDEk/nawE0ZCFpbujNgXN/f8TyYt7M+PhmPlEvxv6HoiIG5W6i?=
 =?us-ascii?Q?Bn60BcYyGliF4soY0Lb6CAWZKfR8h8rjYLJnBstaurCUc6bTqi1o1XCfLOpS?=
 =?us-ascii?Q?QL+RioqbVjF1KwwFCRQfX36tKNNjTCh4CENQnV0FMMhnN3VPIDr80ae4yk8B?=
 =?us-ascii?Q?351ii+YkiLvDfRi2rD9uqHJcsopuLKaznPTVjCFgvAhlkt+xMWxQBhM5hjwb?=
 =?us-ascii?Q?OY7OrsOCkFv7smRwgt+aioQmAgqo712eY/vYnDhhjgsQHhZo9ZrvuBHTylRD?=
 =?us-ascii?Q?b0mexETt+0J5WkubLIy8/HXrXN8Kf7Gir//D+z3QGStBmn1G/6N8uuuktHO5?=
 =?us-ascii?Q?MLHqwkTWqDOyR+WtKsstHyC472EtOHaskWagZf5pmYBHhKLYl4GIU0u4XZUi?=
 =?us-ascii?Q?vHuyge/DNkENAKg4pidHFn2GXnD2C1wvR/e00v8PwN4uulIW0ooTSH7Nrk+Q?=
 =?us-ascii?Q?NT7+Q+/39xj1+CMmXGohnxOwaC+W90EUZlSvm/LEv9fLxsats5BOEEU7FVZb?=
 =?us-ascii?Q?9FtWBycY9R8K7TOAiZb0e2lzhImXF6jRU7xBIhk3DZjTZatKgWHicYuAA9TH?=
 =?us-ascii?Q?BC5q9GSsHQrePiXouVNRDWTDHxElSzXpKMZUlQ6pDBZNXqyFFC8hwYTH3n9S?=
 =?us-ascii?Q?rnQ8L7R0hJMfqA4u8eYLjS0/HdUu4tazqb2BDm8k/aZDkoS7AT/In+0O2cih?=
 =?us-ascii?Q?LulWzbP1x38sb50yro3ltocsoHexvtqsk4/TPjgSU3H1rYvUkjwjDlM0XEba?=
 =?us-ascii?Q?PwjN6AQ79LAi4Cz2TlkiDqdmjj8aCvPmQtx5DCy/C25/t3j+ycecwnDYQxeO?=
 =?us-ascii?Q?Jt75SZp+cg7eeD/PuhmusW0ScYx8egFqi+qLhBty6Mf7X9ygMzHaBktpN3qn?=
 =?us-ascii?Q?U6sZkoxPRqVnRolgi+TwHivHwOcuQqnPiD3ZCca+JV9P7/qtbvRFskr4p5gC?=
 =?us-ascii?Q?18Dl5OrZsMEsK6+QJ3TObPVTfyEWwzUuvhFpm9vlS0IR4EcUwXpybpSxhhoS?=
 =?us-ascii?Q?Hv+Lfnye3coNvt3Y8/Cgg2eecH4DUGTNvTamfIHkxUAcdCm3IcuienqiawLw?=
 =?us-ascii?Q?uLHOPVEbx/XZtWO9k8cXXpfj7TCAFqb5ayZ5dUGEudR8nzM2L9MUQGyZTqGz?=
 =?us-ascii?Q?zgQgRTBcfLJ6so16HuyCi38S6jq0JF/FpyjjE1NXIRCMly04GoRacZQZs+lc?=
 =?us-ascii?Q?YPXyw2W+I0LzSFt7kIEVL2DxwAtgxppM39Rb0P5TO7ACFMNg9HdlDOij853q?=
 =?us-ascii?Q?qf2u7nP/wzeCs6BqyL0YzwoSaTSGnYyX1vF6Qqhe5+99UYNaTQUkYaG2+ZA/?=
 =?us-ascii?Q?g3U8KJKbCy8gG0mtNxAmf+8YJAUv9kGhI32yWIas7VrzX8u+Ctjr/vV4+o+O?=
 =?us-ascii?Q?6SVf998Hv+ykDw+KuCf34kY/KLZeUdaLEKGDlKLMpVeuLJwGnw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eA07RiN4SwYKWZPUmM2ZccweQYQ8TnjZYZ0X1S6vvDieELkDZ19rcx4/R5gI?=
 =?us-ascii?Q?S4NGCqY6eX0BrduTgvhf8MAIUq1xD3F73gP8oijpTQYKDXE33D/hfKh40zre?=
 =?us-ascii?Q?IN5kFIrUO7Ri+GNcI5AJ/ryvSzX6xvJZXStOY06Ikrm5nUcE6FN+Bn8DliwH?=
 =?us-ascii?Q?Wk+PFR0dLOVnGlEXULEwScsDjwTYJ+0A5QNIQDBOw7EEca1tluBcj+/G78xr?=
 =?us-ascii?Q?HQ1QQByvc4D5egMu3HzXsWPrn0TkW4Ewgxn6K22T7hc7efIBEDPAqR/Jof6S?=
 =?us-ascii?Q?k/jbHcm5pDjRxOlLokAexXGxPYezHxWrpJmpNeHdW1ZGaNHwUfbR3trF8g6q?=
 =?us-ascii?Q?1ah5CVJfLp+31X/iwXlma0StPbQUoqhaZRmeYZw0XuP6L5VZSQzZmt5oQZNq?=
 =?us-ascii?Q?biXeg3mfa3/7S8+tUCdoPDVH0lzkrCLIexi1VSo/6m7Hk2RjOKBWO3AouTo8?=
 =?us-ascii?Q?Bisyq6t6E2cWanmRyNnl/SpwADaxjczurPLVf2OHvhEysaGftBshCPwSFyCs?=
 =?us-ascii?Q?QlhRqo3aziwuRxeHWlRRzMbVzD0TReXoMqhL742QtljgeVeqBn4R2n3BQQQl?=
 =?us-ascii?Q?pevz49lon6di3tu0fFDM5Q5ZoVkbRUpVeQZKTOUO1/B8zxZr4f4nMpMAksD1?=
 =?us-ascii?Q?EwKTsdM1mt0Fsvqzn2N3uct2l5Wzammty7FvrAXw7R/O1gN9Q1KGHva4NqfB?=
 =?us-ascii?Q?PTUNircUwEbkzoMY7W20CjfiNxEWUVoMJZlxNqeDwSZaBKq8U4F7o17CYwWX?=
 =?us-ascii?Q?r/Jqb0tAoXWm/XI61Pzn2FiF9f+i53w5ixpeWTGpPj4oPE+p0cwFArwZZF/+?=
 =?us-ascii?Q?bfwcLIiWZPzs4uk7cqDYliFOSltuejCbtbmYw6QMv3X4+/jTBl5tLFMpN9QD?=
 =?us-ascii?Q?G5QJXKscBJFIzdRvXm9rVx9mLedbbSOu4KOg5kj7TZQ4CpQsiuCEkw19nLWb?=
 =?us-ascii?Q?hjk7uMyORPIbIEoPbyt032VcrBX1ByxOY1BKE++yxYJiNvvtsI505To4QAbV?=
 =?us-ascii?Q?deb5Rh7PeP5n6NKg12AprbVyG1JF2F/gCuFVx0u60KlHiU1kCHhNKF/LfuxR?=
 =?us-ascii?Q?siPSFYbJ/+0AyMRDJsUyDokgVORe5Aw3IABM7r65PnomIPOb8QM/OHinQXMc?=
 =?us-ascii?Q?+p7h+ASJWWUuDEm6yRsU92pkZEQAhnugYPpHK+zack+gRmCreOoN3+e5INXs?=
 =?us-ascii?Q?H9vSasq8iGsBVmJSl3wHkg2IdDDgfM/q1iDw6szz0t/y1ef2rPbaquaq1aCa?=
 =?us-ascii?Q?BB6cRTvvPH8rN/xOMY+hWSGUh9ReKYgL9YQe5lXL8LuIbtS+em7H27ts4LMP?=
 =?us-ascii?Q?lfuWuLP4V56t+UoSDwkFIVi5vMtWULO7Z7s7pPm9CRJH5Hsax754YalOeWv6?=
 =?us-ascii?Q?aDRmyxTFZDw8/V2mKCUx5vNTmN/GOJOBH6pl0MFnvW9FGWwmA8QyMREeBMxy?=
 =?us-ascii?Q?jhkrwczdi4AR4H0ZNHpCNZW4l9mRyR3zzr8s86Xzf3tPhdEiJfhB8C/g8E1C?=
 =?us-ascii?Q?EMPXcwm3bM9u05CgpgJtullSQSxTzkKaFZQKRIZ3aujYSyVu7dlahF+nG3/D?=
 =?us-ascii?Q?Dk1ndE1Pxy/xWEX4km4MeKlu+Sorki67F6A5MqK8FZEqXbdrT1jllh5VfDQ8?=
 =?us-ascii?Q?/g=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b14f050-361a-4c82-daf6-08dd3535af93
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 07:24:45.3136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/sH+SGGM3+QfQ5GGDaKKI+Q/B76mJpK3GEkmWfS1Rz+syEm8hkzz6iky3GKiUHaJSBUXYhLwmIcQp89aTG7TkWudw/ZkHSdphYc+mXLONI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8046
X-Proofpoint-ORIG-GUID: iikHjcX7kBCHGX8bV9jaenMelc_sQE-c
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678762c0 cx=c_pps a=ynuEE1Gfdg78pLiovR0MAg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=20KFwNOVAAAA:8 a=9bJ8Nkmn-B7I84n9hCEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: iikHjcX7kBCHGX8bV9jaenMelc_sQE-c
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114889

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-45617:
A vulnerability was found in OpenSC, OpenSC tools, PKCS#11 module, minidriver, and CTK.
An attacker could use a crafted USB Device or Smart Card, which would present the system
with a specially crafted response to APDUs. Insufficient or missing checking of return
values of functions leads to unexpected work with variables that have not been initialized.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-45617]

Upstream patches:
[https://github.com/OpenSC/OpenSC/commit/fdb9e903eb124b6b18a5a9350a26eceb775585bc]
[https://github.com/OpenSC/OpenSC/commit/fdb9e903eb124b6b18a5a9350a26eceb775585bc]
[https://github.com/OpenSC/OpenSC/commit/efbc14ffa190e3e0ceecceb479024bb778b0ab68]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../opensc/files/CVE-2024-45617-0001.patch    | 38 +++++++++++++++++++
 .../opensc/files/CVE-2024-45617-0002.patch    | 33 ++++++++++++++++
 .../opensc/files/CVE-2024-45617-0003.patch    | 33 ++++++++++++++++
 .../recipes-support/opensc/opensc_0.22.0.bb   |  3 ++
 4 files changed, 107 insertions(+)
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch
 create mode 100644 meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch

diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch
new file mode 100644
index 000000000..e750c7b51
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0001.patch
@@ -0,0 +1,38 @@
+From fdb9e903eb124b6b18a5a9350a26eceb775585bc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Tue, 16 Jul 2024 14:05:36 +0200
+Subject: [PATCH]  cac: Check return value when selecting AID
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/14
+
+CVE: CVE-2024-45617
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/fdb9e903eb124b6b18a5a9350a26eceb775585bc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-cac.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/libopensc/card-cac.c b/src/libopensc/card-cac.c
+index 4c3bc89bd..f910f64d3 100644
+--- a/src/libopensc/card-cac.c
++++ b/src/libopensc/card-cac.c
+@@ -1302,10 +1302,10 @@ static int cac_parse_aid(sc_card_t *card, cac_private_data_t *priv, const u8 *ai
+ 	/* Call without OID set will just select the AID without subsequent
+ 	 * OID selection, which we need to figure out just now
+ 	 */
+-	cac_select_file_by_type(card, &new_object.path, NULL);
++	r = cac_select_file_by_type(card, &new_object.path, NULL);
++	LOG_TEST_RET(card->ctx, r, "Cannot select AID");
+ 	r = cac_get_properties(card, &prop);
+-	if (r < 0)
+-		return SC_ERROR_INTERNAL;
++	LOG_TEST_RET(card->ctx, r, "Cannot get CAC properties");
+ 
+ 	for (i = 0; i < prop.num_objects; i++) {
+ 		/* don't fail just because we have more certs than we can support */
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch
new file mode 100644
index 000000000..617f95d45
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0002.patch
@@ -0,0 +1,33 @@
+From 21d869b77792b6f189eebf373e399747177d99e2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Tue, 16 Jul 2024 14:29:01 +0200
+Subject: [PATCH] cardos: Return error when response length is 0
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs11/18
+
+CVE: CVE-2024-45617
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/fdb9e903eb124b6b18a5a9350a26eceb775585bc]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-cardos.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libopensc/card-cardos.c b/src/libopensc/card-cardos.c
+index 9906f6c72..6f10943a5 100644
+--- a/src/libopensc/card-cardos.c
++++ b/src/libopensc/card-cardos.c
+@@ -1278,7 +1278,7 @@ cardos_lifecycle_get(sc_card_t *card, int *mode)
+ 	LOG_TEST_RET(card->ctx, r, "Card returned error");
+ 
+ 	if (apdu.resplen < 1) {
+-		LOG_TEST_RET(card->ctx, r, "Lifecycle byte not in response");
++		LOG_TEST_RET(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED, "Lifecycle byte not in response");
+ 	}
+ 
+ 	r = SC_SUCCESS;
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch b/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch
new file mode 100644
index 000000000..cfb16b31b
--- /dev/null
+++ b/meta-oe/recipes-support/opensc/files/CVE-2024-45617-0003.patch
@@ -0,0 +1,33 @@
+From efbc14ffa190e3e0ceecceb479024bb778b0ab68 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Veronika=20Hanul=C3=ADkov=C3=A1?= <vhanulik@redhat.com>
+Date: Wed, 17 Jul 2024 10:39:52 +0200
+Subject: [PATCH] card-jpki: Check number of read bytes
+
+Thanks Matteo Marini for report
+https://github.com/OpenSC/OpenSC/security/advisories/GHSA-p3mx-7472-h3j8
+
+fuzz_pkcs15_encode/18
+
+CVE: CVE-2024-45617
+Upstream-Status: Backport [https://github.com/OpenSC/OpenSC/commit/efbc14ffa190e3e0ceecceb479024bb778b0ab68]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/libopensc/card-jpki.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libopensc/card-jpki.c b/src/libopensc/card-jpki.c
+index 6e4d0f3165..71339491d1 100644
+--- a/src/libopensc/card-jpki.c
++++ b/src/libopensc/card-jpki.c
+@@ -195,6 +195,8 @@ jpki_select_file(struct sc_card *card,
+ 		u8 buf[4];
+ 		rc = sc_read_binary(card, 0, buf, 4, 0);
+ 		LOG_TEST_RET(card->ctx, rc, "SW Check failed");
++		if (rc < 4)
++			LOG_TEST_RET(card->ctx, SC_ERROR_UNKNOWN_DATA_RECEIVED, "Received data too short");
+ 		file = sc_file_new();
+ 		if (!file) {
+ 			LOG_FUNC_RETURN(card->ctx, SC_ERROR_OUT_OF_MEMORY);
+--
+2.34.1
diff --git a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
index ec0149670..89e2e0d5a 100644
--- a/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
+++ b/meta-oe/recipes-support/opensc/opensc_0.22.0.bb
@@ -41,6 +41,9 @@ SRC_URI = "git://github.com/OpenSC/OpenSC;branch=master;protocol=https \
            file://CVE-2024-45616-0008.patch \
            file://CVE-2024-45616-0009.patch \
            file://CVE-2024-45616-0010.patch \
+           file://CVE-2024-45617-0001.patch \
+           file://CVE-2024-45617-0002.patch \
+           file://CVE-2024-45617-0003.patch \
           "
 
 # CVE-2021-34193 is a duplicate CVE covering the 5 individual
-- 
2.34.1


