Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8F7C43638
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:48 +0000 (UTC)
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14759.1782634367237659402
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZVCWprp7;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30b6dad2382so4557831eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634367; x=1783239167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cg+u7toqNUJRVcG+LOj1Ilh8RJ9OIcaEP4zcoMBGclg=;
        b=ZVCWprp73ov4CBA++mL0DAsgMZ4KbiH95unkxnDytxzstTRsLsydMHq/D1HxW6ompu
         +zXDK01Nfr5j1CaXnKG+YJEHlOkc1gVfSxJgCtXkhaAFdnKFZs8vdTp1bL6rYpip7RnA
         L8Frn4C9Lm0IyR0QG2bgyb9O94csqlJPac1p18X85dP4QiRqAWiLlV8AhTD2fUyXeN2m
         kuxQAzfx6I0jqbbauPBXalH2ixNewMptmDXbnR3TiVL5uXCo32+thjliHq9SDXAwNeGy
         gwRxxP/3/KEa46g29IMZjkl8GNBv0eflkIduwskjebqguzBqe116u/apFZWSYZcc/UEv
         gPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634367; x=1783239167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cg+u7toqNUJRVcG+LOj1Ilh8RJ9OIcaEP4zcoMBGclg=;
        b=Q4UbDDn81pjnblVCEPOkmVNIDSdIr2mJyuiwk1o7pInFmWnzBLn1hafoO8nKW1qUPO
         +B2tYNNDRbLbQtKxSN1kZL08WOvUiGd1Q68HNIJZPMoYy+rejO6vxRMqo9H/xPrXS/d2
         1u9ldc4ojhqdvWKp96PPEJ9Sls9w30nbKsULyOG7CJ5nNA6ohM3YXJQnrWt0TR/QPLOg
         9b8jhCHJaUBLdQCu3/GwxQMlYMskUnm2D2oQoiONTfUr6UweqOuWrNlqRTJcexU78BgM
         8UpvIiTQnQ2yxhrXd6wHW0ZLgcRWpqhz0zpTaT5kfTGqqxwIw5Yx4eaZC62XuqgIjOjC
         WlEA==
X-Gm-Message-State: AOJu0YxP8eXgwxxUNx1BC/eNYsTy92WlDeXzEIjgO2aKKJFWmhCm8HTF
	9IdU2i9aCvK60ZomIAPGQfVs0J26I5DqCE/P1knswwuIO7nqDNfjw6CbPgO8fshF4l1t3w==
X-Gm-Gg: AfdE7cnUzlUaw05sdLMqfJh93Qn1JXjwt/X2oM2dDzhYTb5soL1ugHZabWjs5j+c0YD
	2RIdccwoSlsXYRydN69A22Cmo3J3G9agyeAWePJxAr6a9tILdDzuniA1IvOrkAldf4PgmN9kfwH
	bkaW+9i3SPLyHzkHcKwazXSEk1tow+UTACnhp/IQQyv262nZWSqi6jMDxN4sTlOLnT0kIy4gCEQ
	ZazxEQBnZc58SciC7FAu+cRiqEtRdNNIyBISqv3ukOOn0fZ8JdgyRA6R7mM7H4iPU5k6TL7b/Vi
	vI1eROeM82yxhx8zKLew5ljRsI82d4OIu3NSvdasIG00ZQCmQFtRNYXgQthddRRKPUrGGVHFtF8
	Zw2Iwe8tqo5n232bUGgsrfVYxPRUp68utxtBsxp318nkJ304dkJXgGOpH842RqZNJaWBoeiR1Nw
	6FjjCj3sxfLXhhy6ik5F4g2BJZTznVHAjp5ocpzCtFvaqYXTTKhjgT+3KbZmWFOI/ir+8aruFtG
	XNMKtWYKgy/hCBr3bGxon93XV1xjW/oNbdFYAQMk4H3bDTX68cy5KsLueasyhveGEMSd10lF+S/
	zfjxVd6meUjgnmDHjEmWeUANJ1AL2A==
