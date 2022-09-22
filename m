Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978F9ECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 20:45:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web09.354.1663879533829600926
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 13:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=rWjoXDZC;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=62648c4f6f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28MKjLOZ006064
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 13:45:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=+zMAXdH9qlg09TGciHXGzkABtW0kip01hyV70Q6gL78=;
 b=rWjoXDZC2oLb4ocivVTT4rATUdJx2ezOAgT6L45DhPkfQoWyh8lEhcds9Qf86JxnMklU
 ad6E5LX2WnQ8DpaqA1bGn3L7b72ROhxj9Eexq05alb5+usg36RWQ6aG9rmZl34J3hnBo
 J1iY15w8/C4tGViZ2BbQSXvSiUbFAsU0NNyT4kkHDnioL4Q0/IAU89cM4y7m9GNqVi0x
 jcTEvHB6gqXaJMSkeYvbnSMrB4KkNnWph0vCamcHMbN6RINr3UrRWjNo2pV70OiVgqJP
 jz0jgf9HluLTNb6sUG/uOZAjJTCOpTncP82gih0Rbk4Ikb7j+PfOjGaH2Htx5P+7O4gN EQ==
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jndrkmffa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 13:45:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtuGSIrrni7NVZGt2HlnxU/7hc1pU9/vyGjzJuJaMfj6e2Pymii/hsnEGIgm00+sMyFMUIbhsOQIlxK5q2efoAF44h6XYF5TxiMdMQwWb8TmJEJbmNMGQCIaOWMP1NccsP/IxWu4o0FJAAe/aitfymV41SZGXA79pSv4hUa3vs94/l5+FC6ORRiLbShjBSTWiY5LAqrEiAoFWRLCCQyv3RTJcsu43AJW/pNVIJ4Yp5lCQ1kr56CoV3A/PSFuNItn1WlFsftJA8L1yf/aF8sC1fjDByy6Fnb/W42HXndY6ueWyI6n8YSFeqO1jk5AoFYzptrnSzyiqaynBNVPe0tYkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zMAXdH9qlg09TGciHXGzkABtW0kip01hyV70Q6gL78=;
 b=Fruz0poTIIZu/YXp9WL1pBUn+kJfsC4NJwkwAeviaWJK8kZWWk8Ii78p1PeRhRCGuURNx4id+qBhEgLDUe+407n6Zpdu+QD9weNLhaFq6vlO4lFYHsu52/2DAfAo5RBIBheuj1bv/wvo+tUOsBnpT/+sv7Vskj7VJvQbzttK2tog/UX5ZaGJ0npitt9zwzQZn8my2ANKsUAuuQPNMFQ40ahegWBlJoym9fqIaEZ5K4kby6TrfLY0jSyhgeWWyRwkVyLOYop6jMqx/Skkdi2PAXqETR71RlcnxMxWRhA13ccE6thRjUMuJqCqMO7xX+gD1vAN9lZ028OQEVZO+caDmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 PH7PR11MB6030.namprd11.prod.outlook.com (2603:10b6:510:1d1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 20:45:29 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336%2]) with mapi id 15.20.5654.017; Thu, 22 Sep 2022
 20:45:29 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][hardknott][PATCH] minicoredumper: retry elf parsing as long
 as needed
