Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2637AC5DF86
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 23:57:25 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2975.1787183843488944123
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 16:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nrUktvxi;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1067184a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 16:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787183843; x=1787788643; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8YFAgN+LHttu/iLs+2UDAhWh1vdrmdYnx7MIxiBWKtY=;
        b=nrUktvxi+/lfPKDjL2g3oQfNIxbEAJEp3dlHG4oRotjwij8CS0Yd2MEuVJll0VMyi7
         WIxXs9PSHGi2SQatclUsSLPmwvVicQ6opxO4/PqzO/Vv67wOBPGqGUxt4U29s3Do6tim
         uf4EKfVfHR8mfR3MrYe/K/Yt8i3Cl/5j697u19xSrUKLba5N5MfF1PVP/ILhJOAmIz0I
         dWYsGvyJcfObjkY1ogUNJfR4Abdk009JVQvZ7x6bOTs1TruYIYJeyf3+IwKp+NF9LFwa
         QYroMgQki8sBw8YqLtXGXw2RiDus2s5dywk0q09KEMex24JCQEMNTaxzi6Gng+BOPW6G
         tlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787183843; x=1787788643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8YFAgN+LHttu/iLs+2UDAhWh1vdrmdYnx7MIxiBWKtY=;
        b=CwvT2UAWoZiTaFFKdaxFDpPmUTzO8c3bp/BnVecQqIkcqzyB+vRuzDKStt9M2kCeO1
         9+c1kNcFjp26NZle78qBW8kAELlca1WuHCb+uH+4OHOfaQsAcwIc9cJsx7khcCXOr10I
         ixL5PuI4eY+BevssidivgKUQA/Rv2CXCL3KZaKt1qKFqAuDeC3tN9tUGKuS8NDshWFma
         Dw0SRnvJvBbyy9ggnPmTAP4oZ9zMTVpp4aafkBb8nheWqcgvd7/I/IU5WR0i3JZ+3cnB
         5WaCZCxUmWgncYFWPWTJiD2hxQDsyX3Cd+zSCW3/AVioGDz/fM/hd0x7cRFk7RAnd8m1
         UJ6A==
X-Gm-Message-State: AOJu0YzRwGkNwCOw8N6wH2+wQ9VqUsdwRXP9vJUFxDFitTvGXLSFzhhz
	QrprAlrHRRuorQGtWOM4EyQWRUyezRVO6I7CJSUn2SxQ6XFop1J23M0bIdEYmeA0
X-Gm-Gg: AR+sD12BmP7ynC1T+4hXebLYhlRV4nxNbFiIyHitW6Hf33Wpywkw24Kc9ovVldxPBvY
	uJmv/+1JhgEIE6LZBFxuc8vWcFT8UuwyvSZUhLriHKP31eOAH0bKWZLdCw8oj3sZ5Mreq+2PIRo
	lnsucf5PzUl5m0OSzxyx44+9DKcwfRYk5Z7zgjkEPlgBCldyZKzEZf6OnzwLLMRxIaycOaKOuhQ
	EtPezsKWDfwoQ90jVJQ+/Nfv9dhxCl1Xwu3kMfiZ+RoJ6VdGfu4nyFIFEzIzGbgcNDCyu6UGxaQ
	+7kYW6HgphMu4mROZmw6NAiK230sUJEImu/h2OQUc73pZVdsGlv9k5w6RIM0cvRH0/0eQYdYbmw
	JU5n3Ot+GRsz1h5DCL74fpaWO9xUWeDhRHDl71oLklV266lJevx+bLd4MY8445kPtELGOra4whw
	TmicLkZ/ql0xxqGjoPQdmocUl1ULHLL1EQOK7RObxGuk4HToYcAIulOjnJ7Vfib3zOABEk6Mrwx
	uTXWDtdhC6J6SeOcGQpDCISkDI3fL5nCel+46e44EXaVh2IRbMCUOtVoOsE1QXXLU5BvVj+nkeu
	USp79sKOce3Dxs4nm7ZdlnepE1Vti95hrfTBZVBR0GTIorjwKZ7n4rMKDMMSV9MVM3HbVyhkSV2
	w6DSUQ6yCe3HNAvRJtjTTNqoaO2Tb7XRAwWz8jYO1V4BdsQ==
