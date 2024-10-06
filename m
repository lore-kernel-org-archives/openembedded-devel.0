Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904CBCFB424
	for <webhook@archiver.kernel.org>; Sun,  6 Oct 2024 16:12:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33731.1728231142990865687
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Oct 2024 09:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0009f33b99=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 496FqQ2t008523
	for <openembedded-devel@lists.openembedded.org>; Sun, 6 Oct 2024 09:12:22 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2047.outbound.protection.outlook.com [104.47.56.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4230r490ar-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 09:12:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1vV8n/LqITqY4V/bOk1Kz0g5AKgES9DuYBjgs/RM+bnxLW5kG6nCnETucpaBfMtS/ck4ItxlCNIIIyxGhNeJ3qIgBk8OIQkdNmJLin3C4awbargF21ACSN9bhzM+XaQ93KIQLU7zdg6VFrG1YFxtTsIOoV4Q9cUG0Dku7dWVn1lgsYYbsSHV2jXDr6Uijj2a+1t+NF28KBjpEM3Y5yTOHEr6Zn8fGJwfQrnsOtbwPYWHv6xMC7bA7L60OW6Z+5AhU+OQXrnLb2oM3C8mFQNhXRpFA7TXzd0SUtBbX4npx0s3S2cUmou4WYF0IzCbLVvD/g5qpNr+WHUhVBZR6iaqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S16+x7wlbOWwggnjIh2GgIWszkGDiGoGnMbANX8NOcs=;
 b=A3BKbwYcolUnZiuc0wnQS9AM9wHAHL31v69CabRN1EJ6GUGX8LlY5OdXk2dFfzT+XUOipogKt2WUMTpVvli+Tl4WSZcoi7eVl60bB19+xcuKlqkNu6meerV63txAljG5wWDphMGAgKZYTcVaIDZ2ncxz4yARbG6364LoiQd3tjxtpxu28/QF/x3RC0iOxGcTSffv5y+GCSvPsCIIMpuluRomGyFkxYnAYEXwT7RIvWX2ZuPuJyss0FB6FsRvIVHkeMZ7ZQn7kjviUMbzFQNyfUxEmUn6xbJ7H7jZiTbHeZGiz8ymJUvyzFAV9NrHw/t2y7I1Htsen86BrHHPDzmEcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.20; Sun, 6 Oct
 2024 16:12:19 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8026.020; Sun, 6 Oct 2024
 16:12:19 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libhugetlbfs: upgrade 2.23 -> 2.24
Date: Mon,  7 Oct 2024 00:11:59 +0800
Message-Id: <20241006161159.1235741-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0179.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::7) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b4c8f9-2d29-4de8-ecdb-08dce621a700
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4L2LjXFADTIDUXlPIXJi1n34hW8LhCjLLDd8ru+2I08XeFHuUPVneULnsvtH?=
 =?us-ascii?Q?gOYR5OXN4ABoXdin7EZNb/i+pw8iN+kvSBNseiRMCB9foDDMRKCvOTktOFiL?=
 =?us-ascii?Q?DbRgkmtBhNFo85o/dJkdVOuBNYZeRHIk4XPByr4DtpeXvauyCYCD8vKtr4/+?=
 =?us-ascii?Q?GiWRM8bStIxwWNT6Cyb6U37a+U7paBsuLk9PXJ6nVFAxoRa8gvudHdl46C2t?=
 =?us-ascii?Q?dRCVWMe1Kz4oGbFc4Hnkz1bmFAGTovgt8zmV9FWdoCEIqxEjRvr6sXZxtXqh?=
 =?us-ascii?Q?clFE0qhvwDd8/gtZilIlLiXQ36iuhGAKC4fuirwU33M2Cs02Vcj86LNzdKus?=
 =?us-ascii?Q?Zf1pjw0TdUrIBB/2WciSGeK+P5E1lg1+1eNsS2n+Y/ObVXXaUBFNcEjmP/fr?=
 =?us-ascii?Q?h/7Mw0tCCAHss3rHYewAh88lImb6lY038lshVlf1ONDpWBTVQdF1jOve4RL6?=
 =?us-ascii?Q?KfhZK3o5F0lWi1W4PUyg0ccMIXWdTzgAJwSbB53El8jRpF/bFV2kKj7k3hBu?=
 =?us-ascii?Q?dgMzYFLOOXV3knrZ1YczR4gOWSzsGCMCxg+JEHopwfLIN55TInNAhyO0BHVt?=
 =?us-ascii?Q?b4mheo5xAaYadgGM36DB5+/iniVa2E0cC/chNNa5ZO673xij17Sur7MsxL6N?=
 =?us-ascii?Q?DfZwXwLrAh+OJDZXTO2qrlKgO6g5Nv6q/tDh0myAzaOalPp7NGvgM8hnGNiA?=
 =?us-ascii?Q?zdoicQvJGBSUb14Eqw19xvIoYjLChpgPFxiihBS0WLCGU1w0D7UHpQFIgvIL?=
 =?us-ascii?Q?du0ff1XpEWAGmU55/gGbKLJaSb+yGgMWb00dxYZfTfQC0rbYuLEyyP2aV/E2?=
 =?us-ascii?Q?cIbtAkdjFzhqdQgXuvv2CaaJnqNedyKHUKSgnIUFLEFD+mn/As5+7iKlmBZM?=
 =?us-ascii?Q?CDbnJqg9Tk/+2QrOKZPIMkkamgaAS4ETAL7AAz0eDkIC3qUQ+HoDZejkhAmQ?=
 =?us-ascii?Q?8Fx7YUrM2EZ6W03Dn09Ax2Q6O/kRrQnsmpW4B6e3zUXu5TiFDhTkUotcz83/?=
 =?us-ascii?Q?iF3ImY+5d9/ZqW7ijaXcCU/emu1TvwosR83V2MFmEP9SVd5UiMpqIKsiE3+E?=
 =?us-ascii?Q?mjCSsXDCBbgVPtctsOSdnAZwmGXaiS8AXajJCtAuaJokNo4B00e5BOlpyRph?=
 =?us-ascii?Q?92c++eKdzvl6EIII3tOG0dPH0zXldNhJC9K1qTNRw3ko5f8L7e9b8ujuTNva?=
 =?us-ascii?Q?z3Lj0AnxgrabKjTSV0MoUfSRPch4VHAUtiY6S3u5CigI+73MQpo7OpB8B3ZA?=
 =?us-ascii?Q?/ZkEGCP/uJnkURrKZtd/ygw9odebmBwqFQsLDMd4G2YIpnUMLnk1Ey1RGK6q?=
 =?us-ascii?Q?Ld8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?D/vF83QZQ3t82CTCvt3dtKCEqFVNQPeBxPwFLwHM3W8DsGhVzeAAYYuuj02v?=
 =?us-ascii?Q?lPtQZh0zXU02+gIukkqRsb5W6jHjivP5NW8pRZm5MK3CFOJL+13OPOLW5Yih?=
 =?us-ascii?Q?GTiuvRYx106XEcktSsOlRza8ls8tVvTm0c692kUnI6BZVSpD7p9axAIdLK4x?=
 =?us-ascii?Q?+lynCINrWJTUTOnTZjved3DZD9+uXTC2A3sHaT3BsUlBy3RYgQlKRyHBy60/?=
 =?us-ascii?Q?ZJSq3lu8cEdAiq9U9Jv3U4ePv09M052otV46FMO3USBxCgXkgvlAu/Ex4sB6?=
 =?us-ascii?Q?MJnikOBNJ+6lXhwkQ0OzVdtjhO8+OukjXIQhkDrsXACDM0hg5wEssC39eLCy?=
 =?us-ascii?Q?p5eTe+Y9O7FRtUFHWDn6VWWkgusJ/NJyt/qCJXyt3B/DixYzUJqbMGVswXDq?=
 =?us-ascii?Q?qYa5EvMTlZni/bsTq4ow3h1KZ0F1acufoLtbpGHSyI3bANZ+gGyf1slDzKVT?=
 =?us-ascii?Q?9RIsiTbOStCFLFLCShvWUdDUJyHTy4/HbA3DgmYhqgvAv6QgYUwMZsmaK3SR?=
 =?us-ascii?Q?/lBwSUyCpERoUCyyrbfiXE2OzE14lgMNGRVVNbX+an95LXxg1xoecV5q7eZD?=
 =?us-ascii?Q?hKfIzLn3dwEO8p5jmo2EK8/gcJuTJxAeWGbkmdm0iVoE3Q7uPXvD/jJFFRPb?=
 =?us-ascii?Q?tnJ2WabamtFb04/8inuDhf1kIGAqQEBa5DN6Wwo+KAAB2WmPEULeDa6SnhwK?=
 =?us-ascii?Q?VpNqGBhef621ph442kg5v+N3tHTqJkmwTHXau22vq3MFrbcJzkuIU2piXCKS?=
 =?us-ascii?Q?i6Jv0cDz1kK7K+qqC30x2zCD8Hz21/wy+WsOuUHTayiVbpVAdsYWExsifmQN?=
 =?us-ascii?Q?7ItibM78+wXh8ezDuR/Lvp8UF/pGbAmFFxt2mgGOUi1CZXE4UDXzDKM3OdW+?=
 =?us-ascii?Q?PL6Z8um6quEYo2QTyRjmwAY+D5cYClp41jIIqqVeZe9KZ9s9D1CX+p7akk3q?=
 =?us-ascii?Q?TUWHOmSZG8sHjmqeJb/M29Lu/oZrIDiYyZjwwluW5XuqDVV22tJzqkc4PaCq?=
 =?us-ascii?Q?EMemziLRH+/H4yCRnRnkf7tUIsNSqN2flqc/LJri1tQykRBcSL8dS3MhaBGC?=
 =?us-ascii?Q?P8onJ5T+wN8ss6Oha9Er1cP9N4W6XzyKlj1u1iRfcWYbyyjsY8KVrUIURNn3?=
 =?us-ascii?Q?MSJNf8M3iS4WxIaN/leJPJ0IWx6gf6gBGyTHZjN8VZo//KJxs9o4V08bcbf2?=
 =?us-ascii?Q?j9Hot1yCQeiJ7i5s5Hl1KnFuTDLxTy7uLFvvzlh10qLC79NAgspJMWF0KtjF?=
 =?us-ascii?Q?jzod4GreyEhrc8agB68OIiRPJqGQlS0aR1ml+Gw29msGrkAqF0YI6YqwBeGI?=
 =?us-ascii?Q?hi7qNmOJVCxnHHHCKgIoxWIfGW7OtUpFgnD18QWjln5eLWou0Z9CmIlHIQV4?=
 =?us-ascii?Q?F/z6L1ODEMwb87JK+SF2stJnjGcPn0rGS/02mshoUf0ST1YsJ3Wyu65UPrRG?=
 =?us-ascii?Q?ewJdglbZMjgdCG5uS8IfiC/CaHRRG3c4CuIGr8+sEYWHmoX/LSQ/R6f/ZCWJ?=
 =?us-ascii?Q?QPom+jqv6hesM+SHJD8EQOTJus80ktgJISXVAbromASpRmd3Zy9/IGpJsf5T?=
 =?us-ascii?Q?uJ0B7RHV1bgSEkSox23r17rZHQpRXHDoOS/cB915?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0b4c8f9-2d29-4de8-ecdb-08dce621a700
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2024 16:12:19.3052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yFBjcEK+EDl+yyp6crN2E4NbiSK2FQX/xMQcQ5k94Hu6IYGaiAIiQO96kO9uHIsYQk+p0OqxPiz/4uTLY59Ugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
X-Proofpoint-ORIG-GUID: JxzO0Vq2O9eHlu13cxAvB3Tjp6yO0PNz
X-Authority-Analysis: v=2.4 cv=bP1EI++Z c=1 sm=1 tr=0 ts=6702b6e6 cx=c_pps a=e6lK8rWizvdfspXvJDLByw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=57SyGIRnAAAA:8
 a=pGLkceISAAAA:8 a=6ohNodAXAAAA:8 a=AUd_NHdVAAAA:8 a=omOdbC7AAAAA:8 a=5KEJ3k9QAAAA:8 a=aej7JnXp66PWyd6j8aMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=0gLUg1G2xj6MhZ7RLP3J:22 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-GUID: JxzO0Vq2O9eHlu13cxAvB3Tjp6yO0PNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-06_13,2024-10-04_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410060117
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Oct 2024 16:12:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112685

