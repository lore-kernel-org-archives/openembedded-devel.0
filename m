Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3101.1794685062016855813
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 11:37:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=AaGB4M8y;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so3995896eec.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 11:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794685061; x=1795289861; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJMozgwRsE75e5RnxyqnCAOLETkmMWCDKCwM5TINPUg=;
        b=AaGB4M8y44lSB1Ce7s7nlqUZ8F8TB1AeyUTsFgd30+ky1qALwGxCc9hc2Keg6wIuff
         KM07wk7VWwMj6jy53TU6oZLTJ2do3GDjLRmvIrjq3ZI/g8e9kaGg8CF40dNVgN6Pn7VC
         D5R+DA0roaY5uHb0F8yrgWNXcjibT5AsZeEx6sDN0nxQDyubyvjGZTYQ9aaeEWhf9wzh
         ZiQmnb8791r5bQcEHz6pdY0x349Zpj7gv3KsQV42zp4T2RLH7Rsyg7YFeBYN/4uIzcuT
         s+0C2k3+HbAnCCXEzRJOXIcE6PQ/IRugPSGKdjjLFD56UvZyAY7F0IH3xQ64l72jkTri
         3UdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794685061; x=1795289861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CJMozgwRsE75e5RnxyqnCAOLETkmMWCDKCwM5TINPUg=;
        b=JOEMWgylxVidQbiOdhrsYUPWMcYSZN73apy7Q79ZCeJixZgrufABu6QZJcvI1n02uR
         GV3jN28PzH/h3xXPPWMmPhVlDvJWGm5KfpStuKB1bPN5SnlyPYja0yT4FSZUiu6+Hozx
         tqmkHqW3r6hvDlSEANfff/tNpxIJO/XjlT0ciBuLyz7sWaOs3bKGuqbgb8nA1p3rChPW
         zsw1dzgOW5q9PKgWhhvyf0K6QfzXGPYYKkdlGxDG8OZufAbaEIzBJF+9QPcw4kPUvJCO
         pdn1x8ApBwmiOd/TNF8ICFWlnWl8j7XsfOfnhB0pbyy/j6FW1jAmDoXDK4+StYJmjGgp
         Y7bg==
X-Gm-Message-State: APuU4Z/nXEhQpuYKVaTXWb3nse0MvcqbK+AxOdjqkJRoCfLznzpwXH3w
	ORDv/KxEjiphNJmEA1dhutHopVyYb0mnkVQa2o8pxSCfKAh+E1UAdWbT9LBO+xnO
X-Gm-Gg: AYBFou0q8s54L8oAWz4PEewauYydTrKbZvoZdFHJQw/EnvJkzGdgm7vGYWAwvfp899c
	ud7TqT98uBVFkCmE2ZIFatT+T+eq/sUeobpUVYys8igNezb8lLGUVAcqUyvrNhEptegfyu7AP7e
	VBv9mtoCB89pkQJX0TURAEPNH8BPrP5+hcJ1ZLaYRD8iYTHIUiBGBOdeMgvRTljrI9bdJ+ly73w
	3G7PRPCALv24gW2U+jGeWGOFDRGaaRIYVSTDw87rfvTQBM1bkahZB7Ah/48SY5HGnHIN3amiKvc
	cIJoeWynIw1F7hmJWtXh2jKv2zAzk2UTuMG1QM0sPwy7tavSNOUwMCIiNH0qLyNIJiQT5F8fzCQ
	WXpMhvfNcWIjc0tRsy0pnOQ8eV5D2xlZeJE2q40ssd1/7g49K17ypyMs2o1ilYrrjKL39XXL1Zk
	JzHPVDEQuXRhDWyejwTxO9T+Q3TPvUqly0IOQnbKOr3qZ8b+gl7MGGZQjlhfXW5wFkq5qTH/z11
	ZZPfv2Ich9gUcN/wUx10CPnsw1HO0HzdYLJcHNBsS/bA7+M2YpknO5ue8qGVFUPEm5nZvjhayJH
	VJqH4ga0qdfNH57C6ACqhP4zITFg67oLEft+uehSKCj41QKIyqjUUAu9LeK/14mXh00+hkrn801
	/nxryCBFL3x+3fs753OsTtNeg46Kjwj8YDr/cwVliYdClNPNxUt4oPbRDJ3mj/y/kSlaoQL6VFd
	NZnOg47x3hyKVEEcC7hIOsro3MzOaZMK2ba4pOmDVn8kNE7QAGOwltM6AQN+xV9lYILt+5S429N
	LKUk2Tbl2aE0LJddIpKFJCQtNPgPx27md844FiG5PVlv35Oy0aggMfdxGMd/c/HsQK3Q28mwlgo
	Dl+9
