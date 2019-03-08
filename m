Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 67B506C248
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Mar 2019 19:01:06 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id e17so14848246pgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Mar 2019 11:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PlW477UkB2nfeYoMq5wNCoFwg1h4n6MATAd6y70k3+o=;
	b=k1ygbFizYGuJUf3dkj8Q3V8G8VtfxnLIHvsiDEnHwUcxEW9HRmcB7P56am3lhe/11B
	IrSNDwIRGXleC67uQUkz8iXJ1lcvl9i3epPSohfDSzxKDKxwhaGZlqUlFozMncgR0ojJ
	HV92ToYQ+dA7MJhqi6u/vhwG6FIfLmTSdH4QnfdVS6rjt0GtJ6i8DJGUdqActBXMrHek
	TAu+L4bZU4PopkIOeVWebySIyb/X/DG+Jj8qXD4WhiIS4N72zhmLTyUjRUXeh++fZR8i
	fecn4YE/gc7AFQwBWC9sYxnoiIIVYtYbXSSR2TBiN/3xnVvlBdap2OEwkeMovZWRwxgS
	tvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=PlW477UkB2nfeYoMq5wNCoFwg1h4n6MATAd6y70k3+o=;
	b=hgxZqRNGF7jvtDNMUCxF/jmLs8Mqi/aLyLrdGn63xVTFU4O08uYHhq3ABdxMZBSlFC
	Gmg8Ha2q+ako6r21mp+XVvSgVJ1L2H78lZWpMPMVacP+FqXX+HDT4hMcEiXdaeofMh1R
	AidwAYb2qVnYYUqThnQEzwJXjHFWVTcRH7PUzh/mo+ZhK101SNOG8nWAv9GMHDW8JbVW
	TqZK3SSfeMi2P9Ki7F1uXd+NFzkU2nIDFAmObdFDl2tEVw2E56RG49+mFtg60Ar+gY7w
	3W4hCKPUrsxQnRiqofuUQVBoFjZpvR9f8PXh1vHaJer4PBp3GZ9+q27LZKFX1789kANl
	+rnQ==
X-Gm-Message-State: APjAAAVKJ3ljFqqJYLxNoR4VWlnphbMxIX/iQgkk6dRxNAUgU2v6Bq0w
	oUbVj1trebvH2+l8GoZqMAd5UasQ
X-Google-Smtp-Source: APXvYqwgoyvaYuKNSr99uni6MONbqPe3DUZAuYKNDQWl01G4mb9tZTWYKw9xpmqT1DVkX7AJVWQ/3Q==
X-Received: by 2002:a65:4104:: with SMTP id w4mr4583527pgp.415.1552071666922; 
	Fri, 08 Mar 2019 11:01:06 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::3401])
	by smtp.gmail.com with ESMTPSA id
	u18sm13933654pfa.176.2019.03.08.11.01.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Mar 2019 11:01:06 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Mar 2019 11:00:57 -0800
Message-Id: <20190308190058.18583-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190308190058.18583-1-raj.khem@gmail.com>
References: <20190308190058.18583-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] linux-atm: Fix build with linux 5.x headers
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
X-List-Received-Date: Fri, 08 Mar 2019 19:01:06 -0000
Content-Transfer-Encoding: 8bit

Fixes
error: 'IFNAMSIZ' undeclared here

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-IFNAMSIZ-is-defined-in-net-if.h.patch | 48 +++++++++++++++++++
 .../linux-atm/linux-atm_2.5.2.bb              |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch

diff --git a/meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch b/meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch
new file mode 100644
index 0000000000..a7c7093e09
--- /dev/null
+++ b/meta-networking/recipes-support/linux-atm/linux-atm/0001-IFNAMSIZ-is-defined-in-net-if.h.patch
@@ -0,0 +1,48 @@
+From 29b37e45577c0921846c1709a190f08a3b032666 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Mar 2019 09:08:38 -0800
+Subject: [PATCH] IFNAMSIZ is defined in net/if.h
+
+Fixes
+/mnt/a/yoe/build/tmp/work/qemuriscv64-yoe-linux-musl/linux-atm/2.5.2-r0/recipe-sysroot/usr/include/linux/if_arp.h:121:16: error: 'IFNAMSIZ' undeclared here (not in a function)
+|  char  arp_dev[IFNAMSIZ];
+|                ^~~~~~~~
+In file included from ../../../linux-atm-2.5.2/src/arpd/itf.c:17:
+/mnt/a/yoe/build/tmp/work/qemuriscv64-yoe-linux-musl/linux-atm/2.5.2-r0/recipe-sysroot/usr/include/linux/if_arp.h:121:16: error: 'IFNAMSIZ' undeclared here (not in a function)
+|  char  arp_dev[IFNAMSIZ];
+|                ^~~~~~~~
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/arpd/arp.c | 1 +
+ src/arpd/itf.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/arpd/arp.c b/src/arpd/arp.c
+index 92d3787..ff1574c 100644
+--- a/src/arpd/arp.c
++++ b/src/arpd/arp.c
+@@ -17,6 +17,7 @@
+ #include <netinet/in.h> /* for ntohs, etc. */
+ #define _LINUX_NETDEVICE_H /* very crude hack for glibc2 */
+ #include <linux/types.h>
++#include <net/if.h>
+ #include <linux/if_arp.h>
+ #include <linux/if_ether.h>
+ #include <atm.h>
+diff --git a/src/arpd/itf.c b/src/arpd/itf.c
+index 92f0951..d285e3b 100644
+--- a/src/arpd/itf.c
++++ b/src/arpd/itf.c
+@@ -14,6 +14,7 @@
+ #include <sys/socket.h>
+ #define _LINUX_NETDEVICE_H /* glibc2 */
+ #include <linux/types.h>
++#include <net/if.h>
+ #include <linux/if_arp.h>
+ 
+ #include "atmd.h"
+-- 
+2.21.0
+
diff --git a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
index 9fce4fba63..51682b1ed1 100644
--- a/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
+++ b/meta-networking/recipes-support/linux-atm/linux-atm_2.5.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "http://nchc.dl.sourceforge.net/project/${BPN}/${BPN}/${PV}/${BPN}-${P
            file://0001-ttcp-Add-printf-format-string.patch \
            file://0002-sigd-Replace-on_exit-API-with-atexit.patch \
            file://0003-mpoad-Drop-old-hack-to-compile-with-very-old-glibc.patch \
+           file://0001-IFNAMSIZ-is-defined-in-net-if.h.patch \
 "
 
 SRC_URI[md5sum] = "d49499368c3cf15f73a05d9bce8824a8"
-- 
2.21.0


