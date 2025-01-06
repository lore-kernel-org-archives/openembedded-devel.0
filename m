Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E51E77198
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 08:22:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.55406.1736151735767727727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 00:22:15 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3101692a3d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 506610W7027302
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Jan 2025 00:22:15 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43y1569c1m-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 00:22:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ke7OjeB1+u2PEO8RhaZrgcumD0ilaR/fcacZrlsS2d5cUviDXBwJ8uSp784Wj5fLlPCFOgtVqeVnSblTOTPIp8B3vZvC90w1r9qqUUJony8xfUxUAYG9iiMncrFyB+VEIqC1e1gJJhkENRMj0cxVQ57mHIzh0extJyJo1dVIeY7I0l/KZxJrk0o06b6yn76wRm3vMjdah6B4XVRJtM/0mqS1t7tQrN9/95nsl+h8nASh/Qwd0nJEXEPoOygTcxeNk8MAly5uYHTLG4s7AAvr4HLA0Y7ASm6OaIs3UuvJdJhIkZ7zFYxrH64Isti4PHp9M7xFDOKiVDly0Tvo7BPDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyCYkkQCpeSUoMJf6X4dH+EKc4mCkec3ddjzpfLdtok=;
 b=nx0i/0PiaEYcp305dktuB6qZq/vprxAWTLZCAAu+8PhVhUXIFLi7EXBjuMkw2f6/bK/punCSzuDjDtDXf8nT2DkJ8uLZrSZZLVmmXpZUQmVOPs/4FaByNVKjaQUIfBvK0q1VVuvFiFfwnRd1944lt2wwH3zcRU0JCtP6TH22xykOtDpQO9xeD0EwZhI3G8fuk8Rxr6MxLca1A//2gdEH5bzSlx/mbFCETkwJ4QnIcUTGICtk0Vt+nTsvkmXfsghBWxrHufpXgPybqRM/NY+V/6+MaKIWOZaPQKJ063cUNgJW+rz8E1LP2k4WVhyDIDniLv20G6Kpb3omnnWRm/n3mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB8061.namprd11.prod.outlook.com (2603:10b6:510:250::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 08:22:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 08:22:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][PATCH 4/5] cockpit: set pam module path to ${base_libdir}/security
