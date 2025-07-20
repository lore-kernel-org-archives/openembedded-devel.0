Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B748C83F1A
	for <webhook@archiver.kernel.org>; Sun, 20 Jul 2025 14:04:25 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.18261.1753020259842738798
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Jul 2025 07:04:19 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9296bc4a83=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56KDsj7B3793603
	for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 07:04:19 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4806n0rw4e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 07:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DMrUSOqDRbDFiMvYZm8H0vZ+yK9GHzLDGye4L6+epsa7BHulR+UPY6StWZcOEPpQr4lATCCIP4kY2MtTQAvkypAi0BIGpKjKXxDSqU10IXTsHQeevhpIoBoY6b3TNmyVqFkSMdLvOnwqmM6G8Zsb7u5T0fDakVmIpq0XgrUx7x5tBFTKVktNdG2l1IJDB7Uy1TXyGHG3KoRtNrgXDQefvxAQWarIBssD7doHFiO+D1DwzGEQrLfxu0yMdYnS/5yuJQPTDrym7p2vy2s2PAeuUAbY7e5gvaTfJQp5wkxk9z2XENXkyd3dxYne4LuwJsF3c6LOI8o6+1ZbVHuDZ1F2gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeHBageXQGkm0a0Sn+zYpmxc7MNZsAQHxL4ljaivHlY=;
 b=Klr3anjduvUUQFLtzlh5imjNx74uq+I+ArwKqTKbNsA9xpdJJ8lRV+It512GdiKjR9bTVYQ9cjjmRJRS8e9gKRXg7s86mudkYvpIHRw7ethuFbT5HAd9iHmsZkrXGQWzpRYzKGSoo4cmwJf46Unb8KV0oE88IaJzz2DvdKI8oiCsoTH+n1WbkhaweuO83rHCbtvqnX4fehd1OuZ0FuLcg7/Qr0Fa3Z6aBhvP9fjSeZ4+cg/yvAJBz0afdruJ0E18eGjdRnAZiM0H+K2bkpeQcf3hepV6QkE2tD/9wm1rjGXztWuugD3gGa6I9Q250flhUSSpiKC9ybqIm+YFeg0KFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB8151.namprd11.prod.outlook.com (2603:10b6:208:44d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Sun, 20 Jul
 2025 14:04:15 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8943.029; Sun, 20 Jul 2025
 14:04:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][walnascar]][PATCH] ufs-utils: fix crash for ufs-utils list_bsg
