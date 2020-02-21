Return-Path: <leo.yan@linaro.org>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9CFE5616DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 10:43:50 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id y11so1455158wrt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Feb 2020 02:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=uLfTUYXtpu4DmSjspBsYnYOduPncI7vrDdmhymUBtrk=;
	b=qHIoV+HCidvsVYxi54CawziQasd/clVqymuY6yyKZJRP6k8rizXYSG+LjOHcyhD7Xm
	PAsYEkIOb7hk4wTAAPyFhKP87EcFt2b409LFI8lbdaY9jFTfLTx285khTpt1xmwLWuXM
	CEOkIkV+DJSmgXq7nd68rRUnsKzzCXidqWuumZPbeKqUmFLJHR6TGHPH2hdK/uvQGm6p
	0qEiZw8Z510e86Ko40XjF+WYeNflMkaB38uVaFl0ng/jkKPemibyj8Wq+Qx6ZuxCvdIf
	DAlM41lZETAUJFfR2zQ2oPPY9+V62O/7hBH9uq1jIF0FQHJ6TUGdhffZSNpw6qLhaZCe
	Krng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=uLfTUYXtpu4DmSjspBsYnYOduPncI7vrDdmhymUBtrk=;
	b=iivsjVORY6FVMbGcQr1XRUTvLI49X3kphRic/YCtxP5UX9bzE19iMYIlWpVh6xPSiK
	Y2bE/V45ZCyVO/JEYEzBMQVe6OHr4jsAS67a+iT/OkZt5iCdzPmzoLx+S5bcUj+vXU8A
	3hIHVZ/Smxoe9bm5AHDRebxyROE+VeR3AC63D78SFEzDQMMB+vlMaSc5Gw8FDNa7XM0E
	Is6C33SVnoAw5gxA4MdV0m0Yx8nhh2Ip7lDEXStev8Lr8rsEmbUX4niX3igq5z58w8JM
	5ACVqgvHy5XuA+6CnovcHHBz2CYwdZxeKNBhC1MotjV1wXeT4Dl73B7qLFZWOlz+DVF3
	PpBw==
X-Gm-Message-State: APjAAAXxvY0gsCG/Nbdd02QbB7inIFbilFcIJZolouGgyBsFxnA3DPBq
	l/DLFLrk3Z9mdhqPsZPHCSUcJHZJE1fF7A==
X-Google-Smtp-Source: APXvYqxKrOJiR/lra2UuOg8Dwtwsj87YE4jROL4uY6iAgua67EFmkWzwhF7YOL0rb+0sycOvylCW0g==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr48491861wrq.206.1582281830719;
	Fri, 21 Feb 2020 02:43:50 -0800 (PST)
Received: from hackbox2.linaro.org ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	f65sm3184081wmf.29.2020.02.21.02.43.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 21 Feb 2020 02:43:49 -0800 (PST)
From: Leo Yan <leo.yan@linaro.org>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Khem Raj <raj.khem@gmail.com>, Sumit Garg <sumit.garg@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Loic Poulain <loic.poulain@linaro.org>
Date: Fri, 21 Feb 2020 10:43:40 +0000
Message-Id: <20200221104340.21294-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH v2] Ply: Add recipe for git version
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
X-List-Received-Date: Fri, 21 Feb 2020 10:43:51 -0000

Ply is a light-weight eBPF tool which compiles ply script or one-liner
to Linux BPF programs and attaches to kprobes and tracepoints.  It
doesn't require external dependencies except libc, so it's very friendly
for embedded system usage.

This patch adds the recipe to support ply building for git version.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 meta-oe/recipes-devtools/ply/ply_git.bb | 38 +++++++++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/ply/ply_git.bb

diff --git a/meta-oe/recipes-devtools/ply/ply_git.bb b/meta-oe/recipes-devtools/ply/ply_git.bb
new file mode 100644
index 000000000..21395885c
--- /dev/null
+++ b/meta-oe/recipes-devtools/ply/ply_git.bb
@@ -0,0 +1,38 @@
+SUMMARY = "Ply: A light-weight dynamic tracer for eBPF"
+HOMEPAGE = "https://github.com/iovisor/ply"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS += "bison-native"
+
+SRC_URI = "git://github.com/iovisor/ply"
+SRCREV = "aa5b9ac31307ec1acece818be334ef801c802a12"
+
+S = "${WORKDIR}/git"
+
+do_configure_prepend() {
+    ( cd ${S}; ./autogen.sh; cd - )
+}
+
+do_configure() {
+    ( cd ${S}; ./configure --host=${TARGET_SYS} --prefix=${D}${prefix}; cd - )
+}
+
+do_compile() {
+    ( cd ${S}; oe_runmake; cd - )
+}
+
+do_install() {
+    ( cd ${S}; oe_runmake install; cd - )
+}
+
+do_install_append() {
+    chrpath -d ${D}${prefix}/sbin/ply
+}
+
+# x86, mips32/64, riscv64 are not supported in this release
+COMPATIBLE_HOST_i586 = 'null'
+COMPATIBLE_HOST_i686 = 'null'
+COMPATIBLE_HOST_mipsarchn32 = "null"
+COMPATIBLE_HOST_mipsarchn64 = "null"
+COMPATIBLE_HOST_riscv64 = "null"
-- 
2.17.1


