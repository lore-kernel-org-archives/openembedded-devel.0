Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id A6FC477E4E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 15:55:54 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e69so1411614pfg.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=EoK/rpL1ieIfv0qJMZA7Bzy93lMZwgHf4XHT2wPD7gY=;
	b=TpoCcbc4XsxEnc7RciExU4Bd7GiCXgATB9DRhynY+ye9Xw5Ol9lOGJj+y63QRqt2aE
	VNu+d5dEx1Go/ope/4jz1PJW9rpg1WjPc4ey6ngxPGAy2iJk3BcdunUhwCfRy5tiy7pV
	WR9KvM/7Mx1kEXar7x2u1ZUPLoEMKlkv9j/gPelv3owyKtuql3BGW1ZBSUO+1ITK2k7U
	G6kqgva8HR/78VgYJQwE2CRoJR5jy6LRv3qT8PqmVH97vt7oj/L/mRiiZZEVeb09rbsi
	XTHjhFfOwvPaG5VcZCdDcU13dSjDxm8PyQQWsqOicJDfg9fpPzg/EzbJ36ts1lruvFJN
	3Jyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=EoK/rpL1ieIfv0qJMZA7Bzy93lMZwgHf4XHT2wPD7gY=;
	b=ERyHKhHSH3GGadO+detO4kMO2ezCGpMZGyO61jUWP8vjYIdzZKrue2vAD0IPHfmo2m
	v3CY2avDSyGulle/OtDS61gcr/V8Mp335qtJAG2uokqAaUVW+npQXLKfCeu++Z1Ws7y9
	or9FDU5dDV2HAVFJB/xZvGv3Zr7vFcST7FILSLtk3LUWuV91a6MXkBqsOFopJb47L/76
	9NqkYisWSGHLbyC+ZuXm3+8j66fYbB7H0rMfdMDrSs7GtU77kYqa8m7Xp08QPIjU0+tY
	N6GaiBDlDvgN78ELtVxHGECEoY/PXP98Xk+/OI0aCjQGsaxh4+NOhIrPZLfY3J/mLEy1
	gJsQ==
X-Gm-Message-State: AHPjjUhQBG0VnxEhjR5x1OEcQGXuxSQHiLXSPxonUKf+f0R/2fp5LmGV
	eBZi3RZ/WUB8jl4d
X-Google-Smtp-Source: ADKCNb6svWvWSvD+3Zx4NlGMZHfjYSYzu2BE270adOGMJFavJzfzKvH9hi4kYdO3J+b5KtzlPX15JQ==
X-Received: by 10.98.178.80 with SMTP id x77mr24182907pfe.12.1505490955410;
	Fri, 15 Sep 2017 08:55:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::989f])
	by smtp.gmail.com with ESMTPSA id j2sm3391636pgn.26.2017.09.15.08.55.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Sep 2017 08:55:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Sep 2017 08:55:46 -0700
Message-Id: <20170915155547.40966-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] openwsman: Fix build with musl
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
X-List-Received-Date: Fri, 15 Sep 2017 15:55:54 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ne-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch | 29 ++++++++++++++++++++++
 .../recipes-extended/openwsman/openwsman_2.6.3.bb  |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch

diff --git a/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch b/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
new file mode 100644
index 000000000..7823fde7a
--- /dev/null
+++ b/meta-oe/recipes-extended/openwsman/openwsman/0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch
@@ -0,0 +1,29 @@
+From e05bad73f5fe4be1626560d92465893a5fc931e5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 15 Sep 2017 00:01:19 -0700
+Subject: [PATCH] lock.c: Define PTHREAD_MUTEX_RECURSIVE_NP if undefined
+
+Check for PTHREAD_MUTEX_RECURSIVE_NP being defined instead of
+checking for OS
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/u/lock.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/u/lock.c b/src/lib/u/lock.c
+index 025eea4c..b31c77b5 100644
+--- a/src/lib/u/lock.c
++++ b/src/lib/u/lock.c
+@@ -50,7 +50,7 @@
+ extern int pthread_mutexattr_settype(pthread_mutexattr_t *attr, int type);
+ #endif
+ 
+-#if defined (__SVR4) && defined (__sun)
++#ifndef PTHREAD_MUTEX_RECURSIVE_NP
+ #define PTHREAD_MUTEX_RECURSIVE_NP PTHREAD_MUTEX_RECURSIVE
+ #endif
+ 
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
index 2925f4b9e..c4778ca38 100644
--- a/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
+++ b/meta-oe/recipes-extended/openwsman/openwsman_2.6.3.bb
@@ -17,7 +17,9 @@ PV = "2.6.3"
 
 SRC_URI = "git://github.com/Openwsman/openwsman.git \
            file://libssl-is-required-if-eventint-supported.patch \
-           file://openwsmand.service"
+           file://openwsmand.service \
+           file://0001-lock.c-Define-PTHREAD_MUTEX_RECURSIVE_NP-if-undefine.patch \
+           "
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