X-Received: by 2002:a05:6a20:2443:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3cd010d6404mr14694523637.8.1787183842764;
        Wed, 19 Aug 2026 16:57:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf175399sm18411174eec.26.2026.08.19.16.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 16:57:22 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/3] python3-scapy: fix UnboundLocalError in interact()
Date: Wed, 19 Aug 2026 16:57:17 -0700
Message-ID: <20260819235718.3372843-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819235718.3372843-1-khem.raj@oss.qualcomm.com>
References: <20260819235718.3372843-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 23:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129369

From: Khem Raj <raj.khem@gmail.com>

The "Emulate interact()" UTScapy regression test failed:

    IPython requested but not found !
    Using the default Python shell: History is disabled.
    Traceback (most recent call last):
      File "/usr/lib/python3.14/site-packages/scapy/main.py", line 857, in interact
        banner += "\n"
    UnboundLocalError: cannot access local variable banner where it is
    not associated with a value

scapy.main.interact() only binds "banner" in the branches handling the
ipython, ptipython, ptpython and bpython shells. The test asks for
ipython, which is not in the image, so scapy falls back to the plain
Python shell and leaves "banner" unbound while still running the
unconditional "banner += \n" for the caller-supplied mybanner.

The test is correct and the bug is in scapy, which still has it in
master, so carry a patch initializing banner from banner_text before the
shell-specific chain.

meta-networking-image-ptest-python3-scapy now reports PASSED=319
FAILED=0, up from PASSED=318 FAILED=1.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-banner-for-the-default-Python-shell.patch | 44 +++++++++++++++++++
 .../python/python3-scapy_2.7.0.bb             |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-networking/recipes-devtools/python/python3-scapy/0002-main-initialize-banner-for-the-default-Python-shell.patch

diff --git a/meta-networking/recipes-devtools/python/python3-scapy/0002-main-initialize-banner-for-the-default-Python-shell.patch b/meta-networking/recipes-devtools/python/python3-scapy/0002-main-initialize-banner-for-the-default-Python-shell.patch
new file mode 100644
index 0000000000..7de0800c31
--- /dev/null
+++ b/meta-networking/recipes-devtools/python/python3-scapy/0002-main-initialize-banner-for-the-default-Python-shell.patch
@@ -0,0 +1,44 @@
+From 3d1f9f8043e239d6313d9b9c02a9d6ead6c32302 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 20 Aug 2026 00:14:29 +0200
+Subject: [PATCH] main: initialize banner for the default Python shell
+
+interact() only assigns the local variable "banner" in the branches that
+handle the ipython, ptipython, ptpython and bpython shells. The plain
+Python shell leaves it unbound, so the unconditional
+
+    banner += "\n"
+
+in the "if mybanner is not None:" block raises
+
+    UnboundLocalError: cannot access local variable 'banner' where it is
+    not associated with a value
+
+This is easy to hit: requesting an interpreter that is not installed
+(e.g. conf.interactive_shell = "ipython" without IPython) falls back to
+conf.interactive_shell = "python", and any caller passing mybanner then
+crashes instead of getting a shell. The mybanneronly path happens to be
+safe only because it assigns banner = "" first.
+
+Initialize banner from banner_text before the shell-specific chain so it
+is always bound.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scapy/main.py | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/scapy/main.py b/scapy/main.py
+index 990f27f..924e6dc 100644
+--- a/scapy/main.py
++++ b/scapy/main.py
+@@ -828,6 +828,7 @@ def interact(mydict=None,
+         # repl.use_ui_colorscheme("scapy")
+
+     # Extend banner text
++    banner = banner_text
+     if conf.interactive_shell in ["ipython", "ptipython"]:
+         import IPython
+         if conf.interactive_shell == "ptipython":
diff --git a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
index c21d2eb0e3..35a4c6fc36 100644
--- a/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
+++ b/meta-networking/recipes-devtools/python/python3-scapy_2.7.0.bb
@@ -19,6 +19,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRCREV = "1de09fe85fe5c9d60ea5c6de130374e170b5bc28"
 SRC_URI = "git://github.com/secdev/scapy.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-python3-scapy-skip-ICMP-regression-tests-in-ptest.patch \
+           file://0002-main-initialize-banner-for-the-default-Python-shell.patch \
            file://run-ptest"

 UPSTREAM_CHECK_COMMITS = "1"

