Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1652.1792738460447431235
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 23:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qGv5UCUV;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so337026a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 23:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792738460; x=1793343260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWm3LSVgbgD9fNSQlCLzBJI23wQVOQjlvjcnQzuzxW0=;
        b=qGv5UCUV4DLZhY5ekqBeuMG0waM5ZoOUixG9DgLJ9zUnaFItRfy836quBGezyz8+bc
         x9CbJCSZn6dMOxxSCLNIJ4f3y3jqCCtfh2PhToS2Y7C4o8U1DYi6Mt9vYFJqyM0gzmwV
         rdhUSPo3kFCBSiJ+RLdaVydssENc3zCNpUHRW1yiNTkUTdQagdLxuOJFMOJeH5qZ+Nde
         nIRmaGSPeH7Vv41WwfRRUbTznGJXfZkq1xuuZf9U8ke+aLVwExGn48Dfh6HfBHXAP/w/
         A1R/xoObf2HSBNX+VKMsqIClhG4EqHztuqaKfL/9uk9FjzNpBYVIaDAYKHT1eY3GsVL7
         +NeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792738460; x=1793343260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWm3LSVgbgD9fNSQlCLzBJI23wQVOQjlvjcnQzuzxW0=;
        b=O/Zj5sCCl93OQ6DBwybqFLgMrv+t3NxpCrDOT8Uc7KWEghD1tSNoH1554p2ilMKX6K
         llQVUxZmSvXBDNG2+SbLC3IqaPCYzEgbGSRwBb56FghKr7vTJCfV8MSRdd3cgfGZ1PZG
         sOzvDoJ+tyiKGn6029au5eLdnFt/pHAPhfpvKxyllaYkfYZW2prFPTtfu+KQ0eg4UtNN
         1+THNn/u82uSiFh3pZIP93IXG+M0eLoPsPkzgLAhtJHdL1UjP+BAuSNZCJGkO393iQlp
         22yvULpcmoZegr1jwBqKRMD2uI4P6cSvVn5fbxa0u3N9Kdj7LZJBeQzwoih6Z5ZV+ziV
         qVoA==
X-Gm-Message-State: AFq9FYLdvjEBp2N6WWkAnxEqwMsxneuySjgCzsrcIytkjYgwOZTwdsC2
	IGCZGNylguq+Z8okJoczbjFUijZliBObd/ru/e1fp3GAHBfb92V5DEmF9AP8bwFuJ14=
X-Gm-Gg: AYBFou33JrSGEe17bOZGdggfCBfYPAY9qSK776zDesOw9VAQbwzG8Kx8S22GsgcDeMW
	wb9E1D7fOoqYFDjubWGtXQR9a4sslE6SjAQzAec28oiLHkIN+EBRu9L7lI7083yVLyUkIzsvEtM
	keG7XanI6rPSpGyF6WEIwKY7oD4uLobq8TRwGTUgCbgoHcxti8Na1mkwAT49EXfI0/aV29w7dDK
	aRVyStlmVIkH0SnA0BcCWEEf/vidG2SJ982O86tp5u9Pt6a1yPWMPkVLkNDWwkXafPDmnNEqvVZ
	T4SaLOJohb5moe+ns1KENpI/2jbtt0w9yUTlGGhfPmi44ySJSHsu3lVbvWNvgwrA3/w5jnKdVEr
	ATx4DtYZsvdJVnki/QLs7ss5sN85b4BEBHSjFXg8CXG5xyl8k9HQjJZfltNAJcCw1Oj7FIPdksG
	zkG5L/5kh2dqTguTSZd+HFN4TED1w5cXVisYVw2BknnFluBWhi+1R83y/TDVQ1yX/vMLNiKFeL2
	oD9KnALQE99ntxUI2kqNyFiRzUMkG9gI1i92BTMUevOPuIyGMdU2KVSMdnxFAVen5YYay3PDQA3
	nR4u1HiZYUeyT9fhH5OLj7lXCcZCUYEJo9ryaLnyrEZCL/ebG2MT3NXfS+j8AYsZBLJWfAuoHYs
	aVLfdUCCSIcBPfRMNPh6qL9bdWXXITzZfcV/iGmpjLUbJ1A9MRGftkn0gmKbXH5QdnQLxLkKhRr
	toIV1Osljr+Vz1AGdwU8NnqGbwpqFMRier9iZEkKztvMjZXvIlUGUQkHDK/POxNeGCrhWgdHMDA
	sxMRMNxZYgIuFXvBXwG6iPfaL0AJtk/kTJQ10FuxEf+fY9wJegL