Date: Mon,  6 Jan 2025 16:21:51 +0800
Message-Id: <20250106082152.882222-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250106082152.882222-1-yi.zhao@windriver.com>
References: <20250106082152.882222-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:404:28::16) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB8061:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a8b1a1-1e1f-462b-ccab-08dd2e2b3716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PaOtPzHH4FgKQ17ilJOExq+xj1muSYL6C6lTFwvuU4LZl3bI+zlyYwIv6LZb?=
 =?us-ascii?Q?8Dh3lV6X7sdZ4BVkDSBfalyxWmVvFpp0AYhN21ZUac733lmXz56OUbYFClfV?=
 =?us-ascii?Q?NzY7RhQg02hif2PJ1MQZKj5kX6E4Wrwm80BZLiRIKNt2rbC+KnMld3zC6IqZ?=
 =?us-ascii?Q?BXOm/QYVqGxgC3vA1lk6Yw1VvENXikLGjUT2gZq2jKBpJAmshpfK7ex1QvYA?=
 =?us-ascii?Q?j9vywfskx2UNkNuNDAOQdKFxwHcGTb3TJk6LGP6TTK63XCWtL6TDDOq+PpjV?=
 =?us-ascii?Q?qpGNINMyUcUjl4mZu9tYL2AY7BvRb5Ik4Z4BM+/f3mDVJ6AdOKT8IyjRENIw?=
 =?us-ascii?Q?aGEo5uZnWDcijbq28oJq3qUt/k6y4d9JpINgK48llH7shkZloFekGp1kOque?=
 =?us-ascii?Q?EGKfo3Tyz96In7d32ndRFCB5HHPDMbnvW3xY/jfQq0VrvQ24mHooU9rBzz/q?=
 =?us-ascii?Q?wQJVgGDDXZkAEM+kKJxJaEQFGp5CkZywen2yuGI6k80eRlCo2Lo/evHWLa2P?=
 =?us-ascii?Q?PCq/YWDfKmu0dZsJC37RpjJWb0ImUhmokeVI7aT8n/ApqzJ9Zfsxev7hL3Ii?=
 =?us-ascii?Q?I3UtvVAti9hqBxfDx2JxA8i0ydpi3OrDYqXvfXaL2i98CHco0/nLjLdgUlCo?=
 =?us-ascii?Q?LBHKO27iDdlc6RuWb6BXan51oKdx8PeNpmeOrHF/mnIT7kEsgFSB7IM8D8LP?=
 =?us-ascii?Q?802gsP4LAWx5uNQg0pvS0IM3jXFI4ffG3+fSeELvB/at8+QnILkWABMq8cNH?=
 =?us-ascii?Q?Z9lDUySVdea1g64BTMZy+ph+il/u/SlsHSoqUi9GhreU4zfblf5RQ2oCfwp+?=
 =?us-ascii?Q?pq/i0Y8z+gPILkuWmVL657PoBaIwQ08olvURqiBR7BJTXVXGZoig+7+P/U2E?=
 =?us-ascii?Q?fJdtguipNBurUjWB00aviT0xjkn1YbFEyQpvG8s9L5f1Wkhwmz7aM7kZ5YJh?=
 =?us-ascii?Q?McLypy672HLjUZ25CAGAhBJODidAPpJnHIkzRU4aQWGQKmfDMjQbGREOVnqa?=
 =?us-ascii?Q?sNlMdqJbr75HAlBowOWZ1sN+tmwwM16Px4mu16eRlBCW7Z2VtaTitnxYW0BV?=
 =?us-ascii?Q?uB7JkA9IYwOn2u8Z67mBLSCmI1a2mQmrOyetFeT3yI9JPHlmdbnHTk3ty605?=
 =?us-ascii?Q?RcbwylLADPqZGODw5RY0pEtrxL64yrZKXaRUvxIo+b8LCUwBRQPKgBK18P9h?=
 =?us-ascii?Q?dBqhdQ8Nft13NVKez+POkfiaEFkLCkIXm2bBfDtKuJQ60Ut3EXwL6XnWdo9B?=
 =?us-ascii?Q?b69cJfhuvDzEgakPXP/C/CQZX8ayvb2auuO9geXF6ko48NLeC9MDAR1W+sfr?=
 =?us-ascii?Q?P2qEJBcjR0NrodzzloYi4DOT0KKg1SCNV5HFepnJCIwnoi2NQgs83sosSmc0?=
 =?us-ascii?Q?aesKp4vX8HNPAh702bcUsDxfZIxdndCbblvWevjhFz/1QtgXuGw2BVXM/D2P?=
 =?us-ascii?Q?ILBvcgwxD9wMtVMw81ThXlE4+Y2oowXT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cjza8pWbbwkuMNqSEMuRbpBVgo9ppZvZerLb2CfcwEfmkZfkJH7adfZSlno7?=
 =?us-ascii?Q?Bu0pIf+0R6iKvgUpO1EGJ5eCcDsQxms2JnGtoXfzPnbbvRMhL722bBafqY0g?=
 =?us-ascii?Q?wfbk4KffE2qmUAY96vrjyl/l14TfcvX0Q2rPgvHL+45QJdHr8BRO3uf1L6m0?=
 =?us-ascii?Q?G/h4G3ha8vpkZt3q+YUIqpgq+tK9uYmvBfXe9RguvUnZ4bQ52L75h8+IW4km?=
 =?us-ascii?Q?2aCRMefKiqAfcbcNBPC/YJpEzEcEp/hqO9qeGD2+uY7aw1pUet80e+caH9Ra?=
 =?us-ascii?Q?a+Tf5QaV6oxG7eVCU8HBy+/K7tYITQYGvGk7Wu1M1IVtrDWdG8fjxozSb4nP?=
 =?us-ascii?Q?Q55xLrXEumTSMK+SiJKWVIfJwB1iKklnRTLjyMX/hahnopDtPbAFFOTckjrH?=
 =?us-ascii?Q?mR+yeVi/zWmJ9Y8mRK6jAe8sLSexx1KS8rXawzURYQO2pmF9I7kQ4t6K/6/S?=
 =?us-ascii?Q?b6WOxDRDl59eFSOK+3G5KIRpIhA992pjPVCh4jfB7BVv1vB5mmxbVnZsenpp?=
 =?us-ascii?Q?fOucbzIA/NkfRnAGxa1YtIuX4iS2Bkh9oO2dzda0zTkKqSQp15z9gY+rQn2q?=
 =?us-ascii?Q?OhUFKgfdP8PdaCiQd2SUPeHndPz6NFHuwHd8aTg3koqk3CIW54uZQsHVCnoe?=
 =?us-ascii?Q?+EHmGEEPhutjDHVAOknmV2xpy5COHiNoTU8gJh9/lIbsCgYpR2gyDfsCVQcU?=
 =?us-ascii?Q?R9tGz7oYKsm+RPNGq+KAhZznNp+pOn2snbjC8ZO3L6T75QPr3wYEvtLMyTBu?=
 =?us-ascii?Q?94edpYNqyoAYmR2AzhjOzS7LU6tOfQqlZwFRh/mwfM90nBbeNXUpEibJEVVw?=
 =?us-ascii?Q?omRdbgbh1duIDQ6xrJvYZp0PZ3QLbBFWDqQPUcNyx5d08GgGnn28odqqDFY7?=
 =?us-ascii?Q?7Bn4y+r1IuvFRJ7VzJQjR0jT5dglXo3DpmvDKIQYP1RdzsZp+MayfbQKZ4+f?=
 =?us-ascii?Q?czSjQcj02NY+3Ao/DbYLcpCbU1NnmAOTv5ZSKLmBF3tBZccGq2U3KSiwNMnK?=
 =?us-ascii?Q?aAimiSMONMbCO3QknD9Iwzt18wXp6Qss6z4wFA5xSb0XJR1yiITjHggAfJiL?=
 =?us-ascii?Q?NXRV/GYqeyEETsW0dQXZeHzNhx+JQtHsIGXiwlM+RAhqP8f6gY2XUUoMfIXP?=
 =?us-ascii?Q?WzfNRO506nuzAB18Yx1vfdK1vZtvbLSf0kNqrENRQpIiEbxLPDm1jO/kftpa?=
 =?us-ascii?Q?oHvGq5i42yuotLnlCbxaXt8JEyJ87X3pmBF2MSFcFFuku7J8bpcI3XH2ZJpZ?=
 =?us-ascii?Q?pKAEPdLzpf5El9pxOjI0C+3dqI+hR/m7VMdMukm4G5P/41I9ambytCe7xTOo?=
 =?us-ascii?Q?lm/MksC7I+jjHhKN5wmf6/Ldt1ONh7csUAmP1jztsVHF8R2sBKM6oFm/LC6w?=
 =?us-ascii?Q?HpsRkUA7tEAKWtdf9+MgiCjBUECrBsF9kw+uL7pK14Eb1AMqOpQF2sn5PLJ3?=
 =?us-ascii?Q?ZajKKCLNd581GUfKrF1fc7NHu7kxPn25CMffLf2F3Eyd5SkYR/FrhnH7iGqR?=
 =?us-ascii?Q?xDI6yW1wXmAVGvyJ7PF48iT9bsP7BQXJOYOThMHry2ZrcWX/WBZugKTkdLlH?=
 =?us-ascii?Q?N6lVA8s86fp6f5Mow8VCcBtsrH20ylaQ3Aurq1Yi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a8b1a1-1e1f-462b-ccab-08dd2e2b3716
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 08:22:10.1801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1s1NAmExYaAPNY+QqkndNfeWgUFZHjDpqMSOfoqx6kpDBFyEx/dg5tj/DiQiH1Kc4He7J5CHvokjx6lgDutnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8061
X-Authority-Analysis: v=2.4 cv=PMT1+eqC c=1 sm=1 tr=0 ts=677b92b7 cx=c_pps a=qvBKVd3KFl3zkoLf5jvq7Q==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=8HQLVNBSI4rpdPxre04A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 9sC8uOv4xkWhco2f3JUym4omDxvaMlNE
X-Proofpoint-ORIG-GUID: 9sC8uOv4xkWhco2f3JUym4omDxvaMlNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-02_03,2025-01-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501060073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jan 2025 08:22:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114658

