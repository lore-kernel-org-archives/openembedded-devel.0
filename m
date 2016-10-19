Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2D3F2719A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2016 05:38:45 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 128so1429355pfz.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Oct 2016 22:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WFLHkpSf8UhB/z4GbTjbuvQe15hwslQc2hNlBunNKxo=;
	b=tlE9eAOO4vcDpsAJfFTzb1E/zgO2NtlJ60+Jc/OcSFGOxAZq288ujZyuSoL+6Qu/wl
	3j/CzvArPqSlZIPhcbcr4Cuc9QGTE2COufm6mVPIjV6jdZa2F9BKsjBG+PEWgN2Tl6ju
	u6Z/9ecum71j31JNUP92v5Iv86ZwsJJKpyEamrTcL5puSeNanHnjnBxr9eM4r89eNhJ+
	r37OK7aN59GytL8vKum6eSeWWJwcpDQmL7M6jnTuTmpTxRxE5PLp1wO3mFU+u3S6ZZBa
	Dcy2fWNlSXPICmHCdjddxTEWlvFWcgfdeCzOP50qsEp19pRP0yU+3VmNf3EgsdGsr221
	44BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WFLHkpSf8UhB/z4GbTjbuvQe15hwslQc2hNlBunNKxo=;
	b=Zl1DfDPeGyc4eDRWxaeIjksZNq76xGDBlrMPClERgIcxG0zw3K7dQ+IThhSBIb5DTv
	3h6bBlkfmjCppf3/xyd3tPqkJIiMekeVwW0cd0+a6o5FqY6HqXBb3AfKz/LiUJVSHOQO
	SSBlfjNgJtosaVK0X7L8hDeSnyQGb6PIjdGu3f+g2rrqtO6s0HsMFQWMihqLftjotieR
	NTdE6WSBSLEpiesz33f4+7bmfRxuVs5BsY14CWdEnIANSJmeXcZh1Ct2R97G7AWWB1y4
	XHUL9fZWEeObZ0M3uDjNGRNYX7dyq/3pVb08oU7Dfzc9L98hCwPQKMZOZNg3EQjF7gj8
	x0DA==
X-Gm-Message-State: AA6/9Rl4nBTsqAR516m68vMsCgLp+6zZwYtrUcaRRcPvkDaeXgEIvJWI0AAxFvk+kDWATg==
X-Received: by 10.99.147.11 with SMTP id b11mr6515672pge.22.1476855526639;
	Tue, 18 Oct 2016 22:38:46 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	qd12sm60099564pab.22.2016.10.18.22.38.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Oct 2016 22:38:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2016 22:38:24 -0700
Message-Id: <20161019053834.11523-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.10.0
In-Reply-To: <20161019053834.11523-1-raj.khem@gmail.com>
References: <20161019053834.11523-1-raj.khem@gmail.com>
Subject: [meta-python][PATCH 06/16] python-greenlet: Rename register from rX to xX for aarch64
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
X-List-Received-Date: Wed, 19 Oct 2016 05:38:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...x-instead-of-r-for-aarch64-register-names.patch | 38 ++++++++++++++++++++++
 .../python/python-greenlet_0.4.9.bb                |  3 ++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch

diff --git a/meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch b/meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch
new file mode 100644
index 0000000..4868bf3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-greenlet/0001-Use-x-instead-of-r-for-aarch64-register-names.patch
@@ -0,0 +1,38 @@
+From b53fb3bf861f895034452e984f2accb8bebbd3c9 Mon Sep 17 00:00:00 2001
+From: Fredrik Fornwall <fredrik@fornwall.net>
+Date: Wed, 7 Sep 2016 09:25:54 +0200
+Subject: [PATCH] Use x instead of r for aarch64 register names
+
+This fixes clang compatibility.
+---
+Upstream-Status: Backport
+
+ platform/switch_aarch64_gcc.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/platform/switch_aarch64_gcc.h b/platform/switch_aarch64_gcc.h
+index 2fbc569..0b9d556 100644
+--- a/platform/switch_aarch64_gcc.h
++++ b/platform/switch_aarch64_gcc.h
+@@ -2,6 +2,7 @@
+  * this is the internal transfer function.
+  *
+  * HISTORY
++ * 07-Sep-16 Add clang support using x register naming. Fredrik Fornwall
+  * 13-Apr-13 Add support for strange GCC caller-save decisions
+  * 08-Apr-13 File creation. Michael Matz
+  *
+@@ -15,8 +16,8 @@
+ 
+ #ifdef SLP_EVAL
+ #define STACK_MAGIC 0
+-#define REGS_TO_SAVE "r19", "r20", "r21", "r22", "r23", "r24", "r25", "r26", \
+-                     "r27", "r28", "r30" /* aka lr */, \
++#define REGS_TO_SAVE "x19", "x20", "x21", "x22", "x23", "x24", "x25", "x26", \
++                     "x27", "x28", "x30" /* aka lr */, \
+                      "v8", "v9", "v10", "v11", \
+                      "v12", "v13", "v14", "v15"
+ 
+-- 
+1.9.1
+
diff --git a/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb b/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
index c1bc214..4c0faf5 100644
--- a/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
+++ b/meta-python/recipes-devtools/python/python-greenlet_0.4.9.bb
@@ -3,6 +3,9 @@ LICENSE = "MIT & PSF"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
+SRC_URI += "\
+           file://0001-Use-x-instead-of-r-for-aarch64-register-names.patch \
+           "
 SRC_URI[md5sum] = "c6659cdb2a5e591723e629d2eef22e82"
 SRC_URI[sha256sum] = "58b2f3a2e7075c655616bf95e82868db4980f3bb6661db70ad02a51e4ddd2252"
 
-- 
2.10.0


