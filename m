Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3C356783AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Jan 2018 17:32:03 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id d21so1411608pll.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Jan 2018 09:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=aZ2AHeAuwFEBTtZxkf+gWiN7bAht23JpPwAt64BlBIM=;
	b=mfv8O99GG6tOjomH/7yvOIYLCLpFTNGFHjtUpjYMl+nWo5dJCtxvFxJpR90F5OdNFR
	zXUrqIufNrsm9y5dmjL0CpjnH27ojgBkoT3Od5i6AU8e6+Jf1dHTqTSDlORP5pwRUFHV
	AsgFhDbWxsAoKH81b2VLcsLIFdB5cMhwVdNQ7O/78WXDAIc/dgHk0T3m7VsqSC9PF0Rk
	r/znxig6SnFg3UrId92dSwaph8rCQ8+Trc8a4gO0rJJxlX3b/DkGpCoYD8mUpF9+20Qx
	lZ4K8ldtNuhCIg2j6OzsSp9zsI1SjnpXOVD7iCYuEUZixy7lJuVz3rdVY+ZxdTScwJv1
	Q5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aZ2AHeAuwFEBTtZxkf+gWiN7bAht23JpPwAt64BlBIM=;
	b=REw4qD2HPNweyc00zzADYHyB6BQQhoRb8hUmhLwnDGQZ/tpDD8oVFsHV3qKJupL3E3
	vNev4URM8a1bUPb8AJeY4uvVbmJKulbFNsAdySEA+X9n8/BWFMfFfgFA8Xk34Stunl51
	p35HKAxMWduiA1ht2gnKzbYWijemr4zDWL7IUZtJu55GREitlmrVxjQ9WfT28d3gkB45
	FuBIde8dk/KmGR43K4O+zeO6YzCOCxBqlfAaZTXRBe+YXZo7jIk67x7SGXRf2xGjcRda
	nTA5hG90GWnFbiOXRUq0vmOhPWbIDSspCvq0rGLRQUrv5ZLD6X2NHP67mlyFlUM5P7P3
	ifXA==
X-Gm-Message-State: AKGB3mLMRtZf2MqajzSySutZCIJYCerqlqCI81hMgS0V46x06zz9yLY9
	o5A6gd+EbriD+hQxmyfboMA=
X-Google-Smtp-Source: ACJfBothjIlj7LQfcBROe/FkxUSD1OWLUx88XxPC7smz50KCW3Phl7KJ1dxs7VI+8MYpG/sutVtwAg==
X-Received: by 10.159.230.8 with SMTP id u8mr274694plq.3.1515087124535;
	Thu, 04 Jan 2018 09:32:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:118f:a6ff:8496:e77b])
	by smtp.gmail.com with ESMTPSA id
	g2sm9071494pfc.130.2018.01.04.09.32.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Jan 2018 09:32:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Thu,  4 Jan 2018 09:32:02 -0800
Message-Id: <1515087122-23570-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] kexec-tools-klibc: update to fix build issues after core changes.
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
X-List-Received-Date: Thu, 04 Jan 2018 17:32:03 -0000

Parsing recipes...ERROR: ParseError at ../meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb:2: Could not include required file recipes-kernel/kexec/kexec-tools.inc

This was introduced by:
http://cgit.openembedded.org/openembedded-core/commit/?id=491f6d523b72b91dc7b186a6f273756435804581

removed the kexec-tools.inc so place those changes into the recipe.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../kexec/kexec-tools-klibc_2.0.2.bb               | 33 +++++++++++++++++++---
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
index 49c53a3..1c37531 100644
--- a/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
+++ b/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2.0.2.bb
@@ -1,10 +1,16 @@
 # the binaries are statically linked against klibc
-require recipes-kernel/kexec/kexec-tools.inc
 SUMMARY = "Kexec tools, statically compiled against klibc"
-SRC_URI[md5sum] = "92eff93b097475b7767f8c98df84408a"
-SRC_URI[sha256sum] = "09e180ff36dee087182cdc939ba6c6917b6adbb5fc12d589f31fd3659b6471f2"
+AUTHOR = "Eric Biederman"
+HOMEPAGE = "http://kernel.org/pub/linux/utils/kernel/kexec/"
+SECTION = "kernel/userland"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a \
+                    file://kexec/kexec.c;beginline=1;endline=20;md5=af10f6ae4a8715965e648aa687ad3e09"
+DEPENDS = "zlib xz"
 
-inherit klibc
+PR = "r1"
+
+inherit klibc autotools
 
 FILESPATH =. "${FILE_DIRNAME}/kexec-tools-${PV}:"
 
@@ -35,7 +41,26 @@ EXTRA_OECONF += "--without-zlib --without-lzma --without-xen"
 CFLAGS += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits32"
 CFLAGS_x86-64 += "-I${STAGING_DIR_HOST}${libdir}/klibc/include -I${STAGING_DIR_HOST}${libdir}/klibc/include/bits64"
 
+do_compile_prepend() {
+    # Remove the prepackaged config.h from the source tree as it overrides
+    # the same file generated by configure and placed in the build tree
+    rm -f ${S}/include/config.h
+
+    # Remove the '*.d' file to make sure the recompile is OK
+    for dep in `find ${B} -type f -name '*.d'`; do
+        dep_no_d="`echo $dep | sed 's#.d$##'`"
+        # Remove file.d when there is a file.o
+        if [ -f "$dep_no_d.o" ]; then
+            rm -f $dep
+        fi
+    done
+}
+
 PACKAGES =+ "kexec-klibc kdump-klibc"
 
 FILES_kexec-klibc = "${sbindir}/kexec"
 FILES_kdump-klibc = "${sbindir}/kdump"
+
+INSANE_SKIP_${PN} = "arch"
+
+COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*|powerpc.*|mips.*)-(linux|freebsd.*)'
-- 
2.7.4


