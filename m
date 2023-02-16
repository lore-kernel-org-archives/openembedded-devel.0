Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7612C64EC4
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 12:28:19 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web10.8637.1676550491685357921
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Feb 2023 04:28:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ToaKCAlv;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: akuster808@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id d13so1098450qvj.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 04:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ZgTdxUTBCJkG2/FwCIehX21lnymIzL4wLtsKpFD8eY=;
        b=ToaKCAlv1TWnO9o/B93SGXL4D/HW/XOoYgz9zykaPCH7jzfu3FMTGestENaitGVtdy
         tSpmdjcWVBVFhf3U8whjYFTjBYLfpgMIF+aDgpO0KI4GNWt6xnGukHtX5vHkCk8fS+sM
         VvcWpntrJJgcv3v6AawlDnEwriuKfvzB8DT2bB4V0eAVtCG4/YBhw87ChxMnXZbA1XF9
         Vw4O1a7dcQuWM98bKJpYU+fCQEVtVDMn/DGZl/LEBSjUavfsjYLUWeOTFOkPwlqV2mL5
         7Z5mRdhim81SOPoYbOU6Nl6rXE9hQF63D90zBJJ6Z4+K1jzIaaMhuriTiTZ25Rdy9Kmi
         q/gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ZgTdxUTBCJkG2/FwCIehX21lnymIzL4wLtsKpFD8eY=;
        b=FqTRRC/Y+HhaDWq6mMCLmd1t+Q/uJZJPfnyVtTmJEm7t+QAX5dHT58z89M7YZGj2TT
         6eh5eJ2Zl5z/eYYfiWPR1CRvrU6u7Dl2G/CKsbA0OUr50lmlTEMJSx16C49XfZDpYWsl
         OxEepk8qUr5Dy2GTWcnTV5DFGIx/Z32fG3ILSnY792fyB+GXxLzw67oOrlS/X7+629dr
         TM2KtBDr1lPzqq6tJsEHkZuXXtngWtZzo7bhJGFw/G+dDad7or4PYQQPUcUgV58w6kgD
         oLKvfBZ0jHpPFQBIovjOqM3eaUOnt7fakHWzDq4duqnc66+0M/TgM49Eje5hIZwTrNPz
         vrcA==
X-Gm-Message-State: AO0yUKWcHcBzD7voPcZBjbs/RzhDgIUblJXjD6QMj2nz2i2cOAaX9491
	gutoJ7oUJpnZqoOIZF/2NsTWb+bYHjM=
X-Google-Smtp-Source: AK7set9hpOX0YCk7sqEACxv1jBt76efT6Z5Clc/3HGOSX+aYwD6WPixujo2DIlRoxEj/ZnVY3bGR4g==
X-Received: by 2002:a05:6214:dae:b0:56e:a6bb:47ae with SMTP id h14-20020a0562140dae00b0056ea6bb47aemr11098845qvh.12.1676550490364;
        Thu, 16 Feb 2023 04:28:10 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:2ead:d6b6:b6e2:9e85])
        by smtp.gmail.com with ESMTPSA id t127-20020a379185000000b0073b4d9e2e8dsm1102362qkd.43.2023.02.16.04.28.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 04:28:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [langdale 15/15] mdns: use git fetcher
Date: Thu, 16 Feb 2023 07:27:25 -0500
Message-Id: <30f4c2b3ae182513b967185e06bc8409a0ee6092.1676550369.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676550369.git.akuster808@gmail.com>
References: <cover.1676550369.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Feb 2023 12:28:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101117

From: Martin Jansa <Martin.Jansa@gmail.com>

* https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz
  is just redirect to unsafe github archives which are regenerated from time to
  time.

* We do have src-uri-bad QA check which prevents to use github archives in SRC_URI
  since 2019:
  https://github.com/openembedded/openembedded-core/commit/21f84fcdd659544437fe393285c407e1e9432043
  but this cannot catch such redirects, see:

