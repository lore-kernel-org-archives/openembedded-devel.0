Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BE4ECAAD8
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 20:39:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.271.1663879173831926999
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 13:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=LpNcQoyh;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.178.238,
 mailfrom: prvs=62648c4f6f=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id
 28MK92af018067
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=PPS06212021;
 bh=JluUYqUg7ZD7w0KhIs5YggvLEgQgqVNUyOPuf8M6Wcs=;
 b=LpNcQoyhul8J4RQlhvk1kW7hnvn+kNBMIcLdOCF19thbOqaPv+qKWHwKqPzGCE1QAx50
 6dcRFMjtukqH/O9uWC0Z/7F1api8FpUYhYcGwbZMmVR5YWYG2Xl5rTbL9ocD4KBAp5kJ
 ZFvCZ2WEtjV81IOGXhYQXNmFO4oH0fsAD2v1d0DGHURAordHKJmrwHYhqh1nGPCRW2HI
 JWzSVP55nGfdX1+3IhHJnWcTI+uoUT2+XmXZBRwO9RzMlldUt6LbkVCt8LHEYRjCvZPj
 2M5lldapg4rXn2dwjtTiNSuEgfGp8LEq4er6Ls1oqKfc/F6M2ATCmwBq28xtnTGbth9r wA==
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2045.outbound.protection.outlook.com [104.47.74.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3jn57a4rqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Sep 2022 20:39:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EDgQzA2/WzO7TrlcWqG3DRqDfEdGAdOPBNaMEeQg7SaKTG/CjGUdgvbF+IYUcVS41N4/ps/t5Kc3Sqp+5TYcxdX3rf+sDwDTwF9nqg22CmXtWRLtGwHSoiH3rU0v6jLR0Uy5SjTugVpr1NsVr2bkQQnZAW6+W9Z2hSSEWbcq3QMurSlevc6WQIGSi1aDP1IYig5goQdKeLlU3FOciJfiAmo+gEvSsrugxDEbVtVHTZBsi/HL/zllU3ZOubrGrWxXeVNoyk/n7B8+TI7/kcODSAPUwdLNKRKw63fAnHgpSJb47bRcOfhiJXtXl/OXFMQjvyj7/x+1StkJ13XlcS2vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JluUYqUg7ZD7w0KhIs5YggvLEgQgqVNUyOPuf8M6Wcs=;
 b=XH/8C+Y2PV0m4SMCYBVq51I08P6MwDDO6yGkQiX95eFsbyB6IEMfPkicW9pR8nYl1ioRcv+NT6U2OsDyrF3LP8NGwzyE1ejJve669sR3jzwSN4GGMmOG17+awgqFioes8J8MdaCLekeTDQl3wmPuPJF0q38bqOhZPP7jAKAZPtq87K63PYGy9btoSsAyNTmUWdE26YiuCBoeZklnoKQ6miIN7XWz8+mkIff764VgY34wPDLMqM6zrdcbWPiPrZMo2RiR6KfNBwS2T8ep9NfCw5iUQ/u7Zl1T+e4KzyVneQgmmyvr83trnDVLX0aOpI0+uq1jp3eULUXZGbpE3UkzXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 BL1PR11MB5384.namprd11.prod.outlook.com (2603:10b6:208:311::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.17; Thu, 22 Sep
 2022 20:39:29 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::857e:8b45:98bb:2336%2]) with mapi id 15.20.5654.017; Thu, 22 Sep 2022
 20:39:29 +0000
From: Sakib Sajal <sakib.sajal@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] minicoredumper: retry elf parsing as long
 as needed
Date: Thu, 22 Sep 2022 16:38:53 -0400
Message-Id: <20220922203853.7067-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQBPR01CA0033.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::41)
 To DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2538:EE_|BL1PR11MB5384:EE_