X-Received: by 2002:a05:7301:b10:b0:369:ef92:bd7b with SMTP id 5a478bee46e88-37967be1271mr6009076eec.41.1794685061098;
        Sat, 14 Nov 2026 11:37:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm16855164eec.4.2026.11.14.11.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 11:37:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 04/13] wtmpdb: Fix build with lld
Date: Sat, 14 Nov 2026 11:37:24 -0800
Message-ID: <20261114193733.1743149-4-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
References: <20261114193733.1743149-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 19:37:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132261
Content-Type: text/plain; charset="utf-8"

The pam module version script lists pam_sm_chauthtok(), which
pam_wtmpdb does not implement, so lld fails with:

  error: version script assignment of 'global' to symbol 'pam_sm_chauthtok' failed: symbol not defined

Drop it from the version script.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...pam_sm_chauthtok-from-the-version-sc.patch | 28 +++++++++++++++++++
 .../recipes-extended/wtmpdb/wtmpdb_0.76.0.bb  |  4 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-pam_wtmpdb-Drop-pam_sm_chauthtok-from-the-version-sc.patch

diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-pam_wtmpdb-Drop-pam_sm_chauthtok-from-the-version-sc.patch b/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-pam_wtmpdb-Drop-pam_sm_chauthtok-from-the-version-sc.patch
new file mode 100644
index 0000000000..6593b8b0d9
--- /dev/null
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb/0001-pam_wtmpdb-Drop-pam_sm_chauthtok-from-the-version-sc.patch
@@ -0,0 +1,28 @@
+From 37f2e346c259e946258f95d89bf310fe463d2d92 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 9 Nov 2026 08:37:30 -0800
+Subject: [PATCH] pam_wtmpdb: Drop pam_sm_chauthtok from the version script
+
+pam_wtmpdb does not implement pam_sm_chauthtok(), so linkers that check
+the version script, like lld, fail with:
+
+  error: version script assignment of 'global' to symbol 'pam_sm_chauthtok' failed: symbol not defined
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ src/pam_wtmpdb.map | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/pam_wtmpdb.map b/src/pam_wtmpdb.map
+index 369b047..dcc94d8 100644
+--- a/src/pam_wtmpdb.map
++++ b/src/pam_wtmpdb.map
+@@ -2,7 +2,6 @@
+   global:
+     pam_sm_acct_mgmt;
+     pam_sm_authenticate;
+-    pam_sm_chauthtok;
+     pam_sm_close_session;
+     pam_sm_open_session;
+     pam_sm_setcred;
diff --git a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
index ebbfc7e994..392ec0a452 100644
--- a/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
+++ b/meta-oe/recipes-extended/wtmpdb/wtmpdb_0.76.0.bb
@@ -7,7 +7,9 @@ SECTION = "libs"
 
 SRCREV = "89c0861f74e576c5ad0ec9f5302aa635a4e50dc6"
 
-SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/thkukuk/wtmpdb.git;branch=main;protocol=https;tag=v${PV} \
+           file://0001-pam_wtmpdb-Drop-pam_sm_chauthtok-from-the-version-sc.patch \
+           "
 
 
 inherit meson pkgconfig systemd features_check
