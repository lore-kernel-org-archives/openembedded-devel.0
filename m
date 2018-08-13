Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id B917478E3A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 10:09:45 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id e23-v6so13125966ywe.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 03:09:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7EiltPzWHXpmOJIDgVR8YyKBHS8paJ1DY6BC11JuDS0=;
	b=CtAp7mhMVnSf0RHzAvqBlvV6yFnWVfmTu1BwO7KuRmETbIGLTqk17pEBQpXLpO2XXl
	FI1YSxtFQ3onY6UUe6hMJTAn78hKRRi4zqoH/ANABHSqB20MIIVmnHN5zwa102AQnb/d
	Codd/m1tnd0Ewnu6ntaqlPbNF/5JKawBWathCMOAGh3rfL5HT2afBfIbZYdz6CVfHV9u
	NjzWo3hRbjixwI4Gsum0SomobWbYpbNY1BtxdcOb2m8a6h1b3/6xNmJot9w0OxauWJQn
	SDbYtYvh4OUNwaC4oWAWBrwHWMOHOgvCoEkhgD6Pt6Ub7of7t7G7wPhskbcU+Fyid1j7
	Zztw==
X-Gm-Message-State: AOUpUlFI+PEvLRqMI8fmN4+0hJ/ta67xJHvELiPwLZy+ZoENHS5emWU0
	Z7IKoc6VdP8sc0+uMwPpu9xcqtXq
X-Google-Smtp-Source: AA+uWPwJ53Pn9MWQnXiiuH/+3ZMpwNK8Tfzk+I5FMRSz7EapoAz2iyP1xLY/EHFCt5pgtj6bP5NvAw==
X-Received: by 2002:a81:6ad6:: with SMTP id
	f205-v6mr8674628ywc.43.1534154986631; 
	Mon, 13 Aug 2018 03:09:46 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i62-v6sm6918738ywb.54.2018.08.13.03.09.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 03:09:46 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Aug 2018 11:09:31 +0100
Message-Id: <20180813100936.23663-5-git@andred.net>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180813100936.23663-1-git@andred.net>
References: <20180813100936.23663-1-git@andred.net>
MIME-Version: 1.0
Subject: [meta-java][PATCH 4/9] openjdk-8: fix infrastructure for version host gcc != cross gcc (again)
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
X-List-Received-Date: Mon, 13 Aug 2018 10:09:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

Building OpenJDK-8 (target) with an older host compiler (gcc < 6) does
not work as the build errors with error messages regarding unrecognized
gcc command line options.

As part of the (cross) build particularly, OpenJDK-8 builds a host tool
(adlc) using the host gcc. We have a patch, openjdk8-fix-adlc-flags.patch,
that tries to make the adlc build use the correct / intended compiler
flags.

This doesn't work right now, as that build still sees compiler flags
intended for / understood by the gcc version used for the actual cross
compile only.

The reason is that while we have infrastructure in place to add compiler
flags based on the compiler version, we add all of them unconditionally to
CFLAGS / CXXFLAGS directly but above patch uses TARGET_CFLAGS /
TARGET_CXXFLAGS to  filter out unwanted BUILD_CFLAGS / BUILD_CXXFLAGS from
CFLAGS / CXXFLAGS, In other words above patch cannot do what it intends to
do and all compiler version specific flags (-fno-lifetime-dse &
-fno-delete-null-pointer-checks) end up in CFLAGS / CXXFLAGS.

So far, this was only affecting people using host gcc < 6, but upcoming
patches adding support for gcc >= 8 will add even more compiler flags that
even gcc < 7 don't support - it's time to finally address this.

We fix the issue by adding the compiler version specific flags to
BUILD_CFLAGS / BUILD_CXXFLAGS and TARGET_CFLAGS / TARGET_CXXFLAGS as
necessary, so that above patch can work as intended.

We now support all necessary combinations:
* -native builds
* -target builds
* host tools built using the native compiler during the -target build