Date: Thu, 22 Sep 2022 16:43:29 -0400
Message-Id: <20220922204329.9048-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR0101CA0196.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::8) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|PH7PR11MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 213f9592-286f-476f-9681-08da9cdb6285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KNbikaWFXhuQiPczWYTUme5KRrKt+wHzsXyJA1uBwXMG0euN4kboX2RVK97xlWn9LWZC/nomOVWxp8TZaGeGA0y3X+RMjaQXfjekD5sckGCKR7S8WPaA7XrXC75z5YdLA5mTSGvmLIziwZ3Zy25xBn2DPWdgO7gcP/5OgJbgmCrpazM1/O64mu6HeQm1QivZ4CHZXbWE8sXxYRmckETQFlLSI832COSbAUwXJEysq3DioP9osJWhSEvx6Fvp/NG7yzXemlnb212hfKZs+2SxYfroMHRD9AtCjWNjckqQZz+gC/bGko01s6UNGP3cScDKlZOLcL0UEwyjGAbC3CSAkHfa5xKACGK3XuUHP5E5Aaq5LZe5ELJo0dEWZjWPtxmR1jHi4huf9XXBaDHTsqJmw9zaleJFAIm5sMEbbDGKn+Ml29QIdkaftdm4YIxXQu8O7H1O+GF3PXeGFocsQ9NkNlseTFUMN1HvtzZ6NgueKlB8gJkO0mA8h+cLA87BoG5KXySpTej/+VqKW9NyYYXblVtGgxlxgvjCHctsaW4MiP0s2E06WKr50a4u8BrZ3D9NeH7UGcK+abLG/5Ez+dbQLiV/U2jP7zUkLMSnvQIYEjuKYugDj0Ap8ArBtAMVVQjcW3UU+eiwyeMIDehLm1eZ+TaeghMi534/7dDn/OxVjwvn/3ILl9mr+if8xeHd8ApB419d97mL7uZ7bns/7YKNvRXlv7qifq7hntyoRUe9l4jYb4XJhQoZSOwG6qTui8TBoD20zAJvdLuBQZ0vI9anzuA03hmv1pVuLwiNJjvLcec=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39850400004)(346002)(376002)(396003)(136003)(451199015)(86362001)(6486002)(38350700002)(38100700002)(84970400001)(478600001)(2906002)(6916009)(316002)(52116002)(66556008)(66946007)(36756003)(8676002)(41300700001)(66476007)(6506007)(5660300002)(8936002)(26005)(6512007)(44832011)(83380400001)(186003)(1076003)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZaJh/K7o/VTQF5G29yS7BqOdeWbmA2GsHZTfPVyOqa/JqjODpt8duTxGY5Kx?=
 =?us-ascii?Q?jiRPU2G3UiHt3/4eQK077pS2T+/4n4Pqwk90EDj+52Ml1T7Y5RCystPakWXW?=
 =?us-ascii?Q?iBRwuVw6+1JRDLsIz6xW32hBaSQpwS16jVBwtZZVhtoUVCzgfIYX8MNZhZ6h?=
 =?us-ascii?Q?93Y7KKlXjhi5pqD0lip5GP3T+2XvWjbx0i9ysLkrZreo2e8QagP7anMTMlxm?=
 =?us-ascii?Q?8LDC/I1c7cJ6u4h1HL2IqcOq5JfFrUfDxYj0RAWL0mT1UDvqeAxUFonOkYHe?=
 =?us-ascii?Q?WeLK6z5JJqSaKK39dlV2F56g7UNuT1vrQ1oYnIV8jJuEgKGpuGV/ZI3fwZOS?=
 =?us-ascii?Q?QLTyYTGxM1yH1Txf/qtvDgAGBFkRSptl01vDBtzIVoIDRTdyipDNDV9+2ndh?=
 =?us-ascii?Q?ryDa8GXrptp4mK79Gu5kZw1jG/T2RTMRvPFFC2ZUlya8wjenIJegScs3Coja?=
 =?us-ascii?Q?T0kGgtf7iEYo/g1tpK0SbYwNiSJGTSdjasHYHy1J+Zk/TP/H6ifFH8ma2W6k?=
 =?us-ascii?Q?C4HnBWsjlRMC7ABI9br9p9dX9QtbEOJXT4nB+b8ZGkjXR6MUbuuU+eiSdZ8I?=
 =?us-ascii?Q?Y1nveWKHjt8bkQew9UgayCRhL+eiBGNnWdwqo8xOZI4phi+XB6VIxfWtsZWM?=
 =?us-ascii?Q?qiOenMMh//9azOQztbOhS9HU0CBjMPGdDGoy5V6f4nhxn7QJ2RPP3ZCdIMGq?=
 =?us-ascii?Q?nfzEfo47T2YagJlxLOqb7JrqNrTnbRz7dcoH7Zd6FxhZ0JWQTRaVM8Lugsg4?=
 =?us-ascii?Q?WoMjRoqJb7tWje7YraMXypCOH3pb7ACcK76svHMfHjZzupaXITYX1PzviSkg?=
 =?us-ascii?Q?rqgMV0aDbPQwp6Y5BWMopRhu5xUbgGiQVmepntNlTVGdBFyLq/igZqJRIXGe?=
 =?us-ascii?Q?BS88+1Ej3hOJ55ZIL1qB8R0CJBbJkBg1pgFr3Nn2GcEpkLq1UYNNVSoiHZir?=
 =?us-ascii?Q?UG4JKkjJhh50jr5M1Z2HaTYR1+K/9eP/BSL0XlRmw+hAt0sK8Udteg4JrqwW?=
 =?us-ascii?Q?6i/VL7V/a8JS5k1MMNwDLYLfPTAwPC1maCjUy83NkOQLjJilMsVCV9cPIH3p?=
 =?us-ascii?Q?fJJcwsiA5UhXvYqQeH0xex6wpjcpvkk+EI5W7X6xYi7VkaZebYY/HS27w+KP?=
 =?us-ascii?Q?5O2KMGcHmCuf9jVQ2Cakm200a3qIdwmr6VcEG59oGhALZXt+IKNCxkWXLNLr?=
 =?us-ascii?Q?fFkert1zs9d9jcxYO1ASSlmJXrHqTcxmMTXXs2A3OuO1/uYylM7mYIGiqBR1?=
 =?us-ascii?Q?aMafiSlMMi7a6Py0en90Sv/b/jI8c6j5jomoJMPoq7UAhqXTOBxirm+Hb21U?=
 =?us-ascii?Q?gR0VEI4O/m9KmL56SEttuTKtl7NQ5e9he2uW1T2LxhF8otrzCd3v/WCemldD?=
 =?us-ascii?Q?pXlH1TICt8YvKX87GCyN/Yl3CpekzPHpO9NVspeR8H0+O/nQiqleObRxUeS2?=
 =?us-ascii?Q?tYEHTXuJkUeYxaBF/qJI/IezDIJlHslHKjRlqYxiuaygbMW+cevz/F8bRYqt?=
 =?us-ascii?Q?9aNBLIgiDXC5SyW5GNeV9ay7KOXE553DAXDG2LkH1SEHHqIqisq+XiUhmGCj?=
 =?us-ascii?Q?LPJDQFBYqBJSnuBeAWPrJ4dR8cKcNV5NjHnmSLeZ0T9c8QLfSFXE+qyKyvl4?=
 =?us-ascii?Q?Rg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 213f9592-286f-476f-9681-08da9cdb6285
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 20:45:29.2757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UsIAZJfGzFyFHUDRf9FBGUtcq0hML14yzUCm7bvlU9f4MB1VS0ReEGP47IAXeX+GIIn6l6D0GZGLv2wS9k6AXtbuFjcM8WYVvEYIL7dxLOo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6030
X-Proofpoint-GUID: TuCBYYXpBLbJq3hwXLlHDE7O9U3sW8av
X-Proofpoint-ORIG-GUID: TuCBYYXpBLbJq3hwXLlHDE7O9U3sW8av
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 spamscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220133
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 20:45:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98931

