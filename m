Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 393077885C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:24:40 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id t8so166757plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=T/zHgCzSk4lom1jeE4ZAEUqKEPNKpfHmuYeSV26SXFI=;
	b=lnvfsyVfyJqyjTQ05OddHn/4nUg9BYiT1uZHYajr3DAJxFhDRgrPlltrFuK3vj3gNw
	Rfwp392L3ono/L6kLOc1xILwebK9qB8eiOX7b0+t4BhUgV7DGU3LYcoVviiq6WU+dga4
	V1XgMhgWk6J5IGyK0qgBylPnMQsMYZ8Zhp5yVoT89FzrbPbhZ/dFKb2WUmdYkCK5L3nE
	zFzJjHhp+kHSf1HIm2mERMd1YwsLpzOP1ORsIn97RlWVuiVpgEvQWcciSYbLi9tPUMsv
	qGSB4kK3AlJ3TKgrpc8UTeW8PmcRyeCISQsehMA34dK+MpFiEw8esHziSv58u22J1PCm
	aCYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=T/zHgCzSk4lom1jeE4ZAEUqKEPNKpfHmuYeSV26SXFI=;
	b=BY0IFC+Tf962q0dkWQhrlxlTSN0MrcGOmicFC+vzqbDfxka9oUjlKs7Tg7j96Wkuyb
	E7/jIklw7Y77d5//IFGwhRvso3myEJ3Fsju3dY4WpG6yOA5N+8Qy/cka4AM/4gLG3wHI
	Q0t5tR6GluZc+fslpKWWQWiYufl12PO/gd/+heK5CAwZT2eGu/dTH40pKwJyO87hsgid
	H7TKl//Fk64IFoOgDs/P8DG8+dtot0mkgZ/Y5f8VPTZGE7wHg62mh3grIiQ6+0qeaen0
	XJhhMda5l/T5omkomCKeJjCN/aCgk7fBW6+jPTyf4WSrAKagSPPv7n71PjTLYXSxvAs7
	U+NA==
X-Gm-Message-State: AKwxytcTtn7OqEID+V1tuujIq22czDXMcYfIpAr9bboGNOsXPOJYyON5
	s+0qzvxncgtVMekk+IEFAe4=
X-Google-Smtp-Source: AH8x224BaoHNUAF5sSTiTm0uKArY/COocpXw3C2wp7/LzEZ//5fQrMneFBoK3q0dUpLxe6KQI6UvIg==
X-Received: by 2002:a17:902:6d09:: with SMTP id
	s9-v6mr16159022plk.176.1517023482320; 
	Fri, 26 Jan 2018 19:24:42 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.24.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:24:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:01 -0800
Message-Id: <a58438d441fcb836ac6a7b8af3126455812025a0.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 01/36] gperftools: Fix build on musl/mips
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
X-List-Received-Date: Sat, 27 Jan 2018 03:24:41 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
(cherry picked from commit 738bea45bc51d9a78a3d46ee8c18390427ccd547)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-support/gperftools/gperftools/sgidef.patch  | 17 +++++++++++++++++
 meta-oe/recipes-support/gperftools/gperftools_2.6.1.bb  |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/sgidef.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
new file mode 100644
index 0000000..7e1a23b
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
index 8ce376c..ecac6c5 100644
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
2.7.4


