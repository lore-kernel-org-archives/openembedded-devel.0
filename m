Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF6FC36010
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 05:20:56 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.39641.1744003247837289828
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Apr 2025 22:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LhEUpFU7;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2ff69365e1dso2993193a91.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 06 Apr 2025 22:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744003247; x=1744608047; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9RiNxB1dUXl7SJ2Ju+KBnhgKzrWBcEfhNaLnxK3u/ok=;
        b=LhEUpFU7ayE48ICIDP4V2pYXcakev3oNIxV24gl9v1VEAzBHiTi/uSVmRiHDeuYfCd
         5erWroexuIrVFwzR9hgcMnAGG+/i+SjfDQoex64+v/3kFzj+YNCXmVpZFXjWfVi6iaiE
         Yhk2iTd/E4PiHTEYFvCLJSGrj1vAM1QvycEu0QQuSGUKlyBU7rTs5difMxoYBa1m2rZc
         GIqKYsJRW9F/q+16vt7lI4xFcKkeQFAHzyirUG0CkDOKYLj415roLJz+z2jypXALmSkK
         KCjoIb0nK0XivnkN+EL4SNF0D1klSVReIHcJciJBjK60sTBVk12bx8cLgN/gjrDx0Hut
         dxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744003247; x=1744608047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9RiNxB1dUXl7SJ2Ju+KBnhgKzrWBcEfhNaLnxK3u/ok=;
        b=AOiLj+ixdUkMfBwC5h1+ujtan9I4UpzoYYutAvL7eMD0BzYKng2agVmQ2ych5XLHi8
         HLwq/RYBgbo41yuT8IbWWSpqG5gFvKVR2YjooPsxhpDdTiM2x8nf3p8RrJso9PbN255V
         J4y25jXeXppP9rFEgkUNJf9xDSstNsSr25oqwIlg1aya4Hzwf6hfhtJoap8m1MUTLcIe
         5T6gluK6NrmuUmHPkmYDwnIi6tWOFmAcxQRu2XeAgU+heqBo45ouHXKPa6DIxrdQTxG4
         EOUf9GRJw6Uietae+Cl47/k5ulrPfye90QYE4POu8/RrAPL0eV7grVXVLhX3j9FlU7ng
         YCIw==
X-Gm-Message-State: AOJu0YxnbrKB8a2HXyp7PH80seABhQ8Kn8fxtTrYvD1F5c0ymv+NO68C
	54947AFYItKKcfl/kJB+26cdXnH6IOA1RtFzhVNyNDU64gz4f1H/o3LdR2cV
X-Gm-Gg: ASbGncvPkprnVxA898nuuuUsCdMj0jDa6ZhVqFcBMp70tNYRogmSdMAgvoNaVqVyfa3
	rF6wfD1kjeYvLIsDzHwnmAquITzm/yvVE+SA4SE6x5SuouRyuaPpUcc106h9jcI3rQcUUWpfKiC
	WArK2/yFkr/W63HQruq9IAfVs19HgzBIAl4N6iPNEmWAVWWW9PQeJcXmEKqLfSz1Y11TJjfUBGE
	zvBQXicPqdEVHpILC+fJBKt0sfM910ag2eI8YjKGEMPLoB9UhXjQhfHEtDqTqBoKGi0hmCXDpyT
	7ID3yRFb8XKzBALQ+SQ0PnzKNdf68sl5ahZJ
X-Google-Smtp-Source: AGHT+IGuNeMFEctmynlkg7c4jn9ZX3238HNs77mNoSJMPbjwNQdD84WOHi1FbVpWsKnI/XPT/RwIvA==
X-Received: by 2002:a17:90b:3a44:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-306a4900a4dmr16197571a91.28.1744003246937;
        Sun, 06 Apr 2025 22:20:46 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::f900])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30561ca5da3sm7607546a91.0.2025.04.06.22.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 22:20:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 7/7] python3-greenlet: Fix build on RISCV32
Date: Sun,  6 Apr 2025 22:20:37 -0700
Message-ID: <20250407052037.502341-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407052037.502341-1-raj.khem@gmail.com>
References: <20250407052037.502341-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 05:20:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116623

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-slp_switch-Implement-for-RISCV32.patch | 48 +++++++++++++++++++
 .../python/python3-greenlet_3.1.1.bb          |  2 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch

diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch
new file mode 100644
index 0000000000..83877d3860
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet/0001-slp_switch-Implement-for-RISCV32.patch
@@ -0,0 +1,48 @@
+From 524fd7244cfec4ec6760e52001c9a41d1913066e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 6 Apr 2025 20:54:08 -0700
+Subject: [PATCH] slp_switch: Implement for RISCV32
+
+Changed data types from long to int for fp variable
+stackref pointer and stsizediff variable
+
+Changed the load instruction from ld (64-bit load) to lw (32-bit load)
+
+Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/439]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/greenlet/platform/switch_riscv_unix.h | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/greenlet/platform/switch_riscv_unix.h b/src/greenlet/platform/switch_riscv_unix.h
+index e74f37a..32ca78c 100644
+--- a/src/greenlet/platform/switch_riscv_unix.h
++++ b/src/greenlet/platform/switch_riscv_unix.h
+@@ -11,9 +11,14 @@
+ static int
+ slp_switch(void)
+ {
+-  long fp;
+   int ret;
++#if __riscv_xlen == 32
++  long fp;
+   long *stackref, stsizediff;
++#else
++  int fp;
++  int *stackref, stsizediff;
++#endif
+   __asm__ volatile ("" : : : REGS_TO_SAVE);
+   __asm__ volatile ("mv %0, fp" : "=r" (fp) : );
+   __asm__ volatile ("mv %0, sp" : "=r" (stackref) : );
+@@ -28,7 +33,11 @@ slp_switch(void)
+       SLP_RESTORE_STATE();
+   }
+   __asm__ volatile ("" : : : REGS_TO_SAVE);
++#if __riscv_xlen == 32
++  __asm__ volatile ("lw fp, %0" : : "m" (fp));
++#else
+   __asm__ volatile ("ld fp, %0" : : "m" (fp));
++#endif
+   __asm__ volatile ("mv %0, zero" : "=r" (ret) : );
+   return ret;
+ }
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
index c7a38b9a12..b45edac12d 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
@@ -8,4 +8,6 @@ SRC_URI[sha256sum] = "4ce3ac6cdb6adf7946475d7ef31777c26d94bccc377e070a7986bd2d5c
 
 inherit pypi python_setuptools_build_meta
 
+SRC_URI += "file://0001-slp_switch-Implement-for-RISCV32.patch"
+
 BBCLASSEXTEND = "native nativesdk"

