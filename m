Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id A56666067C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 20:06:46 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id w22-v6so5027792plk.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 12:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=boplyzxNomz9o38OufNs1JQe11XxE5aqocLI+68sAo8=;
	b=bSlkjKJK3oDLrg/W3zqvADywIgd+XZwaq9fPU1aozMnneY48yYk8Tjk/pP9raE+pSA
	sPnXzZ1lZyVu+z4PX6MlAGlxLOOICPyWAwEINw0OIyteEGri/z/6xmSZ5wX9WkuAkgph
	HFYjoB3bziGnsPouCOZRMM5ajM0zdEE6aqBiiQL7GUbkocVi2QYrFaIGz4QpE4ook9N3
	X0lgLtwPvcsUsqJ4PcQAGj5Oq69XpsTlw5HyAxYNYEBAk/6JNA4K2XucOkcIx1FFoXcV
	fW739X3mtj15oiZ4xBqieRK+PpOcsSnhWLtuJgKvHe/BZEr0r3g2HQiL8GeufEBPSkUp
	/mqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=boplyzxNomz9o38OufNs1JQe11XxE5aqocLI+68sAo8=;
	b=AfYfaYwgdPNsPRSVwVeCt039JVEjCGheAm4oCR0/PgLRFJrjtbs0WcOkSJe7g/puD+
	rpzubBnqxtvSuo2b+Q8Rh81KiK/+9cF9hqixgFkmVT+J3b6m/FN2fcw+5tWVGnRRaucU
	5yodUyn8p7FO0Vc5D0b7KGoxc4RkgAmWc3Bh3arrKaNHjXBp6Htk0JJk3lWTg2pu+aLK
	CVO/OrG+x75RsJHDUAOHnhLILKpkHV+JKtfCN6OLRpLHoS8mWR02bN8XVVvp7AtRlKPT
	pVO7ddbqIE5PMLsqWqjbWXjNjFOrFy0Sot3F7KpKeqvCq6Jshnbs2WTF5T/KjgqGyiws
	R1ig==
X-Gm-Message-State: AGRZ1gJc68QRXE2vCaDNug2qqYr/i8ls7lRIsS9BFQBxISyzm8ASYBi3
	l87LWGIcZHVeryp4txXu+VcxnX5O1bU=
X-Google-Smtp-Source: AJdET5f7fHb3bzlIlBKZNQXSmJOFi8SeU0i4LhG08WtlU1e/ONlSBe1uHSYldPh3+uZkhY08hwkaoQ==
X-Received: by 2002:a17:902:1122:: with SMTP id
	d31-v6mr1649071pla.259.1541621206960; 
	Wed, 07 Nov 2018 12:06:46 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3d])
	by smtp.gmail.com with ESMTPSA id
	m7-v6sm1252698pgq.59.2018.11.07.12.06.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Nov 2018 12:06:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Nov 2018 12:06:37 -0800
Message-Id: <20181107200637.22770-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [meta-networking][PATCH] networkmanager: Fix build with musl
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
X-List-Received-Date: Wed, 07 Nov 2018 20:06:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove redundant header includes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-net-ethernet.h-and-linux-if_ether.h.patch | 53 +++++++++++++++++++
 .../networkmanager/networkmanager_1.14.4.bb   |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
new file mode 100644
index 0000000000..0c415bce7e
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch
@@ -0,0 +1,53 @@
+From 3f4b6319701834182304c4079119780f4ae5b49b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 7 Nov 2018 11:30:44 -0800
+Subject: [PATCH] Do not include net/ethernet.h and linux/if_ether.h
+
+They conflict when used together especially with musl
+removing them still keeps it working so it seems they are redundant
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ shared/n-acd/src/n-acd.c              | 1 -
+ src/platform/wpan/nm-wpan-utils.h     | 2 --
+ src/settings/nm-settings-connection.h | 2 --
+ 3 files changed, 5 deletions(-)
+
+diff --git a/shared/n-acd/src/n-acd.c b/shared/n-acd/src/n-acd.c
+index 9164f95..9538e50 100644
+--- a/shared/n-acd/src/n-acd.c
++++ b/shared/n-acd/src/n-acd.c
+@@ -23,7 +23,6 @@
+ #include <errno.h>
+ #include <limits.h>
+ #include <linux/filter.h>
+-#include <linux/if_ether.h>
+ #include <linux/if_packet.h>
+ #include <net/ethernet.h>
+ #include <netinet/if_ether.h>
+diff --git a/src/platform/wpan/nm-wpan-utils.h b/src/platform/wpan/nm-wpan-utils.h
+index f7d0c03..e1c81f5 100644
+--- a/src/platform/wpan/nm-wpan-utils.h
++++ b/src/platform/wpan/nm-wpan-utils.h
+@@ -20,8 +20,6 @@
+ #ifndef __WPAN_UTILS_H__
+ #define __WPAN_UTILS_H__
+ 
+-#include <net/ethernet.h>
+-
+ #include "nm-dbus-interface.h"
+ #include "platform/nm-netlink.h"
+ 
+diff --git a/src/settings/nm-settings-connection.h b/src/settings/nm-settings-connection.h
+index e796b71..c01fef6 100644
+--- a/src/settings/nm-settings-connection.h
++++ b/src/settings/nm-settings-connection.h
+@@ -22,8 +22,6 @@
+ #ifndef __NETWORKMANAGER_SETTINGS_CONNECTION_H__
+ #define __NETWORKMANAGER_SETTINGS_CONNECTION_H__
+ 
+-#include <net/ethernet.h>
+-
+ #include "nm-dbus-object.h"
+ #include "nm-connection.h"
+ 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
index 3ce2a2f89d..348ce9e7a2 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.14.4.bb
@@ -28,6 +28,7 @@ SRC_URI = " \
     file://0001-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
     file://0002-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0003-Do-not-create-settings-settings-property-documentati.patch \
+    file://0001-Do-not-include-net-ethernet.h-and-linux-if_ether.h.patch \
     file://musl/0001-musl-basic.patch \
     file://musl/0002-musl-dlopen-configure-ac.patch \
     file://musl/0003-musl-network-support.patch \
-- 
2.19.1