X-MS-Office365-Filtering-Correlation-Id: a996be27-c8ec-4819-c88b-08da9cda8bee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vip3EBn5Iiw8bydFTW5rDLN+BZWizQMbZDXfh+aoWy+JQXgXEwaQ4bTaA6yFlE1CbCqM3QzDMFyp0wEDtAtoUgcyFVQzC9qLCeiV1ejgfsMWc1iq0g3X0ZXpyISy3sUEQpwIAeD2TtB7+f002OplMGH63DUl3RgVuKwHT/nQXwT74uASlrzAhe7MIxUANZyvenuQSMvUmP7EyyV74MSddyA1lnQkVmKzsKHdsh75nNSfuo1TbmBx6+XR43NiMqATb4gbE2T+Zrde+eH8U57mwoLw/rN+PC/tIcV7gzECzZSaoPilhfe4ROyEE+FSkZVER/Pv33+bjab5sNOMPUUK5uKYoITKpovE/11YlFau6gNEThZrp1UnHlZwVp648N2L8TiY43p3yn2XiPmVilRiC92YhBDFP8234gUrmrt6/YJCSFf9mDF/Ek8xtvLIkfCAp58FwjUG0GPTew+HLI39QLvlnWVwYwFaMWEG6PrP8h4LSCYktbj+CRc5/kKpbBrlymnlHMCBJ3cVlyrp9I6Z58rYhFXiaZEdBRIleIF09U6AqYovnVHUu0Qbush/fgJxyIuqDG3zPQtPem46loyxm+4mUzm0f6eTWx2m28tdUp4TpkvA7gV3iHoaAGNPp3qXBS12qfJV8T9mjFK5iBjwBe/p7za8813qCZVFC5gg/xeqZ8VaxaJLEJPuZYWy3JKnFiyRzDjLi+OqrZRTIM9510AnNpm9IwqTe79/e2LzWb9yNKO9tRt8A1Df3s8VOXynVkvNgJm1yhYV5R1Ze17JuWFS2uIj+mqcZuTfrgHP8uY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(376002)(396003)(366004)(136003)(346002)(451199015)(1076003)(2616005)(6486002)(83380400001)(6666004)(84970400001)(52116002)(2906002)(38350700002)(44832011)(26005)(41300700001)(6512007)(5660300002)(86362001)(316002)(36756003)(6506007)(186003)(478600001)(66556008)(66946007)(66476007)(6916009)(38100700002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1eHb5rXXXyhAbli38ObWToJ7VSJYVGk8J/sjoHlMqkBj5j4YysEajYo9DzgY?=
 =?us-ascii?Q?nngwazhPDm+RbA1vafs1Fn4VBvqc4SVQU69RXwplx9Egv57XU79axKPFgKi3?=
 =?us-ascii?Q?+wr19SbPploGXb26eXlYXfcBMjGbICCCu4huusi6HXZhkaUFUa5buul9SjSW?=
 =?us-ascii?Q?2p5MwMM/u26cuqx2IS+k7gmlhQi2H2bDEavOd7CM63m1hJa8MoOWS4V75mwZ?=
 =?us-ascii?Q?nYjdC414zE6hNX7UPWoq86Qz12CaiuP2BFFE2AgEW9rSzgJ58yzpFkTh5Joi?=
 =?us-ascii?Q?Wl/gPgGxirUM0CHj2bNzX9Cmdf4lJkCFFwDA5Ny/JgyT1UZbZX0Ipp4IYC9b?=
 =?us-ascii?Q?BANt5VYkQoI4/e4tFz67Vr9QcYJI9DI0g+IwnMZE86TAvkjuSkddvuISUuV7?=
 =?us-ascii?Q?rmd+aYAnJJ4KZP46gxY/9YxSrkb3hLcqDxB3Au0ibOExyiO8V0MaLiLAoW6m?=
 =?us-ascii?Q?cNWnRUn/gcDIsy8hL4tdlE9J64RyRcJ6B532yjAmSbdiPzaeeKDdyALeQiQ2?=
 =?us-ascii?Q?8NPxMTRjYfKvTPcPh4xzmUp7Ajf3GYx7SC2Wzr9FO2zDwrep6wDIXko5g8km?=
 =?us-ascii?Q?OmGSW2BmHxCYkc9v8UarVeaFbClMR2ePDdBoVnUAfUPzgZ1paVlnWWQ3wavw?=
 =?us-ascii?Q?18YyMjnTjk74cFSjQYOJ323Vu1/K+WGRsUn/QFewCnw82Ww88sQt1ByTbvYw?=
 =?us-ascii?Q?PcpfXjtTQOVsj3U2PwGOiBf5DjcWDd5vP7WdRRQgWqIfT3TAijTygL8Kgd4S?=
 =?us-ascii?Q?1QGEReiixVRKxoUglarI6W+QxCsTF2Fw3Ap2tNKkVK6tudAFocdGlKAUilX9?=
 =?us-ascii?Q?s0vdEdgbrdTqwD2Rm3xwMC13qExvudhuwCewGmlCSJlMUFy8AL2gUf6OO+0h?=
 =?us-ascii?Q?g+xCLLVhtH7dJwzwSGp3bFo4OHws+uQFTJPmOd636jaR8bMPJJoJy2hTjnSl?=
 =?us-ascii?Q?IdMLpF0mZbX6KoLaP7MB7SNwilIA6W4YHwQPNxveqzEZOYmULigvoP3z9yDv?=
 =?us-ascii?Q?X5xHYnZ3zbtFR4jpdiiT0BLx7LfudYkU5boamo6Y1QxDfz6uGpZrzXYU9B9D?=
 =?us-ascii?Q?JLfyhvSU3ZTa3VThakDnaQCKWS8fU5AboAqUBL0k14k3m8Z4wjz2aDimzNFm?=
 =?us-ascii?Q?doHuLY65IHPWmrUc5fc9jh6V1AbU0M8zqr1m7fdEkqSS7Gn+XilIiAFeK7hb?=
 =?us-ascii?Q?3ut7CQYb/89+pY0fL7TpTGNJlBrpAoF4YCf7Q/BN6SgSmLBC712fIELQtMel?=
 =?us-ascii?Q?7dLrkbd2DtrmC22Zve6oZe3kA7xpm/k25IU92H57/mkhd9A8DaOAk3t3PloM?=
 =?us-ascii?Q?TQA2fE3XWb9eE6XKxda5vHXlypa13v7GgRjbu/9ksSMm05nS7doP5BEeFLFV?=
 =?us-ascii?Q?Lj/tfOxHQbXb+w6U4YVzxpGiG9quMMTntTTbKmM4x9NuEjO2f/TEYS11k4Yv?=
 =?us-ascii?Q?QQ1hNQMRarR2M4z1OBTq0NwLjHXYa9niOAnJ4IpEPYOt3r3qHQVkRiO9nmjc?=
 =?us-ascii?Q?5rKjtdpISj+JtfpkuxQ1/hGY9uJqFGUgS5FugejU/6OCF15w1FbEVc4Rc9G3?=
 =?us-ascii?Q?B5NRmNhNkJAyrZ6v9L3tSSg0//QkusMz0JRrCzn4S4SrNhnQBdd+NGxvp4ks?=
 =?us-ascii?Q?SQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a996be27-c8ec-4819-c88b-08da9cda8bee
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 20:39:29.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 4TgQ6ecm+KSMnIF5wDHSZCsVFT5a7z5chqIIhThOsqpuLTWIETPKPx3cHlguwnH3wK9F2lTEOisJnxgtEF8QVBgFeJwaUC/Mrx0jVNqsFkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5384
X-Proofpoint-ORIG-GUID: Tjfn06HCTdHtlr7GDOYwaAi2rBA_XJ8I
X-Proofpoint-GUID: Tjfn06HCTdHtlr7GDOYwaAi2rBA_XJ8I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209220132
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Sep 2022 20:39:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98930

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
index bf9915294..0b934ee2d 100644
--- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
+++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "git://github.com/diamon/minicoredumper;protocol=https;branch=master \
            file://0001-replace-pthread_mutexattr_setrobust_np-with-pthread_.patch \
            file://minicoredumper.service \
            file://minicoredumper.init \
+           file://0001-minicoredumper-retry-elf-parsing-as-long-as-needed.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
2.33.0


