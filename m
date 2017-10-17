Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD57780C0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2017 04:26:48 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id a192so449011pge.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Oct 2017 21:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=4GWSdtoUggrKdH3wGAIpLeBAo3YcWP4bd0JQGRhNNlY=;
	b=Rv4TaHUqNFsjQjwXTdpI9EXfvhv6J2QBAPqdkPzEs+mmcCQQkY/TbwNb7VlGREwS11
	QAOEqG2clmb3uPy40oVFl2CtFeSuHFnZ0srQAEIY6SG1l7X7U+//Wh9/iD1XwfWqeQaL
	NeCSNYJGWopqBpqMJ0RGvDLrYS6TCV7drLhwYRA7tPpr8OBVc9GBuU7h1jBO6BmPTG8p
	hNL8nF6sRtWWoh6Krj6dNkaPCrEJ2yrzykWiSDQXi97uNnYOhOb4WA+rnBJguNvMJo/X
	+eKaduOWOooaMjXSkjz1XIa48kyvv4DJ1pnMEy5I9JIDcs1VmUYgO08/sJJ6aiBg9wMo
	Fyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4GWSdtoUggrKdH3wGAIpLeBAo3YcWP4bd0JQGRhNNlY=;
	b=jEIwkRQ6teRn36f4NJnTr9k+X0HzAFZGhcM5OwKE/xt/gA/mfXFUD9UhLfeXDn9xGk
	g8GnPEVkAGQHiX1hLnY62NpjwotKBioab2NmPWhotwD9Wo75xk5USZLQhz7MhK1qipIu
	ph8Lg7ilhrwRfLQBIbiQEjfHxUGdpp8ygW+cxkklCQcanOCWUrNOAO6jeTXkAoZzPewx
	eNhvHTGWsT0xfxPOpZElwFZtCiuVANAfTq1xYliCLmQTIzfH5CFcbjZR3uGp1KXyjWpy
	tOPHtOFR7yoIwptFajRDpcmDMhdQrq4CNIXvcxtPj8nENy4/BhKdUsxrZSVJ/lYcHgph
	uDmA==
X-Gm-Message-State: AMCzsaXz0Q2e3u2x+7WKQqN/BfYiAV5WAIetcSek8lR0ZVi+sL/Ry+Jq
	HdEog7JusFkz90A+zbzoHA/ucA==
X-Google-Smtp-Source: AOwi7QClj7dI9Nly2udQcELNCguAaTf1opaVlCe1KcIhnJnEE2vBU9Z1Ha/L45lur2wvntUkFCQnBQ==
X-Received: by 10.84.239.15 with SMTP id w15mr10799336plk.29.1508214409980;
	Mon, 16 Oct 2017 21:26:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	y30sm14959022pge.27.2017.10.16.21.26.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 21:26:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Oct 2017 21:26:40 -0700
Message-Id: <20171017042640.17462-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [meta-oe][PATCH] gperftools: Fix build on musl/mips
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
X-List-Received-Date: Tue, 17 Oct 2017 04:26:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/gperftools/gperftools/sgidef.patch  | 17 +++++++++++++++++
 meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb  |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/sgidef.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
new file mode 100644
index 000000000..7e1a23bf6
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
@@ -0,0 +1,17 @@
+sgidef.h does not exist on musl and its not needed to compile
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+Index: git/src/base/linux_syscall_support.h
+===================================================================
+--- git.orig/src/base/linux_syscall_support.h
++++ git/src/base/linux_syscall_support.h
+@@ -164,7 +164,7 @@ extern "C" {
+ #include <endian.h>
+ #include <fcntl.h>
+ 
+-#ifdef __mips__
++#if defined(__mips__) && defined(__glibc__)
+ /* Include definitions of the ABI currently in use.                          */
+ #include <sgidefs.h>
+ #endif
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
index 8ce376c91..ecac6c5cc 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-include-fcntl.h-for-loff_t-definition.patch \
            file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
            file://disable_libunwind_aarch64.patch \
+           file://sgidef.patch \
            "
 
 inherit autotools
-- 
2.14.2


