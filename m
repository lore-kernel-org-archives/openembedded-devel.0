Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9504.1792507813035271612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 07:50:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kj1oFwDO;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14fc585291cso746669c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792507812; x=1793112612; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCP4J7r40NkGRrXNwFnKhmhVkqXe/PZRAlNGZys8pbg=;
        b=kj1oFwDO/zwiL9BNr5NX/j9JoCvFidVOpSbioMKbMcrdfVkqQVakWA7QvsLqez8WrM
         /zlLI1KU9gUhbnbX3PwRrA5BfqtSGilPjREnYNvPMw9vDpddUy6eqcpku9ZocDpbmHT8
         km8YhYbdUAeiqdt8vZXOUpIdaWbuEZs2oj6YqaXIyBFnzPeGOEJs4AQX2RrJKNwQEQei
         7HqReVqEj2v6pD+gSt+r4jyv/j9T+6n3H15xiGYYPvYh1qHZhVidOtb1JupW3lQ2IKxs
         aMeo0e/2peqRoBOBXiXfFVufBvQrnIyTp2+IsDNdvphP2EU61yhUaiVdFkm1phaUcy+m
         TWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507812; x=1793112612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCP4J7r40NkGRrXNwFnKhmhVkqXe/PZRAlNGZys8pbg=;
        b=c2SXjbTpVRIHWCBnCdF17jNfgqDeUv0ApQi3IYVeLjfX5WcHAdG8AhrrPXKRVkqLqm
         6nORKf9WRqzhcCRzpwJlVVuiSj8EwM9T3fdHYj9+QMjp+Yfx0d9GXwBdYfQKdsY2VzTW
         Hw7z0hYaBzhiLIyzF2p6bL3YnJmOUID9CvtbErfDWVYtkR+C+V+7pQ4ItT0ikyUiby55
         xc70FRDI7g8PNqOTGBwIB5YKDrjNj9OWmQWxkOkECiwV9Lrm6rguoCZDJ8KRg7Js9Um2
         27u3FzpxvhLUlZed4QHqT0hUQmsiwH0fNsuyzn9h441bsQmpuNVXUFwhFRDgqohFHqXu
         9+Vg==
X-Gm-Message-State: AFq9FYJ1104T5cN8a82BEO/cmAiTmbkegKeWBHffczjRx5IYc6oWfOn6
	HB4KW+DaF7PCGkBNLwKuySJn3wQEjfB9FEL6DOEEuOZCaMr46UK9eYXa/yUN1dat9DI=
X-Gm-Gg: AYBFou1CfZLArghkcLjzOyrbPNKrecMsyYuTGXpT1GdduOgxjvMgpMRLOErz31Ww2nL
	DJQpMrLkqNcz1MX2k+rKFpNCgJYAbyCh6+XaQtOkKekBS6rTcbvl4SkbebqZ6kE3efs9lVrPUXd
	QfUuMUxlX4BRgorfjEzipCbKm9TesqqyIUphLaEg48dXrM3y/w2YwM3YAfyiADk6v7tx6VdRKap
	fDtwrjLzPYSwAfMMl97OE8SMH97pzuKxizVsoJ1yYtgUkxWuvjHGKoxBfAJ03bfeQWuTYYoUxfd
	8sLkhav39ScLYMv/6+NydtYkf0+nqnYrWXZU82IfXYCCNMJa1GG3KlPKkw9jpKlMuj78blRZzVv
	aXXG+93akh8ocNQhAlJ1SGixPuAnnmXDvmLUjm30vDTDNlh/9JwkxsN03jYlGtu4ZYE0kI8IvDM
	sml5xiE6TwoZmiZnMCscQboTf6IZe3K1NymkklpiFVtCKVuW5m+cMjOVjjj7eL4mnI5lA4ffTo3
	6tkNvajTOxCFYNaaYDgxHD2k4iykAcJj1H7M5NRwgkendOBwICu7H4Xyd4KuWfUIMxBmwRYJY03
	KRFj47AYUZqSL1YaNGA1ufdosf5FU35oqmBcxXm3AyBS0L75qnapLCt+BJyOvG9i0xsB5eKg8aM
	tj5ABYos35ZT0rMI/yMFFTPbL+MRNSO8B+G8poirPEe6hW20l1NH/MEYH4K40kO3xEpMS4arKFG
	8zcx/jIuTx8Oz7MrfTH+Pk44obn8fsZxN2hjHCKBENYggAiA==
