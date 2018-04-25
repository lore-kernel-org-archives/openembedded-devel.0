Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2E26072EB7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 22:05:18 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id 66so9575999wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Apr 2018 15:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dXvhV8QCwEgrJg8Y5xKh41EC0xaNk6iiAvJjoItqx1s=;
	b=RcCUz7CPY7/doJcff/DKNolz1ja/JRun3y+m9WadesyfbHdp7QOJaiVoMcrhc3TtsV
	gaMjIbq1SMcd14gL7TFOYeGG68cnSKhzajUJuMDCzkAp/qlxOJRsMhMraioDBauxPwK9
	oHI4Lr/4j3U7jpAQvFH1ehKVegcb630vpG/1PKmXOhmzz0BjmC7ZWIE9+fMsYw0szTyq
	wnw94cGNkB9+Kqlur1RJuIW42IMiLaYMNj/O9CuZch83SBcWvE7PXhBODCX+W8rsUjl4
	vSeBDXmNdkXCU+KFw00kh5XKJYQKlwNeHeHoaPlY/F6a6rpbAHP7uDxHD9aodn2QZ4Q+
	vJzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=dXvhV8QCwEgrJg8Y5xKh41EC0xaNk6iiAvJjoItqx1s=;
	b=RZE7/6R7qHJ8LQTif+qsd4Gyz3RO8DGrG2XtvnD1z9RW/b+S4qzmQxoMVtzeLEgyhI
	frllWzVTx9ilck11Q6JKJ9zDx58wtla+VaOe4Vdc9pK/7LuzlPXOqD59Nx80A0CQJHwE
	yq66Ghecs0/v5BERCzsGLDP9Hb2oKULSwuX3IxkK/WoFL2BF83+8hNCBRFjrSkVyJN4C
	NRNsYmwuYW09d1QwWGBlmoXURIyIGuA28fnXv6kvRjt8VsSvxFyK+WdTFY5WE15Fd72t
	fJtvqQ05hovtP3oxUxFOnvdZx0EDvaTsHQ61+FM3exEYPg8jWDp5geI8x2LEDTltwG8H
	MDDg==
X-Gm-Message-State: ALQs6tDVdYNqa3X7cQwq34QDtlVhmqAsuC1Cln9Yg59xDpezVCK2Ira5
	ov7/oFJ2+femBMW5YNNSXD3e/g==
X-Google-Smtp-Source: AIpwx48LEjxHIQyKv6Qch9dF9B7hNXv1XXsZBnFaW4yCccmCUY+NmIR3UoCdoQyB5A2EYFiyi4tb6w==
X-Received: by 10.28.131.21 with SMTP id f21mr16699659wmd.78.1524693919065;
	Wed, 25 Apr 2018 15:05:19 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC06E671E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc0:6e67:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	j21-v6sm23814198wrb.49.2018.04.25.15.05.18
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Apr 2018 15:05:18 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 26 Apr 2018 00:05:05 +0200
Message-Id: <20180425220505.12523-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH] networkmanager: fix prevous commits
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
X-List-Received-Date: Wed, 25 Apr 2018 22:05:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The wrong patches were applied:

commit c5a04600817e0d34dfa151d46073a76b506b4c3d
Author: Armin Kuster <akuster808@gmail.com>
Date:   Fri Mar 30 19:56:03 2018 -0700

    networkmanager: Fix many typos in DISTRO_FEATURES PACKAGECONFIG decodes

commit 575c14ded56e1e97582a6df0921d19b4da630961
Author: Andreas Müller <schnitzeltony@gmail.com>
Date:   Thu Mar 22 18:40:52 2018 +0100

    networkmanager: fix gobject-introspection/musl and cleanup

* musl fixed (tested)
* PACKAGECONFIG systemd: Logic was broken by c5a046. To avoid
  further confusion, the expression was put into one line.
* PACKAGECONFIG wifi: The expression 'bb.utils.filter.. ' was perfectly fine.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...further-conflicts-by-including-net-ethern.patch | 77 ++++++++++++++++++++++
 .../0006-Add-a-strndupa-replacement-for-musl.patch | 47 +++++++++++++
 .../networkmanager/networkmanager_1.10.6.bb        | 14 ++--
 3 files changed, 134 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
