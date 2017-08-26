Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0DE4377B99
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 18:35:31 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id r133so11808462pgr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Aug 2017 11:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=WW7mc4aJ2qIPMxsR22JcIeACAeqTJ9YD0UM6txBmEWs=;
	b=JKtnRbOQjpdtskliqT4NJRvwRSEp9YR5j1YxbHhu3IiqMDODSqqS2GjomzgVSCtNfx
	N9C9/aAPVicQLAS+tVIGtqH61MRD83VI52v+wxJRcbOJQq4GmC0NrRDnHVezoKWGJ4jt
	Cl16Wq3ftKC0ogWrHPMzpKiV9hW5spg9sLa/uVR6I1GITLOOOvOtsX2atN+Uskka0WIV
	PHy36nDZkk966D6tPNpT0QVsGoS3s+aGUsRnFJTB2aCclx4sCtzhFmzSqBA2qLaDueML
	Z6N1/GVQh1NIyLVaszhNBz2fGun05UXT87HEzHEwDfUfqJJPr6qAmB6+5e9nZgH/FdXu
	SZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=WW7mc4aJ2qIPMxsR22JcIeACAeqTJ9YD0UM6txBmEWs=;
	b=kQTV4D85Nnr5fnE3iR14tsP/PRaMUkIQusjOi52CrnD5q1HWyhKj/8bZFRheARYlv/
	b2KwfTvPrWhWBa/H+ZEC9BIErc/hoAozICzT3nt5yTYynJX3RfEo6PH9cBvz8BTJ8sA8
	xVlLV1ALzVM6CNLXoh7iNZWvt4Jn1M+88PVXsKlgKPntN1M+6SOt+q+ZSqhFFS03WWD7
	IW+dh1go6C8ASxTy8Qo8ygeHQ8AxykpvgtQTYsvakAGP7lSU68XvYFHZXX3d1nnEDZij
	+vmoL1wTMgCgXtsCoQC5bRnmVuhylmzhbSQ7QFn1w3f8021LjNNJoa31GUSa78Rb26//
	PuXA==
X-Gm-Message-State: AHYfb5ilnKB0Wn5dAmNXbcdmqMuO4pkbb4Jpr9cJ5RMfcP5HeQgn0OYL
	4zYTgMUfZK40AN5P
X-Received: by 10.98.58.89 with SMTP id h86mr2492580pfa.102.1503772533133;
	Sat, 26 Aug 2017 11:35:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	m2sm15240546pgs.72.2017.08.26.11.35.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 26 Aug 2017 11:35:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 26 Aug 2017 11:35:18 -0700
Message-Id: <20170826183521.34294-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170826183521.34294-1-raj.khem@gmail.com>
References: <20170826183521.34294-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/7] glmark2: Fix build with clang
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
X-List-Received-Date: Sat, 26 Aug 2017 18:35:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../glmark2/files/0001-Fix-clang-warnings.patch    | 31 ++++++++++++++++++++++
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb   |  9 ++++---
 2 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch

diff --git a/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch
new file mode 100644
index 000000000..cdf09faec
--- /dev/null
+++ b/meta-oe/recipes-benchmark/glmark2/files/0001-Fix-clang-warnings.patch
@@ -0,0 +1,31 @@
+From 35e9f80518d666db5f9c62e8072ffbc307b4af4f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 08:30:01 -0700
+Subject: [PATCH] Fix clang warnings
+
+../src/native-state-drm.cpp:334:20: error: cannot pass object of non-trivial type 'std::__cxx11::basic_string<char>' through variadic function; call will abort at runtime [-Wnon-pod-varargs]
+                   dev_path);
+                   ^
+1 error generated.
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/native-state-drm.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/native-state-drm.cpp b/src/native-state-drm.cpp
+index dc2b323..62566ee 100644
+--- a/src/native-state-drm.cpp
++++ b/src/native-state-drm.cpp
+@@ -331,7 +331,7 @@ static int open_using_udev_scan()
+     if (!valid_fd(fd)) {
+         // %m is GLIBC specific... Maybe use strerror here...
+         Log::error("Tried to use '%s' but failed.\nReason : %m",
+-                   dev_path);
++                   dev_path.c_str());
+     }
+     else
+         Log::debug("Success!\n");
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index 4c5e0567b..d3766d916 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -15,10 +15,11 @@ PV = "2017.07+${SRCPV}"
 COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
 
 SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https \
-    file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
-    file://Fix-configure-for-sqrt-check.patch \
-"
-SRCREV = "182dcbffe5c8483eadff025b429ee1aacc69c6c2"
+           file://build-Check-packages-to-be-used-by-the-enabled-flavo.patch \
+           file://Fix-configure-for-sqrt-check.patch \
+           file://0001-Fix-clang-warnings.patch \
+           "
+SRCREV = "ed20c633f1926d1dd78e3e89043c85a81302cbe6"
 
 S = "${WORKDIR}/git"
 
-- 
2.14.1