Set pam module path to ${base_libdir}/security as this is the default
path in libpam.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
index 6a5eb4e66e..98a5aef680 100644
--- a/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
+++ b/meta-webserver/recipes-webadmin/cockpit/cockpit_304.bb
@@ -35,6 +35,7 @@ EXTRA_OECONF = " \
     --with-cockpit-ws-instance-group=${COCKPIT_WS_USER_GROUP} \
     --disable-doc \
     --with-systemdunitdir=${systemd_system_unitdir} \
+    --with-pamdir=${base_libdir}/security \
 "
 
 PACKAGECONFIG ??= " \
@@ -154,8 +155,8 @@ FILES:${PN}-ws = " \
     ${systemd_system_unitdir}/system-cockpithttps.slice \
     ${libdir}/tmpfiles.d/cockpit-tempfiles.conf \
     ${sbindir}/remotectl \
-    ${libdir}/security/pam_ssh_add.so \
-    ${libdir}/security/pam_cockpit_cert.so \
+    ${base_libdir}/security/pam_ssh_add.so \
+    ${base_libdir}/security/pam_cockpit_cert.so \
     ${libexecdir}/cockpit-ws \
     ${libexecdir}/cockpit-wsinstance-factory \
     ${libexecdir}/cockpit-tls \
-- 
2.25.1