A similar but different patch existed here before as
commit 6801f6d4e19c ("openjdk-8-common: Fix the issue of building
failed adlc on host with gcc < 6") but was reverted subsequently
due to reportedly still(?) having (new?) issues with older compilers.
This patch here is different from the older patch in that it
*doesn't* set the cflags during a python_anonymous() function, and
thus it guarantees deterministic execution order.

This change here was tested to work using host gcc versions 4.8.4 and
6.3.0 and 7.3.0

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 recipes-core/openjdk/openjdk-8-common.inc     | 55 +++++++++++--------
 .../openjdk/openjdk-8-release-16xbyy.inc      |  3 +-
 2 files changed, 33 insertions(+), 25 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index 4e52448..fb97e97 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -224,32 +224,39 @@ FLAGS_GCC7 = "-fno-lifetime-dse -fno-delete-null-pointer-checks"
 # version is and only add the flags that are appropriate for that GCC
 # version.
 
-def version_specific_cflags(d):
-    import re
-
-    extraflags = None
-    version = None
+def get_cflags_by_cc_version(d, version):
+    if version.isdigit():
+        return d.getVar('FLAGS_GCC%d' % int(version)) or ''
+    return ''
 
-    if bb.data.inherits_class('native', d):
+def get_build_cflags(d):
+    def get_build_cc_version(build_cc):
         from subprocess import Popen, PIPE
-
-        cmd = d.expand('${CC} -dumpversion').split()
+        cmd = d.expand('%s -dumpversion' % build_cc).split()
         cc = Popen(cmd, stdout=PIPE, stderr=PIPE)
-        version = cc.communicate()[0].decode('utf-8')[0]
-    else:
-        # in the cross case, trust that GCCVERSION is correct. This won't
-        # work if the native toolchain is Clang, but as of this writing that
-        # doesn't work anyway.
-        version = d.getVar('GCCVERSION', expand=True)[0]
-        # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
-        match = re.search("\d", version)
-        if match:
-            version = version[match.start():]
+        return cc.communicate()[0].decode('utf-8')[0]
 
-    if version.isdigit():
-        extraflags = d.getVar('FLAGS_GCC%d' % int(version), True) or ''
-        return extraflags
-    return ''
+    build_cc = d.getVar('BUILD_CC')
+    version = get_build_cc_version(build_cc)
+    return get_cflags_by_cc_version(d, version)
+
+def get_target_cflags(d):
+    import re
 
-CFLAGS_append = " ${@version_specific_cflags(d)}"
-CXXFLAGS_append = " ${@version_specific_cflags(d)}"
+    # in the cross case, trust that GCCVERSION is correct. This won't
+    # work if the native toolchain is Clang, but as of this writing that
+    # doesn't work anyway.
+    version = d.getVar('GCCVERSION')[0]
+    # skip non digit characters at the beginning, e.g. from "linaro-6.2%"
+    match = re.search("\d", version)
+    if match:
+        version = version[match.start():]
+    return get_cflags_by_cc_version(d, version)
+
+
+# flags for -native, and for bits that need a host-tool during -cross
+BUILD_CFLAGS_append = " ${@get_build_cflags(d)}"
+BUILD_CXXFLAGS_append = " ${@get_build_cflags(d)}"
+# flags for -cross
+TARGET_CFLAGS_append = " ${@get_target_cflags(d)}"
+TARGET_CXXFLAGS_append = " ${@get_target_cflags(d)}"
diff --git a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
index fd95e95..36ce073 100644
--- a/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
+++ b/recipes-core/openjdk/openjdk-8-release-16xbyy.inc
@@ -54,7 +54,8 @@ ARM_INSTRUCTION_SET_armv4t = "ARM"
 
 # readdir_r was deprecated in glibc-2.24. Ignore the error for now
 # NOTE: When updating the recipe, please check if this is still needed
-CFLAGS_append = " -Wno-error=deprecated-declarations"
+BUILD_CFLAGS_append = " -Wno-error=deprecated-declarations"
+TARGET_CFLAGS_append = " -Wno-error=deprecated-declarations"
 
 # Enable zero mode for arm based builds, as normal hotspot fails to build
 PACKAGECONFIG_append_arm = " zero"
-- 
2.18.0