Maximum number of tries, in rare cases, is insufficient for
elf parse. Backport patch that fixes the issue.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e231c86e282eefff0e8164551f75f8e01682abe6)
Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 ...-retry-elf-parsing-as-long-as-needed.patch | 128 ++++++++++++++++++
 .../minicoredumper/minicoredumper_2.0.1.bb    |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch

diff --git a/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
new file mode 100644
index 000000000..8d5b8b6cb
--- /dev/null
+++ b/meta-oe/recipes-kernel/minicoredumper/files/0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch
@@ -0,0 +1,128 @@
+From 7a8c6a06c86e133e4346b1dc66483bd8d0d3c716 Mon Sep 17 00:00:00 2001
+From: John Ogness <john.ogness@linutronix.de>
+Date: Tue, 24 Aug 2021 21:10:43 +0200
+Subject: [PATCH] minicoredumper: retry elf parsing as long as needed
+
+As was reported in github issue #2 ("maximum number of tries
+insufficient, in rare cases, for elf parse"), the number of retries
+for parsing a process may be insufficient. Rather than setting an
+upper limit on the maximum number of retries, track the number of
+headers seen. As long as the number of seen headers is greater than
+the previous try, try again.
+
+In order to avoid introducing any new issues, preserve the behavior
+of retrying at least 10 times, even if no new headers are seen.
+
+Reported-by: github.com/ssajal-wr
+Signed-off-by: John Ogness <john.ogness@linutronix.de>
+
+Upstream-Status: Backport [7a8c6a06c86e133e4346b1dc66483bd8d0d3c716]
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ src/minicoredumper/corestripper.c | 30 +++++++++++++++++++++++-------
+ 1 file changed, 23 insertions(+), 7 deletions(-)
+
+diff --git a/src/minicoredumper/corestripper.c b/src/minicoredumper/corestripper.c
+index d96d1df..c96b350 100644
+--- a/src/minicoredumper/corestripper.c
++++ b/src/minicoredumper/corestripper.c
+@@ -761,7 +761,7 @@ static int init_log(struct dump_info *di)
+ typedef int elf_parse_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr);
+ 
+ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+-			   elf_parse_cb *callback)
++			   elf_parse_cb *callback, size_t *phnum_found)
+ {
+ 	GElf_Ehdr ehdr_mem;
+ 	GElf_Ehdr *ehdr;
+@@ -770,6 +770,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+ 	size_t phnum;
+ 	size_t cnt;
+ 
++	if (phnum_found)
++		*phnum_found = 0;
++
+ 	/* start from beginning of core */
+ 	if (lseek64(di->elf_fd, 0, SEEK_SET) == -1) {
+ 		info("lseek failed: %s", strerror(errno));
+@@ -809,6 +812,9 @@ static int do_elf_ph_parse(struct dump_info *di, GElf_Phdr *type,
+ 		goto out;
+ 	}
+ 
++	if (phnum_found)
++		*phnum_found = phnum;
++
+ 	for (cnt = 0; cnt < phnum; cnt++) {
+ 		GElf_Phdr phdr_mem;
+ 		GElf_Phdr *phdr;
+@@ -891,7 +897,7 @@ static int vma_cb(struct dump_info *di, Elf *elf, GElf_Phdr *phdr)
+ /*
+  * Tries to parse the found ELF headers and reads all vmas from it.
+  */
+-static int parse_vma_info(struct dump_info *di)
++static int parse_vma_info(struct dump_info *di, size_t *phnum_found)
+ {
+ 	unsigned long min_off = ULONG_MAX;
+ 	unsigned long max_len = 0;
+@@ -911,7 +917,7 @@ static int parse_vma_info(struct dump_info *di)
+ 	memset(&type, 0, sizeof(type));
+ 	type.p_type = PT_LOAD;
+ 	type.p_flags = PF_R;
+-	if (do_elf_ph_parse(di, &type, vma_cb) != 0)
++	if (do_elf_ph_parse(di, &type, vma_cb, phnum_found) != 0)
+ 		return -1;
+ 
+ 	for (v = di->vma; v; v = v->next) {
+@@ -1614,8 +1620,10 @@ int add_core_data(struct dump_info *di, off64_t dest_offset, size_t len,
+  */
+ static int init_src_core(struct dump_info *di, int src)
+ {
++	size_t last_phnum = 0;
+ 	int tries = 0;
+ 	int ret = -1;
++	size_t phnum;
+ 	size_t len;
+ 	char *buf;
+ 	long pos;
+@@ -1642,7 +1650,7 @@ again:
+ 		goto out;
+ 
+ 	/* try to elf-parse the core to read vma info */
+-	ret = parse_vma_info(di);
++	ret = parse_vma_info(di, &phnum);
+ 
+ 	/* restore our position */
+ 	if (lseek64(di->elf_fd, pos, SEEK_SET) == -1)
+@@ -1653,9 +1661,17 @@ again:
+ 
+ 		tries++;
+ 
+-		/* maybe try again */
+-		if (tries < 10)
++		if (phnum > last_phnum) {
++			/* new headers found, keep trying */
++			last_phnum = phnum;
+ 			goto again;
++		} else if (tries < 10) {
++			/*
++			 * even if no new headers are found,
++			 * retry at least 10 times
++			 */
++			goto again;
++		}
+ 
+ 		goto out;
+ 	}
+@@ -2106,7 +2122,7 @@ static int dump_stacks(struct dump_info *di)
+ 		/* find and set the first task */
+ 		memset(&type, 0, sizeof(type));
+ 		type.p_type = PT_NOTE;
+-		do_elf_ph_parse(di, &type, note_cb);
++		do_elf_ph_parse(di, &type, note_cb, NULL);
+ 	}
+ 
+ 	if (di->first_pid)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
index 8188ae599..5c5e0b241 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -16,6 +16,7 @@ PR .= "+git${SRCPV}"
 SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://minicoredumper.service \
            file://minicoredumper.init \
+           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.33.0


