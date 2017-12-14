Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8C6D77887C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:38:15 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id o2so2567947pgc.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8SfkI6XIXOI2vM89f+Snn7O7ETHYf/YmsfL9dAE+oOE=;
	b=MuI+eJ6p6nhEe2nHsnWwP42VQePW6CLrsIhwH7/ctudkho+UzEf0ShFsEQShjWmWaw
	SL3ul81ZheSTXFRGtaB90OkfimhlZWrIlGQzV+taGPP4wK6yINGIdvsMtRFljCSkaQCK
	en1UxUa2NyY3KFanyKMNFoBWNqCZusqW34hkGhyWQJ1xZg8fo3mT98JKle7tl2v5TPml
	jP1KwZd/TPVDL7IWiB6UjEgeb6ZzLpAh52f2qRRnuqT8b5BtUy91goQfHHFj6NKYa5nK
	JfGDcn0Fo1rZbdjEx7W9DarqFNhH9aUqNgqYkN6s6glcNtTRgGpoIaVPpXaw7CxRZ587
	n+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8SfkI6XIXOI2vM89f+Snn7O7ETHYf/YmsfL9dAE+oOE=;
	b=ooMYQfG+w5XhexrSTYB5z2Sa9/9yW730DZuNYn4XAzG0C1ur98KGv8Dkhy++9MRuX7
	QpaXGcKih3yYxfLjkDEtLO9rRn+2HWfZRlaMATrtxxyAc2NAEgfVsSXxAIaRxUrutuke
	pxRv3sQchhXwN/OghxEkEje4JDkGq8gFnkZK6OqnwXiOOu6gXVyHHsWqwmyD3CAUiP3z
	Dk05SG6BCF5+WvT971+hZSIULhidGow2FFujJlBYtS2kUvCKbw6zdYnK+xBa8rKCrLB1
	VvuB4KicI3fBa2v/hVncnT6HOuCUktU3xns0p7+o0OkER7CsrK7d2RNbaSKDiJgr8zEN
	mQSQ==
X-Gm-Message-State: AKGB3mLt1WV2B9yftDPkQNUvRPZ2KHWuGRjqpqKerBPN4ltfPeRhJWBr
	9E9clzQqlWQm/09ZLSfWz1+aMA==
X-Google-Smtp-Source: ACJfBosJUR4zOY+fAEXB6PvwWr5wMjfIYnAfKBfuyI95SqfyyYazpa2D9hzXnfOjvuDE8ux9chaO6g==
X-Received: by 10.159.195.69 with SMTP id z5mr8172000pln.180.1513222696287;
	Wed, 13 Dec 2017 19:38:16 -0800 (PST)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	v64sm5225630pfi.187.2017.12.13.19.38.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 19:38:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 Dec 2017 19:38:09 -0800
