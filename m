Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 03FF878F78
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 15:09:24 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id q129-v6so13780061ywg.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 08:09:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SWqjev6GhCGwCWVcyC5DRQNeo9WpIuF5Y1EpmIsUgy8=;
	b=H10Uo2JoDPrfVgw0c6LbxiRlum9xiqXbazi1s9vvetibTLD6vs9wOYp8oga8SEgBUS
	CGDrshApmyucpttSSzpzENCXRgVIqw9TufAv0qmabDQYPPTt8iGnW/IZAUh1PcTigguR
	0QPl6AwzySkbsoecuS/Vck16UkpVQxa4Xooj/jHWLuQzR/iiu11vBKVNJIRRumlA0ZI5
	p9KwNBu6PeD6SGf0v4Bd0lZ2Deo7Jd65KMFOxtwYsEYmAlEkHuOTomGML3RoLqE+5ch2
	29YuenGCp39+IIDe2AexFzZwetZuaD/zuOc0qstzhsMZRAHAQDWUBiFrrI3i59BO+TJv
	s3xw==
X-Gm-Message-State: AOUpUlG6T/bVZBF41lJBjnp69LnMBZHyuPi6KJXLXauqGuivin/I3BiJ
	qqZ7gIZBX2LhxL8P4X7YsJKJwxNq
X-Google-Smtp-Source: AA+uWPxYnmiAcP2bKxl99Q2KenlBYyr6UWavdICbS+7573VDmdWNKNSBN4W5D820yMB+MoF8iKzwjw==
X-Received: by 2002:a25:a549:: with SMTP id
	h67-v6mr4881990ybi.377.1534172965696; 
	Mon, 13 Aug 2018 08:09:25 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	x19-v6sm8064106ywg.72.2018.08.13.08.09.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 08:09:25 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 16:09:18 +0100
Message-Id: <20180813150918.26582-3-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813150918.26582-1-git@andred.net>
References: <20180813150918.26582-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH v2 2/2] openjdk-build-helper: move c compiler flags retrieval to here (from openjdk-8)
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
X-List-Received-Date: Mon, 13 Aug 2018 15:09:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Icedtea 7 and OpenJDK 7 will need to apply new compiler flags for certain
compiler version without breaking support for older (host) compilers.

Move here so that the same code can be re-used.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 classes/openjdk-build-helper.bbclass      | 35 ++++++++++++++++++
 recipes-core/openjdk/openjdk-8-common.inc | 45 ++---------------------
 2 files changed, 39 insertions(+), 41 deletions(-)

diff --git a/classes/openjdk-build-helper.bbclass b/classes/openjdk-build-helper.bbclass
index 785ddf0..78906b0 100644
--- a/classes/openjdk-build-helper.bbclass
+++ b/classes/openjdk-build-helper.bbclass
@@ -14,3 +14,38 @@ def openjdk_build_helper_get_parallel_make(d):
         return 1
 
     return pm.partition('-j')[2].strip().split(' ')[0]
+
+# All supported cross compilers support the compiler flags that were
+# added to make compilation with gcc6 work. But the host compiler for
+# native compilation is a different story: it may be too old (for example,
+# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
+# version is and only add the flags that are appropriate for that GCC
+# version.
+def openjdk_build_helper_get_cflags_by_cc_version(d, version):
+    if version.isdigit():
+        return d.getVar('FLAGS_GCC%d' % int(version)) or ''
+    return ''
+
+def openjdk_build_helper_get_build_cflags(d):
+    def get_build_cc_version(build_cc):
+        from subprocess import Popen, PIPE
+        cmd = d.expand('%s -dumpversion' % build_cc).split()
+        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
+        return cc.communicate()[0].decode('utf-8')[0]
+
+    build_cc = d.getVar('BUILD_CC')
+    version = get_build_cc_version(build_cc)
+    return openjdk_build_helper_get_cflags_by_cc_version(d, version)
+
+def openjdk_build_helper_get_target_cflags(d):
+    import re
+
+    # in the cross case, trust that GCCVERSION is correct. This won't
+    # work if the native toolchain is Clang, but as of this writing that
+    # doesn't work anyway.
+    version = d.getVar('GCCVERSION')[0]
+    # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
+    match = re.search("\d", version)
+    if match:
+        version = version[match.start():]
+    return openjdk_build_helper_get_cflags_by_cc_version(d, version)
diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 97bf6e1..d0f7540 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -219,46 +219,9 @@ FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 FLAGS_GCC8 = "-fno-lifetime-dse -fno-delete-null-pointer-checks -Wno-error=return-type"
 
-# All supported cross compilers support the compiler flags that were
-# added to make compilation with gcc6 work. But the host compiler for
-# native compilation is a different story: it may be too old (for example,
-# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
-# version is and only add the flags that are appropriate for that GCC
-# version.
-
-def get_cflags_by_cc_version(d, version):
-    if version.isdigit():
-        return d.getVar('FLAGS_GCC%d' % int(version)) or ''
-    return ''
-
-def get_build_cflags(d):
-    def get_build_cc_version(build_cc):
-        from subprocess import Popen, PIPE
-        cmd = d.expand('%s -dumpversion' % build_cc).split()
-        cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
-        return cc.communicate()[0].decode('utf-8')[0]
-
-    build_cc = d.getVar('BUILD_CC')
-    version = get_build_cc_version(build_cc)
-    return get_cflags_by_cc_version(d, version)
-
-def get_target_cflags(d):
-    import re
-
-    # in the cross case, trust that GCCVERSION is correct. This won't
-    # work if the native toolchain is Clang, but as of this writing that
-    # doesn't work anyway.
-    version = d.getVar('GCCVERSION')[0]
-    # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
-    match = re.search("\d", version)
-    if match:
-        version = version[match.start():]
-    return get_cflags_by_cc_version(d, version)
-
-
 # flags for -native, and for bits that need a host-tool during -cross
-BUILD_CFLAGS_append = " ${@get_build_cflags(d)}"
-BUILD_CXXFLAGS_append = " ${@get_build_cflags(d)}"
+BUILD_CFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
+BUILD_CXXFLAGS_append = " ${@openjdk_build_helper_get_build_cflags(d)}"
 # flags for -cross
-TARGET_CFLAGS_append = " ${@get_target_cflags(d)}"
-TARGET_CXXFLAGS_append = " ${@get_target_cflags(d)}"
+TARGET_CFLAGS_append = " ${@openjdk_build_helper_get_target_cflags(d)}"
+TARGET_CXXFLAGS_append = " ${@openjdk_build_helper_get_target_cflags(d)}"
-- 
2.18.0


