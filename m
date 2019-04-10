Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id B5E3F7D415
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 18:23:37 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id z24so3668065wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 11:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jCuW78kUUOlSik/wPOu03sQPk5L1t4LAtxsL5xvkU/k=;
	b=CZ1AZhPpRnKQqq71zfq+x9d1usQpZMm3z8JcCWVGsR3+eF6sBNbTpnOZUbIsdTYCSJ
	uKTRUCuI9Pf5E+gcXsTbzx84bg/+8s4Rwcos1Y4+D3bhOszfMJp2c+S4u/agX/W/ls97
	p7fzQ4jJ2f13O5veH8Eomua6o4lirSGWdFkFuqTuFyIe2h6EroMjKxF/zTZmKogcqRYq
	EYEwNFh0tVqz1WVGyAn5PBdo2vG82MzyECDHiSZoGxPa80enAPGXv5nAWn77XSS8Wjvn
	5KBpNIi7ttDAG33yn1dvAryip/AXVVBbUdoDeO9QS5GmBPRJyl88+CLmmlQ8sRfV6dcg
	FjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=jCuW78kUUOlSik/wPOu03sQPk5L1t4LAtxsL5xvkU/k=;
	b=nZU8PMnhhT4iWOPiVyiLrYH0Ma8dkkRu3zhy8KruzIbkjMkZiQLr1b8a3M1JvXDkqv
	iTLBYn/lRIg34vXtIWEhGSOBasXFCsLAO224OP7csW1lXyoQJuVEtR0Ev3BOFqfaOIwa
	hB56cWQPCnCS+8cIVREu6YcC1HPR+VjESQHRDFq2/8YKi+e5rdayOHvjS+wuSx+DqHUi
	/KQb/5xmWdCbxu9ouzlt4BOa+KDyQiJBY0C3NYOZVjiUkrQ+8jdn0NnjPsqcGfxttIMm
	yIp0LBoCtAdT31/8Z36zbe2tWMXhbd28H4PjtnIhOUGl2osp936l0vhTu2gU1sA4JehD
	Nkjg==
X-Gm-Message-State: APjAAAUYAR2NXMqFROCIf+jQwgTI169wcmXZfj+LaUfmeHvBRTHFOhK6
	CPlQfYjpGIEf//C1NHROrmmDAn5Z
X-Google-Smtp-Source: APXvYqzbrw69ltgNGX6fRhpIo6Dz10vyvdJBjjWqYNX3Oh/5G9ATi+s9tG68WNAYohMUxcGudqpQ3g==
X-Received: by 2002:a7b:c5d6:: with SMTP id n22mr3715006wmk.112.1554920617641; 
	Wed, 10 Apr 2019 11:23:37 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F063E40D707F1BCD5BD6A21.dip0.t-ipconnect.de.
	[2003:f0:7f06:3e40:d707:f1bc:d5bd:6a21])
	by smtp.gmail.com with ESMTPSA id
	o10sm55692145wru.54.2019.04.10.11.23.36
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 10 Apr 2019 11:23:36 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Apr 2019 20:23:28 +0200
Message-Id: <20190410182328.11739-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] networkmanager: rework musl build
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
X-List-Received-Date: Wed, 10 Apr 2019 18:23:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

patches:
* Split out systemd specifics
* Simplfy patch to fix musl / linux-libc definition conflicts. This makes
  future maintenance less pain and fixes build for recipes depending on
  networkmanager.
  For further background read patch description in 0002-Fix-build-with-musl.patch

musl CFLAGS:
* -D__USE_POSIX199309 removed - could not find any trace of it
* CFLAGS_libc-musl_append -> CFLAGS_append_libc-musl

gobject-introspection:
* enable - it builds perfectly fine

Build tested (musl/glibc) with all dependents found in my layers:
* network-manager-applet
* networkmanager-openvpn
* python-networkmanager
* networkmanager-qt
* plasma-nm
* liri-networkmanager

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---