X-Received: by 2002:a05:7022:ea59:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-188ea937106mr9868463c88.43.1792507811920;
        Tue, 20 Oct 2026 07:50:11 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm43888996c88.12.2026.10.20.07.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:50:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 1/3] leancrypto: Fix FIPS library link with lld on musl
Date: Tue, 20 Oct 2026 07:50:05 -0700
Message-ID: <20261020145007.2409602-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 14:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131175
Content-Type: text/plain; charset="utf-8"

The FIPS integrity linker script takes ADDR(.init) for the hashed
regions, but musl provides no .init section on riscv64. GNU ld accepts
the reference to the missing section and yields an empty range, while
lld errors out:

  ld.lld: error: internal/src/fips_integrity_check.ld:11: undefined section .init

Use ADDR(.init) only when the section has a size, and otherwise an
empty range at the start of .text, matching GNU ld behaviour.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...cript-Handle-a-missing-.init-section.patch | 39 +++++++++++++++++++
 .../leancrypto/leancrypto_1.9.1.bb            |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/leancrypto/files/0002-Linker-script-Handle-a-missing-.init-section.patch

diff --git a/meta-oe/recipes-crypto/leancrypto/files/0002-Linker-script-Handle-a-missing-.init-section.patch b/meta-oe/recipes-crypto/leancrypto/files/0002-Linker-script-Handle-a-missing-.init-section.patch
new file mode 100644
index 0000000000..364f223a8e
--- /dev/null
+++ b/meta-oe/recipes-crypto/leancrypto/files/0002-Linker-script-Handle-a-missing-.init-section.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 19 Oct 2026 22:58:25 -0700
+Subject: [PATCH] Linker script: Handle a missing .init section
+
+Not every C library provides a .init section; musl, for example, has
+no crti.o .init/.fini code on riscv64 and only uses .init_array. The
+linker script then refers to ADDR(.init) of a section which does not
+exist. GNU ld accepts this and yields an empty range, but LLD rejects
+it and the link fails:
+
+  ld.lld: error: internal/src/fips_integrity_check.ld:11: undefined section .init
+  ld.lld: error: internal/src/fips_integrity_check.ld:12: undefined section .init
+
+Only use ADDR(.init) when the section has a size, and otherwise provide
+an empty range at the start of .text, which matches what GNU ld does.
+The symbol values are unchanged whenever .init exists.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ internal/src/fips_integrity_check.ld | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/internal/src/fips_integrity_check.ld b/internal/src/fips_integrity_check.ld
+index 61397f5..e803d2f 100644
+--- a/internal/src/fips_integrity_check.ld
++++ b/internal/src/fips_integrity_check.ld
+@@ -8,8 +8,8 @@ SECTIONS
+ 	.lc_fips_integrity_hash :
+ 	{
+ 		/* Executable code */
+-		PROVIDE(lc_fips_start_init = ADDR(.init));
+-		PROVIDE(lc_fips_end_init = ADDR(.init) + SIZEOF(.init));
++		PROVIDE(lc_fips_start_init = SIZEOF(.init) ? ADDR(.init) : ADDR(.text));
++		PROVIDE(lc_fips_end_init = SIZEOF(.init) ? ADDR(.init) + SIZEOF(.init) : ADDR(.text));
+
+ 		/* Executable code */
+ 		PROVIDE(lc_fips_start_text = ADDR(.text));
diff --git a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
index 083b70fe8c..c5c7bc104a 100644
--- a/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
+++ b/meta-oe/recipes-crypto/leancrypto/leancrypto_1.9.1.bb
@@ -14,6 +14,7 @@ SECTION = "libs"
 SRC_URI = "git://github.com/smuellerDD/leancrypto.git;branch=master;protocol=https;tag=v${PV} \
            file://leancrypto-tests.sh \
            file://0001-secure_execution_linux-drop-redundant-linux-prctl.h-.patch \
+           file://0002-Linker-script-Handle-a-missing-.init-section.patch \
            "
 SRCREV = "65eb4e7e84e3a5499460a66b1623ccf6c59628b1"

