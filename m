Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F4CC25B65
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.62987.1699041168582173462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=haVDuJtt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ShIVgfM1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96bed5ba-ea6e9230-d309-429f-94cb-8ca026c1dab8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zTnaSTJBKlQnvqxYIvPQrJXb/qxDeVFGmoYN1M5FuAk=;
	b=haVDuJttt9+hoRuzG8WG5lvxv9/n92Cp2FKForFW0WyYKpn0QWdt5kp0nFLd8164
	oS9pHioaHmSvL2xwAiBQW79Puwr4aDuOz4k1+PddnV74magZSh5Hh9pvuss3/FDIPui
	mRjBDl3wbLuwocL2ZIyO7kNeCNwjqaaZ1RM2Z8jQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zTnaSTJBKlQnvqxYIvPQrJXb/qxDeVFGmoYN1M5FuAk=;
	b=ShIVgfM1dmzxx8X2fRGE+0xRsDZMr4Cf4aUD99HK/B64ZF6bVz4YqGtufMfM1cNk
	3dTAcuutXd2Faux8fsctBqvC9luEHxKzlLzJ7N1JJ1gTqPqvBJ3NKiCUjZtaP4G00Ef
	8jYcVnwWVQkOfHNyIEDob9uE9Q2Hl++tQUVBjv4k=
Content-Type: multipart/mixed; boundary="===============3037851029444902916=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] nodejs: upgrading to 21.1.0 FAILED
Message-ID: <0101018b96bed5ba-ea6e9230-d309-429f-94cb-8ca026c1dab8-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106002

--===============3037851029444902916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nodejs* to *21.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-nodejs-upgrade-20.8.1-21.1.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 981041acb59b2df0bc8d3f002de86c5814e9f1af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 3 Nov 2023 17:10:18 +0000
Subject: [PATCH] nodejs: upgrade 20.8.1 -> 21.1.0

