Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E8F8EB64DA
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:27:17 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.522.1686886036513652577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=M84Fh9io;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b520c77de0so2078035ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 20:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686886036; x=1689478036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3b+6NlQKHudFfQB/+gt4tpYnHmi+ANRWBtirBkSFU8=;
        b=M84Fh9ioDFACZN+U/MDmO5QWBxs8HieIrgsn2tqUldcQta76RJm1hG/Gc+XVA8bQOQ
         QBPWKtrjzvfpFYr7G+0Mhl+A7Wpj8qEIiP5AIIxDuXVTurzDSF0qh3dHuRX+JxeWTYiA
         lDJvFmLul1f+HvKFWOBaigp5pkpz5dPPBQkCMHzjpIF691gorhT4yH6LsFDLzCF9hI1r
         6nSVfDA33rx35ncQNDBYGQ7Bu1I8IL5ZqxqJHQKQeCg1N8/Z4fPbdctRY4ui+/kuBqlu
         tFznBi8IIOLbYixsYVCpk0P6Temho0IhCYsW+PiVpcnEIhrYxbYpwvYYp2j5W1DjDP2f
         Ak2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686886036; x=1689478036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3b+6NlQKHudFfQB/+gt4tpYnHmi+ANRWBtirBkSFU8=;
        b=F3m02rA5XuBLlx3RPNcq8OJmvhgkA03GgFkQQGM/wLt0Z8A1z12bibZrGLsIv48XBw
         2g46NKVa9KoaxVnFdOM8VWnHwMG/M8K/asIToWqcYxy9oUlgSZOEE4pNiJwWJwm4wISy
         CEnne1VidUe4AI5+YD/D3pWk4ndGAuB4NzNF5Bq1bEAiOACdh/bqnZFKpaqtQcALqky3
         PT73x9wCImWdBC81lTuydKuH2AJ5GSTd+XfjKfSoTmR2Xm3goImvz+SIsG9N14kF7zaY
         ePTZvF95fmbpq1tj5AAs35GkNSTrJXESeOIgzKwvRkcFJ5iDUh5+uIBt6ikT1djN5iFi
         15Nw==
X-Gm-Message-State: AC+VfDybWYyexKuKJy97B7wmEwvB0uWYvET1CwuESZ8Gk+CDY6SvO87A
	NUdCgKp7IEa8I6E/v92Sdw8egRm8mSk=
X-Google-Smtp-Source: ACHHUZ6oCzoeArBcNgEAHMigm582efpw9yTLvfirhapHqHVnEO7BgE/iLOf7zynLI8MNKQprYeFqeg==
X-Received: by 2002:a17:902:a706:b0:1b3:a949:cfdf with SMTP id w6-20020a170902a70600b001b3a949cfdfmr665743plq.4.1686886035361;
        Thu, 15 Jun 2023 20:27:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::eb87])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b001ae59169f05sm14793021pls.182.2023.06.15.20.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 20:27:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] syzkaller: Upgrade to latest tip of trunk
Date: Thu, 15 Jun 2023 20:27:12 -0700
Message-ID: <20230616032712.2118171-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230616032712.2118171-1-raj.khem@gmail.com>
References: <20230616032712.2118171-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Jun 2023 03:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103334

Enable cgo with this version

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...s-targets.go-allow-users-to-override-hardc.patch | 13 ++++---------
 meta-oe/recipes-test/syzkaller/syzkaller_git.bb     |  4 ++--
 2 files changed, 6 insertions(+), 11 deletions(-)

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
index f7c751f806..abb7611e5e 100644
--- a/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
+++ b/meta-oe/recipes-test/syzkaller/syzkaller_git.bb
@@ -9,7 +9,7 @@ GO_IMPORT = "github.com/google/syzkaller"
 SRC_URI = "git://${GO_IMPORT};protocol=https;destsuffix=${BPN}-${PV}/src/${GO_IMPORT};branch=master \
            file://0001-sys-targets-targets.go-allow-users-to-override-hardc.patch;patchdir=src/${GO_IMPORT} \
            "
-SRCREV = "67cb024cd1a3c95e311263a5c95e957f9abfd8ca"
+SRCREV = "6d01f20890edf11b99bb54573025b11c1acd2d52"
 
 COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64).*-linux"
 
@@ -23,7 +23,7 @@ export TARGETOS = '${GOOS}'
 export TARGETARCH = '${GOARCH}'
 export TARGETVMARCH = '${GOARCH}'
 
-CGO_ENABLED = "0"
+CGO_ENABLED = "1"
 
 DEPENDS:class-native += "qemu-system-native"
 
-- 
2.41.0


