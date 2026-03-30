Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1899BFC97E2
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:59:02 +0000 (UTC)
Received: from PNZPR01CU001.outbound.protection.outlook.com (PNZPR01CU001.outbound.protection.outlook.com [40.107.51.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.47758.1774866259960852872
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Mar 2026 03:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=v5wbV3Q5;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.51.16, mailfrom: git-patches@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dhipV8jeFdXhW6R/ZBXsBlyAkWdpRCPgatYPct5jX1IfQJgfEtCtMyf8qRkUkjjuLsbfwt9lg4v5R6g54u8UNslZpeaHymNw2STdXsuAC83MB2bkH+DYBGBS/aBzWW33TJ2zkJJiZAqSzaeSrNlk/B0MsMvr6TZeAE7orGeGfdy3imFhmXym7FZNRAYhydzb8k1+XJnNLloG1qC0XC5f38IMLZX0jZEba1I4dI1fFqWpdjeOS9QhU9IKyRFTAKFbGj87EJhnqFCWq/7Q9NqaQUYH6vySfU8czVR55tO3g7P8mnttgqk2l3mC6Jdsck2RQiXQ7dK1ZY5HgRDcHJDVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hrzwQTgbuw3vkgg8gihWCGl1KcH6ovzk1Vy9qbEfuJ0=;
 b=Zh7fwDdsl1+bBnTiLo5jEEAdlqkRlO2X8NPXULBwgD+KL4uw/El37xJqXHoGJ/iFzWH7RAcQ4/j11bapPoWYrN2TO3p3mOTvryDo6Y7YZW43ufFtQJsJfjX2Rjt+0V1nWYlvdlxh3vYaP09FTKhTjB3OT4N+1s19RUK3t1SAn7fnCp97ms1fzDVekqc7NwV5Qubiwa0gfrz/7jL5jlTnjMump8Qnh6x64frrthrkHOGlNpPQJklQdj7Pl6BcXwASxh92zwC1xcPwJ3ceYc/udceju8Ey81UfdESTIBm1+Qc4rRzwzMxwcWIxNsspHidHVmK2bhhVgrqxwmzCQLC9aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hrzwQTgbuw3vkgg8gihWCGl1KcH6ovzk1Vy9qbEfuJ0=;
 b=v5wbV3Q5C4hdQOP3oitmqCY5mgcSwzyIQ42kb1x90JqOeBalZLxrbAtyiBmQ5wB5UuQXdzPRBRSYjSU78HE30Ew7sndMIx6lPrySYlMEoKSi1y8/yGrzfuTqYuTbBRaa3KzRy9RaPA37WG0XaeWx+KFCGr53u6d1EYCt6+uMc/h81y+6tjuzhQG0AyGIDDeeF/ks1BDtViCCUsxnJK45PETrTGsL4bDHTVEIF8029mSXT+X6Hll4ZhLNA1Fqu5lKoTUeMN4O9o5QPrixFeaWDvDMGi6th+P2BH9skCBjHLSqhLxyYay2Y32B5CUkwgEL/yloQuVc06YOH0KIYPlNAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1be::5)
 by PN6P287MB5279.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2fd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 10:08:14 +0000
Received: from PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2]) by PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9ca:1b54:1c36:f7f2%5]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 10:08:14 +0000
From: Ashish Kumar Mishra <git-patches@bmwtechworks.in>
To: openembedded-devel@lists.openembedded.org
CC: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>
Subject: [meta-oe][PATCH v2 0/2] android-tools: migration and cleanup
Date: Mon, 30 Mar 2026 15:37:42 +0530
Message-ID: <20260330100744.739123-1-git-patches@bmwtechworks.in>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
References: <20260320052813.3323280-1-git-patches@bmwtechworks.in>
X-ClientProxiedBy: PN4PR01CA0111.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:266::16) To PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB1970:EE_|PN6P287MB5279:EE_
X-MS-Office365-Filtering-Correlation-Id: ce134d74-f276-40f8-da71-08de8e4441c2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|55112099003|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	ZAAYGxQw3++iVytAbGDgcVjyh4E1jpMPc79Wffkww7aWc4dMGWcWLwQxx2xlPh5Q3yKfvH7d2g/p8OvZJ8forYBWx22aJvF820n78p31HNLlL5m2dth7fwaQDKmxfVUt48QySKbXzjQXGzlNFXzc+R3ryzbv22vRbLIE9ac0MSwHeEIayO19wuST5EXpwMUsGVS2H3dczhxRLwAaqtWe8FfwtU0ZbjS+VDUwJid4mQaxHpmjD41CbWlRgz7Rbrt6ZvV34HZ5lbGBwclQZZMxYTYjRmlB7olJe8Q4a4fx8sm9JKt0HZVZhpSayR+YVyXPovIvHYTu8L3oTVxGO7TgyslMnkA9H5CWTQPAPxMbJ7A6BPixUuLD7SPR0pyK66zrCJiOwKDMsE7Sjff8ylBtnsmVLdNpvFIj4u6T49/pJW/PF6gRrqz6+pmT1zX62sWOAP5sh9yuJzvxyYZ+F1LeGPIrPp8aRsAr9NIbIFMkF09XVsvBYwEbIkOO1OZ/9x+eYi6Mz4dhiV9C1Mh4m+Rv3X1c1Ch+i7hh4xyOJkfNyy+3NLPuyg4GY9nog3JisvQ3Z6PpCFCX3jic0wuHvFaiRT/3yhKwrcGlK09TQUOc5uc7m7DlpwNHYNeq8q2D9ZpLFNJwSenDCYEHkbkNaxGZyFjR7EKvtMo8V9mJ+u75Kv0/aTMLvF+H4xb8YoCazDZtUPBHLWOHooWQL1fv6Uk2Vzoo8rWI5VEiggtAQOQOEsD3Sf51WGT3VUlPEywhNXvvLdi1XrxGFb4/S/6UpUGcZelUov0KHNsbbYYNg9NFcyg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1970.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(55112099003)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1rU6wjutDVoRJ7ANlLkAauvfkfQbWYF1QOWxrt1mV53TV8HQCmWfvbDlOeWc?=
 =?us-ascii?Q?hNpJ6nh5uZtYVYrSxct/052iqnJp+/z4MWIeh9OOdJTOBaExUXtHN3efPluD?=
 =?us-ascii?Q?sVqip+ZpL3cBbLy1JeNNcxUQxp86jPkEdWiRBZ+Y/EVKziMhLHv126NUPcTf?=
 =?us-ascii?Q?cfAg5RTMZKwF5YA9WkcZmL5H3mKIum113pgcclhFbZpiyNGeGV19xr3JJtf2?=
 =?us-ascii?Q?jzWpE6NhANqPyMTORyVfBskEXkGH9ZrdXajbX9MqyipcG76EkXn9ZAaj0tYZ?=
 =?us-ascii?Q?SN8OrflsL3LgncHvHnztUu+Lboz3PU/N1DYufav1QCil289u2AXx9fY5FQDy?=
 =?us-ascii?Q?F+NUtQ3JqZ0IRiHDZlRvphxiWbsIdPSCzslVzpfYW8vkskUz/D0nQeJuzJ1A?=
 =?us-ascii?Q?mfWKoQNyRNMTcpAelMt7Y6vtj/LJQVCCE9AygRIGLgtF4T0Vjhigm8CW3Au5?=
 =?us-ascii?Q?cFbn/9u2oBOc7tiu2VjBwulydq21lXAkFLsW0Gt3XGRylgoMiaG8rWvH8h/3?=
 =?us-ascii?Q?qgCSXOwQlRhqk02qj3h+Y21neS+GyisNKREqgBYVuZM+O2APURph4jYSIai0?=
 =?us-ascii?Q?XTtewPLQwWGg2CHW0M2eMOv/MHuurpNktcUkb9WLzaE3WWvFEUGGNYGI7l2d?=
 =?us-ascii?Q?cmYPzPgz0MnHaEeBgMW2XZNfa0VfCquT/oat3DunpexFaC3GLJSnK/iaD0Zc?=
 =?us-ascii?Q?jRzBj32g+eN0s8Z2ma8SYPBbGOMbGkgGJ4syTqMhWZSN2dUKBIZvNF6LuS2E?=
 =?us-ascii?Q?HAp0EDkygBdrR1P0C/V0Vls/E5XzIu/ma4h6Hb+mCCK3sLIhkrvyr/bEA3ZS?=
 =?us-ascii?Q?Vaj9CxKLuy/PTxHNGdJTBu5yiX0M8tsSdi8PCSAcjbXRfS1wOB9dorCeSPy7?=
 =?us-ascii?Q?5PM9xNrPq5SnZ1ZJKJuCWqoht5HwM/Fo2e+AWD7qpxboRdCUJIoB01H1JUZw?=
 =?us-ascii?Q?kAzmarnCTnj9H6aon6yrMwQ9cwiAQBnz3gyIh/5X8rDK7hd1Bbt/3aRz5SdS?=
 =?us-ascii?Q?VoK4V9DSJZnbtXkR5rj5J8TBxrW1EYU3zMuZGXxrQ+Cfz5SHF2ApP57NtEIq?=
 =?us-ascii?Q?tT7AjtlmstY5X6nCvINtIxyzIIqsnJqFqP/w7wipLN4/uSeqauFVMuvfUyS+?=
 =?us-ascii?Q?SK6Ek041T3r1QTWrjKIGyCSdlN2R3F5LEdbffaVtAUME/3lMxmdvKRi2AatM?=
 =?us-ascii?Q?kEsT1AGsN2KhuzKfCdYIRvPvZp9ENF6yABfboppl1N4IvH4St0itg4oL6Rgt?=
 =?us-ascii?Q?H7oVesq2LXL5AiF3UDpUY9nLH2FZqlgJDEcG/E7XmHAikjnt4yYXK1VKf8M6?=
 =?us-ascii?Q?CWL5ejMGhrRmBMJq5lv9Wv8f+E+mr9AKylJXuAtomlCHN3zk6H23oepKXLWT?=
 =?us-ascii?Q?gXQigXZ93gYCKIItrSbN/+AzcPe2uxzeUpkVgzkHEACULDuJS3PGhDPqCAw4?=
 =?us-ascii?Q?MlXl4kPI7R3NiLjDpdw3WNeDkSZxk5ZI5s1LNCilLnSMN9KaUnDV9xS2Woy4?=
 =?us-ascii?Q?OxUOo7DM0MKIOs6rOz39Yj0/2PbsrcDt95Db3/jNL76rrDNImlUtMNuL3IYw?=
 =?us-ascii?Q?dJ3eU6dBOm8vavGixiyiQcaieqvAmDoxBr5zHeIHxDFv+qJsYyQztvs/tkr1?=
 =?us-ascii?Q?odNgsUMX+COWnbxT90NRdgeKgCJtm05Xc7O4Oqr6pbnNY6/zKjV4SWWhYjxX?=
 =?us-ascii?Q?4E3irROcEWi3Z9D2tFDG2XVdd69m3pbWH7d0MwK8Sc0CShpKa7/coCgeKQ/k?=
 =?us-ascii?Q?44mqnCdTxApXrINpKwBSKUGzlDW7qj0=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: ce134d74-f276-40f8-da71-08de8e4441c2
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1970.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 10:08:14.7723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAhg1R8hsFjyUPs+dl1CrGwBECKXz/R0MqmPcEJvbf5+G2u081oXsNKbKgPmiHXFU9yc39IW12UBsgIxt7bT8JN2ws3TyV++3edhe1XtaUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5279
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Mar 2026 10:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125864