V1 -> V2:
* Change patch title slightly
* CFLAGS_libc-musl_append -> CFLAGS_append_libc-musl
* checked if the other CFLAGS are still necessary / write comments

 ...ix-build-with-musl-systemd-specific.patch} | 196 ++----------------
 .../musl/0002-Fix-build-with-musl.patch       | 118 +++++++++++
 .../networkmanager/networkmanager_1.16.0.bb   |  26 ++-
 3 files changed, 148 insertions(+), 192 deletions(-)
 rename meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/{0001-Fix-build-with-musl.patch => 0001-Fix-build-with-musl-systemd-specific.patch} (51%)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
similarity index 51%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
index b3f93ff92..accd2f256 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl.patch
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0001-Fix-build-with-musl-systemd-specific.patch
@@ -1,75 +1,26 @@
-From f43c9a5b07832a91383e59d655bc3c8a9f48c451 Mon Sep 17 00:00:00 2001
+From 7b09945585e6ce65049fa4039f26caee8daa44b9 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Tue, 2 Apr 2019 01:34:35 +0200
-Subject: [PATCH] Fix build with musl
+Subject: [PATCH 1/2] Fix build with musl - systemd specific
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+Networkmanager imported some code from systemd. This requires some adjustments
+for musl.
+
 Upstream-Status: Pending
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
- clients/cli/connections.c                    |  1 -
- libnm-core/nm-utils.c                        |  2 +-
- shared/n-acd/src/n-acd.c                     |  1 -
- shared/systemd/src/basic/in-addr-util.c      |  1 +
- shared/systemd/src/basic/process-util.c      |  9 ++++++
- shared/systemd/src/basic/socket-util.h       |  6 ++++
- shared/systemd/src/basic/stdio-util.h        |  2 ++
- shared/systemd/src/basic/string-util.h       |  5 ++++
- shared/systemd/src/basic/util.h              | 29 ++++----------------
- src/platform/wifi/nm-wifi-utils.h            |  4 +++
- src/platform/wpan/nm-wpan-utils.h            |  2 --
- src/settings/nm-settings-connection.h        |  2 --
- src/systemd/src/libsystemd-network/sd-lldp.c |  1 +
- src/systemd/src/systemd/sd-dhcp-client.h     |  2 ++
- src/systemd/src/systemd/sd-dhcp-lease.h      |  2 ++
- src/systemd/src/systemd/sd-dhcp6-client.h    |  2 ++
- src/systemd/src/systemd/sd-ipv4ll.h          |  2 ++
- src/systemd/src/systemd/sd-lldp.h            |  2 +-
- 19 files changed, 44 insertions(+), 32 deletions(-)
+ shared/systemd/src/basic/in-addr-util.c |  1 +
+ shared/systemd/src/basic/process-util.c |  9 ++++++++
+ shared/systemd/src/basic/socket-util.h  |  6 +++++
+ shared/systemd/src/basic/stdio-util.h   |  2 ++
+ shared/systemd/src/basic/string-util.h  |  5 +++++
+ shared/systemd/src/basic/util.h         | 29 +++++--------------------
+ 6 files changed, 28 insertions(+), 24 deletions(-)
 
-diff --git a/clients/cli/connections.c b/clients/cli/connections.c
-index 6db44f8..36e51cc 100644
---- a/clients/cli/connections.c
-+++ b/clients/cli/connections.c
-@@ -25,7 +25,6 @@
- #include <stdlib.h>
- #include <unistd.h>
- #include <signal.h>
--#include <netinet/ether.h>
- #include <readline/readline.h>
- #include <readline/history.h>
- #include <fcntl.h>
-diff --git a/libnm-core/nm-utils.c b/libnm-core/nm-utils.c
-index d276cfe..2aec785 100644
---- a/libnm-core/nm-utils.c
-+++ b/libnm-core/nm-utils.c
-@@ -21,10 +21,10 @@
- 
- #include "nm-default.h"
- 
-+#include <netinet/ether.h>
- #include "nm-utils.h"
- 
- #include <stdlib.h>
--#include <netinet/ether.h>
- #include <arpa/inet.h>
- #include <uuid/uuid.h>
- #include <libintl.h>
-diff --git a/shared/n-acd/src/n-acd.c b/shared/n-acd/src/n-acd.c
-index def56a2..dd4eb78 100644
---- a/shared/n-acd/src/n-acd.c
-+++ b/shared/n-acd/src/n-acd.c
-@@ -11,7 +11,6 @@
- #include <inttypes.h>
- #include <limits.h>
- #include <linux/if_packet.h>
--#include <netinet/if_ether.h>
- #include <netinet/in.h>
- #include <stdlib.h>
- #include <string.h>
 diff --git a/shared/systemd/src/basic/in-addr-util.c b/shared/systemd/src/basic/in-addr-util.c
 index 5ced350..c6b52b8 100644
 --- a/shared/systemd/src/basic/in-addr-util.c