X-Received: by 2002:a05:6a21:6b02:b0:3e1:a769:9620 with SMTP id adf61e73a8af0-3e37677f6f3mr1066991637.71.1792738459809;
        Thu, 22 Oct 2026 23:54:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a2c92f7bd8sm384769b3a.50.2026.10.22.23.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:54:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 22/29] librice: Fix build on targets without 64-bit atomics
Date: Thu, 22 Oct 2026 23:53:43 -0700
Message-ID: <20261023065350.3228996-22-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
References: <20261023065350.3228996-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 23 Oct 2026 06:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131346
Content-Type: text/plain; charset="utf-8"

rice-proto counts agents in a core AtomicU64, which is not available on
targets without 64-bit atomics, so it fails to build for riscv32:

  error[E0432]: unresolved import `core::sync::atomic::AtomicU64`

Add a patch that uses AtomicUsize for it, like the other id counters
in rice-proto, keeping the u64 agent id.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...se-AtomicUsize-for-the-agent-counter.patch | 50 +++++++++++++++++++
 .../recipes-support/librice/librice_0.4.3.bb  |  4 +-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/librice/librice/0001-rice-proto-Use-AtomicUsize-for-the-agent-counter.patch

diff --git a/meta-oe/recipes-support/librice/librice/0001-rice-proto-Use-AtomicUsize-for-the-agent-counter.patch b/meta-oe/recipes-support/librice/librice/0001-rice-proto-Use-AtomicUsize-for-the-agent-counter.patch
new file mode 100644
index 0000000000..dacc6a0a81
--- /dev/null
+++ b/meta-oe/recipes-support/librice/librice/0001-rice-proto-Use-AtomicUsize-for-the-agent-counter.patch
@@ -0,0 +1,50 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 22 Oct 2026 14:00:00 -0700
+Subject: [PATCH] rice-proto: Use AtomicUsize for the agent counter
+
+core only provides AtomicU64 on targets with 64-bit atomics, so
+rice-proto fails to build for e.g. riscv32:
+
+  error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
+    --> rice-proto/src/agent.rs:19:5
+
+AGENT_COUNT only hands out agent ids, like the STUN agent, connection
+check and check list counters, which are already AtomicUsize. Use
+AtomicUsize for it as well and widen the value to the u64 id, so
+Agent::id() is unchanged.
+
+Upstream-Status: Submitted [https://github.com/ystreet/librice/pull/202]
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ rice-proto/src/agent.rs | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+--- a/rice-proto/src/agent.rs
++++ b/rice-proto/src/agent.rs
+@@ -16,7 +16,7 @@
+ use core::error::Error;
+ use core::fmt::Display;
+ use core::net::SocketAddr;
+-use core::sync::atomic::AtomicU64;
++use core::sync::atomic::AtomicUsize;
+ use core::time::Duration;
+
+ use stun_proto::Instant;
+@@ -189,7 +189,7 @@
+         turn_client_proto::types::debug_init();
+         rice_stun_types::debug_init();
+
+-        let id = AGENT_COUNT.fetch_add(1, core::sync::atomic::Ordering::SeqCst);
++        let id = AGENT_COUNT.fetch_add(1, core::sync::atomic::Ordering::SeqCst) as u64;
+         let tie_breaker = rand_u64();
+         let controlling = self.controlling;
+         let mut checklistset = ConnCheckListSet::builder(tie_breaker, controlling)
+@@ -210,7 +210,7 @@
+     }
+ }
+
+-static AGENT_COUNT: AtomicU64 = AtomicU64::new(0);
++static AGENT_COUNT: AtomicUsize = AtomicUsize::new(0);
+
+ impl Default for Agent {
+     fn default() -> Self {
diff --git a/meta-oe/recipes-support/librice/librice_0.4.3.bb b/meta-oe/recipes-support/librice/librice_0.4.3.bb
index 61934acd88..95648f97db 100644
--- a/meta-oe/recipes-support/librice/librice_0.4.3.bb
+++ b/meta-oe/recipes-support/librice/librice_0.4.3.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://github.com/ystreet/librice"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE-MIT;md5=b377b220f43d747efdec40d69fcaa69d"

-SRC_URI += " git://github.com/ystreet/librice.git;protocol=https;branch=main;tag=v${PV}"
+SRC_URI += " git://github.com/ystreet/librice.git;protocol=https;branch=main;tag=v${PV} \
+            file://0001-rice-proto-Use-AtomicUsize-for-the-agent-counter.patch \
+"
 SRCREV = "afd70fdd7ca96a39824c55e6b373bac97311f2ba"

 DEPENDS += "openssl clang-native"
