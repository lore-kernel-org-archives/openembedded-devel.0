Return-Path: <twoerner@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 415326FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 04:21:13 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id n202so5581845qke.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 21:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=xnCZf6lCoHMGItaEQgEaDRv077YNzLlNCi3TO39jd7M=;
	b=AcUWxz8iuC8GM8fkEKQdD4f5KG1Mmglu9yO03v3178Rt9JgHtCqwXjjtwMMEW/ibTO
	5ObNd6x8C/SXCuRuck9oG8Kf0rjIycGH/rQsu614aaX7pC/G0OogZq85+HUsvlE1Za57
	J8/yRY/g5fgj8Q6ev37sm6ZYUn6UWsk1nanYLiQHPFvWYj/I0D+x9cxsiDNGM3w1QAYH
	a5meyiFQfDroXQ8SFMF1r0YwCSv7ToUYDcmoTLqcL2XrfqFKoDbK7yo8o1NtPLlxzTUZ
	I27wkbbaWfvnnGYrGbIwFw8AOe/ppdZ8fK6mCXbwC1K7BOUiU4a+LO5ANsEe0Ln5JM7W
	AB6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=xnCZf6lCoHMGItaEQgEaDRv077YNzLlNCi3TO39jd7M=;
	b=CpY2gChsVJB/atj/Lv/LBz9JzBwyLNvz6aVxuESGnChbPuGdr4mTvpw+lDxFvLI5nK
	zgc9O7fJ0xUTC/YGJ99X/p0ifSYlUKXRF44aCBJJUR36FeYtjecXOoo4DQcdMaFPGUye
	mlPpxMY+y45NlvpXug+wEw+bR5gvihG/17LdSuY3A99+spZQqlQ9Pck3SZpkAbaE60vy
	vXm72IDp/6uB6NASi8zPShOwEhFS5YN/qDnZvZu0WlQ2+UofRkeBzHXi1wiZ9iduKqhP
	kHlgjsJJx70L8cD3gUyqxY1Ck/wX8woZYYgg19ep2M0Cj/oti0y5Qtly5+8Drcw+getO
	ujaw==
X-Gm-Message-State: ALyK8tLXLkrb1Q+peBtj5lGJCpjOlHmxuluNDq9I8SqhBufd47tr7tK9rYD3SuiVABV1jQ==
X-Received: by 10.233.216.2 with SMTP id u2mr35130818qkf.203.1469074873838;
	Wed, 20 Jul 2016 21:21:13 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	b132sm3342006qkg.8.2016.07.20.21.21.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jul 2016 21:21:13 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Jul 2016 00:21:31 -0400
Message-Id: <20160721042134.14806-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <20160721042134.14806-1-twoerner@gmail.com>
References: <20160721042134.14806-1-twoerner@gmail.com>
Subject: [meta-browser][PATCH v2 1/4] chromium: remove unused patch
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
X-List-Received-Date: Thu, 21 Jul 2016 04:21:14 -0000

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


