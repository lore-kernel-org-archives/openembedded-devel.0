Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2549777BF4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:40:25 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id e199so9719375pfh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jul 2017 22:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=T61AK3APPEHccbVG6HcjRwA6bFVs/kGLOzqxyMaBCvA=;
	b=ZIFvUTp1ZoUQoIyGwsQTHzCl9MXWYTblLBBZBrBc8tRu+29D47YFXHKkKWUjEnRogI
	ocIk6BKRCReXTBNczSHd/uQgytHcWjVcQE70tpCsrs2ZNVcndcmU1DNs47o1qKoDt8/L
	Jh0W/IM1xFwaKr30a6GUyoYjaYs1FbPBtqNeLoc5sBbMoAx5M4C94V6Qwuz1KjullByv
	h7vCMt2c5x9Iidn2qI1El8BcIJFreF5kqs8YXQrnoRa1AhduyNwNls5QUZYnUHos9AEs
	dp+z0Fh41RS1BD4qi6eQLAgf4ZGyVXRVX/IKyYFji+QFIWagktrTKx4+LQE4ZvxfsFqb
	cQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=T61AK3APPEHccbVG6HcjRwA6bFVs/kGLOzqxyMaBCvA=;
	b=X3jIXx53ZyDavdhRNuXleQYD4lHrfocFTYSDbrkq8pqnnDCzBWlNPdxx3sk1Eu4lGt
	GRur7f24tZ7V9AYkFAHyedtixnV+dn6Q9v5Xmgvn1Aaz/xM4p4qodgyE8VDBjIyCALaa
	ch/jhFA4GicjpAn4MfYY9+t3qVIDWFveBRK/YaZDk3HbH/wLQH+LlCquP67AQK9AW6f5
	BIsAqftqMwD/7uotkmi7gg7wXpmfcfnVP1jpt2942kNagq/cc6VmpLxzU9vd4qS50vSO
	UJAcYHpufIdz5WRpx3/ghX07qbjKZMWWXmj5xnljXqEL+cVOD/lRWHmDAvklsZNkixo0
	BlDA==
X-Gm-Message-State: AIVw11061sSqZ9lMoVe6RZcfOx7O6rQ04mmka11AD4h8/hpSpd/h3Qbe
	Yuzkd6S8Ztc2/Obj
X-Received: by 10.84.216.28 with SMTP id m28mr13967562pli.275.1500010826983;
	Thu, 13 Jul 2017 22:40:26 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z86sm17519420pfl.40.2017.07.13.22.40.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 22:40:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jul 2017 22:39:57 -0700
Message-Id: <20170714054013.34458-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170714054013.34458-1-raj.khem@gmail.com>
References: <20170714054013.34458-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 02/18] libteam: Upgrade to 1.27
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
X-List-Received-Date: Fri, 14 Jul 2017 05:40:26 -0000

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nclude-sys-select.h-for-fd_set-definition.patch | 28 +++++++++++++++
 ...0002-teamd-Re-adjust-include-header-order.patch | 40 ++++++++++++++++++++++
 .../libteam/{libteam_1.26.bb => libteam_1.27.bb}   |  7 ++--
 3 files changed, 73 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch
 create mode 100644 meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch
 rename meta-oe/recipes-support/libteam/{libteam_1.26.bb => libteam_1.27.bb} (75%)

diff --git a/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch b/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch
new file mode 100644
index 000000000..a4a17ed85
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0001-include-sys-select.h-for-fd_set-definition.patch
@@ -0,0 +1,28 @@
+From 0ab69dc18a2057ff5bf41abcdf2b983b72d5a903 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 15:34:49 -0700
+Subject: [PATCH 1/2] include sys/select.h for fd_set definition
+
+Fixes
+teamnl.c:160:2: error: unknown type name 'fd_set'; did you mean 'fpos_t'?
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ utils/teamnl.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/utils/teamnl.c b/utils/teamnl.c
+index e8de7e2..25129e8 100644
+--- a/utils/teamnl.c
++++ b/utils/teamnl.c
+@@ -24,6 +24,7 @@
+ #include <getopt.h>
+ #include <errno.h>
+ #include <sys/signalfd.h>
++#include <sys/select.h>
+ #include <signal.h>
+ #include <unistd.h>
+ #include <team.h>
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch b/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch
new file mode 100644
index 000000000..beabf63ca
--- /dev/null
+++ b/meta-oe/recipes-support/libteam/libteam/0002-teamd-Re-adjust-include-header-order.patch
@@ -0,0 +1,40 @@
+From a5b945cb3c62a18dcd7047f62707c09076c4e48b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 12 Jul 2017 15:35:51 -0700
+Subject: [PATCH 2/2] teamd: Re-adjust include header order
+
+So it gets the library definition before kernel definition
+
+usr/include/ne
+tinet/if_ether.h:101:8: error: redefinition of 'struct ethhdr'
+ struct ethhdr {
+        ^~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ teamd/teamd_runner_lacp.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/teamd/teamd_runner_lacp.c b/teamd/teamd_runner_lacp.c
+index 9c77fae..8800854 100644
+--- a/teamd/teamd_runner_lacp.c
++++ b/teamd/teamd_runner_lacp.c
+@@ -23,6 +23,7 @@
+ #include <unistd.h>
+ #include <limits.h>
+ #include <sys/ioctl.h>
++#include <net/ethernet.h>
+ #include <linux/if_ether.h>
+ #include <sys/socket.h>
+ #include <linux/netdevice.h>
+@@ -30,7 +31,6 @@
+ #include <errno.h>
+ #include <team.h>
+ #include <private/misc.h>
+-#include <net/ethernet.h>
+ 
+ #include "teamd.h"
+ #include "teamd_config.h"
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb b/meta-oe/recipes-support/libteam/libteam_1.27.bb
similarity index 75%
rename from meta-oe/recipes-support/libteam/libteam_1.26.bb
rename to meta-oe/recipes-support/libteam/libteam_1.27.bb
index 2cb9e8f3f..32227009e 100644
--- a/meta-oe/recipes-support/libteam/libteam_1.26.bb
+++ b/meta-oe/recipes-support/libteam/libteam_1.27.bb
@@ -7,8 +7,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 DEPENDS = "libnl libdaemon jansson"
 
-SRC_URI = "git://github.com/jpirko/libteam"
-SRCREV = "8c1cea00a21950089058e4e33ea1f7bf4deaddeb"
+SRC_URI = "git://github.com/jpirko/libteam \
+           file://0001-include-sys-select.h-for-fd_set-definition.patch \
+           file://0002-teamd-Re-adjust-include-header-order.patch \
+           "
+SRCREV = "91a928a56a501daac5ce8b3c16bd9943661f1d16"
 
 SRC_URI[md5sum] = "565114d70c41bff6093d8e57be284e8a"
 SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e3d5545"
-- 
2.13.2


