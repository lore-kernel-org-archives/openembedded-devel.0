Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id B8A5460B58
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 22:48:04 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z12so4669079pgl.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Feb 2020 14:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=52h9kKMM/cfD30twC9ZxZzvTgHeJdPFcGhUWf23cYCE=;
	b=in5ALrGy9C7VGIQoGpcPKnyAB/S0d620xpoW5B1utTnbko+zMmY6iEgLIdavCgw4Ug
	9wuYxL+Vl+sLJaY159OzNvQvvH6cJsZVA2UQCPjQ9IWUW0Kb4rRXa48vhp3R6SIgrzz8
	TmQhDql7lSZbdbPQfrqrybqM4fYAaKhRpejS5Hr/cp56Dfcy4UxZjejsc3IArWzlQ3dh
	SrVJf4SYPXE7GESkvhInHOyl7tN7WRHhD6eheu+KxqLfBhT1Uog8PK1XvOlNQAdIEIF0
	4xiHINbRaUVwyueIedtTtV84dlnW2ecd40I4iicBnyIGAKfkuwkaDq1PHbbXz+cVidcx
	U02Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=52h9kKMM/cfD30twC9ZxZzvTgHeJdPFcGhUWf23cYCE=;
	b=lgUK4FGPDe2HvZkOXZ8IZSg0Y0MadgfV61Dk4J7ir5DysjL2AmzzwP6t8z2MlOtB8P
	0pAtAXYzNAwTXe8ftXvC20vOt7clYPW+YaviMbahbfJPBuptUfgjBKQeFu8p9sbpTScY
	CefepJWIIpSIxJJ1sXPb8Dz9tFnFVT0sYOe+u6z5GhoSIqTVnogJAXh4BzNbkZTwZXAN
	Q3a5JMXCVMmwgM6RhPxCgVL0Pt3GX2vsd2P6tDjcud2FNwmR1OYk/pfzPi4O5Gvf/IBH
	pWuOM1skOkckCB2v4RR5EIrG5TdfNp1Bu+FWFRQsZJvhFZA37WLncWz3sGuXivyOupps
	P51w==
X-Gm-Message-State: APjAAAUaYuvX59cLRAM5Nqzt9CJSvnEdki+eVc8vGLyGasa4qkN+40Ie
	wGPRpRyWYPsSU0PvdPO4SESCH+5vX5A=
X-Google-Smtp-Source: APXvYqwGW01+VMKYFcgS6H46hqYLy2JB+I/p2YY0to01vQmZoM39kSitTRsRP0jgyli00JGn9hS1+Q==
X-Received: by 2002:a62:3892:: with SMTP id f140mr3238589pfa.190.1581374885263;
	Mon, 10 Feb 2020 14:48:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id 26sm450799pjk.3.2020.02.10.14.48.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 10 Feb 2020 14:48:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Feb 2020 14:48:06 -0800
Message-Id: <20200210224806.3303847-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: Fix gold linker detection with py3
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
X-List-Received-Date: Mon, 10 Feb 2020 22:48:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../mozjs/mozjs/python3_string_encoding.patch | 20 +++++++++++++++++++
 .../recipes-extended/mozjs/mozjs_60.9.0.bb    |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding.patch b/meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding.patch
new file mode 100644
index 0000000000..97eb012e83
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/python3_string_encoding.patch
@@ -0,0 +1,20 @@
+Fixes python3 erros like below
+
+AttributeError: 'bytes' object has no attribute 'encode'
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: firefox-60.9.0/build/moz.configure/toolchain.configure
+===================================================================
+--- firefox-60.9.0.orig/build/moz.configure/toolchain.configure
++++ firefox-60.9.0/build/moz.configure/toolchain.configure
+@@ -1518,7 +1518,7 @@ def enable_gnu_linker(enable_gold_option
+         if not gold:
+             return
+ 
+-        goldFullPath = find_program(gold)
++        goldFullPath = find_program(gold.decode())
+         if goldFullPath is None:
+             return
+ 
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
index 9466c62aac..b7731c7a2a 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0012-JS_PUBLIC_API.patch \
     file://0013-riscv-Disable-atomic-operations.patch \
     file://0014-fallback-to-2011-C++-standard.patch \
+    file://python3_string_encoding.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-support-musl.patch \
-- 
2.25.0


