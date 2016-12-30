Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2264360938
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 18:11:47 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id n85so142442019ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Dec 2016 10:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=74BVC7lbl2FnCSFLayTqDC94Xps8zTu8O0yPyBSSAWg=;
	b=nUbHFn5Q5pt8QXEZpeN+JDvjmGiKbsiR5xaAjrOFOV6sU9PRVMQHAFdOkat9NOL6Fn
	XV57DaExkS7aRM1D9g3Ii/HE41CVCPdtuWlLTtsDo9ERp/aiZrb6TPFLLfDD6z4qvpEi
	LxUmgEj9a33dfu6okTfBTenyvtm7rYcnrZtCTdTvW9tPTRrFb6YNQmMQ76dyHiwxp+A1
	NA4xHxrklTB3bzXwuNF9iHeQEAlvaOJQR2noELfXd+1+0uc996OR3rkDiuk5NZKDQ8OQ
	dT5EQmW1z/HqKedFdu778tXgdCGpWiYK2hkjgU9wDYj/5w0iRCIgjvKY1Nf+sFugNMR2
	n6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=74BVC7lbl2FnCSFLayTqDC94Xps8zTu8O0yPyBSSAWg=;
	b=bS0tZeO1sEToGWwLUj8UkPH3heDrzCh9xl6Ayd43arn5UdwUFA/vJzMIMF8tLIfpdZ
	UZIWxrFzvKdo2IYGxd+oyQG4QdxrnjURVHyBtVVMHmiavrOLfm+7srYQHa38uKbBLlGm
	ZBstXaDGapJ+cwLGwELkWYAxX+3DwgYj/kaulesQmB66I95WoC7a7xOOu7zj+EFrp1gN
	6lkTP+9L3xof+J26xJA5S2UkMmX8pUIiSdp/47oRo9dPBbqDi0FPwxzI0YkecFVfWH64
	p7URgdg9l71+xT5mnACm13NoK/klLdE94tyC543w7hOnoA0XCW1LEuIiSIvqCPOUGNHv
	SG9g==
X-Gm-Message-State: AIkVDXK78MCib68LIRIbKYWzJzB54p5YrSrhk+kYQD8CNjhUsCkhYaqm1xgWfl7WwcGqjg==
X-Received: by 10.107.29.148 with SMTP id d142mr40650949iod.44.1483121509069; 
	Fri, 30 Dec 2016 10:11:49 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	y125sm25915925ity.13.2016.12.30.10.11.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Dec 2016 10:11:48 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Dec 2016 13:11:24 -0500
Message-Id: <20161230181124.3531-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.10.0.129.g35f6318
Subject: [PATCH][meta-browser] chromium: add i586 (qemux86) support
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
X-List-Received-Date: Fri, 30 Dec 2016 18:11:54 -0000

Build and run tested on qemux86 (i586) and turbot (x86-64).

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium_52.0.2743.76.bb |  2 ++
 recipes-browser/chromium/files/i586/x86-m32.patch | 42 +++++++++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 recipes-browser/chromium/files/i586/x86-m32.patch

diff --git a/recipes-browser/chromium/chromium_52.0.2743.76.bb b/recipes-browser/chromium/chromium_52.0.2743.76.bb
index 5be3c32..bba1549 100644
--- a/recipes-browser/chromium/chromium_52.0.2743.76.bb
+++ b/recipes-browser/chromium/chromium_52.0.2743.76.bb
@@ -14,6 +14,8 @@ SRC_URI += "\
         ${@bb.utils.contains('PACKAGECONFIG', 'ignore-lost-context', 'file://0001-Remove-accelerated-Canvas-support-from-blacklist.patch', '', d)} \
 "
 
+SRC_URI_append_i586 = "file://x86-m32.patch"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0fca02217a5d49a14dfe2d11837bb34d"
 SRC_URI[md5sum] = "0fee71466e1f2dc39ed4549d04b58ee2"
 SRC_URI[sha256sum] = "c54cdc11c3324152f3d5be98dcb4eae2bda0fc9dac7dd5f9010150458d68c18c"
diff --git a/recipes-browser/chromium/files/i586/x86-m32.patch b/recipes-browser/chromium/files/i586/x86-m32.patch
new file mode 100644
index 0000000..be08071
--- /dev/null
+++ b/recipes-browser/chromium/files/i586/x86-m32.patch
@@ -0,0 +1,42 @@
+Index: chromium-52.0.2743.76/build/common.gypi
+===================================================================
+--- chromium-52.0.2743.76.orig/build/common.gypi
++++ chromium-52.0.2743.76/build/common.gypi
+@@ -3849,10 +3849,6 @@
+                   '-msse2',
+                   '-mfpmath=sse',
+                   '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
+-                  '-m32',
+-                ],
+-                'ldflags': [
+-                  '-m32',
+                 ],
+                 'conditions': [
+                   # Use gold linker for Android ia32 target.
+Index: chromium-52.0.2743.76/build/config/compiler/BUILD.gn
+===================================================================
+--- chromium-52.0.2743.76.orig/build/config/compiler/BUILD.gn
++++ chromium-52.0.2743.76/build/config/compiler/BUILD.gn
+@@ -502,8 +502,6 @@ config("compiler_cpu_abi") {
+       ]
+       ldflags += [ "-m64" ]
+     } else if (current_cpu == "x86") {
+-      cflags += [ "-m32" ]
+-      ldflags += [ "-m32" ]
+       if (!is_nacl) {
+         cflags += [
+           "-msse2",
+Index: chromium-52.0.2743.76/third_party/icu/icu.gyp
+===================================================================
+--- chromium-52.0.2743.76.orig/third_party/icu/icu.gyp
++++ chromium-52.0.2743.76/third_party/icu/icu.gyp
+@@ -48,9 +48,6 @@
+          target_arch=="mipsel")', {
+         'target_conditions': [
+           ['_toolset=="host"', {
+-            'cflags': [ '-m32' ],
+-            'ldflags': [ '-m32' ],
+-            'asflags': [ '-32' ],
+             'xcode_settings': {
+               'ARCHS': [ 'i386' ],
+             },
-- 
2.10.2


