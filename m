Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5DE3771D8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 05:21:28 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id x188so13076400itb.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Apr 2017 22:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=A/007H3gXydtS23wEbyqBhuz8RYX0evYYUGXpXTBXMQ=;
	b=iyacM4+DFVVZQTKgyYgmMYodObY20m3JckGFoWUpMS2FG7WVUfU9GwvushrAHL73UI
	c6MwzJfzF/09UhBfSzX7BvVPtqGDi5gseYcWjrtrQj/dPU0qLe/j8E2wg5IrAiybrfjf
	1r0FjI3kDGZZgl1Ycafbq8tXwZaBVVYBM8JznOZ0CKmygH4W/Tiau6GccMe/BRKbREHB
	/wCpSWPaTmF9NUQBs2XVHgGR106ZjLsN5v3lx+cm9MhX64h9jlvNKqAkxXrUjrBWNBRK
	wlIjdcpT/Th7HyuwFlA1S0rGYKAGJWw0ObjtyWK4NzD08cxpKNRWnNzEaA/3RZmruSPz
	q7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=A/007H3gXydtS23wEbyqBhuz8RYX0evYYUGXpXTBXMQ=;
	b=toY2YeqcUcmwym6fwNFGMzLh0IXP8+e4VZAUtdkPLnFN+G8/eEDzYwTafiww5ZK5+k
	qTvp/wDzKkox1Qs+q3MIQ1ZgRqK6C60lExbhmwXpIvdeFd3UzZAboD7PPMNylY/HTGdQ
	gE4m0vY81wzNXdwk/UXOP5Gq4wgdh/mQr0gW9Rv3JVpUhiYdmKkQEZo72t37p/5ryA2P
	Y2Lpb3+WiSPTLPzzMUYbkohFoeJpvN6eHiAhflN+oH0yb14EGb2pKLAzqTHkE5AwzTya
	2wXPkrsELz2l1/wDbAMxL7vG7i67wJAZPH7Jeugbm2R9iNztg8jm1aSQLesK88QPCV4G
	Z0HA==
X-Gm-Message-State: AN3rC/5si32rI5EsoxjssDh1Iy51Vf30v4qPzXGv50aoyHPfV0XhxrO0
	+yY9iTKo1sVYA6OD
X-Received: by 10.84.130.36 with SMTP id 33mr30450854plc.111.1493011289568;
	Sun, 23 Apr 2017 22:21:29 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	v13sm24001176pgo.44.2017.04.23.22.21.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Apr 2017 22:21:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Apr 2017 22:20:52 -0700
Message-Id: <20170424052058.4952-11-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170424052058.4952-1-raj.khem@gmail.com>
References: <20170424052058.4952-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 11/17] lowpan-tools: Fix build with gcc7
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
X-List-Received-Date: Mon, 24 Apr 2017 05:21:28 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Remove-newline-from-format-line.patch     | 32 ++++++++++++++++++++++
 .../lowpan-tools/lowpan-tools_git.bb               |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch

diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
new file mode 100644
index 000000000..1453b75d5
--- /dev/null
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools/0001-Remove-newline-from-format-line.patch
@@ -0,0 +1,32 @@
+From a36afac485745cf980fba1809526f2025cb4d101 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 23 Apr 2017 00:16:45 -0700
+Subject: [PATCH] Remove newline from format line
+
+Fixes
+
+error: '__builtin___snprintf_chk' output truncated before the last format character [-Werror=format-truncation=]
+     "%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n",
+                                               ^
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ addrdb/addrdb.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/addrdb/addrdb.c b/addrdb/addrdb.c
+index 4bb7f79..05d53f3 100644
+--- a/addrdb/addrdb.c
++++ b/addrdb/addrdb.c
+@@ -178,7 +178,7 @@ int addrdb_dump_leases(const char *lease_file)
+ 			continue;
+ 		}
+ 		snprintf(hwaddr_buf, sizeof(hwaddr_buf),
+-				"%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x\n",
++				"%02x:%02x:%02x:%02x:%02x:%02x:%02x:%02x",
+ 				lease->hwaddr[0], lease->hwaddr[1],
+ 				lease->hwaddr[2], lease->hwaddr[3],
+ 				lease->hwaddr[4], lease->hwaddr[5],
+-- 
+2.12.2
+
diff --git a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
index 0dcc6a785..be73f8ae4 100644
--- a/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
+++ b/meta-networking/recipes-support/lowpan-tools/lowpan-tools_git.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://git.code.sf.net/p/linux-zigbee/linux-zigbee \
            file://0001-Fix-build-errors-with-clang.patch \
            file://0001-addrdb-coord-config-parse.y-add-missing-time.h-inclu.patch \
            file://0001-src-iz.c-Undef-dprintf-before-redefining.patch \
+           file://0001-Remove-newline-from-format-line.patch \
            "
 SRCREV = "38f42dbfce9e13629263db3bd3b81f14c69bb733"
 
-- 
2.12.2