$ wget https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-878.30.4.tar.gz
--2023-01-31 10:06:02--  https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-878.30.4.tar.gz
Resolving opensource.apple.com (opensource.apple.com)... 17.253.73.203, 17.253.73.206, 2a01:b740:a26:f000::5, ...
Connecting to opensource.apple.com (opensource.apple.com)|17.253.73.203|:443... connected.
HTTP request sent, awaiting response... 302 Redirect
Location: https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-878.30.4.tar.gz [following]
--2023-01-31 10:06:02--  https://github.com/apple-oss-distributions/mDNSResponder/archive/refs/tags/mDNSResponder-878.30.4.tar.gz
Resolving github.com (github.com)... 140.82.121.3
Connecting to github.com (github.com)|140.82.121.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/apple-oss-distributions/mDNSResponder/tar.gz/refs/tags/mDNSResponder-878.30.4 [following]
--2023-01-31 10:06:02--  https://codeload.github.com/apple-oss-distributions/mDNSResponder/tar.gz/refs/tags/mDNSResponder-878.30.4
Resolving codeload.github.com (codeload.github.com)... 140.82.121.10
Connecting to codeload.github.com (codeload.github.com)|140.82.121.10|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: ?mDNSResponder-878.30.4.tar.gz?

* The tarball was regenerated recently as discussed in:
  https://github.com/orgs/community/discussions/45830

* Use top-level directory in S to fix DEBUG_PREFIX_MAP usage
  like the version in master does, the only exception here is that
  there still was top-level Makefile (which fails to set VER with:
  Makefile:26: *** missing separator.  Stop.
  so use the simple one like newer version in master)
* it's already included in master as part of version upgrade in:
  https://github.com/openembedded/meta-openembedded/commit/ec96eb577bd518b89e2e7834bd569ba269df458f

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...utine-for-cleaning-recent-interfaces.patch |   0
 .../0001-dns-sd-Include-missing-headers.patch |   0
 .../0001-mdns-include-stddef.h-for-NULL.patch |   0
 ...outine-for-tearing-down-an-interface.patch |   0
 ...-cross-compilation-fixes-for-bitbake.patch |   0
 .../0003-Track-interface-socket-family.patch  |   0
 ...0004-Use-list-for-changed-interfaces.patch |   0
 .../0006-Remove-unneeded-function.patch       |   0
 .../0006-make-Add-top-level-Makefile.patch    | 175 ++++++++++++++++++
 ...-deleted-interfaces-as-being-changed.patch |   0
 .../0009-Fix-possible-NULL-dereference.patch  |   0
 ...0010-Handle-errors-from-socket-calls.patch |   0
 ...ic-allocation-to-file-scope-variable.patch |   0
 .../mdns/{files => mdns}/mdns.service         |   0
 .../recipes-protocols/mdns/mdns_1310.140.1.bb |  44 +++--
 15 files changed, 203 insertions(+), 16 deletions(-)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-Create-subroutine-for-cleaning-recent-interfaces.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-dns-sd-Include-missing-headers.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0001-mdns-include-stddef.h-for-NULL.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0002-Create-subroutine-for-tearing-down-an-interface.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0002-mdns-cross-compilation-fixes-for-bitbake.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0003-Track-interface-socket-family.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0004-Use-list-for-changed-interfaces.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0006-Remove-unneeded-function.patch (100%)
 create mode 100644 meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0008-Mark-deleted-interfaces-as-being-changed.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0009-Fix-possible-NULL-dereference.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0010-Handle-errors-from-socket-calls.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch (100%)
 rename meta-networking/recipes-protocols/mdns/{files => mdns}/mdns.service (100%)

