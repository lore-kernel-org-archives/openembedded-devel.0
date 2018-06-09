Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1246E75299
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Jun 2018 06:44:17 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id c23-v6so9461245plz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jun 2018 23:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=THDxxKzMu0QiOrY1mDo5MIlrGBASNNLAfOfVdakZG2E=;
	b=pv90uuTHMM7Tna63pm2Vq1P1YvcFB8matJNEZTdR3fBVF3JQ4ISeyvbSw9CiXaq/n6
	Ip3AVW/VjSh4C9XhGU0A+jWTn2VJQ4owZ/gRBYRrJybi5vHnKFBMg45D9iaq8kkVb/Tx
	N9fTYisRUyEbPXf+8rVd+qBFs6DcenPlJC+V82pKhAFPVgiGGqayYaRA6k/DtiE6nfQi
	ZPC/3G0X6ZX/JVvccPomm3NpG1KrPAFysHE2YWQa8lqVF/KBaC8rIpvFhbymS4gMJ3Fy
	ZS41nrMNWgMDwzI1OwhTyT2ljRYUecPLjZjiVFc3GupEJobIYzcOAhVFD2SCBgQ3Oupm
	MFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=THDxxKzMu0QiOrY1mDo5MIlrGBASNNLAfOfVdakZG2E=;
	b=KSqrFdMRllj1hGkvFUVsfGyHc5ohkksKeZomM2tRAAOR72L0E8E/YNR9+CMby6KyTy
	bGeE9IIZX55YJVWus0dRgZVASjMVhBT1pVSjtNpPvRjXKaD8e967k5eiu1ZMpoQn5OVT
	VoRbFEVcqQXbBG5n4qqE6E0zqR1ftdJ11Rq8YSGdLIpRWpObn4Pls+lU5ExZyTvp5vrH
	ZXy7oMCk8432/9chpDL26honBBemojSTu2PBgSdhDgZLtV9oQNA0BB12ZOPgdSDvpymX
	CcdbrIyMyTSrYIo1icH8KdV1HXowZVRQy6zELq9bzeoa4ffBP+FyWlp4aUq1jh2I5xuC
	TY8Q==
X-Gm-Message-State: APt69E1NSkChgkSb89FZYdIwl3wBFKofcku96GpTzkWAMbRZ8O7gAC2N
	W7ZNWyRGjNY4B35WjEJN40OZNA==
X-Google-Smtp-Source: ADUXVKK9ItR8vlV5ytnBwFdcHowO2LLeZumlHvmlK5UM2/k3DmvjI7VEcYEKEncSmChP9hitsLIJ6g==
X-Received: by 2002:a17:902:8604:: with SMTP id
	f4-v6mr9745702plo.4.1528526658748; 
	Fri, 08 Jun 2018 23:44:18 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c67-v6sm26926352pfj.173.2018.06.08.23.44.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 23:44:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Jun 2018 23:44:13 -0700
Message-Id: <20180609064415.10270-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180609064415.10270-1-raj.khem@gmail.com>
References: <20180609064415.10270-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 4/6] rdma-core: Fix build with musl
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
X-List-Received-Date: Sat, 09 Jun 2018 06:44:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...IFSOCK-is-defined-in-both-glibc-musl.patch | 29 +++++++++++++++++++
 ...igh.c-Do-not-include-net-if_packet.h.patch | 26 +++++++++++++++++
 .../recipes-support/rdma-core/rdma-core_18.bb |  5 +++-
 3 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
new file mode 100644
index 0000000000..b04c9b7230
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
@@ -0,0 +1,29 @@
+From f2df1db11f3a9580774300e703b6f53dbcdb28ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jun 2018 20:17:57 -0700
+Subject: [PATCH] S_IFSOCK is defined in both glibc/musl
+
+Fixes
+
+preload.c:1183:46: error: '__S_IFSOCK' undeclared (first use in this function); did you mean 'S_IFSOCK'?
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librdmacm/preload.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/librdmacm/preload.c b/librdmacm/preload.c
+index 0f2aa250..d46beb1b 100644
+--- a/librdmacm/preload.c
++++ b/librdmacm/preload.c
+@@ -1180,7 +1180,7 @@ int __fxstat(int ver, int socket, struct stat *buf)
+ 	if (fd_get(socket, &fd) == fd_rsocket) {
+ 		ret = real.fxstat(ver, socket, buf);
+ 		if (!ret)
+-			buf->st_mode = (buf->st_mode & ~S_IFMT) | __S_IFSOCK;
++			buf->st_mode = (buf->st_mode & ~S_IFMT) | S_IFSOCK;
+ 	} else {
+ 		ret = real.fxstat(ver, fd, buf);
+ 	}
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch
new file mode 100644
index 0000000000..e887f222b0
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch
@@ -0,0 +1,26 @@
+From 82486f7e1ee2aa07a5c12cb357834993aa8c1d20 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jun 2018 20:19:13 -0700
+Subject: [PATCH] neigh.c: Do not include net/if_packet.h
+
+This header is glibc specific
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libibverbs/neigh.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libibverbs/neigh.c b/libibverbs/neigh.c
+index 21177db0..cfc593a0 100644
+--- a/libibverbs/neigh.c
++++ b/libibverbs/neigh.c
+@@ -2,7 +2,6 @@
+  */
+ 
+ #include "config.h"
+-#include <net/if_packet.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <endian.h>
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_18.bb b/meta-networking/recipes-support/rdma-core/rdma-core_18.bb
index bc0f826052..69baf1d3c8 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_18.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_18.bb
@@ -5,7 +5,10 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "bash perl"
 
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http"
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http \
+           file://0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch \
+           file://0002-neigh.c-Do-not-include-net-if_packet.h.patch \
+           "
 SRCREV ="1eee3c837e0290f1ac7e5ac453ed69e8fd927aab"
 S = "${WORKDIR}/git"
 
-- 
2.17.1