ChangeLog:
https://github.com/libhugetlbfs/libhugetlbfs/blob/2.24/NEWS

* Refresh patches
* Drop backport patches
* Inherit autotools-brokensep since it has switched to automake
* Add a patch to fix build on musl

Test Results:
$ mkdir -p /mnt/hugetlbfs
$ mount -t hugetlbfs none /mnt/hugetlbfs

$ hugeadm --pool-pages-min 2MB:64
$ hugeadm --pool-pages-max 2MB:256

$ cd /usr/lib/libhugetlbfs/tests/
$ ./run_tests.py
PASS
zero_filesize_segment (2M: 64): PASS
test_root (2M: 64):     PASS
meminfo_nohuge (2M: 64):        PASS
gethugepagesize (2M: 64):       PASS
gethugepagesizes (2M: 64):      PASS
HUGETLB_VERBOSE=1 empty_mounts (2M: 64):        PASS
HUGETLB_VERBOSE=1 large_mounts (2M: 64):        PASS
find_path (2M: 64):     PASS
unlinked_fd (2M: 64):   PASS
readback (2M: 64):      PASS
truncate (2M: 64):      PASS
shared (2M: 64):        PASS
mprotect (2M: 64):      PASS
mlock (2M: 64): PASS
misalign (2M: 64):      PASS
fallocate_basic.sh (2M: 64):    PASS
fallocate_align.sh (2M: 64):    PASS
ptrace-write-hugepage (2M: 64): PASS
icache-hygiene (2M: 64):        PASS
slbpacaflush (2M: 64):  PASS (inconclusive)
straddle_4GB_static (2M: 64):   PASS
huge_at_4GB_normal_below_static (2M: 64):       PASS
huge_below_4GB_normal_above_static (2M: 64):    PASS
map_high_truncate_2 (2M: 64):   PASS
misaligned_offset (2M: 64):     PASS (inconclusive)
truncate_above_4GB (2M: 64):    PASS
brk_near_huge (2M: 64): Fatal glibc error: malloc.c:2599 (sysmalloc): assertion failed: (old_top == initial_top (av) && old_size = = 0) || ((unsigned long) (old_size) >= MINSIZE && prev_inuse (old_top) && ((unsigned long) old_end & (pagesize - 1)) == 0)
task-size-overrun (2M: 64):     PASS
stack_grow_into_huge (2M: 64):  PASS
corrupt-by-cow-opt (2M: 64):    PASS
noresv-preserve-resv-page (2M: 64):     PASS
noresv-regarded-as-resv (2M: 64):       PASS
readahead_reserve.sh (2M: 64):  PASS
madvise_reserve.sh (2M: 64):    PASS
fadvise_reserve.sh (2M: 64):    PASS
mremap-expand-slice-collision.sh (2M: 64):      PASS
mremap-fixed-normal-near-huge.sh (2M: 64):      PASS
mremap-fixed-huge-near-normal.sh (2M: 64):      PASS
set shmmax limit to 67108864
shm-perms (2M: 64):     PASS
private (2M: 64):       PASS
fork-cow (2M: 64):      PASS
direct (2M: 64):        PASS
malloc (2M: 64):        PASS
LD_PRELOAD=libhugetlbfs.so HUGETLB_MORECORE=yes malloc (2M: 64):        SKIPPED
LD_PRELOAD=libhugetlbfs.so HUGETLB_MORECORE=yes HUGETLB_RESTRICT_EXE=unknown:none malloc (2M: 64):      SKIPPED
LD_PRELOAD=libhugetlbfs.so HUGETLB_MORECORE=yes HUGETLB_RESTRICT_EXE=unknown:malloc malloc (2M: 64):    SKIPPED
malloc_manysmall (2M: 64):      PASS
LD_PRELOAD=libhugetlbfs.so HUGETLB_MORECORE=yes malloc_manysmall (2M: 64):      SKIPPED
GLIBC_TUNABLES=glibc.malloc.tcache_count=0 heapshrink (2M: 64): PASS
GLIBC_TUNABLES=glibc.malloc.tcache_count=0 LD_PRELOAD=libheapshrink.so heapshrink (2M: 64):     PASS
GLIBC_TUNABLES=glibc.malloc.tcache_count=0 LD_PRELOAD=libhugetlbfs.so HUGETLB_MORECORE=yes heapshrink (2M: 64): SKIPPED
GLIBC_TUNABLES=glibc.malloc.tcache_count=0 LD_PRELOAD=libhugetlbfs.so libheapshrink.so HUGETLB_MORECORE=yes heapshrink (2M: 64): SKIPPED
GLIBC_TUNABLES=glibc.malloc.tcache_count=0 LD_PRELOAD=libheapshrink.so HUGETLB_MORECORE=yes HUGETLB_MORECORE_SHRINK=yes heapshrink (2M: 64):      SKIPPED
GLIBC_TUNABLES=glibc.malloc.tcache_count=0 LD_PRELOAD=libhugetlbfs.so libheapshrink.so HUGETLB_MORECORE=yes HUGETLB_MORECORE_SHRINK=yes heapshrink (2M: 64):      SKIPPED
HUGETLB_VERBOSE=1 HUGETLB_MORECORE=yes heap-overflow (2M: 64):  SKIPPED
HUGETLB_VERBOSE=0 linkhuge_nofd (2M: 64):       PASS
LD_PRELOAD=libhugetlbfs.so HUGETLB_VERBOSE=0 linkhuge_nofd (2M: 64):    PASS
linkhuge (2M: 64):      PASS
LD_PRELOAD=libhugetlbfs.so linkhuge (2M: 64):   PASS
linkhuge_rw (2M: 64):   PASS
HUGETLB_ELFMAP=R linkhuge_rw (2M: 64):  PASS
HUGETLB_ELFMAP=W linkhuge_rw (2M: 64):  PASS
HUGETLB_ELFMAP=RW linkhuge_rw (2M: 64): PASS
HUGETLB_ELFMAP=no linkhuge_rw (2M: 64): PASS
HUGETLB_MINIMAL_COPY=no HUGETLB_ELFMAP=R linkhuge_rw (2M: 64):  PASS
HUGETLB_MINIMAL_COPY=no HUGETLB_ELFMAP=W linkhuge_rw (2M: 64):  PASS
HUGETLB_MINIMAL_COPY=no HUGETLB_ELFMAP=RW linkhuge_rw (2M: 64): PASS
HUGETLB_ELFMAP=R HUGETLB_SHARE=0 linkhuge_rw (2M: 64):  PASS
HUGETLB_ELFMAP=R HUGETLB_SHARE=1 linkhuge_rw (2M: 64):  PASS
HUGETLB_ELFMAP=W HUGETLB_SHARE=0 linkhuge_rw (2M: 64):  PASS
HUGETLB_ELFMAP=W HUGETLB_SHARE=1 linkhuge_rw (2M: 64):  PASS
HUGETLB_ELFMAP=RW HUGETLB_SHARE=0 linkhuge_rw (2M: 64): PASS
HUGETLB_ELFMAP=RW HUGETLB_SHARE=1 linkhuge_rw (2M: 64): PASS
chunk-overcommit (2M: 64):      PASS
alloc-instantiate-race shared (2M: 64): PASS
alloc-instantiate-race private (2M: 64):        PASS
truncate_reserve_wraparound (2M: 64):   PASS
truncate_sigbus_versus_oom (2M: 64):    PASS
get_huge_pages (2M: 64):        PASS
shmoverride_linked (2M: 64):    PASS
HUGETLB_SHM=yes shmoverride_linked (2M: 64):    PASS
LD_PRELOAD=libhugetlbfs.so shmoverride_unlinked (2M: 64):       PASS
LD_PRELOAD=libhugetlbfs.so HUGETLB_SHM=yes shmoverride_unlinked (2M: 64):       PASS
quota.sh (2M: 64):      PASS
counters.sh (2M: 64):   PASS
mmap-gettest 10 64 (2M: 64):    PASS
mmap-cow 63 64 (2M: 64):        PASS
set shmmax limit to 134217728
shm-fork 10 32 (2M: 64):        PASS
set shmmax limit to 134217728
shm-fork 10 64 (2M: 64):        PASS
set shmmax limit to 134217728
shm-getraw 64 /dev/full (2M: 64):       PASS
fallocate_stress.sh (2M: 64):   PASS
********** TEST SUMMARY
*                      2M
*                      32-bit 64-bit
*     Total testcases:     0     91
*             Skipped:     0      9
*                PASS:     0     81
*                FAIL:     0      0
*    Killed by signal:     0      1
*   Bad configuration:     0      0
*       Expected FAIL:     0      0
*     Unexpected PASS:     0      0
*    Test not present:     0      0
* Strange test result:     0      0
**********

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...bfs-fix-Ttext-segment-argument-on-AA.patch | 210 ------------------
 ...32-and-LIB64-if-they-point-to-the-s.patch} |  19 +-
 ...Append-CPPFLAGS-rather-then-override.patch |  31 ---
 ...d-search-host-library-path-for-cros.patch} |   6 +-
 ...le-install-static-4G-edge-testcases.patch} |  22 +-
 ...t-use-hard-coded-path-.-obj-hugeadm.patch} |   8 +-
 ...i386-avoid-search-host-library-path.patch} |   6 +-
 ...0006-include-stddef.h-for-ptrdiff_t.patch} |  12 +-
 ...=> 0007-Mark-glibc-specific-code-so.patch} |  19 +-
 ...conf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} |  12 +-
 ...hm.c-Mark-glibc-specific-changes-so.patch} |  10 +-
 ... => 0010-Include-dirent.h-for-ino_t.patch} |   8 +-
 ... 0011-include-limits.h-for-PATH_MAX.patch} |  14 +-
 ...etup_helper-use-python3-interpreter.patch} |   6 +-
 ...link.c-include-libgen.h-for-basename.patch |  41 ++++
 ...bhugetlbfs_git.bb => libhugetlbfs_2.24.bb} |  55 +++--
 16 files changed, 149 insertions(+), 330 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch => 0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch} (70%)
 delete mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-avoid-search-host-library-path-for-cros.patch => 0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch} (98%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{tests-Makefile-install-static-4G-edge-testcases.patch => 0003-tests-Makefile-install-static-4G-edge-testcases.patch} (73%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch => 0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch} (90%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{libhugetlbfs-elf_i386-avoid-search-host-library-path.patch => 0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch} (94%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-include-stddef.h-for-ptrdiff_t.patch => 0006-include-stddef.h-for-ptrdiff_t.patch} (81%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0002-Mark-glibc-specific-code-so.patch => 0007-Mark-glibc-specific-code-so.patch} (74%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch => 0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch} (92%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0004-shm.c-Mark-glibc-specific-changes-so.patch => 0009-shm.c-Mark-glibc-specific-changes-so.patch} (91%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0005-Include-dirent.h-for-ino_t.patch => 0010-Include-dirent.h-for-ino_t.patch} (90%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0006-include-limits.h-for-PATH_MAX.patch => 0011-include-limits.h-for-PATH_MAX.patch} (85%)
 rename meta-oe/recipes-benchmark/libhugetlbfs/files/{0001-huge_page_setup_helper-use-python3-interpreter.patch => 0012-huge_page_setup_helper-use-python3-interpreter.patch} (88%)
 create mode 100644 meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch
 rename meta-oe/recipes-benchmark/libhugetlbfs/{libhugetlbfs_git.bb => libhugetlbfs_2.24.bb} (52%)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch
deleted file mode 100644
index 0787ef27d..000000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch
+++ /dev/null
@@ -1,210 +0,0 @@
-From 0a163f60b4a316c4b6f1726a71c84755f3bd85e7 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <martin.jansa@lge.com>
-Date: Wed, 16 Sep 2020 04:36:04 -0700
-Subject: [PATCH] Revert "ld.hugetlbfs: fix -Ttext-segment argument on AArch64"
-
-This reverts commit 852dcc963ce44861ed7c4e225aa92ff2b5b43579.
-
-* works around
-  ERROR: libhugetlbfs-1_2.23-r0 do_populate_sysroot: Fatal errors occurred in subprocesses:
-  Command '['arm-oe-linux-gnueabi-strip', '--remove-section=.comment', '--remove-section=.note', 'libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw']' returned non-zero exit status 1.
-  Subprocess output:arm-oe-linux-gnueabi-strip:
-  libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58: error: PHDR segment not covered by LOAD segment
-  arm-oe-linux-gnueabi-strip: libhugetlbfs/1_2.23-r0/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/stmuFa58[.interp]: file format not recognized
-
-I don't see anything suspicious in the build (the same cmdline as in 2.22
-version), but it uses
-
-libhugetlbfs/1_2.22-r0-old/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
- -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
--Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
--fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
--Werror=format-security -Werror=return-type
---sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.22-r0/recipe-sysroot
--I.. -O2 -Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
-libhugetlbfs/1_2.22-r0-old/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
- -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
--Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
--fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
--Werror=format-security -Werror=return-type
---sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.22-r0/recipe-sysroot
--B./obj32 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
--ldl -L../obj32 -o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl
--lhugetlbfs_privutils -Wl,--hugetlbfs-align obj32/linkhuge_rw.o
-obj32/testutils.o
-libhugetlbfs/1_2.23-r0-new/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
- -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
--Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
--fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
--Werror=format-security -Werror=return-type
---sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.23-r0/recipe-sysroot
--I.. -O2 -Wall -g -o obj32/linkhuge_rw.o -c linkhuge_rw.c
-libhugetlbfs/1_2.23-r0-new/temp/log.do_compile:arm-oe-linux-gnueabi-gcc
- -mthumb -mfpu=neon-vfpv4 -mfloat-abi=hard -mcpu=cortex-a7 -Wl,-O1
--Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
--fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
--Werror=format-security -Werror=return-type
---sysroot=/jenkins/mjansa/build/ros/oe-melodic-gatesgarth/libhugetlbfs/1_2.23-r0/recipe-sysroot
--B./obj32 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now
--ldl -L../obj32 -o obj32/linkhuge_rw -Wl,--no-as-needed -lpthread -ldl
--lhugetlbfs_privutils -Wl,--hugetlbfs-align obj32/linkhuge_rw.o
-obj32/testutils.o
-
-And the git log between 2.22 and 2.23 is also very short and looks
-reasonable.
-https://github.com/libhugetlbfs/libhugetlbfs/compare/2.22...2.23
-
-When checking with readelf -l it also shows the error about PHDR segment:
-arm-oe-linux-gnueabi-readelf -l
-./1_2.22-r0-old/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw
-
-Elf file type is DYN (Shared object file)
-Entry point 0x201105
-There are 10 program headers, starting at offset 52
-
-Program Headers:
-  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
-  PHDR           0x000034 0x00200034 0x00200034 0x00140 0x00140 R   0x4
-  INTERP         0x000174 0x00200174 0x00200174 0x0001d 0x0001d R   0x1
-      [Requesting program interpreter: /usr/lib/ld-linux-armhf.so.3]
-  LOAD           0x000000 0x00200000 0x00200000 0x1222c 0x1222c R E 0x200000
-  LOAD           0x1ffdf0 0x005ffdf0 0x005ffdf0 0x102e0 0x202ec RW  0x200000
-  DYNAMIC        0x1ffdf8 0x005ffdf8 0x005ffdf8 0x00128 0x00128 RW  0x4
-  NOTE           0x000194 0x00200194 0x00200194 0x00044 0x00044 R   0x4
-  GNU_EH_FRAME   0x012224 0x00212224 0x00212224 0x00008 0x00008 R   0x4
-  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
-  EXIDX          0x001c5c 0x00201c5c 0x00201c5c 0x00008 0x00008 R   0x4
-  GNU_RELRO      0x1ffdf0 0x005ffdf0 0x005ffdf0 0x00210 0x00210 RW  0x4
-
- Section to Segment mapping:
-  Segment Sections...
-   00
-   01     .interp
-   02     .interp .note.ABI-tag .note.gnu.build-id .dynsym .dynstr
-.gnu.hash .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt .text
-.fini .ARM.extab .ARM.exidx .rodata .eh_frame .eh_frame_hdr
-   03     .fini_array .init_array .dynamic .got .data .bss
-   04     .dynamic
-   05     .note.ABI-tag .note.gnu.build-id
-   06     .eh_frame_hdr
-   07
-   08     .ARM.extab .ARM.exidx
-   09     .fini_array .init_array .dynamic .got
-
-arm-oe-linux-gnueabi-readelf -l
-./1_2.23-r0-new/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw
-
-Elf file type is DYN (Shared object file)
-Entry point 0x31cd1
-There are 10 program headers, starting at offset 52
-
-Program Headers:
-  Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
-  PHDR           0x000000 0x00000000 0x00000000 0x00000 0x00000 R   0
-readelf: Error: the PHDR segment is not covered by a LOAD segment
-  INTERP         0x030d40 0x00030d40 0x00030d40 0x0001d 0x0001d R   0x1
-      [Requesting program interpreter: /usr/lib/ld-linux-armhf.so.3]
-  LOAD           0x030d40 0x00030d40 0x00030d40 0x120b8 0x120b8 R E 0x200000
-  LOAD           0x1ffdf0 0x003ffdf0 0x003ffdf0 0x102e0 0x202ec RW  0x200000
-  DYNAMIC        0x1ffdf8 0x003ffdf8 0x003ffdf8 0x00128 0x00128 RW  0x4
-  NOTE           0x030d60 0x00030d60 0x00030d60 0x00044 0x00044 R   0x4
-  GNU_EH_FRAME   0x042df0 0x00042df0 0x00042df0 0x00008 0x00008 R   0x4
-  GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
-  EXIDX          0x032828 0x00032828 0x00032828 0x00008 0x00008 R   0x4
-  GNU_RELRO      0x1ffdf0 0x003ffdf0 0x003ffdf0 0x00210 0x00210 RW  0x4
-
- Section to Segment mapping:
-  Segment Sections...
-   00
-   01     .interp
-   02     .interp .note.ABI-tag .note.gnu.build-id .dynsym .dynstr
-.gnu.hash .gnu.version .gnu.version_r .rel.dyn .rel.plt .init .plt .text
-.fini .ARM.extab .ARM.exidx .rodata .eh_frame .eh_frame_hdr
-   03     .fini_array .init_array .dynamic .got .data .bss
-   04     .dynamic
-   05     .note.ABI-tag .note.gnu.build-id
-   06     .eh_frame_hdr
-   07
-   08     .ARM.extab .ARM.exidx
-   09     .fini_array .init_array .dynamic .got
-
-And the diff between these 2:
-
-1_2.22-r0-old/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw.readelf
-1_2.23-r0-new/sysroot-destdir/usr/lib/libhugetlbfs/tests/obj32/linkhuge_rw.readelf
- Elf file type is DYN (Shared object file)
--Entry point 0x201105
-+Entry point 0x31cd1
- There are 10 program headers, starting at offset 52
-
- Program Headers:
-   Type           Offset   VirtAddr   PhysAddr   FileSiz MemSiz  Flg Align
--  PHDR           0x000034 0x00200034 0x00200034 0x00140 0x00140 R   0x4
--  INTERP         0x000174 0x00200174 0x00200174 0x0001d 0x0001d R   0x1
-+  PHDR           0x000000 0x00000000 0x00000000 0x00000 0x00000 R   0
-+readelf: Error: the PHDR segment is not covered by a LOAD segment
-+  INTERP         0x030d40 0x00030d40 0x00030d40 0x0001d 0x0001d R   0x1
-       [Requesting program interpreter: /usr/lib/ld-linux-armhf.so.3]
--  LOAD           0x000000 0x00200000 0x00200000 0x1222c 0x1222c R E 0x200000
--  LOAD           0x1ffdf0 0x005ffdf0 0x005ffdf0 0x102e0 0x202ec RW  0x200000
--  DYNAMIC        0x1ffdf8 0x005ffdf8 0x005ffdf8 0x00128 0x00128 RW  0x4
--  NOTE           0x000194 0x00200194 0x00200194 0x00044 0x00044 R   0x4
--  GNU_EH_FRAME   0x012224 0x00212224 0x00212224 0x00008 0x00008 R   0x4
-+  LOAD           0x030d40 0x00030d40 0x00030d40 0x120b8 0x120b8 R E 0x200000
-+  LOAD           0x1ffdf0 0x003ffdf0 0x003ffdf0 0x102e0 0x202ec RW  0x200000
-+  DYNAMIC        0x1ffdf8 0x003ffdf8 0x003ffdf8 0x00128 0x00128 RW  0x4
-+  NOTE           0x030d60 0x00030d60 0x00030d60 0x00044 0x00044 R   0x4
-+  GNU_EH_FRAME   0x042df0 0x00042df0 0x00042df0 0x00008 0x00008 R   0x4
-   GNU_STACK      0x000000 0x00000000 0x00000000 0x00000 0x00000 RW  0x10
--  EXIDX          0x001c5c 0x00201c5c 0x00201c5c 0x00008 0x00008 R   0x4
--  GNU_RELRO      0x1ffdf0 0x005ffdf0 0x005ffdf0 0x00210 0x00210 RW  0x4
-+  EXIDX          0x032828 0x00032828 0x00032828 0x00008 0x00008 R   0x4
-+  GNU_RELRO      0x1ffdf0 0x003ffdf0 0x003ffdf0 0x00210 0x00210 RW  0x4
-
-  Section to Segment mapping:
-
-Revert fixes this build issue, but I still don't see why it fails this way.
-
-Upstream-Status: Pending
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
-
-# Please enter the commit message for your changes. Lines starting
-# with '#' will be ignored, and an empty message aborts the commit.
-#
-# Date:      Wed Sep 16 13:43:09 2020 +0200
-#
-# On branch jansa/master
-# Changes to be committed:
-#	new file:   meta-oe/recipes-benchmark/libhugetlbfs/files/0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch
-#	modified:   meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
-#
-# Untracked files:
-#	counts.txt
-#	diff
-#	log.svn
-#	log.svn2
-#	wip/
-#
----
- ld.hugetlbfs | 4 +---
- 1 file changed, 1 insertion(+), 3 deletions(-)
-
-diff --git a/ld.hugetlbfs b/ld.hugetlbfs
-index 5e4e497..6ee8238 100755
---- a/ld.hugetlbfs
-+++ b/ld.hugetlbfs
-@@ -130,9 +130,7 @@ if [ "$HTLB_ALIGN" == "slice" ]; then
- 	# targeting the ARM platform one needs to explicitly set the text segment offset
- 	# otherwise it will be NULL.
- 	case "$EMU" in
--	armelf*_linux_eabi|aarch64elf*|aarch64linux*)
--		printf -v TEXTADDR "%x" "$SLICE_SIZE"
--		HTLBOPTS="$HTLBOPTS -Ttext-segment=$TEXTADDR" ;;
-+	armelf*_linux_eabi|aarch64elf*|aarch64linux*)	HTLBOPTS="$HTLBOPTS -Ttext-segment=$SLICE_SIZE" ;;
- 	elf_i386)		HTLBOPTS="$HTLBOPTS -Ttext-segment=0x08000000" ;;
- 	elf64ppc|elf64lppc)
- 		if [ "$MMU_TYPE" == "Hash" ] ; then
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
similarity index 70%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
index a13c5389f..3dbc34d08 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch
@@ -1,20 +1,20 @@
-From 183a4dafe141197de5840f2e48c266ef209307aa Mon Sep 17 00:00:00 2001
+From b448672f1bc08dcef2ae07727ae6f124a3032a35 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Mon, 18 Jun 2012 16:37:05 +0800
 Subject: [PATCH] skip checking LIB32 and LIB64 if they point to the same place
 
 Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Ting Liu <b28495@freescale.com>
 
+Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
- Makefile | 1 -
+ Makefile.in | 1 -
  1 file changed, 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index 51e41f0..373df3c 100644
---- a/Makefile
-+++ b/Makefile
-@@ -177,7 +177,6 @@ REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
+diff --git a/Makefile.in b/Makefile.in
+index 65ae5a4..25be577 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -196,7 +196,6 @@ REALLIB32 = $(realpath $(PREFIX)/$(LIB32))
  REALLIB64 = $(realpath $(PREFIX)/$(LIB64))
  ifneq ($(realpath $(PREFIX)),)
  ifeq ($(REALLIB32),$(REALLIB64))
@@ -22,3 +22,6 @@ index 51e41f0..373df3c 100644
  endif
  endif
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
deleted file mode 100644
index 78a4cb0fc..000000000
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From b6dba773491bbb7b4664dacdd87a12af860f1bd8 Mon Sep 17 00:00:00 2001
-From: Oleksiy Obitotskyy <oobitots@cisco.com>
-Date: Thu, 28 Jan 2021 05:43:33 -0800
-Subject: [PATCH] tests/makefile: Append CPPFLAGS rather then override
-
-CPPFLAGS overrided and we could miss some options needed.
-
-Upstream-Status: Submitted
-Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
----
- tests/Makefile | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/Makefile b/tests/Makefile
-index 0ca3716..d262932 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
-@@ -33,8 +33,8 @@ HELPERS = get_hugetlbfs_path compare_kvers
- HELPER_LIBS = libheapshrink.so
- BADTOOLCHAIN = bad-toolchain.sh
- 
--CFLAGS = -O2 -Wall -g
--CPPFLAGS = -I..
-+CFLAGS += -O2 -Wall -g
-+CPPFLAGS += -I..
- STATIC_LIBHUGE = -Wl,--whole-archive -lhugetlbfs -Wl,--no-whole-archive
- STATIC_LDLIBS = -Wl,--no-as-needed -lpthread
- LDLIBS = $(STATIC_LDLIBS) -ldl -lhugetlbfs_privutils
--- 
-2.26.2.Cisco
-
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch
similarity index 98%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch
index f95e9e85a..1b99c007f 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-avoid-search-host-library-path-for-cros.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch
@@ -1,4 +1,4 @@
-From 82a4f60ab24dff121f5f9d3bbcd9a8a28bb7caef Mon Sep 17 00:00:00 2001
+From d3903cbe348c6ecb2f38b37f20dafa6b0ca3b114 Mon Sep 17 00:00:00 2001
 From: Chunrong Guo <B40290@freescale.com>
 Date: Sun, 8 Sep 2013 23:21:49 -0500
 Subject: [PATCH] libhugetlbfs: avoid search host library path for cross