diff --git a/meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0001-Create-subroutine-for-cleaning-recent-interfaces.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0001-dns-sd-Include-missing-headers.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0001-dns-sd-Include-missing-headers.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch b/meta-networking/recipes-protocols/mdns/mdns/0001-mdns-include-stddef.h-for-NULL.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0001-mdns-include-stddef.h-for-NULL.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0001-mdns-include-stddef.h-for-NULL.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0002-Create-subroutine-for-tearing-down-an-interface.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0002-Create-subroutine-for-tearing-down-an-interface.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch b/meta-networking/recipes-protocols/mdns/mdns/0002-mdns-cross-compilation-fixes-for-bitbake.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0002-mdns-cross-compilation-fixes-for-bitbake.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0002-mdns-cross-compilation-fixes-for-bitbake.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch b/meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0003-Track-interface-socket-family.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0003-Track-interface-socket-family.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch b/meta-networking/recipes-protocols/mdns/mdns/0004-Use-list-for-changed-interfaces.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0004-Use-list-for-changed-interfaces.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0004-Use-list-for-changed-interfaces.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-Remove-unneeded-function.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0006-Remove-unneeded-function.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0006-Remove-unneeded-function.patch
diff --git a/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
new file mode 100644
index 0000000000..b7d9ad5bba
--- /dev/null
+++ b/meta-networking/recipes-protocols/mdns/mdns/0006-make-Add-top-level-Makefile.patch
@@ -0,0 +1,175 @@
+From 177abf68e5ac5f82c6261af63528f8b6160bca0f Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Tue, 6 Dec 2022 13:28:31 +0000
+Subject: [PATCH] make: Add top-level Makefile
+
+Simple top level Makefile that just delegates to mDNSPosix.
+
+Upstream-Status: Inappropriate [oe-specific]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ Makefile | 154 +------------------------------------------------------
+ 1 file changed, 2 insertions(+), 152 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 8b6fa77..feb6ac6 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,152 +1,2 @@
+-#
+-# Copyright (c) 2003-2018 Apple Inc. All rights reserved.
+-#
+-# Top level makefile for Build & Integration (B&I).
+-# 
+-# This file is used to facilitate checking the mDNSResponder project directly from git and submitting to B&I at Apple.
+-#
+-# The various platform directories contain makefiles or projects specific to that platform.
+-#
+-#    B&I builds must respect the following target:
+-#         install:
+-#         installsrc:
+-#         installhdrs:
+-#         installapi:
+-#         clean:
+-#
+-
+-include $(MAKEFILEPATH)/pb_makefiles/platform.make
+-
+-MVERS = "mDNSResponder-1310.140.1"
+-
+-VER =
+-ifneq ($(strip $(GCC_VERSION)),)
+-	VER = -- GCC_VERSION=$(GCC_VERSION)
+-endif
+-echo "VER = $(VER)"
+-
+-projectdir	:= $(SRCROOT)/mDNSMacOSX
+-buildsettings	:= OBJROOT=$(OBJROOT) SYMROOT=$(SYMROOT) DSTROOT=$(DSTROOT) MVERS=$(MVERS) SDKROOT=$(SDKROOT)
+-
+-.PHONY: install installSome installEmpty installExtras SystemLibraries installhdrs installapi installsrc java clean
+-
+-# Sanitizer support
+-# Disable Sanitizer instrumentation in LibSystem contributors. See rdar://problem/29952210.
+-UNSUPPORTED_SANITIZER_PROJECTS := mDNSResponderSystemLibraries mDNSResponderSystemLibraries_Sim
+-PROJECT_SUPPORTS_SANITIZERS := 1
+-ifneq ($(words $(filter $(UNSUPPORTED_SANITIZER_PROJECTS), $(RC_ProjectName))), 0)
+-  PROJECT_SUPPORTS_SANITIZERS := 0
+-endif
+-ifeq ($(RC_ENABLE_ADDRESS_SANITIZATION),1)
+-  ifeq ($(PROJECT_SUPPORTS_SANITIZERS),1)
+-    $(info Enabling Address Sanitizer)
+-    buildsettings += -enableAddressSanitizer YES
+-  else
+-    $(warning WARNING: Address Sanitizer not supported for project $(RC_ProjectName))
+-  endif
+-endif
+-ifeq ($(RC_ENABLE_THREAD_SANITIZATION),1)
+-  ifeq ($(PROJECT_SUPPORTS_SANITIZERS),1)
+-    $(info Enabling Thread Sanitizer)
+-    buildsettings += -enableThreadSanitizer YES
+-  else
+-    $(warning WARNING: Thread Sanitizer not supported for project $(RC_ProjectName))
+-  endif
+-endif
+-ifeq ($(RC_ENABLE_UNDEFINED_BEHAVIOR_SANITIZATION),1)
+-  ifeq ($(PROJECT_SUPPORTS_SANITIZERS),1)
+-    $(info Enabling Undefined Behavior Sanitizer)
+-    buildsettings += -enableUndefinedBehaviorSanitizer YES
+-  else
+-    $(warning WARNING: Undefined Behavior Sanitizer not supported for project $(RC_ProjectName))
+-  endif
+-endif
+-
+-# B&I install build targets
+-#
+-# For the mDNSResponder build alias, the make target used by B&I depends on the platform:
+-#
+-#	Platform	Make Target
+-#	--------	-----------
+-#	osx		install
+-#	ios		installSome
+-#	atv		installSome
+-#	watch		installSome
+-#
+-# For the mDNSResponderSystemLibraries and mDNSResponderSystemLibraries_sim build aliases, B&I uses the SystemLibraries
+-# target for all platforms.
+-
+-install:
+-ifeq ($(RC_ProjectName), mDNSResponderServices)
+-ifeq ($(RC_PROJECT_COMPILATION_PLATFORM), osx)
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target 'Build Services-macOS' $(VER)
+-else
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target 'Build Services' $(VER)
+-endif
+-else ifeq ($(RC_ProjectName), mDNSResponderServices_Sim)
+-	mkdir -p $(DSTROOT)/AppleInternal
+-else
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) $(VER)
+-endif
+-
+-installSome:
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) $(VER)
+-
+-installEmpty:
+-	mkdir -p $(DSTROOT)/AppleInternal
+-
+-installExtras:
+-ifeq ($(RC_PROJECT_COMPILATION_PLATFORM), osx)
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target 'Build Extras-macOS' $(VER)
+-else ifeq ($(RC_PROJECT_COMPILATION_PLATFORM), ios)
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target 'Build Extras-iOS' $(VER)
+-else ifeq ($(RC_PROJECT_COMPILATION_PLATFORM), atv)
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target 'Build Extras-tvOS' $(VER)
+-else
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target 'Build Extras' $(VER)
+-endif
+-
+-SystemLibraries:
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target SystemLibraries $(VER)
+-
+-# B&I installhdrs build targets
+-
+-installhdrs::
+-ifeq ($(RC_ProjectName), mDNSResponderServices)
+-ifeq ($(RC_PROJECT_COMPILATION_PLATFORM), osx)
+-	cd '$(projectdir)'; xcodebuild installhdrs $(buildsettings) -target 'Build Services-macOS' $(VER)
+-else
+-	cd '$(projectdir)'; xcodebuild installhdrs $(buildsettings) -target 'Build Services' $(VER)
+-endif
+-else ifeq ($(RC_ProjectName), mDNSResponderServices_Sim)
+-	mkdir -p $(DSTROOT)/AppleInternal
+-else ifneq ($(findstring SystemLibraries,$(RC_ProjectName)),)
+-	cd '$(projectdir)'; xcodebuild installhdrs $(buildsettings) -target SystemLibraries $(VER)
+-endif
+-
+-# B&I installapi build targets
+-
+-installapi:
+-ifeq ($(RC_ProjectName), mDNSResponderServices)
+-ifeq ($(RC_PROJECT_COMPILATION_PLATFORM), osx)
+-	cd '$(projectdir)'; xcodebuild installapi $(buildsettings) -target 'Build Services-macOS' $(VER)
+-else
+-	cd '$(projectdir)'; xcodebuild installapi $(buildsettings) -target 'Build Services' $(VER)
+-endif
+-else ifeq ($(RC_ProjectName), mDNSResponderServices_Sim)
+-	mkdir -p $(DSTROOT)/AppleInternal
+-else ifneq ($(findstring SystemLibraries,$(RC_ProjectName)),)
+-	cd '$(projectdir)'; xcodebuild installapi $(buildsettings) -target SystemLibrariesDynamic $(VER)
+-endif
+-
+-# Misc. targets
+-
+-installsrc:
+-	ditto . '$(SRCROOT)'
+-	rm -rf '$(SRCROOT)/mDNSWindows' '$(SRCROOT)/Clients/FirefoxExtension'
+-
+-java:
+-	cd '$(projectdir)'; xcodebuild install $(buildsettings) -target libjdns_sd.jnilib $(VER)
+-
+-clean::
+-	echo clean
++all clean:
++	cd mDNSPosix && $(MAKE) $@
+-- 
+2.38.1
+
diff --git a/meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch b/meta-networking/recipes-protocols/mdns/mdns/0008-Mark-deleted-interfaces-as-being-changed.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0008-Mark-deleted-interfaces-as-being-changed.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0008-Mark-deleted-interfaces-as-being-changed.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch b/meta-networking/recipes-protocols/mdns/mdns/0009-Fix-possible-NULL-dereference.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0009-Fix-possible-NULL-dereference.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0009-Fix-possible-NULL-dereference.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch b/meta-networking/recipes-protocols/mdns/mdns/0010-Handle-errors-from-socket-calls.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0010-Handle-errors-from-socket-calls.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0010-Handle-errors-from-socket-calls.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch b/meta-networking/recipes-protocols/mdns/mdns/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
rename to meta-networking/recipes-protocols/mdns/mdns/0011-Change-a-dynamic-allocation-to-file-scope-variable.patch
diff --git a/meta-networking/recipes-protocols/mdns/files/mdns.service b/meta-networking/recipes-protocols/mdns/mdns/mdns.service
similarity index 100%
rename from meta-networking/recipes-protocols/mdns/files/mdns.service
rename to meta-networking/recipes-protocols/mdns/mdns/mdns.service
diff --git a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
index 205dc929be..65f4847d8f 100644
--- a/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
+++ b/meta-networking/recipes-protocols/mdns/mdns_1310.140.1.bb
@@ -2,28 +2,31 @@ SUMMARY = "Publishes & browses available services on a link according to the Zer
 DESCRIPTION = "Bonjour, also known as zero-configuration networking, enables automatic discovery of computers, devices, and services on IP networks."
 HOMEPAGE = "http://developer.apple.com/networking/bonjour/"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://../LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=31c50371921e0fb731003bbc665f29bf"
 
 DEPENDS:append:libc-musl = " musl-nscd"
 
 RPROVIDES:${PN} += "libdns_sd.so"
 