From: Ashish Kumar Mishra <ashishkumar.mishra@bmwtechworks.in>

Following the feedback on the initial RFC, the logic has been split into tw=
o=20
distinct commits to improve clarity and maintainability:

1. Removal of the legacy android-tools 5.x version from meta-oe/recipes-dev=
tools.
2. Migration of android-tools v29.x from dynamic-layers/selinux to meta-oe.

This ensures the newer version is correctly positioned in meta-oe while=20
cleaning up the deprecated 5.x recipe.

Ashish Kumar Mishra (2):
  android-tools: remove android-tools 5.x from meta-oe/recipes-devtools
  android-tools: move android-tools v29.x from dynamic-layers/selinux to
    meta-oe

 .../android-tools-conf/android-gadget-setup   |  37 --
 .../android-tools/android-tools-conf_1.0.bb   |  20 -
 .../android-tools/android-tools/adbd.mk       |  87 -----
 .../android-tools/android-tools-adbd.service  |  13 -
 .../10-adbd-configfs.conf                     |   4 -
 .../android-gadget-cleanup                    |  24 --
 .../android-gadget-setup                      |  38 --
 .../android-gadget-start                      |   9 -
 .../android-tools-conf-configfs_1.0.bb        |  38 --
 .../android-tools/android-tools-conf_1.0.bb   |   4 +-
 .../0001-Fixes-for-yocto-build.patch          |   0
 .../0001-liblp-fix-building-with-GCC-14.patch |   0
 ...difications-to-make-it-build-in-yoct.patch |   0
 ...usbdevfs_urb-to-match-new-kernel-UAP.patch |   0
 ...-adb-Fix-build-on-big-endian-systems.patch |   0
 ...005-adb-Allow-adbd-to-be-run-as-root.patch |   0
 .../android-tools/android-tools/adb.mk        |  72 ----
 .../android-tools/android-tools/adbd.mk       | 247 +++++-------
 ...scv-Add-risc-v-Android-config-header.patch | 361 ------------------
 .../0001-adb-remove-selinux-extensions.patch  |  44 ---
 ...define-strlcpy-for-glibc-based-syste.patch |  35 --
 ...-Use-local-sockets-where-appropriate.patch |  70 ----
 .../core/0003-adb-define-shell-command.patch  |  29 --
 ...-adb-Fix-build-on-big-endian-systems.patch |  47 ---
 .../0005-adb-add-base64-implementation.patch  | 350 -----------------
 .../core/0006-adb-Musl-fixes.patch            | 130 -------
 ...sb_linux.c-fix-build-with-glibc-2.28.patch |  26 --
 ...008-adb-Allow-adbd-to-be-ran-as-root.patch |  23 --
 ...Add-dt-parameter-to-specify-DT-image.patch | 110 ------
 ...ux-capability.h-on-linux-systems-too.patch |  23 --
 .../0011-Remove-bionic-specific-calls.patch   |  64 ----
 ...laration-of-stlcat-strlcopy-function.patch |  50 ---
 .../core/0013-adb-Support-riscv64.patch       | 191 ---------
 ...add-u3-ss-descriptor-support-for-adb.patch | 344 -----------------
 ...off-most-of-sparse_file_read_normal-.patch |  60 ---
 ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ---------
 ...port-for-converting-holes-to-don-t-c.patch | 114 ------
 .../android-tools/core/adb_libssl_11.diff     |  48 ---
 .../core/b64_pton_function_decl.patch         |  14 -
 .../debian/Add-riscv64-support.patch          |   0
 .../debian/Added-missing-headers.patch        |   0
 .../android-tools/debian/Nonnull.patch        |   0
 .../android-tools/debian/Vector-cast.patch    |   0
 .../debian/add-missing-headers.patch          |   0
 .../20150704-CVE-2015-3239_dwarf_i.h.patch    |   0
 .../legacy_built-in_sync_functions.patch      |   0
 ...nd-fix-strchr-conformance-to-ISO-C23.patch |   0
 ...unreachable-macro-to-avoid-redefinit.patch |   0
 .../external/libunwind/user_pt_regs.patch     |   0
 .../debian/fix-attribute-issue-with-gcc.patch |   0
 .../debian/fix-build-on-non-x86.patch         |   0
 .../fix-gettid-exception-declaration.patch    |   0
 .../fix-standard-namespace-errors.patch       |   0
 .../debian/hard-code-build-number.patch       |   0
 .../debian/libusb-header-path.patch           |   0
 .../debian/move-log-file-to-proper-dir.patch  |   0
 .../debian/simg_dump-python3.patch            |   0
 .../android-tools/debian/stdatomic.patch      |   0
 .../debian/stub-out-fastdeploy.patch          |   0
 .../system/core/Add-riscv64-support.patch     |   0
 .../system/core/Added-missing-headers.patch   |   0
 .../debian/system/core/Nonnull.patch          |   0
 .../debian/system/core/Vector-cast.patch      |   0
 .../system/core/add-missing-headers.patch     |   0
 ...ope-write-macro-to-prevent-conflict-.patch |   0
 .../core/fix-attribute-issue-with-gcc.patch   |   0
 .../system/core/fix-build-on-non-x86.patch    |   0
 .../fix-gettid-exception-declaration.patch    |   0
 .../core/fix-standard-namespace-errors.patch  |   0
 .../system/core/hard-code-build-number.patch  |   0
 .../system/core/libusb-header-path.patch      |   0
 ...x-missing-fixed-width-integer-types-.patch |   0
 .../core/move-log-file-to-proper-dir.patch    |   0
 .../system/core/simg_dump-python3.patch       |   0
 .../debian/system/core/stdatomic.patch        |   0
 .../system/core/stub-out-fastdeploy.patch     |   0
 .../core/throw-exception-on-unknown-os.patch  |   0
 .../throw-exception-on-unknown-os.patch       |   0
 .../android-tools/android-tools/ext4_utils.mk | 103 -----
 ...ext4_utils-remove-selinux-extensions.patch |  39 --
 ...add-o-argument-to-preserve-ownership.patch |  78 ----
 ...unused-parameter-from-allocate_inode.patch |  69 ----
 .../android-tools/android-tools/fastboot.mk   |  89 -----
 .../android-tools/android-tools/gitignore     |  59 ---
 .../0001-Remove-bionic-specific-calls.patch   |  25 --
 ...t-define-gettid-if-glibc-2.30-is-use.patch |  51 ---
 .../android-tools/android-tools/mkbootimg.mk  |  29 --
 .../android-tools/android-tools/remount       |   0
 .../android-tools/rules_yocto.mk              |   0
 .../android-tools/android-tools_29.0.6.r14.bb |   7 +-
 .../android-tools/android-tools_5.1.1.r37.bb  | 189 ---------
 91 files changed, 92 insertions(+), 3560 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-=
