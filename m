Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CEEBCD6E6B
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 12:39:43 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10423.1780576774801022829
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Jun 2026 05:39:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=um8zmW6E;
 spf=pass (domain: ti.com, ip: 52.101.61.21, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZm342kdoOZFxfKyonSb/W7agIXaAKoPuP71ogQD91+30JXPN58Iq/ccLWO7GdIOx6kDS3SdY5djsMil9q/DpSchzT6Xe3vqmHms+dMb9qPYNLycVoNMuywlmoM9ju/GComAfa1v9SDJ1Qvetazvhf/NJMIdoDjZcYtxxUKV+toVCY7qaNniWS4071lEi2G1e1fopx8PJ+EfKlp7SNshWb0/JDyOBapMVBuNqLNqTamkCD2zHXxVqDHASwEH95dj5m4N415VJItIKrHKI6nWzGv8eqbFPkrHmF4RFsomu5gFy0qIxfRRsZaMZT2b4P+MErBsMh8dRvWMb6SLWH8eJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=12eyGHJnrfH8m2Jm5AKhrSGvbL+Ey1DVaq+vQqzz/9U=;
 b=QiNBdBepiaOZOEM5O97jIPmkAfDLbLudXMsaxLHrDEC/QQKlPCfnoeXCEkbogeQ6Ia9qsyYPWmwCxeGrsHu9nDn2QBb2Am80/VFZ2C1qiEegmIEKul9K04uBaF3iNuh6Je99Ut/rBOE6cHrThAmLQCw7tobReKXyR11ci0Twe3Xg7TFPgD51UxOc/KI5XuonVVfh6a2vclAhtnE1y3vEW8u8UsERN602XuXYwj3ZnoiPErpGv3MUfnDSRGNHlfxP7xk9fJ9CY4RMVefKkMnRmVTesLoIkAXDnzH0hLgmOXQBgGjMSjg/zYXbQEEeylHBEc4al0mv6uwEaDCHNT6Flw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=12eyGHJnrfH8m2Jm5AKhrSGvbL+Ey1DVaq+vQqzz/9U=;
 b=um8zmW6EARP1/LwjXy6b07a25Wo0lpyT4f845ZO3+icFsrkkdMLfjoq7jGKUv/ItXDW1E1niPVjOQ+DgOwVt+skdww/8UHb/FwVATZXWnmCsqQe9E2DBKjAYUmTJ2GUifRIwEBUPznS/MXQ4GeJlJAlnv5vf3RE6u93kdpXRa+E=
Received: from SA1P222CA0062.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::13)
 by DS0PR10MB6224.namprd10.prod.outlook.com (2603:10b6:8:d2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 12:39:29 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:2c1:cafe::a6) by SA1P222CA0062.outlook.office365.com
 (2603:10b6:806:2c1::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 12:39:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 12:39:28 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:39:27 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 4 Jun
 2026 07:39:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 4 Jun 2026 07:39:27 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 654CdIdT3378960;
	Thu, 4 Jun 2026 07:39:26 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <s-sundararaju@ti.com>, Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
Subject: [meta-oe][master/wrynose][PATCH 2/2] kernel-selftest: add generic architecture-independent self-tests
Date: Thu, 4 Jun 2026 18:09:07 +0530
Message-ID: <20260604123907.3597697-2-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604123907.3597697-1-j-sahu@ti.com>
References: <20260604123907.3597697-1-j-sahu@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|DS0PR10MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 1261da9e-74c2-4622-ff4e-08dec236515e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	teEgFy4Wdg/3UkZIAjYIniCvUmJFtLDN9RsxfZEBbfuahOtT+XBfuOEnO9RkIqglMmnMOlLDhRXFaG2cMSXmUVCh6BiGLGw4lFbgKJ86FyvllgL766DJqI9F4gRXDEiMSHjbY5D9419Kq5bWtxRHv4RnKamT8ec5Z1vdZkCNlH0VYY68MYuCbO0ugtjpvDE8/LJcauOzZMAIHgAxgFPkrwUcE8tW6X8F29dZYotgqbrvU9pgBdF+ADMfyfuvceh62cD9KfZ4akiTUsPdQAJul5m6ut4c8RbBggF5Hvn+//AmehaIvT1YthTsYmDbbGMKuE66uy9pcn/tEfHFlZRwMZnx0iMtOI9wNEBkqgS+lbiJEbYzBdl8BW9pM2Oab7F7x77tpUzz6Tlq7LwvEzcc2qh4TaWLfsCWIVfH5g4X0sPH7h9IuthOJWuYXp9AhAZJX6+1zf+pe13FvTYXCQ6mwC2+bixqgwAu1C/mqqLPie0XR+HMQtYUD6YhzSkkd9BR7f1zmzBzqH3HiBhoTt0+QLViXgW6UfU1fHHNmYSlEXBDQ28+0XpyEP10pmRUch2+cqxrtMWtX3GOfjGYDkrEjxatpS5HNLIwpOYbut58Ndd7JsGcEt7xt9iOykf9DK2NdVuLKGlQh3jb8MZuAeqw+MTJgLjIcZ/yEtdIHR2Rf0JrKLCGMdpegH/R0v1ZVClLVYFVBvHH27vXV9iE9iJg3HovUU0mg4TL10nUpM+BN/4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(22082099003)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	D3FiU5CX3c0tRcikL2sOieTQAIc8Joe+JUx5LpFwi/ZiNesk7ib+DR5cPWBogDzKpfTaJkYDJx0krEri9c0K6nx5sNN4ykj80y3UK+OCnpKhab4uYzU+he9f+x+7kVHfka1hOe2U2gExU/omuq88GAd0w1exMfO08AResuYPp6dmAmN8fnNVekAFvU7w/PlN04X7164NwXIGJXsl4KObM1uGSdj36HEPLHEHvivjYuxgrocEfxV7CS6cMWKEeiFd9K9aIOqwSZSnyYWT0gctSOp3rZxwJhsBqQFnW+g1KB/OPE+heZv0sr97qmAmXU1nvGqRe1hRnWnOYzURs1EXzS8EBZtro46LSiXDdxrN//B5uDZBPEbTt0KMO7n1oB1UDKX2o7iMSzWJNwYWHEvMTEoqAJ/QHdOoCb48KY/7jkF2kDvYbxxil9X09Rq6DPCt
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 12:39:28.1748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1261da9e-74c2-4622-ff4e-08dec236515e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6224
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Jun 2026 12:39:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127397

Add generic kernel self-tests that build cleanly with mainline
kernel (6.18+), work on all architectures, and either PASS or SKIP
gracefully at runtime.

Tests added:
- acct: BSD process accounting
- breakpoints: hardware breakpoint handling
- cachestat: page cache statistics (cachestat syscall)
- cgroup: control group v1 interface
- clone3: clone3 syscall with flags
- core: syscalls like close_range, unshare
- coredump: core dump generation
- dmabuf-heaps: DMA-BUF heap allocator
- efivarfs: EFI variable filesystem
- filelock: POSIX file locking (OFD locks)
- filesystems: basic filesystem operations
- filesystems/binderfs: Android Binder IPC (skips if CONFIG_ANDROID_BINDERF=
S=3Dn)
- filesystems/epoll: epoll syscall extensions
- fpu: floating-point unit state
- ftrace: function tracer interface
- futex: fast userspace mutex
- gpio: general purpose I/O
- ipc: System V IPC primitives
- kcmp: compare kernel resource identifiers
- kvm: kernel-based virtual machine
- landlock: LSM sandboxing (skips if CONFIG_SECURITY_LANDLOCK=3Dn)
- locking: ww_mutex deadlock avoidance
- lsm: Linux Security Module interface
- membarrier: memory barrier syscalls
- mincore: mincore syscall (page residency)
- mount: mount syscall (unprivileged variants)
- mount_setattr: mount attribute syscall
- move_mount_set_group: move_mount peer group
- mseal_system_mappings: system mapping sealing
- namespaces: PID/UTS/IPC/mount/network namespaces
- net: networking stack
- net/mptcp: multipath TCP
- pidfd: pidfd-based process management
- pid_namespace: PID namespace limits
- proc: /proc filesystem interface
- ptrace: process tracing
- rlimits: resource limits
- rseq: restartable sequences
- sched: scheduler and real-time classes
- seccomp: secure computing mode
- signal: signal handling
- size: ELF size utilities
- splice: zero-copy data transfers
- sync: cache synchronization
- syscall_user_dispatch: user-space syscall dispatch
- sysctl: sysctl interface
- tc-testing: traffic control
- timens: time namespaces
- tmpfs: tmpfs filesystem
- tpm2: Trusted Platform Module 2.0
- tty: TTY layer
- uevent: kernel uevent subsystem
- user_events: tracepoint user interface
- vDSO: virtual dynamic shared object
- watchdog: hardware watchdog timer
- zram: compressed RAM block device

Tested on aarch64 device BeaglePlay(AM6254 SoC):
- Tests either PASS or SKIP gracefully

Depends-on: kernel-selftest: add libcap to build and runtime dependencies

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 .../kernel-selftest/kernel-selftest.bb        | 58 ++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/me=
ta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index ab544859d8..7850ddb6c9 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -51,11 +51,67 @@ DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
=20
 TEST_LIST =3D "\
     ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware mm', d)} \
+    acct \
+    breakpoints \
+    cachestat \
+    cgroup \
+    clone3 \
+    core \
+    coredump \
     cpufreq \
     cpu-hotplug \
-    rtc \
+    dmabuf-heaps \
+    efivarfs \
+    filelock \
+    filesystems \
+    filesystems/binderfs \
+    filesystems/epoll \
+    fpu \
+    ftrace \
+    futex \
+    gpio \
+    ipc \
+    kcmp \
+    kvm \
+    landlock \
+    locking \
+    lsm \
+    membarrier \
+    mincore \
+    mount \
+    mount_setattr \
+    move_mount_set_group \
+    mseal_system_mappings \
+    namespaces \
+    net \
+    net/mptcp \
+    pidfd \
+    pid_namespace \
+    proc \
+    ptrace \
     ptp \
+    rlimits \
+    rseq \
+    rtc \
+    sched \
+    seccomp \
+    signal \
+    size \
+    splice \
+    sync \
+    syscall_user_dispatch \
+    sysctl \
+    tc-testing \
+    timens \
     timers \
+    tmpfs \
+    tpm2 \
+    tty \
+    uevent \
+    user_events \
+    vDSO \
+    watchdog \
+    zram \
 "
 EXTRA_OEMAKE =3D '\
     CROSS_COMPILE=3D${TARGET_PREFIX} \
--=20
2.34.1


