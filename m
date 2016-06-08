Return-Path: <straka.derek@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 714CD6FEFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 18:22:59 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id fg1so1018668pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 11:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=98UkQ8/ccoMmCOlV71L3v8J5KVQWurAC2v9bTDC48GM=;
	b=e4J9huy/nKxsllks3/U9RCu92OZo38OzQkBvWsCYZsZh57HztjFlHbdkuz0ezr2Poh
	hsTYhqYv7Km3N63d3mr3PL2MJr/MSDAWMHL5WPw6Q23C4iwMoeu6xVCOvYR/86t7chws
	/uhsFNIE1313vSIKhpdcJSZS9nIOdIsNVtTlW32eHDlyf8oDRVTnli1s28j7rmLPATsT
	yMjTMjSFJ5ch/ohVfNA+hzWkc/DnO947qEieFRsfmFGLVdwrPkRKlwibVwfIwakV0djm
	1g7sxNRFhHc5hWPu8sHK+2h/axHTxHPf3n3QOojjh2WsbHgJfgu5+24AaQHB1ScQcHzl
	yOsg==
X-Gm-Message-State: ALyK8tJ9aOqwQb4rjo+nkb0iGf9h9+OhvyCbB2r7OmK0rApjyi4ESmGZnab+Verae3p+ZQ==
X-Received: by 10.66.84.164 with SMTP id a4mr7080368paz.90.1465410180292;
	Wed, 08 Jun 2016 11:23:00 -0700 (PDT)
Received: from localhost.localdomain ([192.55.54.58])
	by smtp.gmail.com with ESMTPSA id ql1sm4099037pac.2.2016.06.08.11.22.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 08 Jun 2016 11:22:59 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 14:22:50 -0400
Message-Id: <1465410170-17226-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-oe][PATCH] tcsh: fix the wait definition to support gcc6
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
X-List-Received-Date: Wed, 08 Jun 2016 18:23:01 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch | 11 +++++++++++
 meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb                 | 10 +++++++---
 2 files changed, 18 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch

diff --git a/meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch b/meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch
new file mode 100644
index 0000000..acc2ce9
--- /dev/null
+++ b/meta-oe/recipes-extended/tcsh/files/fix-gcc6-wait-union.patch
@@ -0,0 +1,11 @@
+--- tcsh-6.18.01/sh.proc.c.orig	2016-06-08 16:11:02.902326725 +0000
++++ tcsh-6.18.01/sh.proc.c	2016-06-08 16:38:22.150304901 +0000
+@@ -48,7 +48,7 @@
+ #endif /* aiws */
+ 
+ #if defined(_BSD) || (defined(IRIS4D) && __STDC__) || defined(__lucid) || defined(__linux__) || defined(__GNU__) || defined(__GLIBC__)
+-# if !defined(__ANDROID__)
++# if !defined(__ANDROID__) && !defined(__GLIBC__)
+ #  define BSDWAIT
+ # endif
+ #endif /* _BSD || (IRIS4D && __STDC__) || __lucid || glibc */
diff --git a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
index 1dd4cb5..d7a7fd4 100644
--- a/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
+++ b/meta-oe/recipes-extended/tcsh/tcsh_6.18.01.bb
@@ -10,7 +10,8 @@ SECTION = "base"
 DEPENDS = "ncurses gettext-native"
 SRC_URI = " \
     ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}.orig.tar.gz;name=tarball \
-    ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs \
+    ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-2.diff.gz;name=diffs2 \
+    ${DEBIAN_MIRROR}/main/t/tcsh/tcsh_${PV}-5.diff.gz;name=diffs5 \
     file://01_build.1.patch \
     file://01_build.2.patch \
     file://01_build.3.patch \
@@ -21,11 +22,14 @@ SRC_URI = " \
     file://12_unknown_lscolors.patch \
     file://tcsh-6.17.02-multibyte.patch \
     file://disable-broken-test.patch \
+    file://fix-gcc6-wait-union.patch \
 "
 SRC_URI[tarball.md5sum] = "6eed09dbd4223ab5b6955378450d228a"
 SRC_URI[tarball.sha256sum] = "d81ca27851f3e8545666399b4bcf25433e602a195113b3f7c73886fef84c9fa8"
-SRC_URI[diffs.md5sum] = "ea39b818b624aca49ebf2cd2708d6ff9"
-SRC_URI[diffs.sha256sum] = "95b0c1a339b745c47c5d2f9d02c22a71597462e2e882b51614a9d1f75bd3d16c"
+SRC_URI[diffs2.md5sum] = "ea39b818b624aca49ebf2cd2708d6ff9"
+SRC_URI[diffs2.sha256sum] = "95b0c1a339b745c47c5d2f9d02c22a71597462e2e882b51614a9d1f75bd3d16c"
+SRC_URI[diffs5.md5sum] = "d536c12a02dc48c332cc472b86927319"
+SRC_URI[diffs5.sha256sum] = "7548d64bf996548bfbc13f3e0959fd2e8455f8375381a31da67d79554aabc7af"
 
 inherit autotools
 
-- 
1.9.1


