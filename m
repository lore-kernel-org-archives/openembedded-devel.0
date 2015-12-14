Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id A9352700FD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:31 +0000 (UTC)
Received: by pff63 with SMTP id 63so12866986pff.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=wNb56XUeKwDD86mnFkcxG/six+kxY/w/ruFt1JvClZg=;
	b=PmuUSxn3yDR5i2IzzLIjguXvm8nVDbwB7QgFgf5KmMMfGPcr6U8M3PSngbDZuFKkzX
	NqIZ9Lrna1ShqF/NyAHA9T9cK8+3YRsEeonAzrO49DYWu0tV/mpZR2qJ77isOUf/aTLs
	eKV07qrtoeAK5q/3pwn30X3IDm/cvXMHfdD5AyR5lW7cmOPjnVZizSQ8rXgZStH9YV8F
	mFm13iki9d93UIJ49TJu+nwYaB/ia7UgEZQnA/k9FQDqS6FKkGgBQ1mJejnFeIfIjw7e
	VYGFAl4rh86A5EgdtVgrTzcHZB1XEgFideb1UB9q5gatOocgqiDoyxhTeaFLrkEcOAgo
	2D7Q==
X-Received: by 10.98.19.141 with SMTP id 13mr27496632pft.47.1450107272696;
	Mon, 14 Dec 2015 07:34:32 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	81sm43259862pfk.56.2015.12.14.07.34.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:26 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 1E6EDFCC841; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:34:02 -0800
Message-Id: <87ced45873312f0ccda708518d078e7e30eada5c.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 09/14] netmap-modules: make deterministic builds for drivers
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:31 -0000

From: Jackie Huang <jackie.huang@windriver.com>

The driver builds are optional, but for deterministic builds,
we should should be able to explicitly enable/disable the
builds for them in a proper place (maybe in BSP).
But we can't use PACKAGECONFIG since there is no option for
each driver, and the options are:
 --no-drivers    do not compile any driver
 --no-drivers=   do not compile the given drivers (comma sep.)
 --drivers=      only compile the given drivers (comma sep.)

So use NETMAP_DRIVERS to list the needed drivers and add proper
configs to EXTRA_OECONF, the default is no drivers, and all
supported drivers are listed in NETMAP_ALL_DRIVERS.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-kernel/netmap/netmap-modules_git.bb    | 26 +++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index 6365fee..23f3094 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -15,7 +15,31 @@ EXTRA_OECONF = "--kernel-dir=${STAGING_KERNEL_BUILDDIR} \
                 --driver-suffix="-netmap" \
                 "
 
-EXTRA_OECONF += "--no-drivers=ixgbe --no-drivers=virtio_net.c"
+# The driver builds are optional, but for deterministic builds,
+# we should be able to explicitly enable/disable the builds
+# for them in a proper place (maybe in BSP).
+# But we can't use PACKAGECONFIG since there is no option for
+# each driver, and the options are:
+#  --no-drivers    do not compile any driver
+#  --no-drivers=   do not compile the given drivers (comma sep.)
+#  --drivers=      only compile the given drivers (comma sep.)
+#
+# So use NETMAP_DRIVERS and the following python code to add proper
+# configs to EXTRA_OECONF.
+#
+# The default is no-drivers, and all supported drivers are listed
+# in NETMAP_ALL_DRIVERS.
+NETMAP_DRIVERS ??= ""
+NETMAP_ALL_DRIVERS = "ixgbe igb e1000e e1000 veth.c forcedeth.c virtio_net.c r8169.c"
+
+python __anonymous () {
+    drivers_list = d.getVar("NETMAP_DRIVERS", True).split()
+    all_drivers_list = d.getVar("NETMAP_ALL_DRIVERS", True).split()
+    config_drivers = "--drivers=" + ",".join(drivers_list)
+
+    extra_oeconf_drivers = bb.utils.contains_any('NETMAP_DRIVERS', all_drivers_list, config_drivers, '--no-drivers', d)
+    d.appendVar("EXTRA_OECONF", extra_oeconf_drivers)
+}
 
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,-O1', '')}"
 LDFLAGS := "${@'${LDFLAGS}'.replace('-Wl,--as-needed', '')}"
-- 
1.9.1


