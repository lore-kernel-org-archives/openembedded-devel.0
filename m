Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8840.1792456229967102842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2026 17:30:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AcGiTEKE;
 spf=pass (domain: gmail.com, ip: 74.125.82.173, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so7032658eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2026 17:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456229; x=1793061029; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lA3yrWQaFNxy8NHU4fc5Se9Fsu+Tkk1EXvhS/+TXZzA=;
        b=AcGiTEKEh72H19t8TKXjt/vYrrVrqu0EdRab7nVdtvuwa9cR3qCuXKyyuLFJW17AOx
         ikfflTQrnZPv0Ffs+evoUj7O3AI3uZCekZlmXIV46Z+LWWqYZKsa0jjtyh0Ou2j4ttT6
         otoCA6i828dxxF73UgRthXk68GJsUwFzkMQmZoaQMSRtAA2Xanv9kRBWqYcffZXO+8qp
         ylEs+x1ffJa+5gOcK0LCIf/n2ozl9orpuYe6MAOrDqD2vTf9iGYqzX4XfcEIgjAX3h4q
         AqSMlb2KiXBzjjTxSDUFepxLo9EOJnfcIl9sFAO4EVAdxQGl9ppnPmS0nQbmt2/S51dW
         j5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456229; x=1793061029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lA3yrWQaFNxy8NHU4fc5Se9Fsu+Tkk1EXvhS/+TXZzA=;
        b=i8ANa0BK43+o3RKYC6RuihXP1/DVxtI2D+CDTHpBmzZ0R2yKtgb1Z2unN5vtfR9tr2
         cm6lQ8OL2r/71Vo/u3CVwNzXMr6c8ZtKm/cIahjZd13uDM8SoGvRMJW1KPqFbos0QpvU
         Kp/6cZQbp2kDFi4qW2s03XwyZHCXJvgIxhoRffLZcjz5V9oTZfeoKKlvG5o4DHs7Fz0d
         V4fUd0JMK8RTxtpTyL1NgkOsUenLfLhzTg0uy868uNFKdjggh+Dbz+tuvPf5FiALfHXZ
         RP5RVHzGdnKOOXzwLGC+m/kr+9Z7SoVEUrlJX8N7eVcdlyBroaA3oj9aO7q76hKLV43k
         qNLg==
X-Gm-Message-State: AFq9FYJzJVUjwofnh5Nk7fICur2/x/YeoaPL7bH22z0hbS4SJouj2Lz1
	aITfEUTZKFYaqPjXDD+WLLxZJn2hJ9o+7FMXFF7BuVEcyxZreDynJzGQYtAAj4ikqII=
X-Gm-Gg: AYBFou2Igx1wxo3oi92deHXIhITXe28xIQt5N0z5KOIaqB+oTVhBuQT/ofaIS1oxF52
	ecVuezGZT06RMSED6JW4iEzh15fBxQvvvhJRUzJeeHcKUGFoIlGKuJ1qo6vnswNc0lEHwrBT75N
	Xej1G51fXNTSLovGc0EWC6Pt3qalZjqBnMyiXDb52rXEtBt4T6FEGbbNVBRmKUZQsPh4YoCg+rh
	BF3lAjzL1u4dsW/CIsuOHLrWQX139jJra76X81VVN8qAfmOs6YNNs8x5HkJKJMXeDgSOQhWaXpp
	a1O8jVLejDjw7a08LVd2LhtAKI728ZokvKj2lc8MdOnzthVJ94gNTMn0CSlJBr6X+PkYhj8H7j8
	6qqviJ84sqfjjegn7n57jbTsgbB3eg2EPXGdxvUOJh7p4pKj9oWsN89MBEvnMvNkefopLK4jjtX
	NMsMPfHG0ctvPYOnpGR9fnPG3O9SsGnZ1johNFKtaP22SWwixLQjlrp+VcuYH9jJ8IFc36umgMi
	x+jjt+FxpNshf86nNm71svv/+uNf1a9WLZSZckNvmBadl1jGTr+loaybV7BB+OOqM5sEygs7f73
	36AEuQ8JhKp9obNBuDH0GXcR7K1LZf54j0rX/fUUfW5E9wn4vLuyz5ToE48l3+a61oMnt+ATI0Y
	0VkghPAlkKits9LpNPx8jOLGssACzUloBCjeV0LCc/iWT15UQOQGiiWayX4/nOMmxb6++LODg1/
	B8z4G7AhKpyFiPLCWgZ9UsBTIAUT2Ms6OjAsT78WeUkcq2xBXyCeeS0KslMGG+BLMkO4Kf4DeAO
	ERUatkGFvng/CGtQnTeG2TdLPtbMZQ=
X-Received: by 2002:a05:7301:1882:b0:341:5da1:7851 with SMTP id 5a478bee46e88-36632d8b0ccmr262731eec.12.1792456229046;
        Mon, 19 Oct 2026 17:30:29 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm35596579eec.13.2026.10.19.17.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:30:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/5] xdp-tools: Fix embedded BPF objects when linking with lld
