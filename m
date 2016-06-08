Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id B1DFC6FF76
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Jun 2016 13:05:03 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id r5so2871132wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Jun 2016 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=J/7YSqYB7WFM3EyjL0IwmEeETllYItz+X6UlnPtJ3i0=;
	b=K6ayD0iQD3ILHnE2SGo0LrnSh63UMP22LaRM1VgZUZUZtyrWIoyHeeRwmF11qH3v2H
	QF5jLDu8njYtw+nu1GNgWRUCJ+8TpQJd1d6Xi0PplYt2nDM64mzquxUJ91BX7B+A9txf
	oN8CKtziEz8nRoI+Fa14V1XXVYcRsts0llh7jdR0E4Lcw9p2JIWl5MkbJ/jrsgBO4mAe
	RNDUOgHUKybOv+NVPhYWyCEkKlmBL2FzRed8sxuPqGs6zopCQS1muhRFx8KXNZ93XjhF
	6eYMDTcv0VpkJzTw0som/CPlmr8rfJxk9FimgQPqD5cuuIGNSctdxlOLE+VevHN91kLJ
	NhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=J/7YSqYB7WFM3EyjL0IwmEeETllYItz+X6UlnPtJ3i0=;
	b=XcaNTYmrOD0nLmOMY0oS/KLS7lhW/Y9iG14PeQYoL8ak/UwfYdF1gPbSr83UCJSpXX
	qNGhsLMjyTN2DKpv62JIBRukMTTrpSt4nHsJTN3d6zVylQjLfLHg27S983/f2855Y7dT
	TajDZnDOXm35LlMcOGC25kbYmcjtbnUw5iqN8USbmvjklSBqwShtLOg9uW5An/blD4JB
	GTFA7Us+YKeFyEZpf5FGs/lLuj2znZp985PeNatSKcFW3ZM3DAxUE0abAKPkxVagAImy
	8qHl9MvmYUu9qIOvMbRQqnOxOQZYb4fbKigpmYftyF+mHdN8XG6csuwFTY6rsRCO4OJu
	xHBA==
X-Gm-Message-State: ALyK8tJd3owPw+UlznZkFDg7RcoDNFK55SvlL0D6evOVwbamwr3jg/LYQcvXy1tD/G2/iw==
X-Received: by 10.28.93.142 with SMTP id r136mr4704837wmb.70.1465391103492;
	Wed, 08 Jun 2016 06:05:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	f189sm1712000wmf.19.2016.06.08.06.05.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jun 2016 06:05:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Jun 2016 15:05:21 +0200
Message-Id: <20160608130521.2967-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.8.4
Subject: [PATCH] firefox, cef3, chromium: blacklist, fails to build with gcc-6
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
X-List-Received-Date: Wed, 08 Jun 2016 13:05:04 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes-browser/chromium/cef3_280796.bb          |  3 +++
 recipes-browser/chromium/chromium_48.0.2548.0.bb |  5 +++++
 recipes-mozilla/firefox/firefox_38.7.1esr.bb     | 15 +++++++++++++++
 3 files changed, 23 insertions(+)

diff --git a/recipes-browser/chromium/cef3_280796.bb b/recipes-browser/chromium/cef3_280796.bb
index 4bfa783..9917626 100644
--- a/recipes-browser/chromium/cef3_280796.bb
+++ b/recipes-browser/chromium/cef3_280796.bb
@@ -63,3 +63,6 @@ do_qa_configure() {
 do_compile() {
     ninja -C out/${CHROMIUM_BUILD_TYPE} ${PARALLEL_MAKE} cefsimple
 }
+
+# | ../../v8/src/objects.h:8925:36: error: left operand of shift expression '(-8 << 26u)' is negative [-fpermissive]
+PNBLACKLIST[cef3] ?= "BROKEN: fails to build with gcc-6"
diff --git a/recipes-browser/chromium/chromium_48.0.2548.0.bb b/recipes-browser/chromium/chromium_48.0.2548.0.bb
index 976ec51..2a52568 100644
--- a/recipes-browser/chromium/chromium_48.0.2548.0.bb
+++ b/recipes-browser/chromium/chromium_48.0.2548.0.bb
@@ -43,3 +43,8 @@ CHROMIUM_X11_DEPENDS = "xextproto gtk+ libxi libxss"
 CHROMIUM_X11_GYP_DEFINES = ""
 CHROMIUM_WAYLAND_DEPENDS = "wayland libxkbcommon"
 CHROMIUM_WAYLAND_GYP_DEFINES = "use_ash=1 use_aura=1 chromeos=0 use_ozone=1 use_xkbcommon=1"
+
+# | gen/protoc_out/components/enhanced_bookmarks/proto/cluster.pb.cc:257:3: error: this 'if' clause does not guard... [-Werror=misleading-indentation]
+# |    if (!_extensions_.IsInitialized()) return false;  return true;
+# |    ^~
+PNBLACKLIST[chromium] ?= "BROKEN: fails to build with gcc-6"
diff --git a/recipes-mozilla/firefox/firefox_38.7.1esr.bb b/recipes-mozilla/firefox/firefox_38.7.1esr.bb
index eedce55..5f0fc7c 100644
--- a/recipes-mozilla/firefox/firefox_38.7.1esr.bb
+++ b/recipes-mozilla/firefox/firefox_38.7.1esr.bb
@@ -105,3 +105,18 @@ PRIVATE_LIBS += " \
     libssl3.so \
     libsoftokn3.so \
 "
+
+# | i586-oe-linux-gcc  -m32 -march=i586 --sysroot=/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86 -o WebMElement.o -c
+#  -I../../dist/system_wrappers -include /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/config/gcc_hidden.h -DMOZ_GLUE_IN_PROGRAM -DAB_CD=en-US -DNO_NSPR_10_SUPPORT
+#  -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv -I. 
+#  -I../../dist/include   -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nspr -I/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/dist/include/nss   
+#  -I/home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/pixman-1   -fPIC   -include ../../mozilla-config.h -DMOZILLA_CLIENT -MD -MP -MF .deps/WebMElement.o.pp  -Wall -Wdeclaration-after-statement -Wempty-body -Wpointer-to-int-cast -Wsign-compare -Wtype-limits -Wno-unused -Wcast-align -Os -fsigned-char -fno-strict-aliasing -std=gnu99 -fgnu89-inline -fno-strict-aliasing -fno-math-errno -pthread -pipe  -DNDEBUG -DTRIMMED -freorder-blocks -Os -fomit-frame-pointer     /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/media/libmkv/WebMElement.c
+# | In file included from ../../../dist/system_wrappers/stdlib.h:3:0,
+# |                  from ../../../dist/include/mozilla/mozalloc.h:15,
+# |                  from ../../../dist/stl_wrappers/cstdlib:39,
+# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/inc/Main.h:29,
+# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/gfx/graphite2/src/CmapCache.cpp:28,
+# |                  from /home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/firefox/38.7.1esr-r0/mozilla-esr38/firefox-build-dir/gfx/graphite2/src/Unified_cpp_gfx_graphite2_src0.cpp:11:
+# | /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/include/c++/6.1.1/stdlib.h:38:12: error: 'std::abort' has not been declared
+# |  using std::abort;
+PNBLACKLIST[firefox] ?= "BROKEN: fails to build with gcc-6"
-- 
2.8.4