X-Received: by 2002:a05:693c:41c9:10b0:30c:aeeb:ed5d with SMTP id 5a478bee46e88-30caefb39fdmr3767964eec.15.1782634366513;
        Sun, 28 Jun 2026 01:12:46 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 088/128] flashrom: upgrade 1.6.0 -> 1.7.0
Date: Sun, 28 Jun 2026 01:10:39 -0700
Message-ID: <20260628081122.178348-88-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127898

License-Update: COPYING renamed to COPYING.rst; GPL-2.0-or-later unchanged

COPYING was renamed to COPYING.rst upstream; update LIC_FILES_CHKSUM.
Add a patch initializing time_start/time_end, which clang flags as
used-uninitialized.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...assic-Initialize-time_start-time_end.patch | 34 +++++++++++++++++++
 .../{flashrom_1.6.0.bb => flashrom_1.7.0.bb}  |  5 +--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch
 rename meta-oe/recipes-bsp/flashrom/{flashrom_1.6.0.bb => flashrom_1.7.0.bb} (73%)

diff --git a/meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch b/meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch
new file mode 100644
index 0000000000..34539ada96
--- /dev/null
+++ b/meta-oe/recipes-bsp/flashrom/flashrom/0003-cli_classic-Initialize-time_start-time_end.patch
@@ -0,0 +1,34 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Jun 2026 00:00:00 +0000
+Subject: [PATCH] cli_classic: Initialize time_start/time_end
+
+clang's -Wsometimes-uninitialized (promoted to an error via -Werror)
+flags that time_start may be used uninitialized at the function's "out:"
+label. Several early "goto out" paths execute before time(&time_start)
+runs, and the cleanup code calls difftime(time_end, time_start)
+unconditionally. Initialize both time_t variables at declaration so the
+value passed to difftime is always well defined.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cli_classic.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cli_classic.c b/cli_classic.c
+index 1234567..89abcde 100644
+--- a/cli_classic.c
++++ b/cli_classic.c
+@@ -1055,7 +1055,7 @@ int main(int argc, char *argv[])
+ 	int ret = 0;
+ 	int all_matched_count = 0;
+ 	const char **all_matched_names = NULL;
+-	time_t time_start, time_end;
++	time_t time_start = 0, time_end = 0;
+
+ 	struct flashctx *context = NULL; /* holds the active detected chip and other info */
+ 	ret = flashrom_create_context(&context);
+--
+2.43.0
diff --git a/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb b/meta-oe/recipes-bsp/flashrom/flashrom_1.7.0.bb
similarity index 73%
rename from meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
rename to meta-oe/recipes-bsp/flashrom/flashrom_1.7.0.bb
index 2125f19dfe..bc9645f97a 100644
--- a/meta-oe/recipes-bsp/flashrom/flashrom_1.6.0.bb
+++ b/meta-oe/recipes-bsp/flashrom/flashrom_1.7.0.bb
@@ -2,12 +2,13 @@ DESCRIPTION = "flashrom is a utility for identifying, reading, writing, verifyin
 LICENSE = "GPL-2.0-or-later"
 HOMEPAGE = "http://flashrom.org"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+LIC_FILES_CHKSUM = "file://COPYING.rst;md5=c0d58714ca15beeaed5b44a38116e133"
 SRC_URI = "https://download.flashrom.org/releases/flashrom-v${PV}.tar.xz \
            file://0002-meson-Add-options-pciutils-ftdi-usb.patch \
+           file://0003-cli_classic-Initialize-time_start-time_end.patch \
            "
 
-SRC_URI[sha256sum] = "8b9db3987df9b5fc81e70189d017905dd5f6be1e1410347f22687ab6d4c94423"
+SRC_URI[sha256sum] = "4328ace9833f7efe7c334bdd73482cde8286819826cc00149e83fba96bf3ab4f"
 
 S = "${UNPACKDIR}/flashrom-v${PV}"
 