new file mode 100644
index 000000000..752fe4f58
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch
@@ -0,0 +1,77 @@
+From b3b4fe35018c98ad176719b2d9ffb867974fc7c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 16 Apr 2018 14:45:44 +0200
+Subject: [PATCH] musl: avoid further conflicts by including net/ethernet.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/systemd/src/systemd/sd-dhcp-client.h  | 2 ++
+ src/systemd/src/systemd/sd-dhcp-lease.h   | 2 ++
+ src/systemd/src/systemd/sd-dhcp6-client.h | 2 ++
+ src/systemd/src/systemd/sd-ipv4ll.h       | 2 ++
+ 4 files changed, 8 insertions(+)
+
+diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
+index 5e46d8d..18a613f 100644
+--- a/src/systemd/src/systemd/sd-dhcp-client.h
++++ b/src/systemd/src/systemd/sd-dhcp-client.h
+@@ -21,7 +21,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ #include <sys/types.h>
+ 
+diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
+index 7ab99cc..85acdf2 100644
+--- a/src/systemd/src/systemd/sd-dhcp-lease.h
++++ b/src/systemd/src/systemd/sd-dhcp-lease.h
+@@ -22,7 +22,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ #include <sys/types.h>
+ 
+diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
+index 7819f0d..35f30ee 100644
+--- a/src/systemd/src/systemd/sd-dhcp6-client.h
++++ b/src/systemd/src/systemd/sd-dhcp6-client.h
+@@ -21,7 +21,9 @@
+ ***/
+ 
+ #include <inttypes.h>
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <sys/types.h>
+ 
+ #include "sd-dhcp6-lease.h"
+diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
+index 5ba9208..c90eca6 100644
+--- a/src/systemd/src/systemd/sd-ipv4ll.h
++++ b/src/systemd/src/systemd/sd-ipv4ll.h
+@@ -20,7 +20,9 @@
+   along with systemd; If not, see <http://www.gnu.org/licenses/>.
+ ***/
+ 
++#if defined(__GLIBC__)
+ #include <net/ethernet.h>
++#endif
+ #include <netinet/in.h>
+ 
+ #include "sd-event.h"
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
new file mode 100644
index 000000000..8ed7ee64f
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0006-Add-a-strndupa-replacement-for-musl.patch
@@ -0,0 +1,47 @@
+From 6db6596e450062601d18b2ae812a4a58d2e03a53 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 16 Apr 2018 15:07:20 +0200
+Subject: [PATCH] Add a strndupa replacement for musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ src/systemd/src/basic/in-addr-util.c | 1 +
+ src/systemd/src/basic/string-util.h  | 5 +++++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/src/systemd/src/basic/in-addr-util.c b/src/systemd/src/basic/in-addr-util.c
+index 2a02d90..a57c360 100644
+--- a/src/systemd/src/basic/in-addr-util.c
++++ b/src/systemd/src/basic/in-addr-util.c
+@@ -30,6 +30,7 @@
+ #include "in-addr-util.h"
+ #include "macro.h"
+ #include "parse-util.h"
++#include "string-util.h"
+ #include "util.h"
+ 
+ bool in4_addr_is_null(const struct in_addr *a) {
+diff --git a/src/systemd/src/basic/string-util.h b/src/systemd/src/basic/string-util.h
+index 4c94b18..a6dc446 100644
+--- a/src/systemd/src/basic/string-util.h
++++ b/src/systemd/src/basic/string-util.h
+@@ -44,6 +44,11 @@
+ #define strcaseeq(a,b) (strcasecmp((a),(b)) == 0)
+ #define strncaseeq(a, b, n) (strncasecmp((a), (b), (n)) == 0)
+ 
++/* musl does not know strndupa */
++#if !defined(__GLIBC__)
++#define strndupa(x,s) strncpy(alloca(strlen(x)+1),x,s)
++#endif
++
+ int strcmp_ptr(const char *a, const char *b) _pure_;
+ 
+ static inline bool streq_ptr(const char *a, const char *b) {
+-- 
+2.14.3
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
index d90b78268..31fa13241 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.10.6.bb
@@ -35,6 +35,8 @@ SRC_URI = " \
     file://musl/0002-musl-dlopen-configure-ac.patch \
     file://musl/0003-musl-network-support.patch \
     file://musl/0004-musl-process-util.patch \
+    file://musl/0005-musl-avoid-further-conflicts-by-including-net-ethern.patch \
+    file://musl/0006-Add-a-strndupa-replacement-for-musl.patch \
 "
 SRC_URI[md5sum] = "de3c7147a693da6f80eb22f126086a14"
 SRC_URI[sha256sum] = "6af0b1e856a3725f88791f55c4fbb04105dc0b20dbf182aaec8aad16481fac76"
@@ -54,17 +56,21 @@ EXTRA_OECONF = " \
 # gobject-introspection related
 GI_DATA_ENABLED_libc-musl = "False"
 
+# stolen from https://github.com/voidlinux/void-packages/blob/master/srcpkgs/NetworkManager/template
+CFLAGS_libc-musl_append = " \
+    -DHAVE_SECURE_GETENV -Dsecure_getenv=getenv \
+    -D__USE_POSIX199309 -DRTLD_DEEPBIND=0 \
+"
+
 do_compile_prepend() {
     export GIR_EXTRA_LIBS_PATH="${B}/libnm/.libs:${B}/libnm-glib/.libs:${B}/libnm-util/.libs"
 }
 
 PACKAGECONFIG ??= "nss ifupdown netconfig dhclient dnsmasq \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', bb.utils.contains('DISTRO_FEATURES', 'x11', 'consolekit', '', d), d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'wifi', '', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wifi', d)} \
 "
-
 PACKAGECONFIG[systemd] = " \
     --with-systemdsystemunitdir=${systemd_unitdir}/system --with-session-tracking=systemd --enable-polkit, \
     --without-systemdsystemunitdir, \
-- 
2.14.3


