Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37957.1795594123630115819
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gCvRhF1U;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so8058073eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594123; x=1796198923; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5mQSHYfwTNQXEosBTIdjV2WoslcteCYEjUKgQgenvAQ=;
        b=gCvRhF1US6BULY/hfeENLj68Z0ix5RdSaeVhQng9CSHJ4PrX5gRoublXi+ng33K45+
         vFVe1sTIlN6X76EPo+HdWC61nFlXfqpc/tsN59EZSbtCYlzwlOZMJPiRVHsfF3LvEcFf
         yqEjFPCiEIIcfHgH0FdAii0AmdybEM+24PYeF79EpdZLHnebABhZmzxiyjDffGleHws5
         FEn1SqBt4WP/vEsZHHTObreJrrMb6vPjgZcxDxgs8EKqG4JW4bxFXWbzXdNLgoOooO2x
         0oBw342TfNx2nFn+ILDY1BwkKUmxer5hHivAmH9JYEumB6ulW8EyENTWJQKGo0q+uSMI
         WgxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594123; x=1796198923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5mQSHYfwTNQXEosBTIdjV2WoslcteCYEjUKgQgenvAQ=;
        b=Gy8p3IHJiY1GNQIzzfVrKwz57q5/nEqljUns5EksiW/75THHqES6MOCO/LDfvJWGxe
         jVfLaeyk5rKaU0g0kLitjPSt2IpMzxEvqBA9VFBzzoAdRxLMJmrWnhi4oWrIjPIG3fLw
         uumy+oUwK26+iH49xyBAPtNsq7UXJF+dx+JLAV30WC4tu4OwI+4WA4Rnabxxdw5ies1x
         vSCYp012jRaXAJs/vbDaumHtwbkoOhcFBMswmvE8aWgXSYp/jFsxLr5TJtQ46cIv1fDJ
         diTDN/eTZ/WCnxETEcjdiCW2SwTPwQZePVFv6paHN5i10E80VMa1rFBf8COyHVqIi+hM
         3pCw==
X-Gm-Message-State: APuU4Z9fATbTK7Ip9KthxJSvYOc1Q5UXpwSvR91a2RHgS1yxPHWXpQTc
	e7pBQ/taVeewfSv7BlJCIcrONSioT+gHb6UUHDER/9ltFFzkbcWA3JTMyhFsojmu
X-Gm-Gg: AZFdTZfG8hTe2TVLhAoEp/WHNgTnZeO06yxesf4h6I6t6DQdEuVqrUq6mWqFmnNAFo3
	jrUM8BGoVxps9VTVlX4CjKA2p4uNO6yDNkSCfGv70ssrIwDOTnEdmTaoBCrrHbeDgNkhRP0pTIF
	iP2NtEJUi1VWWys4z6VWUu9Lg0f9zXLb+2rAHJEWbia02TjOFYr0nDD79u2wnD7NG1uQnSUg1z/
	91QgwHZYqyDoPR1p7TRqRi0Zyrffur9oRnPZciqOpErnNFgyKWDd+rSHDVCpF1qrdM6qb8heLxp
	/W/Z7BH22ZQMuTKq2CiKlH1+MLHThsGbXk2zk6iZKUjWSkDfQ9BQDNtJPGbkSkrKQNx+gytT7z0
	w2tWSzTg3LdCgowLwC2TnVEgKtjH1A+Go4ZzQOTzR53ZP2bmsgdKyfjDs7l36NAHLD+NBZ0tab0
	0TOgeXREV83zP8P37+UqcrVeB7OVIrwcxSwDaXqqL0wCOImecFOu/Z2+kVczIxwp88/h7yrQak5
	luPjQ2UqdCDlPbjvpbSgEQLeTywGLLdqadwHLSWrg8kJ8JkEYdHm8TJ4S5pmsKRspJY8yvjswy0
	HOhk5fjepM7wRblwn/qT+LIhKA3isslbZZWYZJb/FvRT+L5IEMJahH4ku1gfoxpFk+bZ4kdDOdm
	I2PHPzV0R6dSLupBNHDeifdD6VL5RVhkhTTBusuJLjINZJjYPehQZJH8kivDYLe96CnHc0ClFyP
	cGaLFIX49Yg66Xon7TBa2D71jgjdelxwci/BaZeM4lrM4saqvjGrsloyCH6A7B9BH4mfL4HN2lk
	k/ywbo3py12xANqeakLYA7QdhMUc1mLFtRb7yzNM3ZagaBqww4BZlEsraIWE8RqlOniKd7/opLt
	7azf
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr16114858eec.11.1795594122969;
        Wed, 25 Nov 2026 00:08:42 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.08.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:08:42 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 49/55] bcu: Fix build with CMake 4.5