Date: Sun, 20 Jul 2025 22:03:49 +0800
Message-Id: <20250720140349.2207857-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0093.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB8151:EE_
X-MS-Office365-Filtering-Correlation-Id: f67b3bab-2572-4994-725a-08ddc7964f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IL2hzUOyIintoV2CGEUrBTQjAWqMtkEEMBmkQ+eTuHiXzqzDcC/2b3DSvXkz?=
 =?us-ascii?Q?zo3rm/5qwPPp4GjfWquIB75HS3bk6D/0kvw8KBVUykv7t/YSP2Y/F5Hi2tGn?=
 =?us-ascii?Q?CawNcxnaU1JiFb598hWrevHuSEcCBeQVQDqpP4hgfgWFsZdcA+jDV03xL0hM?=
 =?us-ascii?Q?pyUM9CZYRw5QJqv3k0yIrS8/Zfi1QM85kmu8To08UL12l3N3yQfuF00L9c8s?=
 =?us-ascii?Q?z0wsG64HTLSBKg/MIjkX9oGoL4opjsaLi7A4kuScv92DJYyRsKc6uAw4GJrB?=
 =?us-ascii?Q?fRZ+bDOFDlhSRX1AWaidwRiUa/D161I+hsH5OzuvIwhqoCFBtozmSQGqFIuG?=
 =?us-ascii?Q?oO9SwWd8Nx2dCQNAMSF3j4bj4GQMNvqqDDexUUJEvvPmHqO46c91joPrK1ph?=
 =?us-ascii?Q?R7M/WiwlchLlDTqA+XyeEhzowg/Z6JvR0DCAr8L2/GA6dYTX3fMc8tslkkGJ?=
 =?us-ascii?Q?4ltDw/X3GgXv7G3IIrwjH9ot0x7hwjXGhnT7mWkVmzMno2RaErakgzvMcjiw?=
 =?us-ascii?Q?lNqiFMBZBHx/zUZnwZWKUzeWPxMzBCoK+LyPZfU2tTfLdSyseOpsG4laZO70?=
 =?us-ascii?Q?U59ha/e4+veFKM8xENMAg8/FI1COw30QKJr9zVKJ+DPEbHv7q61O/hlTRlzH?=
 =?us-ascii?Q?gHgTiBtSN4KNjdzXSkpLpEc/fRGYiE/WZ9xPy7zeFbu93u5ARk6OfXM1gQw1?=
 =?us-ascii?Q?cwsx+OAxqdYQQXZf4d1e2lNh1ltsS7cxOcZjs8bPLgYoV9L6hV++oLT+A8ZC?=
 =?us-ascii?Q?PT5hf0BjMANEe61HNpp2IGCTNo8XTLF3wkDP8V8fF66vpFF1L9UAATDWxZY3?=
 =?us-ascii?Q?peOqE9V6DQZjlblvw2ugBir5EPYXn33/lZbJl2EPWl0FHspaHw5BFzyWVLDY?=
 =?us-ascii?Q?ksvDCpzEgd2nJeWKqCd2tAbQPSKnMtXkC43NapJRdM2aRosCemGnJbJu4Wf3?=
 =?us-ascii?Q?aEUa25bS7OP65eWgtWRf/pXjFUasN7kGQ1LxPhqD6jl/vuGmTUPioDNCker0?=
 =?us-ascii?Q?Yc51/8xK92pvTiD7CHYxG/8BAiFYFFDxQqEfP7X37ETAdDcX9KQr9voY/I8m?=
 =?us-ascii?Q?Ykpeyz1fZu3y72JgX3kvknBAZTk2ChF9dTybXyLrZozIJK5VLE7o8iEC9QJ2?=
 =?us-ascii?Q?OHTU4y2S2fJhABIIkoPwuf6W8T7IlfQHxXNdvptrFR8pEFpgi5+dbCWcF94E?=
 =?us-ascii?Q?z2t1+q1JslYNnSVqMSG3GGgllwz7YD1+VPlZzZECNTsUPyenL7PCHlrsk3bW?=
 =?us-ascii?Q?DuVleystQuk6PezeQJrL8a8DyDRxU5WFJUh8XUEk5LzkTDZOjSIG/S0Bm4rI?=
 =?us-ascii?Q?1G9XjMGvUV8nxAM2Lv1n/jV2AXBb6TBV/vrc54o0TCJOM6jkquZR6s59oyO5?=
 =?us-ascii?Q?gaywyQ2+skQ0+N9RD9FnCmfm9DXRWLjlubXqQ2N17NBLjiia0s4xZkwdg1I5?=
 =?us-ascii?Q?O7cNVid7r2Svfc4DVwny2wS+RV3z6zxCyJShAB+dZtnWz7yMtNUAZPjuLJw/?=
 =?us-ascii?Q?zJfNUOqeCbQviVA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D99elRBrHJIYGgmCp1l0bxQwbr6UtKc4BGiSYr+Oy/EcCN9zT1nQJ+O+nboW?=
 =?us-ascii?Q?fUqGsowm5JReDIOGAOXjGf6dd3bLZ6rgLp91uODTF2i1fH0aHQLphseazqYo?=
 =?us-ascii?Q?bw3JK6Bb+anldcIWWVsu0B5k3Z6Qt6xfXOEfJBTOmN8SsOIc1rMzzt1zqwDY?=
 =?us-ascii?Q?NwmdEmz2u3TTQ1tIsbq8L2PGz7I+ih1jI5yCVqKsrRqmhUOLQb8qsfGE02U2?=
 =?us-ascii?Q?YTmjcRoxMM5Mhvb4d4BEMZ6snlyzaGxWNxqIhcnkJ2QiIDuyPU0SHZKmruOY?=
 =?us-ascii?Q?Il88aMhXy0gxdDVGYGnAfBn4A8B8l5hcQxXN/3FOdI+rXQWvd7Wzww/YuUJz?=
 =?us-ascii?Q?fK7PhzcOUnxnYHPxi1ukEOnj7Bx2+iWbJTX8dde0ThZMxK3OUdyhqI1zUvg2?=
 =?us-ascii?Q?VVjjoAmOnT3rsXp3dPBKHHg9OIMQPzXqJES8R5dfZ2xijEZ53FOqsvOVS6t3?=
 =?us-ascii?Q?dubJg+dSeFFFY609Nm8jrzDtritzpx1xnVm5gJtLXE9TkVoAOcX8geOG3Yat?=
 =?us-ascii?Q?4gqG36V17h+QvvJNLiw8QM+Zy7+lHYt0HmQflYPllfP8GIIPtzutzWW3u++t?=
 =?us-ascii?Q?FHLQsIg1Kd5vNdigjG8wd0AINWFRpoS4hAVuKUz0uJLl/jDt95AlFsly+geN?=
 =?us-ascii?Q?sY9CCZ9VNGX3o1di/4xXWaPEy2IoiRyPHQDr+1fGZe6Hc8F0/3uXqfexbu3S?=
 =?us-ascii?Q?r7TbmYipseeVxO5EdtRGO0tnol0/9SEV3aXkOEVighBUyZ1RRXqaDNxV+JW7?=
 =?us-ascii?Q?ra/F9S1FmjwsjwUTJQ2M5IePaClrtG/yFioWQd+VCj9tQQ1tUif/BIVjVy08?=
 =?us-ascii?Q?M0JvS7MrXfEq/lUwU2DhMnemIAlphMJL01apNovCRpykiG72ZK2Of101DmDV?=
 =?us-ascii?Q?ce7O5sPbOLNpJJXvEaRoY7y9qbhbJApVC6wnN8f1fl5HI5avcxnFKWZbw716?=
 =?us-ascii?Q?nktdSSNCN1rwYBcjZVP/TTXeaau5yjwm6WXGFP6cSCX8VRKjtMrNA1HZOtyp?=
 =?us-ascii?Q?DeWj5rVe9HKzmk/9cPrv7q+yBXOYckzLLfA7h4c0XvwQ7Ff7Kz1um94/Buwj?=
 =?us-ascii?Q?hNzR5wTFW7403J2foL5ObC7JR4+1wUQoSUwxKCMb0VIGk8xo0lP/ZshvLMcD?=
 =?us-ascii?Q?UORt+wZAth7XirH2RuXoGBKiwIN4bTutAlfWgqmyNQ0GL0IAKbC+oMrVEhn8?=
 =?us-ascii?Q?V4QAFzxrhd+qamGY2SImfejLpdYMErS8yAmh/OjRzPDL4cDdT5Lt34EANScg?=
 =?us-ascii?Q?+4HetcEfnd8booV1LGLXklSJnWmHPC6gig2MHqrUEWKyLtu3WGKIJDRcHPMG?=
 =?us-ascii?Q?LS7K+6gDsNEsEYnpksPpx3oC7vJXzxXOb7ItPZ4wFDCB3xI5O4CLslTMNKEH?=
 =?us-ascii?Q?J7/pcbKsqPNAmGpvQQ4WUgdgicyiW2clpBW9B33C62Q+sjr6lJth26C2m1g3?=
 =?us-ascii?Q?scfCC9P/GBYVTfZX6xNJoiLqw4B+yJJKNAi+2q52qw0S/Ag72DNykRYvVBA1?=
 =?us-ascii?Q?W5zx9k5FODrRNoaO5PLR5pjUMdbv8lWwcQsWdmvqmPEXxSI3q1RkDuy+5YFT?=
 =?us-ascii?Q?WkU0e3c3jmjNbZTiytgFBTwoVv6vCJJn727sv8lI?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f67b3bab-2572-4994-725a-08ddc7964f53
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 14:04:14.7958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fV11t0VufQEh+2w00TppK84JgD/6cyvaZ43d5HSeFwvM4PiL8vc3a0c3dYlOEPUFO6wT0yiwhsDXdrBaK28fHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8151
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA2OCBTYWx0ZWRfX3D+Xdd2w1FYj
 g97d7OIyTL1zgxSwqH6Bbu7d76G1Ip5kQ8TsLrproeaQYqLa0xPZvXeVJq6e5vPzx3vKY2TqlmU
 X9BlcM9eb0Tb9X8wISpXEFQ/rRC1l5TK+EPiw4a9J64RKWkRp9YPQefnb8ECeIB3WT9KY67+qky
 6F31mCm2XBer6/NW8WSLpbRDpSnnRzNIE3X2DU8jGFWKHfsWBsC/ntRo7UolbjUCDuzsZLLjJm2
 62vPu04hE/x4rbfwuvZilGAgEHnda2nVJckbxUBu/4hZEZdutZdPWMELUBYGnLnTOvmbWC72dOO
 MANaMMIyXo5iITfS7RoT2QtyK2ZSgtjpoUReG1qbePVxygSB3TX4gg+ff9tpH4Jkgjk4IWhb5gf
 31nfDmbW
