Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA63EB64D7
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 03:28:43 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.2615.1687231716122319933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jun 2023 20:28:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oSjQCjX8;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3420dccf277so14833005ab.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 20:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687231715; x=1689823715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDTtKkp1lRYGsBdfAWIEFrlUhmS4OyFR23jNjzPIO6A=;
        b=oSjQCjX87Z65TKNmujhiJdbagJuFwlob47lbvBz+cb/OT1NOb5FGyOUiQccWdYWtgo
         vNuZ5o9nmPQMZFupNYd2zWWJ6RyL7WzDJd2r65DlP2zQfYx2vICThDvFIvYCMbwOD7xi
         yb6tB/gpm/GntCem1W7lG6+38u1lDqtuil0k/9ffRfhFqUfGSXAFgykTKcU8fX9wwJ6W
         oioeT49ezel3cPRFEthHnECHNUX/cWlBazQjcPQW2c4nh7dwvPn2+n7z56tAPYwgwRei
         0v+HTb9jlgheaXjyI2G8TtAAI0qdqL4fCFtbgPJ4t+R3/b7cArFY0gM1rgpuJTQOxnBi
         ZBTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687231715; x=1689823715;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDTtKkp1lRYGsBdfAWIEFrlUhmS4OyFR23jNjzPIO6A=;
        b=G60cs0PR/iwmtJGrZp0pQtzMNoUPlxJlebohTRTHW5TAFc7gVpEZ4KFocpnVh/Nk07
         6ltgdhhvKSWlCTi4/uVdTLQPXMIhUg/eZOylEmd2LrTjWOMHCiERrnk/IfMAxb8ZZj/O
         kGTlk/DpShN+bU+umzBTdeSLe7IvO1CopU077JOm8CqTZZ3s6z/QDWjxHfOphucHUsRx
         /aeqlIpVmfrf7pR+WEnHGbQNcFp8trdUEhELmvmLlvbf/AYUFSSlbsAKoGbKhctzAKJe
         pxVTlSyDgJVhX0eYh7rMRxWVFgUuEFuZ7rFbr+yHzFOJCteJhEtLqWt/CYZjWZ8ryvfq
         PLaQ==
X-Gm-Message-State: AC+VfDx+NGNq58AQAto1IY3dnbexUSO1ejWag9cHTkIQyZa/COs4keUU
	ZWw1IP9JhMAmUr7Jra4ckO5ZILj8drg=
X-Google-Smtp-Source: ACHHUZ7+/YsPST3o2dCyNhBClGTTk0kqKDEEM6B5A2YeomN++NXo34rdPtCe2mGltPFVDhb2MUNuwA==
X-Received: by 2002:a92:d850:0:b0:342:67d:e70e with SMTP id h16-20020a92d850000000b00342067de70emr2522821ilq.5.1687231714864;
        Mon, 19 Jun 2023 20:28:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id l4-20020a17090270c400b001ab39cd875csm491122plt.133.2023.06.19.20.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 20:28:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] syzkaller: Upgrade to latest tip of trunk
Date: Mon, 19 Jun 2023 20:28:32 -0700
Message-ID: <20230620032832.37701-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jun 2023 03:28:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103448

- Enable cgo with this version
- Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...cutor-Include-missing-linux-falloc.h.patch | 37 +++++++++++++++++++
 ...ets.go-allow-users-to-override-hardc.patch | 13 ++-----
 .../recipes-test/syzkaller/syzkaller_git.bb   |  5 ++-
 3 files changed, 44 insertions(+), 11 deletions(-)
 create mode 100644 meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Include-missing-linux-falloc.h.patch

diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Include-missing-linux-falloc.h.patch b/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Include-missing-linux-falloc.h.patch
new file mode 100644
index 0000000000..23bfb9a5e2
--- /dev/null
+++ b/meta-oe/recipes-test/syzkaller/syzkaller/0001-executor-Include-missing-linux-falloc.h.patch
@@ -0,0 +1,37 @@
+From 9db789b4498d4130450e988757914c03e42b40f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 19 Jun 2023 18:33:36 -0700
+Subject: [PATCH] executor: Include missing linux/falloc.h
+
+Its needed for FALLOC_FL_ZERO_RANGE which needs this header, it works
+with glibc because fcntl.h includes this header indirectly, however the
+failure comes to fore with musl C library where this header is not
+included indirectly by other system headers, therefore include it as
+required.
+
+Fixes
+In file included from executor/common.h:505:
+executor/common_linux.h:5604:16: error: use of undeclared identifier 'FALLOC_FL_ZERO_RANGE'
+        fallocate(fd, FALLOC_FL_ZERO_RANGE, 0, SWAP_FILE_SIZE);
+                      ^
+Upstream-Status: Submitted [https://github.com/google/syzkaller/pull/3974]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ executor/common_linux.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/executor/common_linux.h b/executor/common_linux.h
+index d5152e058..9ae3fb159 100644
+--- a/executor/common_linux.h
++++ b/executor/common_linux.h
+@@ -5585,6 +5585,7 @@ static long syz_pkey_set(volatile long pkey, volatile long val)
+ #include <sys/stat.h>
+ #include <sys/swap.h>
+ #include <sys/types.h>
++#include <linux/falloc.h>
+ 
+ #define SWAP_FILE "./swap-file"
+ #define SWAP_FILE_SIZE (128 * 1000 * 1000) // 128 MB.
+-- 
+2.41.0
+
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
index d647b8d4a0..61f4351651 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
+++ b/meta-oe/recipes-test/syzkaller/syzkaller/0001-sys-targets-targets.go-allow-users-to-override-hardc.patch
@@ -18,11 +18,9 @@ Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
  sys/targets/targets.go | 19 +++++++++++--------
  1 file changed, 11 insertions(+), 8 deletions(-)
 
-diff --git a/sys/targets/targets.go b/sys/targets/targets.go
-index f3be708f3..19a8bb681 100644
 --- a/sys/targets/targets.go
 +++ b/sys/targets/targets.go
-@@ -258,7 +258,6 @@ var List = map[string]map[string]*Target{
+@@ -262,7 +262,6 @@ var List = map[string]map[string]*Target
  			PtrSize:          4,
  			PageSize:         4 << 10,
  			LittleEndian:     true,
@@ -30,7 +28,7 @@ index f3be708f3..19a8bb681 100644
  			Triple:           "arm-linux-gnueabi",
  			KernelArch:       "arm",
  			KernelHeaderArch: "arm",
-@@ -670,12 +669,16 @@ func initTarget(target *Target, OS, arch string) {
+@@ -700,12 +699,16 @@ func initTarget(target *Target, OS, arch
  	for i := range target.CFlags {
  		target.replaceSourceDir(&target.CFlags[i], sourceDir)
  	}
@@ -53,15 +51,12 @@ index f3be708f3..19a8bb681 100644
  	}
  	if target.CCompiler == "" {
  		target.setCompiler(useClang)
-@@ -803,7 +806,7 @@ func (target *Target) lazyInit() {
+@@ -839,7 +842,7 @@ func (target *Target) lazyInit() {
  	// On CI we want to fail loudly if cross-compilation breaks.
  	// Also fail if SOURCEDIR_GOOS is set b/c in that case user probably assumes it will work.
- 	if (target.OS != runtime.GOOS || !runningOnCI) && os.Getenv("SOURCEDIR_"+strings.ToUpper(target.OS)) == "" {
+ 	if (target.OS != runtime.GOOS || !runningOnCI) && getSourceDir(target) == "" {
 -		if _, err := exec.LookPath(target.CCompiler); err != nil {
 +		if _, err := exec.LookPath(strings.Fields(target.CCompiler)[0]); err != nil {
  			target.BrokenCompiler = fmt.Sprintf("%v is missing (%v)", target.CCompiler, err)
  			return
  		}
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
index f7c751f806..2adc06a2bc 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -8,8 +8,9 @@ GO_IMPORT = "github.com/google/syzkaller"
 
 SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IMPORT};branch=master \
            file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
+           file://0001-executor-Include-missing-linux-falloc.h.patch;patchdir=src/${GO_IMPORT} \
            "
-SRCREV = "67cb024cd1a3c95e311263a5c95e957f9abfd8ca"
+SRCREV = "6d01f20890edf11b99bb54573025b11c1acd2d52"
 
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
 
@@ -23,7 +24,7 @@ export TARGETOS = '${GOOS}'
 export TARGETARCH = '${GOARCH}'
 export TARGETVMARCH = '${GOARCH}'
 
-CGO_ENABLED = "0"
+CGO_ENABLED = "1"
 
 DEPENDS:class-native += "qemu-system-native"
 
-- 
2.41.0


