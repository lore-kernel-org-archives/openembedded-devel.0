Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
	[209.85.210.180])
	by mail.openembedded.org (Postfix) with ESMTP id 41AFA7F891
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:42:22 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id 4so9590471pfz.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0Bq/pxHRlA+lrOEGRKWFCNp8xd8Qkfh6GgssY1UZ0d0=;
	b=Lacx1EgyjC1FlKePcE7cUfG7UecNUcYeAc2r8n8yEgO3CGh2LY4ClhPp2Zzz87e1XM
	W3QiK2M4mHdAV5icDi25qHi31gBrs3TzbHC17vKlYhLLC/pQqkSmy3MN2lRABC5miUIx
	kQYftDJUdfi+YCPoVczK718o0SqHXLmqzOdtu3LTU1eeuYKFCUFG7ZVfV+h7u4+LBH2A
	bL6x2neptZ3NO7IohKdpi0KF6KIdj9Bfs7jsBvEIJQSDWLxNnzcjtZKYeK3Zo7NjjA1t
	m59COv7V6QUySMsa8sHMn0m1+OUh+7m4UVk2Zzlq2DNg3GfVWVIOofypc9wwzETzfwVD
	rObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0Bq/pxHRlA+lrOEGRKWFCNp8xd8Qkfh6GgssY1UZ0d0=;
	b=o+xUGaHptm099LSuU5zpeTWeJ5aeluI7mR+37TcJTZnh+qRzrsAD7xJOjCCbO1ltG9
	mxoRRdDVzXl7kjWcQVFZX4FlWYqVJHGYBR1onzgl3af3gJjLTGakTfC/X7+Et53hgqFW
	iCVNpIj6CTnkYW9PIX5Jot9sMnzB8boPVIaaMUfN2/JDqx1yqlC1b+2Ga+Gi7ynXa0SL
	tflB9eNS2K0VzgavpgIn+Ov3AuDyssAb9DIFcmYqX1d/EHMeZwl0wRE+X2C1u29KLP8V
	67LGJ9xfZXoCCo5rTr3t38G5fXM4f6yIoce8ggVOdYLW4obK0LteU9//ODQrP3PM1Z9k
	mKYA==
X-Gm-Message-State: APjAAAVPZlKDciMSQsiU7aC5cxZSOUUPx7D8qFdpkdWHXebgOaxIxDZJ
	b/2ZlCpS9zX1rRL/GNnHbTOBcrMVux8=
X-Google-Smtp-Source: APXvYqwEW1XteifSQnMtHVXkH6mJYjXtxZUN2hfxmHkhHZD6WbTRCZBcmrel678/ARrWwJ+BUBh88A==
X-Received: by 2002:a63:fd43:: with SMTP id m3mr37286439pgj.164.1579149742685; 
	Wed, 15 Jan 2020 20:42:22 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l14sm1425742pjq.5.2020.01.15.20.42.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 20:42:22 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 20:42:17 -0800
Message-Id: <20200116044220.3667460-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200116044220.3667460-1-raj.khem@gmail.com>
References: <20200116044220.3667460-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/5] jack: Use c++ compiler for programs which use c++ source files
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
X-List-Received-Date: Thu, 16 Jan 2020 04:42:22 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ts-Use-c-compiler-for-jack_simdtests.patch | 33 +++++++++++++++++++
 .../recipes-multimedia/jack/jack_1.19.14.bb   |  6 +++-
 2 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch

diff --git a/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch b/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
new file mode 100644
index 0000000000..dda21a32d8
--- /dev/null
+++ b/meta-oe/recipes-multimedia/jack/jack/0001-example-clients-Use-c-compiler-for-jack_simdtests.patch
@@ -0,0 +1,33 @@
+From 76b8a389268275cc13f3b4e61394d40b24ec56f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Jan 2020 20:21:58 -0800
+Subject: [PATCH] example-clients: Use c++ compiler for jack_simdtests
+
+It uses c++ sources and runtime therefore its best to use c++ compiler
+to build it so it can find the correct runtime, cross compiling with
+clang fails
+
+x86_64-yoe-linux-ld: example-clients/simdtests.cpp.28.o: undefined reference to symbol '__cxa_call_unexpected@@CXXABI_1.3'
+
+Upstream-Status: Submitted [https://github.com/jackaudio/jack2/pull/536]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ example-clients/wscript | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/example-clients/wscript b/example-clients/wscript
+index a8857aa7..df9435aa 100644
+--- a/example-clients/wscript
++++ b/example-clients/wscript
+@@ -69,6 +69,8 @@ def build(bld):
+ 
+         if bld.env['IS_MACOSX']:
+             prog = bld(features='c cprogram', framework = ['Foundation'])
++        elif example_program == 'jack_simdtests':
++            prog = bld(features='cxx cxxprogram')
+         else:
+             prog = bld(features='c cprogram')
+         prog.includes = os_incdir + ['../common/jack', '../common']
+-- 
+2.25.0
+
diff --git a/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
index cebc952661..3f3d53f608 100644
--- a/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
+++ b/meta-oe/recipes-multimedia/jack/jack_1.19.14.bb
@@ -14,7 +14,9 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "libsamplerate0 libsndfile1 readline"
 
-SRC_URI = "git://github.com/jackaudio/jack2.git"
+SRC_URI = "git://github.com/jackaudio/jack2.git \
+           file://0001-example-clients-Use-c-compiler-for-jack_simdtests.patch \
+          "
 SRCREV = "b54a09bf7ef760d81fdb8544ad10e45575394624"
 
 S = "${WORKDIR}/git"
@@ -30,6 +32,8 @@ PACKAGECONFIG[opus] = "--opus=yes,--opus=no,libopus"
 # portaudio is for windows builds only
 EXTRA_OECONF = "--portaudio=no"
 
+export CC = "${CXX}"
+
 do_install_append() {
 	if ! ${@bb.utils.contains('PACKAGECONFIG', 'dbus', True, False, d)}; then
 		rm -f ${D}${bindir}/jack_control
-- 
2.25.0


