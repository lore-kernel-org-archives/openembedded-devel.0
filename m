Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id DC71C77D04
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 08:51:46 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id y15so4135476lfd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Sep 2017 01:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aJ39qwm7q3oJ5JpjLe6NKwROmI848sM4nAclU1hqgiQ=;
	b=F7IBNTTq3aYOEKzEhz7X/YRaJ8/xZRMjTYAj7WODdyHIkqujvg2AxgUqAi0oWMgkV6
	2BCcKR1cHIpYa0Po1l7hjAi0vnGz7Hx2rIr7GxXR1dFcNOOyr4DMeKsQ2m2unTBH/jlH
	8/Ue7LrpnC3WL0+ueWWvNDRew0tMR5C5/7roTI/WsvsRQSyeHN3OGcLoMq27gAmyePrw
	W4+LSaghCJYhKDrtZP/gwIbtOhykm7mIsl8UJfOhTRrZ5vVk7ajjjxuDh8CqvKZdcTIx
	P3mevaRRDgmEfxCYDNJCOhxXdAFhUCUMiFOukFrLaVjYLICFcevR18uDeo6y+HUxYMM9
	MmXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aJ39qwm7q3oJ5JpjLe6NKwROmI848sM4nAclU1hqgiQ=;
	b=UUcE3KUIYdGCJ9T3++6+CqTgSQb0BaBjLDcIfFrjOKWUZgZMqwo9jkT/YpmMG9wGHV
	TEAJ/C1XQR+fSOm3DKyeao4GEVb8CyG/RNtZ9aPUAoDpiLQKUqhiGijFeYjuBZi8ZtEY
	OoWzgT+xB4v36s7+ySEY21T8fRRDX5WGVp/gL9hkGNAs2OMvdUWzhFFVEd9rzQ7QKxtU
	Qal+avs0g/Yzf1flIKU4XMkGNpfGGjlLJ0Q8/7BbVrQwa2oai5NKF8NduTKDqaZRHbgw
	a+xb1CKCE6CNMd4ImnhYTjXwwKPH48RFgq+tgfiJJVJalFoFQj80I730SjQWKzJQNWqq
	a5Hg==
X-Gm-Message-State: AHPjjUjjLvcnKSGVUfFU0namiUQwpJp5ix+hcaOcDlW33vXkntP2o+Op
	kYe+ZPuitVyb/OfOsro=
X-Google-Smtp-Source: AOwi7QBqrLAM8sZPbM4t1tRxh1MLfRO600pMDF9LyNyvwvvAgsWjyoAwMdNa/fM2B7KxM8qs7gGm1w==
X-Received: by 10.25.92.68 with SMTP id q65mr694604lfb.206.1504774307244;
	Thu, 07 Sep 2017 01:51:47 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id n13sm332735lja.7.2017.09.07.01.51.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Sep 2017 01:51:45 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Sep 2017 10:51:36 +0200
Message-Id: <20170907085136.20862-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
References: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
Subject: [meta-java][PATCH 2/2] openjdk-8-native: Fix sigsegv with gcc7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Sep 2017 08:51:47 -0000

OpenJDK does not build properly with GCC7. Add the same workaround that
we have for GCC6.

Without this patch:

| #
| # A fatal error has been detected by the Java Runtime Environment:
| #
| #  SIGSEGV (0xb) at pc=0x00007fcad0efcd5b, pid=17206, tid=0x00007fcab264c700
| #
| # JRE version: OpenJDK Runtime Environment (8.0_102-b14) (build 1.8.0_102-internal-b14)
| # Java VM: OpenJDK 64-Bit Server VM (25.102-b14 mixed mode linux-amd64 compressed oops)
| # Problematic frame:
| # V  [libjvm.so+0x78bd5b]  Node::Node(unsigned int)+0x2b
| #
| # Failed to write core dump. Core dumps have been disabled. To enable core dumping, try "ulimit -c unlimited" before starting Java again
| #
| # An error report file with more information is saved as:
| # /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-linux/openjdk-8-native/102b14-r0/build/hs_err_pid17206.log
| [thread 140508549912320 also had an error]
|
| [error occurred during error reporting , id 0xb]
|
| #
| # If you would like to submit a bug report, please visit:
| #   http://bugreport.java.com/bugreport/crash.jsp
| #

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index def779db4d59..0c5c2c3e3d2f 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -218,10 +218,11 @@ EXTRA_OECONF_append = "\
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
 "
 
-# GCC 6 sets the default C++ standard to C++14 and introduces dead store
-# elimination by default. OpenJDK 8 is not ready for either of these
-# changes.
+# Since v6, GCC sets the default C++ standard to C++14 and introduces
+# dead store elimination by default. OpenJDK 8 is not ready for either
+# of these changes.
 FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 
 # All supported cross compilers support the compiler flags that were
 # added to make compilation with gcc6 work. But the host compiler for
-- 
2.14.1


