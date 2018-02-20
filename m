Return-Path: <andrej.valek@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id DD29578824
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 11:08:27 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id w1KB8RIu010258
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Feb 2018 12:08:27 +0100
Received: from dev.vm6.ccp.siemens.com (sk1d124c.siemens.sk [163.242.57.217])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id w1KB8RWQ029147;
	Tue, 20 Feb 2018 12:08:27 +0100
Received: from dev.vm6.ccp.siemens.com (localhost [127.0.0.1])
	by dev.vm6.ccp.siemens.com (Postfix) with ESMTP id 69E409D9EF5;
	Tue, 20 Feb 2018 12:08:27 +0100 (CET)
From: Andrej Valek <andrej.valek@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Feb 2018 12:08:13 +0100
Message-Id: <20180220110813.2952-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.11.0
Cc: Radovan Scasny <radovan.scasny@siemens.com>
Subject: [meta-oe][PATCH] fix(p7zip): fix CVE-2017-17969
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
X-List-Received-Date: Tue, 20 Feb 2018 11:08:28 -0000

From: Radovan Scasny <radovan.scasny@siemens.com>

Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../p7zip/files/CVE-2017-17969.patch               | 31 ++++++++++++++++++++++
 meta-oe/recipes-extended/p7zip/p7zip_16.02.bb      |  3 ++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch

diff --git a/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch b/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
new file mode 100644
index 000000000..177d1455f
--- /dev/null
+++ b/meta-oe/recipes-extended/p7zip/files/CVE-2017-17969.patch
@@ -0,0 +1,31 @@
+p7zip: Fix CVE-2017-17969
+
+[No upstream tracking] -- https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=888297
+
+Heap-based buffer overflow in 7zip
+
+Compress/ShrinkDecoder.cpp: Heap-based buffer overflow
+in the NCompress::NShrink::CDecoder::CodeReal method
+in 7-Zip before 18.00 and p7zip allows remote attackers
+to cause a denial of service (out-of-bounds write)
+or potentially execute arbitrary code via a crafted ZIP archive. 
+
+Upstream-Status: Backport [https://sourceforge.net/p/p7zip/bugs/_discuss/thread/0920f369/8316/attachment/CVE-2017-17969.patch]
+CVE: CVE-2017-17969
+Signed-off-by: Radovan Scasny <radovan.scasny@siemens.com>
+
+--- a/CPP/7zip/Compress/ShrinkDecoder.cpp
++++ b/CPP/7zip/Compress/ShrinkDecoder.cpp
+@@ -121,7 +121,12 @@ HRESULT CDecoder::CodeReal(ISequentialInStream *inStream, ISequentialOutStream *
+     {
+       _stack[i++] = _suffixes[cur];
+       cur = _parents[cur];
++	  if (cur >= kNumItems || i >= kNumItems)
++	  	break;
+     }
++	
++	if (cur >= kNumItems || i >= kNumItems)
++		break;
+     
+     _stack[i++] = (Byte)cur;
+     lastChar2 = (Byte)cur;
diff --git a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
index 67ffbc67c..edf47f7bc 100644
--- a/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
+++ b/meta-oe/recipes-extended/p7zip/p7zip_16.02.bb
@@ -6,7 +6,8 @@ LIC_FILES_CHKSUM = "file://DOC/copying.txt;md5=4fbd65380cdd255951079008b364516c
                     file://DOC/License.txt;md5=879598edf1f54dddb6930d7581357f8b"
 
 SRC_URI = "http://downloads.sourceforge.net/p7zip/p7zip/${PV}/p7zip_${PV}_src_all.tar.bz2 \
-          file://do_not_override_compiler_and_do_not_strip.patch"
+          file://do_not_override_compiler_and_do_not_strip.patch \
+          file://CVE-2017-17969.patch"
 
 SRC_URI[md5sum] = "a0128d661cfe7cc8c121e73519c54fbf"
 SRC_URI[sha256sum] = "5eb20ac0e2944f6cb9c2d51dd6c4518941c185347d4089ea89087ffdd6e2341f"
-- 
2.11.0