Date: Mon, 19 Oct 2026 17:30:20 -0700
Message-ID: <20261020003022.1913623-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
References: <20261020003022.1913623-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 00:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131149
Content-Type: text/plain; charset="utf-8"

libxdp turns its BPF programs into linkable objects with a relocatable
link of a raw binary input (cc -r -Wl,--format=binary). Because there is
no real object among the inputs, lld on riscv64 writes an object with
e_flags 0 (soft-float ABI) and a GNU property note with every CFI feature
bit set. Linking it then fails with clang:

  ld.lld: error: libxdp.a(xdp-dispatcher.embed.o): file has conflicting
    properties: GNU_PROPERTY_RISCV_FEATURE_1_CFI_LP_UNLABELED and
    GNU_PROPERTY_RISCV_FEATURE_1_CFI_LP_FUNC_SIG
  ld.lld: error: libxdp.a(xdp-dispatcher.embed.o): cannot link object
    files with different floating-point ABI from Scrt1.o

Build the embed objects from a small .incbin assembly stub instead, so the
compiler driver emits them with the correct target ABI.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-BPF-objects-with-.incbin-instead-of.patch | 43 +++++++++++++++++++
 .../xdp-tools/xdp-tools_1.6.3.bb              |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-oe/recipes-support/xdp-tools/files/0005-lib-libxdp-Embed-BPF-objects-with-.incbin-instead-of.patch

diff --git a/meta-oe/recipes-support/xdp-tools/files/0005-lib-libxdp-Embed-BPF-objects-with-.incbin-instead-of.patch b/meta-oe/recipes-support/xdp-tools/files/0005-lib-libxdp-Embed-BPF-objects-with-.incbin-instead-of.patch
new file mode 100644
index 0000000000..1309a84aa1
--- /dev/null
+++ b/meta-oe/recipes-support/xdp-tools/files/0005-lib-libxdp-Embed-BPF-objects-with-.incbin-instead-of.patch
@@ -0,0 +1,43 @@
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 18 Oct 2026 18:00:00 -0700
+Subject: [PATCH] lib/libxdp: Embed BPF objects with .incbin instead of ld --format=binary
+
+The embedded BPF objects are made with a relocatable link of a raw binary
+input (cc -r -Wl,--format=binary). When the only input is a raw binary,
+the linker has no real object to take target attributes from. With lld on
+riscv64 the result has e_flags 0 (soft-float ABI) and a
+.note.gnu.property where every CFI feature bit is set. Linking it into
+libxdp users then fails:
+
+  ld.lld: error: libxdp.a(xdp-dispatcher.embed.o): file has conflicting
+    properties: GNU_PROPERTY_RISCV_FEATURE_1_CFI_LP_UNLABELED and
+    GNU_PROPERTY_RISCV_FEATURE_1_CFI_LP_FUNC_SIG
+  ld.lld: error: libxdp.a(xdp-dispatcher.embed.o): cannot link object
+    files with different floating-point ABI from Scrt1.o
+
+Instead, assemble a small stub that pulls in the BPF object with .incbin.
+The compiler driver then emits a normal object for the target ABI. The
+_binary_<name>_start/_end symbol names that libxdp.c uses stay the same.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/libxdp/Makefile | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -134,8 +134,10 @@
+ 	$(QUIET_M4)$(M4) $(DEFINES) $< > $@ || ( ret=$$?; rm -f $@; exit $$ret )
+
+ $(EMBEDDED_XDP_OBJS): %.embed.o: %.o
+-	$(QUIET_CC)$(CC) -r -nostdlib -Wl,-z,noexecstack,--format=binary $(LDFLAGS) -o $@ $<
+-	$(Q)$(OBJCOPY)  --rename-section .data=.rodata,alloc,load,readonly,data,contents $@
++	$(QUIET_CC)SYM=_binary_$$(echo '$<' | sed 's/[^A-Za-z0-9_]/_/g'); \
++	printf '\t.section .rodata,"a"\n\t.balign 8\n\t.globl %s_start\n%s_start:\n\t.incbin "%s"\n\t.globl %s_end\n%s_end:\n' \
++		$$SYM $$SYM '$<' $$SYM $$SYM | \
++	$(CC) -c -x assembler -Wa,--noexecstack -o $@ -
+
+ $(XDP_OBJS): %.o: %.c $(BPF_HEADERS) $(LIBMK)
+ 	$(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS) -O2 -c -g -o $@ $<
diff --git a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
index bcaa8c91c4..577a7b39d5 100644
--- a/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
+++ b/meta-oe/recipes-support/xdp-tools/xdp-tools_1.6.3.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0002-lib-libxdp-Makefile-use-cp-fRd-to-preserve-symlinks-.patch \
     file://0003-lib-util-avoid-struct-ethhdr-redefinition-on-musl.patch \
     file://0004-xdp-filter-xdp-dump-avoid-struct-ethhdr-redefinitio.patch \
+    file://0005-lib-libxdp-Embed-BPF-objects-with-.incbin-instead-of.patch \
 "
 SRCREV = "8fbad9f0af621a22aa87ff2520b3735915b1f0fd"