@@ -7,7 +7,6 @@ Subject: [PATCH] libhugetlbfs: avoid search host library path for cross
 Upstream-Status: Inappropriate [oe-core specific]
 
 Signed-off-by: Chunrong Guo <B40290@freescale.com>
-
 ---
  ldscripts/elf32ppclinux.xB   | 2 +-
  ldscripts/elf32ppclinux.xBDT | 2 +-
@@ -95,3 +94,6 @@ index 1855202..c62d245 100644
  INPUT(-lhugetlbfs);
  /* Do we need any of these for elf?
     __DYNAMIC = 0;    */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch
similarity index 73%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch
index b8b2f8e6f..98cdf2f51 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/tests-Makefile-install-static-4G-edge-testcases.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-tests-Makefile-install-static-4G-edge-testcases.patch
@@ -1,22 +1,21 @@
-From f1ad8ff887f16daee8d06eca3df0f2541bfdaac0 Mon Sep 17 00:00:00 2001
+From 3e54866a0ea3c9e933e91213cbe6e55b7ff67b87 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Mon, 23 Sep 2013 08:00:55 +0000
-Subject: [PATCH] libhugetlbfs: add recipe
-
-Upstream-Status: Submitted
+Subject: [PATCH] tests/Makefile: install static 4G edge testcases
 
 TESTS_64 is empty, install will fail due to missing file operand
 