---
 .../nodejs/0001-Using-native-binaries.patch   | 94 -------------------
 .../{nodejs_20.8.1.bb => nodejs_21.1.0.bb}    | 59 +++++++++++-
 2 files changed, 57 insertions(+), 96 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_20.8.1.bb => nodejs_21.1.0.bb} (69%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
deleted file mode 100644
index 0178cec77..000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 6c3ac20477a4bac643088f24df3c042e627fafa9 Mon Sep 17 00:00:00 2001
-From: Guillaume Burel <guillaume.burel@stormshield.eu>
-Date: Fri, 3 Jan 2020 11:25:54 +0100
-Subject: [PATCH] Using native binaries
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Originally added in:
-https://git.openembedded.org/meta-openembedded/commit/?id=1c8e4a679ae382f953b2e5c7a4966a4646314f3e
-later extended and renamed in:
-https://git.openembedded.org/meta-openembedded/commit/?id=feeb172d1a8bf010490d22b8df9448b20d9d2aed
-
-Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
----
- node.gyp                 | 3 +
- tools/v8_gypfiles/v8.gyp | 5 +++++
- 2 files changed, 6 insertions(+)
-
-diff --git a/node.gyp b/node.gyp
-index e8e1d9f9..e60ccc10 100644
---- a/node.gyp
-+++ b/node.gyp
-@@ -320,6 +320,7 @@
-                   'action_name': 'node_mksnapshot',
-                   'process_outputs_as_sources': 1,
-                   'inputs': [
-+                    '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-                     '<(node_mksnapshot_exec)',
-                     '<(node_snapshot_main)',
-                   ],
-@@ -935,6 +935,7 @@
-           'action_name': 'node_js2c',
-           'process_outputs_as_sources': 1,
-           'inputs': [
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(node_js2c_exec)',
-             '<@(library_files)',
-             '<@(deps_files)',
-@@ -944,6 +945,7 @@
-             '<(SHARED_INTERMEDIATE_DIR)/node_javascript.cc',
-           ],
-           'action': [
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(node_js2c_exec)',
-             '<@(_outputs)',
-             'lib',
-
-diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index 42e26cd9..bc721991 100644
---- a/tools/v8_gypfiles/v8.gyp
-+++ b/tools/v8_gypfiles/v8.gyp
-@@ -68,6 +68,7 @@
-         {
-           'action_name': 'run_torque_action',
-           'inputs': [  # Order matters.
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
-             '<@(torque_files)',
-           ],
-@@ -99,6 +100,7 @@
-             '<@(torque_outputs_inc)',
-           ],
-           'action': [
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)torque<(EXECUTABLE_SUFFIX)',
-             '-o', '<(SHARED_INTERMEDIATE_DIR)/torque-generated',
-             '-v8-root', '<(V8_ROOT)',
-@@ -211,6 +213,7 @@
-         {
-           'action_name': 'generate_bytecode_builtins_list_action',
-           'inputs': [
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)bytecode_builtins_list_generator<(EXECUTABLE_SUFFIX)',
-           ],
-           'outputs': [
-@@ -400,6 +403,7 @@
-             ],
-           },
-           'inputs': [
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(mksnapshot_exec)',
-           ],
-           'outputs': [
-@@ -1539,6 +1543,7 @@
-         {
-           'action_name': 'run_gen-regexp-special-case_action',
-           'inputs': [
-+            '<(PRODUCT_DIR)/v8-qemu-wrapper.sh',
-             '<(PRODUCT_DIR)/<(EXECUTABLE_PREFIX)gen-regexp-special-case<(EXECUTABLE_SUFFIX)',
-           ],
-           'outputs': [
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_21.1.0.bb
similarity index 69%
rename from meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_21.1.0.bb
index 65f4eb3f3..ee31f8824 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_20.8.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_21.1.0.bb
@@ -1,7 +1,62 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -78,19 +78,30 @@
+#  
+#  - c-ares, located at deps/cares, is licensed as follows:
+#    """
+# -    Copyright (c) 2007 - 2018, Daniel Stenberg with many contributors, see AUTHORS
+# +    MIT License
+# +
+# +    Copyright (c) 1998 Massachusetts Institute of Technology
+# +    Copyright (c) 2007 - 2023 Daniel Stenberg with many contributors, see AUTHORS
+#      file.
+#  
+# -    Copyright 1998 by the Massachusetts Institute of Technology.
+# -
+# -    Permission to use, copy, modify, and distribute this software and its
+# -    documentation for any purpose and without fee is hereby granted, provided that
+# -    the above copyright notice appear in all copies and that both that copyright
+# -    notice and this permission notice appear in supporting documentation, and that
+# -    the name of M.I.T. not be used in advertising or publicity pertaining to
+# -    distribution of the software without specific, written prior permission.
+# -    M.I.T. makes no representations about the suitability of this software for any
+# -    purpose.  It is provided "as is" without express or implied warranty.
+# +    Permission is hereby granted, free of charge, to any person obtaining a copy of
+# +    this software and associated documentation files (the "Software"), to deal in
+# +    the Software without restriction, including without limitation the rights to
+# +    use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
+# +    the Software, and to permit persons to whom the Software is furnished to do so,
+# +    subject to the following conditions:
+# +
+# +    The above copyright notice and this permission notice (including the next
+# +    paragraph) shall be included in all copies or substantial portions of the
+# +    Software.
+# +
+# +    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# +    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# +    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# +    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# +    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# +    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# +    SOFTWARE.
+#    """
+#  
+#  - cjs-module-lexer, located at deps/cjs-module-lexer, is licensed as follows:
+# 
+#
+
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=162595a4a2f3453a0534e60b0afe4e7b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ce095b5cae771b11878190eaea818d59"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -38,7 +93,7 @@ SRC_URI:append:toolchain-clang:x86 = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "f799c66f6a6386bb8ac2c75a378f740c455e97f1fe964393dd39c9f9f6efbc70"
+SRC_URI[sha256sum] = "91ac72e4444c5e5ab4b448030a61ffa95acd35d34a9d31d2d220ee2bed01b925"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.39.2


--===============3037851029444902916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5008 entries from dependency cache.
Parsing recipes...
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_21.1.0.bb: Unable to get checksum for nodejs SRC_URI entry 0001-Using-native-binaries.patch: file could not be found
The following paths were searched:
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs-21.1.0/poky/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs/poky/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/files/poky/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs-21.1.0/qemux86-64/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs/qemux86-64/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/files/qemux86-64/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs-21.1.0/qemuall/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs/qemuall/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/files/qemuall/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs-21.1.0/x86-64/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs/x86-64/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/files/x86-64/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs-21.1.0/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
/home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/nodejs/files/0001-Using-native-binaries.patch
ERROR: Parsing halted due to errors, see error messages above

--===============3037851029444902916==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-nodejs-upgrade-20.8.1-21.1.0.patch"

RnJvbSA5ODEwNDFhY2I1OWIyZGYwYmM4ZDNmMDAyZGU4NmM1ODE0ZTlmMWFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMyBOb3YgMjAyMyAxNzoxMDoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG5v
ZGVqczogdXBncmFkZSAyMC44LjEgLT4gMjEuMS4wCgotLS0KIC4uLi9ub2RlanMvMDAwMS1Vc2lu
Zy1uYXRpdmUtYmluYXJpZXMucGF0Y2ggICB8IDk0IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLi97
bm9kZWpzXzIwLjguMS5iYiA9PiBub2RlanNfMjEuMS4wLmJifSAgICB8IDU5ICsrKysrKysrKysr
LQogMiBmaWxlcyBjaGFuZ2VkLCA1NyBpbnNlcnRpb25zKCspLCA5NiBkZWxldGlvbnMoLSkKIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbm9kZWpzL25vZGVqcy8w
MDAxLVVzaW5nLW5hdGl2ZS1iaW5hcmllcy5wYXRjaAogcmVuYW1lIG1ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9ub2RlanMve25vZGVqc18yMC44LjEuYmIgPT4gbm9kZWpzXzIxLjEuMC5iYn0gKDY5
JSkKCmRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvbm9kZWpzL25vZGVqcy8w
MDAxLVVzaW5nLW5hdGl2ZS1iaW5hcmllcy5wYXRjaCBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29s
cy9ub2RlanMvbm9kZWpzLzAwMDEtVXNpbmctbmF0aXZlLWJpbmFyaWVzLnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMTc4Y2VjNzcuLjAwMDAwMDAwMAotLS0gYS9tZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvbm9kZWpzL25vZGVqcy8wMDAxLVVzaW5nLW5hdGl2ZS1iaW5hcmll
cy5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDk0ICswLDAgQEAKLUZyb20gNmMzYWMyMDQ3N2E0
YmFjNjQzMDg4ZjI0ZGYzYzA0MmU2MjdmYWZhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206IEd1aWxsYXVtZSBCdXJlbCA8Z3VpbGxhdW1lLmJ1cmVsQHN0b3Jtc2hpZWxkLmV1PgotRGF0
ZTogRnJpLCAzIEphbiAyMDIwIDExOjI1OjU0ICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIFVzaW5n
IG5hdGl2ZSBiaW5hcmllcwotCi1VcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVk
ZGVkIHNwZWNpZmljXQotCi1PcmlnaW5hbGx5IGFkZGVkIGluOgotaHR0cHM6Ly9naXQub3BlbmVt
YmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQvP2lkPTFjOGU0YTY3OWFlMzgyZjk1
M2IyZTVjN2E0OTY2YTQ2NDYzMTRmM2UKLWxhdGVyIGV4dGVuZGVkIGFuZCByZW5hbWVkIGluOgot
aHR0cHM6Ly9naXQub3BlbmVtYmVkZGVkLm9yZy9tZXRhLW9wZW5lbWJlZGRlZC9jb21taXQvP2lk
PWZlZWIxNzJkMWE4YmYwMTA0OTBkMjJiOGRmOTQ0OGIyMGQ5ZDJhZWQKLQotU2lnbmVkLW9mZi1i
eTogQXJjaGFuYSBQb2xhbXBhbGxpIDxhcmNoYW5hLnBvbGFtcGFsbGlAd2luZHJpdmVyLmNvbT4K
LS0tLQotIG5vZGUuZ3lwICAgICAgICAgICAgICAgICB8IDMgKwotIHRvb2xzL3Y4X2d5cGZpbGVz
L3Y4Lmd5cCB8IDUgKysrKysKLSAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQotCi1k
aWZmIC0tZ2l0IGEvbm9kZS5neXAgYi9ub2RlLmd5cAotaW5kZXggZThlMWQ5ZjkuLmU2MGNjYzEw
IDEwMDY0NAotLS0tIGEvbm9kZS5neXAKLSsrKyBiL25vZGUuZ3lwCi1AQCAtMzIwLDYgKzMyMCw3
IEBACi0gICAgICAgICAgICAgICAgICAgJ2FjdGlvbl9uYW1lJzogJ25vZGVfbWtzbmFwc2hvdCcs
Ci0gICAgICAgICAgICAgICAgICAgJ3Byb2Nlc3Nfb3V0cHV0c19hc19zb3VyY2VzJzogMSwKLSAg
ICAgICAgICAgICAgICAgICAnaW5wdXRzJzogWwotKyAgICAgICAgICAgICAgICAgICAgJzwoUFJP
RFVDVF9ESVIpL3Y4LXFlbXUtd3JhcHBlci5zaCcsCi0gICAgICAgICAgICAgICAgICAgICAnPChu
b2RlX21rc25hcHNob3RfZXhlYyknLAotICAgICAgICAgICAgICAgICAgICAgJzwobm9kZV9zbmFw
c2hvdF9tYWluKScsCi0gICAgICAgICAgICAgICAgICAgXSwKLUBAIC05MzUsNiArOTM1LDcgQEAK
LSAgICAgICAgICAgJ2FjdGlvbl9uYW1lJzogJ25vZGVfanMyYycsCi0gICAgICAgICAgICdwcm9j
ZXNzX291dHB1dHNfYXNfc291cmNlcyc6IDEsCi0gICAgICAgICAgICdpbnB1dHMnOiBbCi0rICAg
ICAgICAgICAgJzwoUFJPRFVDVF9ESVIpL3Y4LXFlbXUtd3JhcHBlci5zaCcsCi0gICAgICAgICAg
ICAgJzwobm9kZV9qczJjX2V4ZWMpJywKLSAgICAgICAgICAgICAnPEAobGlicmFyeV9maWxlcykn
LAotICAgICAgICAgICAgICc8QChkZXBzX2ZpbGVzKScsCi1AQCAtOTQ0LDYgKzk0NSw3IEBACi0g
ICAgICAgICAgICAgJzwoU0hBUkVEX0lOVEVSTUVESUFURV9ESVIpL25vZGVfamF2YXNjcmlwdC5j
YycsCi0gICAgICAgICAgIF0sCi0gICAgICAgICAgICdhY3Rpb24nOiBbCi0rICAgICAgICAgICAg
JzwoUFJPRFVDVF9ESVIpL3Y4LXFlbXUtd3JhcHBlci5zaCcsCi0gICAgICAgICAgICAgJzwobm9k
ZV9qczJjX2V4ZWMpJywKLSAgICAgICAgICAgICAnPEAoX291dHB1dHMpJywKLSAgICAgICAgICAg
ICAnbGliJywKLQotZGlmZiAtLWdpdCBhL3Rvb2xzL3Y4X2d5cGZpbGVzL3Y4Lmd5cCBiL3Rvb2xz
L3Y4X2d5cGZpbGVzL3Y4Lmd5cAotaW5kZXggNDJlMjZjZDkuLmJjNzIxOTkxIDEwMDY0NAotLS0t
IGEvdG9vbHMvdjhfZ3lwZmlsZXMvdjguZ3lwCi0rKysgYi90b29scy92OF9neXBmaWxlcy92OC5n
eXAKLUBAIC02OCw2ICs2OCw3IEBACi0gICAgICAgICB7Ci0gICAgICAgICAgICdhY3Rpb25fbmFt
ZSc6ICdydW5fdG9ycXVlX2FjdGlvbicsCi0gICAgICAgICAgICdpbnB1dHMnOiBbICAjIE9yZGVy
IG1hdHRlcnMuCi0rICAgICAgICAgICAgJzwoUFJPRFVDVF9ESVIpL3Y4LXFlbXUtd3JhcHBlci5z
aCcsCi0gICAgICAgICAgICAgJzwoUFJPRFVDVF9ESVIpLzwoRVhFQ1VUQUJMRV9QUkVGSVgpdG9y
cXVlPChFWEVDVVRBQkxFX1NVRkZJWCknLAotICAgICAgICAgICAgICc8QCh0b3JxdWVfZmlsZXMp
JywKLSAgICAgICAgICAgXSwKLUBAIC05OSw2ICsxMDAsNyBAQAotICAgICAgICAgICAgICc8QCh0
b3JxdWVfb3V0cHV0c19pbmMpJywKLSAgICAgICAgICAgXSwKLSAgICAgICAgICAgJ2FjdGlvbic6
IFsKLSsgICAgICAgICAgICAnPChQUk9EVUNUX0RJUikvdjgtcWVtdS13cmFwcGVyLnNoJywKLSAg
ICAgICAgICAgICAnPChQUk9EVUNUX0RJUikvPChFWEVDVVRBQkxFX1BSRUZJWCl0b3JxdWU8KEVY
RUNVVEFCTEVfU1VGRklYKScsCi0gICAgICAgICAgICAgJy1vJywgJzwoU0hBUkVEX0lOVEVSTUVE
SUFURV9ESVIpL3RvcnF1ZS1nZW5lcmF0ZWQnLAotICAgICAgICAgICAgICctdjgtcm9vdCcsICc8
KFY4X1JPT1QpJywKLUBAIC0yMTEsNiArMjEzLDcgQEAKLSAgICAgICAgIHsKLSAgICAgICAgICAg
J2FjdGlvbl9uYW1lJzogJ2dlbmVyYXRlX2J5dGVjb2RlX2J1aWx0aW5zX2xpc3RfYWN0aW9uJywK
LSAgICAgICAgICAgJ2lucHV0cyc6IFsKLSsgICAgICAgICAgICAnPChQUk9EVUNUX0RJUikvdjgt
cWVtdS13cmFwcGVyLnNoJywKLSAgICAgICAgICAgICAnPChQUk9EVUNUX0RJUikvPChFWEVDVVRB
QkxFX1BSRUZJWClieXRlY29kZV9idWlsdGluc19saXN0X2dlbmVyYXRvcjwoRVhFQ1VUQUJMRV9T
VUZGSVgpJywKLSAgICAgICAgICAgXSwKLSAgICAgICAgICAgJ291dHB1dHMnOiBbCi1AQCAtNDAw
LDYgKzQwMyw3IEBACi0gICAgICAgICAgICAgXSwKLSAgICAgICAgICAgfSwKLSAgICAgICAgICAg
J2lucHV0cyc6IFsKLSsgICAgICAgICAgICAnPChQUk9EVUNUX0RJUikvdjgtcWVtdS13cmFwcGVy
LnNoJywKLSAgICAgICAgICAgICAnPChta3NuYXBzaG90X2V4ZWMpJywKLSAgICAgICAgICAgXSwK
LSAgICAgICAgICAgJ291dHB1dHMnOiBbCi1AQCAtMTUzOSw2ICsxNTQzLDcgQEAKLSAgICAgICAg
IHsKLSAgICAgICAgICAgJ2FjdGlvbl9uYW1lJzogJ3J1bl9nZW4tcmVnZXhwLXNwZWNpYWwtY2Fz
ZV9hY3Rpb24nLAotICAgICAgICAgICAnaW5wdXRzJzogWwotKyAgICAgICAgICAgICc8KFBST0RV
Q1RfRElSKS92OC1xZW11LXdyYXBwZXIuc2gnLAotICAgICAgICAgICAgICc8KFBST0RVQ1RfRElS
KS88KEVYRUNVVEFCTEVfUFJFRklYKWdlbi1yZWdleHAtc3BlY2lhbC1jYXNlPChFWEVDVVRBQkxF
X1NVRkZJWCknLAotICAgICAgICAgICBdLAotICAgICAgICAgICAnb3V0cHV0cyc6IFsKLS0tIAot
Mi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9k
ZWpzXzIwLjguMS5iYiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9kZWpzXzIx
LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDY5JQpyZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMt
ZGV2dG9vbHMvbm9kZWpzL25vZGVqc18yMC44LjEuYmIKcmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBl
cy1kZXZ0b29scy9ub2RlanMvbm9kZWpzXzIxLjEuMC5iYgppbmRleCA2NWY0ZWIzZjMuLmVlMzFm
ODgyNCAxMDA2NDQKLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL25vZGVqcy9ub2RlanNf
MjAuOC4xLmJiCisrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9ub2RlanMvbm9kZWpzXzIx
LjEuMC5iYgpAQCAtMSw3ICsxLDYyIEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gTElDRU5TRQor
IyArKysgTElDRU5TRQorIyBAQCAtNzgsMTkgKzc4LDMwIEBACisjICAKKyMgIC0gYy1hcmVzLCBs
b2NhdGVkIGF0IGRlcHMvY2FyZXMsIGlzIGxpY2Vuc2VkIGFzIGZvbGxvd3M6CisjICAgICIiIgor
IyAtICAgIENvcHlyaWdodCAoYykgMjAwNyAtIDIwMTgsIERhbmllbCBTdGVuYmVyZyB3aXRoIG1h
bnkgY29udHJpYnV0b3JzLCBzZWUgQVVUSE9SUworIyArICAgIE1JVCBMaWNlbnNlCisjICsKKyMg
KyAgICBDb3B5cmlnaHQgKGMpIDE5OTggTWFzc2FjaHVzZXR0cyBJbnN0aXR1dGUgb2YgVGVjaG5v
bG9neQorIyArICAgIENvcHlyaWdodCAoYykgMjAwNyAtIDIwMjMgRGFuaWVsIFN0ZW5iZXJnIHdp
dGggbWFueSBjb250cmlidXRvcnMsIHNlZSBBVVRIT1JTCisjICAgICAgZmlsZS4KKyMgIAorIyAt
ICAgIENvcHlyaWdodCAxOTk4IGJ5IHRoZSBNYXNzYWNodXNldHRzIEluc3RpdHV0ZSBvZiBUZWNo
bm9sb2d5LgorIyAtCisjIC0gICAgUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgYW5k
IGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBhbmQgaXRzCisjIC0gICAgZG9jdW1lbnRhdGlvbiBm
b3IgYW55IHB1cnBvc2UgYW5kIHdpdGhvdXQgZmVlIGlzIGhlcmVieSBncmFudGVkLCBwcm92aWRl
ZCB0aGF0CisjIC0gICAgdGhlIGFib3ZlIGNvcHlyaWdodCBub3RpY2UgYXBwZWFyIGluIGFsbCBj
b3BpZXMgYW5kIHRoYXQgYm90aCB0aGF0IGNvcHlyaWdodAorIyAtICAgIG5vdGljZSBhbmQgdGhp
cyBwZXJtaXNzaW9uIG5vdGljZSBhcHBlYXIgaW4gc3VwcG9ydGluZyBkb2N1bWVudGF0aW9uLCBh
bmQgdGhhdAorIyAtICAgIHRoZSBuYW1lIG9mIE0uSS5ULiBub3QgYmUgdXNlZCBpbiBhZHZlcnRp
c2luZyBvciBwdWJsaWNpdHkgcGVydGFpbmluZyB0bworIyAtICAgIGRpc3RyaWJ1dGlvbiBvZiB0
aGUgc29mdHdhcmUgd2l0aG91dCBzcGVjaWZpYywgd3JpdHRlbiBwcmlvciBwZXJtaXNzaW9uLgor
IyAtICAgIE0uSS5ULiBtYWtlcyBubyByZXByZXNlbnRhdGlvbnMgYWJvdXQgdGhlIHN1aXRhYmls
aXR5IG9mIHRoaXMgc29mdHdhcmUgZm9yIGFueQorIyAtICAgIHB1cnBvc2UuICBJdCBpcyBwcm92
aWRlZCAiYXMgaXMiIHdpdGhvdXQgZXhwcmVzcyBvciBpbXBsaWVkIHdhcnJhbnR5LgorIyArICAg
IFBlcm1pc3Npb24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVy
c29uIG9idGFpbmluZyBhIGNvcHkgb2YKKyMgKyAgICB0aGlzIHNvZnR3YXJlIGFuZCBhc3NvY2lh
dGVkIGRvY3VtZW50YXRpb24gZmlsZXMgKHRoZSAiU29mdHdhcmUiKSwgdG8gZGVhbCBpbgorIyAr
ICAgIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBs
aW1pdGF0aW9uIHRoZSByaWdodHMgdG8KKyMgKyAgICB1c2UsIGNvcHksIG1vZGlmeSwgbWVyZ2Us
IHB1Ymxpc2gsIGRpc3RyaWJ1dGUsIHN1YmxpY2Vuc2UsIGFuZC9vciBzZWxsIGNvcGllcyBvZgor
IyArICAgIHRoZSBTb2Z0d2FyZSwgYW5kIHRvIHBlcm1pdCBwZXJzb25zIHRvIHdob20gdGhlIFNv
ZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywKKyMgKyAgICBzdWJqZWN0IHRvIHRoZSBmb2xs
b3dpbmcgY29uZGl0aW9uczoKKyMgKworIyArICAgIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNl
IGFuZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIChpbmNsdWRpbmcgdGhlIG5leHQKKyMgKyAgICBw
YXJhZ3JhcGgpIHNoYWxsIGJlIGluY2x1ZGVkIGluIGFsbCBjb3BpZXMgb3Igc3Vic3RhbnRpYWwg
cG9ydGlvbnMgb2YgdGhlCisjICsgICAgU29mdHdhcmUuCisjICsKKyMgKyAgICBUSEUgU09GVFdB
UkUgSVMgUFJPVklERUQgIkFTIElTIiwgV0lUSE9VVCBXQVJSQU5UWSBPRiBBTlkgS0lORCwgRVhQ
UkVTUyBPUgorIyArICAgIElNUExJRUQsIElOQ0xVRElORyBCVVQgTk9UIExJTUlURUQgVE8gVEhF
IFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZLAorIyArICAgIEZJVE5FU1MgRk9SIEEgUEFS
VElDVUxBUiBQVVJQT1NFIEFORCBOT05JTkZSSU5HRU1FTlQuIElOIE5PIEVWRU5UIFNIQUxMIFRI
RQorIyArICAgIEFVVEhPUlMgT1IgQ09QWVJJR0hUIEhPTERFUlMgQkUgTElBQkxFIEZPUiBBTlkg
Q0xBSU0sIERBTUFHRVMgT1IgT1RIRVIKKyMgKyAgICBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4g
QUNUSU9OIE9GIENPTlRSQUNULCBUT1JUIE9SIE9USEVSV0lTRSwgQVJJU0lORyBGUk9NLAorIyAr
ICAgIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0Ug
T1IgT1RIRVIgREVBTElOR1MgSU4gVEhFCisjICsgICAgU09GVFdBUkUuCisjICAgICIiIgorIyAg
CisjICAtIGNqcy1tb2R1bGUtbGV4ZXIsIGxvY2F0ZWQgYXQgZGVwcy9janMtbW9kdWxlLWxleGVy
LCBpcyBsaWNlbnNlZCBhcyBmb2xsb3dzOgorIyAKKyMKKwogREVTQ1JJUFRJT04gPSAibm9kZUpT
IEV2ZW50ZWQgSS9PIGZvciBWOCBKYXZhU2NyaXB0IgogSE9NRVBBR0UgPSAiaHR0cDovL25vZGVq
cy5vcmciCiBMSUNFTlNFID0gIk1JVCAmIElTQyAmIEJTRC0yLUNsYXVzZSAmIEJTRC0zLUNsYXVz
ZSAmIEFydGlzdGljLTIuMCAmIEFwYWNoZS0yLjAiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT0xNjI1OTVhNGEyZjM0NTNhMDUzNGU2MGIwYWZlNGU3YiIKK0xJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWNlMDk1YjVjYWU3NzFiMTE4NzgxOTBlYWVh
ODE4ZDU5IgogCiBDVkVfUFJPRFVDVCA9ICJub2RlanMgbm9kZS5qcyIKIApAQCAtMzgsNyArOTMs
NyBAQCBTUkNfVVJJOmFwcGVuZDp0b29sY2hhaW4tY2xhbmc6eDg2ID0gIiBcCiBTUkNfVVJJOmFw
cGVuZDp0b29sY2hhaW4tY2xhbmc6cG93ZXJwYzY0bGUgPSAiIFwKICAgICAgICAgICAgZmlsZTov
LzAwMDEtcHBjNjQtRG8tbm90LXVzZS1tbWluaW1hbC10b2Mtd2l0aC1jbGFuZy5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmNzk5YzY2ZjZhNjM4NmJiOGFjMmM3
NWEzNzhmNzQwYzQ1NWU5N2YxZmU5NjQzOTNkZDM5YzlmOWY2ZWZiYzcwIgorU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjkxYWM3MmU0NDQ0YzVlNWFiNGI0NDgwMzBhNjFmZmE5NWFjZDM1ZDM0YTlkMzFk
MmQyMjBlZTJiZWQwMWI5MjUiCiAKIFMgPSAiJHtXT1JLRElSfS9ub2RlLXYke1BWfSIKIAotLSAK
Mi4zOS4yCgo=

--===============3037851029444902916==--