Message-Id: <1513222689-1310-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-oe][morty][PATCH] networkmanager_1.0.12: musl build fixes
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
X-List-Received-Date: Thu, 14 Dec 2017 03:38:15 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../networkmanager/0001-musl-build-fixes.patch     | 97 ++++++++++++++++++++++
 .../networkmanager/networkmanager_1.0.12.bb        |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-musl-build-fixes.patch

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-musl-build-fixes.patch b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-musl-build-fixes.patch
new file mode 100644
index 0000000..a94e7e1
--- /dev/null
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager/0001-musl-build-fixes.patch
@@ -0,0 +1,97 @@
+From be0d7d0a156c1a5b8d869d39095d5668d53fad68 Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <armccurdy@gmail.com>
+Date: Mon, 11 Dec 2017 16:45:28 -0800
+Subject: [PATCH] musl build fixes
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+---
+ clients/tui/nmt-device-entry.c                  | 2 +-
+ libnm-core/nm-utils.h                           | 2 +-
+ libnm-util/nm-setting-bridge.c                  | 2 +-
+ src/dhcp-manager/systemd-dhcp/src/shared/util.c | 2 +-
+ src/platform/nm-linux-platform.c                | 3 ++-
+ src/platform/nm-platform.h                      | 1 +
+ 6 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/clients/tui/nmt-device-entry.c b/clients/tui/nmt-device-entry.c
+index 2af5e58..a9ceca4 100644
+--- a/clients/tui/nmt-device-entry.c
++++ b/clients/tui/nmt-device-entry.c
+@@ -38,7 +38,7 @@
+ 
+ #include <string.h>
+ #include <sys/socket.h>
+-#include <linux/if_arp.h>
++#include <net/if_arp.h>
+ 
+ #include <glib/gi18n-lib.h>
+ #include <NetworkManager.h>
+diff --git a/libnm-core/nm-utils.h b/libnm-core/nm-utils.h
+index e97b823..8bcf00a 100644
+--- a/libnm-core/nm-utils.h
++++ b/libnm-core/nm-utils.h
+@@ -30,7 +30,7 @@
+ #include <netinet/in.h>
+ 
+ /* For ETH_ALEN and INFINIBAND_ALEN */
+-#include <linux/if_ether.h>
++#include <netinet/if_ether.h>
+ #include <linux/if_infiniband.h>
+ 
+ #include "nm-core-enum-types.h"
+diff --git a/libnm-util/nm-setting-bridge.c b/libnm-util/nm-setting-bridge.c
+index bdaa75f..5036e70 100644
+--- a/libnm-util/nm-setting-bridge.c
++++ b/libnm-util/nm-setting-bridge.c
+@@ -26,7 +26,7 @@
+ #include <stdlib.h>
+ #include <dbus/dbus-glib.h>
+ #include <glib/gi18n-lib.h>
+-#include <linux/if_ether.h>
++#include <netinet/if_ether.h>
+ 
+ #include "nm-setting-bridge.h"
+ #include "nm-param-spec-specialized.h"
+diff --git a/src/dhcp-manager/systemd-dhcp/src/shared/util.c b/src/dhcp-manager/systemd-dhcp/src/shared/util.c
+index 05d4eb7..9be8cf0 100644
+--- a/src/dhcp-manager/systemd-dhcp/src/shared/util.c
++++ b/src/dhcp-manager/systemd-dhcp/src/shared/util.c
+@@ -44,7 +44,7 @@
+ #include <termios.h>
+ #include <stdarg.h>
+ #include <sys/inotify.h>
+-#include <sys/poll.h>
++#include <poll.h>
+ #include <ctype.h>
+ #include <sys/prctl.h>
+ #include <sys/utsname.h>
+diff --git a/src/platform/nm-linux-platform.c b/src/platform/nm-linux-platform.c
+index 4e45e0a..fe644d1 100644
+--- a/src/platform/nm-linux-platform.c
++++ b/src/platform/nm-linux-platform.c
+@@ -26,8 +26,9 @@
+ #include <dlfcn.h>
+ #include <netinet/icmp6.h>
+ #include <netinet/in.h>
++#include <netinet/if_ether.h>
+ #include <linux/ip.h>
+-#include <linux/if_arp.h>
++#include <net/if_arp.h>
+ #include <linux/if_link.h>
+ #include <linux/if_tun.h>
+ #include <linux/if_tunnel.h>
+diff --git a/src/platform/nm-platform.h b/src/platform/nm-platform.h
+index 3219dd5..8cefeaf 100644
+--- a/src/platform/nm-platform.h
++++ b/src/platform/nm-platform.h
+@@ -24,6 +24,7 @@
+ #include <glib-object.h>
+ #include "nm-glib-compat.h"
+ #include <netinet/in.h>
++#include <netinet/if_ether.h>
+ #include <linux/if.h>
+ #include <linux/if_addr.h>
+ 
+-- 
+1.9.1
+
diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
index 9134880..db6455d 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.0.12.bb
@@ -17,6 +17,7 @@ SRC_URI = " \
     file://0002-add-pkg-config-for-libgcrypt.patch \
     file://0006-Fix-nm-version-macro-includes.patch \
     file://0002-networkmanager-fixed-issues-of-NetworkManager-wait-o.patch \
+    file://0001-musl-build-fixes.patch \
 "
 SRC_URI[md5sum] = "ebb273456a81ccf9dfaf2461061b0e96"
 SRC_URI[sha256sum] = "3a470f8c60109b1acb5784ddc2423501706b5fe34c793a6faee87e591eb04a9e"
-- 
1.9.1


