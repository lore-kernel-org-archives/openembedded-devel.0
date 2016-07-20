Return-Path: <twoerner@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id E8CED6212F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:51:38 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id u25so2735183qtb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xnCZf6lCoHMGItaEQgEaDRv077YNzLlNCi3TO39jd7M=;
	b=wOvSpjJsAOe4zKwBDLGrgnkZUq73CaIPmX+wV+jwMXhYIIFDceZVz0d5gyxoHmt9as
	+gdjM9x9GP9/lE6wl3UufSOnXfhvGFXFQlLToMpbZVw96daQ0ExwfMeny2fWQyaVpmjx
	EdC3daDg740jbDkF7lo+9UNruLImvGpRYdxaa229wl+NBbF6PkFV4LWgDyno5u+NIkbt
	2zCtJunwAobxaB3nOo5NNHWk7IFMUUbtVvUI2mkHANyLG1TGh/3JqZiKrMCiaweITob2
	ry52tJKZwjTnU1dO6GrROAMb0deBzClaruQhm40pwJ0Dy6SaxEJ2Up1OG/AGrHzemWQ3
	t5pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xnCZf6lCoHMGItaEQgEaDRv077YNzLlNCi3TO39jd7M=;
	b=VSw9IBG4o5yqYizzvRAoJVx271a30lTEBqVPWB/NS8v2XbaVdaeNzLPb3e8T1kEiI4
	t1mC1bxbSSsgRY8Z7uHvD2NXtOFPV8VmI30Pg0vHWtCMsxn5T3VMG8G9VDPF9Pa+ewNb
	ZioSjzQY3m9G2CLUt0EAN+Ph0GkeoEH+XANE0daNwdeX3Nb3jXgYUr18MTHBQ85C8tnD
	qfP8YcrlR8uYXvoTqWNYnzFYas3YxVFOJMprmbsfVIxyXm/XJPLkxZUmysAoyo+YUhNX
	d3BzoFuLaoHtS97RDrEstxLIiH300rbeQQVDZ7Nt086G3pfb7N5mPGmMowRjHsivybmB
	R4cA==
X-Gm-Message-State: ALyK8tIsFI2tWahVqXDnb2IXSBc9Cv4EGcVqqgK7+07Aka9Mr5rUn/ee7qjppVq4I4IevA==
X-Received: by 10.200.35.44 with SMTP id a41mr50113302qta.25.1469044299215;
	Wed, 20 Jul 2016 12:51:39 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	l1sm2258049qtd.49.2016.07.20.12.51.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 12:51:38 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jul 2016 15:51:58 -0400
Message-Id: <20160720195201.22250-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160720195201.22250-1-twoerner@gmail.com>
References: <20160720195201.22250-1-twoerner@gmail.com>
Subject: [meta-browser][PATCH 1/4] chromium: remove unused patch
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
X-List-Received-Date: Wed, 20 Jul 2016 19:51:39 -0000

The unistd-2 patch was no longer being referenced by the recipe, so remove it.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 recipes-browser/chromium/chromium-browser.inc    |  5 ++---
 recipes-browser/chromium/chromium/unistd-2.patch | 27 ------------------------
 2 files changed, 2 insertions(+), 30 deletions(-)
 delete mode 100644 recipes-browser/chromium/chromium/unistd-2.patch

diff --git a/recipes-browser/chromium/chromium-browser.inc b/recipes-browser/chromium/chromium-browser.inc
index 365f883..c9da1f7 100644
--- a/recipes-browser/chromium/chromium-browser.inc
+++ b/recipes-browser/chromium/chromium-browser.inc
@@ -2,9 +2,8 @@
 # 1) Add patches to SRC_URI. Version specific patches should be contained in a
 #    "chromium-XX" subdirectory, where XX is the major version. There are also
 #    patches that are shared amongst versions but may one day no longer be
-#    needed (like unistd2.patch). These do not belong in such a subdirectory,
-#    but still need to be explicitely be added. Do NOT add ozone-wayland patches
-#    to SRC_URI here!
+#    needed. These do not belong in such a subdirectory, but still need to be
+#    explicitely be added. Do NOT add ozone-wayland patches to SRC_URI here!
 # 2) Add md5sum and sha256sum hashes of the tarball.
 # 3) Add ozone-wayland patches to the OZONE_WAYLAND_EXTRA_PATCHES variable.
 #    The rule with the chromium-XX subdirectory also applies here.
diff --git a/recipes-browser/chromium/chromium/unistd-2.patch b/recipes-browser/chromium/chromium/unistd-2.patch
deleted file mode 100644
index 6b5018b..0000000
--- a/recipes-browser/chromium/chromium/unistd-2.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-diff --git a/chrome/browser/memory_details_linux.cc b/chrome/browser/memory_details_linux.cc
-index bee24ce..299f237 100644
---- a/chrome/browser/memory_details_linux.cc
-+++ b/chrome/browser/memory_details_linux.cc
-@@ -7,6 +7,10 @@
- #include <map>
- #include <set>
- 
-+#if defined(OS_POSIX)
-+#include <unistd.h>
-+#endif
-+
- #include "base/bind.h"
- #include "base/process_util.h"
- #include "base/string_util.h"
-diff --git a/ipc/ipc_channel.h b/ipc/ipc_channel.h
-index 14c375b..345f9eb 100644
---- a/ipc/ipc_channel.h
-+++ b/ipc/ipc_channel.h
-@@ -10,6 +10,7 @@
- 
- #if defined(OS_POSIX)
- #include <sys/types.h>
-+#include <unistd.h>
- #endif
- 
- #include "base/compiler_specific.h"
-- 
2.9.0