-Signed-off-by: Ting Liu <b28495@freescale.com>
+Upstream-Status: Submitted
 
+Signed-off-by: Ting Liu <b28495@freescale.com>
 ---
- tests/Makefile | 2 +-
+ tests/Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/tests/Makefile b/tests/Makefile
-index 073df96..0ca3716 100644
---- a/tests/Makefile
-+++ b/tests/Makefile
+diff --git a/tests/Makefile.in b/tests/Makefile.in
+index d33a228..d262932 100644
+--- a/tests/Makefile.in
++++ b/tests/Makefile.in
 @@ -295,7 +295,7 @@ obj64/install:
  	$(INSTALL) -m 755 wrapper-utils.sh $(DESTDIR)$(INST_TESTSDIR64)/obj64
  	$(INSTALL) -m 755 $(HELPERS:%=obj64/%) $(DESTDIR)$(INST_TESTSDIR64)/obj64
@@ -26,3 +25,6 @@ index 073df96..0ca3716 100644
  	$(INSTALL) -m 755 run_tests.py $(DESTDIR)$(INST_TESTSDIR64)
  
  install: $(OBJDIRS:%=%/install)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
similarity index 90%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
index 83934abef..6b010365a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch
@@ -1,4 +1,4 @@
-From 0077532b07e268347cb8557be6d70148d5f0e840 Mon Sep 17 00:00:00 2001
+From 86d3ebfc4da5ccbc82fdee4abaf2cbf758d82403 Mon Sep 17 00:00:00 2001
 From: Ting Liu <b28495@freescale.com>
 Date: Wed, 21 Aug 2013 15:44:57 +0800
 Subject: [PATCH] run_test.py: not use hard coded path ../obj/hugeadm
