Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4D11E774D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 13:13:15 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id 14so3024100itw.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Mar 2017 06:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=n24G5OL8SLzOKfXgZ7lGWHKyw9mQyyKXrvsCZxCJRCk=;
	b=LYkyGxOSJF+rrUkCoy+e+T1jacA8qIWuL5CzBOkaC22b6n4sfhsOfybzBwSlFIbFcR
	BBiAQGIKc3b0Y4jv43OZz0K5Y4A+kYf1ww0+bvytp54c2L8Y/qZ/pFU+R64aWXyYatPw
	aPpYsUH1I6+WOhMOoV3m81nXk7GF/cBGNoxereiVYdx6/xn0XOZQJHEbytedD4uZ3gLy
	x+Hdpaz1lUa9mvjNVfGDF+12KOUe9/tyq/mSaSHf61RGgEKyMDOXWVY38F1GQDv9lAwL
	vprRZloxhgEN1OatD0DMudepLTY3r2wxiobQ1eqzp5fGkRgM6lBzkvBXoKsPuVRsq+9g
	EERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=n24G5OL8SLzOKfXgZ7lGWHKyw9mQyyKXrvsCZxCJRCk=;
	b=QQ7yML2VgxMnI4DbUrWgRPspO26JGoveUzzrFmB/VRlwL902mgqs2iN2F0EbhXXpOq
	ugqhvyQghK/y8d/ydt+tMJkr3kM62GKjrgw/ZEvV9C6/NrltIloGkdMB//7hGlb98PdH
	5l67VjDPFPFONL634N8yo7Wt/hXiPU8cCA9IiyPOwL4Slto+WvT3lBvKqZnOXccubJ99
	LC50X2++nuM8R623VY94uZsLIvY14q1vdAFLz90/AfbIN6uen4CnatfzzWsLQOXWXNSJ
	NdIv3iEF3oDwfIdJKko2p++uMpME04JktmUv1hQg6uWJ7HLOPRHJ+Wk3Y3DE0C8fHkGZ
	urGQ==
X-Gm-Message-State: AFeK/H2ej138HGyoG+R1QSmvc+s3HT9WlxrKabpH9ZhM7tK15F7Jl60jSAyg+KPzW9sJXA==
X-Received: by 10.36.0.85 with SMTP id 82mr4892389ita.26.1489583596610;
	Wed, 15 Mar 2017 06:13:16 -0700 (PDT)
Received: from linux-uys3.suse (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id 10sm144319itm.12.2017.03.15.06.13.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 15 Mar 2017 06:13:16 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Mar 2017 09:12:59 -0400
Message-Id: <20170315131300.10131-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.12.0.rc1.48.g076c053
Subject: [meta-browser][PATCH 1/2] chromium: remove more Werror flags
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
X-List-Received-Date: Wed, 15 Mar 2017 13:13:16 -0000

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 .../chromium/chromium/chromium/remove-Werror.patch | 51 ++++++++++++++++++++--
 1 file changed, 47 insertions(+), 4 deletions(-)

diff --git a/recipes-browser/chromium/chromium/chromium/remove-Werror.patch b/recipes-browser/chromium/chromium/chromium/remove-Werror.patch
index e69b643..f279d92 100644
--- a/recipes-browser/chromium/chromium/chromium/remove-Werror.patch
+++ b/recipes-browser/chromium/chromium/chromium/remove-Werror.patch
@@ -1,5 +1,3 @@
-Index: chromium-53.0.2774.4/build/common.gypi
-===================================================================
 --- chromium-53.0.2774.4.orig/build/common.gypi
 +++ chromium-53.0.2774.4/build/common.gypi
 @@ -1446,7 +1446,7 @@
@@ -46,8 +44,6 @@ Index: chromium-53.0.2774.4/build/common.gypi
            'GCC_VERSION': 'com.apple.compilers.llvm.clang.1_0',
            'USE_HEADERMAP': 'NO',
            'WARNING_CFLAGS': [
-Index: chromium-53.0.2774.4/build/config/compiler/BUILD.gn
-===================================================================
 --- chromium-53.0.2774.4.orig/build/config/compiler/BUILD.gn
 +++ chromium-53.0.2774.4/build/config/compiler/BUILD.gn
 @@ -1040,9 +1040,6 @@ config("chromium_code") {
@@ -72,3 +68,50 @@ Index: chromium-53.0.2774.4/build/config/compiler/BUILD.gn
      if (is_clang && !is_nacl) {
        # TODO(thakis): Remove !is_nacl once
        # https://codereview.webrtc.org/1552863002/ made its way into chromium.
+diff -ur chromium-52.0.2743.76__ORIG/v8/gypfiles/standalone.gypi chromium-52.0.2743.76/v8/gypfiles/standalone.gypi
+--- chromium-52.0.2743.76__ORIG/v8/gypfiles/standalone.gypi	2016-07-15 18:04:19.000000000 -0400
++++ chromium-52.0.2743.76/v8/gypfiles/standalone.gypi	2017-03-13 16:04:16.587323380 -0400
+@@ -147,7 +147,6 @@
+     'host_clang%': '<(host_clang)',
+     'target_arch%': '<(target_arch)',
+     'v8_target_arch%': '<(v8_target_arch)',
+-    'werror%': '-Werror',
+     'use_goma%': '<(use_goma)',
+     'gomadir%': '<(gomadir)',
+     'asan%': '<(asan)',
+@@ -499,7 +498,6 @@
+             'cflags!': [
+               '-pedantic',
+               '-Wall',
+-              '-Werror',
+               '-Wextra',
+               '-Wshorten-64-to-32',
+             ],
+@@ -705,7 +703,6 @@
+       'target_defaults': {
+         'cflags': [
+           '-Wall',
+-          '<(werror)',
+           '-Wno-unused-parameter',
+           '-Wno-long-long',
+           '-pthread',
+@@ -757,7 +754,6 @@
+       'target_defaults': {
+         'cflags': [
+           '-Wall',
+-          '<(werror)',
+           '-Wno-unused-parameter',
+           # Don't warn about the "struct foo f = {0};" initialization pattern.
+           '-Wno-missing-field-initializers',
+diff -ur chromium-52.0.2743.76__ORIG/v8/gypfiles/toolchain.gypi chromium-52.0.2743.76/v8/gypfiles/toolchain.gypi
+--- chromium-52.0.2743.76__ORIG/v8/gypfiles/toolchain.gypi	2016-07-15 18:04:19.000000000 -0400
++++ chromium-52.0.2743.76/v8/gypfiles/toolchain.gypi	2017-03-13 16:03:29.851181458 -0400
+@@ -82,7 +82,7 @@
+     'v8_toolset_for_shell%': 'target',
+ 
+     'host_os%': '<(OS)',
+-    'werror%': '-Werror',
++    'werror%': '',
+     # For a shared library build, results in "libv8-<(soname_version).so".
+     'soname_version%': '',
+ 
-- 
2.12.0.rc1.48.g076c053