X-Proofpoint-ORIG-GUID: Sqp-G56B0bQBc0lfIHbVIJ7Mz7kebpK8
X-Proofpoint-GUID: Sqp-G56B0bQBc0lfIHbVIJ7Mz7kebpK8
X-Authority-Analysis: v=2.4 cv=W4g4VQWk c=1 sm=1 tr=0 ts=687cf763 cx=c_pps
 a=x6qgWyjPDOdqnx7vgGQFOQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=u0Go_CwvXLwA:10
 a=Wb1JkmetP80A:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qWDSxcjIN3VCs_WSRCkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-20_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507190068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Jul 2025 14:04:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118639

The full_path buffer in find_bsg_device function consists of:
path + '/' + files->d_name + '\0'

So the buffer size should be: strlen(path) + strlen(files->d_name) + 2,
not: strlen(path) + strlen(files->d_name) + 1.

Backport a patch to fix crash when running 32-bit binary on 64-bit
system:
$ ufs-utils list_bsg
malloc(): invalid next size (unsorted)
Aborted (core dumped)

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...l_path-buffer-size-in-find_bsg_devic.patch | 39 +++++++++++++++++++
 .../ufs-utils/ufs-utils_4.13.5.bb             |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch

diff --git a/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch b/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
new file mode 100644
index 0000000000..7ae858a65e
--- /dev/null
+++ b/meta-filesystems/recipes-utils/ufs-utils/files/0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch
@@ -0,0 +1,39 @@
+From 989dcd297223d6896c5892532d14984326fa093d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Fri, 18 Jul 2025 16:52:57 +0800
+Subject: [PATCH] ufs_cmds: fix full_path buffer size in find_bsg_device
+
+The full_path buffer consists of: path + '/' + files->d_name + '\0'
+So the buffer size should be: strlen(path) + strlen(files->d_name) + 2
+
+Fix crash when running 32-bit binary on 64-bit system:
+$ ufs-utils list_bsg
+malloc(): invalid next size (unsorted)
+Aborted (core dumped)
+
+Fix #58
+
+Upstream-Status: Backport
+[https://github.com/SanDisk-Open-Source/ufs-utils/commit/989dcd297223d6896c5892532d14984326fa093d]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ ufs_cmds.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/ufs_cmds.c b/ufs_cmds.c
+index ddb037c..a6faa27 100644
+--- a/ufs_cmds.c
++++ b/ufs_cmds.c
+@@ -1520,7 +1520,7 @@ static int find_bsg_device(char* path, int *counter) {
+ 			if ((strcmp(files->d_name, ".") != 0) &&
+ 			    (strcmp(files->d_name, "..") != 0)) {
+ 				char *full_path = (char *)malloc(strlen(path) +
+-						   strlen(files->d_name) + 1);
++						   strlen(files->d_name) + 2);
+ 				sprintf(full_path, "%s/%s",
+ 					path, files->d_name);
+ 				rc = find_bsg_device(full_path, counter);
+-- 
+2.34.1
+
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
index 7126684e61..aac710cfca 100644
--- a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_4.13.5.bb
@@ -7,6 +7,7 @@ BRANCH ?= "dev"
 SRCREV = "18c0a8454ca1cf8969170049f8c628d88627beec"
 
 SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=https;branch=${BRANCH} \
+           file://0001-ufs_cmds-fix-full_path-buffer-size-in-find_bsg_devic.patch \
           "
 
 UPSTREAM_CHECK_COMMITS = "1"
-- 
2.34.1


