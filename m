Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.3])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30087.1794841782008750383
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 07:09:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Gbuz/Qjz;
 spf=pass (domain: est.tech, ip: 52.101.70.3, mailfrom: yunseong.kim@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P1N/QkGSV2yW6Nmwy+/zpxSf3i3ZiV+mQCA3f8GWj004L5EdtcoumEHvhUUhLiiDqDgx5W8CtnnwDQI+ag4oaKrmk1PPv6K+AKmK5JajBTVSO6Y0VXe/Rpka5aqWRs1K0Hn7KMESXbkqxvKPKnEMPM0r/1+2p7j4ZzyKejTuq6AZBH9AniWT1kQv1a1Rq28nRUd7z4wqv7yjFQyQFKuQodZYxO0JQdSwMVLcXtXcvpbCvbYT3R114IkEGxYMTmaZOgWrBczFVsWqiUGfHBuFf41TMq4A+eTXS+LT0+Ejxbgkd/uFbUh0D5q3hIrnTA/ah+oPXJg6EyRt+wFTPFzFIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUh6WzXJfBFFMSa2geQUnUs5q3sYrpG7gH00qakb1RI=;
 b=srYAu4OOacGH7Dka5dmuhDIYGJJUQyXfcX88L4K9PIYD5W9pUVwx63m8dG463g9ebJjyPQrq0ypxHves2oli74ZUr3AV4ckmIeD5SFh9E8wY1v5E85YN5f8jVw7z0j1lq0JcwazwL54QP3ZWYrSInQvVSo4+cIrgyIGZXT02fZL16cIWHUTeUHPZ+R4T/CD618uJvv+HVCK03VFjBYNjnfd6B14LkABdSpmylRA5HVVvlsoUkrWsYGykHlaNsZiQha/pz7o/EEUhoxY5dkfzdWWAPdktGYlcfzOpRvKrOx+Ou7zH2YqZ3IFBbV4g33uFsHx8H2cm7Vw9I16E+aRGgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUh6WzXJfBFFMSa2geQUnUs5q3sYrpG7gH00qakb1RI=;
 b=Gbuz/Qjz9NU1TgpCoyn2eoxPvJEe36e15udUKHYM91nHSdQmu98SEp3q0dckrYKvwTxynRZCWTkqy1w0w6HEVj450+tonQs//8VZEhgVUKIhALtDqbiMVuBKtQWLbPUw2pD+heff9B2ICUyNg0MuKi4nnV7ULLFtb15igGFkWAZ1TRzBUnA0w3tH78CWINoPoz37rBplyhvQ2vPrCNGpTVXgUsjRVZ5AbB+G/0Q/IOjRHX+wVWekx088TXfwtqu34vMP2qSb53LAaSRgy20hs0AFNNUwuKSSvn+0QyVm1Dkvk2ERr0JL5Exd84yKHZpcolbIsveToGwcj5QyY/mgUQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM (2603:10a6:d10:1a3::22)
 by PAXP189MB1903.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 14:55:31 +0000
Received: from FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a]) by FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 ([fe80::4658:dbd6:d572:896a%4]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 14:55:31 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Yunseong Kim <ysk@kzalloc.com>,
	Yunseong Kim <yunseong.kim@est.tech>
Subject: [meta-oe][PATCH] vock: add recipe
Date: Mon, 16 Nov 2026 15:55:17 +0100
Message-ID: <20261116145516.11115-2-yunseong.kim@est.tech>
X-Mailer: git-send-email 2.47.3
X-ClientProxiedBy: LO4P123CA0244.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::15) To FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:d10:1a3::22)
Return-Path: yunseong.kim@est.tech
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FRWP189MB3398:EE_|PAXP189MB1903:EE_
X-MS-Office365-Filtering-Correlation-Id: a06c9163-e3e9-4c28-f0dc-08df43f1a92d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|18002099003|6133799003|261009223027099003|3023799007|11063799006|56012099006|260925022911599003|260925021911599003|260925021311599003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261022075727099003|261022113327099003|261022115727099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: fJUlROHD8wpJ4oS/pfGPDzTTj/htHogexXlAMHiDzsOUnWqXmyHI/iTDUnRv+sN0a5lUYtHwJW7ROqhsHT20myG6Zk40lDWjw0JnmZPpmdWlLTKvsUrGy0hDGkwAMeh0CZ4pWpmDdZCG+gO0VkDRkHz5VfWOkeg8BtdFZ2naXQ15LQ7aXfDFVMJQAb2b7SXfMaWGrnPj1No9XW0JUAPWaSz/1iqWNuzcv7U/PQ9UCxiLOXDhkx3xLyrEAaKH7Q74v5JaLRdtXqAqnc3TIts+BdrQjG4oL1eeR/0MrbvMDgj6JDXIL6lKOTrKUqUA7SSeML9ACcLH5AK4KUii2HISxS9qRLqOzxobbQBweRlfH0Yvupsih2LDa3EAHHOhKJ0ThSV5e5857ryBnGVrjwNkR/89HCuwvkdcZUmlfP+t/FiUtD7O3QD8wG8dPd7hu7HPAdQbaR23rtDXo1NvB6f8SbV5aOfMHHj4SJnShoPEsRk+761oSDJlo8d9AQYtVYwyCRGhxluUv8qsYIsJYqcIo6HdoHMbdQfV4s04Dq8hMekzQf+QBC9JG/jpBn6UvfTzfgzFnr2xij+Fi+OOyEIfaUHXHh/mzxrBX55xhFs32srkUzRgCdKqJqs+bmgZOe0qjz3UJNanyRfUtIX1btwnW35et4FzUv6vpscTzZ0a2Nc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWP189MB3398.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(6133799003)(261009223027099003)(3023799007)(11063799006)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261022075727099003)(261022113327099003)(261022115727099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TRh+wMsYLyIL5sEtkTs4yIEaPhGIocUntarl7jt62EzwiJYNIycwvBxjbUeG?=
 =?us-ascii?Q?T4n7ktmtbfJKdHxEz66aR2HcHzBJ9xXBYz8308SpLzldRlaDvJ/v/FJyCMu8?=
 =?us-ascii?Q?tuueO0WGcuqot5O03UMin7ebLvIh4f//OrcSRPJ/CpSlhX6RYjnYAqIqDhVm?=
 =?us-ascii?Q?SO6FO+l2a+Uxlkty5N3NGZxtWZ0yFvJtrX1Wubjgrg/BBBzZXwkgmI2JL+Iu?=
 =?us-ascii?Q?bH8P7W0mP0DrcUGolc+gEU7eE/urxtQYA45DRx3hWLWNoIZXii5hBn8dksT+?=
 =?us-ascii?Q?+x+BbuRfkkI9QxhwExHxzD+HeAPF28U1z+O/O5t231SALbeYK0bV8TR9IBfs?=
 =?us-ascii?Q?+vpPVLwTLOTMI3+vHe6FOebDQjkPepj6KUw1ZPPEntv5aOmwzSur/PLlKUqV?=
 =?us-ascii?Q?BJxIWYo8X2hsVKniqrom/Ib0AlusUWfzupTykjP54w34iEMfYBRToAYWsJRO?=
 =?us-ascii?Q?FPjWQc/f8m1K0v7yGJKwNoP2e3iaNwfJ1qgB2VjebLu6B6ndl3SImb9rC+zw?=
 =?us-ascii?Q?04OfbK2H0wvNZrUXXmD0M4LflkA1kVXTXRSB/MqnagfypPBmAN/51yztjczX?=
 =?us-ascii?Q?73tHP1aU+UmWpmDPWjpqefIAOl4xJnRmwWg1rKF1kabcHy9vreE57WNVHLfB?=
 =?us-ascii?Q?yl8dxFuJSJhnUxCvh9ooXGv0arjCdAYMjjRn9763MKyVGXFtNUnQ+Vl55PeU?=
 =?us-ascii?Q?Njv17chDPwhORLueLnUC4Y+Hcs9sC58IrxX6e35CTV8raG5vnZ0SvBHfx/F8?=
 =?us-ascii?Q?JdlfCTxYboj3QBH88zF5zDX41NMIH99kU9zbhd0j6iwXtZQZkbKNUiKSO3nZ?=
 =?us-ascii?Q?eY1w+frufw31zLmw6Y0J+JOzNkXQBHbrPbr1J8YIoMJs8eQHGBYge7AOPHzg?=
 =?us-ascii?Q?PPb7ECaJozfeNtdm75bUj9+YxHTuGgtqCFjbHOF98yc1kOCYXRHBK0gb8NCX?=
 =?us-ascii?Q?AAVK5EKX1OTj+/wjp4sA9ucF7Txqtn1FiiLJszdhrNa5X3/rPHETndrfp4ou?=
 =?us-ascii?Q?Uv8tlpaDhfMQKgubj+vg7EtZF5wZ/SXeJ0AVOC/5u1bb6zr1nEtLPsr3tbGu?=
 =?us-ascii?Q?sXxfk1SXL7WMEoWvk2sYkAwLoBVH33bwlN6VhmUwYBM3WPWI68PxHJPypt+i?=
 =?us-ascii?Q?imNAR/DXPBXlcGhL0Nx9CBFvECu8IsuvjrBi7zGO7ClfjIhZ9VhC+f4/NpQq?=
 =?us-ascii?Q?MB+eLgh2uF+Zli5yd+aaaUB0pkqyS9qnR2UQ/JXYVthb+ZGJhXUrvf28nsLy?=
 =?us-ascii?Q?oypNHCvTfm99fMV9xLa6WCvZg8ft5WD0uW+i/2bNQw/gNkknj90K5nlhyhFG?=
 =?us-ascii?Q?zhC1d6VA4tB3Ce0QH2jbR70w56X9ah4RAExHZAD/7MHJCgMeaubsyDMAvmkF?=
 =?us-ascii?Q?l0WcxCyPYoRV2lz8PsASTMK5go1BzDK1YK9qJLdDa4y99VyOYtep0P6CVitx?=
 =?us-ascii?Q?bStllJ5E+calGcNMiig+PLo8TuYiyvjBEJ4wOdlnquTDpLpMr8Gyzd+kFiiY?=
 =?us-ascii?Q?EqK0bPNuoeXX+l+dkvsSHK1zewiHGBtD+zZY1X6j2YDeFu6WHcZy2+VegU47?=
 =?us-ascii?Q?hKSBC1UAmRi4O9EllU0hO/oF6wDdoWGdN3FmbRj3K03SlDExt9Z9YufrXIwv?=
 =?us-ascii?Q?Pv7XsPR4gpGDi9z19G1q6P2v2AMGfR9wj0vf5Em8QuG6lZjWluj5J6mEkwov?=
 =?us-ascii?Q?Eqkb9fNayO88jKdi/ML9yAqvE8rVdhCakHd2EGvG5D4wSrnVFwJTnxxrL0JG?=
 =?us-ascii?Q?wwACR5JPrw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a06c9163-e3e9-4c28-f0dc-08df43f1a92d
X-MS-Exchange-CrossTenant-AuthSource: FRWP189MB3398.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 14:55:31.5840
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D+sfg7Zj1K58s6bZrSmSeo9XUOg0BP+HgPwjgh/6bv62IQMcLvCK1+nJrUdf+xzCLmgkUfO1z+tg0mUMZRIreA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP189MB1903
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 15:12:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132454
Content-Type: text/plain; charset="utf-8"

vock reports the kernel code a userspace command executes, using KCOV
or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ETMv4),
symbolized against a vmlinux and annotated with kernel source.
Forked children and threads are followed through an LD_PRELOAD library
in KCOV mode and through inherited per-CPU perf events in hardware mode.
It is useful to see which kernel paths a workload reaches when testing or
debugging an embedded system.

