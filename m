Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9212E7316D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 21:08:23 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i6so6628936pfe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jul 2016 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=nQa4sDPRsBEcDYE7+aR5C9C3ZmqkRgDGrEsAK1rqtFk=;
	b=Y1F3V5M30qTJ5Vp5Y3UraWoLsy88xv0VCtwMhlD4bJYm88jF65o//F7/kp4LoFi2y0
	XN4lF7gvwO7D03G8Iz5f5P5Hcl6FHUvn4El3YPNvr9jVVhBeDasqpHa2KK1cTEOsuVdo
	xyJq8k1bTtF6bh1Y4TlK9mphMaPCNwewLLQ2xfHVE25XL7qSf73c4YJgpBKKe6ERCZDe
	tjQvCV1Z9qbcRjS3MCBXkrI0JZfvavz4hQWxF5zS2QVnSS9aPU/75nZuGswIWIss2s+Z
	3PVKBzEZk4Ic0GAc7PJrPJ1C6bidQ4sOGZNhBHvOMBNxAYS+uRAWsInLCLJWqUsYSUqi
	123Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nQa4sDPRsBEcDYE7+aR5C9C3ZmqkRgDGrEsAK1rqtFk=;
	b=dYWudC35u6S33SbN3lOQ/0EMEqG6h2jw1XYzJNPxj8AexKvN7vsxYVgnKeRPnOt6L2
	L1HS5u2O0ipCyM87qEkrkfhcpyaHocoeHYqWRllHZT0dLXbeNOFwMhf5Hx0YrHYn0ZdC
	TOfrdiBmgGSkThY3kBkzpmCQUaqYxK3QBLMi/aF9PAJRS13bhzamWGUfbcV2Z3e2kEBq
	x7HppgFrE6eEFNyG3i2Y6wUh6NDyirmnzImFrwvbZ7m78OeZHFk1yyJuhg4URmYBq89Z
	3NsoGViUo0t84cW7BTwuKcs7q4KvVN++u0xT1zO13OAygrrwEBgEuZ7Yijlic/35sw5/
	2CCw==
X-Gm-Message-State: ALyK8tJfJkm/cwebGLXwUW6so78Typi80jwRdZfVhS4SSnC2UUbk/44rDHGp3IqFnZgGkQ==
X-Received: by 10.98.6.132 with SMTP id 126mr24857887pfg.109.1468616903683;
	Fri, 15 Jul 2016 14:08:23 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	s12sm4543036pfj.57.2016.07.15.14.08.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jul 2016 14:08:23 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Jul 2016 15:08:20 -0600
Message-Id: <20160715210820.6801-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.9.1
Subject: [meta-java][PATCH] openjdk-8: Detect compiler version
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
X-List-Received-Date: Fri, 15 Jul 2016 21:08:25 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Some supported hosts still use GCC 4.X. These don't support the flags
needed to make GCC 6 work, so check the GCC version and add appropriate
compiler flags.

This implementation will append flags for any gcc version, but it's only
used for GCC 6 right now.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 41 +++++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index dd3d397..acc5481 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -237,6 +237,43 @@ EXTRA_OECONF_append = "\
         --with-update-version=${OPENJDK_UPDATE_VERSION} \
 "
 
-CFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
-CXXFLAGS_append = " -fno-lifetime-dse -fno-delete-null-pointer-checks"
+# GCC 6 sets the default C++ standard to C++14 and introduces dead store
+# elimination by default. OpenJDK 8 is not ready for either of these
+# changes.
+FLAGS_GCC6 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
+
+# All supported cross compilers support the compiler flags that were
+# added to make compilation with gcc6 work. But the host compiler for
+# native compilation is a different story: it may be too old (for example,
+# gcc 4.9.2 on Debian Wheezy). In that case we need to check what the
+# version is and only add the flags that are appropriate for that GCC
+# version.
+
+def version_specific_cflags(d):
+    extraflags = None
+    version = None
+
+    if bb.data.inherits_class('native', d):
+        from subprocess import Popen, PIPE
+
+        cmd = d.expand('${CPP} -P -').split()
+        cc = Popen(cmd, stdin=PIPE, stdout=PIPE, stderr=PIPE)
+        # This check is GCC specific. Clang always returns 4. For Clang
+        # __clang_major__ and __clang_minor__ need to be checked. Ideally
+        # __GNUC_MINOR__ would be checked as well, but for this recipe
+        # GCC major is all we care about.
+        version = cc.communicate(b'__GNUC__')[0].decode('utf-8')[0]
+    else:
+        # in the cross case, trust that GCCVERSION is correct. This won't
+        # work if the native toolchain is Clang, but as of this writing that
+        # doesn't work anyway.
+        version = d.getVar('GCCVERSION', expand=True)[0]
+
+    if int(version) >= 4:
+        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True)
+
+    return ''.join(extraflags)
+
+CFLAGS_append = " ${@version_specific_cflags(d)}"
+CXXFLAGS_append = " ${@version_specific_cflags(d)}"
 CXX_append = " -std=gnu++98"
-- 
2.9.1