Date: Wed, 25 Nov 2026 00:07:05 -0800
Message-ID: <20261125080732.2419614-55-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133052
Content-Type: text/plain; charset="utf-8"

CMakeLists.txt runs create_version_h.sh directly with execute_process().
The script has no "#!" line, which CMake 4.5 no longer tolerates: the
exec fails with "exec format error", configure carries on, version.h is
never generated and do_compile fails with:

  bcu.c:58:10: fatal error: 'version.h' file not found

Add a shebang to the script. Also add UPSTREAM_CHECK_GITTAGREGEX so only
bcu_X.Y.Z release tags are considered (the tag list also has a stray
bcu__1.0.173).

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...01-create_version_h.sh-Add-a-shebang.patch | 30 +++++++++++++++++++
 meta-oe/recipes-support/bcu/bcu_1.2.1.bb      |  3 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch

diff --git a/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch b/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch
new file mode 100644
index 0000000000..d8d05eb794
--- /dev/null
+++ b/meta-oe/recipes-support/bcu/bcu/0001-create_version_h.sh-Add-a-shebang.patch
@@ -0,0 +1,30 @@
+From 5cf6653144fe9b3dcb892f40cb919d4536711a5a Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 23 Nov 2026 19:28:03 -0800
+Subject: [PATCH] create_version_h.sh: Add a shebang
+
+CMake runs this script directly through execute_process(). Without a
+"#!" line the kernel cannot execute it, and CMake 4.5 reports
+"exec format error" and carries on, so version.h is never created
+and the build fails with:
+
+  bcu.c:58:10: fatal error: 'version.h' file not found
+
+Add a /bin/sh shebang so the script can be run directly.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ create_version_h.sh | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/create_version_h.sh b/create_version_h.sh
+index e777359..0b6ed65 100755
+--- a/create_version_h.sh
++++ b/create_version_h.sh
+@@ -1,3 +1,4 @@
++#!/bin/sh
+ echo creating ${1}/version.h
+ 
+ if [ "${APPVEYOR_BUILD_VERSION}" = "" ];
diff --git a/meta-oe/recipes-support/bcu/bcu_1.2.1.bb b/meta-oe/recipes-support/bcu/bcu_1.2.1.bb
index 19ea077e90..3a1e80ece5 100644
--- a/meta-oe/recipes-support/bcu/bcu_1.2.1.bb
+++ b/meta-oe/recipes-support/bcu/bcu_1.2.1.bb
@@ -11,9 +11,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=884d48c2aa7b82e1ad4a33909fab24b6"
 
 SRC_URI = "git://github.com/nxp-imx/bcu;protocol=https;nobranch=1;tag=${BPN}_${PV} \
            file://0001-CMakeLists-do-not-use-vendored-libcurl.patch \
+           file://0001-create_version_h.sh-Add-a-shebang.patch \
            "
 SRCREV = "1c79dcf115bcf2c8ad632dadbc749c5e25c52cb1"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^bcu_(?P<pver>\d+(\.\d+)+)$"
+
 
 DEPENDS = "curl libyaml libusb1 openssl libftdi"
 
