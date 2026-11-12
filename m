Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1583.1794503618715783275
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 09:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=gCgHaf0O;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so240883eec.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 09:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794503618; x=1795108418; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJiqP/Edj6kZ1aL+hqTtwh2WSl5ZJCxo/mbxnecY+gs=;
        b=gCgHaf0OkwEbCJPceRQh6dOHkyLf3u8QXPeuh5f1n2427CTdP53R1c2sK1u0Qe/MA+
         EjahSjo1E0XHwAulVCuMnvuwcvA4+tZmPRYGyGvhX2RAfMKyzRPHXq7Wpj6i40qRQE/E
         CqAENZ9bikTZyA1BUIUIJqwbzuCccBp/Q/JLp/YNJmeh/NDRHNk9NamM0TuirA7nwzFr
         iqnw59Ee9P5qbc+l4vhGuPVPljUQ02CFymTOQOpej3P0D/74sa8/LYejpTJwOqxpUjGO
         +DRx+u0z62mk6crzYi/NDW/6P96bRPJznhbSV8z6HDaDz84baqQrBpZPX3zuZd3v0FYi
         Enjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503618; x=1795108418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJiqP/Edj6kZ1aL+hqTtwh2WSl5ZJCxo/mbxnecY+gs=;
        b=qCOWXYMKPSvz3MNfMFQgDnA5nsgycCOpKSygStFalRXIhe1mfKm9ycMOZwO+YsC3km
         TPjARc5RmPy5nBuFjWY67SzR3oCBoDq2Csiw6z3Qicnb1qGAE3sikEjsRyIHbuXygVHc
         Eqy7NvIX6h2n5rBR/E2D4uMjHQ7aqlTSp18+DTmOVSyUq0EEUMF2UKSS1fPnIuds0tno
         HAu+R8AMdZbAANk5tWVIKbpyypP2WRSyxoeeOyWTXWiLJjOxddCmky4+2A8Kb7RLRfrn
         5YxGyPC+XTBc8UwgjRlFFv7hCoA9rupCEeBpHUD2z/I/zXMzhblawEf6YmRvjiiJDNny
         z7aA==
X-Gm-Message-State: APuU4Z/x9GXLYssoNiM+w2f1Ggzm+FuAcBxE2/g/z3kx2DJUmXhazlvq
	ZOl2gprpUED0lYowkzynlRUim6Ew8eR+wOtHBNV6+LTPrsVIXdLcc0+aWDcu4H8ctzk=
X-Gm-Gg: AYBFou0i9DeMoUMOypUx0z5E3dVRk9PJyPhqTRBh0NVu6OCUcfqpGDiDuKJHTU3pqjK
	FpDGNW29paZgo7DPSMm9a5X8R165kesTrYfaiKKVrooVbRjo/iWORhEgaYEjaIwZUgP7j/inMBD
	rS6flGqfqPbBVyWR8NalKlrZzUOrEPzX3a8tNGHE6PYOOwWmbOIeoN0M8c9uyu1WLGIP+8AzOq/
	QVk/a1Xuvkrc3bAZIgVNE5nmJFF32cztAl7C6qmziDSzGokbmpyvu2SG/iAZxqjTsjK9PICM1eB
	6xypCtTHGvtO21mP8R+SOMHkV5FSi38N5Uq3S8wufHFioCCHcOVBaGPHJzglm63Sufp0VBDOZE+
	vqtbrvT6Iepa/t+af8ZFQ87rXd7+YIPEqyJ71inv2m/PITqQOdtbKIZo2eLMNjIaPOy9iv8SEDL
	XiqOVqmGsIEmr2lL2pvT18fuGpdaya9jEaztfOrLGsmfzmDR1yDwgKVZY38fVSQDRXAsNhNVcMv
	fcClBcd/s4I7lb3ome3b5+uI44Wat5MGNtfJQfYr42Guk+yeS5CdbRej6vcOkALHUN6TcF1q+7Q
	UCczsD/PyASn8hQOgwAZN0r9eF9ftaWa228pE0QSqB567nngeVyJ3YbeoUrPh4pi+EaeLBE8d1s
	yzaEko+U1X44y2meFV5bC65QqO6QW3T1GMyzrgbgnYDqnIr26E+aXF/fBgmufZMcgQDxwIZnTvT
	iqHJBwZBxiWd0QP4mAXBOpY/DrAiD4F8hXqWRNnm4Sv14zT44Jle0aZr3+bpfa+WILZxtSvGTmH
	Ulho8Onc5LmojOlYYU3RCBrGsa9QP3/oBk0PaFMEHUEaZsVm15oxybRRWQ27SocwuX3wR+PpZJF
	GXse
