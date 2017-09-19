Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFB9F77ECB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 16:32:05 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id j16so85424pga.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Sep 2017 09:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aQVWN4/4mZ+nOEnQDeaU0sFdoXlVGpsbmNU4aTzWqqM=;
	b=abF9a9NaElX9uE/GUZfuH3ha4s7PXvkH5sxaSy58FUsr1aSm4xXUetS1lSyp9QFBuW
	UD4gBY93NUffQaSnhKgSKM9xhE3YjuRn+s5p39oM2HqhLTbPsmAp4zG3KYhHwSFPEm/5
	viOZQFLwA1zjHxuTlH1PkAbZsSY4TfT3OYCEEfDtSYC31DWspFIMn/Onfms5UVQygU71
	2caHXCpn2Tjzjgi1rOFU2Wkb5b0t4E0U3CTYc6mt5tD/Pe+4u6R7q52wYhishNSQXcgg
	3MFE3k1cNZFvyjdLlaOfBMimZ46U7EAGnjYQHgPgBuKcDDjoBeG5qn1izto5pWMJDhJy
	om1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aQVWN4/4mZ+nOEnQDeaU0sFdoXlVGpsbmNU4aTzWqqM=;
	b=KLuc4Pav0hGinmV7Mtcu8ceOOFCOldiPPaC5zJF4k4KMxvgwP2FKraKaNuACNhye7/
	+ks4fPR4VuAqMTwA47R+fPCcNA7/ya1HMvakdsPP8uymXghYCEvFvwoIaocIfSeYiiAv
	WqE5hRMCk4LiEY4rlB8Idj52DaPGqd1aEdy82qS3K+VDE5SKAMo9lOsWt0AwsFhDs6p9
	P96s0MyhVQHmd0VC0nMbWRPERVODQEu1DYj/Iiqz3ZE99HhdFnadd0winP7Dza5ryZiR
	tBT+1TiwTKhRx3vBk8QGhxoKRj4oSbW9AtcHmgKHb31Jgh5WtJs/p3o959wOov/+lo4/
	I0dQ==
X-Gm-Message-State: AHPjjUjlkbrYtD/6JgiVd2x66WOufuYhtX3C1I57zknkFxIPpNuzcjXS
	0IDTuLRUQeLPuu/cYhUZ9Eb57w==
X-Google-Smtp-Source: AOwi7QD3vdGTn5WQV8tiOcGqeU6i7ZKMFYpjzXEDaEbqnmQMYe4ZAcdKWIbHtPaR9QgUFm/y+CwRFg==
X-Received: by 10.84.129.193 with SMTP id b59mr1850431plb.30.1505838726284;
	Tue, 19 Sep 2017 09:32:06 -0700 (PDT)
Received: from localhost.localdomain (c-73-158-54-208.hsd1.ca.comcast.net.
	[73.158.54.208]) by smtp.gmail.com with ESMTPSA id
	c30sm4257354pgn.33.2017.09.19.09.32.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Sep 2017 09:32:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Sep 2017 09:31:57 -0700
Message-Id: <20170919163158.38598-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] ltrace: Fix build with musl/mips
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
X-List-Received-Date: Tue, 19 Sep 2017 16:32:06 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-mips-plt.c-Delete-include-error.h.patch   | 27 ++++++++++++++++++++++
 meta-oe/recipes-devtools/ltrace/ltrace_git.bb      |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch

diff --git a/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch b/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch
new file mode 100644
index 000000000..76ba7de78
--- /dev/null
+++ b/meta-oe/recipes-devtools/ltrace/ltrace/0001-mips-plt.c-Delete-include-error.h.patch
@@ -0,0 +1,27 @@
+From 19a3e590c97420bd3952301bf376067c75d0ee32 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 18 Sep 2017 23:45:54 -0700
+Subject: [PATCH] mips/plt.c: Delete include error.h
+
+Its not needed
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ sysdeps/linux-gnu/mips/plt.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/sysdeps/linux-gnu/mips/plt.c b/sysdeps/linux-gnu/mips/plt.c
+index 2d85ad9..9c3ae2f 100644
+--- a/sysdeps/linux-gnu/mips/plt.c
++++ b/sysdeps/linux-gnu/mips/plt.c
+@@ -24,7 +24,6 @@
+ 
+ #include <sys/ptrace.h>
+ #include <errno.h>
+-#include <error.h>
+ #include <gelf.h>
+ #include <inttypes.h>
+ #include <string.h>
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
index 01b3bbe1b..abe015de2 100644
--- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
+++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
@@ -24,6 +24,7 @@ SRC_URI = "git://anonscm.debian.org/collab-maint/ltrace.git;branch=master \
            file://0001-Fix-tautological-compare-warning.patch \
            file://0001-Add-support-for-mips64-n32-n64.patch \
            file://0001-configure-Recognise-linux-musl-as-a-host-OS.patch \
+           file://0001-mips-plt.c-Delete-include-error.h.patch \
            "
 S = "${WORKDIR}/git"
 
-- 
2.14.1