COMPATIBLE_HOST is limited to x86_64 and aarch64, the only architectures
with syscall decoding and trace backends.

Tested with poky on qemux86-64 and qemuarm64 (build, packaging,
update_crates) and by running KCOV coverage, fork following and
syscall tracing in core-image-minimal on qemux86-64 with a KCOV kernel.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 meta-oe/recipes-kernel/vock/vock-crates.inc |  8 +++++
 meta-oe/recipes-kernel/vock/vock.bb         | 33 +++++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/vock/vock-crates.inc
 create mode 100644 meta-oe/recipes-kernel/vock/vock.bb

diff --git a/meta-oe/recipes-kernel/vock/vock-crates.inc b/meta-oe/recipes-=
kernel/vock/vock-crates.inc
new file mode 100644
index 0000000000..9ddbda00cd
--- /dev/null
+++ b/meta-oe/recipes-kernel/vock/vock-crates.inc
@@ -0,0 +1,8 @@
+# Autogenerated with 'bitbake -c update_crates vock'
+
+# from Cargo.lock
+SRC_URI +=3D " \
+    crate://crates.io/libc/0.2.189 \
+"
+
+SRC_URI[libc-0.2.189.sha256sum] =3D "3eaf3ede3fee6db1a4c2ee091bf8a8b4dccdc=
6d17f656fb07896ee72867612f2"
diff --git a/meta-oe/recipes-kernel/vock/vock.bb b/meta-oe/recipes-kernel/v=
ock/vock.bb
new file mode 100644
index 0000000000..530ca6dd16
--- /dev/null
+++ b/meta-oe/recipes-kernel/vock/vock.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Kernel code coverage of a user-space command (KCOV, Intel PT,=
 AMD LBR and Arm Coresight ETMv4)"