X-Received: by 2002:a05:7301:4703:b0:370:1652:5ff4 with SMTP id 5a478bee46e88-376851ce2bdmr6239719eec.6.1794503617735;
        Thu, 12 Nov 2026 09:13:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37922f3767bsm934490eec.3.2026.11.12.09.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:13:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] apitrace: Do not export _init and _fini from wrappers
Date: Thu, 12 Nov 2026 09:13:32 -0800
Message-ID: <20261112171332.513897-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 17:13:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132210
Content-Type: text/plain; charset="utf-8"

The wrapper version scripts name _init and _fini, which riscv64 glibc does
not define, so linking egltrace.so with lld fails:

  ld.lld: error: version script assignment of 'global' to symbol '_init' failed: symbol not defined

Drop them from the version scripts; the loader uses DT_INIT/DT_FINI and
nothing looks them up by name.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...appers-Do-not-export-_init-and-_fini.patch | 46 +++++++++++++++++++
 .../apitrace/apitrace_14.0.bb                 |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/apitrace/apitrace/0002-wrappers-Do-not-export-_init-and-_fini.patch

diff --git a/meta-oe/recipes-devtools/apitrace/apitrace/0002-wrappers-Do-not-export-_init-and-_fini.patch b/meta-oe/recipes-devtools/apitrace/apitrace/0002-wrappers-Do-not-export-_init-and-_fini.patch
new file mode 100644
index 0000000000..1d1d812974
--- /dev/null
+++ b/meta-oe/recipes-devtools/apitrace/apitrace/0002-wrappers-Do-not-export-_init-and-_fini.patch
@@ -0,0 +1,46 @@
+From 4661c86d9a64bf4057bc80fc9e6a4aed83754b5e Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 11 Nov 2026 11:41:05 -0800
+Subject: [PATCH] wrappers: Do not export _init and _fini
+
+_init and _fini come from crti.o on some architectures. The dynamic loader
+finds them through DT_INIT/DT_FINI, not by symbol lookup, so there is no
+reason to export them from the wrappers.
+
+On architectures without crti.o _init/_fini, e.g. riscv64, they are not
+defined at all, and lld, which defaults to --no-undefined-version, fails:
+
+  ld.lld: error: version script assignment of 'global' to symbol '_init' failed: symbol not defined
+  ld.lld: error: version script assignment of 'global' to symbol '_fini' failed: symbol not defined
+
+Upstream-Status: Submitted [https://github.com/apitrace/apitrace/pull/1004]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wrappers/egltrace.version | 2 --
+ wrappers/glxtrace.version | 2 --
+ 2 files changed, 4 deletions(-)
+
+diff --git a/wrappers/egltrace.version b/wrappers/egltrace.version
+index 0e7e62b..f4154be 100644
+--- a/wrappers/egltrace.version
++++ b/wrappers/egltrace.version
+@@ -1,7 +1,5 @@
+ {
+     global:
+-        _init;
+-        _fini;
+         egl[A-Z]*;
+         gl[A-Z]*;
+         dlopen;
+diff --git a/wrappers/glxtrace.version b/wrappers/glxtrace.version
+index 0546a05..68cd8d1 100644
+--- a/wrappers/glxtrace.version
++++ b/wrappers/glxtrace.version
+@@ -1,7 +1,5 @@
+ {
+     global:
+-        _init;
+-        _fini;
+         gl[A-Z]*;
+         dlopen;
+ 	_exit;
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
index cb5ee92e04..729c8be91d 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_14.0.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=aeb969185a143c3c25130bc2c3ef9a50 \
 SRCREV = "18cfd388ac47a9e00978b34d6c20341f3e2cdb56"
 SRC_URI = "gitsm://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=${PV} \
            file://0001-zstd-disable-the-x86-64-BMI2-assembly-fast-loops.patch \
+           file://0002-wrappers-Do-not-export-_init-and-_fini.patch \
            "

 DEPENDS += "zlib libpng python3-native"