tools/android-tools-conf/android-gadget-setup
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-=
tools/android-tools-conf_1.0.bb
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-=
tools/android-tools/adbd.mk
 delete mode 100644 meta-oe/dynamic-layers/selinux/recipes-devtool/android-=
tools/android-tools/android-tools-adbd.service
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/10-adbd-configfs.conf
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/android-gadget-cleanup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/android-gadget-setup
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs/android-gadget-start
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools-co=
nf-configfs_1.0.bb
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0001-Fixes-for-yocto-build.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0001-liblp-fix-building-with-GCC-14.patch (=
100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0002-android-tools-modifications-to-make-it=
-build-in-yoct.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0003-Update-usage-of-usbdevfs_urb-to-match-=
new-kernel-UAP.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0004-adb-Fix-build-on-big-endian-systems.pa=
tch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/0005-adb-Allow-adbd-to-be-run-as-root.patch=
 (100%)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ad=
b.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/bu=
ild/0001-Riscv-Add-risc-v-Android-config-header.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0001-adb-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0001-memory.h-Always-define-strlcpy-for-glibc-based-syste.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0002-adb-Use-local-sockets-where-appropriate.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0003-adb-define-shell-command.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0004-adb-Fix-build-on-big-endian-systems.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0005-adb-add-base64-implementation.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0006-adb-Musl-fixes.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0007-adb-usb_linux.c-fix-build-with-glibc-2.28.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0008-adb-Allow-adbd-to-be-ran-as-root.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0009-mkbootimg-Add-dt-parameter-to-specify-DT-image.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0010-Use-linux-capability.h-on-linux-systems-too.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0011-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0012-Fix-implicit-declaration-of-stlcat-strlcopy-function.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0013-adb-Support-riscv64.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0014-add-u3-ss-descriptor-support-for-adb.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/adb_libssl_11.diff
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/co=
re/b64_pton_function_decl.patch
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Add-riscv64-support.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Added-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Nonnull.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/Vector-cast.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/add-missing-headers.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/20150704-CVE-2015=
-3239_dwarf_i.h.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/legacy_built-in_s=
ync_functions.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/libunwind-fix-str=
chr-conformance-to-ISO-C23.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/libunwind-guard-u=
nreachable-macro-to-avoid-redefinit.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/external/libunwind/user_pt_regs.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-attribute-issue-with-gcc.patch (=
100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-build-on-non-x86.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-gettid-exception-declaration.pat=
ch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/fix-standard-namespace-errors.patch =
(100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/hard-code-build-number.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/libusb-header-path.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/move-log-file-to-proper-dir.patch (1=
00%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/simg_dump-python3.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/stdatomic.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/stub-out-fastdeploy.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Add-riscv64-support.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Added-missing-headers.pa=
tch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Nonnull.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/Vector-cast.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/add-missing-headers.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/android-tools-scope-writ=
e-macro-to-prevent-conflict-.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-attribute-issue-with=
-gcc.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-build-on-non-x86.pat=
ch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-gettid-exception-dec=
laration.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/fix-standard-namespace-e=
rrors.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/hard-code-build-number.p=
atch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/libusb-header-path.patch=
 (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/libziparchive-fix-missin=
g-fixed-width-integer-types-.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/move-log-file-to-proper-=
dir.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/simg_dump-python3.patch =
(100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/stdatomic.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/stub-out-fastdeploy.patc=
h (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/system/core/throw-exception-on-unkno=
wn-os.patch (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/debian/throw-exception-on-unknown-os.patch =
(100%)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
t4_utils.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0001-ext4_utils-remove-selinux-extensions.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/ex=
tras/0003-ext4_utils-drop-unused-parameter-from-allocate_inode.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/fa=
stboot.mk
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/gi=
tignore
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/li=
bselinux/0001-Remove-bionic-specific-calls.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/li=
bselinux/0001-libselinux-Do-not-define-gettid-if-glibc-2.30-is-use.patch
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/mk=
bootimg.mk
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/remount (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools/rules_yocto.mk (100%)
 rename meta-oe/{dynamic-layers/selinux/recipes-devtool =3D> recipes-devtoo=
ls}/android-tools/android-tools_29.0.6.r14.bb (96%)
 delete mode 100644 meta-oe/recipes-devtools/android-tools/android-tools_5.=
1.1.r37.bb

--=20
2.34.1