+DESCRIPTION =3D "vock runs a command and reports which kernel code it exec=
uted, \
+using KCOV or hardware tracing (Intel PT, AMD LBR/IBS and Arm Coresight ET=
Mv4), \
+optionally with an strace-style syscall trace and syzkaller-compatible out=
put. \
+Coverage is symbolized against a vmlinux (DWARF or BTF) and annotated with=
 kernel source."
+HOMEPAGE =3D "https://github.com/yskzalloc/vock"
+BUGTRACKER =3D "https://github.com/yskzalloc/vock/issues"
+SECTION =3D "devel"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddaf2426a488a4a2b68a88bd7cf6410e=
4"
+
+SRC_URI =3D "git://github.com/yskzalloc/vock.git;protocol=3Dhttps;branch=
=3Dmain"
+SRCREV =3D "db50863d4d70038738a157379d24a9d9e5e4ce2a"
+PV =3D "0.1.0+git"
+
+inherit cargo cargo-update-recipe-crates
+
+require ${BPN}-crates.inc
+
+# Syscall decoding, ptrace register access and the hardware-trace backends
+# are implemented for x86_64 and aarch64 only.
+COMPATIBLE_HOST =3D "(x86_64|aarch64).*-linux"
+
+do_install:append() {
+    # LD_PRELOAD shim used by --mode kcov to follow forks and threads. voc=
k
+    # looks it up next to its binary as ../lib/vock/kcov.so, i.e. under
+    # ${nonarch_libdir} regardless of multilib.
+    install -Dm 0755 ${B}/target/${CARGO_TARGET_SUBDIR}/libkcov_preload.so=
 \
+        ${D}${nonarch_libdir}/vock/kcov.so
+}
+
+FILES:${PN} +=3D "${nonarch_libdir}/vock"
--=20
2.55.0