@@ -223,129 +174,6 @@ index dc33d66..cc768e9 100644
  /* Normal memcpy requires src to be nonnull. We do nothing if n is 0. */
  static inline void memcpy_safe(void *dst, const void *src, size_t n) {
          if (n == 0)
-diff --git a/src/platform/wifi/nm-wifi-utils.h b/src/platform/wifi/nm-wifi-utils.h
-index 36148b5..d282eb2 100644
---- a/src/platform/wifi/nm-wifi-utils.h
-+++ b/src/platform/wifi/nm-wifi-utils.h
-@@ -22,7 +22,11 @@
- #ifndef __WIFI_UTILS_H__
- #define __WIFI_UTILS_H__
- 
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#else /* musl libc */
-+#define ETH_ALEN	6		/* Octets in one ethernet addr	 */
-+#endif
- 
- #include "nm-dbus-interface.h"
- #include "nm-setting-wireless.h"
-diff --git a/src/platform/wpan/nm-wpan-utils.h b/src/platform/wpan/nm-wpan-utils.h
-index 1b54ec4..ed39938 100644
---- a/src/platform/wpan/nm-wpan-utils.h
-+++ b/src/platform/wpan/nm-wpan-utils.h
-@@ -20,8 +20,6 @@
- #ifndef __WPAN_UTILS_H__
- #define __WPAN_UTILS_H__
- 
--#include <net/ethernet.h>
--
- #include "nm-dbus-interface.h"
- #include "platform/nm-netlink.h"
- 
-diff --git a/src/settings/nm-settings-connection.h b/src/settings/nm-settings-connection.h
-index e796b71..c01fef6 100644
---- a/src/settings/nm-settings-connection.h
-+++ b/src/settings/nm-settings-connection.h
-@@ -22,8 +22,6 @@
- #ifndef __NETWORKMANAGER_SETTINGS_CONNECTION_H__
- #define __NETWORKMANAGER_SETTINGS_CONNECTION_H__
- 
--#include <net/ethernet.h>
--
- #include "nm-dbus-object.h"
- #include "nm-connection.h"
- 
-diff --git a/src/systemd/src/libsystemd-network/sd-lldp.c b/src/systemd/src/libsystemd-network/sd-lldp.c
-index 741128e..62914ae 100644
---- a/src/systemd/src/libsystemd-network/sd-lldp.c
-+++ b/src/systemd/src/libsystemd-network/sd-lldp.c
-@@ -3,6 +3,7 @@
- #include "nm-sd-adapt-core.h"
- 
- #include <arpa/inet.h>
-+#include <net/ethernet.h>
- #include <linux/sockios.h>
- #include <sys/ioctl.h>
- 
-diff --git a/src/systemd/src/systemd/sd-dhcp-client.h b/src/systemd/src/systemd/sd-dhcp-client.h
-index bd0d429..c935fe1 100644
---- a/src/systemd/src/systemd/sd-dhcp-client.h
-+++ b/src/systemd/src/systemd/sd-dhcp-client.h
-@@ -20,7 +20,9 @@
- ***/
- 
- #include <inttypes.h>
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <netinet/in.h>
- #include <sys/types.h>
- #include <stdbool.h>
-diff --git a/src/systemd/src/systemd/sd-dhcp-lease.h b/src/systemd/src/systemd/sd-dhcp-lease.h
-index d299c79..991e67e 100644
---- a/src/systemd/src/systemd/sd-dhcp-lease.h
-+++ b/src/systemd/src/systemd/sd-dhcp-lease.h
-@@ -19,7 +19,9 @@
- ***/
- 
- #include <inttypes.h>
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <netinet/in.h>
- #include <sys/types.h>
- 
-diff --git a/src/systemd/src/systemd/sd-dhcp6-client.h b/src/systemd/src/systemd/sd-dhcp6-client.h
-index 43d38f5..57ab487 100644
---- a/src/systemd/src/systemd/sd-dhcp6-client.h
-+++ b/src/systemd/src/systemd/sd-dhcp6-client.h
-@@ -20,7 +20,9 @@
- ***/
- 
- #include <inttypes.h>
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <sys/types.h>
- 
- #include "sd-dhcp6-lease.h"
-diff --git a/src/systemd/src/systemd/sd-ipv4ll.h b/src/systemd/src/systemd/sd-ipv4ll.h
-index 71bd4cf..1c667ba 100644
---- a/src/systemd/src/systemd/sd-ipv4ll.h
-+++ b/src/systemd/src/systemd/sd-ipv4ll.h
-@@ -19,7 +19,9 @@
-   along with systemd; If not, see <http://www.gnu.org/licenses/>.
- ***/
- 
-+#if defined(__GLIBC__)
- #include <net/ethernet.h>
-+#endif
- #include <netinet/in.h>
- 
- #include "sd-event.h"
-diff --git a/src/systemd/src/systemd/sd-lldp.h b/src/systemd/src/systemd/sd-lldp.h
-index bf3afad..4cace87 100644
---- a/src/systemd/src/systemd/sd-lldp.h
-+++ b/src/systemd/src/systemd/sd-lldp.h
-@@ -18,7 +18,7 @@
- ***/
- 
- #include <inttypes.h>
--#include <net/ethernet.h>
-+//#include <net/ethernet.h>
- #include <sys/types.h>
- 
- #include "sd-event.h"
 -- 
 2.20.1
 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
new file mode 100644
index 000000000..25f9a4a00
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/musl/0002-Fix-build-with-musl.patch
@@ -0,0 +1,118 @@
+From 0b0f2d5abe27b2c9587f449795f0ae3568fc3e38 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Mon, 8 Apr 2019 23:10:43 +0200
+Subject: [PATCH 2/2] Fix build with musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The build issues caused by definition conflicts musl vs linux-libc headers
+(error: redefinition of ...) can be reduced to two headers:
+
+1. netinet/if_ether.h <-> linux/if_ether.h: linux-libc header plays well with
+   glibc and musl headers in case libc's variant (netinet/if_ether.h) is
+   included BEFORE linux variant [1]. We add include at two positions:
+   1. shared/nm-default.h: This is a global which used for networkmanager and
+      is included at the very beginning of all c-files.
+   2. libnm-core/nm-utils.h: This file makes it into installation and is used
+      by dependent packages as network-manager-applet
+2. net/if_arp. <-> linux/if_ether.h: linux-libc: Unfortunaly these files do
+   not play together in harmony. Therefore the libc variant is included early in
+   shared/nm-default.h and occurances linux/if_arp.h are removed.
+
+Note:
+Be aware that this is still nasty business: We have to trust that musl headers
+define same signatures as linux would do - just because musl-makers consider
+linux-libc headers 'notoriously broken for userspace' [2] (search for 
+'error: redefinition of').
+
+[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-March/280440.html
+[2] https://wiki.musl-libc.org/faq.html
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ clients/tui/nmt-device-entry.c   | 1 -
+ libnm-core/nm-utils.h            | 4 ++++
+ shared/nm-default.h              | 3 +++
+ src/devices/nm-device.c          | 2 +-
+ src/platform/nm-linux-platform.c | 1 -
+ 5 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-entry.c
+index 43fbbc1..3eae286 100644
+--- a/clients/tui/nmt-device-entry.c
++++ b/clients/tui/nmt-device-entry.c
+@@ -39,7 +39,6 @@
+ #include "nmt-device-entry.h"
+ 
+ #include <sys/socket.h>
+-#include <linux/if_arp.h>
+ 
+ #include "nmtui.h"
+ 
+diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
+index 2b5baba..8a50131 100644
+--- a/libnm-core/nm-utils.h
++++ b/libnm-core/nm-utils.h
+@@ -25,6 +25,10 @@
+ #error "Only <NetworkManager.h> can be included directly."
+ #endif
+ 
++/* include as early as possible for musl */
++#include <netinet/if_ether.h>
++/* #include <net/if_arp.h> - uncoment for broken dependents?? */
++
+ #include <glib.h>
+ 
+ #include <netinet/in.h>
+diff --git a/shared/nm-default.h b/shared/nm-default.h
+index 26d6476..b29e8af 100644
+--- a/shared/nm-default.h
++++ b/shared/nm-default.h
+@@ -211,6 +211,9 @@
+ #endif
+ 
+ #include <stdlib.h>
++/* include as early as possible for musl */
++#include <netinet/if_ether.h>
++#include <net/if_arp.h>
+ 
+ /*****************************************************************************/
+ 
+diff --git a/src/devices/nm-device.c b/src/devices/nm-device.c
+index 7514fa7..d305fa5 100644
+--- a/src/devices/nm-device.c
++++ b/src/devices/nm-device.c
+@@ -24,6 +24,7 @@
+ #include "nm-device.h"
+ 
+ #include <netinet/in.h>
++#include <net/if.h>
+ #include <unistd.h>
+ #include <sys/ioctl.h>
+ #include <signal.h>
+@@ -32,7 +33,6 @@
+ #include <arpa/inet.h>
+ #include <fcntl.h>
+ #include <linux/if_addr.h>
+-#include <linux/if_arp.h>
+ #include <linux/rtnetlink.h>
+ #include <linux/pkt_sched.h>
+ 
+diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
+index 2f5c75b..d6ca6d9 100644
+--- a/src/platform/nm-linux-platform.c
++++ b/src/platform/nm-linux-platform.c
+@@ -27,7 +27,6 @@
+ #include <fcntl.h>
+ #include <libudev.h>
+ #include <linux/ip.h>
+-#include <linux/if_arp.h>
+ #include <linux/if_link.h>
+ #include <linux/if_tun.h>
+ #include <linux/if_tunnel.h>
+-- 
+2.20.1
+
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
index 9f57908e9..9f01f1bc1 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.16.0.bb
@@ -28,7 +28,10 @@ SRC_URI = " \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0003-dlopen-failure.patch \
 "
-SRC_URI_append_libc-musl = " file://musl/0001-Fix-build-with-musl.patch"
+SRC_URI_append_libc-musl = " \
+    file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
+    file://musl/0002-Fix-build-with-musl.patch \
+"
 
 SRC_URI[md5sum] = "10abacaafb162a67d2942adf03e7e9e4"
 SRC_URI[sha256sum] = "8e962833b6ca03edda1bc57ed6614a7b8c2339531b44acef098d05f2324c5d2c"
@@ -47,13 +50,20 @@ EXTRA_OECONF = " \
     --with-udev-dir=${nonarch_base_libdir}/udev \
 "
 
-# gobject-introspection related
-GI_DATA_ENABLED_libc-musl = "False"
-
-# stolen from https://github.com/voidlinux/void-packages/blob/master/srcpkgs/NetworkManager/template
-CFLAGS_libc-musl_append = " \
-    -DHAVE_SECURE_GETENV -Dsecure_getenv=getenv \
-    -D__USE_POSIX199309 -DRTLD_DEEPBIND=0 \
+# stolen from https://github.com/void-linux/void-packages/blob/master/srcpkgs/NetworkManager/template
+# avoids:
+# | ../NetworkManager-1.16.0/libnm-core/nm-json.c:106:50: error: 'RTLD_DEEPBIND' undeclared (first use in this function); did you mean 'RTLD_DEFAULT'?
+#
+# and
+#
+# | In file included from ../NetworkManager-1.16.0/src/systemd/nm-sd-utils-core.c:25:
+# | ../NetworkManager-1.16.0/src/systemd/sd-adapt-core/nm-sd-adapt-core.h:68:6: error: #error neither secure_getenv nor __secure_getenv is available
+# |  #    error neither secure_getenv nor __secure_getenv is available
+# |       ^~~~~
+CFLAGS_append_libc-musl = " \
+    -DRTLD_DEEPBIND=0 \
+    -DHAVE_SECURE_GETENV \
+    -Dsecure_getenv=getenv \
 "
 
 do_compile_prepend() {
-- 
2.20.1