@@ -20,10 +20,10 @@ Signed-off-by: Changqing Li <changqing.li@windriver.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/tests/run_tests.py b/tests/run_tests.py
-index 018264d..0aabcd1 100755
+index 4793262..6cd0241 100755
 --- a/tests/run_tests.py
 +++ b/tests/run_tests.py
-@@ -245,9 +245,19 @@ def get_pagesizes():
+@@ -250,9 +250,19 @@ def get_pagesizes():
      Use libhugetlbfs' hugeadm utility to get a list of page sizes that have
      active mount points and at least one huge page allocated to the pool.
      """
@@ -45,5 +45,5 @@ index 018264d..0aabcd1 100755
          return sizes
  
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
similarity index 94%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
index 7cc180a4b..fc8776af6 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch
@@ -1,4 +1,4 @@
-From b5887693d90c430291b644c2f5713b5fdd1777ce Mon Sep 17 00:00:00 2001
+From 8c7a379876e3c7a32bef8620f94a85d20b7b186f Mon Sep 17 00:00:00 2001
 From: Jackie Huang <jackie.huang@windriver.com>
 Date: Tue, 4 Nov 2014 00:49:11 -0800
 Subject: [PATCH] libhugetlbfs/elf_i386: avoid search host library path for
@@ -7,7 +7,6 @@ Subject: [PATCH] libhugetlbfs/elf_i386: avoid search host library path for
 Upstream-Status: Inappropriate [cross compile specific]
 
 Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
-
 ---
  ldscripts/elf_i386.xB   | 1 -
  ldscripts/elf_i386.xBDT | 1 -
@@ -37,3 +36,6 @@ index d72aebe..3bac1b1 100644
  INPUT(-lhugetlbfs);
  /* Do we need any of these for elf?
     __DYNAMIC = 0;    */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-stddef.h-for-ptrdiff_t.patch
similarity index 81%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-stddef.h-for-ptrdiff_t.patch
index 914b0514f..33a4efb1f 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-include-stddef.h-for-ptrdiff_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-stddef.h-for-ptrdiff_t.patch
@@ -1,18 +1,17 @@
-From 351d1de09dd80049b7a2cb02c5750635d0389873 Mon Sep 17 00:00:00 2001
+From 5fe5dae674e259bcdd57b9c6a0004111ab0700ce Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:25:57 -0700
 Subject: [PATCH] include stddef.h for ptrdiff_t
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  morecore.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/morecore.c b/morecore.c
-index 6563bbd..0eef782 100644
+index 405c566..0edccd2 100644
 --- a/morecore.c
 +++ b/morecore.c
 @@ -19,6 +19,7 @@
@@ -23,3 +22,6 @@ index 6563bbd..0eef782 100644
  #include <stdio.h>
  #include <stdlib.h>
  #include <malloc.h>
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0007-Mark-glibc-specific-code-so.patch
similarity index 74%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0007-Mark-glibc-specific-code-so.patch
index 7ad6c43eb..5b2c91b8a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0002-Mark-glibc-specific-code-so.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0007-Mark-glibc-specific-code-so.patch
@@ -1,21 +1,20 @@
-From 0f548286848c70aa325c6748d80e8651389b4938 Mon Sep 17 00:00:00 2001
+From c98e64c56d0118a2d5f950eaceaed0e85eaa2543 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:32:59 -0700
 Subject: [PATCH] Mark glibc specific code so
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  morecore.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/morecore.c b/morecore.c
-index 0eef782..d48509c 100644
+index 0edccd2..db22216 100644
 --- a/morecore.c
 +++ b/morecore.c
-@@ -364,6 +364,7 @@ void hugetlbfs_setup_morecore(void)
+@@ -371,6 +371,7 @@ void hugetlbfs_setup_morecore(void)
  
  	INFO("setup_morecore(): heapaddr = 0x%lx\n", heapaddr);
  
@@ -23,7 +22,7 @@ index 0eef782..d48509c 100644
  	heaptop = heapbase = (void *)heapaddr;
  	if (__hugetlb_opts.thp_morecore)
  		__morecore = &thp_morecore;
-@@ -371,7 +372,6 @@ void hugetlbfs_setup_morecore(void)
+@@ -378,7 +379,6 @@ void hugetlbfs_setup_morecore(void)
  		__morecore = &hugetlbfs_morecore;
  
  	/* Set some allocator options more appropriate for hugepages */
@@ -31,9 +30,13 @@ index 0eef782..d48509c 100644
  	if (__hugetlb_opts.shrink_ok)
  		mallopt(M_TRIM_THRESHOLD, hpage_size + hpage_size / 2);
  	else
-@@ -381,4 +381,5 @@ void hugetlbfs_setup_morecore(void)
+@@ -388,5 +388,6 @@ void hugetlbfs_setup_morecore(void)
  	 * This doesn't appear to prohibit malloc() from falling back
  	 * to mmap() if we run out of hugepages. */
  	mallopt(M_MMAP_MAX, 0);
 +#endif
  }
+ #endif /* HAS_MORECORE */
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
similarity index 92%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
index 858a8e511..73844b71f 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch
@@ -1,20 +1,19 @@
-From 9ff04d7acc700387e3837f8ab11a41efea5ee8b0 Mon Sep 17 00:00:00 2001
+From 4f69eb130dc2c67a90f2460cedb78f6db11dd6d2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:44:26 -0700
 Subject: [PATCH] alloc.c: Avoid sysconf(_SC_LEVEL2_CACHE_LINESIZE) on linux
 
 musl does not have it
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  alloc.c | 15 ++++++++++++++-
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/alloc.c b/alloc.c
-index bce9464..cf7eb40 100644
+index b8ed663..a58c43d 100644
 --- a/alloc.c
 +++ b/alloc.c
 @@ -245,6 +245,19 @@ void free_huge_pages(void *ptr)
@@ -46,3 +45,6 @@ index bce9464..cf7eb40 100644
  		linemod = time(NULL);
  	}
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0009-shm.c-Mark-glibc-specific-changes-so.patch
similarity index 91%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0009-shm.c-Mark-glibc-specific-changes-so.patch
index c3f7b3e47..4fbf30e24 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0004-shm.c-Mark-glibc-specific-changes-so.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0009-shm.c-Mark-glibc-specific-changes-so.patch
@@ -1,13 +1,12 @@
-From 9ce323432a7f4d99f617970c7e35b607b9bbf843 Mon Sep 17 00:00:00 2001
+From 37239dd5f14a34b05e77b3ca6e34f96161f1339a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:48:04 -0700
 Subject: [PATCH] shm.c: Mark glibc specific changes so
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  shm.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
@@ -28,3 +27,6 @@ index 1f82cab..9447b63 100644
  
  /* call syscall shmget through the generic syscall mechanism */
  static int syscall_shmget(key_t key, size_t size, int shmflg)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0010-Include-dirent.h-for-ino_t.patch
similarity index 90%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0010-Include-dirent.h-for-ino_t.patch
index 8bd163339..a530a5267 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0005-Include-dirent.h-for-ino_t.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0010-Include-dirent.h-for-ino_t.patch
@@ -1,4 +1,4 @@
-From bb8c370aaaf25b1fe1fbf984e73177018026cb91 Mon Sep 17 00:00:00 2001
+From ec9163c0436d1c77cecc941aca2e524b26001b15 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:51:02 -0700
 Subject: [PATCH] Include dirent.h for ino_t
@@ -6,13 +6,13 @@ Subject: [PATCH] Include dirent.h for ino_t
 Fixes
 error: unknown type name 'ino_t'; did you mean 'int'?
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Update for 2.22.
 Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
 ---
-Upstream-Status: Pending
-
  tests/hugetests.h | 1 +
  1 file changed, 1 insertion(+)
 
@@ -29,5 +29,5 @@ index bc4e16a..fbe4dc0 100644
  
  #include "libhugetlbfs_privutils.h"
 -- 
-2.7.4
+2.25.1
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0011-include-limits.h-for-PATH_MAX.patch
similarity index 85%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0011-include-limits.h-for-PATH_MAX.patch
index e4f803096..08de396d9 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0006-include-limits.h-for-PATH_MAX.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0011-include-limits.h-for-PATH_MAX.patch
@@ -1,4 +1,4 @@
-From 5f64aa8c47c2d3a155a97e262f89cc47394a69eb Mon Sep 17 00:00:00 2001
+From 79b76433f4b6f2f14914817b7e8ac0db1df39250 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 21 Jun 2018 19:58:53 -0700
 Subject: [PATCH] include limits.h for PATH_MAX
@@ -7,17 +7,16 @@ Fixes
 
 error: 'PATH_MAX' undeclared
 
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
 Upstream-Status: Pending
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
  hugeadm.c                | 1 +
  tests/gethugepagesizes.c | 1 +
  2 files changed, 2 insertions(+)
 
 diff --git a/hugeadm.c b/hugeadm.c
-index fe4211d..8db274c 100644
+index 79a4867..65d5136 100644
 --- a/hugeadm.c
 +++ b/hugeadm.c
 @@ -33,6 +33,7 @@
@@ -29,7 +28,7 @@ index fe4211d..8db274c 100644
  #include <sys/stat.h>
  #include <sys/types.h>
 diff --git a/tests/gethugepagesizes.c b/tests/gethugepagesizes.c
-index 9551b38..2645e3f 100644
+index 5777265..990db69 100644
 --- a/tests/gethugepagesizes.c
 +++ b/tests/gethugepagesizes.c
 @@ -29,6 +29,7 @@
@@ -40,3 +39,6 @@ index 9551b38..2645e3f 100644
  
  #include "hugetests.h"
  
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0012-huge_page_setup_helper-use-python3-interpreter.patch
similarity index 88%
rename from meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
rename to meta-oe/recipes-benchmark/libhugetlbfs/files/0012-huge_page_setup_helper-use-python3-interpreter.patch
index e45f283b3..0583df95a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/files/0001-huge_page_setup_helper-use-python3-interpreter.patch
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0012-huge_page_setup_helper-use-python3-interpreter.patch
@@ -1,4 +1,4 @@
-From b77c61de4d88d2c6e5d31f4f5a5877cc4c61272e Mon Sep 17 00:00:00 2001
+From e5580e392b8764e1e6509c5a4ed13fb2ce7566b9 Mon Sep 17 00:00:00 2001
 From: Andrey Zhizhikin <andrey.z@gmail.com>
 Date: Mon, 27 Jan 2020 17:27:55 +0000
 Subject: [PATCH] huge_page_setup_helper: use python3 interpreter
@@ -15,7 +15,7 @@ Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/huge_page_setup_helper.py b/huge_page_setup_helper.py
-index a9ba2bf..7ba0c92 100755
+index 01fc8dc..79a88ca 100755
 --- a/huge_page_setup_helper.py
 +++ b/huge_page_setup_helper.py
 @@ -1,4 +1,4 @@
@@ -25,5 +25,5 @@ index a9ba2bf..7ba0c92 100755
  #
  # Tool to set up Linux large page support with minimal effort
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch b/meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch
new file mode 100644
index 000000000..264a535cc
--- /dev/null
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/files/0013-elflink.c-include-libgen.h-for-basename.patch
@@ -0,0 +1,41 @@
+From 825444522d698991be04bbfa683a7cf785c6f72c Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 2 Oct 2024 00:06:34 +0800
+Subject: [PATCH] elflink.c: include libgen.h for basename
+
+Basename prototype has been removed from string.h from latest musl[1].
+Compilers e.g. clang-18 flags the absense of prototype as error.
+Therefore include libgen.h for providing it.
+
+elflink.c: In function 'get_shared_file_name':
+elflink.c:363:19: error: implicit declaration of function 'basename' [-Wimplicit-function-declaration]
+  363 |         binary2 = basename(binary);
+      |                   ^~~~~~~~
+elflink.c:363:17: error: assignment to 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
+  363 |         binary2 = basename(binary);
+      |                 ^
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Pending
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ elflink.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/elflink.c b/elflink.c
+index 278d338..0e78d61 100644
+--- a/elflink.c
++++ b/elflink.c
+@@ -38,6 +38,7 @@
+ #include <limits.h>
+ #include <elf.h>
+ #include <dlfcn.h>
++#include <libgen.h>
+ 
+ #include "version.h"
+ #include "hugetlbfs.h"
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
similarity index 52%
rename from meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
rename to meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 80af9873b..00b34ad4a 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_git.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -5,28 +5,26 @@ LIC_FILES_CHKSUM = "file://LGPL-2.1;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 DEPENDS = "sysfsutils"
 RDEPENDS:${PN} += "bash python3-core"
-RDEPENDS:${PN}-tests += "bash python3-core"
+RDEPENDS:${PN}-tests += "bash python3-core python3-resource"
 
-PV = "2.23"
 PE = "1"
 
-SRCREV = "6b126a4d7da9490fa40fe7e1b962edcb939feddc"
+SRCREV = "1322884fb0d55dc55f53563c1aa6328d118997e7"
 SRC_URI = " \
     git://github.com/libhugetlbfs/libhugetlbfs.git;protocol=https;branch=master \
-    file://skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
-    file://libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
-    file://tests-Makefile-install-static-4G-edge-testcases.patch \
-    file://0001-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
-    file://libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
-    file://0001-include-stddef.h-for-ptrdiff_t.patch \
-    file://0002-Mark-glibc-specific-code-so.patch \
-    file://0003-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch \
-    file://0004-shm.c-Mark-glibc-specific-changes-so.patch \
-    file://0005-Include-dirent.h-for-ino_t.patch \
-    file://0006-include-limits.h-for-PATH_MAX.patch \
-    file://0001-huge_page_setup_helper-use-python3-interpreter.patch \
-    file://0001-Revert-ld.hugetlbfs-fix-Ttext-segment-argument-on-AA.patch \
-    file://0001-tests-makefile-Append-CPPFLAGS-rather-then-override.patch \
+    file://0001-skip-checking-LIB32-and-LIB64-if-they-point-to-the-s.patch \
+    file://0002-libhugetlbfs-avoid-search-host-library-path-for-cros.patch \
+    file://0003-tests-Makefile-install-static-4G-edge-testcases.patch \
+    file://0004-run_test.py-not-use-hard-coded-path-.-obj-hugeadm.patch \
+    file://0005-libhugetlbfs-elf_i386-avoid-search-host-library-path.patch \
+    file://0006-include-stddef.h-for-ptrdiff_t.patch \
+    file://0007-Mark-glibc-specific-code-so.patch \
+    file://0008-alloc.c-Avoid-sysconf-_SC_LEVEL2_CACHE_LINESIZE-on-l.patch \
+    file://0009-shm.c-Mark-glibc-specific-changes-so.patch \
+    file://0010-Include-dirent.h-for-ino_t.patch \
+    file://0011-include-limits.h-for-PATH_MAX.patch \
+    file://0012-huge_page_setup_helper-use-python3-interpreter.patch \
+    file://0013-elflink.c-include-libgen.h-for-basename.patch \
 "
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
@@ -48,22 +46,26 @@ export HUGETLB_LDSCRIPT_PATH="${S}/ldscripts"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+inherit autotools-brokensep cpan-base
+
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
-inherit cpan-base
-do_configure() {
+do_configure:prepend() {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
-      sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile
+        sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile.in
     fi
 }
 
 do_install() {
-        oe_runmake PREFIX=${prefix} DESTDIR=${D}  \
-          INST_TESTSDIR32=${libdir}/libhugetlbfs/tests \
-          INST_TESTSDIR64=${libdir}/libhugetlbfs/tests \
-          install-tests
+    oe_runmake PREFIX=${prefix} DESTDIR=${D}  \
+        INST_TESTSDIR32=${libdir}/libhugetlbfs/tests \
+        INST_TESTSDIR64=${libdir}/libhugetlbfs/tests \
+        install-tests
+
+    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
+        -e 's|${RECIPE_SYSROOT}||g' \
+        `find ${D}${libdir}/libhugetlbfs/tests -name dummy.ldscript`
 }
 
-
 PACKAGES =+ "${PN}-tests "
 FILES:${PN} += "${libdir}/*.so"
 FILES:${PN}-dev = "${includedir}"
@@ -74,6 +76,3 @@ INSANE_SKIP:${PN} = "dev-so"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-
-# see https://github.com/libhugetlbfs/libhugetlbfs/issues/52
-SKIP_RECIPE[libhugetlbfs] ?= "Needs porting to glibc 2.34+"
-- 
2.25.1


