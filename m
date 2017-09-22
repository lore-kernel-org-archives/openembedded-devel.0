Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id C3CA271ABB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Sep 2017 03:23:25 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i23so3248785pfi.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 20:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XEz1QO55SCkUoslNkE5+M9RdebAe1uz+ji81YlKzbCk=;
	b=HYRQNEyQhMZIE6t5BfNoBQVypWrv+bb5Nihi87WS880DvoBW3ehCIOpOwELkJ4CW+n
	QjDOReJx2rT6vqSGKufBFxITD2EFsgXKema2aLHbDgUsGK2KBOAmS2HhdEP96CN6YZR4
	B3SSgDRSg2jsuJNh/IgB1s0OZj93v7pFXW/3m7yp4Ds34TlOpwZ22gaEk+ZNX3M07wHe
	aU3MQpFDDMPKMdchZiLlVzBqwnqZLJCnPSBLGw54/FAB3oB8TYsrM/YIF0w4jEV3Dv15
	g1NmT3T0/R7yx58EFT2XXHbAiy7zLkNr4hmnxuKWThnYQTb5Gy/n02Q7qkkkbbLKSUog
	FI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XEz1QO55SCkUoslNkE5+M9RdebAe1uz+ji81YlKzbCk=;
	b=OeFGu3djwaft4ebMmGHkfflBpO1IP+SOGk4KxoFkNYC3Egd5FVsfP+nHDVhGgViE1E
	oTPLoXnRLCziDzzT8m8p/RMc0qymJUPxjDgXLla+UkncVsjq5Xq1LXy785VEMuK7hJNr
	EPG66MkF/VO/QrVss8LWjxGlW0i6qNyPTRaGWo4m8s+97HZ4ZnnSQ/TYkg7qPMTLZidW
	YHhGhbh9YUdhZ5W75Qccm3K+rD/xyf2POfTdr39S1ECQsUxCfMaMb08izytayKCUC9sX
	4FIsf6NHbcLAZEX5C7OLlex6MMsLyoANlANF7SA3nWTb0VAIepoLtlMic7xR18K75s21
	DtaA==
X-Gm-Message-State: AHPjjUjYpx/sSm++vkOAPk9UMAEyoIDs5SGmTTZrhvdLi8N1oy2+LkLD
	NwqFgAVK8JkkPNiHsKcWx3rIlQ==
X-Google-Smtp-Source: AOwi7QA8RM5mOcK+6wWl+cbWuDYkF4tGCCeKTBUjpJswhNRRdZ2H2RYYx/vnD6PqRg0Ac842Lz07kg==
X-Received: by 10.84.132.129 with SMTP id e1mr7645031ple.444.1506050606633;
	Thu, 21 Sep 2017 20:23:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::e57f])
	by smtp.gmail.com with ESMTPSA id
	o79sm4517921pfi.108.2017.09.21.20.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Sep 2017 20:23:25 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 Sep 2017 20:23:11 -0700
Message-Id: <20170922032316.18616-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922032316.18616-1-raj.khem@gmail.com>
References: <20170922032316.18616-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/7] openl2tp: Fix build with musl/libtirpc
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
X-List-Received-Date: Fri, 22 Sep 2017 03:23:25 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...api.c-include-rpc-clnt.h-for-resultproc_t.patch | 31 ++++++++++++++++++++++
 .../recipes-protocols/openl2tp/openl2tp_1.8.bb     |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch

diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
new file mode 100644
index 000000000..a11a97ebd
--- /dev/null
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch
@@ -0,0 +1,31 @@
+From 8f299df4dd1ca857e34859c377a29b183c630961 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 21 Sep 2017 13:05:03 -0700
+Subject: [PATCH] l2tp_api.c: include rpc/clnt.h for 'resultproc_t'
+
+Fixes
+
+| /mnt/a/oe/build/tmp/work/mips32r2-bec-linux-musl/openl2tp/1.8-r0/recipe-sysroot/usr/include/tirpc/rpc/pmap_clnt.h:81:12: error: unknown type name 'resultproc_t'; did you mean 'rpcproc_t'?                                                 |             resultproc_t);                                                                                                                                                                                                                  |             ^~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Pending
+
+ l2tp_api.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/l2tp_api.c b/l2tp_api.c
+index f0946fd..f77881c 100644
+--- a/l2tp_api.c
++++ b/l2tp_api.c
+@@ -26,6 +26,7 @@
+ #include <sys/types.h>
+ #include <rpc/types.h>
+ #include <rpc/xdr.h>
++#include <rpc/clnt.h>
+ #include <rpc/pmap_clnt.h>
+ //#include <netinet/in.h>
+ 
+-- 
+2.14.1
+
diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
index 0395199e7..bbde8a337 100644
--- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
+++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
@@ -36,6 +36,7 @@ SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
 SRC_URI_append_libc-musl = "\
            file://0004-Adjust-for-linux-kernel-headers-assumptions-on-glibc.patch \
            file://0002-user-ipv6-structures.patch \
+           file://0001-l2tp_api.c-include-rpc-clnt.h-for-resultproc_t.patch \
            "
 SRC_URI[md5sum] = "e3d08dedfb9e6a9a1e24f6766f6dadd0"
 SRC_URI[sha256sum] = "1c97704d4b963a87fbc0e741668d4530933991515ae9ab0dffd11b5444f4860f"
-- 
2.14.1


