Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3F31E78889
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Jan 2018 03:25:04 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id 36so167097ple.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jan 2018 19:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=h0E358ZbzVmba2tQEE5E5suAFoMzVj4oZ5HgcA5amcE=;
	b=sAkOU12tlRKh/Afb7NtT39sBvGUTH5yxOJsFLidJn+eVxlphZ8bEypzxbgPOZbTb3A
	qjz1A/8DVqvuoeOLCVqrChdL96D0UxGdM/LNxcTc1Gz1JWvqlMxthJ6qDS6JbqNVZZdT
	MIlK3h2ZuekkZFrDbXBZE1Tn7c0L3tX8muSO/T8waeQrcdM71lSgQv0b+IjJdFf8919J
	AkszexA+crQ0Rqfn9P+7ceX7TfMLL3RslJwvUylYNM5pNsJpZ6aiukHv+rk4AJl/9Dzu
	GTS498vuCjNGdHhOH/Q8ntTosM/473dkkQhVqPPJ4P237Kp6MDmxVJ+tvcRZoqzifS8j
	AB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=h0E358ZbzVmba2tQEE5E5suAFoMzVj4oZ5HgcA5amcE=;
	b=cbV2SKPYjCtW/JtPlEeubfKNzN++hfevfm+Z1UAE3kMGaLtgqXf8nE+wIKTT/X+/OM
	JjFpre+iqXDtQodMKg8w0Y0b9SXuyoD72SThp8yRuN7c+lbx2ajQxtVlDsl0gY50TBJZ
	mUSd2Hj4Guhd6FV3S+M6EFNwpz0dXhvvBA/5IeZxNm4SWEvuXjivqCJm1Jv0lG4pO9wz
	t46w0VbEC+LlQLQm1ujUlkIIGj9dLMuu6tQhLS7J4J5mqj25c33Kz8cqNEL67hiRjyy9
	DbGpgzYePxeUJC7VE2PTE6JBjgoqrWcpWoOyQX/jz5UJqD1I3Rz45pRIeElBuivbdgCh
	yTOQ==
X-Gm-Message-State: AKwxytfN4Sx3wz4mijkJaXrUo8IwOWrzhxcDTFm7RSwVeA4gC8t6fJqP
	fs8v0hY7j+NMumjlAfogiXXvFA==
X-Google-Smtp-Source: AH8x226M1IVlorOZUsOqubu1hJEuQG5DJaSwzi1Oz7p02wO6IJQF6d0bXsbvn9dIN/XTLRozx3M71w==
X-Received: by 2002:a17:902:5902:: with SMTP id
	o2-v6mr15826626pli.79.1517023506524; 
	Fri, 26 Jan 2018 19:25:06 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:2999:2a82:b9b6:e74c])
	by smtp.gmail.com with ESMTPSA id
	v22sm6692206pfa.158.2018.01.26.19.25.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Jan 2018 19:25:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Fri, 26 Jan 2018 19:24:28 -0800
Message-Id: <ef80cfd67b022bafa241cd774666b45082bf7e47.1517023286.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1517023286.git.akuster808@gmail.com>
References: <cover.1517023286.git.akuster808@gmail.com>
Subject: [PATCH 28/36] open-isns: Fix build with musl
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
X-List-Received-Date: Sat, 27 Jan 2018 03:25:05 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
(cherry picked from commit 43d2d966b957886bc54d7f15e6632211c41114c3)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ....h-endian.h-is-available-on-musl-on-linux.patch | 38 ++++++++++++++++++++++
 .../recipes-support/open-isns/open-isns_0.97.bb    |  6 ++--
 2 files changed, 41 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch

diff --git a/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
new file mode 100644
index 0000000..825e2bf
--- /dev/null
+++ b/meta-networking/recipes-support/open-isns/open-isns/0001-util.h-endian.h-is-available-on-musl-on-linux.patch
@@ -0,0 +1,38 @@
+From e0d86318227a23f00cf0f6639a6685bb9f5771a1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Dec 2017 09:42:19 -0800
+Subject: [PATCH] util.h: endian.h is available on musl on linux
+
+just checking for glibc alone is not enough since
+it excludes musl, therefore check for platform
+being linux as well
+
+Fixes build issues
+
+include/libisns/util.h:114:12: fatal error: sys/endian.h: No such file or directory
+ #  include <sys/endian.h>
+            ^~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ include/libisns/util.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/libisns/util.h b/include/libisns/util.h
+index 9a2bd13..6cc1a1b 100644
+--- a/include/libisns/util.h
++++ b/include/libisns/util.h
+@@ -100,7 +100,7 @@ enum {
+  * There's no htonll yet
+  */
+ #ifndef htonll
+-# ifdef __GLIBC__
++# if defined(__GLIBC__) || defined(__linux__)
+ #  include <endian.h>
+ #  include <byteswap.h>
+ #  if __BYTE_ORDER == __BIG_ENDIAN
+-- 
+2.15.1
+
diff --git a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
index 420ef5b..cc2959e 100644
--- a/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
+++ b/meta-networking/recipes-support/open-isns/open-isns_0.97.bb
@@ -13,9 +13,9 @@ SECTION = "net"
 
 DEPENDS = "openssl systemd"
 
-SRC_URI = " \
-    git://github.com/open-iscsi/open-isns \
-"
+SRC_URI = "git://github.com/open-iscsi/open-isns \
+           file://0001-util.h-endian.h-is-available-on-musl-on-linux.patch \
+           "
 
 SRCREV ?= "09954404e948e41eb0fce8e28836018b4ce3d20d"
 
-- 
2.7.4