-SRC_URI = "https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-${PV}.tar.gz \
+# matches annotated tag mDNSResponder-1310.140.1
+SRCREV = "1d1de95b98fba2077d34c9d78b839a96aa0e1c77"
+BRANCH = "rel/mDNSResponder-1310"
+SRC_URI = "git://github.com/apple-oss-distributions/mDNSResponder;protocol=https;branch=${BRANCH} \
            file://mdns.service \
-           file://0001-mdns-include-stddef.h-for-NULL.patch;patchdir=.. \
-           file://0002-mdns-cross-compilation-fixes-for-bitbake.patch;patchdir=.. \
-           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch;patchdir=.. \
-           file://0002-Create-subroutine-for-tearing-down-an-interface.patch;patchdir=.. \
-           file://0003-Track-interface-socket-family.patch;patchdir=.. \
-           file://0004-Use-list-for-changed-interfaces.patch;patchdir=.. \
-           file://0006-Remove-unneeded-function.patch;patchdir=.. \
-           file://0008-Mark-deleted-interfaces-as-being-changed.patch;patchdir=.. \
-           file://0009-Fix-possible-NULL-dereference.patch;patchdir=.. \
-           file://0010-Handle-errors-from-socket-calls.patch;patchdir=.. \
-           file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch;patchdir=.. \
-           file://0001-dns-sd-Include-missing-headers.patch;patchdir=.. \
+           file://0001-mdns-include-stddef.h-for-NULL.patch \
+           file://0002-mdns-cross-compilation-fixes-for-bitbake.patch \
+           file://0001-Create-subroutine-for-cleaning-recent-interfaces.patch \
+           file://0002-Create-subroutine-for-tearing-down-an-interface.patch \
+           file://0003-Track-interface-socket-family.patch \
+           file://0004-Use-list-for-changed-interfaces.patch \
+           file://0006-Remove-unneeded-function.patch \
+           file://0008-Mark-deleted-interfaces-as-being-changed.patch \
+           file://0009-Fix-possible-NULL-dereference.patch \
+           file://0010-Handle-errors-from-socket-calls.patch \
+           file://0011-Change-a-dynamic-allocation-to-file-scope-variable.patch \
+           file://0001-dns-sd-Include-missing-headers.patch \
+           file://0006-make-Add-top-level-Makefile.patch \
            "
-SRC_URI[sha256sum] = "040f6495c18b9f0557bcf9e00cbcfc82b03405f5ba6963dc147730ca0ca90d6f"
 
 CVE_PRODUCT = "apple:mdnsresponder"
 
@@ -42,13 +45,22 @@ CVE_CHECK_IGNORE += "CVE-2007-0613"
 
 PARALLEL_MAKE = ""
 
-S = "${WORKDIR}/mDNSResponder-${PV}/mDNSPosix"
+# We install a stub Makefile in the top directory so that the various checks
+# in base.bbclass pass their tests for a Makefile, this ensures (that amongst
+# other things) the sstate checks will clean the build directory when the
+# task hashes changes.
+#
+# We can't use the approach of setting ${S} to mDNSPosix as we need
+# DEBUG_PREFIX_MAP to cover files which come from the Clients directory too.
+S = "${WORKDIR}/git"
 
 EXTRA_OEMAKE += "os=linux DEBUG=0 'CC=${CC}' 'LD=${CCLD} ${LDFLAGS}'"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_install () {
+    cd mDNSPosix
+
     install -d ${D}${sbindir}
     install -m 0755 build/prod/mdnsd ${D}${sbindir}
 
-- 
2.25.1


