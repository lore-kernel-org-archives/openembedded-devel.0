Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33A2C61DCB
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 00:11:33 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.254.1787962283845128700
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Aug 2026 17:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dVYzzBvA;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c8d4a959so1249777a12.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Aug 2026 17:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787962283; x=1788567083; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4wRwvjI6nsnY1tJrXquoDWNoHgjCRhFpT9z6cRpzmU=;
        b=dVYzzBvAmFtp2PKHjYLFcLu2q/GpX5TT0KzVeV1zJETvN+INdZCiaPn6YKOc9mwitb
         arZncsmD3KKjFEZM0MuMaQ8Un9euQriHGJW4RN14WLy5+0fSyAdhYIRWBta3rM9UVrBv
         VDpaZ79YCEn8WwaY1grBz49asp9LEdO1y8PjVrTQhpUEYc4owyaCl8/J/3gGX3O1Xf8N
         QpOnNRrRlIFJxRNpKPX9QrmpFezz8pv4jqbGvN81S1xZrUp6RaopbpCFjzq/Rf6qexh6
         wdpMH76qnDTLljiEBqTbnGcgcAjiuv76JacI963UdTlkiZHX+Jd93OqqIXUfOTXyZKFy
         FUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787962283; x=1788567083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/4wRwvjI6nsnY1tJrXquoDWNoHgjCRhFpT9z6cRpzmU=;
        b=BrFTD1YtK8J71DTlQWeQ8fjnzO+zt/9Nr3UMUEKyHKAGXVUTUJ6i8ih6sr/oQhtxCK
         iV9nyuiYitrkb2G+g2mxeGMMaoInTpXuBexD4a9lJsBeDG5k2oZvsh8roCqS/Z0isx+8
         +sup/JPPHaiEEbA0cO6xldyjVzEA3JOtfYx5sfeVNBZxc+tLpTq1TM0sVSwh7FLHrrDu
         ubgwTBvVEj2WWipGQlNcUS//TOHbgdQVMLnw8uBONFWudITw5H3nRR+m2NQ5mmB/AA/K
         8rU/de2tZUFfwXjwoT01dJ81GpuD+ZNtlWZcHI2PXJd+/edDfxLeH7fPRauJKKlPqnDg
         0lpA==
X-Gm-Message-State: AFuF++mL2iYoMrSYmffKT1+nYh5iX301IYjMza9bNyNKwF+//BqEusQN
	l5ZGDPQRHjtgmOBN2vPNU1SrIsegLXpqEgta2zCeBmWPS6r2G5fCChoOYxdVR1lU
X-Gm-Gg: AYBFou2s7mtb4A3lAdFOOuUI/h7nceMmBdDVgYsd2MWf9sZvm8hXVFCUAxx2WRAMu1r
	l1vSdadjyOxN/9qC52J6uYU1oOc2ZavQaiEiT7IyxcpCEp/jusp75QDF//4hHmntz+WIRK2yDBs
	+ldpbe2Tpg97QRLDrzqjBSy6EZT43BhpxfX6XtC4P6FslgOV5qlodU80QTBrfO2rquPBRnrzvC4
	PExGsIkh1rcMlJxvu4jwO3saIc3ZgrZZFoL2cuH2Mg1I/Lf+g5Q86HaognqwRBbAtFDVEUtmt8h
	l1246nw7xAmw+h4LePLjImOoemdnUDlEMx/A2IWRE2LFQ1zVgwfd8lJH/V3hAxSLlFeydUDBv2P
	eDq/yTxR6CaengqrbhWfykHsQ2zoPaQIYKv5q3+zuuoaKglv1fvWrU3M6WUNjlZufgMv5NCBrJ5
	aWT1bFqAP52xxab3xECyFB7dkKasTU2M+wOEQsOBIr7P1scX0IM2XVW93gATV4+8kzSljVysLcO
	OD6d8RJ+sYb8Y8hZp1MZ6toUdh52do9l5MX0UEut69Bsu9+PNKn3PhDVmPggMOlWR0K6D11Z4kL
	DhZk2s/Rtdqb9Co6Xop6qPtc6JExkMYC1uewaY0dy/qPlTz9BJ5JUV1LnKHWJswPtw4UWEq/DvX
	W9slUO9YdODMdrfLEZ7iTFu2Ss2E728SZYkCG6MdXv7TI1Q==
X-Received: by 2002:a17:90b:5626:b0:398:9bd1:3216 with SMTP id 98e67ed59e1d1-3989bd135fcmr5255257a91.23.1787962283098;
        Fri, 28 Aug 2026 17:11:23 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d38207sm9236668c88.5.2026.08.28.17.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:11:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 10/16] python3-typer: fix ptest rich text-wrapping and subprocess PYTHONPATH
Date: Fri, 28 Aug 2026 17:11:01 -0700
Message-ID: <20260829001108.559544-10-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
References: <20260829001108.559544-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Aug 2026 00:11:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129569

From: Khem Raj <raj.khem@gmail.com>

Force a wide console (COLUMNS=200) so rich does not wrap/truncate the
error-panel text. Several tests assert on trailing substrings ("is a
file", "is a directory", "unknown error") of long error messages
that get word-wrapped - and thus split - inside an 80-column rich
panel when stdout is not a tty (as in the ptest QEMU environment). A
wide terminal keeps the message on one line.

test_binary_stderr spawns a fresh interpreter to run the test file as
a script; the file does "from tests.utils import ...", so the ptest
root (the parent of tests/) must be importable in that subprocess -
export it via PYTHONPATH.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-typer/run-ptest  | 12 ++++++++++++
 .../recipes-devtools/python/python3-typer_0.27.1.bb  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-typer/run-ptest b/meta-python/recipes-devtools/python/python3-typer/run-ptest
index 526825aadf..c1472b4914 100644
--- a/meta-python/recipes-devtools/python/python3-typer/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-typer/run-ptest
@@ -1,5 +1,17 @@
 #!/bin/sh
 
+# Force a wide console so rich does not wrap/truncate the error-panel text.
+# Several tests assert on trailing substrings ("is a file", "is a directory",
+# "unknown error") of long error messages that get word-wrapped - and thus
+# split - inside an 80-column rich panel when stdout is not a tty (as in the
+# ptest QEMU environment). A wide terminal keeps the message on one line.
+export COLUMNS=200
+
+# test_binary_stderr spawns a fresh interpreter to run this test file as a
+# script; the file does "from tests.utils import ...", so the ptest root (the
+# parent of tests/) must be importable in that subprocess.
+export PYTHONPATH="$(pwd)${PYTHONPATH:+:$PYTHONPATH}"
+
 # Ignore the test_tutorial and test_completion.
 # Because it needs the docs_src package what is not in Yocto.
 # And the tests are not that useful for Yocto.
diff --git a/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb b/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
index 12c7bc7f61..3246de7472 100644
--- a/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typer_0.27.1.bb
@@ -46,4 +46,6 @@ RDEPENDS:${PN}-ptest += "\
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests
     cp -rf ${S}/tests/* ${D}${PTEST_PATH}/tests/
+    # references the unshipped top-level 'scripts' package used by typer's release tooling
+    rm -f ${D}${PTEST_PATH}/tests/test_prepare_release.py
 }

